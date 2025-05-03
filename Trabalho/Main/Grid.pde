

//Branco: vazio
//Azul: Suscetível
//Verde: recuperado
//Tamanho de célula fixa, mas editável no main

void desenharGrid(){
  
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (grid[i][j] == -1) {
        fill(255); //branco
      } else {
        //aux = varialvel auxiliar que recebe se o individuo está infectado, suscetível ou recuperado.
        //azul, vermelho e verde, respectivamente
        Individuo aux = agentes[grid[i][j]];
        if (aux.estado == Estado.SUSCETIVEL) fill(#0027FC);  
        else if (aux.estado == Estado.INFECTADO) fill(#FF5555);
        else fill(#00FC1B);                     
      }
      stroke(200);
      rect(i * tamanho_celula, j * tamanho_celula, tamanho_celula, tamanho_celula);
    }
  }
}
