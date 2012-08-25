# Galaga

![](http://upload.wikimedia.org/wikipedia/en/thumb/2/2a/Galaga.png/220px-Galaga.png)

[Galaga](http://en.wikipedia.org/wiki/Galaga) is a classic arcade game that first appeared in 1979, as a sequal to Galaxian. The goal of the game is to pilot your space ship, shooting down flying aliens, while avoiding their missiles. Desispite being relased 33 years ago, Galaga and similar spinoffs are still popular, appearing on smartphones and Xbox Live Arcade.

This tutorial teaches you how to build a simplified version of Galaga. You'll need a copy of the lite version of GameMaker.

---

#### [Download for **Windows**](http://www.yoyogames.com/gamemaker/windows) | [Download for **Mac**](http://www.yoyogames.com/gamemaker/mac)

#### Download the [demo files](https://github.com/cameronmcefee/Lesson-Plans/blob/master/galaga/demo-files.zip?raw=true)

---

### Create SPAAAAAACE



The first thing we need to do is create the "room" our game happens in.

  1. Create a new background by clicking on the ![New Background](http://share.cameronmcefee.com/screencap/background-20120624-091130.png) New Background button.

  2. In the window that pops up, call the background `space` and click on the *Load Background* button and open the `demo-files/backgrounds/space.png` file. Click *OK*.

  3. Create a new room by clicking on the ![New Room](http://share.cameronmcefee.com/screencap/room-20120624-092036.png) New Room button.

  4. In the window that pops up, click on the settings tab. Name the room `space` and set the height and width of the room to `640`. At the top of the window, set the Snap X and Snap Y properties to `32`.  
  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_10.55.50_AM-20120624-105714.png)

  5. In the same window, click on the backgrounds tab and set the *Vert. Speed* to `2`.

  > If you don't see the backgrounds tab, click the arrow next to the tabs.  

  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.21.31_AM-20120624-092217.png)

  6. Click the green checkmark in the top left corner of the window to save the settings.

  7. Save your file and click on the ![Run button](http://share.cameronmcefee.com/screencap/run-20120624-092510.png) Run button. You should see space flying past.

### Add your space ship

Let's add your space ship and get it flying around.

  1. Create a new sprite by clicking on the ![New Sprite](http://share.cameronmcefee.com/screencap/sprite-20120624-093045.png) New Sprite button.

  2. In the window that pops up, name the sprite `ship`. Click on *Load Sprite* and open the file `demo-files/sprites/ship.png`. Make sure *Transparent* is checked. Click *OK*.

  3. Create a new object by clicking on the ![New Object](http://share.cameronmcefee.com/screencap/object-20120624-093430.png) New Object button.

  4. In the window that pops up, call the new object `ship` and select the *ship* sprite from the dropdown list.  
  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-26_at_11.03.40_AM-20120626-110350.png)

  5. Click on the *Add Event* button and add "Keyboard" events for *\<no key\>*, *\<Left\>*, and *\<Right\>*. Also add an event for *Other > Intersect Boundary*

    1. For the *\<no key\>* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move action event and give it a `■` direction and `0` speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.40.41_AM-20120624-094051.png)

    2. For the *\<Left\>* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move Fixed action and give it a `←` direction and `10` speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.42.47_AM-20120624-094301.png)

    3. For the *\<Right\>* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move Fixed action and give it a `→` direction and `10` speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.43.35_AM-20120624-094348.png)

    4. For the *Intersect Boundary* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move Fixed action and give it a `■` direction and `0` speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.40.41_AM-20120624-094051.png)

  6. Click *OK*.

  7. From the list on the left, double-click on the *space* room. Make sure that you see the *ship* object in the list at the bottom left. Click your mouse once in the room to place a ship.  
  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_10.19.23_AM-20120624-101936.png)

  8. Click the green checkmark at the top right corner of the window to save your room.

  9. Save your file and click on the ![Run button](http://share.cameronmcefee.com/screencap/run-20120624-092510.png) Run button. Click on the window and press the left and right keys. Your ship will fly around space!

### Shoot Missiles!

Space is a dangerous place. You need a weapon to protect yourself.

  1. Create a new sprite by clicking on the ![New Sprite](http://share.cameronmcefee.com/screencap/sprite-20120624-093045.png) New Sprite button.

  2. In the window that pops up, name the sprite `goodMissile`. Click on *Load Sprite* and open the file `demo-files/sprites/goodMissile.png`. Make sure *Transparent* is checked. Click *OK*.

  3. Create a new object by clicking on the ![New Object](http://share.cameronmcefee.com/screencap/object-20120624-093430.png) New Object button.

  4. In the window that pops up, call the new object `goodMissile` and select the *goodMissile* sprite from the dropdown list.

  5. Click on the *Add Event* button and add a "Create" event and a *Other > Outside Room* event.

    1. For the *Create* event, drag a ![Start moving in a direction](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.38.32_AM-20120624-093845.png) Move Fixed action and give it a `↑` direction and `10` speed.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.50.35_AM-20120624-095045.png)

    2. For the *Outside Room* event, drag a ![Destroy Instance](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.51.07_AM-20120624-095124.png) Destroy Instance action and make sure `self` is selected.
    ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.53.11_AM-20120624-095326.png)

  6. Click *OK* to save your goodMissle object.

  7. From the list on the left of the main window, double click on the *ship* object.

  8. Add a *Key Press > \<Space\>* event. Drag a ![Create Instance](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.56.31_AM-20120624-095649.png) Create Instance action to the event. Set the *object* to your goodMissile object and be sure to check the *Relative* box.  
  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.57.13_AM-20120624-095727.png)

  9. Click *OK* to save your *ship* object.

  10. Save your file and click on the ![Run button](http://share.cameronmcefee.com/screencap/run-20120624-092510.png) Run button. Press the space bar key. Your ship will shoot missiles. Hooray, we're not defenseless!

### The Bad Guys

We all know space is a dangerous place full of aliens. Let's add some to your project.

  1. Create a new sprite by clicking on the ![New Sprite](http://share.cameronmcefee.com/screencap/sprite-20120624-093045.png) New Sprite button.

  2. In the window that pops up, name the sprite `baddie1`. Click on *Edit Sprite*. In the window that opens up, select *Image 0* in the list and click the ![Cut to clipboard](http://share.cameronmcefee.com/screencap/cut-20120626-113840.png) Cut To Clipboard Button to delete it. Click on the ![Add Sprite From File](http://share.cameronmcefee.com/screencap/add-from-file-20120624-101159.png) Add Sprite From File button. From the sprites folder, open `baddie1-A.png` and `baddie1-B.png`.  
  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_10.13.25_AM-20120624-101333.png)

  3. Click the green checkmark, and then click *OK* to save your new baddie sprite.

  4. Create a new object by clicking on the ![New Object](http://share.cameronmcefee.com/screencap/object-20120624-093430.png) New Object button.

  5. In the window that pops up, call the new object `baddie1` and select the *baddie1* sprite from the dropdown list.

  6. Add a Create event to the baddie1 object and drag a ![Execute Code](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_10.16.06_AM-20120624-101621.png) Execute Code action onto it.

  7. In the window that pops up, add the following code: `image_speed = .05`. This will make sure the baddie doesn't animate too fast. Click the green checkmark and then click *OK* to save your baddie.

  8. From the list on the left, double-click on the *space* room. Make sure that you see the *baddie1* object in the list at the bottom left. Click your a few times in the room to place some baddies.
  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_10.54.34_AM-20120624-105452.png)

  9. Click the green checkmark at the top right corner of the window to save your room.

  10. Save your file and click on the ![Run button](http://share.cameronmcefee.com/screencap/run-20120624-092510.png) Run button. Now you can shoot at the aliens.

### Explosive Results

Right now, shooting aliens does nothing. Let's make the aliens explode when we shoot them.

  1. Create a new sprite by clicking on the ![New Sprite](http://share.cameronmcefee.com/screencap/sprite-20120624-093045.png) New Sprite button.

  2. In the window that pops up, name the sprite `baddieExplosion`. Click on *Edit Sprite*. In the window that opens up, select *Image 0* in the list and click the ![Cut to clipboard](http://share.cameronmcefee.com/screencap/cut-20120626-113840.png) Cut To Clipboard Button to delete it. Click on the ![Add Sprite From File](http://share.cameronmcefee.com/screencap/add-from-file-20120624-101159.png) Add Sprite From File button. From the sprites folder, open `baddieDie-1.png`, `baddieDie-2.png`, `baddieDie-3.png`, `baddieDie-4.png`, and `baddieDie-5.png`.  

  When asked, select `Use new size` and `Place in center`.

  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-26_at_11.47.54_AM-20120626-114804.png)

  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_11.31.41_AM-20120624-113155.png)

  3. Click the green checkmark, and then click *OK* to save your new explosion sprite.

  4. Create a new object by clicking on the ![New Object](http://share.cameronmcefee.com/screencap/object-20120624-093430.png) New Object button.

  5. In the window that pops up, call the new object `baddieExplosion` and select the *baddieExplosion* sprite from the dropdown list. Add an *Other > Animation End* event. Drag a ![Destroy Instance](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.51.07_AM-20120624-095124.png) Destroy Instance action to the Animation End event and make sure `self` is selected. Click *OK*.

  6. From the list on the left, double-click on the *baddie1* object. Add a *collision* event with *goodMissile* and drag a ![Create Instance](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.56.31_AM-20120624-095649.png) Create Instance action to the event.

  7. In the window that pops up, set the object to your *baddieExplosion* object, and the x and y to `-20`. Put a check next to the *relative* checkbox. Click *OK*. Drag a ![Destroy Instance](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.51.07_AM-20120624-095124.png) Destroy Instance action and make sure `self` is selected. Drag a second ![Destroy Instance](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_9.51.07_AM-20120624-095124.png) Destroy Instance action and make sure `other` is selected. Click *OK*.

  9. Save your file and click on the ![Run button](http://share.cameronmcefee.com/screencap/run-20120624-092510.png) Run button. When you shoot an alien, it explodes!

### Settle the Score

Now that we can defend ourselves in space, let's keep track of our score.

  1. Create a new object by clicking on the ![New Object](http://share.cameronmcefee.com/screencap/object-20120624-093430.png) New Object button.

  2. In the window that pops up, call the new object `score`. Add a *Create* and a "Draw" event.

    1. In the Create event, add a ![Set Score](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-26_at_10.20.00_AM-20120626-102332.png) Set Score action and set it to `0`.

    2. In the Create event also drag a ![Execute Code](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-24_at_10.16.06_AM-20120624-101621.png) Execute Code action onto it. In the text box add the text `draw_set_color(c_white)`. Click the green checkmark. to save the code.

    3. In the Draw event drag a ![Draw Score](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-26_at_10.26.18_AM-20120626-102629.png) Draw Score action. Set the x and y values to `32` and the caption value to `Score: `

  3. Click *OK* to save your score object.

  4. From the list on the left, double-click on the *space* room. Make sure that you see the *score* object in the list at the bottom left. Click once in the room to place the score object.  
  ![](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-26_at_10.27.56_AM-20120626-102827.png)

  5. From the list on the left, double-click on the *baddie1* object. Click on the collision event with *goodMissile* and drag a ![Set Score](http://share.cameronmcefee.com/screencap/Screen_Shot_2012-06-26_at_10.20.00_AM-20120626-102332.png) Set Score action and set it to `+1`. Be sure to also add a check next to *relative*. Click *OK*.

  6. Click the green checkmark at the top right corner of the window to save your room.

  7. Save your file and click on the ![Run button](http://share.cameronmcefee.com/screencap/run-20120624-092510.png) Run button. Now when you shoot an alien, you'll see that you get a point.