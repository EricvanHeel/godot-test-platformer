# Godot Test Platformer
Testing development of a Godot 2D platformer

This project was initialized and developed using version **4.2.1** of Godot

## Git Operations
To clone this project to you local machine, follow these steps:

- Create a new [GitHub Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token) and copy it locally (you can give the token full permissions)

- Open a terminal in the location on your local machine where you wish to keep the project and ruin the following to clone it there:
  - `git clone https://{YOUR_GITHUB_USERNAME}:{YOUR_GITHUB_TOKEN}@github.com/EricvanHeel/godot-test-platformer.git`

- Ensure you are on the `main` branch by running:
  - `git checkout main`

- Then create your own branch off of `main` by running:
  - `git checkout -b {your-branch-name}`

- If you already have a local branch you're working on, verify you are on that branch by running:
  - `git branch`

- You can now make any changes or additions to the project under this branch. Once you want to merge your changes back into `main` run the following commands:
  - `cd {project/directory/location/godot-test-platformer}`
  - `git add .`
  - `git commit -m "{put some message here}"`
  - `git push origin {your-branch-name}`

- You can then go to the GitHub repo in your browser and open up na Pull Request from your branch into `main`

## Project Organization
Project organization, naming nconventions and best practices are defined here to keep everything organized and consistent.

### Directory Structure

```
godot-test-platformer
│   
└── assets
|   |
│   └── fonts
|   |
│   └── images
|   |
│   └── sounds
│   ...
│
└── scenes
	|
	└── buildings
	|
	└── character
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
Nodes and Class Names should be named in camel case, like MyCustomNode

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
