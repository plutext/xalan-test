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
 * StreamResultAPITest.java
 *
 */
package org.apache.qetest.trax.stream;

// Support for test reporting and harness classes
import org.apache.qetest.*;
import org.apache.qetest.trax.*;
import org.apache.qetest.xsl.*;

// Import all relevant TRAX packages
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.sax.*;
import javax.xml.transform.stream.*;

// Needed SAX, DOM, JAXP classes

// java classes
import java.io.ByteArrayOutputStream;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.Writer;
import java.io.StringWriter;
import java.net.URL;
import java.util.Properties;

//-------------------------------------------------------------------------

/**
 * API Coverage test for the StreamResult class of TRAX..
 * @author shane_curcuru@lotus.com
 * @version $Id$
 */
public class StreamResultAPITest extends FileBasedTest
{

    /**
     * Provides nextName(), currentName() functionality for tests 
     * that may produce any number of output files.
     */
    protected OutputNameManager outNames;

    /** StreamImpIncl for testing systemId stuff.  */
    protected XSLTestfileInfo testFileInfo = new XSLTestfileInfo();

    /** StreamOutputFormat for testing types of output streams.  */
    protected XSLTestfileInfo outputFileInfo = new XSLTestfileInfo();

    /** Subdirectory under test\tests\api for our xsl/xml files.  */
    public static final String TRAX_STREAM_SUBDIR = "trax" + File.separator + "stream";


    /** Just initialize test name, comment, numTestCases. */
    public StreamResultAPITest()
    {
        numTestCases = 2;  // REPLACE_num
        testName = "StreamResultAPITest";
        testComment = "API Coverage test for the StreamResult class of TRAX.";
    }


    /**
     * Initialize this test - Set names of xml/xsl test files.
     *
     * @param p Properties to initialize from (if needed)
     * @return false if we should abort the test; true otherwise
     */
    public boolean doTestFileInit(Properties p)
    {
        // NOTE: 'reporter' variable is already initialized at this point

        // Used for all tests; just dump files in trax subdir
        File outSubDir = new File(outputDir + File.separator + TRAX_STREAM_SUBDIR);
        if (!outSubDir.mkdirs())
            reporter.logWarningMsg("Could not create output dir: " + outSubDir);
        // Initialize an output name manager to that dir with .out extension
        outNames = new OutputNameManager(outputDir + File.separator + TRAX_STREAM_SUBDIR
                                         + File.separator + testName, ".out");

        String testBasePath = inputDir 
                              + File.separator 
                              + TRAX_STREAM_SUBDIR
                              + File.separator;
        String goldBasePath = goldDir 
                              + File.separator 
                              + TRAX_STREAM_SUBDIR
                              + File.separator;

        testFileInfo.inputName = testBasePath + "StreamImpIncl.xsl";
        testFileInfo.xmlName = testBasePath + "StreamImpIncl.xml";
        testFileInfo.goldName = goldBasePath + "StreamImpIncl.out";
        outputFileInfo.inputName = testBasePath + "StreamOutputFormat.xsl";
        outputFileInfo.xmlName = testBasePath + "StreamOutputFormat.xml";
        outputFileInfo.goldName = goldBasePath + "StreamOutputFormat.out";
        try
        {
            TransformerFactory tf = TransformerFactory.newInstance();
            if (!(tf.getFeature(StreamSource.FEATURE)
                  && tf.getFeature(StreamResult.FEATURE)))
            {   // The rest of this test relies on Streams
                reporter.logErrorMsg("Streams not supported! Some tests may be invalid!");
            }
        }
        catch (Throwable t)
        {
            reporter.checkFail(
                "Problem creating factory; Some tests may be invalid!");
            reporter.logThrowable(reporter.ERRORMSG, t,
                                  "Problem creating factory; Some tests may be invalid!");
        }

        return true;
    }


    /**
     * Basic API coverage, constructor and set/get methods.
     *
     * @return false if we should abort the test; true otherwise
     */
    public boolean testCase1()
    {
        reporter.testCaseInit("Basic API coverage, constructor and set/get methods");

        reporter.logWarningMsg("public StreamResult(File f) not yet tested");

        // Default no-arg ctor sets nothing
        StreamResult defaultStream = new StreamResult();
        reporter.checkObject(defaultStream.getOutputStream(), null, "Default StreamResult should have null ByteStream");
        reporter.checkObject(defaultStream.getWriter(), null, "Default StreamResult should have null CharacterStream");
        reporter.check(defaultStream.getSystemId(), null, "Default StreamResult should have null SystemId");

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        StreamResult byteResult1 = new StreamResult(baos);
        reporter.checkObject(byteResult1.getOutputStream(), baos, "StreamResult(os) has ByteStream " + byteResult1.getOutputStream());
        reporter.checkObject(byteResult1.getWriter(), null, "StreamResult(os) should have null CharacterStream");
        reporter.check(byteResult1.getSystemId(), null, "StreamResult(os) should have null SystemId");

        StringWriter strWriter = new StringWriter();
        StreamResult readerResult1 = new StreamResult(strWriter);
        reporter.checkObject(readerResult1.getOutputStream(), null, "StreamResult(writer) should have null ByteStream");
        reporter.checkObject(readerResult1.getWriter(), strWriter, "StreamResult(writer) has CharacterStream " + readerResult1.getWriter());
        reporter.check(readerResult1.getSystemId(), null, "StreamResult(writer) should have null SystemId");

        StreamResult wackyStream = new StreamResult();
        wackyStream.setOutputStream(baos);
        OutputStream gotStream = wackyStream.getOutputStream();
        reporter.checkObject(gotStream, baos, "set/getOutputStream API coverage");

        wackyStream.setWriter(strWriter);
        Writer gotWriter = wackyStream.getWriter();
        reporter.checkObject(gotWriter, strWriter, "set/getWriter API coverage");

        wackyStream.setSystemId("new-system-id");
        String gotSystemId = wackyStream.getSystemId();
        reporter.check(gotSystemId, "new-system-id", "set/getSystemId API coverage");

        reporter.testCaseClose();
        return true;
    }


    /**
     * Basic functionality of StreamResults.
     *
     * @return false if we should abort the test; true otherwise
     */
    public boolean testCase2()
    {
        reporter.testCaseInit("Basic functionality of StreamResults");

        TransformerFactory factory = null;
        Source xslSource = null;
        Source xmlSource = null;
        Templates templates = null;
        try
        {
            factory = TransformerFactory.newInstance();
            // Create re-useable sources
            xslSource = new StreamSource(new FileInputStream(outputFileInfo.inputName));
            reporter.logTraceMsg("Create stream sources, templates");
            templates = factory.newTemplates(xslSource);
        }
        catch (Throwable t)
        {
            reporter.checkFail("Problem creating factory; can't continue testcase");
            reporter.logThrowable(reporter.ERRORMSG, t,
                                  "Problem creating factory; can't continue testcase");
            return true;
        }

        try
        {
            // Test some OutputStreams
            // Simple FileOutputStream is tested in numerous other tests
            Transformer transformer = templates.newTransformer();
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            Result result1 = new StreamResult(baos);
            reporter.logTraceMsg("About to Transform into ByteArrayOutputStream");

            // Note: must get a new xmlSource for each transform
            //  Should this really be necessary? I suppose 
            //  FileInputStreams don't just get 'reset' for you, 
            //  but it would be nice to reuse the StreamSources
            xmlSource = new StreamSource(new FileInputStream(outputFileInfo.xmlName));
            transformer.transform(xmlSource, result1);
            reporter.logTraceMsg("baos.size() is: " + baos.size());

            ByteArrayOutputStream baos2 = new ByteArrayOutputStream();
            PrintStream ps = new PrintStream(baos2);
            Result result2 = new StreamResult(ps);
            reporter.logTraceMsg("About to Transform into PrintStream");

            xmlSource = new StreamSource(new FileInputStream(outputFileInfo.xmlName));
            transformer.transform(xmlSource, result2);
            reporter.logTraceMsg("ps(baos2).size() is: " + baos2.size());

            if (!reporter.checkString(baos.toString(), baos2.toString(), "BAOS and PS output comparison"))
            {
                reporter.logArbitrary(reporter.TRACEMSG, "baos was: " + baos.toString());
                reporter.logArbitrary(reporter.TRACEMSG, "ps(baos2) was: " + baos2.toString());
            }
            writeFileAndValidate(baos.toString(), outputFileInfo.goldName);
        }
        catch (Throwable t)
        {
            reporter.checkFail("Problem with transform-streams(1)");
            reporter.logThrowable(reporter.ERRORMSG, t, "Problem with transform-streams(1)");
        }

        try
        {
            // Test some Writers
            Transformer transformer = templates.newTransformer();
            StringWriter sw = new StringWriter();
            Result result1 = new StreamResult(sw);
            reporter.logTraceMsg("About to Transform into StringWriter");
            xmlSource = new StreamSource(new FileInputStream(outputFileInfo.xmlName));
            transformer.transform(xmlSource, result1);

            CharArrayWriter cw = new CharArrayWriter();
            Result result2 = new StreamResult(cw);
            reporter.logTraceMsg("About to Transform into CharArrayWriter");
            xmlSource = new StreamSource(new FileInputStream(outputFileInfo.xmlName));
            transformer.transform(xmlSource, result2);

            if (!reporter.checkString(sw.toString(), cw.toString(), "SW and CW output comparison"))
            {
                reporter.logArbitrary(reporter.TRACEMSG, "sw was: " + sw.toString());
                reporter.logArbitrary(reporter.TRACEMSG, "cw was: " + cw.toString());
            }
            writeFileAndValidate(sw.toString(), outputFileInfo.goldName);
        }
        catch (Throwable t)
        {
            reporter.checkFail("Problem with transform-streams(2)");
            reporter.logThrowable(reporter.ERRORMSG, t, "Problem with transform-streams(2)");
        }

        try
        {
            // Test with systemId set
            // Note: may be affected by user.dir property; if we're 
            //  already in the correct place, this won't be different
            try
            {
                reporter.logTraceMsg("System.getProperty(user.dir) = " + System.getProperty("user.dir"));
            }
            catch (SecurityException e) // in case of Applet context
            {
                reporter.logTraceMsg("System.getProperty(user.dir) threw SecurityException");
            }
            Transformer transformer = templates.newTransformer();
            StringWriter sw1 = new StringWriter();
            Result result1 = new StreamResult(sw1);
            reporter.logTraceMsg("About to Transform into StringWriter w/out systemId set");
            xmlSource = new StreamSource(new FileInputStream(outputFileInfo.xmlName));
            transformer.transform(xmlSource, result1);

            StringWriter sw2 = new StringWriter();
            Result result2 = new StreamResult(sw2);
            result2.setSystemId("random-system-id");
            reporter.logTraceMsg("About to Transform into StringWriter w/ systemId set");
            xmlSource = new StreamSource(new FileInputStream(outputFileInfo.xmlName));
            transformer.transform(xmlSource, result2);
            reporter.check(result2.getSystemId(), "random-system-id", "systemId remains set after transform");

            if (!reporter.checkString(sw1.toString(), sw2.toString(), "Output comparison, with/without systemId"))
            {
                reporter.logArbitrary(reporter.TRACEMSG, "sw1 w/out systemId was: " + sw1.toString());
                reporter.logArbitrary(reporter.TRACEMSG, "sw2 w/ systemId was: " + sw2.toString());
            }
            writeFileAndValidate(sw1.toString(), outputFileInfo.goldName);
            reporter.logInfoMsg("@todo we should update XHTComparator for bogus systemId's like we have in this test");
            // @todo we should update XHTComparator for bogus systemId's like we have in this test
            // Note that using XHTFileCheckService, it always compares our 
            //  outputs using [text] since the XML parser usually throws:
            //  warning;org.xml.sax.SAXParseException: File "file:/E:/builds/xml-xalan/test/tests/api-gold/trax/stream/this-is-doctype-system" not found.
            if (reporter.getLoggingLevel() >= Reporter.TRACEMSG)
            {
                reporter.logArbitrary(reporter.TRACEMSG, fileChecker.getExtendedInfo());
            }
        }
        catch (Throwable t)
        {
            reporter.checkFail("Problem with transform-streams(3)");
            reporter.logThrowable(reporter.ERRORMSG, t, "Problem with transform-streams(3)");
        }

        reporter.testCaseClose();
        return true;
    }


    /**
     * Worker method to dump a string to a file and validate it.  
     * @return true if OK, false otherwise
     */
    public void writeFileAndValidate(String data, String goldFile)
    {
        try
        {
            FileWriter fw = new FileWriter(outNames.nextName());
            fw.write(data);
            fw.close();
            // Explicitly ask that Validation be turned off, since 
            //  we use bogus systemids
            fileChecker.setAttribute(XHTFileCheckService.SETVALIDATING, "false");
            fileChecker.check(reporter, 
                              new File(outNames.currentName()), 
                              new File(goldFile),
                              "writeStringToFile() checking: " + outNames.currentName());
        }
        catch (Exception e)
        {
            reporter.checkFail("writeStringToFile() threw: " + e.toString());
            reporter.logThrowable(Reporter.ERRORMSG, e, "writeStringToFile() threw");
        }
    }


    /**
     * Convenience method to print out usage information - update if needed.  
     * @return String denoting usage of this test class
     */
    public String usage()
    {
        return ("Common [optional] options supported by StreamResultAPITest:\n"
                + "(Note: assumes inputDir=.\\tests\\api)\n"
                + "REPLACE_any_new_test_arguments\n"
                + super.usage());   // Grab our parent classes usage as well
    }


    /**
     * Main method to run test from the command line - can be left alone.  
     * @param args command line argument array
     */
    public static void main(String[] args)
    {

        StreamResultAPITest app = new StreamResultAPITest();

        app.doMain(args);
    }
}
