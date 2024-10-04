HashMap<String, String> censoredWordsMap = new HashMap<String, String>();

PImage selectedEffectImage;

String[][] angelAffirmationWords = {
    {"mecore", "#mecore☁️"},
    {"vessel", "🫧vessel🎐"},
    {"said so", "said🗣️so"},
    {"lucky girl syndrome", "🍀🍀lucky girl syndrome🧧🪅"},
    {"abundance", "🍊abundance🌊🧧"},
    {"lovepilled", "💘lovepilled💊"},
    {"kindness-maxxed", "🤲🏻kindness-maxxed💗"},
    {"maxxed (detect even without spacing)", "maxxed🫀"},
    {"hopecore", "🛐hopecore🕊"},
    {"Core", "core🤓☝🏻"},
    {"dream", "🛜dream🌐"},
    {"lore", "lore🎒"},
    {"empathy", "empathy🛜🤍"},
    {"femcel", "🙅🏻‍♀️femcel🧶"},
    {"cyber fairy", "🦠cyber fairy🎛️🪽"},
    {"hysterical", "😻hysterical😽"},
    {"Hysteria", "😻hysteria😽"},
    {"I'm just a girl", "i'm just a girl🐇🎀"},
    {"Im just a girl", "i'm just a girl🐇🎀"},
    {"I love you", "❤️💗i love you smsmsmsm💕💙💜💛💖💚❣️💓🧡💘💝"},
    {"LOVE", "❤️‍🩹💟LOVE❣️🚨"},
    {"222", "2️⃣2️⃣2️⃣🪽"},
    {"ANGEL", "👼🏻👼🏻👼🏻"},
    {"soul mate", "🧶soul mate💍📳"},
    {"soulmate", "🧶soul mate💍📳"},
    {"chronic twin pain", "❤️‍🩹chronic twin pain👯"},
    {"Twin flame", "Twin pain"},
    {"888", ""},
    {"Angelic frequency pyramid", ""},
    {"0909", ""},
    {"universe", ""},
    {"Lobotomy", ""},
    {"steal", ""},
    {"accelerate", ""},
    {"Lock in", ""},
    {"affirm", ""},
    {"I am a girl", "i'm just a girl🐇🎀"},
    {"I'm a girl", "i'm just a girl🐇🎀"},
    {"Im a girl", "i'm just a girl🐇🎀"}
};

String[][] publicAffirmationWords = {
    {"public", "#public☁️"},
};

String[] cuteWords = {
  "cute"
};

String[] cuteImagePaths = {
  "cute/animal stats.gif",
    "cute/bunny ears.gif",
  "cute/bunny flock 3.gif",
  "cute/bunny twin jump.gif",
  "cute/cat kissing.gif",
  "cute/HK bow.gif",
    "cute/HK peephole.gif",
  "cute/paws.gif"
};

PImage[] cuteImages = new PImage[cuteImagePaths.length];

String[] loveWords = {
  "love"
};

String[] loveImagePaths = {
  "love/heart full 2.gif",
    "love/heart full 3.gif",
  "love/heart full.gif",
  "love/hearts float 2.gif",
  "love/hearts frame 2.gif",
  "love/hearts frame.gif",
    "love/hello kitty lover.jpg",
  "love/HK peephole.gif",
    "love/two girls stack.gif"
};

PImage[] loveImages = new PImage[loveImagePaths.length];

String[] ascendWords = {
  "ascend"
};

String[] ascendImagePaths = {
  "ascend/angel static.jpg",
    "ascend/angel stats.gif",
  "ascend/bubbles.gif",
  "ascend/cloud frame.gif",
  "ascend/HK fairy.gif",
  "ascend/savior.gif",
    "ascend/wing 1.gif",
};

PImage[] ascendImages = new PImage[ascendImagePaths.length];
