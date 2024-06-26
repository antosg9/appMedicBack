$BACK_IMAGE = "app-medic-back"
$BACK_CONTAINER = "app-medic-back"

function Setup-Back {
    python -m venv ".venv"
    & ".venv/Scripts/Activate.ps1"
    pip install -r "requirements.txt"
}



function Build-Back {
    Setup-Back
    docker build -t $BACK_IMAGE .
}



function Start-Back {
    docker run -d --name $BACK_CONTAINER -p 3000:3000 $BACK_IMAGE
}



function Start {
    Start-Back
}

function Stop {
    docker stop $BACK_CONTAINER  -ErrorAction SilentlyContinue
    docker rm $BACK_CONTAINER -ErrorAction SilentlyContinue
}

function Pre-Commit {
    pre-commit run --all-files
}

function Clean {
    Stop
    docker rmi $BACK_IMAGE -ErrorAction SilentlyContinue
}

function All {
    Build-Back
}

param (
    [Parameter(Mandatory=$true)]
    [ValidateSet("setup-back", "build-back",  "start-back",  "start", "stop", "pre-commit", "clean", "all")]
    [string]$task
)

switch ($task) {
    "setup-back" { Setup-Back }
    "build-back" { Build-Back }
    "start-back" { Start-Back }
    "start" { Start }
    "stop" { Stop }
    "pre-commit" { Pre-Commit }
    "clean" { Clean }
    "all" { All }
}