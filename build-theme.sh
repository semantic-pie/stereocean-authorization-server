
repo=stereocean-keycloak-theme

if [ -d "$repo" ]; then
    cd $repo
    git pull
    echo "Repo '$repo' updated successfully"
else
    git clone https://github.com/semantic-pie/stereocean-keycloak-theme
    echo "Repo '$repo' cloned"
    cd $repo
fi

pnpm i
pnpm build

cd ..

docker compose down
docker compose up

