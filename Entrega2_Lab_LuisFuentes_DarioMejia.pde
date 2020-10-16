import ddf.minim.*;
import grafica.*;
PImage img, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16, img17, img18, img19, img20, img21, img22, img23, img24, img25, img26, img27, img28;
int valor=2, etapa=0, una_sola_vez=0, cont, co=0, presionx=0, presionxd=0, contador=0, conteo=0, condicion=3, instrucciones_una_vez=0, grafica=0;
String caso="sistema amortiguado", t="", amplitud="", frecuencia="", fase_inicial="", pfinal="", vfinal="", tfinal="", masa="", elasticidad="", amortiguamiento="", caso_amortiguado="", angulo_de_fase="";
boolean  mm=true, aux=true, aux2=true, aux3=true, aux4=true, aux5=true, aux6=true, aux7=false, musica=false, presionar, aux_etapa31=true, aux_etapa32=true, aux_etapa33=true, posicion=false, velocidad=false, aceleracion=false, aux_posicion=true, parar=false, gra=false, gra2=false, gra3=false,screenshot=false;;
float f_inicial, o, f, a, t1, n2=1, presion_final, volumen_final, temperatura_final, x1, v, a1, t2, x2, x3, m, b1, k, resultado, resultado2, o1, max=450, min=100;
float posicionx, posiciony;
float y=300, vel=3, cambio=vel, exponente, base, y1=0;

float pos1[]=new float[1000];
float vel1[]=new float[1000];
float ace1[]=new float[1000];
float amplitud1[]=new float[1000];
GPlot plot, plot2, plot3;

GPointsArray myArray = new GPointsArray(0);
GPointsArray myArray2 = new GPointsArray(0);
GPointsArray myArray3 = new GPointsArray(0);


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
  img14=loadImage("lab.png");
  img15=loadImage("cuadrado.png");
  img16=loadImage("resorte.png");
  img17=loadImage("agua.png");
  img18=loadImage("menu.png");
  img19=loadImage("cientifico.png");
  img20=loadImage("atras.png");
  img21=loadImage("adelante.png");
  img22=loadImage("instruccion1.png");
  img23=loadImage("instruccion2.png");
  img24=loadImage("instruccion3.png");
  img25=loadImage("instruccion4.png");
  img26=loadImage("derecha.png");
  img27=loadImage("izquierda.png");
  img28=loadImage("descargar.png");
  audio=new Minim(this);
  reproducir=audio.loadFile("audio1.mp3");
  boton=audio.loadFile("audio2.mp3");


  plot = new GPlot(this, 600, 30, 580, 200);
  plot2 = new GPlot(this, 600, 280, 580, 200);
  plot3 = new GPlot(this, 600, 530, 580, 200);
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
    image(img5, 250, 450, 700, 70);
    text("Continuar", 480, 500);
    image(img5, 250, 540, 700, 70);
    text("Instrucciones", 450, 590);
    image(img5, 250, 630, 700, 70);
    text("Salir", 550, 680);
    image(img18, 150, 50, 900, 300);
    text("osciladores",470,220);
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
      image(img19, 80, 2, 500, 400);

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



      if (resultado==0 || resultado2==b1) {
        caso_amortiguado="amortiguamiento critico";
        condicion=1;
      } else if (b1>resultado2) {
        caso_amortiguado="sobreamortiguamiento";
        condicion=2;
      } else if (b1<resultado2) {
        caso_amortiguado="subamortiguamiento";
        condicion=3;
      }

      caso_amortiguado="amortiguamiento critico"; //quita estas lineas de codigo
      condicion=3; // quita esta linea de codigo vro

      image(img, 0, 0);
      fill(27, 38, 49);
      noStroke();
      rect(80, 30, 1050, 700, 25);

      textSize(50);
      fill(255, 255, 255);
      text("La condicion de su oscilador es de:", 180, 150);
      fill(215, 219, 221);
      rect(250, 180, 700, 300, 25);   
      fill(255, 255, 255);
      textSize(40);
      text(caso_amortiguado, 370, 310);

      image(img5, 250, 500, 700, 100);
      text("continuar", 500, 560);
    }
  }


  //--------------etapa 4 de la simulacion------------------
  else if (etapa==4) {
    background(133, 193, 233);
    plot.setTitleText("P vs T");
    plot2.setTitleText("V vs T");
    plot3.setTitleText("A vs T");

    if (caso=="sistema no amortiguado") {
      image(img14, 0, 0);
      image(img15, 100, 30, 150, 50);
      image(img16, 75, 80, 200, 600-y);
      image(img15, 90, 680-y, 180, 120);
      contador=contador+1;


      if (t1==0) {
        parar=true;
      }

      //--------------hago el contador de cuanto se demora la animacion----------------------------
      if (cont==t1) {
        parar=true;
        textSize(20);
        fill(255, 255, 255);
        text("tiempo: "+t1, 120, 60);
        etapa=5;
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

        myArray.add(cont, pos1[cont]);
        myArray2.add(cont, vel1[cont]);
        myArray3.add(cont, ace1[cont]);
      }
      textSize(20);
      fill(255, 255, 255);




      if (posicion==true) {

        fill(255, 255, 255);
        plot.setTitleText("P vs T");
        fill(215, 219, 221);
        rect(600, 30, 580, 200, 25);
        noStroke();
        fill(215, 219, 221);
        rect(30, 560, 500, 50, 25);
        textSize(20);
        fill(0, 0, 0);

        text("posicion: "+pos1[cont]+" m", 50, 590);    
        plot.setPoints(myArray);
        plot.defaultDraw();
      }

      if (velocidad==true) {

        noStroke();
        fill(255, 255, 255);
        plot2.setTitleText("V vs T");
        fill(215, 219, 221);
        rect(600, 280, 580, 200, 25);
        fill(215, 219, 221);
        rect(30, 620, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        text("velocidad: "+vel1[cont]+" m/s", 50, 650);
        plot2.setPoints(myArray2);
        plot2.defaultDraw();
      }
      if (aceleracion==true) {

        noStroke();
        fill(255, 255, 255);
        plot3.setTitleText("A vs T");
        fill(215, 219, 221);
        rect(600, 530, 580, 200, 25);
        fill(215, 219, 221);
        rect(30, 680, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        text("aceleracion: "+ace1[cont]+" m/s^2", 50, 710);
        plot3.setPoints(myArray3);
        plot3.defaultDraw();
      }
    } else if (caso=="sistema amortiguado") {

      plot.setTitleText("P vs T");
      plot2.setTitleText("V vs T");
      plot3.setTitleText("A vs T");
      image(img14, 0, 0);
      image(img17, -10, 500, 400, 200);
      image(img15, 100, 30, 150, 50);
      image(img16, 75, 80, 200, y); 
      image(img15, 90, y+80, 180, 120);

      contador=contador+1;

      if (t1==0) {
        parar=true;
      }

      //--------------hago el contador de cuanto se demora la animacion----------------------------
      if (cont==t1) {
        parar=true;
        textSize(20);
        fill(255, 255, 255);
        text("tiempo: "+t1, 120, 60);
        etapa=5;
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
        amplitud1[0]=a;
        f_inicial=sqrt(k/m);
        
        pos1[0]=amplitud1[0]*sin(o1);
        vel1[0]=amplitud1[0]*y1*sin(o1)+amplitud1[cont-1]*f*cos(o1);
        amplitud1[cont]=sqrt((pos1[0]*pos1[0])+pow((vel1[0]+y1*pos1[0])/o1, 2));
        pos1[cont]=amplitud1[cont]*exp(-y1*cont)*sin(f*cont+o1);
        vel1[cont]=-y*exp(-y1*cont)*sin(f*cont+o1)+amplitud1[cont]*exp(-y1*cont)*f*cos(f*cont+o1);
        
        f=sqrt(pow(f_inicial, 2)-pow(y1, 2));
        y1=b1/(2*m);


        



        myArray.add(cont, pos1[cont]);
        myArray2.add(cont, vel1[cont]);
        myArray3.add(cont, ace1[cont]);
      }


      //graficas si son subamortiguado
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
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 30, 580, 200, 25);
        noStroke();
        fill(215, 219, 221);
        // rect(30, 560, 500, 50, 25);
        textSize(20);
        fill(0, 0, 0);

        text(amplitud1[0], 50, 100);
        text( f_inicial, 50, 200);
        text(pos1[0], 50, 300);
        text( vel1[0], 50, 400);
        text(amplitud1[cont], 50, 500);
        text(pos1[cont], 50, 600);
        text(f, 50, 650);
        text(y1, 50, 700);


        plot.setPoints(myArray);
        plot.defaultDraw();



        //grafia de velocidad vs tiempo
        noStroke();
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 280, 580, 200, 25);
        fill(215, 219, 221);
        //rect(30, 620, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        //text("velocidad: "+vel1[cont]+" m/s", 50, 650);
        plot2.setPoints(myArray2);
        plot2.defaultDraw();



        //grafica de aceleracion
        noStroke();
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 530, 580, 200, 25);
        fill(215, 219, 221);
        //rect(30, 680, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        // text("aceleracion: "+ace1[cont]+" m/s^2", 50, 710);
        plot3.setPoints(myArray3);
        plot3.defaultDraw();
      } else if (condicion==2) {
        //--------------cambios de velocidad--------------------------
        if (y>max) {
          cambio=vel;

          if (vel>0) {
            vel=vel-0.075;
          }

          if (max!=300) {
            max=max-5;
          }
        }
        if (y<min) {
          cambio=-vel;
        }
        //grafia de posicion
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 30, 580, 200, 25);
        noStroke();
        fill(215, 219, 221);
        // rect(30, 560, 500, 50, 25);
        textSize(20);
        fill(0, 0, 0);
        //text("posicion: "+pos1[cont]+" m", 50, 590);    
        plot.setPoints(myArray);
        plot.defaultDraw();


        //grafia de velocidad vs tiempo
        noStroke();
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 280, 580, 200, 25);
        fill(215, 219, 221);
        //rect(30, 620, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        //text("velocidad: "+vel1[cont]+" m/s", 50, 650);
        plot2.setPoints(myArray2);
        plot2.defaultDraw();


        //grafica de aceleracion
        noStroke();
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 530, 580, 200, 25);
        fill(215, 219, 221);
        //rect(30, 680, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        // text("aceleracion: "+ace1[cont]+" m/s^2", 50, 710);
        plot3.setPoints(myArray3);
        plot3.defaultDraw();
      } else if (condicion==1) {
        //--------------cambios de velocidad--------------------------
        if (y>max) {
          cambio=vel;

          if (vel>0) {
            vel=vel-0.075;
          }

          if (max!=300) {
            max=max-5;
          }
        }
        if (y<min) {
          cambio=-vel;
        }

        //grafia de posicion
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 30, 580, 200, 25);
        noStroke();
        fill(215, 219, 221);
        // rect(30, 560, 500, 50, 25);
        textSize(20);
        fill(0, 0, 0);
        //text("posicion: "+pos1[cont]+" m", 50, 590);    
        plot.setPoints(myArray);
        plot.defaultDraw();


        //grafia de velocidad vs tiempo
        noStroke();
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 280, 580, 200, 25);
        fill(215, 219, 221);
        //rect(30, 620, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        //text("velocidad: "+vel1[cont]+" m/s", 50, 650);
        plot2.setPoints(myArray2);
        plot2.defaultDraw();


        //grafica de aceleracion
        noStroke();
        fill(255, 255, 255);
        fill(215, 219, 221);
        rect(600, 530, 580, 200, 25);
        fill(215, 219, 221);
        //rect(30, 680, 500, 50, 25);
        fill(0, 0, 0);
        textSize(20);
        // text("aceleracion: "+ace1[cont]+" m/s^2", 50, 710);
        plot3.setPoints(myArray3);
        plot3.defaultDraw();
      }
    }
  } else if (etapa==10) {
    image(img22, 0, 0);
    image(img21, 1000, 50, 100, 100);
  } else if (etapa==11) {
    image(img23, 0, 0);
    image(img20, 100, 50, 100, 100);
    image(img21, 1000, 50, 100, 100);
    instrucciones_una_vez=0;
  } else if (etapa==12) {
    image(img24, 0, 0);
    image(img20, 100, 50, 100, 100);
    image(img21, 1000, 50, 100, 100);
    instrucciones_una_vez=0;
  } else if (etapa==13) {
    image(img25, 0, 0);
    image(img20, 100, 50, 100, 100);
    image(img5, 350, 600, 500, 100);
    text("finalizar", 510, 670);
  } else if (etapa==5) {
    image(img2, 0, 0);
  
  if(caso=="sistema amortiguado"){
    gra=true;
    gra2=true;
    gra3=true;
    grafica=1;
  }

    if (grafica==1 && gra==true) {
      plot = new GPlot(this, 150, 80, 900, 600);
      plot.setTitleText("P vs T");
      plot.setPoints(myArray);
      plot.defaultDraw();
      plot.activatePanning();
    } else if (grafica==2 && gra2==true) {
      plot2 = new GPlot(this, 150, 80, 900, 600);
      plot2.setTitleText("V vs T");
      plot2.setPoints(myArray2);
      plot2.defaultDraw();
      plot2.activatePanning();
    } else if (grafica==3 && gra3==true) {
      plot3 = new GPlot(this, 150, 80, 900, 600);
      plot3.setTitleText("A vs T");
      plot3.setPoints(myArray3);
      plot3.defaultDraw();
      plot3.activatePanning();
    }
    
    
    //-----------guardar las imagenes de las graficas--------------
    if(screenshot==true && grafica==1){
    plot = new GPlot(this, 0, 0, 1200, 750);
    plot.setPoints(myArray);
    plot.defaultDraw();
    save("sistema no amortiguado/P vs T.jpg");
    plot = new GPlot(this, 150, 80, 900, 600);
    screenshot=false;
  }
  
     if(screenshot==true && grafica==2){
    plot2 = new GPlot(this, 0, 0, 1200, 750);
    plot2.setPoints(myArray);
    plot2.defaultDraw();
    save("sistema no amortiguado/V vs T.jpg");
    plot2 = new GPlot(this, 150, 80, 900, 600);
    screenshot=false;
  }
  
     if(screenshot==true && grafica==3){
    plot3 = new GPlot(this, 0, 0, 1200, 750);
    plot3.setPoints(myArray);
    plot3.defaultDraw();
    save("sistema no amortiguado/A vs T.jpg");
    plot3 = new GPlot(this, 150, 80, 900, 600);
    screenshot=false;
  }
    

    image(img26, 1070, 300, 100, 100);
    image(img27, 30, 300, 100, 100);
    image(img28, 1000, 82, 45, 45);
  }
}

void keyPressed() {
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
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux2==true && aux==false && aux2==true && aux==false && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    amplitud=amplitud+key;
    conteo=amplitud.length();
    if (conteo>20) {
      aux2=false;
      amplitud1[0]=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
  }  


  //---------------------para ingresar los datos del frecuencia ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux3==true && aux2==false && aux3==true && aux==false && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    frecuencia=frecuencia+key;
    conteo=frecuencia.length();
    if (conteo>17) {
      aux3=false;
      f=Float.parseFloat(frecuencia);
      frecuencia=frecuencia+" rads/s";
    }
  }  


  //---------------------para ingresar los datos de la fase inicial ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux4==true && aux3==false && aux2==false && aux==false && aux4==true && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
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
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux3==true && aux2==false && aux3==true && aux==false && caso=="sistema amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    elasticidad=elasticidad+key;
    conteo=elasticidad.length();
    if (conteo>17) {
      aux3=false;
      k=Float.parseFloat(elasticidad);
      elasticidad=elasticidad+" N/m";
    }
  }  


  //---------------------para ingresar los datos de la constante de amortiguamineto ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux4==true && aux3==false && aux2==false && aux==false && aux4==true && caso=="sistema amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    amortiguamiento=amortiguamiento+key;
    conteo=amortiguamiento.length();
    if (conteo>18) {
      aux4=false;
      b1=Float.parseFloat(amortiguamiento);
      amortiguamiento=amortiguamiento+" kg/s";
    }
  }

  //---------------------para ingresar los datos de la amplitud ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && aux3==false && aux2==false && aux==false && aux6==true && caso=="sistema amortiguado" && aux4==false && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    amplitud=amplitud+key;
    conteo=amplitud.length();
    if (conteo>18) {
      aux6=false;
      a=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
  }


  //---------------------para ingresar los datos del angulo de fase ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux5==true && aux3==false && aux2==false && aux==false && aux5==true && caso=="sistema amortiguado" && aux4==false && aux6==false && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
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
  if (mouseX>900 && mouseX<1000 && mouseY>300 && mouseY<400 && valor<2 && etapa==1) {
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
    grafica=1;
    gra=true;
  }

  if (mouseX>700 && mouseX<780 && mouseY>340 && mouseY<420 && etapa==3 && aux_etapa32==true) {
    velocidad=true;
    aux_etapa32=false;
    grafica=2;
    gra2=true;
  }

  if (mouseX>700 && mouseX<780 && mouseY>490 && mouseY<570 && etapa==3 && aux_etapa33==true) {
    aceleracion=true;
    aux_etapa33=false;
    grafica=3;
    gra3=true;
  }

  if (mouseX>250 && mouseX<950 && mouseY>600 && mouseY<700 && etapa==3 && (aceleracion==true || posicion==true || velocidad==true)) {
    etapa=4;
  }

  //sistema amortiguado acpetar de la etapa 3
  if (mouseX>250 && mouseX<950 && mouseY>500 && mouseY<600 && etapa==3 && caso=="sistema amortiguado") {
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
  // ------------------- los controles para el inicio del programa----------------------
  if (mouseX>250 && mouseX<950 && mouseY>450 && mouseY<520 && una_sola_vez==0 && etapa==0) {
    etapa=1; // cambiar el 4 por el 1
    una_sola_vez=1;
  }

  // ------------------- los controles para ir a las instrucciones----------------------
  if (mouseX>250 && mouseX<950 && mouseY>540 && mouseY<610 && etapa==0) {
    etapa=10;
  }

  // ------------------- los controles para salir del programa----------------------
  if (mouseX>250 && mouseX<950 && mouseY>630 && mouseY<700 && etapa==0) {
    exit();
  }

  // ------------------- los controles para las instrucciones----------------------
  if (mouseX>1000 && mouseX<1100 && mouseY>50 && mouseY<150 && etapa==10) {
    etapa=11;
    instrucciones_una_vez=1;
  }

  if (mouseX>1000 && mouseX<1100 && mouseY>50 && mouseY<150 && etapa==11 && instrucciones_una_vez==0) {
    etapa=12;
    instrucciones_una_vez=1;
  }
  if (mouseX>100 && mouseX<200 && mouseY>50 && mouseY<150 && etapa==11) {
    etapa=10;
  }

  if (mouseX>1000 && mouseX<1100 && mouseY>50 && mouseY<150 && etapa==12 && instrucciones_una_vez==0) {
    etapa=13;
    instrucciones_una_vez=1;
  }
  if (mouseX>100 && mouseX<200 && mouseY>50 && mouseY<150 && etapa==12) {
    etapa=11;
  }
  if (mouseX>100 && mouseX<200 && mouseY>50 && mouseY<150 && etapa==13) {
    etapa=12;
  }
  if (mouseX>350 && mouseX<850 && mouseY>600 && mouseY<700 && etapa==13) {
    etapa=1;
  }

  //-----------------------graficas de la etapa 4--------------------------------------- 
  if (mouseX>1070 && mouseX<1170 && mouseY>300 && mouseY<400 && etapa==5 && grafica>=1 && grafica<=2 && (gra2==true || gra3==true)) {
    grafica=grafica+1;
  }
  if (mouseX>30 && mouseX<130 && mouseY>300 && mouseY<400 && etapa==5 && grafica<=3 && grafica>=2 && (gra==true || gra2==true)) {
    grafica=grafica-1;
  }

  //----------------------------boton de descarga-----------------------------------
  if (mouseX>1000 && mouseX<1045 && mouseY>82 && mouseY<127 && etapa==5) {
     screenshot=true;
  }
}
