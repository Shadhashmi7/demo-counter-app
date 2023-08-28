pipeline{
    agent any
    
    environment {
        // Set your SonarQube server details
        SONAR_HOST = "http://3.89.155.238:9000"
        SONAR_TOKEN = credentials('sonarsecret')  // Use the appropriate credential ID
        
        
    }

    tools{

        jdk 'jdk11'
        maven 'maven3'
    }

    stages{

        stage('clean workspace'){
            
            steps{
                cleanWs()
            }
        }
        stage('checkout scm'){

            steps{
                git branch: 'main', url: 'https://github.com/Shadhashmi7/demo-counter-app.git'
            }
        }

        stage('compile code'){

            steps{

                sh 'mvn clean compile'
            }
        }

        stage('mvn test'){

            steps{

                sh 'mvn test'
            }
        }

        stage('sonarqube analysis'){

            steps{
                
                    withSonarQubeEnv('sonar') {
                        sh "mvn sonar:sonar -Dsonar.host.url=${env.SONAR_HOST} -Dsonar.login=${env.SONAR_TOKEN}"

    
                    }
                
            }
        }

        stage('Quality gate'){

            steps{

                script{
                                       
                    
                   script{
                    timeout(time: 1, unit: 'MINUTES'){
                    def qg = waitForQualityGate()
                     print "Finished waiting"
                     if (qg.status != 'OK'){
                        error "Pipeline aborted due to quality gate failure: ${qg.status}"
                     }
                        }
                }

                }     
                
            }
        }


    }


}