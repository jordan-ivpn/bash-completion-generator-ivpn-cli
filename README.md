# bash-completion-generator-ivpn-cli
Generates a bash completion file based on the "ivpn" CLI commands


# Update 2024-02-08: Improved script now included in IVPN App version 3.14.2
https://github.com/ivpn/desktop-app/blob/master/CHANGELOG.md#version-3142---2024-02-08  
https://github.com/ivpn/desktop-app/blob/8f9c9bc9079bf2909040535043a71711b799e383/cli/References/Linux/bash-completion-generator-ivpn-cli.sh


Quick install:
```
bash-completion-generator-ivpn-cli.sh | sudo tee /usr/share/bash-completion/completions/ivpn
```

Elaborate install:
```
bash-completion-generator-ivpn-cli.sh > ivpn.bash
source ivpn.bash
sudo mv ivpn.bash /usr/share/bash-completion/completions/ivpn
sudo chown root:root /usr/share/bash-completion/completions/ivpn
```
