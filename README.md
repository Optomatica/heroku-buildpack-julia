heroku-buildpack-julia
======================

This is a [Heroku buildpack](https://devcenter.heroku.com/articles/buildpacks) for [Julia](http://julialang.org) apps.

[JuliCon 2019 Presentation Video](https://www.youtube.com/watch?v=p--assaV64g)

[Example](https://github.com/Optomatica/heroku-julia-sample) project that uses this buildpack with Mux.jl.

In order to use this buildpack simply use a project containing `Project.toml` & `Manifest.toml`. The buildpack will install all the project dependencies in build time.

You can also specify Julia version you want to use in [`Project.toml`](https://julialang.github.io/Pkg.jl/v1/compatibility) or use the buildpack default version.

Make sure you have a Procfile as follow 
```
web: julia --project src/app.jl $PORT
```

You can also replace `app.jl` with your main app file name.
