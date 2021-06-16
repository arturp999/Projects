package pt.uma.arq.game;

import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.utils.Array;
import pt.uma.arq.entities.Fleet;
import pt.uma.arq.entities.Laser;
import pt.uma.arq.entities.PlayerShip;
import pt.uma.arq.entities.SmallShip;
import sun.jvm.hotspot.gc.shared.Space;

import java.security.Key;
import java.util.ArrayList;


import java.lang.reflect.Constructor;
import java.util.ArrayList;


public class Game extends ApplicationAdapter {
    ArrayList<Laser> lasers;
    private SpriteBatch batch;
    private BackgroundManagement backgroundManagement;
    private BitmapFont font;
<<<<<<< HEAD:2ºAno Uni/1º Semestre/Arquitetura de Dispositivos/Primeiro Projeto/GameTemplate/core/src/pt/uma/arq/game/Game.java
    private int x;
=======
>>>>>>> 722efc8a11b35949342335a0725bbf2217bd7a3f:2ºAno Uni/1º Semestre/Arquitetura de Dispositivos/Projeto/GameTemplate/core/src/pt/uma/arq/game/Game.java
    private PlayerShip player;
    private Fleet fleetShips;
    private Laser laser;


    @Override
    public void create() {
<<<<<<< HEAD:2ºAno Uni/1º Semestre/Arquitetura de Dispositivos/Primeiro Projeto/GameTemplate/core/src/pt/uma/arq/game/Game.java
=======
        lasers = new ArrayList<Laser>();
>>>>>>> 722efc8a11b35949342335a0725bbf2217bd7a3f:2ºAno Uni/1º Semestre/Arquitetura de Dispositivos/Projeto/GameTemplate/core/src/pt/uma/arq/game/Game.java
        Gdx.graphics.setWindowedMode(600, 800);
        batch = new SpriteBatch();
        font = new BitmapFont(Gdx.files.internal("gamefont.fnt"),
                Gdx.files.internal("gamefont.png"), false);
///////////////////////////////////////////////////////////
        laser = new Laser(batch);
        laser.create();
///////////////////////////////////////////////////////////
        backgroundManagement = new BackgroundManagement(batch);
        player = new PlayerShip(batch);
        player.create();

    }

    @Override
    public void render() {
        Gdx.gl.glClearColor(0, 0, 0.2f, 1);
        Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
<<<<<<< HEAD:2ºAno Uni/1º Semestre/Arquitetura de Dispositivos/Primeiro Projeto/GameTemplate/core/src/pt/uma/arq/game/Game.java
        /////////////////////////////////////////////////////////////////////////////////////////////
        if (Gdx.input.isKeyPressed(Input.Keys.SPACE)) {
            laser = new Laser(batch);
            laser.create();
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
=======
        //cria novo laser
        if (Gdx.input.isKeyJustPressed(Input.Keys.SPACE)) {
            lasers.add(new Laser(batch,400));
            lasers.add(new Laser(batch,450));
        }
        //update nas balas
        for (Laser laser:lasers){
            laser.update(delta);
            if (laser.remove){
                laser.remove(laser);
            }
        }

>>>>>>> 722efc8a11b35949342335a0725bbf2217bd7a3f:2ºAno Uni/1º Semestre/Arquitetura de Dispositivos/Projeto/GameTemplate/core/src/pt/uma/arq/game/Game.java
        player.moveShip();
        /////////////////////////////////////////////////////////////////////////////////////////////
        batch.begin();
        backgroundManagement.render();
        player.render();

        /////////////////////////////////////////////////////////////////////////////////////////////
        laser.render();
        laser.update();
        /////////////////////////////////////////////////////////////////////////////////////////////

<<<<<<< HEAD:2ºAno Uni/1º Semestre/Arquitetura de Dispositivos/Primeiro Projeto/GameTemplate/core/src/pt/uma/arq/game/Game.java
=======
        // font.draw(batch, "HELLO WORLD", 150, 400);
>>>>>>> 722efc8a11b35949342335a0725bbf2217bd7a3f:2ºAno Uni/1º Semestre/Arquitetura de Dispositivos/Projeto/GameTemplate/core/src/pt/uma/arq/game/Game.java
        font.draw(batch, "PlayerShip.life", 420, 790);

        batch.end();
    }


    @Override
    public void dispose() {
        batch.dispose();
    }
}