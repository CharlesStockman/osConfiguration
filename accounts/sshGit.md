## Purpose 

Create a token for authentication of a username for GitHub.

## Steps

<ol>
<li>Log in to your GitHub account.</li>
<li>Click on your profile photo in the top-right corner and select "Settings" from the dropdown menu.</li>
<li>In the left sidebar of the Settings page, click on "Developer settings."</li>
<li>Under Developer settings, click on "Personal access tokens."</li>
<li>Click on "Tokens (classic)" and then "Generate new token (classic)".</li>
<li>Provide a descriptive name for the token in the "Note" field.</li>
<li>Optionally, set an expiration date for the token to enhance security.</li>
<li>Select the appropriate scopes (permissions) for the token. 
<p>&emsp;&emsp;For most Git operations like cloning, pushing, and pulling repositories, select the "repo" scope.
Without scopes, the token can only access public information.</p>
</li>
<li>Click "Generate token".</li>
<li>Copy the token immediately and store it in a secure location, such as a password manager or encrypted file.
<p><b>&emsp;&emsp;Crucially, GitHub will display the token only once.</b></p>
<p>&emsp;&emsp;If you lose it, you cannot retrieve it again and will need to generate a new one.</p>
</li>
</ol>