//Enum do professor => todo indivíduo pode estar EXATAMENTE num desses 3 estados
enum Estado {
  SUSCETIVEL, INFECTADO, RECUPERADO
}

class Individuo {
  int id;
  Estado estado;
  int tempoReacao;
  int tempoInfectado;
  int tempoParaRecuperar;
  int quantosInfectou;
  float delay;

  Individuo(int id, Estado estadoInicial) {
    this.id = id;
    this.estado = estadoInicial;
    this.tempoReacao = int(random(30, 120));
    this.tempoInfectado = 0;
    this.tempoParaRecuperar = int(random(300, 600));
    this.quantosInfectou = 0;
    this.delay = 0;
  }

  void agir() {
   //seu código aqui
   //Deverá ser abordado o comportamento individual de cada agente a cada ciclo
   //Movimentação, contágio e recuperação
  }
}
