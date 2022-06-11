alias irb='winpty "$(which irb).cmd"'

if [ -f ~/.bashrc ]
then
    . ~/.bashrc
fi

export POSTGRES_USERNAME="fany2"
export POSTGRES_PASSWORD="epicodus"