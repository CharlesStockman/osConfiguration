import os.path
import unittest
from dataclasses import dataclass
from pathlib import PurePath, Path

import executableManPageList


@dataclass
class ManPageInfo:
    absolute_path: str
    summary: str


class executableManPageListTest(unittest.TestCase):

    def test_getDirectoriesFromPath(self):
        os.environ["PATH"] = "/opt/homebrew/bin" + os.pathsep + os.environ["PATH"]

        directory_list = executableManPageList.directories_from_path_variable()

        self.assertTrue(len(directory_list) != 0)

        expected_dictionary_list = [item for item in os.getenv("PATH").split(os.pathsep) if os.path.isdir(item)]
        expected_dictionary_list.reverse()
        self.assertListEqual(directory_list, expected_dictionary_list)

        for directory in directory_list:
            self.assertTrue(os.path.isdir(directory))

        expected_path_directories = [item for item in os.getenv("PATH").split(os.pathsep) if os.path.isdir(item)]
        expected_path_directories.reverse()
        self.assertListEqual(expected_path_directories, directory_list)

        print(os.environ["PATH"])

    def test_getFileListFromDirectories(self):
        os.environ["PATH"] = "/opt/homebrew/bin" + os.pathsep + os.environ["PATH"]

        directory_list = executableManPageList.directories_from_path_variable()
        directory_names_to_path = executableManPageList.files_from_list(directory_list)

        self.assertTrue(len(directory_names_to_path) != 0)



        # Checking to make sure the correct zsh was called
        # zsh appears in two places : /opt/homebrew/bin/zsh and /bin/zsh
        # Verifying that algorithm uses the  executable stored (zsh) in /opt/homebrew/bin rather than /bin/zsh
        #     Checking to make sure that directory_name ( key = command only , value = path )
        self.assertEqual(PurePath("/opt/homebrew/bin/zsh"), directory_names_to_path["zsh"])

    def test_remove_non_access_files(self):
        os.environ["PATH"] = "/opt/homebrew/bin" + os.pathsep + os.environ["PATH"]

        directory_list = executableManPageList.directories_from_path_variable()
        directory_names_to_path = executableManPageList.files_from_list(directory_list)
        directory_names_to_path = executableManPageList.remove_non_access_files(directory_names_to_path)

        for key, value in directory_names_to_path.items():
            self.assertTrue(os.access(value,os.R_OK))

    def test_create_man_page_records_signature(self):
        key = "ls"

        pure_path = PurePath("/bin", "ls")

        directory_names_to_path = {key: pure_path}

        man_pages_records = executableManPageList.get_man_pages(directory_names_to_path)
        self.assertTrue(man_pages_records is not None)
        self.assertEqual(man_pages_records[key].summary, "list directory contents")
        self.assertEqual(man_pages_records[key].absolute_path, "/bin/ls")

        print(man_pages_records)

    def test_man_page_not_found_record(self):
         key = "lsss"

         directory_names_to_path = {key: PurePath("bin", "ls")}
         man_pages_records = executableManPageList.get_man_pages(directory_names_to_path)
         self.assertTrue(man_pages_records is not None)
         self.assertEqual(man_pages_records[key].summary, "not found")
         self.assertTrue(man_pages_records[key].absolute_path, PurePath("/bin", "lss"))


    def test_create_pdf_commands_summary(self):
        directory_list = executableManPageList.directories_from_path_variable()
        directory_names_to_path = executableManPageList.files_from_list(directory_list)
        directory_names_to_path = executableManPageList.remove_non_access_files(directory_names_to_path)
        man_pages_records = executableManPageList.get_man_pages(directory_names_to_path)
        executableManPageList.convert_to_pdf(man_pages_records)

        self.assertTrue(Path("./", "output.pdf").exists())

















