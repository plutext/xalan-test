/*
 * The Apache Software License, Version 1.1
 *
 *
 * Copyright (c) 2000 The Apache Software Foundation.  All rights 
 * reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:  
 *       "This product includes software developed by the
 *        Apache Software Foundation (http://www.apache.org/)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Xalan" and "Apache Software Foundation" must
 *    not be used to endorse or promote products derived from this
 *    software without prior written permission. For written 
 *    permission, please contact apache@apache.org.
 *
 * 5. Products derived from this software may not be called "Apache",
 *    nor may "Apache" appear in their name, without prior written
 *    permission of the Apache Software Foundation.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL THE APACHE SOFTWARE FOUNDATION OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of the Apache Software Foundation and was
 * originally based on software copyright (c) 2000, Lotus
 * Development Corporation., http://www.lotus.com.  For more
 * information on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 */

/*
 *
 * Logger.java
 *
 */
package org.apache.qetest;

import java.util.Hashtable;
import java.util.Properties;

/**
 * Interface defining a utility that can log out test results.
 * This interface defnines a standalone utility that can be used
 * to report the results of a test.  It would commonly be used by a
 * testing utility library to produce actual output from the run
 * of a test file.
 * <p>The Logger defines a minimal interface for expressing the result
 * of a test in a generic manner.  Different Loggers can be written
 * to both express the results in different places (on a live console,
 * in a persistent file, over a network) and in different formats -
 * perhaps an XMLTestLogger would express the results in an
 * XML file or object.</p>
 * <p>In many cases, tests will actually call a Reporter, which
 * acts as a composite for Logger objects, and includes numerous
 * useful utility and convenience methods.</p>
 * <ul>Loggers explicitly have a restricted set of logging calls for
 * two main reasons:
 * <li>To help keep tests structured</li>
 * <li>To make it easier to generate 'reports' based on test output
 * (i.e. number of tests passed/failed, graphs of results, etc.)</li>
 * </ul>
 * @author Shane_Curcuru@lotus.com
 * @version $Id$
 * @todo maybe add set/getOutput methods? Would allow most
 * types of loggers to get output streams, etc. externally
 */
public interface Logger
{

    //-----------------------------------------------------
    //-------- Constants for common input params --------
    //-----------------------------------------------------

    /**
     * Parameter: FQCN of Logger(s) to use.
     * <p>Default: usually none, but implementers may choose to call
     * setupDefaultLogger(). Will accept multiple classnames separated
     * by ";" semicolon. Format:
     * <code>-reporters org.apache.qetest.ConsoleLogger;org.apache.qetest.SomeOtherLogger</code></p>
     */
    public static final String OPT_LOGGERS = "loggers";

    /** NEEDSDOC Field LOGGER_SEPARATOR          */
    public static final String LOGGER_SEPARATOR = ";";

    /**
     * A default Logger classname - ConsoleLogger.
     */
    public static final String DEFAULT_LOGGER =
        "org.apache.qetest.ConsoleLogger";

    /**
     * Parameter: level of output to log, int 0-99.
     */
    public static final String OPT_LOGGINGLEVEL = "loggingLevel";

    /**
     * Parameter: if we should log performance data, true/false.
     */
    public static final String OPT_PERFLOGGING = "perfLogging";

    /**
     * Parameter: if we should dump debugging info to System.err.
     */
    public static final String OPT_DEBUG = "debug";

    /**
     * Parameter: Name of test results file for file-based Loggers.
     * <p>File-based loggers should use this key as an initializer
     * for the name of their output file
     * Commandline Format: <code>-logFile path\to\ResultsFileName.ext</code>
     * Properties file Format: <code>logFile=path\\to\\ResultsFileName.ext</code></p>
     */
    public static final String OPT_LOGFILE = "logFile";

    /**
     * Parameter: Indent depth for console or HTML/XML loggers.
     * <p>Loggers may use this as an integer number of spaces to
     * indent, as applicable to their situation.
     * Commandline Format: <code>-indent <i>nn</i></code>
     * Properties file Format: <code>indent=<i>nn</i></code></p>
     */
    public static final String OPT_INDENT = "indent";

    //-----------------------------------------------------
    //-------- Constants for Logger and Reporter interactions --------
    //-----------------------------------------------------

    /**
     * This determines the amount of data actually logged out to results.
     * <p>Loggers merely use these constants in their output formats.
     * Reporters will only call contained Loggers to report messages
     * at the current logging level and higher.
     * For example, if you <code>setLoggingLevel(ERRORMSG)</code> then INFOMSGs
     * will not be reported, presumably speeding execution time and saving
     * output log space.  These levels are also coded into most Logger output,
     * allowing for easy reporting of various levels of results.</p>
     * <ul>Allowable values are:
     * <li>CRITICALMSG - Must-be-printed messages; may print only selected
     * fails (and skip printing most passes).</li>
     * <li>ERRORMSG - Logs an error and (optionally) a fail.</li>
     * <li>FAILSONLY - Skips logging out most pass messages (still
     * reports testFileResults) but prints out all fails.</li>
     * <li>WARNINGMSG - Used for non-fail warnings - the test will
     * continue, hopefully sucessfully.</li>
     * <li>STATUSMSG - Reports on basic status of the test, when you
     * want to include more detail than in a check() call</li>
     * <li>INFOMSG - For more basic script debugging messages.</li>
     * <li>TRACEMSG - Tracing all operations, detailed debugging information.</li>
     * </ul>
     * @see #logMsg(int, java.lang.String)
     */
    // Levels are separated in actual values in case you wish to add your own levels in between
    public static final int CRITICALMSG = 0;  // Lowest possible loggingLevel

    /** NEEDSDOC Field ERRORMSG          */
    public static final int ERRORMSG = 10;

    /** NEEDSDOC Field FAILSONLY          */
    public static final int FAILSONLY = 20;

    /** NEEDSDOC Field WARNINGMSG          */
    public static final int WARNINGMSG = 30;

    /** NEEDSDOC Field STATUSMSG          */
    public static final int STATUSMSG = 40;

    /** NEEDSDOC Field INFOMSG          */
    public static final int INFOMSG = 50;

    /** NEEDSDOC Field TRACEMSG          */
    public static final int TRACEMSG = 60;  // Highest possible loggingLevel

    /** NEEDSDOC Field DEFAULT_LOGGINGLEVEL          */
    public static final int DEFAULT_LOGGINGLEVEL = STATUSMSG;

    /**
     * Constants for tracking results by testcase or testfile.
     * <p>Testfiles default to an incomplete or INCP_RESULT.  If a
     * test never successfully calls a check* method, it's result
     * will be incomplete.</p>
     * <p>Note that a test cannot explicitly reset it's result to be INCP.</p>
     */

    // Note: implementations should never rely on the actual values
    //       of these constants, except possibly to ensure that 
    //       overriding values are > greater than other values
    public static final int INCP_RESULT = 0;

    // Note: string representations are explicitly set to all be 
    //       4 characters long to make it simpler to parse results

    /** NEEDSDOC Field INCP          */
    public static final String INCP = "Incp";

    /**
     * Constants for tracking results by testcase or testfile.
     * <p>A PASS_RESULT signifies that a specific test point (or a testcase,
     * or testfile) has perfomed an operation correctly and has been verified.</p>
     * <p>A pass overrides an incomplete.</p>
     * @see #checkPass(java.lang.String)
     */
    public static final int PASS_RESULT = 2;

    /** NEEDSDOC Field PASS          */
    public static final String PASS = "Pass";

    /**
     * Constants for tracking results by testcase or testfile.
     * <p>An AMBG_RESULT or ambiguous result signifies that a specific test
     * point (or a testcase, or testfile) has perfomed an operation but
     * that it has not been verified.</p>
     * <p>Ambiguous results can be used when the test may not have access
     * to baseline, or verified 'gold' result data.  It may also be used
     * during test file creation when the tester has not yet specified the
     * expected behavior of a test.</p>
     * <p>Ambiguous overrides both pass and incomplete.</p>
     * @see #checkAmbiguous(java.lang.String)
     */
    public static final int AMBG_RESULT = 5;

    /** NEEDSDOC Field AMBG          */
    public static final String AMBG = "Ambg";

    /**
     * Constants for tracking results by testcase or testfile.
     * <p>A FAIL_RESULT signifies that a specific test point (or a testcase,
     * or testfile) has perfomed an operation incorrectly.</p>
     * <p>A fail in one test point does not necessarily mean that other test
     * points are invalid - well written tests should be able to continue
     * and produce valid results for the rest of the test file.</p>
     * <p>A fail overrides any of incomplete, pass or ambiguous.</p>
     * @see #checkFail(java.lang.String)
     */
    public static final int FAIL_RESULT = 8;

    /** NEEDSDOC Field FAIL          */
    public static final String FAIL = "Fail";

    /**
     * Constants for tracking results by testcase or testfile.
     * <p>An ERRR_RESULT signifies that some part of the testfile
     * has caused an unexpected error, exception, or other Really Bad Thing.</p>
     * <p>Errors signify that something unexpected happened and that the test
     * may not produce valid results.  It would most commonly be used for
     * problems relating to setting up test data or errors with other software
     * being used (i.e. not problems with the actual software code that the
     * test is attempting to verify).</p>
     * <p>An error overrides <B>any</B> other result.</p>
     * @see #checkErr(java.lang.String)
     */
    public static final int ERRR_RESULT = 9;

    /** NEEDSDOC Field ERRR          */
    public static final String ERRR = "Errr";

    /**
     * Testfiles and testcases should default to incomplete.
     */
    public final int DEFAULT_RESULT = INCP_RESULT;

    //-----------------------------------------------------
    //-------- Control and utility routines --------
    //-----------------------------------------------------

    /**
     * Return a description of what this Logger/Reporter does.
     * @author Shane_Curcuru@lotus.com
     * @return description of how this Logger outputs results, OR
     * how this Reporter uses Loggers, etc..
     */
    public abstract String getDescription();

    /**
     * Returns information about the Property name=value pairs that
     * are understood by this Logger/Reporter.
     * @author Shane_Curcuru@lotus.com
     * @return same as {@link java.applet.Applet.getParameterInfo}.
     */
    public abstract String[][] getParameterInfo();

    /**
     * Accessor methods for a properties block.
     * @return our Properties block.
     */
    public abstract Properties getProperties();

    /**
     * Accessor methods for a properties block.
     * Always having a Properties block allows users to pass common
     * options to a Logger/Reporter without having to know the specific
     * 'properties' on the object.
     * <p>Much like in Applets, users can call getParameterInfo() to
     * find out what kind of properties are available.  Callers more
     * commonly simply call initialize(p) instead of setProperties(p)</p>
     * @author Shane_Curcuru@lotus.com
     * @param p Properties to set (should be cloned).
     */
    public abstract void setProperties(Properties p);

    /**
     * Call once to initialize this Logger/Reporter from Properties.
     * <p>Simple hook to allow Logger/Reporters with special output
     * items to initialize themselves.</p>
     * @author Shane_Curcuru@lotus.com
     * @param Properties block to initialize from.
     * @param status, true if OK, false if an error occoured.
     *
     * NEEDSDOC @param p
     *
     * NEEDSDOC ($objectName$) @return
     */
    public abstract boolean initialize(Properties p);

    /**
     * Is this Logger/Reporter ready to log results?
     * @author Shane_Curcuru@lotus.com
     * @return status - true if it's ready to report, false otherwise
     */
    public abstract boolean isReady();

    /**
     * Is this Logger/Reporter still running OK?
     * Note that a'la java.io.PrintWriter, this class should never
     * throw exceptions.  It will merely quietly fail and set this
     * error flag when something bad happens.
     * <p>Note this may have slightly different meanings for various
     * types of Loggers (file-based, network-based, etc.) or for
     * Reporters (which may still be able to function if only one
     * of their Loggers has an error)
     * @author Shane_Curcuru@lotus.com
     * @return status - true if an error has occoured, false if it's OK
     */
    public abstract boolean checkError();

    /**
     * Flush this Logger/Reporter - should ensure all output is flushed.
     * Note that the flush operation is not necessarily pertinent to
     * all types of Logger/Reporter - console-type Loggers no-op this.
     * @author Shane_Curcuru@lotus.com
     */
    public abstract void flush();

    /**
     * Close this Logger/Reporter - should include closing any OutputStreams, etc.
     * Logger/Reporters should return isReady() = false after closing.
     * @author Shane_Curcuru@lotus.com
     */
    public abstract void close();

    //-----------------------------------------------------
    //-------- Testfile / Testcase start and stop routines --------
    //-----------------------------------------------------

    /**
     * Report that a testfile has started.
     * Implementing Loggers must output/store/report a message
     * that the test file has started.
     * @author Shane_Curcuru@lotus.com
     * @param name file name or tag specifying the test.
     * @param comment comment about the test.
     */
    public abstract void testFileInit(String name, String comment);

    /**
     * Report that a testfile has finished, and report it's result.
     * Implementing Loggers must output a message that the test is
     * finished, and print the results.
     * @author Shane_Curcuru@lotus.com
     * @param msg message to log out
     * @param result result of testfile
     */
    public abstract void testFileClose(String msg, String result);

    /**
     * Report that a testcase has started.
     * @author Shane_Curcuru@lotus.com
     * @param comment short description of this test case's objective.
     */
    public abstract void testCaseInit(String comment);

    /**
     * Report that a testcase has finished, and report it's result.
     * Implementing classes must output a message that a testcase is
     * finished, and print the results.
     * @author Shane_Curcuru@lotus.com
     * @param msg message of name of test case to log out
     * @param result result of testfile
     */
    public abstract void testCaseClose(String msg, String result);

    //-----------------------------------------------------
    //-------- Test results logging routines --------
    //-----------------------------------------------------

    /**
     * Report a comment to result file with specified severity.
     * Print out the message, optionally along with the level (depends
     * on your storage mechanisim: console output probably doesn't need
     * the level, but a file output probably would want it.)
     * <p>Note that some Loggers may limit the comment string,
     * either in overall length or by stripping any linefeeds, etc.
     * This is to allow for optimization of file or database-type
     * reporters with fixed fields.  Users who need to log out
     * special string data should use logArbitrary() instead.</p>
     * <p>Remember, use {@link #checkPass(String)}, or
     * {@link #checkFail(String)}, etc. to report the actual
     * results of your tests.</p>
     * @author Shane_Curcuru@lotus.com
     * @param level severity of message.
     * @param msg comment to log out.
     */
    public abstract void logMsg(int level, String msg);

    /**
     * Report an arbitrary String to result file with specified severity.
     * Log out the String provided exactly as-is.
     * @author Shane_Curcuru@lotus.com
     * @param level severity or class of message.
     * @param msg arbitrary String to log out.
     */
    public abstract void logArbitrary(int level, String msg);

    /**
     * Logs out statistics to result file with specified severity.
     * This is a general-purpose way to log out numeric statistics.  We accept
     * both a long and a double to allow users to save whatever kind of numbers
     * they need to, with the simplest API.  The actual meanings of the numbers
     * are dependent on the implementer.
     * @author Shane_Curcuru@lotus.com
     * @param level severity of message.
     * @param lVal statistic in long format.
     * @param dVal statistic in double format.
     * @param msg comment to log out.
     */
    public abstract void logStatistic(int level, long lVal, double dVal,
                                      String msg);

    /**
     * Logs out a element to results with specified severity.
     * This method is primarily for Loggers that output to fixed
     * structures, like files, XML data, or databases.
     * @author Shane_Curcuru@lotus.com
     * @param level severity of message.
     * @param element name of enclosing element
     * @param attrs hash of name=value attributes
     * @param msg Object to log out; up to Loggers to handle
     * processing of this; usually logs just .toString().
     */
    public abstract void logElement(int level, String element,
                                    Hashtable attrs, Object msg);

    /**
     * Logs out contents of a Hashtable with specified severity.
     * <p>Loggers should store or log the full contents of the hashtable.</p>
     * @param level severity or class of message.
     * @param hash Hashtable to log the contents of.
     * @param msg decription of the Hashtable.
     */
    public abstract void logHashtable(int level, Hashtable hash, String msg);

    //-----------------------------------------------------
    //-------- Test results reporting check* routines --------
    //-----------------------------------------------------
    // There is no public void checkIncp(String comment) method

    /**
     * Writes out a Pass record with comment.
     * @author Shane_Curcuru@lotus.com
     * @param comment comment to log with the pass record.
     */
    public abstract void checkPass(String comment);

    /**
     * Writes out an ambiguous record with comment.
     * @author Shane_Curcuru@lotus.com
     * @param comment to log with the ambg record.
     */
    public abstract void checkAmbiguous(String comment);

    /**
     * Writes out a Fail record with comment.
     * @author Shane_Curcuru@lotus.com
     * @param comment comment to log with the fail record.
     */
    public abstract void checkFail(String comment);

    /**
     * Writes out an Error record with comment.
     * @author Shane_Curcuru@lotus.com
     * @param comment comment to log with the error record.
     */
    public abstract void checkErr(String comment);
}  // end of class Logger

