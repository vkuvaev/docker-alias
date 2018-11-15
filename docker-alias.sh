# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpsa="docker ps -a"

# Get images
alias di="docker images"

# Remove a container
alias dcrm='docker container rm'

#Remove an image
alias dirm='docker image rm'

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
dcrma() { echo -n "Remove All Containers, sure? ";read i; if [ "$i" == "y" ];then docker rm $(docker ps -a -q); else echo "NO!!";fi }

# Stop and Remove all containers
alias drmf='dstop;dcrma'

# Remove all images
dirma() { echo -n "Remove All images, sure? ";read i; if [ "$i" == "y" ];then docker rmi $(docker images -q); else echo "NO!!";fi  }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Docker commit alias
alias dcomm='docker commit'
