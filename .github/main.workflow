workflow "build and test" {
  on = "push"
  resolves = "test:coverage"
}

action "install" {
  uses = "actions/npm@master"
  args = ["install"]
}

action "lint" {
  needs = ["install"]
  uses = "actions/npm@master"
  args = ["run", "lint"]
}

action "test" {
  needs = ["lint"]
  uses = "eirslett/chrome-karma-docker/docker/dev@master"
  runs = ["npm", "test"]
}

action "test:coverage" {
  needs = ["test"]
  uses = "actions/npm@master"
  args = ["run", "test:coverage"]
}
