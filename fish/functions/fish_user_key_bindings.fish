# from https://stackoverflow.com/questions/48956984/how-to-remap-escape-insert-mode-to-jk-in-fish-shell#48958650
# rem to add set fish_key_bindings fish_user_key_bindings to config.fish

function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert -m default jk backward-char force-repaint
end
