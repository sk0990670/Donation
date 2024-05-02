    pipeline {
    agent any
    stages {
        stage("Code") {
            steps {
                echo "Cloning the code"
                git url:"https://github.com/solosahej/Donation.git", branch:"main"
            }
        }
        stage("Build") {
            steps {
                echo "Building the image"
                sh "docker build -t Donation ."
            }
        }
        stage("Push to Docker Hub") {
            steps {
                echo "Pushing the image to dockerhub"
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPass', usernameVariable: 'dockerHubUser')]) {
                    sh "docker tag my-note-app ${env.dockerHubUser}/my-note-app:latest"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker push ${env.dockerHubUser}/Donation:latest"
                }
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the container"
                sh "docker compose down && docker compose up -d"
            }
        }
    }
}
