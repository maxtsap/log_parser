## Setup

To use this script you need to install ruby `2.7.1` version.

After you install it, run the following command to install gems:

```
bundle install
```

## Run

To run the script type in command line:

```
bundle exec ruby parser.rb webserver.log
```

To run the tests type in command line:

```
bundle exec rspec
```

## Architecture

The main entry point is `parser.rb` file, which pass the control to `FileParser` class.
`FileParser` makes validation of the command line arguments and validation of file existence
(which could be extracted to separate classes), then uses `ParserFactory` class to detect proper
parser for the given file. It calls `process` on the returned parser class, which returns 
instance of `VisitingStatistic` as a result, and passes it to an output formatter(`StatisticFormatter`
by default). Formatter takes uniq views and total visits data from `VisitingStatistic`, formats it
and returns to `FileParser`, which returns it as an output of the script. 

### Notes

`ParserFactory` returns `Parser::Null` class if the file format is unknown. This class introduces
Null Object Pattern, which allows to avoid extra ifs.

`FileParser` receives `formatter` as an argument with default value `StatisticFormatter`. This is an
example of dependency injection principle, which makes testing easier and decrease coupling.
The same situation is in parser classes. 

