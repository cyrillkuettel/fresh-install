# Logbook

I have to lay out what the problem is, after days of trying to solve this.

I upgraded my system from Ubuntu 20.04 ubuntu 22.04. As of Aprill 2022 this results in the kernel upgrade from 5.4 to 5.18. 

When I started virtualbox, I got  "Kernel drive not installed (rc)-1908)"
I ran these commands. (Base on these [Instructions](https://superuser.com/questions/1285964/how-to-fix-and-prevent-virtualbox-kernel-driver-not-installed))

sudo apt install --reinstall virtualbox-dkms && sudo apt install libelf-dev
sudo /sbin/vboxconfig

But the issue persisted.

Using earlier backup of the VM results in the same issue.
Using the test builds with Kernel v5.18.12-051812 resulted in another error. 
Then I downgraded the kernel to v5.11.0-051100.



Possible solutions: (too tired right now)
- check if kernel 5.4 solves the issue, if yes, use the 5.10 kernel or 5.11 (so that browser issue is still not a problem)

"I can confirm that Linux kernel 5.17.12 got the backport of the extensive random number handling changes (~100 commits, including 6e8ec2552c7d13991148e551e3325a624d73fac6), so I'd expect that VirtualBox 6.1.34 won't reliably run VMs on a host with Linux kernels 5.17.12+."

- use virtualbox testbuild with the kernel 5.18 as noted by fth0 in https://forums.virtualbox.org/viewtopic.php?f=7&t=106071&start=15