oc login -u developer
oc new-project coolstore-build
oc create -f openshift/coolstore-build.yaml
oc new-app coolstore-build -p GIT_URI=https://github.com/bmoussaud/devops-workshop-labs.git
oc new-project coolstore-qa
oc apply -f xebialabs/role-binding.yaml
oc new-project coolstore-prod
oc apply -f xebialabs/role-binding.yaml
oc policy add-role-to-user system:image-puller system:serviceaccount:coolstore-qa:default -n coolstore-build
oc policy add-role-to-user system:image-puller system:serviceaccount:coolstore-prod:default -n coolstore-build
