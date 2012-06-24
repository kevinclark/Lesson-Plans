# Galaga

[Galaga](http://en.wikipedia.org/wiki/Galaga) is a classic arcade game that first appeared in 1979, as a sequal to Galaxian. The goal of the game is to pilot your space ship, shooting down flying aliens, while avoiding their missiles. Desispite being relased 33 years ago, Galaga and similar spinoffs are still popular, appearing on smartphones and Xbox Live Arcade.

This tutorial teaches you how to build a simplified version of Galaga. You'll need a copy of the lite version of GameMaker.

---

#### [Download for **Windows**](http://www.yoyogames.com/gamemaker/windows) | [Download for **Mac**](http://www.yoyogames.com/gamemaker/mac)

#### Download the [demo files]()

---

### Create SPAAAAAACE



The first thing we need to do is create the "room" our game happens in.

  1. Create a new background by clicking on the ![New Background](http://share.cameronmcefee.com/screencap/background-20120624-091130.png) New Background button.

  2. In the window that pops up, call the background "space" and click on the *Load Background* button and open the `demo-files/backgrounds/space.png` file. Click *OK*.

  3. Create a new room by clicking on the ![New Room](http://share.cameronmcefee.com/screencap/room-20120624-092036.png) New Room button.

  4. In the window that pops up, name the room "space" and select your new "space" background from the dropdown list. Also, set the *Vert. Speed* to `2`.
  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.21.31_AM-20120624-092217.png)

  5. Click the green checkmark in the top left corner of the window to save the settings.

  6. Save your file and click on the ![Run button](http://share.cameronmcefee.com/screencap/run-20120624-092510.png) Run button. You should see space flying past.

### Add your space ship

Let's add your space ship and get it flying around.

  1. Create a new background by clicking on the ![New Sprite](http://share.cameronmcefee.com/screencap/sprite-20120624-093045.png) New Sprite button.

  2. In the window that pops up, name the sprite "ship". Click on *Load Sprite* and open the file `demo-files/sprites/ship.png`. Make sure *Transparent* is checked. Click *OK*.

  3. Create a new object by clicking on the ![New Object](http://share.cameronmcefee.com/screencap/object-20120624-093430.png) New Object button.

  4. In the window that pops up, call the new object "ship" and select the "ship" sprite from the dropdown list.

  5. Click on the *Add Event* button and add "Keyboard" events for *\<no key\>*, *\<Left\>*, and *\<Right\>*. Also add an event for *Other > Intersect Boundary*

    1. For the *\<no key\>* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move Fixed event and give it a "stop" direction and "0" speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.40.41_AM-20120624-094051.png)

    2. For the *\<Left\>* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move Fixed event and give it a "left" direction and "10" speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.42.47_AM-20120624-094301.png)

    3. For the *\<Right\>* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move Fixed event and give it a "right" direction and "10" speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.43.35_AM-20120624-094348.png)

    4. For the *Intersect Boundary* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move Fixed event and give it a "right" direction and "10" speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.40.41_AM-20120624-094051.png)

  6. Save your file and click on the ![Run button](http://share.cameronmcefee.com/screencap/run-20120624-092510.png) Run button. Click on the window and press the left and right keys. Your ship will fly around space!