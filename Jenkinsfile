pipeline {

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment') 

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any
        options {
                timestamps ()
                ansiColor('xterm') // Formatting so colourises the output of the whole pipeline
            }
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/AhmedMasoodpy123/terraform-ec2.git" // links to the git repository in question
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                sh 'terraform init -input=false' // initialises terraform
                //sh 'terraform workspace new ${environment}' //creates a new workspace
                sh 'terraform workspace select ${environment}' //selects newly created workspace
                sh "terraform plan -input=false -out tfplan " //creates plan under name .tfplan
                sh 'terraform show -no-color tfplan > tfplan.txt' //shows what is in our tfplan on jenkins
            }
        }

        stage('Apply') {
            steps {
                sh "terraform apply -input=false tfplan" //apply command
            }
        }
    }

  }
