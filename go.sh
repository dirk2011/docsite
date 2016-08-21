
echo hugo opstarten . . . 

# hugo server --buildDrafts --theme=hyde-y --bind=192.168.0.166 -b=http://192.168.0.166:1313
hugo server --log=true --verbose=true -buildDrafts --theme=hyde-y --bind=0.0.0.0 -b=http://rasp164:1313 

