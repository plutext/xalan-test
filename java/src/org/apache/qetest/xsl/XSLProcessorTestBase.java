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
 * XSLProcessorTestBase.java
 *
 */
package org.apache.qetest.xsl;

import org.apache.qetest.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.util.Properties;
import java.util.Vector;

//------------------------------------------------------------------------

/**
 * Base class for all Xalan tests.
 * <p>XSLProcessorTestBase defines a number of common fields
 * that most tests will use in addition to FileBasedTest.  It
 * also defaults to using an XMLFileLogger as well as a
 * ConsoleLogger, if none have been specified.</p>
 * <ul>initializes all members from FileBasedTest, plus
 * <li>category</li>
 * <li>excludes</li>
 * <li>liaison</li>
 * <li>flavor</li>
 * <li>diagnostics</li>
 * <li>noReuse</li>
 * <li>precompile</li>
 * <li>runErr</li>
 * </ul>
 * @author Shane_Curcuru@lotus.com
 * @version $Id$
 */
public class XSLProcessorTestBase extends FileBasedTest
{

    /**
     * Convenience method to print out usage information.
     * @author Shane Curcuru
     *
     * NEEDSDOC ($objectName$) @return
     */
    public String usage()
    {

        return ("Common options supported by XSLProcessorTestBase:\n"
                + "    -" + OPT_CATEGORY
                + "  <name of single subdir within testDir to run>\n"
                + "    -" + OPT_EXCLUDES
                + "  <list;of;specific file.xsl tests to skip>\n" + "    -"
                + OPT_LIAISON + "   <liaisonClassName>\n" + "    -"
                + OPT_FLAVOR
                + "    <xalan|lotusxsl|xt|etc... - which kind of Processor to test>\n"
                + "    -" + OPT_DIAGNOSTICS
                + "  <root filename for diagnostics output>\n" + "    -"
                + OPT_NOREUSE
                + "   (will force recreate processor each time)\n" + "    -"
                + OPT_PRECOMPILE
                + " (will use precompiled stylesheet, if applicable)\n"
                + "    -" + OPT_NOERRTEST
                + "  (will skip running 'err' tests, if applicable)\n"
                + super.usage());
    }

    //-----------------------------------------------------
    //-------- Constants for common input params --------
    //-----------------------------------------------------

    /**
     * Parameter: Only run a single subcategory of the tests.
     * <p>Default: blank, runs all tests - supply the directory name
     * of a subcategory to run just that set.</p>
     */
    public static final String OPT_CATEGORY = "category";

    /** NEEDSDOC Field category          */
    protected String category = null;

    /**
     * Parameter: Reuse/reset processor between cases or create a new one each time?
     * <p>Default: false - create one processor and call reset between tests.</p>
     */

    // TODO: Move to directoryiterator
    public static final String OPT_NOREUSE = "noReuse";

    /** NEEDSDOC Field noReuse          */
    protected boolean noReuse = true;

    /**
     * Parameter: What parser liaison or option to use?
     * <p>Default: null, Whichever default your processor uses.</p>
     */

    // TODO: Move to directoryiterator
    public static final String OPT_LIAISON = "liaison";

    /** NEEDSDOC Field liaison          */
    protected String liaison = null;

    /**
     * Parameter: What flavor of ProcessorWrapper to use: trax|xalan1|other?
     * <p>Default: trax.</p>
     */
    public static final String OPT_FLAVOR = "flavor";

    /** NEEDSDOC Field flavor          */
    protected String flavor = "trax";

    /**
     * Parameter: Name of output file for diagnostics/error logs?
     * <p>Default: null, do not use one</p>
     */

    // TODO: Move to directoryiterator
    public static final String OPT_DIAGNOSTICS = "diagnostics";

    /** NEEDSDOC Field diagnostics          */
    protected String diagnostics = null;

    /**
     * Parameter: Should we try to use a precompiled stylesheet?
     * <p>Default: false, no (not applicable in all cases).</p>
     */
    public static final String OPT_PRECOMPILE = "precompile";

    /** NEEDSDOC Field precompile          */
    protected boolean precompile = false;

    /**
     * Parameter: Should we run any 'err' subdir tests or not?
     * <p>Default: false (i.e. <b>do</B> run error tests by default).</p>
     * @todo update, this is clumsy (reverse double negative option)
     */
    public static final String OPT_NOERRTEST = "noErrTest";

    /** NEEDSDOC Field noErrTest          */
    protected boolean noErrTest = false;

    /**
     * Parameter: force use of URI's for Xerces 1.1.2 or leave filenames alone?
     * <p>Default: true, use URI's</p>
     * @todo update, this is clumsy
     */
    public static final String OPT_USEURI = "useURI";

    /** NEEDSDOC Field useURI          */
    protected boolean useURI = true;

    /**
     * Parameter: Which CheckService should we use for XML output Files?
     * <p>Default: org.apache.qetest.SimpleFileCheckService.</p>
     */
    public static final String OPT_FILECHECKER = "fileChecker";

    /** NEEDSDOC Field fileCheckerName          */
    protected String fileCheckerName =
        "org.apache.qetest.SimpleFileCheckService";

    /** NEEDSDOC Field fileChecker          */
    protected CheckService fileChecker = null;

    /**
     * Parameter: Should we exclude any specific test files?
     * <p>Default: null (no excludes; otherwise specify semicolon delimited list like 'axes01.xsl;bool99.xsl').</p>
     */
    public static final String OPT_EXCLUDES = "excludes";

    /** NEEDSDOC Field excludes          */
    protected String excludes = null;

    /**
     * Default constructor - initialize testName, Comment.
     */
    public XSLProcessorTestBase()
    {

        // Only set them if they're not set
        if (testName == null)
            testName = "XSLProcessorTestBase.defaultName";

        if (testComment == null)
            testComment = "XSLProcessorTestBase.defaultComment";
    }

    //-----------------------------------------------------
    //-------- Implement Test/TestImpl methods --------
    //----------------------------------------------------

    /**
     * Initialize this test - called once before running testcases.
     * <p>Use the loggers field to create some loggers in a Reporter.</p>
     * @author Shane_Curcuru@lotus.com
     *
     * NEEDSDOC @param p
     *
     * NEEDSDOC ($objectName$) @return
     */
    public boolean preTestFileInit(Properties p)
    {

        // Ensure we have an XMLFileLogger if we have a logName
        String logF = testProps.getProperty(Logger.OPT_LOGFILE);

        if ((logF != null) && (!logF.equals("")))
        {

            // We should ensure there's an XMLFileReporter
            String r = testProps.getProperty(Reporter.OPT_LOGGERS);

            if (r == null)
            {
                testProps.put(Reporter.OPT_LOGGERS,
                              "org.apache.qetest.XMLFileLogger");
            }
            else if (r.indexOf("XMLFileLogger") <= 0)
            {
                testProps.put(Reporter.OPT_LOGGERS,
                              r + Reporter.LOGGER_SEPARATOR
                              + "org.apache.qetest.XMLFileLogger");
            }
        }

        // Ensure we have a ConsoleLogger unless asked not to
        // @todo improve and document this feature
        String noDefault = testProps.getProperty("noDefaultReporter");

        if (noDefault == null)
        {

            // We should ensure there's an XMLFileReporter
            String r = testProps.getProperty(Reporter.OPT_LOGGERS);

            if (r == null)
            {
                testProps.put(Reporter.OPT_LOGGERS,
                              "org.apache.qetest.ConsoleLogger");
            }
            else if (r.indexOf("ConsoleLogger") <= 0)
            {
                testProps.put(Reporter.OPT_LOGGERS,
                              r + Reporter.LOGGER_SEPARATOR
                              + "org.apache.qetest.ConsoleLogger");
            }
        }

        // Pass our properties block directly to the reporter
        //  so it can use the same values in initialization
        // A Reporter will auto-initialize from the values
        //  in the properties block
        setReporter(new Reporter(p));
        reporter.addDefaultLogger();  // add default logger if needed
        reporter.testFileInit(testName, testComment);

        // Fixup some paths to be absolute, see method comments for @todo
        fixupPaths();

        // Create a file-based CheckService for later use
        if (fileChecker == null)
        {
            try
            {
                Class fClass = Class.forName(fileCheckerName);

                fileChecker = (CheckService) fClass.newInstance();

                reporter.logTraceMsg("Using file-based CheckService: "
                                     + fileChecker);
            }
            catch (Exception e)
            {
                reporter.logWarningMsg("Failed to create an instance of "
                                       + fileCheckerName + ": "
                                       + e.toString());

                // This could cause NullPointerExceptions for those 
                //  tests that rely on our fileChecker...
            }
        }

        return true;
    }

    // use other implementations from FileBasedTest
    //-----------------------------------------------------
    //-------- Initialize our common input params --------
    //-----------------------------------------------------

    /**
     * Set our instance variables from a Properties file.
     * Calls super.initializeFromProperties() to get defaults.
     * @author Shane Curcuru
     * @param Properties block to set name=value pairs from
     *
     * NEEDSDOC @param props
     * @return status - true if OK, false if error.
     * @todo improve error checking, if needed
     */
    public boolean initializeFromProperties(Properties props)
    {

        debugPrintln("XSLProcessorTestBase.initializeFromProperties(" + props
                     + ")");

        boolean b = super.initializeFromProperties(props);

        category = props.getProperty(OPT_CATEGORY, category);

        if (category != null)
            testProps.put(OPT_CATEGORY, category);

        liaison = props.getProperty(OPT_LIAISON, liaison);

        if (liaison != null)
            testProps.put(OPT_LIAISON, liaison);

        flavor = props.getProperty(OPT_FLAVOR, flavor);

        if (flavor != null)
            testProps.put(OPT_FLAVOR, flavor);

        fileCheckerName = props.getProperty(OPT_FILECHECKER, fileCheckerName);

        if (fileCheckerName != null)
            testProps.put(OPT_FILECHECKER, fileCheckerName);

        excludes = props.getProperty(OPT_EXCLUDES, excludes);

        if (excludes != null)
            testProps.put(OPT_EXCLUDES, excludes);

        diagnostics = props.getProperty(OPT_EXCLUDES, diagnostics);

        if (diagnostics != null)
            testProps.put(OPT_EXCLUDES, diagnostics);

        String prec = props.getProperty(OPT_PRECOMPILE);

        if ((prec != null) && prec.equalsIgnoreCase("true"))
        {
            precompile = true;

            testProps.put(OPT_PRECOMPILE, "true");
        }

        String noet = props.getProperty(OPT_NOERRTEST);

        if ((noet != null) && noet.equalsIgnoreCase("true"))
        {
            noErrTest = true;

            testProps.put(OPT_NOERRTEST, "true");
        }

        String uURI = props.getProperty(OPT_USEURI);

        if ((uURI != null) && uURI.equalsIgnoreCase("false"))
        {
            useURI = false;

            testProps.put(OPT_USEURI, "false");
        }

        return b;
    }

    /**
     * Sets the provided fields with data from an array, presumably
     * from the command line.
     * <p>Overridden from FileBasedTest, but calls super.() to
     * get default properties.</p>
     * @author Shane Curcuru
     *
     * NEEDSDOC @param args
     * @return status - true if OK, false if error.
     */
    public boolean initializeFromArray(String[] args)
    {

        debugPrintln("XSLProcessorTestBase.initializeFromArray(" + args
                     + ")");

        // Read in command line args and setup internal variables
        String optPrefix = "-";
        int nArgs = args.length;

        if (nArgs == 0)
        {
            System.out.println("ERROR: you must supply required arguments!");

            return false;
        }

        // Our parent class already read in the properties file
        //  override values from properties file
        for (int k = 0; k < nArgs; k++)
        {
            if (args[k].equalsIgnoreCase(optPrefix + OPT_LOAD))
            {
                if (++k >= nArgs)
                {
                    System.out.println(
                        "ERROR: must supply properties filename for: "
                        + optPrefix + OPT_LOAD);

                    return false;
                }

                load = args[k];

                try
                {

                    // Load named file into our properties block
                    FileInputStream fIS = new FileInputStream(load);
                    Properties p = new Properties();

                    p.load(fIS);
                    initializeFromProperties(p);
                }
                catch (Exception e)
                {
                    System.out.println(
                        "ERROR: loading properties file failed: " + load);
                    e.printStackTrace();

                    return false;
                }

                break;
            }
        }

        // Now read in the rest of the command line
        // @todo cleanup loop to be more table-driven
        for (int i = 0; i < nArgs; i++)
        {
            if (args[i].equalsIgnoreCase(optPrefix + OPT_CATEGORY))
            {
                if (++i >= nArgs)
                {
                    System.out.println("ERROR: must supply arg for: "
                                       + optPrefix + OPT_CATEGORY);

                    return false;
                }

                category = args[i];

                testProps.put(OPT_CATEGORY, category);

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_LIAISON))
            {
                if (++i >= nArgs)
                {
                    System.out.println("ERROR: must supply arg for: "
                                       + optPrefix + OPT_LIAISON);

                    return false;
                }

                liaison = args[i];

                testProps.put(OPT_LIAISON, liaison);

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_FLAVOR))
            {
                if (++i >= nArgs)
                {
                    System.out.println("ERROR: must supply arg for: "
                                       + optPrefix + OPT_FLAVOR);

                    return false;
                }

                flavor = args[i];

                testProps.put(OPT_FLAVOR, flavor);

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_DIAGNOSTICS))
            {
                if (++i >= nArgs)
                {
                    System.out.println("ERROR: must supply arg for: "
                                       + optPrefix + OPT_DIAGNOSTICS);

                    return false;
                }

                diagnostics = args[i];

                testProps.put(OPT_DIAGNOSTICS, diagnostics);

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_FILECHECKER))
            {
                if (++i >= nArgs)
                {
                    System.out.println("ERROR: must supply arg for: "
                                       + optPrefix + OPT_FILECHECKER);

                    return false;
                }

                fileCheckerName = args[i];

                testProps.put(OPT_FILECHECKER, fileCheckerName);

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_EXCLUDES))
            {
                if (++i >= nArgs)
                {
                    System.out.println("ERROR: must supply arg for: "
                                       + optPrefix + OPT_EXCLUDES);

                    return false;
                }

                excludes = args[i];

                testProps.put(OPT_EXCLUDES, excludes);

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_NOREUSE))
            {
                noReuse = false;

                testProps.put(OPT_NOREUSE, "false");

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_PRECOMPILE))
            {
                precompile = true;

                testProps.put(OPT_PRECOMPILE, "true");

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_NOERRTEST))
            {
                noErrTest = true;

                testProps.put(OPT_NOERRTEST, "true");

                continue;
            }

            if (args[i].equalsIgnoreCase(optPrefix + OPT_USEURI))
            {
                useURI = false;  // Toggle from default of true; ugly but I'm in a hurry

                testProps.put(OPT_USEURI, "false");

                continue;
            }
        }

        // Be sure to ask our superclass to read it's options as well!
        return super.initializeFromArray(args, false);
    }

    //-----------------------------------------------------
    //-------- Other useful and utility methods --------
    //-----------------------------------------------------

    /**
     * Worker method to fixup pathing for diagnostics.
     * @todo - this is a hack, we may not even need it
     * @author Shane Curcuru
     */
    public void fixupPaths()
    {

        // Convert all dir references to absolute ones, to get around 
        //  potential problems with relative paths and test harnesses
        //  that change the current directory
        // Try getCanonicalPath first; otherwise default to getAbsolutePath()
        // @todo also implement logFile
        if (diagnostics != null)
        {
            File tempF = new File(diagnostics);

            try
            {
                diagnostics = tempF.getCanonicalPath();
            }
            catch (IOException ioe1)
            {
                diagnostics = tempF.getAbsolutePath();
            }

            reporter.logTraceMsg(OPT_DIAGNOSTICS + " reset to absolute: "
                                 + diagnostics);
        }
    }

    /**
     * Main worker method to run test from the command line.
     * Test subclasses generally need not override.
     * <p>This is primarily provided to make subclasses implementations
     * of the main method as simple as possible: in general, they
     * should simply do:
     * <code>
     *   public static void main (String[] args)
     *   {
     *       TestSubClass app = new TestSubClass();
     *       app.doMain(args);
     *   }
     * </code>
     * @author Shane Curcuru
     *
     * NEEDSDOC @param args
     */
    public void doMain(String[] args)
    {

        debugPrintln("XSLProcessorTestBase.doMain(" + args + ")");

        // Initialize any instance variables from the command line 
        //  OR specified properties block
        if (!initializeFromArray(args))
        {
            System.err.println("ERROR in usage:");
            System.err.println(usage());

            // Don't use System.exit, since that will blow away any containing harnesses
            return;
        }

        // Also pass along the command line, in case someone has 
        //  specific code that's counting on this
        testProps.put(MAIN_CMDLINE, args);
        runTest(testProps);
    }

    /**
     * Main method to run test from the command line.
     * @author Shane Curcuru
     * <p>Test subclasses <b>must</b> override, obviously.
     * Only provided here for debugging.</p>
     *
     * NEEDSDOC @param args
     */
    public static void main(String[] args)
    {

        XSLProcessorTestBase app = new XSLProcessorTestBase();

        app.debug = true;  // HACK

        app.doMain(args);
    }
}  // end of class XSLProcessorTestBase
