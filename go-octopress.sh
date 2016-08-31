
# 2016-08-21

echo hugo met ocotpress thema, opstarten . . . 

# hugo server --log=true --verbose=true --config="go-octopress.toml" -buildDrafts --theme=hyde-y --bind=0.0.0.0 -b=http://rasp164:1313 
hugo server --buildDrafts --verbose=true --log=true --config="go-octopress.toml" -buildDrafts --bind=0.0.0.0 -b=http://rasp164:1313 

