import processing.sound.*;
import javax.swing.JOptionPane;

SoundEngine sound_engine;
ArrayList<SoundFile> sounds;

void setup() {
    sounds = new ArrayList<SoundFile>();

    sound_engine = new SoundEngine();
    sound_engine.set_sound_path("C:/Users/david/AppData/Local/SuperCollider/downloaded-quarks/Dirt-Samples");
}

void draw() {
    playSounds();
}

void keyPressed() {
    switch (key) {
        case 'a':
            addSound(JOptionPane.showInputDialog("Enter a sound name", JOptionPane.QUESTION_MESSAGE));
            break;
    }
}

void playSounds() {
    for (SoundFile sound : sounds) {
        sound.play();
    }
}

void addSound(String name) {
    String[] args = name.split(":");
    String sound;
    if (args.length > 1) {
        sound = sound_engine.sound(args[0], Integer.parseInt(args[1]));
    } else {
        sound = sound_engine.sound(args[0]);
    }
    if(sound != null) {
        sounds.add(new SoundFile(this, sound));
    } else {
        println("Sound not found");
    }
}