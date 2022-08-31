# Common gpg commands

gpg --output public.pgp --armor --export username@email


# GPG and Git

cd /path/to/repo  
git config commit.gpgsign true   

### You would combine that with user.signingKey used as a global setting (unique key used for all repo where you want to sign commits)

```bash
$ gpg --list-keys
/home/cyrill/.gnupg/pubring.kbx
-------------------------------
pub   rsa3072 2022-08-02 [SC] [expires: 2024-08-01]
      BDBBA2FDA885E4F939FA25781128968FA1E0CAFD
uid           [ultimate] Cyrill <EMAIL>
sub   rsa3072 2022-08-02 [E] [expires: 2024-08-01]


git config --global user.signingkey BDBBA2FDA885E4F939FA25781128968FA1E0CAFD
                                        
```
