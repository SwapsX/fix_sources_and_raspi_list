# fix_sources_and_raspi_list
This is a simple  script to update both /etc/apt/sources.list.d/raspi.list and /etc/apt/sources.list for Debian Bookworm on your Raspberry Pi
This is to test the update and upgrade 

I have created a update.sh to test it 
sudo sh -c "apt update -y; apt full-upgrade -y --auto-remove; apt autoremove -y; apt autoclean -y; sync; echo Done."
