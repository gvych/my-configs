# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
   config.vm.box = "ubuntu/bionic64"
   config.vm.synced_folder "git/", "/home/vagrant/git"
#   config.disksize.size = '100GB'
   config.vm.network "forwarded_port", guest: 8000, host: 8000
   #config.vm.network "forwarded_port", guest: 22, host: 2222


   config.vm.provider "virtualbox" do |vb|
     vb.memory = "8096"
     vb.cpus = "6"

#    if ARGV[0] == "up" && ! File.exist?(HOME_DISK)
#      vb.customize ['createhd',
#                    '--filename', HOME_DISK,
#                    '--format', 'VDI',
#                    '--size', 50000]
#
#      vb.customize ['storageattach', :id,
#                    '--storagectl', 'SATA Controller',
#                    '--port', 0,
#                    '--device', 0,
#                    '--type', 'hdd',
#                    '--medium', HOME_DISK]
     
   end

   config.vm.provision "shell", inline: <<-SHELL
     curl -fsSL https://github.com/derailed/k9s/releases/download/0.8.2/k9s_0.8.2_Linux_x86_64.tar.gz | tar -xvz  -f - -C /usr/local/bin/ k9s
     #curl -fsSL https://get.helm.sh/helm-v2.16.9-linux-amd64.tar.gz | \
       #sudo tar -xz --strip=1 -f - -C /usr/local/bin/ linux-amd64/helm
     curl -sL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
     chmod a+x /usr/local/bin/docker-compose
     wget --no-verbose -O - https://get.docker.com/ | sh
     cd /usr/bin; curl -sL https://raw.githubusercontent.com/flant/multiwerf/master/get.sh | bash
     type multiwerf && . $(multiwerf use 1.1 stable --as-file) >/dev/null 2>&1
     curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
     sudo snap install microk8s --classic
     sudo snap install kubectl  --classic
     sudo snap install aws-cli  --classic
     sudo snap install helm  --classic
     #sudo snap install terraform
     
     apt-get update -qq; apt-get install -y git-crypt ecryptfs-utils cryptsetup unzip sshuttle tree

     useradd -p '$1$pczUXhgU$kz3aVM7pJZGwfT2X9/POu/' --encrypt-home user
     sudo usermod -aG docker user
     sudo usermod -aG docker vagrant

     microk8s.enable storage dns metallb
     microk8s.start
     mkdir -p /home/vagrant/.kube/
     microk8s.config  > /home/vagrant/.kube/config
     sudo usermod -a -G microk8s vagrant
     sudo chown -f -R vagrant ~/.kube

     curl -sL  https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip 
     unzip -d terraform*zip; mv terraform /usr/bin/; 
curl -s https://raw.githubusercontent.com/gvych/my-configs/master/.bash_aliases  > /home/vagrant/.bash_aliases
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /usr/local/bin/

curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
wget --no-verbose https://github.com/kayrus/kuttle/raw/master/kuttle -O /usr/local/bin/kuttle
chmod +x /usr/local/bin/kuttle
echo $(aws ecr get-login --no-include-email)
echo ln -s /home/vagrant/.docker/config.json \
  /var/snap/microk8s/common/var/lib/kubelet/

sed -i "'as'dfsfd" /etc/ssh/sshd_config
echo COPY BASH ALIASES SOMEHOW???

echo download docker-compose.yml with localstack or install it as a service?



     echo ENCRYPT YOUR HOME DIRECTORY with "sudo ecryptfs-migrate-home -u vagrant"
   SHELL
end
