import ddf.minim.*;
PImage img, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16, img17;
int valor=2, etapa=0, una_sola_vez=0, cont, co=0, presionx=0, presionxd=0, contador=0, conteo=0, condicion=3;
String caso="sistema amortiguado", t="", amplitud="", frecuencia="", fase_inicial="", pfinal="", vfinal="", tfinal="", masa="", elasticidad="", amortiguamiento="", caso_amortiguado="", angulo_de_fase="";
boolean mm=true, aux=true, aux2=true, aux3=true, aux4=true, aux5=true, aux6=true, aux7=false, musica=false, presionar, aux_etapa31=true, aux_etapa32=true, aux_etapa33=true, posicion=false, velocidad=false, aceleracion=false, aux_posicion=true, parar=false;
float o, f, a, t1, n2=1, presion_final, volumen_final, temperatura_final, x1, v, a1, t2, x2, x3, m, b1, k, resultado, resultado2, o1, max=450, min=100;
float posicionx, posiciony;
float y=300, vel=3, cambio=vel;
;
float pos1[]=new float[1000];
float vel1[]=new float[1000];
float ace1[]=new float[1000];



int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude=75.0;  // Height of wave
float period = 700.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

//--------------------------------------------------------------------------------------------------
int xspacing2 = 1;   // How far apart should each horizontal location be spaced
int w2;              // Width of entire wave

float theta2 = 0.0;  // Start angle at 0
float amplitude2 = 75.0;  // Height of wave
float period2 = 500.0;  // How many pixels before the wave repeats
float dx2;  // Value for incrementing X, a function of period and xspacing
float[] yvalues2;  // Using an array to store height values for the wave


//---------------------------------------------------------------------------------------------------
int xspacing3 = 1;   // How far apart should each horizontal location be spaced
int w3;              // Width of entire wave

float theta3 = 0.0;  // Start angle at 0
float amplitude3 = 75.0;  // Height of wave
float period3 = 500.0;  // How many pixels before the wave repeats
float dx3;  // Value for incrementing X, a function of period and xspacing
float[] yvalues3;  // Using an array to store height values for the wave

Minim audio;
AudioPlayer reproducir;
AudioPlayer boton;  


int n, menos, funcion;
double x, abajo, c, b, arriba, seno, cos;


void setup() {
  //cargar todas las imagenes
  size(1200, 750);
  img=loadImage("fondo2.png");
  img2=loadImage("fondo1.png");
  img3=loadImage("flecha.png");
  img4=loadImage("flecha2.png");
  img5=loadImage("start.png");
  img6=loadImage("resorte.png");  
  img7=loadImage("clear.png");  
  img8=loadImage("chulo.png");  
  img9=loadImage("fondo3.png"); 
  img10=loadImage("audioon.png"); 
  img11=loadImage("audiooff.png"); 
  img12=loadImage("aceptar.png"); 
  img13=loadImage("cancelar.png");
  img14=loadImage("lab.jpg");
  img15=loadImage("cuadrado.png");
  img16=loadImage("resorte.png");
  img17=loadImage("agua.png");
  audio=new Minim(this);
  reproducir=audio.loadFile("audio1.mp3");
  boton=audio.loadFile("audio2.mp3");

  w = 500;
  dx = (TWO_PI / period) * xspacing;

  w2 = 500;
  dx2 = (TWO_PI / period2) * xspacing2;

  w3 = 500;
  dx3 = (TWO_PI / period) * xspacing;
}


void draw() {

  if (valor==1) {
    caso="sistema no amortiguado";
  } else if (valor==2) {
    caso="sistema amortiguado";
  }

  //-----------------------esta simplemente es la pantalla de carga--------------------------------
  if (etapa==0) {
    image(img2, 0, 0);

    if (musica==true) {
      image(img10, 50, 30, 70, 70);
      reproducir.play();
    } else if (musica==false) {
      reproducir.pause();
      image(img11, 50, 30, 70, 70);
    }
    textSize(50);
    text("presiona la tecla ENTER para continuar", 150, 600);
  }

  //-------------------------------segunda etapa donde se pide el caso que se va a trabajr-------------------------
  else if (etapa==1) {
    etapa=1;
    image(img2, 0, 0);
    noFill();
    noStroke();
    fill(27, 38, 49);
    rect(100, 100, 1000, 600);
    noFill();
    textSize(40);
    fill(255, 255, 255);
    text("seleccione el caso a trabajar", 330, 200);
    image(img3, 900, 300, 100, 100);
    image(img4, 220, 300, 100, 100);
    text(caso, 380, 360);
    image(img5, 350, 500, 500, 100);
    text("aceptar", 520, 560);
    /*fill(24,106,59);
     rect(330,500,550,100,25);
     fill(255,255,255);
     text("aceptar",520,560);*/
  }

  //------------Primera etapa donde se piden todos los valores iniciales--------------------------
  else if (etapa==2) {
    cont=1;
    etapa=2;
    if (caso=="sistema no amortiguado") {
      background(25, 25, 25);
      image(img, 0, 0);
      image(img6, 10, 30, 500, 700);

      //------------creacion del menu de tiempo------------------
      fill(215, 219, 221);
      noStroke();
      rect(600, 18, 580, 170, 25);
      fill(0, 0, 0);
      text("Tiempo", 830, 40);
      textSize(20);
      image(img7, 1080, 80, 50, 50);
      image(img8, 650, 80, 50, 50);
      fill(255, 255, 255);
      rect(715, 80, 350, 50);
      fill(0, 0, 0);
      text(t, 750, 110);


      //-----------------creacion del menu de la amplitud--------------------
      fill(215, 219, 221);
      noStroke();
      rect(600, 208, 580, 170, 25);
      fill(0, 0, 0);
      text("Amplitud", 830, 230);
      textSize(20);
      image(img7, 1080, 270, 50, 50);
      image(img8, 650, 270, 50, 50);
      fill(255, 255, 255);
      rect(715, 270, 350, 50);
      fill(0, 0, 0);
      text(amplitud, 750, 300);


      //-------------------creacion del menu de la frecuencia--------------------
      fill(215, 219, 221);
      noStroke();
      rect(600, 398, 580, 170, 25);
      fill(0, 0, 0);
      text("frecuencia", 830, 420);
      textSize(20);
      image(img7, 1080, 460, 50, 50);
      image(img8, 650, 460, 50, 50);
      fill(255, 255, 255);
      rect(715, 460, 350, 50);
      fill(0, 0, 0);
      text(frecuencia, 750, 490);



      //------------------------------creacion del menu de la fase inicial --------------------------------
      fill(215, 219, 221);
      noStroke();
      rect(600, 588, 580, 150, 25);
      fill(0, 0, 0);
      text("Fase inicial", 830, 610);
      textSize(20);
      image(img7, 1080, 650, 50, 50);
      image(img8, 650, 650, 50, 50);
      fill(255, 255, 255);
      rect(715, 650, 350, 50);
      fill(0, 0, 0);
      text(fase_inicial, 750, 680);
    } else if (caso=="sistema amortiguado") {
      background(25, 25, 25);
      image(img, 0, 0);
      image(img6, 10, 30, 500, 200);

      //--------------------menu del timepo en sistema amortiguado-----------------------------  
      fill(215, 219, 221);
      noStroke();
      rect(600, 18, 580, 170, 25);
      fill(0, 0, 0);
      text("Tiempo", 830, 50);
      textSize(20);
      image(img7, 1080, 80, 50, 50);
      image(img8, 650, 80, 50, 50);
      fill(255, 255, 255);
      rect(715, 80, 350, 50);
      fill(0, 0, 0);
      text(t, 750, 110);

      //---------------------------menu de la masa -----------------------------------------------  
      fill(215, 219, 221);
      noStroke();
      rect(600, 208, 580, 170, 25);
      fill(0, 0, 0);
      text("Masa", 830, 250);
      textSize(20);
      image(img7, 1080, 270, 50, 50);
      image(img8, 650, 270, 50, 50);
      fill(255, 255, 255);
      rect(715, 270, 350, 50);
      fill(0, 0, 0);
      text(masa, 750, 300); 


      //---------------------------------menu de la constante de elasticidada-------------------------
      fill(215, 219, 221);
      noStroke();
      rect(600, 398, 580, 170, 25);
      fill(0, 0, 0);
      text("Constante de elasticidad", 770, 435);
      textSize(20);
      image(img7, 1080, 460, 50, 50);
      image(img8, 650, 460, 50, 50);
      fill(255, 255, 255);
      rect(715, 460, 350, 50);
      fill(0, 0, 0);
      text(elasticidad, 750, 490);


      //-----------------------------menu de la constante de amortiguamiento--------------------------------------------
      fill(215, 219, 221);
      noStroke();
      rect(600, 588, 580, 150, 25);
      fill(0, 0, 0);
      text("Constante de amortiguamiento", 750, 630);
      textSize(20);
      image(img7, 1080, 650, 50, 50);
      image(img8, 650, 650, 50, 50);
      fill(255, 255, 255);
      rect(715, 650, 350, 50);
      fill(0, 0, 0);
      text(amortiguamiento, 750, 680);  


      //-----------------------------menu del angulo de fase--------------------------------------------
      fill(215, 219, 221);
      noStroke();
      rect(10, 588, 580, 150, 25);
      fill(0, 0, 0);
      text("Angulo de fase", 200, 630);
      textSize(20);
      image(img7, 480, 650, 50, 50);
      image(img8, 50, 650, 50, 50);
      fill(255, 255, 255);
      rect(120, 650, 350, 50);
      fill(0, 0, 0);
      text(angulo_de_fase, 135, 680);  

      //---------------------------------menu de la amplitud-------------------------
      fill(215, 219, 221);
      noStroke();
      rect(10, 398, 580, 170, 25);
      fill(0, 0, 0);
      text("Amplitud inicial", 200, 435);
      textSize(20);
      image(img7, 480, 460, 50, 50);
      image(img8, 50, 460, 50, 50);
      fill(255, 255, 255);
      rect(120, 460, 350, 50);
      fill(0, 0, 0);
      text(amplitud, 135, 490);
    }
  }

  //----------------------etapa 3 de este programa-----------------------
  else if (etapa==3) {

    if (caso=="sistema no amortiguado") {
      image(img, 0, 0);
      fill(27, 38, 49);
      noStroke();
      rect(80, 30, 1050, 700, 25);

      textSize(50);
      fill(255, 255, 255);
      text("¿que desea calcular?", 335, 100);
      fill(215, 219, 221);
      rect(250, 180, 700, 100, 25);          
      rect(250, 330, 700, 100, 25);
      rect(250, 480, 700, 100, 25);

      fill(255, 255, 255);
      textSize(40);
      text("posicion", 335, 240);
      text("velocidad", 335, 390);
      text("aceleracion", 335, 540);

      image(img5, 250, 600, 700, 100);
      text("continuar", 500, 660);

      if (aux_etapa31==true) {
        image(img12, 700, 190, 80, 80);
      }

      if (aux_etapa32==true) {
        image(img12, 700, 340, 80, 80);
      }

      if (aux_etapa33==true) { 
        image(img12, 700, 490, 80, 80);
      }
    } else if (caso=="sistema amortiguado") {
      background(0, 0, 0);
      resultado=(k/m)-((b1*b1)/4*m*m);
      resultado2=2*sqrt(k*m);
      f=sqrt((k/m)-((b1*b1)/4*m*m));
      x1=pow((a*2.718), -(b1/2*m)*t1)*cos(f*t1+o1);


      if (resultado==0 || resultado2==b1) {
        caso_amortiguado="amortiguamiento critico";
        f=0;
        condicion=1;
      } else if (b1>resultado2) {
        caso_amortiguado="sobreamortiguamiento";
        condicion=2;
      } else if (b1<resultado2) {
        caso_amortiguado="subamortiguamiento";
        condicion=3;
      }

      condicion=3; // quita esta linea de codigo vro
      etapa=4;
    }
  }


  //--------------etapa 4 de la simulacion------------------
  else if (etapa==4) {
    background(133, 193, 233);

    if (caso=="sistema no amortiguado") {
      image(img14, 0, 0);
      image(img15, 100, 30, 150, 50);
      image(img16, 75, 80, 200, 600-y);
      image(img15, 90, 680-y, 180, 120);
      contador=contador+1;


      //--------------hago el contador de cuanto se demora la animacion----------------------------
      if (cont==t1) {
        parar=true;
        textSize(20);
        fill(255, 255, 255);
        text("tiempo: "+t1, 120, 60);
      } else if (cont!=t1 && parar==false) {
        y=y-cambio;
        textSize(20);
        fill(255, 255, 255);
        text("tiempo: "+cont, 120, 60);
      }

      //--------------cambios de velocidad--------------------------
      if (y>500) {
        cambio=vel;
      }
      if (y<280) {
        cambio=-vel;
      }

      //calculo el tiempo por cada draw   
      if (contador==60) {
        cont=cont+1;
        if (cont!=t1) {
          contador=0;
        }

        t2=cont/10;



        pos1[cont]=sin(f*cont+o);
        pos1[cont]=pos1[cont]*a;

        vel1[cont]=cos(f*cont+o);
        vel1[cont]=vel1[cont]*a*f;

        ace1[cont]=sin(f*cont+o);
        ace1[cont]=ace1[cont]*f*f*-a;
      }
      textSize(20);
      fill(255, 255, 255);


      x1=sin(f*t1+o);
      x1=x1*a;
      v=cos(f*t1+o);
      v=v*a*f;
      a1=sin(f*t1+o);
      a1=a1*f*f*-a;

      if (posicion==true) {

        yvalues = new float[w/xspacing];
        fill(255, 255, 255);
        text("P vs T", 630, 25);
        fill(215, 219, 221);
        rect(600, 30, 580, 200, 25);
        noStroke();
        fill(215, 219, 221);
        rect(30, 560, 500, 50, 25);
        textSize(20);
        fill(0, 0, 0);
        text("posicion: "+pos1[cont]+" m", 50, 590);    
        if (parar==false) {
          calcWave();
        }
        renderWave();
      }

      if (velocidad==true) {

        yvalues2 = new float[w2/xspacing2];
        noStroke();
        fill(255, 255, 255);
        text("V vs T", 630, 270);
        fill(215, 219, 221);
        rect(600, 280, 580, 200, 25);
        fill(215, 219, 221);
        rect(30, 620, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        text("velocidad: "+vel1[cont]+" m/s", 50, 650);
        if (parar==false) {
          calcWave2();
        }
        renderWave2();
      }
      if (aceleracion==true) {

        yvalues3 = new float[w3/xspacing3];
        noStroke();
        fill(255, 255, 255);
        text("A vs T", 630, 520);
        fill(215, 219, 221);
        rect(600, 530, 580, 200, 25);
        fill(215, 219, 221);
        rect(30, 680, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        text("aceleracion: "+ace1[cont]+" m/s^2", 50, 710);
        if (parar==false) {
          calcWave3();
        }

        renderWave3();
      }
    } else if (caso=="sistema amortiguado") {

      image(img14, 0, 0);
      image(img17, -10, 500, 400, 200);
      image(img15, 100, 30, 150, 50);
      image(img16, 75, 80, 200, y); 
      image(img15, 90, y+80, 180, 120);

      contador=contador+1;

      //--------------hago el contador de cuanto se demora la animacion----------------------------
      if (cont==t1) {
        parar=true;
        textSize(20);
        fill(255, 255, 255);
        text("tiempo: "+t1, 120, 60);
      } else if (cont!=t1 && parar==false) {
        y=y-cambio;
        textSize(20);
        fill(255, 255, 255);
        text("tiempo: "+cont, 120, 60);
      }

      //calculo el tiempo por cada draw   
      if (contador==60) {
        cont=cont+1;
        if (cont!=t1) {
          contador=0;
        }
      }


      if (condicion==3) {

        //--------------cambios de velocidad--------------------------
        if (y>max) {
          cambio=vel;

          if (vel>-1) {
            vel=vel-0.025;
          }

          if (max!=300) {
            max=max-5;
          }
        }
        if (y<min) {
          cambio=-vel;
        }
        //grafia de posicion
        yvalues = new float[w/xspacing];
        fill(255, 255, 255);
        text("P vs T", 630, 25);
        fill(215, 219, 221);
        rect(600, 30, 580, 200, 25);
        noStroke();
        fill(215, 219, 221);
        // rect(30, 560, 500, 50, 25);
        textSize(20);
        fill(0, 0, 0);
        //text("posicion: "+pos1[cont]+" m", 50, 590);    
        if (parar==false) {
          calcWave();
          if (amplitude>15) {
            amplitude=amplitude-0.25;
          }
        }
        renderWave();
        
        //grafia de velocidad vs tiempo
        yvalues2 = new float[w2/xspacing2];
        noStroke();
        fill(255, 255, 255);
        text("V vs T", 630, 270);
        fill(215, 219, 221);
        rect(600, 280, 580, 200, 25);
        fill(215, 219, 221);
        //rect(30, 620, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        //text("velocidad: "+vel1[cont]+" m/s", 50, 650);
        if (parar==false) {
          calcWave2();
        }
        renderWave2();
        
        
        
      }
    }
  }
}

void keyPressed() {
  //--------------------esto es para iniciar la pantalla de carga o de inico--------------------
  if (key==ENTER && una_sola_vez==0) {
    etapa=1; // cambiar el 4 por el 1
    una_sola_vez=1;
  }


  //---------------------para ingresar los datos del tiempo ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux==true && aux==true && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    t=t+key;
    conteo=t.length();
    if (conteo>18) {
      aux=false;
      t1=Float.parseFloat(t);
      t=t+" Seg";
    }
  }  



  //---------------------para ingresar los datos de la amplitud ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux2==true && aux==false && aux2==true && aux==false && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    amplitud=amplitud+key;
    conteo=amplitud.length();
    if (conteo>20) {
      aux2=false;
      a=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
  }  


  //---------------------para ingresar los datos del frecuencia ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux3==true && aux2==false && aux3==true && aux==false && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    frecuencia=frecuencia+key;
    conteo=frecuencia.length();
    if (conteo>17) {
      aux3=false;
      f=Float.parseFloat(frecuencia);
      frecuencia=frecuencia+" rads/s";
    }
  }  


  //---------------------para ingresar los datos de la fase inicial ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux4==true && aux3==false && aux2==false && aux==false && aux4==true && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    fase_inicial=fase_inicial+key;
    conteo=fase_inicial.length();
    if (conteo>18) {
      aux4=false;
      o=Float.parseFloat(fase_inicial);
      etapa=3;
      fase_inicial=fase_inicial+" rad";
    }
  }  



  // --------------------------------- ingreso de los datos del sistema amortiguado ---------------------------------------------------

  //---------------------para ingresar los datos de la masa ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux2==true && aux==false && aux2==true && aux==false && caso=="sistema amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    masa=masa+key;
    conteo=masa.length();
    if (conteo>20) {
      aux2=false;
      m=Float.parseFloat(masa);
      masa=masa+" kg";
    }
  }  


  //---------------------para ingresar los datos de la constante de elasticidad ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux3==true && aux2==false && aux3==true && aux==false && caso=="sistema amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    elasticidad=elasticidad+key;
    conteo=elasticidad.length();
    if (conteo>17) {
      aux3=false;
      k=Float.parseFloat(elasticidad);
      elasticidad=elasticidad+" N/m";
    }
  }  


  //---------------------para ingresar los datos de la constante de amortiguamineto ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux4==true && aux3==false && aux2==false && aux==false && aux4==true && caso=="sistema amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    amortiguamiento=amortiguamiento+key;
    conteo=amortiguamiento.length();
    if (conteo>18) {
      aux4=false;
      b1=Float.parseFloat(amortiguamiento);
      amortiguamiento=amortiguamiento+" kg/s";
    }
  }

  //---------------------para ingresar los datos de la amplitud ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && aux3==false && aux2==false && aux==false && aux6==true && caso=="sistema amortiguado" && aux4==false && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    amplitud=amplitud+key;
    conteo=amplitud.length();
    if (conteo>18) {
      aux6=false;
      a=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
  }


  //---------------------para ingresar los datos del angulo de fase ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux5==true && aux3==false && aux2==false && aux==false && aux5==true && caso=="sistema amortiguado" && aux4==false && aux6==false && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    angulo_de_fase=angulo_de_fase+key;
    conteo=angulo_de_fase.length();
    if (conteo>18) {
      aux5=false;
      o1=Float.parseFloat(angulo_de_fase);
      etapa=3;
      angulo_de_fase=angulo_de_fase+" °";
    }
  }
}




void mouseClicked() {
  //-------------controles para el menu de las transformaciones del resorte----------------
  if (mouseX>900 && mouseX<1000 && mouseY>300 && mouseY<400 && valor<4 && etapa==1) {
    valor=valor+1;
  }

  if (mouseX>220 && mouseX<330 && mouseY>300 && mouseY<400 && valor>1 && etapa==1) {
    valor=valor-1;
  }

  if (mouseX>350 && mouseX<850 && mouseY>500 && mouseY<600 && etapa==1) {
    etapa=2;
  }

  //parar y reproducir musica  lo comente pq me estresaba escucharlo cada que lo ejecutaba
  if (mouseX>50 && mouseX<120 && mouseY>30 && mouseY<100 && etapa==0) {
    if (musica==true) {
      musica=false;
    } else if (musica==false) {
      musica=true;
    }
  }




  //---------------------los controles para la timepo------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>80 && mouseY<120 && etapa==2) {
    t="";
    aux=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>80 && mouseY<120 && etapa==2 && aux==true) {

    try {
      aux=false;
      t1=Float.parseFloat(t);
      t=t+" Seg";
    }
    catch(Exception e) {
      t="";
      aux=true;
    }
  }



  // ------------------- los controles para el menu de la amplitud----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>270 && mouseY<320 && etapa==2 && caso=="sistema no amortiguado") {
    amplitud="";
    aux2=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>270 && mouseY<320 && etapa==2 && aux2==true && aux==false && caso=="sistema no amortiguado") {

    try {
      aux2=false;
      a=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
    catch(Exception e) {
      amplitud="";
      aux2=true;
    }
  }



  // ------------------- los controles para el menu de la frecuencia----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>460 && mouseY<510 && etapa==2 && caso=="sistema no amortiguado") {
    frecuencia="";
    aux3=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>460 && mouseY<510 && etapa==2 && aux3==true && aux2==false && aux==false && caso=="sistema no amortiguado") {

    try {
      aux3=false;
      f=Float.parseFloat(frecuencia);
      frecuencia=frecuencia+" rads/s";
    }
    catch(Exception e) {
      frecuencia="";
      aux3=true;
    }
  }




  // ------------------- los controles para el menu de la fase inicial----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>650 && mouseY<700 && etapa==2 && caso=="sistema no amortiguado") {
    fase_inicial="";
    aux4=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>650 && mouseY<700 && etapa==2 && aux4==true && aux3==false && aux2==false && aux==false && caso=="sistema no amortiguado") {

    try {
      aux4=false;
      o=Float.parseFloat(fase_inicial);
      etapa=3;
      fase_inicial=fase_inicial+" rad";
    }
    catch(Exception e) {
      fase_inicial="";
      aux4=true;
    }
  }


  //----------------boton aceptar de la etapa 3----------------------------------------------------
  if (mouseX>700 && mouseX<780 && mouseY>190 && mouseY<270 && etapa==3 && aux_etapa31==true) {
    posicion=true;
    aux_etapa31=false;
  }

  if (mouseX>700 && mouseX<780 && mouseY>340 && mouseY<420 && etapa==3 && aux_etapa32==true) {
    velocidad=true;
    aux_etapa32=false;
  }

  if (mouseX>700 && mouseX<780 && mouseY>490 && mouseY<570 && etapa==3 && aux_etapa33==true) {
    aceleracion=true;
    aux_etapa33=false;
  }

  if (mouseX>250 && mouseX<950 && mouseY>600 && mouseY<700 && etapa==3 && (aceleracion==true || posicion==true || velocidad==true)) {
    etapa=4;
  }

  //-----------------------------------------sistema amortiguado-----------------------------------------------------------------

  // ------------------- los controles para el menu de la masa----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>270 && mouseY<320 && etapa==2 && caso=="sistema amortiguado") {
    masa="";
    aux2=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>270 && mouseY<320 && etapa==2 && aux2==true && aux==false && caso=="sistema amortiguado") {

    try {
      aux2=false;
      m=Float.parseFloat(masa);
      masa=masa+" kg";
    }
    catch(Exception e) {
      masa="";
      aux2=true;
    }
  }



  // ------------------- los controles para el menu de la constante de elasticidad----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>460 && mouseY<510 && etapa==2 && caso=="sistema amortiguado") {
    elasticidad="";
    aux3=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>460 && mouseY<510 && etapa==2 && aux3==true && aux2==false && aux==false && caso=="sistema amortiguado") {

    try {
      aux3=false;
      k=Float.parseFloat(elasticidad);
      elasticidad=elasticidad+" N/m";
    }
    catch(Exception e) {
      elasticidad="";
      aux3=true;
    }
  }




  // ------------------- los controles para el menu de la constante de amortigumiento----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>650 && mouseY<700 && etapa==2 && caso=="sistema amortiguado") {
    amortiguamiento="";
    aux4=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>650 && mouseY<700 && etapa==2 && aux4==true && aux3==false && aux2==false && aux==false && caso=="sistema amortiguado") {

    try {
      aux4=false;
      b1=Float.parseFloat(amortiguamiento);
      amortiguamiento=amortiguamiento+" kg/s";
    }
    catch(Exception e) {
      amortiguamiento="";
      aux4=true;
    }
  }


  // ------------------- los controles para el menu de la amplitud----------------------
  if (mouseX>480 && mouseX<530 && mouseY>460 && mouseY<510 && etapa==2 && caso=="sistema amortiguado") {
    amplitud="";
    aux6=true;
  }

  if (mouseX>50 && mouseX<100 && mouseY>460 && mouseY<510 && etapa==2 && aux4==false && aux3==false && aux2==false && aux==false && caso=="sistema amortiguado" && aux6==true) {

    try {
      aux6=false;
      a=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
    catch(Exception e) {
      amplitud="";
      aux6=true;
    }
  }


  // ------------------- los controles para el menu del angulo de fase----------------------
  if (mouseX>480 && mouseX<530 && mouseY>650 && mouseY<700 && etapa==2 && caso=="sistema amortiguado") {
    angulo_de_fase="";
    aux5=true;
  }

  if (mouseX>50 && mouseX<100 && mouseY>650 && mouseY<700 && etapa==2 && aux5==true && aux3==false && aux2==false && aux==false && caso=="sistema amortiguado" && aux4==false && aux6==false) {

    try {
      aux5=false;
      o1=Float.parseFloat(angulo_de_fase);
      etapa=3;
      angulo_de_fase=angulo_de_fase+" °";
    }
    catch(Exception e) {
      angulo_de_fase="";
      aux5=true;
    }
  }
}

//la grafica de p vs t
void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {

    ellipse(605+x*xspacing, 120+yvalues[x], 10, 10);
  }
}






//grafica de v vs t
void calcWave2() {
  // Increment theta (try different values for 'angular velocity' here
  theta2 += 0.02;

  // For every x value, calculate a y value with sine function
  float x2 = theta2;
  for (int i = 0; i < yvalues2.length; i++) {
    yvalues2[i] = sin(x2)*20;
    x2+=dx2;
  }
}

void renderWave2() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues2.length; x++) {

    ellipse(605+x*xspacing2, 380+yvalues2[x], 10, 10);
  }
}



//graficar a vs t
void calcWave3() {
  // Increment theta (try different values for 'angular velocity' here
  theta3 += 0.02;

  // For every x value, calculate a y value with sine function
  float x3 = theta3;
  for (int i = 0; i < yvalues3.length; i++) {
    yvalues3[i] = sin(x3);
    x3+=dx3;
  }
}

void renderWave3() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues3.length; x++) {

    ellipse(605+x*xspacing3, 600+yvalues3[x], 10, 10);
  }
}
//prueba para git xd
