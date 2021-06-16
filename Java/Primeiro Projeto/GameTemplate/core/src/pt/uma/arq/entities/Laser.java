package pt.uma.arq.entities;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import pt.uma.arq.game.Animator;


public class Laser {
    public static final int SPEED = 500;
    protected Animator animator;
    int y;
    int x;
    public boolean remove = false;

    public Laser(SpriteBatch batch) {
           this.animator = new Animator(batch, "laser-bolts.png", 2, 2);
    }

    public void update() {
        y += 3;//vai defenir a velocidade
        if (y > Gdx.graphics.getHeight()){
            remove = true;
        }
    }
    public void create(){
        this.x = PlayerShip.x;
        this.y = 40;
        animator.create();
    }

    public void render() {
            animator.render(x,y);
    }


}

