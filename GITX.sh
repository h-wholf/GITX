#!/data/data/com.termux/files/usr/bin/zsh

selector(){
  
  seleccion=$(termux-dialog checkbox -v init,add_origin,commit,status,add,log,salir,push_origin,upstream -t 'GITX TERMUX IDEV'|jq .text|tr -d '"[]"')
  $seleccion
  
}

init(){
  git init
}
status(){
  info=$(git status)
  termux-dialog confirm -i $info -t 'GITX  - status TERMUX IDEV'|jq .text|tr -d '"[]"'
  
}
add(){
  info=$(git status)
  termux-dialog confirm -i $info -t 'GITX  - add TERMUX IDEV'|jq .text|tr -d '"[]"'
  git add --all
  info=$(git status)
  termux-dialog confirm -i $info -t 'GITX  - add TERMUX IDEV'|jq .text|tr -d '"[]"'
  
  
}

commit(){
  info=$(termux-dialog text -i 'DESCRIPCION DEL COMMIT' -m -t 'GITX COMMIT TERMUX IDEV'|jq .text|tr -d '"[]"' )
  git commit -m $info
  
}
salir(){
  
  exit
  
}

push_origin(){
  
  git push origin
  termux-dialog confirm -i "se subió a github" -t 'GITX  - add TERMUX IDEV'|jq .text|tr -d '"[]"'
}

add_origin(){
  url=$(termux-dialog text -i 'URL  DE REPOSITORIO GITHUB' -m -t 'GITX COMMIT TERMUX IDEV'|jq .text|tr -d '"[]"' )
  
  
  
  echo git remote add origin $url
  
  
}

upstream(){
  termux-dialog confirm -i "ACONTINUACION SE ESTABLE SERÁ A GITHUB COMO PRINCIPAL" -t 'GITX  - add TERMUX IDEV'|jq .text|tr -d '"[]"'
  git push --set-upstream origin master
  
}

log(){
  info=$(git log)
  
  termux-dialog confirm -i $info -t 'GITX  - add TERMUX IDEV'|jq .text|tr -d '"[]"'
}
core(){
  selector
  
  core
}

core
