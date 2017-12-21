tag=tjhei/dealii-java-jabref

img:
	docker build -t ${tag} .

push:
	docker push ${tag}

run:
	docker run --rm -it ${tag}

.PHONY: img test kill
