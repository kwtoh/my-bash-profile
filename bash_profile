# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

mix_color_git_branch(){
 if [ "$(parse_git_branch)" = "(master)" ]; then
  echo 31
 else
  echo 33
 fi
}

if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;$(mix_color_git_branch)m\] $(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
