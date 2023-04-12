Download Certificate
https://www.hslu.ch/de-ch/servicedesk/anleitungen/netzwerk/#vpn

Install it:
https://askubuntu.com/questions/73287/how-do-i-install-a-root-certificate

sudo mkdir /usr/local/share/ca-certificates/extra
sudo cp ~/Downloads/DigiCertGlobalRootCA.crt /usr/local/share/ca-certificates/extra
sudo dpkg-reconfigure ca-certificates

cd /opt/pulsesecure/bin/

sudo ./setup_cef.sh install

# run it
./pulseUI
