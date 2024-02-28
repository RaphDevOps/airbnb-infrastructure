def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]
pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                echo "Download the code base"
                git branch: 'main', url: 'https://github.com/RaphDevOps/airbnb-infrastructure.git'
                sh 'ls'
            }
        }
        stage('verify terraform version') {
            steps {
                sh 'terraform --version'
                echo "Verify the terraform version..."
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init'
                echo "Initializing terraform project..."
            }
        }
        stage('terraform validate') {
            steps {
                sh 'terraform validate'
                echo "code syntax checking"
            }
        }
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
                echo "Verifying the project executable plan..."
            }
        }
        
         stage('Checkov scan') {
            steps {
        sh """                
        sudo pip3 install --upgrade pip
        sudo pip3 install checkov
        /var/lib/jenkins/.local/bin/checkov -d . --skip-check 'CKV_AWS_23,CKV_AWS_24,CKV_AWS_126,CKV_AWS_135,CKV_AWS_8'
        """
         }
     }
              
         stage('Manual approval') {
            steps {
                input 'Approval required for deployment'
                echo "wait for interative input"
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
                echo "apply the executable plan.."
            }
        }
    }
    post { 
    always { 
        echo 'I will always say Hello again!'
        slackSend channel: '#full-automated-cicd-infra-deployment', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}  \n More info at:  ${env.BUILD_URL}" 
    }
 }

}