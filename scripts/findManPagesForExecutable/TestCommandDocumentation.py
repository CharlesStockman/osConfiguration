#!/usr/bin/env python3

import os
import unittest
import CommandDocumentation
from DocumentationForExecutable import DocumentationForExecutable

class TestCommandDocumentation(unittest.TestCase):
    def test_command_documentation_object_exist(self) -> None:
        """
        If the class "CommandDocumentation" exists, then the test passes
        Advantage is the rest of the tests can assume that CommandDocumentation exists
        """
        command_documentation = CommandDocumentation.CommandDocumentation()

    def test_get_paths_from_path_environment(self) -> None:
        """
        Test the get_paths_from_path_environment method of CommandDocumentation happy path
        Test if the directories from the PATH environment variable have been retrieved
        """
        expected = os.getenv("PATH")
        command_documentation = CommandDocumentation.CommandDocumentation()
        actual = os.pathsep.join(command_documentation.get_paths_from_path_environment())

        self.assertEqual(expected, actual)

    def test_documentation_for_executable_class_exist(self):
        """
        If the class DcouemntationForFile exist then the test passes
        Advantage is the rest of the test can assume that DocumentationForExecutable
        """
        documentation_for_executable = DocumentationForExecutable("ls", "List directory contents")




if __name__ == "__main__":
    unittest.main()
