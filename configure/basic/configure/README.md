#### Load Configuration
<b>Do not commit the data/description.json since it PII Information.</b>

|Command                                                                                  | Explanation                                                                                                |
|-----------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Edit description.json                                                                   | Fill in the needed information to describe the user                                                        |
| cd Developer/osConfiguration/<br>cd configure/basic/configure                           | Change Directory                                                                                           |
| ./jsonToEnv.sh data/description.json                                                    | Convert description.json into a collection of environmental varibles with the prefix config_               |
