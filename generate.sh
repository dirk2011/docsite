################################################################################
# generate website
################################################################################
# rss uit
# / werkt voor www.dirkpostma.com
################################################################################

echo website genereren, . . . .

# hydy-y
# hugo --theme=hyde-y  -b=http://www.dirkpostma.com

# octopress, oud
## hugo --config="go-octopress.toml" -b=http://www.dirkpostma.com

## dropbox, 2016-08-27, nog niet gelukt, punt wordt genegeerd
# https://dl.dropboxusercontent.com/u/13801240/site/index.html
# hugo --config="go-octopress.toml" -b=https://dl.dropboxusercontent.com/u/13801240/site/

hugo --disableRSS=true --config="go-octopress.toml" -b="/"

# eof

