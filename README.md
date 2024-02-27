# bashscripts


## Function to create a new project and cd into it
Add this to your .bashrc


```
function create() {
    /usr/bin/REPO.sh "$1" && cd "/home/user/dev/$1"
}
```
