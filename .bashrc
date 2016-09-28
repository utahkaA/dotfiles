
# for Linux
if [ `uname` = "Linux" ]; then
  # source /opt/ros/indigo/setup.bash
  # source ~/WorkTree/catkin_ws/devel/setup.bash
  alias listusers="cat /etc/passwd | cut -d : -f 1"
fi

# Prompt Settings
git_branch() {
  echo $(git branch 2> /dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\[\e[0;32m\]\W\[\e[00m\] \[\033[40;1;32m\]$(git_branch)\[\033[0m\]\n$ '
