[This description is taken directly from the Real Python Flask tutorial.](https://realpython.com/flask-project/)

# Build a Scalable Flask Web Project From Scratch

Over the course of this tutorial, you’ll explore the process of creating a boilerplate for a Flask web project. This boilerplate will serve as a great starting point for any scalable Flask web app that you wish to develop in the future, from basic web pages to complex web applications.

In this tutorial, you’ll learn how to:

* Set up a Flask project
* Create a "Hello, World!" Flask app
* Add multiple pages with blueprints
* Leverage Jinja templates
* Store static files

## My customizations

I have altered the original project to leverage containers, and Docker Compose locally for container-led development purposes.

Changes from original include:
* addition of Docker files - Dockerfile, compose.yaml
* had to use virtual environment locally to initialize sqlite database
* added use of environment variables to compose.yaml for proper execution
* initialized Flask application in app.py, rather than __init__
* import statements were adjusted - tutorial called for importing from "board.xxxx" which didn't work due to project initialization changes

