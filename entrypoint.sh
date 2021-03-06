#!/bin/sh -l

[ "${MY_SECRET_VALUE:+dummy}" ] || {
    echo 'No MY_SECRET_VALUE ENV variable set. Please set your access token to MY_SECRET_VALUE env variable.'
    exit 1
}
[ "${GITHUB_REPOSITORY:+dummy}" ] || {
    echo 'No GITHUB_REPOSITORY ENV variable set. Please set your GitHub repository name to GITHUB_REPOSITORY env variable. [Format username/reponame]'
    exit 1
}
[ "${GITHUB_WORKSPACE:+dummy}" ] || {
    echo 'No GITHUB_WORKSPACE ENV variable set. Please set GITHUB_WORKSPACE env variable of your path to pull the git repo. [Format /github/workspace]'
    exit 1
}

# Cloning target repository
url_repo_git="https://github.com/${GITHUB_REPOSITORY}.git"
echo "Git URL of your repo to clone: ${url_repo_git}"
git clone $url_repo_git $GITHUB_WORKSPACE
echo 'Directory structure of your repo:'
tree $GITHUB_WORKSPACE

cd $GITHUB_WORKSPACE
php /app/action.php "$@"
