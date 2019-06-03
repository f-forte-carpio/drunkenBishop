
PFont courier;
String testing="00:00:00:00:f0:00:0e:00:10:90:bf:aa:00:00:00:00";
String[]t=splitTokens(testing, ":");
String bi;
int rectX=8, rectY=4, rectSize=40;
int[] rectangles=new int[153];
int[][]grid =new int[17][9];
int coord=rectX+(rectY*17);

void setup() {
  courier=loadFont("CourierNewPS-BoldMT-48.vlw");
  rectangles[0]=coord;
  size(700, 440);
  background(0);
  int num=1;
  for (String i : t) {

    bi=binary(unhex(i), 8);
    while (bi.length()!=0) {

      if (bi.charAt(bi.length()-1)=='0' && bi.charAt(bi.length()-2)=='0') {
        rectX--;
        rectY--;
        bi=bi.substring(0, bi.length()-2);
      } else if (bi.charAt(bi.length()-1)=='0' && bi.charAt(bi.length()-2)=='1') {
        rectX--;
        rectY++;
        bi=bi.substring(0, bi.length()-2);
      } else if (bi.charAt(bi.length()-1)=='1' && bi.charAt(bi.length()-2)=='0') {
        rectX++;
        rectY--;
        bi=bi.substring(0, bi.length()-2);
      } else {
        //(bi.charAt(bi.length()-1)=='1' && bi.charAt(bi.length()-2)=='1')
        rectX++;
        rectY++;
        bi=bi.substring(0, bi.length()-2);
      }
      if (rectX<0) {
        rectX++;
      }
      if (rectX>grid.length-1) {
        rectX--;
      }
      if (rectY<0) {
        rectY++;
      }
      if (rectY>grid[0].length-1) {
        rectY--;
      }
      coord=rectX+(rectY*17);
      rectangles[num]=coord;
      num++;
    }
  }
}
void draw() {
  noStroke();
  background(0);
  for (int i=1; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      int m=0;
      for (int k=0; k<rectangles.length; k++) {
        if (rectangles[k]==i+j*17) {
          m++;
        }
      }
      grid[i][j]=m;
    }
  }
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      char c;
      if (grid[i][j]==0) {
        c=' ';
      } else if (grid[i][j]==1) {
        c='.';
      } else if (grid[i][j]==2) {
        c='o';
      } else if (grid[i][j]==3) {
        c='+';
      } else if (grid[i][j]==4) {
        c='=';
      } else if (grid[i][j]==5) {
        c='*';
      } else if (grid[i][j]==6) {
        c='B';
      } else if (grid[i][j]==7) {
        c='O';
      } else if (grid[i][j]==8) {
        c='X';
      } else if (grid[i][j]==9) {
        c='@';
      } else if (grid[i][j]==10) {
        c='%';
      } else if (grid[i][j]==11) {
        c='&';
      } else if (grid[i][j]==12) {
        c='#';
      } else if (grid[i][j]==13) {
        c='/';
      } else if (grid[i][j]==14) {
        c='^';
      } else if (grid[i][j]==15) {
        c='_';
      } else {
        c='<';
      }
      if (rectangles[0]==i+j*17) {
        c='S';
      } else if (rectangles[64]==i+j*17) {
        c='E';
      }
      fill(255);
      textFont(courier, rectSize);
      text(c, i*(rectSize), j*(rectSize)+2*rectSize);
    }
  }
}
