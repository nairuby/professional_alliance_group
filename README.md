# ⚠️ THIS REPO HAS BEEN MOVED: [NEW LINK](https://github.com/African-Ruby-Community/professional_alliance_group) ⚠️
# Professional Alliance Group

## Setup

To set up the project for the first time, follow these steps:

For and clone the project

Run the setup
```bash
make setup
```

This will install the necessary dependencies and start the Jekyll server for development.

## Update Instructions

If you need to update the project, you can follow these instructions:

1. **Pull the latest changes:**

   ```bash
   git pull origin main
   ```

2. **Update your local dependencies:**

   ```bash
   make install
   ```

3. **Start the server:**
   ```bash
   make serve
   ```

### Commands Overview

- **First Time Setup:**  
  Run `make setup` to install dependencies and start the Jekyll server.

- **Install Dependencies:**  
  Run `make install` to install or update the project's dependencies.

- **Serve the Site:**  
  Run `make serve` to start the Jekyll server for local development.

- **Clean Up:**  
  Run `make clean` to remove the vendor directory and the `_serve` folder.

## Deployment

To build the site for deployment, you can run:

```bash
bundle exec jekyll build -d public
```
