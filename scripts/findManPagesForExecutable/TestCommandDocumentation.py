#!/usr/bin/env python3
import os
import unittest


class TestCommandDocumenation(unittest.TestCase):
    def test_CommandDocumenation_exist(self) -> None:
        """
        The test will be a compile time error
        Advantage is the rest of the test can assume that CommandDocumentation exist
        """
        commandDocumentation = CommandDocumentation()

    # def test_getDirectoriesForPathEnv(self):
    #    expected = os.getenv("PATH")
    #    ComamndDocumentation = CommandDocumentation()
    #    actual

    #    self.assertEequal(


unittest.main()
