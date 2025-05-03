int n = 50;
int tamanho_celula = 13;

int[][] grid;
Individuo[] agentes = new Individuo[200];
int totalAgentes = 0;


// Inicializa o grid + células vazias
//observem que no size, ultrapassa 200 no eixo y. Planejei essa parte para o ranking ser colocado
void setup(){
  size(600, 800); 
  grid = new int[n][n];
  for (int i = 0; i < n; i++)
    for (int j = 0; j < n; j++)
      grid[i][j] = -1;
}

// Atualiza + simula + ranking
void draw(){
  background(255);
  atualizarSimulacao();
  desenharGrid();
  desenharRanking();
}


//cria infectados + suscetíveis
void mousePressed() {
  // Ignora cliques fora do grid. Sem esse if, não é gerado a célula onde deveria
  if (mouseY > n * tamanho_celula) return;

  int x = int(mouseX / tamanho_celula);
  int y = int(mouseY / tamanho_celula);

  //if complexo. Basicamente:
  //Verifica se o usuário clicou dentro da área do grid e se a célula está vazia.
  if (x >= 0 && x < n && y >= 0 && y < n && grid[x][y] == -1 && totalAgentes < agentes.length) {
    Estado novoEstado;

    if (mouseButton == LEFT) {
      novoEstado = Estado.INFECTADO;
    } else {
      novoEstado = Estado.SUSCETIVEL;
    }
    
    agentes[totalAgentes] = new Individuo(totalAgentes, novoEstado);
    grid[x][y] = totalAgentes;
    totalAgentes++;
  }
}
