package pt.uma.arq.game;

import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class BackgroundManagement {

    private Texture background;
    private Sprite sprite;
    SpriteBatch spriteBatch;

    public BackgroundManagement(SpriteBatch batch) {
        this.spriteBatch = batch;
        background = new Texture("space.png");
        sprite = new Sprite(background);
        sprite.setPosition(0, 0);
    }

    public void render() {
        sprite.draw(spriteBatch);
    }

}
