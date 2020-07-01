FROM timiil/lxde

RUN apt-get update -y && \
    apt-get upgrade -y && \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
    apt-get install apt-transport-https -y && apt-get remove -y lightdm && apt-get update -y && apt-get install -y git code
    
RUN code --install-extension eamodio.gitlens --user-data-dir /home
