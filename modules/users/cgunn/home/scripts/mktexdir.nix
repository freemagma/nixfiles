{ pkgs, ... }:

let myname = "Charlie Gunn";
in pkgs.writeShellScriptBin "mktexdir" ''
  name=$(echo "''${1}" | grep -oh "[a-z]*" | awk 'NR==1{print $1;}')
  num=$(echo "''${1}" | grep -oh "[1-9][0-9]*" | awk 'NR==1{print $1;}')

  result="''${PWD%"''${PWD##*[!/]}"}" # extglob-free multi-trailing-/ trim
  result="''${result##*/}"          # remove everything before the last /
  classname=$(echo $result | grep -oh "[a-z]*" | awk 'NR==1{print $1;}')
  classnum=$(echo $result | grep -oh "[1-9][0-9]*" | awk 'NR==1{print $1;}')

  mkdir "''${1}"
  cd "''${1}"
  touch "main.tex"
  echo "\documentclass{math}

  \author{${myname}}
  \title{''${classname^^} ''${classnum}: ''${name^^} \#''${num}}

  \begin{document}
      \problem
  \end{document}
  " >> "main.tex"
  cd ..
''
