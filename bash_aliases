#-------------------------------------------------------------------------------
#  Aliases
#-------------------------------------------------------------------------------

# Notify pop-up 
# Works only for Windows, with 'notifu' executable in the PATH
alias ntf=' notifu /p "Bash Script" /d 3000 /m "Finished !!!"'

alias findn='find . -name ' 
alias hh='history 200'
alias envg='env | grep '
alias le='less -r'


#-------------------------------------------------------------------------------
#  Functions
#-------------------------------------------------------------------------------
function hg ()
{
  history | grep "$*"
}




