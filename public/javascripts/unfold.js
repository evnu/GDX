// unfold html tag
function unfold(form) {
  with(document.getElementById(form).style){
    if(display=="none"){
      display="inline";
    } else{
      display="none";
    }
  }
}
