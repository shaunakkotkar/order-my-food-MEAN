pipeline {


  agent any
  
  stages {
    
    stage ("Docker build") {
      steps {
        script {
          sh 'docker build -t 122521033212.dkr.ecr.ap-south-1.amazonaws.com/hardik server/'
        }
       }
    }
    
    stage ("Docker upload") {
      steps {
        script {
          sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 122521033212.dkr.ecr.ap-south-1.amazonaws.com'
          sh 'docker push 122521033212.dkr.ecr.ap-south-1.amazonaws.com/hardik:latest'
        }
      }
  }
    stage ("ECS Deploy"){
      steps {
        script {
      sh "aws ecs update-service --cluster food --service food --force-new-deployment --region ap-south-1 "
        }
      }
    }
  }
  }
