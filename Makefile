setup:
	python3 -m venv ~/.ml-microservice-k8s
	source ~/.ml-microservice-k8s/bin/activate

install:

	pip install --upgrade pip &&\
		pip install -r requirements.txt
	# Download hadolint binary and set it as executable
  	curl -sL -o ${HADOLINT} "https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-$(uname -s)-$(uname -m)" \
    && chmod 700 ${HADOLINT}

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
