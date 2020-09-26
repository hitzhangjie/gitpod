FROM gitpod/workspace-full

USER gitpod

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

# git config
RUN git config --global alias.co clone && \
    git config --global alias.ck checkout && \
    git config --global alias.cc commit && \
    git config --global alias.cp cherry-pick && \
    git config --global alias.ss status && \
    git config --global alias.bb branch && \
    git config --global alias.ff "fetch --prune" && \
    git config --global alias.rr "remote -r" && \
    git config --global alias.unstage "reset HEAD --" && \
    git config --global alias.last "log -1 HEAD" && \
    git config --global alias.visual !gitk && \
    git config --global alias.logx "log --abbrev-commit --graph --pretty=format:'%Cgreen%h %C(bold blue)%cr %Creset>>> %C(bold yellow)%<(78,trunc)%s %Creset<<< %Cred<%an>%Creset'" && \
    git config --global alias.logxx "log --abbrev-commit --graph --pretty=format:'%Cgreen%h %C(bold blue)%ci %Creset>>> %C(bold yellow)%<(78,trunc)%s %Creset<<< %Cred<%an>%Creset'"

# install protoc + protoc-gen-go
RUN sudo apt-get update && \
    sudo apt install -y protobuf-compiler && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sudo mkdir -p $GOPATH && sudo chmod 777 $GOPATH && \
    go get github.com/golang/protobuf/protoc-gen-go && \
    rm -rf $GOPATH/go/src && \
    rm -rf $GOPATH/go/pkg 
