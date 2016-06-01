
alias venvnosetests="python `which nosetests`"

skyconsole()
{
    python tools/remote_api/console.py --servername=${1:-localhost:8001} --appid=${2:-big-sky}
}

skydeploy()
{
    /usr/local/google_appengine/appcfg.py --oauth2 -A ${1:-wf-richapps} -v update . -V ${2:-chad}
}

skyreset()
{
    sky
    mv tools/bulkdata/accounts.csv tools/bulkdata/accounts.csv.bak
    cp ../my_accounts.csv tools/bulkdata/accounts.csv
    python tools/erase_reset_data.py --admin=chad.knight@workiva.com --password=${1:-W3bfilings$} --use_sqlite
    mv tools/bulkdata/accounts.csv.bak tools/bulkdata/accounts.csv    
}

alias skytest="python manage.py test"
alias skyserver="/usr/local/google_appengine/dev_appserver.py --datastore_path=../datastore/django_dev~big-sky.datastore app.yaml --port 8080 --automatic_restart no"
alias skymodule="/usr/local/google_appengine/dev_appserver.py --datastore_path=../datastore/django_dev~big-sky.datastore dispatch.yaml validationf1.yaml bigskyf1.yaml bigskyf4.yaml app.yaml ../../py-iam-services/iam-services.yaml --port 8080 --automatic_restart no"

alias wfconsole="myconsole wf-richapps.appspot.com s~wf-richapps"
