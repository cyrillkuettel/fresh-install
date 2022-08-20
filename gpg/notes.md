# Common gpg commands

gpg --output public.pgp --armor --export username@email

# Setting up a repo
cd /path/to/repo  
git config commit.gpgsign true   
### You would combine that with user.signingKey used as a global setting (unique key used for all repo where you want to sign commit)   
git config --global user.signingkey F2C7AB29!
                                           ^^^

