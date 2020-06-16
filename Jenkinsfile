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
                  withAWS(credentials: 'aws-creds', region: 'us-east-2') {
                      sh "aws eks --region us-east-2 update-kubeconfig --name CapstoneEKS-d5n7ddOdsmOw"
                      sh "kubectl config use-context arn:aws:eks:us-east-2:759288920914:cluster/CapstoneEKS-d5n7ddOdsmOw"
                      //Deployment A
                      // sh "kubectl set image deployments/project-capstone project-capstone=icrowl/project-capstone:a"
                      // sh "kubectl apply -f deployment/deployment-a.yml"
                      //Deployment B
                      sh "kubectl set image deployments/project-capstone project-capstone=icrowl/project-capstone:b"
                      sh "kubectl apply -f deployment/deployment-b.yml"
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
