# When mongodb became non open source software it was 
# removed and the mongo db company has been maintaing 
# a brew recipie for the database

brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb-community
