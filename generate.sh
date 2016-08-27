################################################################################
# generate de website
################################################################################
# rss uit
# / werkt voor www.dirkpostma.com
################################################################################

echo website genereren, . . . .

## hydy-y
# hugo --uglyURLs=true --disableRSS=true --theme=hyde-y  -b="/"

## dropbox, 2016-08-27, nog niet gelukt, nog probleem met index.html
# https://dl.dropboxusercontent.com/u/13801240/site/index.html
# hugo --uglyURLs=true --disableRSS=true --config="go-octopress.toml" -b="./"

## dirkpostma.com, 2016-08-27
hugo --disableRSS=true --config="go-octopress.toml" -b="/"

# eof
