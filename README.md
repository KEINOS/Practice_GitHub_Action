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

uses: actions/hello-world-docker-action@v1
with:
  who-to-greet: 'Mona the Octocat'
