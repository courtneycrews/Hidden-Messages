color[] cols = {#BF1140, #F4607A, #F22E9A,#D966D1, #F24822}; // Change random colors here
color col = #219ebc; // Change single color here
color bg = #01053D; // Change background color here

String letters = "abcdefghijklmnopqrstuvwxyz";
String[] punc = {"comma", "period", "space", "quotes", "exclamation", "question", "ellipses"};

int glyphCount = letters.length() + punc.length;
PShape[] glyphs = new PShape[glyphCount];
int j;

String t = "What is the best that could happen?"; //Write your message here
float margin = 50;
float cellw;

void setup() {
  size(800, 800);
  background(bg);

  // Load glyphs
  for (int i = 0; i < glyphs.length - punc.length; i++) {
    glyphs[i] = loadShape(letters.charAt(i) + ".svg");
    glyphs[i].disableStyle();
  }

  j = 0;
  for (int i = 26; i < glyphs.length; i++) {
    glyphs[i] = loadShape(punc[j] + ".svg");
    glyphs[i].disableStyle();
    j++;
  }

  // Clean message and get dimensions
  t = t.toLowerCase();
  int colCount = ceil(sqrt(t.length()));
  int rowCount = ceil((float)t.length() / colCount);
  cellw = min((width - margin * 2) / colCount, (height - margin * 2) / rowCount);

  // Calculate grid offset to center
  float gridWidth = colCount * cellw;
  float gridHeight = rowCount * cellw;
  float xStart = (width - gridWidth) / 2;
  float yStart = (height - gridHeight) / 2;

  // Draw each glyph
  for (int i = 0; i < t.length(); i++) {
    char letter = t.charAt(i);

    float x = xStart + (i % colCount) * cellw;
    float y = yStart + floor(i / colCount) * cellw;
  
  // Use single color
    //fill(col);
    //noStroke();
    
  // Use randomized multi-color array
     // stroke(cols[(int)random(cols.length)]);
     fill(cols[(int)random(cols.length)]);
     noStroke();

    switch(letter) {
      case ',':
        shape(glyphs[26], x, y, cellw, cellw);
        break;
      case '.':
        shape(glyphs[27], x, y, cellw, cellw);
        break;
      case ' ':
        shape(glyphs[28], x, y, cellw, cellw);
        break;
      case '"':
        shape(glyphs[29], x, y, cellw, cellw);
        break;
      case '!':
        shape(glyphs[30], x, y, cellw, cellw);
        break;
      case '?':
        shape(glyphs[31], x, y, cellw, cellw);
        break;
      default:
        for (int j = 0; j < letters.length(); j++) {
          if (letter == letters.charAt(j)) {
            shape(glyphs[j], x, y, cellw, cellw);
            break;
          }
        }
    }
  }
}

void draw() {
}

// Save reference image by pressing 's' on the keyboard
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("hidden_message_####.png");
    println("Saved image!");
  }
}
