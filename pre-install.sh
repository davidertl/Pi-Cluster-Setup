#/bin/sh
#Pre-Install update
apt-get update -y
apt-get full-upgrade -y


raspi-config nonint do_boot_wait 1            # Turn on waiting for network before booting
raspi-config nonint do_boot_splash 1          # Disable the splash screen
raspi-config nonint do_overscan 1             # Disable overscan
raspi-config nonint do_camera 1               # Disable the camera
#raspi-config nonint do_ssh 0                  # Enable(0) Disable (1) remote ssh login
raspi-config nonint do_spi 1                  # Disable spi bus
raspi-config nonint do_memory_split 16        # Set the GPU memory limit to 16MB
raspi-config nonint do_i2c 1                  # Disable the i2c bus
raspi-config nonint do_serial 1               # Disable the RS232 serial bus
raspi-config nonint do_boot_behaviour B1      # Boot to CLI & require login
#                 B2      # Boot to CLI & auto login as pi user
#                 B3      # Boot to Graphical & require login
#                 B4      # Boot to Graphical & auto login as pi user
raspi-config nonint do_onewire 1              # Disable onewire on GPIO4
raspi-config nonint do_audio 0                # Auto select audio output device
#        1                # Force audio output through 3.5mm analogue jack
#        2                # Force audio output through HDMI digital interface
#raspi-config nonint do_gldriver G1           # Enable Full KMS Opengl Driver - must install deb package first
#            G2           # Enable Fake KMS Opengl Driver - must install deb package first
#            G3           # Disable opengl driver (default)
#raspi-config nonint do_rgpio 1               # Disable gpio server - must install deb package first

# System Configuration
raspi-config nonint do_configure_keyboard de                     # Specify US Keyboard
raspi-config nonint do_hostname pix                              # Set hostname to 'rpi-test'
raspi-config nonint do_wifi_country DE                           # Set wifi country as Germany
#do_wifi_ssid_passphrase wifi_name password   # Set wlan0 network to join 'wifi_name' network using 'password'
raspi-config nonint do_change_timezone Europe/Berlin                    # Change timezone to Europe/Berlin
 # To change look up possible Timezones https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
raspi-config nonint do_change_locale de_DE.UTF-8                 # Set language to German UTF8