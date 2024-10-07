# 🧠 Smooth Brain Girl 🧒 

Smooth Brain Girl is a Processing-based repository that supports Angela Liu (Nichestitution)'s lecture performance on 5 & 6 October 2024 as part of the exhibition "Our LARPers Crashed" at Current Plans, Hong Kong. 
The code part receives the message sent to the Nichestistution's Twitch chatbox, and then modifies them according to the "Smooth Brain Girl" dictionary before displaying the message on the Processing canvas.

The Processing sketch contains:
### 1. `twitch_setup.pde`: establishes Socket connection with Twitch account
### 2. `word_config.pde` and `image_config.pde`: establishes the dictionary of keyword that could trigger a modified word and image
### 3. `smooth_brain_girl.pde`: the main sketch

## Required Libraries 
1. Video for Processing
2. HTTP Requests
3. oscP5

## Direction of Use
1. Please replace the Twitch credentials at `twitch_setup.pde`:
```
String nick = "x"; // Your Twitch username
String oauth = "oauth:x"; // Your OAuth token with "oauth:" prefix
String channel = "#x"; // Twitch channel (must include the #)
```
2. Please replace the camera with the correct index in the list (The code printed the list of cameras available) at `smooth_brain_girl.pde`:

```
    cam = new Capture(this, cameras[0]);
```

3. Press the play button on Processing
