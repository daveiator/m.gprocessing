//language == processing


import java.awt.MouseInfo;
import java.awt.Frame;
import java.awt.Component;
import com.jogamp.nativewindow.util.Point;
import com.jogamp.newt.opengl.GLWindow;
class dynWindow {

    int x, y, w, h;
    String title;
    Point buttonSize, screenSize;
    

    public dynWindow (int x, int y, int w, int h, String title) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.title = title;
        this.buttonSize = new Point(90, 40);

        //Create
        //setTitle(title);
        
        //get screen size
        this.screenSize = new Point(displayWidth, displayHeight);
    }


    public boolean moveWindowOnCursor() {
        //move the window if cursor hovers over the close button

        if (1==1) {
            //get mouse position
            java.awt.Point mouse;
            mouse = MouseInfo.getPointerInfo().getLocation();
            Point pMouse = new Point(mouse.x, mouse.y);

            //get window position           
            GLWindow window = (GLWindow)(((PSurfaceJOGL)surface).getNative());
            Point pWindow = window.getLocationOnScreen(new Point());

            //get button position
            Point xRelWindow[] = {
                new Point(pWindow.getX() + width - buttonSize.getX(), pWindow.getY() - buttonSize.getY()),
                new Point(pWindow.getX() + width, pWindow.getY())
            };


            //check if cursor is near the button
            Point tolerance = new Point(10, 10);
            if (pMouse.getX() > xRelWindow[0].getX() - tolerance.getX() && pMouse.getX() < xRelWindow[0].getX() + buttonSize.getX() + tolerance.getX() &&
                pMouse.getY() > xRelWindow[0].getY() - tolerance.getY() && pMouse.getY() < xRelWindow[0].getY() + buttonSize.getY() + tolerance.getY()) {
                //move window randomly
                moveWindowGlobal(int(random(screenSize.getX()-width)), int(random(buttonSize.getY(), screenSize.getY()-height)));

                return true;
            }


            //Debug
            /*
                text("x: " + pWindow.getX() + " y: " + pWindow.getY(), 10, 10);
                text("x: " + pMouse.getX() + " y: " + pMouse.getY(), 10, 30);
                text("x: " + xRelWindow[0].getX() + " y: " + xRelWindow[0].getY(), 10, 50);
                text("x: " + xRelWindow[1].getX() + " y: " + xRelWindow[1].getY(), 10, 70);
            */
        }
        return false;
    }

    private void moveWindowGlobal(int _x, int _y) {
        //move the window to a global position
        GLWindow window = (GLWindow)(((PSurfaceJOGL)surface).getNative());
        window.setPosition(_x, _y);
    }
}