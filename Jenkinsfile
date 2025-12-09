node {
    // Reference to Maven and Java
    def mvnHome = tool 'maven-3.5.2'
    def javaHome = tool 'JDK8'  // Replace 'JDK8' with your configured JDK name

    // Holds reference to docker image
    def dockerImage
    def dockerImageTag = "devopsexample${env.BUILD_NUMBER}"

    stage('Clone Repo') {
        git 'https://github.com/Darshbhi88/DevOps-Example.git'
        // Set Maven and Java tool references
        mvnHome = tool 'maven-3.5.2'
        javaHome = tool 'JDK8'
    }

    stage('Build Project') {
        // Set JAVA_HOME for the build
        withEnv(["JAVA_HOME=${javaHome}", "PATH+=${javaHome}/bin"]) {
            sh "'${mvnHome}/bin/mvn' clean install"
        }
    }

    stage('Build Docker Image') {
        dockerImage = docker.build("devopsexample:${env.BUILD_NUMBER}")
    }

    stage('Deploy Docker Image and login'){
        echo "Docker Image Tag Name: ${dockerImageTag}"
        sh "docker images"
        sh "docker login -u vickeyyvickey -p Hello@123"
    }

    stage('Docker push'){
        // Extract the image ID for the devopsexample:${BUILD_NUMBER} image
        def imageId = sh(script: "docker images --format '{{.ID}}' devopsexample:${env.BUILD_NUMBER}", returnStdout: true).trim()
        def repoName = "vickeyyvickey/myapplication"
        
        // Tag the image
        sh "docker tag ${imageId} ${repoName}"
        
        // Push to Docker Hub
        sh "docker push ${repoName}"
    }
}
