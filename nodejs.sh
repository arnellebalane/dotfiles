#!/bin/bash

# -----------------------------------------------
# Install NodeJS via mise
# -----------------------------------------------

mise install node@lts
mise use node@lts



# -----------------------------------------------
# Install npm packages
# -----------------------------------------------

npm install -g git-open         # Opens a repository's Github page
npm install -g trash-cli        # Safe alternative to `rm`
npm install -g fkill-cli        # Kill processes
npm install -g gtop             # System monitoring

npm install -g npm-check
npm install -g serve
npm install -g lice
