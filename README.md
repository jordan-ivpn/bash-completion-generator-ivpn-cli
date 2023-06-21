# bash-completion-generator-ivpn-cli
Generates a bash completion file based on the "ivpn" CLI commands

Quick install:
```
bash-completion-generator-ivpn-cli.sh | sudo tee /usr/share/bash-completion/completions/ivpn
```

Elabolate install:
```
bash-completion-generator-ivpn-cli.sh > ivpn.bash
source  ivpn.bash
sudo mv ivpn.bash /usr/share/bash-completion/completions/ivpn
sudo chown root:root /usr/share/bash-completion/completions/ivpn
```
