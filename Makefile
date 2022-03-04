venv:
	python3 -m venv venv
	make install

install: venv
	venv/bin/pip3 install -r requirements.txt

install_dev: venv
	venv/bin/pip3 install -r requirements.dev.txt

tests: install_dev
	venv/bin/pytest -v --cov=. --cov-branch --cov-report=term-missing --cov-fail-under=100 --durations=0 .
	venv/bin/mypy *.py

web: venv
	venv/bin/python henrybot/web_service.py
