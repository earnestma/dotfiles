REMOTE_URL=$(git remote get-url --push origin)
COMMITS=$(git reflog -2 $(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD)) --pretty=format:%h | xargs printf '%s from %s')
CURRENT_BRANCH=$(git branch --show-current)
UPSTREAM_BRANCH=$(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD) | sed 's#^[^/]*/##g')
echo "On $REMOTE_URL:
    $COMMITS ($CURRENT_BRANCH -> $UPSTREAM_BRANCH)"

