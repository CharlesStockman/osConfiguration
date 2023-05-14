#
# Create a python virtual environment
#

#
# Create a directory called venv and copies the file for the basic python environment
#
python3 -m venv venv-ansible

#
# Creates environmental variables needed for the python virtual environment
#
source venv-ansible/bin/activate

#
# Install Ansible
#
cd venv-ansible
python3 -m pip install --upgrade pip
pip3 install ansible

#
# Add a reusable library of ansible playbooks 
#
git clone https://github.com/ansible-collections/community.general.git
export COLLECTION_PATHS=`pwd`'/plugins/modules'
