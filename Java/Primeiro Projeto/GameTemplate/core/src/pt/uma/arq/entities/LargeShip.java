package pt.uma.arq.entities;

import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import pt.uma.arq.game.Animator;

public class LargeShip extends Ship{

    public LargeShip(SpriteBatch batch) {
        animator = new Animator(batch,"enemy-big.png",2,1);
    }

    public void create(){
        animator.create();
    }

    public void render(){
        animator.render(x,y);
    }

}
