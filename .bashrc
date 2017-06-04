######################################################
# bt3's .bashrc (partially modified for publishing)
######################################################
#
##
#    1) .bashrc is the *non-login* config for bash, run in scripts and after
#        first connection.
#
#    2) .bash_profile is the *login* config for bash, launched upon first
#        connection (in Ubuntu)
#
#    3) .bash_profile imports .bashrc in our script, but not vice versa.
#
#    4) .bashrc imports .bashrc_custom in our script, which can be used to
#        override variables specified here.
#



######################################################
# GLOBAL DEFINITIONS
######################################################

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#archey3


######################################################
# PRETTY STUFF
######################################################



# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset



# \a    an ASCII bell character (07)
# \d  the date in "Weekday Month Date" format (e.g., "Tue May 26")
# \]  end a sequence of non-printing characters
# \e  an ASCII escape character (033)
# \h  the hostname up to the first `.'
# \H  the hostname
# \j  the number of jobs currently managed by the shell
# \l  the basename of the shell's terminal device name
# \n  newline
# \r  carriage return
# \s  the name of the shell, the basename of $0 (the portion following the final slash)
# \t  the current time in 24-hour HH:MM:SS format
# \T  the current time in 12-hour HH:MM:SS format
# \@  the current time in 12-hour am/pm format
# \A  the current time in 24-hour HH:MM format
# \u  the username of the current user
# \v  the version of bash (e.g., 2.00)
# \V  the release of bash, version + patchelvel (e.g., 2.00.0)
# \w  the current working directory
# \W  the basename of the current working directory
# \!  the history number of this command
# \#  the command number of this command
# \$  if the effective UID is 0, a #, otherwise a $
#  \nnn    the character corresponding to the octal number nnn
#  \\  a backslash
#  \[  begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt


#PS1='\[\e[1;32m\]\A \H> \[\e[1;35m\]\u\[\e[1;34m\] \w: \[\e[m\]\[\e[1;35m\]'

PS1='\e[1;31m\]┌──[ \e[1;32m\]\A \e[1;31m\]|\e[0;32m\] \u \e[1;33m\]@ \e[0;32m\]\h\e[1;31m\] ]─[ \e[0;34m\]\w \e[1;31m\]]\n└──╼ \e[1;36m\]\\$ \[\e[0m\]'
  

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

######################################################
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

alias ax='chmod a+x'

alias s="subl"

alias cog='Cognosec-DRS'
alias stb='standardbank'

alias task-stb="task rc.data.location=~/.torr/prof/stb/.task-stb/"
alias task-cog="task rc.data.location=~/.torr/prof/cog/.task-cog/"
alias task-per="task rc.data.location=~/.torr/prof/per/.task-per/"

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

alias lC='clear, ls -ltcr' # clear screen, sort by change time, recent last.





######################################################
# EXPORT OPTIONS
######################################################

#export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31' # green for matches
export CLICOLOR=230
export HISTFILESIZE=3000
export HISTCONTROL=ignoredups


######################################################
# FUNCTIONS
######################################################

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Function to run upon exit of shell.
function _exit()
{
    echo -e "${BRed}Hasta la vista, Baby! ${NC}"
}
trap _exit EXIT


# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
