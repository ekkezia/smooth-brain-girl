HashMap<String, String> censoredWordsMap = new HashMap<String, String>();

HashMap<String, PImage> censoredImageMap = new HashMap<String, PImage>(); 
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

String[][] pngWords = {
  {"love", "heart.png"}
};
