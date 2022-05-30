import processing.sound.*;

class SoundEngine {
    File sound_path;
    String[] folders;

    public SoundEngine() {
        sound_path = new File("./sounds/");
        folders = sound_path.list();
    }

    public void set_sound_path(String path) {
        sound_path = new File(path);
        folders = sound_path.list();
    }

    public String sound(String sound_name) {
        //find folder
        for (int i = 0; i < folders.length; i++) {
            if (folders[i].startsWith(sound_name)) {
                if(is_sound_file(folders[i])) {
                    //is sound file
                    return sound_path.getAbsolutePath() + "/" + folders[i];
                }
                //is folder
                File sub_folder = new File(sound_path.getAbsolutePath() + "/" + folders[i]);
                String[] sub_files = sub_folder.list();
                return sub_folder.getAbsolutePath() + "/" +  sub_files[int(random(sub_files.length))];
            }
        }
        return null;
    }

    public String sound(String sound_name, int index) {
        //is folder (is expected)
        File sub_folder = new File(sound_path.getAbsolutePath() + "/" + sound_name);
        String[] sub_files = sub_folder.list();
        index = min(sub_files.length - 1, max(0, index));
        return sub_folder.getAbsolutePath() + "/" + sub_files[index];
    }

    private boolean is_sound_file(String file_name) {
        String[] sound_extentions = {".wav", ".mp3", ".aif", ".aiff"};

        for (int i = 0; i < sound_extentions.length; i++) {
            if (file_name.endsWith(sound_extentions[i])) {
                return true;
            }
        }
        return false;
    }
}