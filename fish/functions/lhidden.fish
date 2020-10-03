function lhidden
 set lhidden  exa -la | awk '{ print $7 }' | grep '^\.' | xargs -n 6
end
