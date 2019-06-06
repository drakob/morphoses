/*
Things to Work on:
 - Bubbles = data points. 1 bubble per column
 - Shows 1 row of data at a time
 - Press button to switch to next row
 - bubble size scales based on data in row/column
 - display through text: which row it's on currently/how much time has collapsed (column 0)
 
 */

Table weights;
int currentRow = 13;
float bubbleSize;
Bubble[] bubbles;

void setup() {
  size(3000, 1500);
  loadData();
}

void draw() {
  background(255);
  //displays bubbles
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].display();
  }
}

void loadData() {
  //loads table into processing data
  weights = loadTable("report_test1_zerospeed.csv", "header");
  
  //array size set to number of columns in the table
  bubbles = new Bubble[weights.getColumnCount()];
  
  //creates bubbles
  for (int i = 0; i < bubbles.length; i++) {
    //changes size based on what row + column each bubble is on. i represents which column each bubble is assigned to
    bubbleSize = 10 + (10 * weights.getFloat(currentRow,i));
    bubbles[i] = new Bubble(random(50, width-50), random(50, height-50), bubbleSize);
  }
  /*int rowCount = 0;
   for(TableRow row : weights.rows()){
   Float a = row.getFloat(4);
   println(a);
   }
   */


  //println(weights.getRowCount() + " total rows in table");
  //println(weights.getColumnCount() + " total columns in table");
}

void mousePressed(){
  currentRow ++;
  
  if (currentRow >= 27){
   currentRow = 0; 
  }
    //changes bubble size based on what row's info is being displayed
  for (int i = 0; i < bubbles.length; i++) {
    bubbleSize = 10 + (10 * weights.getFloat(currentRow,i));
    bubbles[i].setSize(bubbleSize);
  }
}
