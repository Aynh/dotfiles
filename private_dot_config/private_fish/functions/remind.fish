function remind --wraps='sleep $argv && paplay /usr/share/sounds/freedesktop/stereo/phone-incoming-call.oga' --description 'alias remind=sleep $argv && paplay /usr/share/sounds/freedesktop/stereo/phone-incoming-call.oga'
  sleep $argv && paplay /usr/share/sounds/freedesktop/stereo/phone-incoming-call.oga $argv
        
end
