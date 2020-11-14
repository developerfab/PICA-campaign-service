docker build -t campaigns .
docker run --name campaign-server -p 3008:3008 -d campaigns
