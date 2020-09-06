---
title: "Leveraging Environment Variable in Rust Apps"
layout: post
author: ptillemans
categories: rust env
excerpt_separator: <!--more-->
---
# Environment Variables 

Environment variable have gained a lot of importance since the rise of the container
based deployments and (consequently) the popularity of the [12 factor app](https://12factor.net/).

It also has become very practical with the widespread support of the *.env* file in
the project folder which makes configuring apps during development very practical.

<!--more-->

# Using environment in Rust

The [std::env](https://doc.rust-lang.org/std/env/index.html) package gives access to the environment variables, and also information about the working directory, the location of the program executing, temp folder, etc...

The method we really are interested in is [var](https://doc.rust-lang.org/std/env/fn.var.html).

    match env::var("MQTT_BROKER") {
        Ok(mqtt_broker) => mqtt_init(&mqtt_broker).await,
        Err(e) => error!("No broker specified in MQTT_BROKER environment variable.({})", e)
    }

It returns a *Result<String, VarError>* which we can easily pattern match on and give readable feedback to the user.

I thing this is perfectly fine for simple, small apps I am likely to write in the foreseeable future.

# Controlling Logging from the Environment

Another thing needed for smallisch apps is a logging system with the following requirements:

- Controllable via environment 
- Add a timestamp
- Output to stdout or stderr (a 12 factor thing)
- Namespace modules
- Override config for specific modules

Rust has a standard logging API defined in the [log crate](https://docs.rs/log/0.4.11/log/)  crate for which a large selection of implementations is available.

The first one on the [list with implementations](https://docs.rs/log/0.4.11/log/#available-logging-implementations) fit all my requirements, so that's fine.

All we need to do is initialize it after reading the environment variables from the *.env* file :

    async fn main() {
        dotenv::dotenv().ok();
        env_logger::init();
        ...

and we are logging using the standard `debug!`, `info!`, `warn!`, ... macros.  

# Scaling to larger apps

When apps grow (or just when they live long enough) they tend to accumulate config options and layers of modules making logging also a headache.

When confronted with these issues I saw that the *config* and *envy* crates offer nice layered configuration support and straightforward pouring in type safe structs.

Similarly there are more flexible, and consequently more complex, logging frameworks like *log4rs*. There are also structured logging libraries but I still need to see how these can work in containers without adding additional hoops to jump through.

Let's hope my apps stay small and simple and do not need this additional complexity.
