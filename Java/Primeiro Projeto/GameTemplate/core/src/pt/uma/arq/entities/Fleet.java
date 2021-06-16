package pt.uma.arq.entities;

import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import pt.uma.arq.game.Animator;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;

public class Fleet {
    protected SmallShip smallShip;
    protected MediumShip mediumShip;
    protected LargeShip largeShip;

    public ArrayList<Ship> ships;

    public Fleet() {
        this.ships = new ArrayList<Ship>();
    }

    public Fleet(ArrayList<Ship> ships){
        this.ships = ships;
    }

    public void create(){

    }




}
