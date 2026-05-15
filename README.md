[![Static Badge](https://img.shields.io/badge/Godot%20Engine-4.6.2-blue?style=plastic&logo=godotengine)](https://godotengine.org/) ![GitHub top language](https://img.shields.io/github/languages/top/Chaotic-Legend/Asteroid-Attack?logo=godotengine)

# Asteroid Attack | Project Touchstone #
[How To Make Asteroids in Godot 4 (Complete Tutorial)](https://www.youtube.com/watch?v=FmIo8iBV1W8&t) by [Kaan Alpar](https://www.youtube.com/@KaanAlpar) ([GitHub](https://github.com/KaanAlpar))

This project is a beginner-friendly walkthrough for developing a 2D space-themed arcade shooter using the Godot Engine, guiding viewers through the core systems required to create responsive momentum-based spaceship movement and an engaging asteroid-destruction gameplay loop. It introduces and applies essential concepts, including node-based scene organization, physics-based player movement, input handling, asteroid spawning, screen wrapping, projectile combat, collision detection, score tracking, UI implementation, and game over and restart conditions. This tutorial also demonstrates important gameplay features, including creating procedural asteroid fragmentation patterns, implementing inertia-driven movement and rotation behavior, handling collisions and scoring triggers, integrating sound effects and music, and managing overall game flow to create a polished gameplay experience. It also served as the foundation for completing a structured implementation task on Feather, with the project integrated into the broader development workflow supporting the Handshake AI Project Touchstone initiative.

# Assets #
[Asteroid Attack Assets](https://github.com/KaanAlpar/asteroids_tutorial/tree/main/assets) by [Kaan Alpar](https://www.youtube.com/@KaanAlpar) ([GitHub](https://github.com/KaanAlpar))

![Sprite Asset](assets/textures/player_ship.png)
![Sprite Asset](assets/textures/meteorGrey_big4.png)

# Create a Godot task #
<ins> What application is this task for? </ins>
<br>
Godot

### **Task prompt** ###
First, enter the **task prompt** and any relevant reference files (e.g., docs, diagrams, sketches, photos, schematics).

Tasks should sound like what a manager might give a skilled but junior employee: high-level guidance with some leeway on executional details, but with very clear success metrics. What a good outcome looks like must be very clear and easy to understand.

Please include any relevant **reference files** (e.g., docs, diagrams, sketches, photos, schematics) needed to complete this task.

Reminder on the difference between reference and starting state files:
- **Reference files**: anything the Employee should look at or read while completing the project that does not need to be directly loaded into the application (*'please make something that looks like XYZ image'*)
- **Starting state files (upload below)**: anything that the Employee would need to load into their workspace to complete the task (*'here is the existing file you should adapt'*)

<ins> Task prompt (ask the Employee) </ins>
<br>
We are beginning development of a modern 2D space-themed arcade shooter that emphasizes momentum-based movement, asteroid destruction, projectile combat, and responsive controls to create an engaging gameplay experience. Your task is to design and implement a complete gameplay system to control a small blue spaceship as it navigates through a looping space environment filled with moving asteroids and laser-based combat. The player character, asteroid systems, projectile mechanics, score tracking, UI elements, collision systems, camera behavior, and game states should get organized so that gameplay interactions, movement behavior, asteroid fragmentation, scoring events, and state transitions function consistently throughout play. The game system must prioritize responsiveness, visual clarity, and gameplay consistency by incorporating structured input handling, smooth acceleration and deceleration movement, accurate collision detection, seamless screen wrapping, layered scrolling backgrounds, and a stable camera that maintains a clear view of the gameplay area at all times. The game takes place in deep space, featuring multiple parallax starfield layers of varying sizes that drift slowly from right to left and seamlessly loop across the screen. Large asteroids split into two medium asteroids, while medium asteroids split into two smaller asteroids that travel outward in opposite directions at increased speeds. The completed gameplay system must support the following behaviors and mechanics:

- The spaceship spawns at the center and safely respawns only when the asteroids are not occupying the spawn area.
- Large asteroids spawn outside of the visible screen area and move smoothly into view from randomized positions.
- The spaceship rotates and moves in all directions using the arrow keys and slows down after releasing input.
- The spaceship fires blue lasers with the Space key at a controlled firing rate and with a limited lifetime duration.
- The score counter increases after destroying asteroids, awarding different point values based on asteroid size.
- The player starts with three visible lives, each of which is removed one at a time upon collision with asteroids.
- The UI displays the score, remaining lives, pause label, game-over message, replay button, and the high score.
- The game saves and updates the player's highest achieved score across gameplay sessions.
- Pressing the P key pauses and resumes gameplay while displaying a centered "PAUSED" label.
- Pressing the R key fully resets the gameplay to the beginning and can also reset the game when paused.
- Pressing the Escape key allows the user to close the entire game at any point during the session.

Unique sound effects play for the lasers, explosions, collisions, and asteroid destruction while background music plays continuously throughout gameplay. The spaceship must remain responsive while navigating through the environment using momentum-based movement and directional rotation controls. Asteroid behavior systems must preserve gameplay flow and increase challenge by introducing faster-moving hazards and maintaining randomized movement patterns throughout the environment. Sound systems must trigger gameplay audio cues without delay, ensuring that player feedback remains responsive during combat and destruction events. Game state management must correctly transition between active gameplay, paused gameplay, respawn conditions, and game-over states while maintaining stable gameplay progression and consistent gameplay behavior throughout the session. UI systems must preserve readability and visual consistency throughout gameplay while clearly communicating player progression and gameplay status information. This structure must remain modular and extensible, supporting future gameplay additions, additional asteroid variations, expanded UI systems, and different game modes while preserving stable movement physics, responsive controls, accurate collision behavior, and consistent gameplay progression across all scenarios.

<ins> Which of the following best fits this task? </ins>
<br>
Task from scratch

<ins> How long would you anticipate an 'Employee' to complete this task? (in hours) </ins>
<br>
5

### **Starting state** ###
Please describe and include below any information about the starting state of this project:
- Existing work to be modified
- Other assets or other inputs the Employee needs to bring to be able to complete this task

Reminder on the difference between the starting state and the reference files:
- **Starting state files**: anything that the Employee would need to load into their workspace to complete the task ('*here is the existing file you should adapt*')
- **Reference files (upload above)**: anything the Employee should look at or read while completing the project that does not need to be directly loaded into the application ('*please make something that looks like XYZ image*')

<ins> Starting state description </ins>
<br>
The starting state files begin with an otherwise empty 2D arcade project containing no implemented gameplay systems, scenes, scripts, enemy behaviors, scoring systems, or combat mechanics beyond the default project structure. The provided materials consist of visual, audio, and font assets intended to support the development of a space-themed asteroid survival and shooting game focused on piloting a player-controlled spacecraft while avoiding and destroying incoming hazards. These assets include multiple asteroid sprites of varying sizes, player ship textures, laser projectile graphics, UFO enemy sprites, particle textures, life indicator icons, a scrolling starfield background, a custom display font for interface elements and score tracking, background music, and several sound effects for lasers, collisions, explosions, damage feedback, and gameplay events. The Employee is responsible for designing and implementing the complete gameplay experience from the ground up using the provided assets, including all required scenes, scripts, movement systems, projectile mechanics, enemy spawning logic, asteroid behaviors, collision handling, health and life management, scoring systems, particle effects, animation and audio playback, game over and restart functionality, and complete game flow management. The Employee must create and assemble the programming, combat interactions, visual effects integration, and project organization using the supplied resources as the foundation for the gameplay experience.

### **Overall context** ###
Finally, include context on this task and why it is realistic and representative of real-life work:
- Why is this a reasonable task for a manager to ask a junior-level employee to do?
- Is there a larger project it might be a part of?

<ins> Task context </ins>
<br>
This task is a realistic and appropriate assignment for a junior-level developer, as it focuses on implementing the core mechanics of a space-themed arcade shooter using the provided visual and audio assets. It involves building essential gameplay systems, including player-controlled spacecraft movement, projectile firing mechanics, asteroid spawning and movement behavior, collision detection, score tracking, screen-wrapping logic, particle and explosion effects, and game over and restart functionality. The work requires applying fundamental programming, gameplay logic, and problem-solving skills to transform static assets into a complete interactive gameplay experience while integrating audio feedback, interface systems, and game state management into a cohesive project. This type of task reflects common real-world development practices, where developers must organize project structures, implement reusable gameplay systems, manage scene interactions, and create polished mechanics from a partially prepared project foundation. It could serve as part of a larger project to develop a complete arcade-style design with enemy behavior, progression systems, weapon upgrades, advanced visual effects, and additional gameplay modes. By implementing these foundational gameplay systems, the task creates an expandable framework that can later support additional mechanics, interface enhancements, visual refinements, and broader gameplay features.

<ins> Rubric Items </ins>
<br>
1. All imported sprites and assets preserve their original visual quality with sharp rendering and no unintended scaling, blurring, or distortion.
- Run the main scene and verify that the sprites, background, and game elements render without scaling, blurring, or distortion.
- Verifies that visual assets retain their original appearance without scaling, blurring, or distortion caused by incorrect import settings.

2. The player character can collide with the environment and asteroids.
- Run the main scene and move the player character towards the environment and asteroids to confirm the sprite collides with them.
- Without functional collision, the spaceship would pass through walls and asteroids, removing the core challenge and difficulty.

3. The camera displays the space environment with screen wrapping borders that affect the spaceship, asteroids, and laser projectiles.
- Run the main scene and have the spaceship, asteroids, and laser projectiles move beyond the edges of the screen to observe that they reappear on the opposite side.
- The camera display and screen wrapping preserve spatial awareness, keeping gameplay elements moving and in view.

4. The spaceship can move in all directions with the arrow keys and will slowly decrease velocity until it stops when releasing movement input.
- Run the main scene and observe that the spaceship can rotate and move in all directions using the arrow keys, then gradually slow down to a full stop after releasing the movement input.
- Responsive movement and gradual deceleration support precise navigation and momentum-based gameplay in the environment.

5. The score increases when shooting the asteroids, with large, medium, and small asteroids awarding 100, 50, and 25 points, respectively.
- Run the main scene and observe that shooting the asteroids updates the score counter accurately: 100 points for large, 50 points for medium, and 25 points for small asteroids
- The scoring system reflects player performance by rewarding successful asteroid destruction and providing a continuous score.

6. The game resets from the start when the player presses the R key.
- Run the main scene, press the R key during gameplay to confirm that the game, sprites, score, and visual elements reset completely.
- Without a fast reset, the player must close and relaunch the game between runs, breaking the rapid-retry loop that defines the genre.

7. Pressing the P key displays a "PAUSED" label in the center, and pressing the same input again hides the label to resume the gameplay.
- Run the main scene, press the P key to show a "PAUSED" label, then press the P key again to hide the label and resume gameplay.
- Pausing lets players step away without losing progress, since interruptions would otherwise force them to abandon the match.

8. The game closes when pressing the Escape key during gameplay.
- Run the main scene and press the Escape key during gameplay to confirm that the game application terminates completely.
- Closing the game with the Escape key allows players to exit seamlessly while maintaining a consistent, keyboard-only control.

9. The game plays sound effects for lasers, explosions, and destruction.
- Run the main scene and trigger gameplay events such as shooting lasers, collisions, and asteroid destruction to confirm that distinct sound effects play for each action.
- The audio feedback enhances responsiveness by reinforcing key gameplay events, including shooting, destruction, and collisions.

10. The large asteroids spawn outside of the screen and move into view.
- Run the main scene and verify that asteroids spawn just outside the visible area and move smoothly into view from off-screen positions.
- The randomized spawning positions for the asteroids maintain consistent replayability by preventing predictable patterns.

11. The game-over message displays the high score and a replay button.
- Run the main scene, collide with an asteroid to fail, and observe a game-over screen displaying a high score value and a replay button.
- The game-over screen message confirms the run ended, shows the player how they did, and gives them an option to play again.

12. The game stores and updates the player's highest achieved score.
- Run the main scene, achieve a higher score than the previous best score, and confirm that the high score updates and saves correctly.
- Persistent high scores provide long-term goals across sessions, preventing best score progression from resetting after every run.

13. The background music plays continuously when the game starts.
- Run the main scene and observe that the background music begins playing and loops at the end of the music audio with proper volume.
- Background music sets the atmosphere and provides continuous audio presence so the game does not feel silent during gameplay.

14. Large asteroids split into two medium asteroids, while medium asteroids split into two small asteroids that travel outward in opposite directions at increased speeds.
- Run the main scene and shoot large and medium asteroids to verify that they split into two smaller asteroids that move outward in opposite directions with increased velocity.
- Asteroid fragmentation increases gameplay intensity by introducing faster-moving targets and escalating difficulty with more hazards.

15. Pressing the Space key fires blue laser projectiles from the spaceship with a steady firing rate and a short lifetime duration.
- Run the main scene, and then press the Space key to confirm that blue lasers fire consistently and disappear shortly after spawning.
- A controlled firing rate and limited projectile duration prevent excessive laser accumulation while maintaining consistent shooting.

16. The player character always spawns and respawns at the center of the screen only when there isn't an asteroid occupying the spawn area.
- Run the main scene, crash, and observe that respawning occurs at the center only when no asteroid overlaps the spawn area.
- Protected spawning prevents unavoidable collisions immediately after respawning and maintains fair gameplay with moving hazards.

17. The player character has three lives displayed as small blue spaceship icons that disappear one at a time after each collision with an asteroid.
- Run the main scene and collide with asteroids repeatedly to confirm that the displayed spaceship life icons disappear one by one.
- The visual life display communicates the player's remaining lives, helping players track progress and anticipate game-over conditions.

18. The background contains three layers of star fields with different small sizes that slowly move from right to left and wrap around the screen.
- Run the main scene and observe that multiple star field layers of varying sizes scroll from right to left and wrap around the screen.
- Layered star field movement creates depth and motion in the environment while maintaining a scrolling background effect.
<br>
Godot - https://feather.openai.com/tasks/bf17a2b8-667e-4a2b-9139-8cd6f1c2c46f/stage/prompt_creation - Awaiting response.
