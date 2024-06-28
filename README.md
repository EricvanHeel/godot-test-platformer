# Godot Test Platformer
Testing development of a Godot 2D platformer

This project was initialized and developed using version **4.2.1** of Godot

## Git Operations
For all git operations, make sure you are running the commands at the root of the project on your local machine:

`cd {project/directory/location/godot-test-platformer}`

### Cloning
You only need to clone once to initialize the project on your local machine.
To clone this project to you local machine:

- Create a new [GitHub Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token) and copy it locally (you can give the token full permissions)

- Open a terminal in the location on your local machine where you wish to keep the project and ruin the following to clone it there:
  - `git clone https://{YOUR_GITHUB_USERNAME}:{YOUR_GITHUB_TOKEN}@github.com/EricvanHeel/godot-test-platformer.git`

- Run `git branch` and you should see output similar to this:
```
C:\Users\Eric\Documents\Godot Projects\platformer>git branch
* main
```

### Creating a New Branch
Using branches ensures your changes won't get intertwined with someone else's.
To create a new branch:
- Ensure you are on the `main` branch by running:
  - `git checkout main`

- Then create your own branch off of `main` by running:
  - `git checkout -b {your-branch-name}`

### Committing and Pushing Changes on your Branch
- Run `git branch` to ensure you are on the right branch you want to commit and push to. It should look like this:
```
C:\Users\Eric\Documents\Godot Projects\platformer>git branch
  main
* renaming_2
```

- If you are still on the `main` branch, but see your branch exists, run `git checkout {your-branch-name}` to switch to your branch.
```
C:\Users\Eric\Documents\Godot Projects\platformer>git checkout renaming_2
Switched to branch 'renaming_2'
```

- You can now make any changes or additions to the project under your branch. Once you want to merge your changes back into `main` run the following commands:
  - `git add .`
  - `git commit -m "{put some message here}"`
  - `git push origin {your-branch-name}`

- You can then go to the GitHub repo in your browser and open up a Pull Request from your branch into `main`

### Checking Out Someone Else's Branch
Suppose someone else pushed a branch and you want to run the project on that branch on your local machine.

- Run `git fetch` so your local machine has all updateded references of all remote branches

- Run `git branch -r` to see all remote branches and identify the branch you want to switch to
```
C:\Users\Eric\Documents\Godot Projects\platformer>git branch -r
  origin/Renaming
  origin/add-readme
  origin/char-animations
  origin/initial_commit
  origin/main
  origin/renaming_2
```

- Run `git checkout origin/{branch-name}` to change your local ref to that branch

- Then run `git switch -c {branch-name}` to create a new local branch on your machine referencing that remote branch
```
C:\Users\Eric\Documents\Godot Projects\platformer>git switch -c Renaming
Switched to a new branch 'Renaming'
```

- Your local project will now run on the code for that branch. You can also commit and push to that branch as well.

## Project Organization
Project organization, naming nconventions and best practices are defined here to keep everything organized and consistent.
Godot has it's own [style guide reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html) which we'll try to follow

### Directory Structure
Example:
```
/godot-test-platformer
│   
└── /assets
|   |
│   └── /fonts
|   |
│   └── /images
|   |
│   └── /sounds
│   ...
│
└── /common_scripts
|   |
│   └── finite_state_machine.gd
|   |
│   └── state.gd
│   ...
│
└── /scenes
	|
	└── /buildings
	|
	└── /player
      |
      └── player.gd
      |
      └── player.tscn
	...
```
### `assets` Folder
Used to store various assets used by the game. Files should follow snake case structure. Ex. `tavern_tile_map.png`

Subfolders may be used under `fonts`, `images`, `sounds`, etc. to group assets of a particular scene

### `scenes` Folder
Individual scense should live under a subfolder in the `scenes` folder. This subfolder can either be specific to a single scene (for example "character") or can be used to group similar types of scenes together (for exmaple "buildings")

Scenes should be named all lower case and their file names should be snake case. Ex. `town_center.tscn`

Extended Godot scripts should be places in the same directory as the scene they are used in. For example, the "character" subfolder should contain the actual scene file `character.tscn` and any custom Godot scripts used within the nodes of that scene; `character.gd`

## Godot Script Naming Conventions
Nodes and Class Names should be named in camel case, like `MyCustomNode` or `MyCustomClass`

Godot script names should follow snake case, `player_camera.gd`

Constants should be all caps snake case, `const MOVE_SPEED: float = 150`

Variables should be all lower snake case, `var new_velocity: Vector2 = velocity`

Functions should be all lower snake case, `func do_something_cool()`

Private functions (functions that are only called from within the script/class they are defined) should begin with a leading underscore "_", `func _process(delta: float)`

All variables, parameters and functions should have type annotations.
  - Variables/Constants: `const MOVE_SPEED: float = 150`
  - Function Parameters & Return types: 
	- `func _process(delta: float) -> void:`
	- `func add_two_numbers(first: int, second: int) -> int:`

## Scene Setup
Each scene should have the following child nodes:
- TileMap
- Player
- PlayerCamera
  - Takes TileMap and Player as inputs

## Object Properties Glossary

### Character
| Property | Value |
| -------- | ------- |
| Z-Index | 4 |

### All Tile Maps
| Physics Layer | Collision Layer |
| -------- | ------- |
| 0 - Solid Platforms | 1 |
| 1 - Droppable Platforms | 2 |

### Tavern Scene
| Tile Map Layer | Z-Index |
| -------- | ------- |
| Floors & Walls | 0 |
| Background 1 | 1 |
| Background 2 | 2 |
| Background 3 | 3 |
| Middleground | 4 |
| Foreground 1 | 5 |
| Foreground 2 | 6 |
| Borders | 7 |

### Arena Scene
| Tile Map Layer | Z-Index |
| -------- | ------- |
| Floors & Walls | 0 |
| Platforms | 1 |

### Bartender
| Property | Value |
| -------- | ------- |
| Body Z-Index | 1 |
| Arms Z-Index | 2 |