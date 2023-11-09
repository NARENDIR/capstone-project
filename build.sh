#!/bin/bash
if [[ $GIT_BRANCH== "origin/dev"]]; then 
 ./build.sh
 
docker login -u narendiranr2 -p dckr_pat_325C7oay9o3gjdQyyZz9d0npX2Y

#Tag the image 
docker tag project narendiranr2/dev
#Push the image to the Dev Docker Hub repository docker
push narendiranr2/dev

elif [[ $GIT_BRANCH "origin/main" ]]; then 
./build.sh
docker login -u narendiranr2 -p dckr_pat_325C7oay9o3gjdQyyZz9d0npX2Y
docker tag project narendirr2/prod
docker push narendiranr2/prod
echo "Deployment error"
fi

