package pt.uma.arq.entities;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import pt.uma.arq.game.Animator;

public class PlayerShip extends Ship {
    protected int life;
    public static int x;
    protected int y;

    public PlayerShip(SpriteBatch batch) {
        animator = new Animator(batch, "ship.png", 5, 2);
    }

    public void create() {
        life = 100;
        this.x = 300;
        this.y = y;
        animator.create();
    }

    public void render() {
        animator.render(x, y);
    }

    public void moveShip() {
        if (Gdx.input.isKeyPressed(Input.Keys.LEFT)) {
            x -= 10;
        } else if (Gdx.input.isKeyPressed(Input.Keys.RIGHT)) {
            x += 10;
        }
        if (x > 600) {
            x = 0;
        } else if (x < 0){
            x = 600;
        }

    }
}
