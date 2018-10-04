heroku-buildpack-julia
======================

This is a [Heroku buildpack](https://devcenter.heroku.com/articles/buildpacks) for [Julia](http://julialang.org) apps.

In order to use this buildpack simply use a project using Julia 1.0 (containing `Project.toml` & `Manifest.toml`) and the buildpack will install all the project dependencies in build time.

Make sure your main file is app.jl and have a Procfile as follow
```
web: julia --project=$(pwd) --sysimage-native-code=yes --compiled-modules=no app.jl $PORT
```
