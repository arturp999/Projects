package pt.uma.arq.entities;

import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import pt.uma.arq.game.Animator;

public class SmallShip extends Ship{

    public SmallShip(SpriteBatch batch) {
        animator = new Animator(batch,"enemy-small.png",2,1);
    }


    public void create(){
      //  x = 300;
     //   y = 700;
        animator.create();
    }

    public void render(){
        animator.render(x,y);
    }

}
