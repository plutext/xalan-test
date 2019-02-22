# xalan-test

This is http://svn.apache.org/repos/asf/xalan/test/ converted from svn to git.

Plus the additional tests for Xalan-2419.

It is intended for use in conjunction with https://github.com/plutext/xalan-j/tree/Plutext_Java11

As such, Plutext_Java11_xalan-j_2_7_x is the default branch.

## Context

These are the old Xalan tests.

They pre-date/don't use junit :-(

## Java 11 testing

Use branch https://github.com/plutext/xalan-test/tree/Plutext_Java11_xalan-j_2_7_x 

It contains a couple of alterations to expected test output to accommodate Java 11 changes.

There are changes to ant build.xml, since -Xbootclasspath/p is no longer a supported option; it was removed in Java 9.

## Java 8 testing

Use branch https://github.com/plutext/xalan-test/tree/xalan-j_2_7_x

## Expected results

### minitest

```
sh build.sh minitest
```

minitest should pass using Java 8 and Java 11 .

### smoketest

```
sh build.sh smoketest
```

smoketest should pass using Java 8 and Java 11 .

### conf and perf

There are some failures with the conf and perf tests.  Did these ever pass?  I get these failures with the published xalan and serializer jars from maven central. The same tests fail for me under Java 8 and 11, on both master and branch xalan-j_2_7_x.


## Running the tests

You need to make certain libs available, I have a parent dir called xalan-test-parent:

```
	xalan-test-parent
	    xalan-test
	    java
			lib
				xercesImpl.jar
				xml-apis.jar
				serializer.jar
				xalan.jar     	
			tools
				ant.jar
				ant-launcher.jar
```

    
In other words, the xalan and serializer under test should be copied to the java/lib dir.

Prepare to run the tests:

```
$ sh build.sh jar
```

That should build xalan-test/java/build/testxsl.jar.  You may need to set JAVA_HOME eg `export JAVA_HOME=/usr/lib/jvm/default`

No need for anything like:
```
xalan-test$ /usr/lib/jvm/default/bin/java -classpath :../java/tools/ant.jar:../java/tools/ant-launcher.jar:../java/lib/serializer.jar:../java/lib/xercesImpl.jar:../java/lib/xml-apis.jar:../java/lib/xalan.jar:../java/lib/serializer.jar -Dant.home=../java -Dparserjar=../java/lib/xercesImpl.jar org.apache.tools.ant.Main
```

See further http://xml.apache.org/xalan-j/test/getstarted.html#how-to-build

Run the tests with a command like:

```
$ sh build.sh minitest
```
You can also run tests in your IDE.

You can run `org.apache.qetest.QetestUtils with eg someclass??? -goldDir tests/conf-gold -inputdir tests/conf`

Or you can run it with a specific test eg with arg: org.apache.qetest.trax.ToXMLStreamTest 

Or you can just run directly a test like ToXMLStreamTest which has a main method 


