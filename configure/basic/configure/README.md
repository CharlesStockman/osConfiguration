## Githhub Acces Key
The purpose of this document is to describe the procedure for creating a Github Access Key which will be used for certain operations such as push changees to Github or clone a private repostiry.
Github has impleneted a policy that Github Access Kyes are used intead of passwords.

This will be need for data/description and the key is personalAccessToken

### Insturctions
- Select the profile Settings --> Settings --> Develper
- Select Personal Access Tokens --> Tokens Classic
- On the Personal access tokens (classic)
  * Remove any keys that are present by clickng on the delete button for each key present
  * Click on Generate Generate New Token --> Generate New Token Classic
    + Provide a Note
    + Select an Expiration ( Never is the best choice )
    + Select all scopes
    + Click Generate Token and on the next page copy the key ( which starts with ghp_ )

#### Load Configuration
<b>Do not commit the data/description.json since it PII Information.</b>

|Command                                                                                  | Explanation                                                                                                |
|-----------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Edit data/description.json                                                                   | Fill in the needed information to describe the user                                                   |
| cd Developer/osConfiguration/<br>cd configure/basic/configure                           | Change Directory                                                                                           |
| ./jsonToEnv.sh data/description.json                                                    | Convert description.json into a collection of environmental varibles with the prefix config_               |
