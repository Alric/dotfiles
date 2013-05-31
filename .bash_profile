[[ -r ~/.bashrc ]] && . ~/.bashrc
[[ -r ~/.bash_profile_secret ]] && . ~/.bash_profile_secret

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset

print_before_the_prompt () {
    printf "\n $txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)" && update_terminal_cwd;
}

PROMPT_COMMAND=print_before_the_prompt
#PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"

PS1='->'

export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/bin:$HOME/bin:$PATH"
eval "$(rbenv init -)"

#Add working-directory memory
#Note: this may conflict with other tools that hijack CD, e.g., RVM
#function cd() {
  #if the target is the previous working directory indicated by - (stored in OLDPWD) and none is set (e.g., when opening a new tab or logging on),
  #  inform the user and restore the saved one
#  test "$@" == "-" \
#    && test "$OLDPWD" == "" \
#    && echo 'OLDPWD not set. Restoring last working directory.' \
#    && export OLDPWD=`cat ~/.last_dir`;

  #perform the builtin change directory command
#  builtin cd "$@";

  #store the working directory for later use
#  pwd > ~/.last_dir;
#}

#Combine rake db commands for both dev and test environments.
alias bake="bundle exec rake"
alias migrate=" echo 'rake db:migrate && rake db:migrate RAILS_ENV=test' && rake db:migrate && rake db:migrate RAILS_ENV=test";
alias seed=" echo 'rake db:seed && rake db:seed RAILS_ENV=test' && rake db:seed && rake db:seed RAILS_ENV=test";
alias rollback=" echo 'rake db:rollback && rake db:rollback RAILS_ENV=test' && rake db:rollback && rake db:rollback RAILS_ENV=test";
alias annotate="echo 'bundle exec annotate --exclude tests,fixtures' && bundle exec annotate --exclude tests,fixtures";
alias foreman="echo 'bundle exec foreman start -f Procfile.development' && bundle exec foreman start -f Procfile.development";
alias gs="echo 'git status' && git status";
alias gd="echo 'git difftool' && git difftool";
alias gda="echo 'git difftool --cached' && git difftool --cached";
alias ga="echo 'git add -A' && git add -A";
alias gm="echo 'git commit -m' && git commit -m";
alias gf="echo 'git fetch' && git fetch";
alias grom="echo 'git rebase origin/master' && git rebase origin/master";
alias gdc="echo 'git difftool origin/master..HEAD' && git difftool origin/master..HEAD";
alias gsc="echo 'git log origin/master..HEAD' && git log origin/master..HEAD";
alias gfsm="echo 'git submodule -q foreach git pull -q origin master' && git submodule -q foreach git pull -q origin master"; #Updates all submodules
alias remove_exec="echo 'chmod a-x <file>' && chmod a-x";
alias quiet_tail="tail -f log/development.log | grep -vE '(^$|asset)'";
alias file_types='echo "find . -type f | perl -ne '"'"'print $1 if m/\.([^.\/]+)$/'"'"' | sort -u" && find . -type f | perl -ne '"'"'print $1 if m/\.([^.\/]+)$/'"'"' | sort -u'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
