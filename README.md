# Git Config Resource

Tracks the commits in a [git](http://git-scm.com/) repository.
Generates a global git config file


## Source Configuration

* `git_config`: *Required.* If specified as (list of pairs `name` and `value`)
  it will configure git global options, setting each name with each value.

  This can be useful to set options like `credential.helper` or similar.

  See the [`git-config(1)` manual page](https://www.kernel.org/pub/software/scm/git/docs/git-config.html)
  for more information and documentation of existing git options.

### Example

Resource configuration for a private repo:

``` yaml
resources:
- name: source-code
  type: git-config
  source:
    git_config:
    - name: core.bigFileThreshold
      value: 10m
```

## Behavior

### `check`: Check if git_config options changed.


### `in`: Clone the repository, at the given ref.

Generates the git config file

### `out`: Noop

### Running the tests

The tests have been embedded with the `Dockerfile`; ensuring that the testing
environment is consistent across any `docker` enabled platform. When the docker
image builds, the test are run inside the docker container, on failure they
will stop the build.

Run the tests with the following command:

```sh
docker build -t git-config-resource .
```
