myconsole()
{
    python tools/remote_api/console.py --servername=${1:-localhost:8001} --appid=${2:-big-sky}
}

mydeploy()
{
    /usr/local/google_appengine/appcfg.py --oauth2 -A ${1:-wf-richapps} -v update . -V ${2:-chad}
}

alias skytest="python manage.py test"
alias skyserver="python manage.py runserver localhost:8001"
alias skyreset="python tools/erase_reset_data.py --admin=chad.knight@workiva.com --password=W3bfilings$"
alias skyconsole="myconsole"
alias skydeploy="mydeploy"

alias wfconsole="myconsole wf-richapps.appspot.com s~wf-richapps"
