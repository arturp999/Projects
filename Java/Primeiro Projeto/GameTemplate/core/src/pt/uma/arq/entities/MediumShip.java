package pt.uma.arq.entities;

import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import pt.uma.arq.game.Animator;

public class MediumShip extends Ship{

    public MediumShip(SpriteBatch batch) {
        animator = new Animator(batch,"enemy-medium.png",2,1);
    }

    public void create(){
        animator.create();
    }

    public void render(){
        animator.render(x,y);
    }
}
