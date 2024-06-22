import os
import subprocess

from pathlib import PurePath
from dataclasses import dataclass, asdict

import pandas as pd
from borb.pdf import Document
from borb.pdf import Page
from borb.pdf import TableUtil


import json


@dataclass
class ManPageInfo:
    absolute_path: str
    summary: str


def directories_from_path_variable():
    path_directories = [item for item in os.getenv("PATH").split(os.pathsep) if os.path.isdir(item)]
    path_directories.reverse()
    return path_directories


def files_from_list(directories):

    directory_names_to_path = {}

    for directory in directories:
        for (parent_directory, child_directories, files) in os.walk(directory, followlinks=True):
            for file in files:
                directory_names_to_path[file] = PurePath(parent_directory, file)

    return directory_names_to_path

def remove_non_access_files(directory_name_to_path):

    keys = [key for key, value in directory_name_to_path.items() if not os.access(value, os.R_OK)]
    for key in keys:
        del directory_name_to_path[key]

    return directory_name_to_path


def get_man_pages(files):
    """
    :param files:
    :return:
    :notes
        1. check_out -- executes the command and get the output and a returned codee
        2. If the return code is no 0 then call subprocess.CalledProcessError
        3. parameter universal_newlines means the output is returned as a string instead of bytes
    """

    man_pages = {}

    for key, value in files.items():
        try:
            man_output = subprocess.check_output(['man', key], universal_newlines=True)
            summary = "list directory contents"
        except subprocess.CalledProcessError:
            summary = "not found"

        man_pages[key] = ManPageInfo(absolute_path=value.as_posix(), summary=summary)

    return man_pages

def convert_to_pdf(self, man_pages):
    doc: Document = Document()
    page: Page = Page()

    df = pd.json_normalize(asdict(man_page) for man_page in man_pages)

    TableUtil.from_2d_array(df)




