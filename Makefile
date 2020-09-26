all: Dockerfile
	docker build -f Dockerfile -t hitzhangjie/gitpod:latest --rm --squash .
	#docker push hitzhangjie/gitpod:latest
