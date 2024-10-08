pipeline {
    agent any
    tools {
        nodejs "node"
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
        VERSION = "${env.BUILD_NUMBER}"
    }
    stages {
        stage('Cleaning Workspace') {
            steps {
                cleanWs()
            }
        }


        stage('git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Dhiman23/nike-ci-cd.git'
            }
        }
        stage('npm install') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }
        stage('Update Browserslist DB') {
            steps {
                script {
                    sh 'npx update-browserslist-db@latest'
                }
            }
        }
        stage('FMT & Scan') {
            parallel {
                stage('Code FMT') {
                    steps {
                        script {
                            sh 'npm run lint'
                        }
                    }
                }
                stage('Trivy fs') {
                    steps {
                        script {
                            sh 'trivy fs --format table -o file.html .'
                        }
                    }
                }
               
            }
        }
         
        stage('Sonar') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh '''
                        $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=nikeapp -Dsonar.projectKey=nikeapp -Dsonar.java.binaries=. 
                    '''
                }
            }
        }
        stage('build app') {
            steps {
                script {
                    sh 'npm run build'
                }
            }
        }
        stage('docker image build') {

       steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        sh "docker build -t sajaldhiman1999/nikeapp:${VERSION} ."
                    }
                }
            }
        }
        stage('trivy image scan') {
            steps {
                sh "trivy image --format table -o trivy-image-report.html sajaldhiman1999/nikeapp:latest"
            }
        }
        stage('docker image push') {

    
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        sh "docker push sajaldhiman1999/nikeapp:${VERSION}"
                    }
                }
            }
        }
        
      
           stage('Update Deployment File') {
        environment {
            GIT_REPO_NAME = "nike-ci-cd"
            GIT_USER_NAME = "Dhiman23"
        }
        steps {
            withCredentials([string(credentialsId: 'github', variable: 'GITHUB_TOKEN')]) {
                sh '''
                    git config user.email "sajaldhiman68@gmail.com"
                    git config user.name "Dhiman23"
                    BUILD_NUMBER=${VERSION}
                    sed -i "s/replaceImageTag/${VERSION}/g" nike-web-app-chart/templates/deployment.yml
                    git add nike-web-app-chart/templates/deployment.yml
                    git commit -m "Update deployment image to version ${VERSION}"
                    git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main
                '''
            }
        }
    }
  }
    }

