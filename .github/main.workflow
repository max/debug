workflow "build and test" {
  on = "push"
  resolves = "test:coverage"
}

action "lint" {
  uses = "actions/npm@master"
  args = ["run", "lint"]
}

action "test" {
  needs = ["lint"]
  uses = "actions/npm@master"
  args = ["test"]
}

action "test:coverage" {
  needs = ["test"]
  uses = "actions/npm@master"
  args = ["run", "test:coverage"]
}
