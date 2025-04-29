# 🧪 Multipass Lab

Automated Ubuntu VM provisioning using [Multipass](https://multipass.run/) with cloud-init and bash scripting. This lab simulates a mini infrastructure with:

- 🌐 A Web Server (`NGINX`)
- 📥 A Log Server (`RSYSLOG`)
- 🧑‍💻 An Admin Node (`curl`, `htop`, `net-tools`)

## 🚀 Features

- Easy VM provisioning via `manage.sh`
- Cloud-init configuration for each role
- Destroy/reset/backups/instance logs/status all VMs with a single command

<pre>
## 📁 Project Structure
multipass-lab/
├── manage.sh # Main script to manage VMs
└── cloud-init/
 ├── web-server.yaml # Installs and starts nginx
 ├── log-server.yaml # Installs and starts rsyslog
 └── admin-node.yaml # Installs admin tools
</code> </pre>
 
 ## 🧰 Requirements

- [Multipass](https://multipass.run/)
- Ubuntu or any Linux distro
- Git

## ⚡ Usage

```bash
# Clone the repo
git clone git@github.com:username/multipass-lab.git
# "(in my case username is: blckphx)"
cd multipass-lab

# Start lab environment
./manage.sh start

# Destroy everything
./manage.sh destroy

# Lists all running & stopped Multipass instances
./manage.sh status

# Creates snapshots (backups) running instances
./manage.sh backup
# EX:
multipass snapshot <instance-name> <snapshot-name>

# Collects the cloud-init logs (/var/log/cloud-init.log) from each VM for troubleshooting 
./manage.sh logs
