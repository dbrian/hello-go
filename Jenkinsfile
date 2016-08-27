node {

  stage 'Build'
  git url: 'https://github.com/dbrian/hello-go.git'
  sh 'make'

  stage 'Publish'
  sh 'echo docker push dbrian/hello-go'
}
