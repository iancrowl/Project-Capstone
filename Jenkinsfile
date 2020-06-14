pipeline {
     agent any
     stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t project-capstone .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "project-capstone"]) {
                      sh "docker tag project-capstone iancrowl/project-capstone"
                      sh 'docker push iancrowl/project-capstone'
                  }
              }
         }
         stage('Deploying') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'Jenkins', region: 'us-east-2') {
                      sh "aws eks --region us-east-2 update-kubeconfig --name capstonecluster"
                      sh "kubectl config use-context arn:aws:eks:us-east-2:988212813982:cluster/capstonecluster"
                      sh "kubectl set image deployments/project-capstone project-capstone=icrowl/project-capstone:latest"
                      sh "kubectl apply -f deployment/deployment.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/project-capstone"
                  }
              }
        }
        stage("Cleaning up") {
              steps{
                    echo 'Cleaning up...'
                    sh "docker system prune"
              }
        }
     }
}
