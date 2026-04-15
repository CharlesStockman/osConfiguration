import os

class CommandDocumentation():
    '''
        The class's purpose is to provide methods that will allow the user to find the documentation for the class.

        Functions:
            Associate the man page with an executable
            provide summary information for each executable.
    '''

    def get_paths_from_path_environment(self):
      return iter(os.getenv("PATH").split(":"))
