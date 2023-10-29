# cheatsheet: This script show list of commands available for your current directory

## Usage

```command.yml
cheatsheet:
  - name: prj/frontend
    dir: $HOME/prj/frontend
    cmds: 
        - npm run dev
        - npm run storybook
  - name: prj/backend
    dir: $HOME/work/prj/backend
    cmds: 
        - go build
  - name: prj/db
    dir: $HOME/prj/db
    cmds: 
        - ./script db:seed
        - ./script db:migration
        - ./script db:reset
  - name: "The following command is displayed if no directory is matched"
    cmds: 
        - nvim "$HOME/.commands.yml"
        - nvm list
```

```sh
$ cd "$HOME/prj/frontend"
$ cheatsheet "$HOME/.commands.yml"
npm run dev
npm run storybook
```

```sh
$ cd "$HOME/work/prj/db"
$ cheatsheet "$HOME/.commands.yml"
./script db:seed
./script db:migration
./script db:reset
```

## More

```sh
$ cd "$HOME/prj/db"
$ cheatsheet "$HOME/.commands.yml" | fzf"
```

## Dependency

- [yq](https://github.com/mikefarah/yq)
