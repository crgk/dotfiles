
alias venvnosetests="python `which nosetests`"

myconsole()
{
    python tools/remote_api/console.py --servername=${1:-localhost:8001} --appid=${2:-big-sky}
}

mydeploy()
{
    /usr/local/google_appengine/appcfg.py --oauth2 -A ${1:-wf-richapps} -v update . -V ${2:-chad}
}

myreset()
{
    sky
    mv tools/bulkdata/accounts.csv tools/bulkdata/accounts.csv.bak
    cp ../my_accounts.csv tools/bulkdata/accounts.csv
    python tools/erase_reset_data.py --admin=chad.knight@workiva.com --password=${1:-W3bfilings$} --use_sqlite
    mv tools/bulkdata/accounts.csv.bak tools/bulkdata/accounts.csv    
}

alias skytest="python manage.py test"
alias skyserver="python manage.py runserver localhost:8001 --use_sqlite"
alias skymodule="/usr/local/google_appengine/dev_appserver.py --datastore_path=../datastore/django_dev~big-sky.datastore dispatch.yaml bigskyf1.yaml bigskyf4.yaml app.yaml ../../py-iam-services/iam-services.yaml --port 8080"
alias skyreset="myreset"
alias skyconsole="myconsole"
alias skydeploy="mydeploy"
alias skyapi="python tools/remote_api/setup_api_testing.py --api_testing_root /Users/chadknight/workspaces/wf/api-testing"

alias wfconsole="myconsole wf-richapps.appspot.com s~wf-richapps"
