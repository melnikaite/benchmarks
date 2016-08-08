`brew install pyenv`
`pyenv install 3.5.2`
`virtualenv -p /Users/johnny/.pyenv/versions/3.5.2/bin/python3.5 myenv`

`./myenv/bin/python ./mysite/manage.py runserver`

`gobench -t 10 -u http://127.0.0.1:8000/polls/`
