function bd --wraps='bd' --description 'change directory using bd'
  cd (command bd -si $argv)
end
