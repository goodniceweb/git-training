## Setup

```
gem install bundler
bundle
```

## Usage

```
  ruby make_commit.rb <args>

  Usage:

    -f, --filename FILE_NAME
    Optional file name for creating new commit

    -e, --extension FILE_EXTENSION
    Optional file extension for creating new commit

    -d, --directory DIRECTORY
    Optional directory for creating new commit

    -n, --number COMMIT_NUMBER
    Number of commits you want to create

    -t, --text FILE_CONTENT
    Optional file text

```

## Examples

```
# creates 4 commits in my_dir folder 
ruby make_commit.rb -d my_dir -c 4

# creates commit with a file contents text 'test'
ruby make_commit.rb -t test
```
