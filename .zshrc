POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs node_version)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

for config_file ($HOME/.oh-my-zsh/lib/*.zsh); do
  config_file=$(basename $config_file .zsh)
  zplug "lib/$config_file", from:oh-my-zsh
done

zplug "plugins/git", from:oh-my-zsh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "zsh-users/zsh-autosuggestions"
zplug "g-plane/zsh-yarn-autocompletions", hook-build:"cargo build --release && cp target/release/yarn-autocompletions ./"

zplug check || zplug install
zplug load

setopt autocd

eval "$(direnv hook zsh)"

alias srv='cd /Users/jonasvdv/Dev/testing && hs --cors -c-1 -p 4321'
alias ngr='ngrok http -subdomain=jvdv -region=eu 4321'
alias diff=colordiff
alias cat=bat

cdpath=(/Users/jonasvdv/Dev)

export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/Users/jonasvdv/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/sbin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/opt/android/platform-tools"

export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"
nvs auto on
nvs auto

