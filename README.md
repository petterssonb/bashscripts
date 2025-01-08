# GitHub Repository Creator Script

This bash script automates the creation of a new GitHub repository, initializes a local git repository, sets up a `.gitignore` file using a custom template, and pushes the initial commit to GitHub. It supports both SSH and HTTPS authentication.

***This is a forked repo that builds upon the original made by two of my classmates Emil and Christopher. Find their githubs down below:***

 - [Emil's GitHub](https://github.com/Cosmao)
 - [Christopher's GitHub](https://github.com/Chrisvasa)

---

## Prerequisites

Ensure the following are installed on your system:
- **Git**
- **cURL**
- **jq**
- **SSH keys configured for GitHub (if using SSH authentication)**

---

## Setup Instructions

### 1. Clone or Download the Script
Download the script to your desired directory.

### 2. Add Environment Variables to `.zshrc` (or `.bashrc`)
Add your GitHub credentials and the path to your custom `.gitignore_template` file to your `.zshrc` file:

```bash
export GITHUB_USERNAME="your_github_username"
export GITHUB_TOKEN="your_github_token"
export GITIGNORE_TEMPLATE_PATH="/path/to/your/gitignore_template"
```

***Replace:***
 - your_github_username with your GitHub username.
 - your_github_token with a GitHub personal access token with repo permissions.
 - /path/to/your/gitignore_template with the absolute path to your .gitignore_template file.

***Save the file and apply the changes:***

```bash
source ~/.zshrc
```

3. Make the Script Executable

Navigate to the directory containing the script and run:

```bash
chmod +x repo.sh
```

4. Move the Script to /usr/local/bin/

Move the script to your system’s bin directory so you can execute it from anywhere:

```bash
sudo cp repo.sh /usr/local/bin/repo
```

---

## Usage

Run the script using the following format:

```bash
repo <repo-name> [repo-directory]
```

Arguments:

 1. <repo-name>: The name of the new GitHub repository to create.
 2. [repo-directory] (optional): The local directory where the repository will be initialized. Defaults to the current directory if not provided.

---

## Features

- Custom .gitignore: Automatically includes your .gitignore_template file if configured.
- Supports SSH and HTTPS: Allows you to choose between SSH or HTTPS for authentication.
- Interactive Options:
- Choose between a private or public repository.
- Specify authentication type.

---

## Example
1. ***Create a Private Repository with SSH Authentication:***
```bash
repo my-new-repo
```

Follow the prompts to:
 - Confirm the repository type (private or public).
 - Choose SSH for authentication.

2. ***Create a Public Repository in a Specific Directory with HTTPS Authentication:***
```bash
repo my-public-repo /path/to/directory
```

Follow the prompts to:
 - Confirm the repository type (Public).
 - Choose HTTPS for authentication.

---

## Troubleshooting

1. ***Environment Variables Not Found:***
Ensure you have added GITHUB_USERNAME, GITHUB_TOKEN, and GITIGNORE_TEMPLATE_PATH to your .zshrc (or .bashrc) file and reloaded it:
```bash
source ~/.zshrc
```

2. ***Permission Denied:***
If you encounter permission issues, ensure the script is executable and placed in /usr/local/bin/:
```bash
chmod +x repo.sh
sudo cp repo.sh /usr/local/bin/repo
```

3. ***Missing Dependencies:***
Install required tools:
```bash
brew install git curl jq
```

---

## License

MIT License, see 'LICENSE' for details