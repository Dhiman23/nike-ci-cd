pipeline{
    agent any 
    tools{
        nodejs "node"
    }
    environment{
         SCANNER_HOME= tool 'sonar-scanner' 
          }

    {
        stages{


        stage("git checkout"){
            steps{
            git branch: 'main', url: 'https://github.com/Dhiman23/nike-clone-ingress.git'
            }
        }

        stage("npm install"){
             steps{
                script{
                    sh 'npm install'
                }
             }
        }

        parallel{
            
            stage("test app"){
                steps{
                    script{
                        sh 'npm test -- --coverage'
                    }
                }
            }
              stage("Code FMT"){
                steps{
                    script{
                        sh 'npm run lint'
                    }
                }
            }
        }

        stage("Trivy fs"){
            steps{
                script{
                    sh 'trivy fs --format table -o file.html'
                }
            }
        }
        
        stage("Sonar"){
    steps{
      withSonarQubeEnv('sonar') {
                         sh '''
                         $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=nikeapp -Dsonar.projectKey=nikeapp -Dsonar.java.binaries=. 
                                    
                        '''
                       }
                  }
                }
        stage("build app"){
                steps{
                    script{
                        sh 'npm run build'
                    }
                }
            }
            stage("docker image build "){
           steps{
             script{
            withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        
                        sh "docker build -t sajaldhimanitc1999/goapp:latest ."
                        
                      }
                  }
              }
            }
            stage("trivy image scan "){
              steps{
                    sh "trivy image --format table -o trivy-image-report.html sajaldhimanitc1999/goapp:latest" 
                 }
               }
            
        stage("docker image push  "){
    steps{
        script{
               withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        
                        sh "docker push sajaldhimanitc1999/nikeapp:latest"
                        
                      }
                   }
                }
            }

  stage(deploy){
       steps{
         script{
        sh "docker run -d -p 3000:3000 sajaldhimanitc1999/nikeapp:latest"
            }

         }
      }

    }
 }
}