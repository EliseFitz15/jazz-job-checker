## Template for Sinatra App w/o database

This template is ready to be deployed via Heroku. If you have the Heroku tool belt installed simply follow the steps below.

#### To use:
- `git clone https://github.com/EliseFitz15/sinatra-deploy-ready.git <directory-name>`
- `cd <directory-name>`
- `rm -rf .git`
- Reinitialize git `git init` && `git add . && git commit -m "initial commit"`
- `heroku create <app-name>`
- `git push heroku master` && `heroku open`
