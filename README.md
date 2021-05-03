heroku-buildpack-julia
======================

This is a [Heroku buildpack](https://devcenter.heroku.com/articles/buildpacks) for [Julia](http://julialang.org) apps.

[JuliCon 2019 Presentation Video](https://www.youtube.com/watch?v=p--assaV64g)

[Example](https://github.com/Optomatica/heroku-julia-sample) project that uses this buildpack with Mux.jl.

In order to use this buildpack simply use a project containing `Project.toml` & a `Manifest.toml`.
Instead of a Manifest, you can also use Compat entries and CompatHelper.
The buildpack will install all the project dependencies in build time.

You can also specify Julia version you want to use in [`Project.toml`](https://julialang.github.io/Pkg.jl/v1/compatibility) or use the buildpack default version.

To run the server for your project you can use something like
```
web: julia --project 'using Foo; Foo.serve($PORT)'
```
where `Foo` is the name of your project and `serve` is a method which receives a port as a Number.
Note that it it important for your app to receive the port number correctly and quickly bind to it, so that your app can be deployed.
