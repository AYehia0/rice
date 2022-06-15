import os
import asyncio
from ranger.api.commands import *
from telethon import TelegramClient
from config import configs
import warnings
from ranger.core.loader import CommandLoader

api_id = configs['api_id']
api_hash = configs['api_hash']

# return the username
async def get_homie_username(client, name='ahmed'):
    homies = await client.get_dialogs()
    for homie in homies:
        try:
            if name.lower() in f"{homie.entity.first_name} {homie.entity.last_name}".lower():
                return homie.entity.username
        except AttributeError:
            pass

async def send_to_homie(client, name, file_path):
    homie_name = await get_homie_username(client, name)

    await client.send_file(homie_name, file_path)


class send_to(Command):

    def execute(self):
        if not self.arg(1):
            return self.fm.notify("Username is required")
        # send the current file to telegram
        # if it's a folder, zip and send

        try:
            client = TelegramClient("/home/none/homies", api_id, api_hash, request_retries=1, connection_retries=1)
            client.start()
        except OSError:
            return

        current_path = self.fm.thistab.get_selection()[0]

        asyncio.get_event_loop().run_until_complete(send_to_homie(client, self.arg(1), str(current_path)))

        client.disconnect()

class extract_here(Command):
    def execute(self):
        """ extract selected files to current directory."""
        cwd = self.fm.thisdir
        marked_files = tuple(cwd.get_selection())

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = marked_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-x', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(marked_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(
                one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags
                            + [f.path for f in marked_files], descr=descr,
                            read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

class compress(Command):
    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self, tabnum):
        """ Complete with current folder name """

        extension = ['.zip', '.tar.gz', '.rar', '.7z']
        return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]
