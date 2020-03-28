# Practice of Hello world docker GitHub action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.
Based on: https://help.github.com/en/actions/building-actions/creating-a-docker-container-action

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.

## Example usage

`./workflow/main.yml` sample. Place it in your repository.

```yaml
on: [push]

jobs:
  hello_world_job:
    runs-on: ubuntu-latest
    name: A job to say hello
    steps:
    - name: Hello world action step
      id: hello
      uses: KEINOS/Practice_GitHub_Action@v0.0.9
      with:
        # Must variable.
        who-to-greet: 'Mona the Octocat (From who-to-gree @ client workflow/main.yml)'
      env:
        # リポジトリの GitHub 設定にある "Secrets" にて設定された環境変数を渡す
        MY_SECRET_VALUE: ${{ secrets.MY_SECRET_VALUE }}
```
