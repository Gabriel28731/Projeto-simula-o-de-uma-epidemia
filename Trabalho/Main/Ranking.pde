// Função para exibir o ranking dos infectados
void desenharRanking() {
  // Filtra apenas os indivíduos infectados
  Individuo[] infectados = new Individuo[totalAgentes];
  int quantidadeInfectados = 0;
  
  // Percorre todos os agentes e seleciona os infectados
  for (int i = 0; i < totalAgentes; i++) {
    if (agentes[i].estado == Estado.INFECTADO) {
      infectados[quantidadeInfectados] = agentes[i];
      quantidadeInfectados++;
    }
  }
  
  // Cria uma cópia do array de infectados para ordenação
  Individuo[] copiaInfectados = new Individuo[quantidadeInfectados];
  for (int i = 0; i < quantidadeInfectados; i++) {
    copiaInfectados[i] = infectados[i];
  }
  
  // Ordena os infectados com base no número de pessoas que cada um infectou
  mergeSort(copiaInfectados, 0, copiaInfectados.length - 1);

  // Exibe o ranking na tela
  fill(0);  // Cor do texto
  textSize(14);
  text("Top 5 - Mais Infectados:", 10, height - 90);  // Título do ranking
  
  // Exibe os 5 primeiros ou o número total de infectados se for menor que 5
  for (int i = 0; i < min(5, copiaInfectados.length); i++) {
    Individuo ind = copiaInfectados[i];
    text((i + 1) + "º - ID: " + ind.id + " | Infectou: " + ind.quantosInfectou + " pessoas",
         10, height - 70 + i * 15);  // Mostra a posição, ID e quantos infectou
  }
}

// Função MergeSort para ordenar os infectados
void mergeSort(Individuo[] arr, int inicio, int fim) {
  if (inicio < fim) {
    int meio = (inicio + fim) / 2;
    mergeSort(arr, inicio, meio);        // Ordena a metade da esquerda
    mergeSort(arr, meio + 1, fim);       // Ordena a metade da direita
    merge(arr, inicio, meio, fim);       // Junta as metades ordenadas
  }
}

// Função para combinar as duas metades ordenadas em um array único
void merge(Individuo[] arr, int inicio, int meio, int fim) {
  int n1 = meio - inicio + 1;
  int n2 = fim - meio;

  // Arrays temporários para armazenar as duas metades
  Individuo[] esquerda = new Individuo[n1];
  Individuo[] direita = new Individuo[n2];

  // Copia os elementos da metade esquerda para o array 'esquerda'
  for (int i = 0; i < n1; i++) esquerda[i] = arr[inicio + i];
  // Copia os elementos da metade direita para o array 'direita'
  for (int j = 0; j < n2; j++) direita[j] = arr[meio + 1 + j];

  int i = 0, j = 0, k = inicio;

  // Combina as duas metades em um único array ordenado
  while (i < n1 && j < n2) {
    if (esquerda[i].quantosInfectou >= direita[j].quantosInfectou) {

