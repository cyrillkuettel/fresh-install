# Common gpg commands

gpg --output public.pgp --armor --export username@email

# Setting up a repo
cd /path/to/repo  
git config commit.gpgsign true   
### You would combine that with user.signingKey used as a global setting (unique key used for all repo where you want to sign commit)   
```bash
$ gpg --list-secret-keys --keyid-format=long
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot 
ssb   4096R/42B317FD4BA89E7A 2016-03-10

git config --global user.signingkey F2C7AB29!
                                           ^^^

