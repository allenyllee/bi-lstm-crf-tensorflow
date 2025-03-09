# if there are no ~/.bash_profile, create it!
if [ ! -f ~/.bash_profile ]; then
echo ".bash_profile doesn't exist"
cat <<"EOF" >>~/.bash_profile
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# User specific aliases and functions
EOF
else
echo ".bash_profile exist!"
fi

# setup cuda env path
echo -e "LD_LIBRARY_PATH=/usr/local/cuda/lib64:\$LD_LIBRARY_PATH" >> ${HOME}/.bash_profile

cat <<"EOF" >> ~/.bash_profile
# set PATH for cuda 10.0 installation
if [ -d "/usr/local/cuda-10.0/bin/" ]; then
    export PATH=/usr/local/cuda-10.0/bin${PATH:+:$PATH}
    export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
else
    # set PATH for cuda 10.1 installation
    if [ -d "/usr/local/cuda-10.1/bin/" ]; then
        export PATH=/usr/local/cuda-10.1/bin${PATH:+:$PATH}
        export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
    fi
fi
EOF

