# Strike Obsfucation:

## About
This is an example script that uses Strike to obsfucate a database from a simple bash command


## Download and Install
```git clone https://github.com/glynrob/strike.git```

```sudo gem install strike```

Check strike has been installed correctly

```strike help```

If everything is working correctly then hook up your bash alias

Add the following line to either your .bashrc or .bash_alias ()

```nano ~/.bashrc```

```alias obfuscate='/path/to/repo/strike/obfuscate.sh'```

## Commands
> obfuscate /path/to/mysqldump.sql (required) /path/to/save/mysqldump_obfs.sql (optional)

## How to use
```obfuscate clear.sql```

This will take the file clear.sql and obfuscate it to clear_obfs.sql in the same directory.

```obfuscate /home/gr/clear.sql /shared/localdb.sql```

This will take the file /home/gr/clear.sql and obfuscate it to /shared/localdb.sql in the same directory.

## How to customise
Edit tables_definition.rb to match the tables and columns you which to obfuscate.

See (http://www.rubydoc.info/gems/strike/0.4.0) for options

### More Info
More information can be found at my blog (https://glynrob.com/database/strike-obfuscate-mysql-database/)
