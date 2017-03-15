## elephant

Backend for Frontend (BFF) project with Kitura on Swift

[![](https://img.shields.io/badge/bluemix-powered-blue.svg)](https://bluemix.net)
![Platform](https://img.shields.io/badge/platform-SWIFT-lightgrey.svg?style=flat)

### Table of Contents
* [Summary](#summary)
* [Requirements](#requirements)
* [Configuration](#configuration)
* [Run](#run)

### Summary

The Backend for Frontend pattern, commonly known as BFFs, helps you focus on exposing business data and services in a form that matches the user interaction requirements. For instance, to optimize a user journey to your cloud solution, it may require a different user journey for the mobile application but a richer, more detailed journey for the Web application. With Bluemix, you can build a BFF by using polyglot programming approach to define the BFF- using Node.js, Swift, or Java. The BFF service exposes a RESTful API matching a [Swagger](http://swagger.io) definition.

 
This BFF application is configured to connect to the following services:
 
 
 
- [Bluemix Object Storage service](https://console.ng.bluemix.net/catalog/services/object-storage)
 
- [AppID](https://console.ng.bluemix.net/catalog/services/object-storage)
 
### Requirements
#### Local Development Tools Setup (optional)

- On Linux, install the [Swift toolchain](http://www.swift.org) version 3.0.2
- On macOS, install [Xcode](https://developer.apple.com/download) 8.2+

#### Bluemix development tools setup (optional)

1. Install [Docker](http://docker.io) on your machine.
2. Install the [Bluemix CLI](https://console.ng.bluemix.net/docs/cli/index.html)
3. Download the [Bluemix developer tools plugin](https://plugins.ng.bluemix.net/ui/repository.html#bluemix-plugins)
4. Go to the directory you downloaded the image to, and install the plugin with:

  `bx plugin install <name-of-the-dev-plugin>`

#### IBM Bluemix DevOps setup (optional) 

[![Create Toolchain](https://console.ng.bluemix.net/devops/graphics/create_toolchain_button.png)](https://console.ng.bluemix.net/devops/setup/deploy/)

[IBM Bluemix DevOps](https://www.ibm.com/cloud-computing/bluemix/devops) services provides toolchains as a set of tool integrations that support development, deployment, and operations tasks inside Bluemix. The "Create Toolchain" button creates a DevOps toolchain and acts as a single-click deploy to Bluemix including provisioning all required services. 

***Note** you must publish your project to [Github](https://github.com/) for this to work.

### Configuration

Your application configuration information is stored in `config.json`. If you selected services added to your project, you will see Cloudant, Object Storage, and other services with their connection information such as username, password, and hostname listed here. This is useful for connecting to remote services while running your application locally.

When you push your application to Bluemix, however, these values are no longer used, and instead Bluemix automatically connects to those bound services through the use of environment variables. The `config.json` file has been added to the `.gitignore` file so you don't accidently check in the secret credentials.


### Run
#### Using Bluemix development CLI
The Bluemix development plugin makes it easy to compile and run your application if you do not have all of the tools installed on your computer yet. Your application will be compiled with Docker containers. To compile and run your app, run:

```bash
bx dev run
```

Your application will be running at `http://localhost:8080/`.

#### Using a local development environment
Once the Swift toolchain has been installed, you can compile a Swift project with:

```bash
swift build -Xlinker -lc++
```

Your sources will be compiled to your `.build/debug` directory.


#### Endpoints

Your application is running at: `http://localhost:8080/` in your browser.

- Your [Swagger UI](http://swagger.io/swagger-ui/) is running on: `/explorer`
- Your Swagger definition is running on: `/swagger/api`
