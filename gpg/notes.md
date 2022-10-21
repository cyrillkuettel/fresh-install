# Common gpg commands

gpg --output public.pgp --armor --export username@email


# GPG and Git

cd /path/to/repo  
git config commit.gpgsign true   

### You would combine that with user.signingKey used as a global setting (unique key used for all repo where you want to sign commits)

```bash
gpg --list-secret-keys --keyid-format=long

/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot <hubot@example.com>
ssb   4096R/4BB6D45482678BE3 2016-03-10


```
To set your primary GPG signing key in Git, paste the text below, substituting in the GPG primary key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`
```bash
git config --global user.signingkey 3AA5C34371567BD2
                                        
```
