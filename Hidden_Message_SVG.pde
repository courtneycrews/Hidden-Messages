import processing.svg.*;

color col = #219ebc; // change single color here

String letters = "abcdefghijklmnopqrstuvwxyz";
String[] punc = {"comma", "period", "space", "quotes", "exclamation", "question"};

int glyphCount = letters.length() + punc.length;
PShape[] glyphs = new PShape[glyphCount];
int j;

String t = "What is the best that could happen?"; // Write your message here
float margin = 50;
float cellw;

void setup() {
  PGraphics pg = createGraphics(800, 800, SVG);
  ((PGraphicsSVG)pg).setPath(sketchPath("hidden_message.svg"));
  pg.beginDraw();

  // Optional: no background = transparent
  // pg.background(255); // Uncomment if you want a white background

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

  // Layout calculations
  t = t.toLowerCase();
  int colCount = ceil(sqrt(t.length()));
  int rowCount = ceil((float)t.length() / colCount);
  cellw = min((800 - margin * 2) / colCount, (800 - margin * 2) / rowCount);

  float gridWidth = colCount * cellw;
  float gridHeight = rowCount * cellw;
  float xStart = (800 - gridWidth) / 2;
  float yStart = (800 - gridHeight) / 2;

  for (int i = 0; i < t.length(); i++) {
    char letter = t.charAt(i);

    float x = xStart + (i % colCount) * cellw;
    float y = yStart + floor(i / colCount) * cellw;

    pg.fill(col);

    switch (letter) {
      case ',':
        pg.shape(glyphs[26], x, y, cellw, cellw);
        break;
      case '.':
        pg.shape(glyphs[27], x, y, cellw, cellw);
        break;
      case ' ':
        pg.shape(glyphs[28], x, y, cellw, cellw);
        break;
      case '"':
        pg.shape(glyphs[29], x, y, cellw, cellw);
        break;
      case '!':
        pg.shape(glyphs[30], x, y, cellw, cellw);
        break;
      case '?':
        pg.shape(glyphs[31], x, y, cellw, cellw);
        break;
      default:
        for (int j = 0; j < letters.length(); j++) {
          if (letter == letters.charAt(j)) {
            pg.shape(glyphs[j], x, y, cellw, cellw);
            break;
          }
        }
    }
  }

  pg.endDraw();
  println("✅ SVG saved as 'hidden_message.svg'");
  exit();
}
