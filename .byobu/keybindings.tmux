set -g prefix F12
unbind-key -n C-a
unbind-key -n C-b
set -g prefix ^B
set -g prefix2 ^B
bind b send-prefix
bind / detach
bind '\' split-window -h
bind - split-window -v
unbind '"'
unbind %

