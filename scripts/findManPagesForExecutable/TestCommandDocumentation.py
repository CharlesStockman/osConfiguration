#!/usr/bin/env python3
import os
import unittest
import CommandDocumentation


class TestCommandDocumentation(unittest.TestCase):
    def test_CommandDocumentation_exist(self) -> None:
        """
        The test will be a compile time error.  If the class exist then the test passes
        Advantage is the rest of the tests can assume that CommandDocumentation exist
        """
        command_documentation = CommandDocumentation.CommandDocumentation()

    def test_get_paths_from_path_environment(self) -> None:
        """
        Test the get_paths_from_path_environment method of CommandDocumentation happy path
        """
        expected = os.getenv("PATH")
        command_documentation = CommandDocumentation.CommandDocumentation()
        actual = os.pathsep.join(command_documentation.get_paths_from_path_environment())

        self.assertEqual(expected, actual)

if __name__ == "__main__":
    unittest.main()
