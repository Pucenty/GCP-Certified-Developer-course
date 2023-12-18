git config --global user.email \
    "pucenty@example.com"
git config --global user.name \
    "Pucenty"

# export PROJECT_ID=vocal-framework-405706
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
gcloud config set project $PROJECT_ID
gcloud config list

# Setup properties
~/cloudshell_open/spinnaker-for-gcp/scripts/install/setup_properties.sh

# Update number of GKE nodes to 2 in properties file not to exceed the CPU quota

# Install
~/cloudshell_open/spinnaker-for-gcp/scripts/install/setup.sh

# Forward Spinnaker Deck pod port 9000 to localhost port 8080
~/cloudshell_open/spinnaker-for-gcp/scripts/manage/connect_unsecured.sh