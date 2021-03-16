GOPATH="$HOME/go"
PATH="$HOME/bin:$HOME/.local/bin:$PATH:$GOPATH/bin"
export GOPATH
export ANSIBLE_NOCOWS=1 
export HISTFILESIZE=10000000000
export HISTSIZE=10000000000

/usr/bin/xinput set-prop 'Logitech USB Receiver'  'Device Accel Constant Deceleration' 0.5 &
/usr/bin/xinput set-prop 'ThinkPad Compact Bluetooth Keyboard with TrackPoint'  'Device Accel Constant Deceleration' 0.3

alias xclip='/usr/bin/xclip -i -selection clipboard'
