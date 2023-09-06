#/bin/sh
#Pre-Install update
apt-get update -y
apt-get upgrade -y
rpi-upgrade

# Don't change the following lines unless you know what you are doing
# They execute the config options starting with 'do_' below
grep -E -v -e '^\s*#' -e '^\s*$' <<END | \
sed -e 's/$//' -e 's/^\s*/\/usr\/bin\/raspi-config nonint /' | bash -x -
#
############# INSTRUCTIONS ###########
#
# Change following options starting with 'do_' to suit your configuration
#
#
############# EDIT raspi-config SETTINGS BELOW ###########

# Hardware Configuration
do_boot_wait 1            # Turn on waiting for network before booting
do_boot_splash 1          # Disable the splash screen
do_overscan 1             # Disable overscan
do_camera 1               # Disable the camera
do_ssh 1                  # Enable remote ssh login
do_spi 1                  # Disable spi bus
do_memory_split 16        # Set the GPU memory limit to 16MB
do_i2c 1                  # Disable the i2c bus
do_serial 1               # Disable the RS232 serial bus
do_boot_behaviour B1      # Boot to CLI & require login
#                 B2      # Boot to CLI & auto login as pi user
#                 B3      # Boot to Graphical & require login
#                 B4      # Boot to Graphical & auto login as pi user
do_onewire 1              # Disable onewire on GPIO4
do_audio 0                # Auto select audio output device
#        1                # Force audio output through 3.5mm analogue jack
#        2                # Force audio output through HDMI digital interface
#do_gldriver G1           # Enable Full KMS Opengl Driver - must install deb package first
#            G2           # Enable Fake KMS Opengl Driver - must install deb package first
#            G3           # Disable opengl driver (default)
#do_rgpio 1               # Disable gpio server - must install deb package first

# System Configuration
do_configure_keyboard de                     # Specify US Keyboard
do_hostname pix                              # Set hostname to 'rpi-test'
do_wifi_country DE                           # Set wifi country as Australia
#do_wifi_ssid_passphrase wifi_name password   # Set wlan0 network to join 'wifi_name' network using 'password'
do_change_timezone Europe                    # Change timezone to Europe
do_change_locale de_DE.UTF-8                 # Set language to German German

#Don't add any raspi-config configuration options after 'END' line below & don't remove 'END' line
END