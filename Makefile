setup:
	python3 -m venv ~/.ml-microservice-k8s
	source ~/.ml-microservice-k8s/bin/activate

install:

	pip install --upgrade pip &&\
	pip install -r requirements.txt
	# Download hadolint binary and set it as executable
	 wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
     chmod +x /bin/hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	pylint --disable=R,C,W1203 app.py

all: install lint test
