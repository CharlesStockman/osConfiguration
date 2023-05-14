#
# The code is throw away code that reminds me to run docker the 
# user must be in the docker group
#


import os
import sys
import grp
import getopt

def isCurrentUserInGroup(userName, groupName):
	'''                                                  '''
	''' Given a useriname and the name of group          '''
	'''                                                  '''
	''' result : 1 -- The user is not in the group       '''
	''' result : 0 -- The user is in the group           '''
	grpId = grp.getgrnam(groupName).gr_gid               
	result = 0 if grpId in os.getgroups() else 1         
	return result 



def getCommandLineOptions():
	''' Parse the Command Line Options '''
	result = None 
	opt = None
	args = None
	try:
		argv = sys.argv[1:]
		opt, args = getopt.getopt(argv, "g:e:", [ "groupName =", "errorString =" ] )
		if ( len(opt) != 1 ):
			raise ValueError("except clause will handle the message");
	except getopt.GetoptError:
		print("Error command should be userDockInGroup -g <group name>")
		result = 2
	except ValueError:
		print("The command can have only two options and currently has", len(opt), "options" );
		result = 2 
	return opt ,args, result

# When using docker and gettingt the following user          
#                                                             
#	Got permission denied while trying to connect to            
#	the Docker daemon socket at unix:///var/run/docker.sock:    
#	Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/images/json" 
#	dial unix /var/run/docker.sock: connect: permission denied  
#                                                             
# The fix is to add the user to the group docker  
#
#
# Input : group name
# Output: 0 successful 
# Output: 1 Name not in group
# Output  2 Input Issue              
opt, arg, result = getCommandLineOptions()
if ( result == None ): 
	result = isCurrentUserInGroup( os.getlogin(), "docker")

sys.exit(result)
