######################################################################################################
#                                                                                                    #
#  /$$$$$$$$ /$$ /$$                  /$$$$$$                        /$$                             #
# | $$_____/|__/| $$                 /$$__  $$                      | $$                             #
# | $$       /$$| $$  /$$$$$$       | $$  \__/ /$$   /$$  /$$$$$$$ /$$$$$$    /$$$$$$  /$$$$$$/$$$$  #
# | $$$$$   | $$| $$ /$$__  $$      |  $$$$$$ | $$  | $$ /$$_____/|_  $$_/   /$$__  $$| $$_  $$_  $$ #
# | $$__/   | $$| $$| $$$$$$$$       \____  $$| $$  | $$|  $$$$$$   | $$    | $$$$$$$$| $$ \ $$ \ $$ #
# | $$      | $$| $$| $$_____/       /$$  \ $$| $$  | $$ \____  $$  | $$ /$$| $$_____/| $$ | $$ | $$ #
# | $$      | $$| $$|  $$$$$$$      |  $$$$$$/|  $$$$$$$ /$$$$$$$/  |  $$$$/|  $$$$$$$| $$ | $$ | $$ #
# |__/      |__/|__/ \_______/       \______/  \____  $$|_______/    \___/   \_______/|__/ |__/ |__/ #
#                                              /$$  | $$                                             #
#                                             |  $$$$$$/                                             #
#                                              \______/                                              #
#                                                                 https://patorjk.com/software/taag/ #
######################################################################################################

"""

  file description:

    This file contains wrapper functions for common file system operations that would normally take
    using a shell script.

  author:

    Sam Stanley (SamStan4)

  date created:

    11-1-25

  last edited:

    11-1-25

"""

import os
from contextlib import contextmanager

@contextmanager
def push_dir(new_dir: str):
  old_dir = get_cur_working_dir()
  try:
    change_dir(new_dir)
    yield
  finally:
    change_dir(old_dir)

def get_cur_working_dir():
  return os.getcwd()

def change_dir(new_dir: str):
  os.chdir(new_dir)