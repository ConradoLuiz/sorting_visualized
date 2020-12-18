import processing.sound.*;
TriOsc noise;
float[] valor;
String METHOD = "Bubble";

int i=0;
int j=0;

void setup() {

  size(800, 600);
  
  noise = new TriOsc(this);
  
  noise.play();

  valor = new float[width];

  for (int i=0; i < valor.length; i++) {
    valor[i] = random(height-25);
  }

  //bubble(valor);
}

void draw() {

  background(0);


  //BUBBLE SORT
  if (METHOD == "Bubble") {
    if (i < valor.length-1) {
  
      for (int j = i+1; j < valor.length; j++) {
        
        if (valor[i] > valor[j]) {
          noise.freq(valor[j]);
          float aux = valor[i];
          valor[i] = valor[j];
          valor[j] = aux;
        }
      }
    }
  
    i++;
  }

  //--------------------------------

  //SELECTION SORT
  
  if(METHOD=="Selection"){
    if (i < valor.length-1) {
      int min = i;
      for (j= i+1; j < valor.length; j++) {
        
        if (valor[j] < valor[min]){
          noise.freq(valor[j]);
          min = j;
        }
      }
  
      float aux = valor[i]; 
      valor[i] = valor[min]; 
      valor[min] = aux; 
  
      i++;
    }
  }
  //-----------------------------------

  //INSERTION SORT
  if(METHOD == "Insertion"){
    if (i < valor.length) {
      j = i;
  
      while ((j > 0) && (valor[j] < valor[j-1])) {
        noise.freq(valor[j]);
        float aux = valor[j]; 
        valor[j] = valor[j-1]; 
        valor[j-1] = aux;
        j--;
      }
      
      i++;
    }
  }  

  //-----------------------------------


  for (int n=0; n < valor.length; n++) {
    stroke(255); 
    line(n, height, n, height - valor[n]);
  }
  
  mostrarOpcoes();
  
  textSize(16);
  fill(168, 218, 220);
  text("Método Atual - " + METHOD + " Sort", 550, 20); 
}

void mostrarOpcoes(){
  textSize(16);
  fill(168, 218, 220);
  text("Bubble Sort - B", 10, 20); 
  
  fill(168, 218, 220);
  text("Selection Sort - S", 140, 20); 
  
  fill(168, 218, 220);
  text("Insertion Sort - I", 290, 20); 
}

void resetArray(){
  valor = new float[width];

  for (int i=0; i < valor.length; i++) {
    valor[i] = random(height-25);
  }
  i=0;
  j=0;
}

void keyPressed(){
  switch(key){
    case 'b':
    case 'B':
      METHOD = "Bubble";
      break;
    case 's':
    case 'S':
      METHOD = "Selection";
      break;
    case 'i':
    case 'I':
      METHOD = "Insertion";
      break;
    case 'r':
    case 'R':
      resetArray();
      break;
    default:
      break;
  }
}
//void bubble(float[] p){

//   for(int i=0; i < p.length-1; i++){
//     for(int j = i+1; j < p.length; j++){
//       if(p[i] > p[j]){
//         float aux = p[i];
//         p[i] = p[j];
//         p[j] = aux;
//       }
//     }
//   }
// }
