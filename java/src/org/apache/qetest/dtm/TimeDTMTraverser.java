/*
 * Copyright 1999-2004 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*
 * $Id$
 */
package org.apache.qetest.dtm;

import org.apache.xml.dtm.Axis;
import org.apache.xml.dtm.DTM;


/**
 * Unit test for DTMManager/DTM
 *
 * Loads an XML document from a file (or, if no filename is supplied,
 * an internal string), then dumps its contents. Replaces the old
 * version, which was specific to the ultra-compressed implementation.
 * (Which, by the way, we probably ought to revisit as part of our ongoing
 * speed/size performance evaluation.)
 *
 * %REVIEW% Extend to test DOM2DTM, incremental, DOM view of the DTM, 
 * whitespace-filtered, indexed/nonindexed, ...
 * */
public class TimeDTMTraverser 
{

public static void main(String argv[])
  {
  	long dtmStart = 0;		// Time the creation of dtmManager, and dtm initialization.

  	System.out.println("\n#### Timing Traversal of DEEP documents. ####");

	StringBuffer buf = new StringBuffer();
											
	// Preload once to prime the JVM.
	DTM dtm = QeDtmUtils.createDTM(0, QeDtmUtils.deepFile, buf);
										  
	// Time the creation of the dtm
	buf.setLength(0);
	dtm = QeDtmUtils.createDTM(0, QeDtmUtils.deepFile, buf);  
	buf.setLength(0);
	dtm = QeDtmUtils.createDTM(0, QeDtmUtils.deepFile, buf);
	buf.setLength(0);
	dtm = QeDtmUtils.createDTM(0, QeDtmUtils.deepFile, buf);
	buf.setLength(0);
	dtm = QeDtmUtils.createDTM(0, QeDtmUtils.deepFile, buf);
	buf.setLength(0);
	dtm = QeDtmUtils.createDTM(0, QeDtmUtils.deepFile, buf);
																
	// Get various nodes to use as context nodes.
	int dtmRoot = dtm.getDocument();				// #document
	String dtmRootName = dtm.getNodeName(dtmRoot);	// Used for output
	int DNode = dtm.getFirstChild(dtmRoot);			// <Doc>
	String DNodeName = dtm.getNodeName(DNode);
	int ANode = dtm.getFirstChild(DNode);			// <A>
	String ANodeName = dtm.getNodeName(ANode);
	
	int[] rtData = {0,0,0};		// returns Traversal time, last node, number of nodes traversed 
										   
	// Get a traverser for Descendant:: axis.
	System.out.println("\n* DESCENDANT from "+"<"+DNodeName+">");
	QeDtmUtils.timeAxisTraverser(dtm, Axis.DESCENDANT, DNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);

	// Get a traverser for Descendant:: axis.
	System.out.println("\n* DESCENDANT-OR-SELF from "+"<"+DNodeName+">");
	QeDtmUtils.timeAxisTraverser(dtm, Axis.DESCENDANTORSELF, DNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);
										   
	// Use last node from Child traverse as Context node for subsequent traversals
	int lastNode = rtData[1];
	String lastNodeName = dtm.getNodeName(lastNode);
										   
	// Get a traverser for Ancestor:: axis.
	System.out.println("\n* ANCESTOR from "+"<"+lastNodeName+">");	
	QeDtmUtils.timeAxisTraverser(dtm, Axis.ANCESTOR, lastNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);

	// Get a traverser for Ancestor:: axis.
	System.out.println("\n* ANCESTOR-OR-SELF from "+"<"+lastNodeName+">");	
	QeDtmUtils.timeAxisTraverser(dtm, Axis.ANCESTORORSELF, lastNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);

	System.out.println("\n#### Timing Traversal of FLAT documents. ####");
						  
	buf.setLength(0);
	DTM dtm2 = QeDtmUtils.createDTM(0, QeDtmUtils.flatFile, buf);  
	buf.setLength(0);
	dtm2 = QeDtmUtils.createDTM(0, QeDtmUtils.flatFile, buf);
	buf.setLength(0);
	dtm2 = QeDtmUtils.createDTM(0, QeDtmUtils.flatFile, buf);
	buf.setLength(0);
	dtm2 = QeDtmUtils.createDTM(0, QeDtmUtils.flatFile, buf);
	buf.setLength(0);
	dtm2 = QeDtmUtils.createDTM(0, QeDtmUtils.flatFile, buf);
																  	
	// Get various nodes to use as context nodes.
	dtmRoot = dtm2.getDocument();					// #document
	dtmRootName = dtm2.getNodeName(dtmRoot);		// Used for output
	DNode = dtm2.getFirstChild(dtmRoot);			// <Doc>
	DNodeName = dtm2.getNodeName(DNode);
	int fiNode = dtm2.getFirstChild(DNode);			// first <item>
	String fiNodeName = dtm2.getNodeName(fiNode);
			   
	// Get a traverser for Child:: axis.
	System.out.println("\n* CHILD from "+"<"+DNodeName+"> " + DNode);
	QeDtmUtils.timeAxisTraverser(dtm2, Axis.CHILD, DNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);

	// Get a traverser for Following:: axis.
	System.out.println("\n* FOLLOWING from "+"<"+fiNodeName+"> " + fiNode);
	QeDtmUtils.timeAxisTraverser(dtm2, Axis.FOLLOWING, fiNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);
							  
	// Get a traverser for Following-sibling:: axis.
	System.out.println("\n* FOLLOWINGSIBLING from "+"<"+fiNodeName+"> " +fiNode);
	QeDtmUtils.timeAxisTraverser(dtm2, Axis.FOLLOWINGSIBLING, fiNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);
				 							 
	// Get a traverser for Descendant:: axis.
	System.out.println("\n* DESCENDANT from "+"<"+DNodeName+"> " + DNode);
	QeDtmUtils.timeAxisTraverser(dtm2, Axis.DESCENDANT, DNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);

	// Use last node from Descendant traverse as Context node for subsequent traversals
	lastNode = rtData[1];
	lastNodeName = dtm2.getNodeName(lastNode);
											 
	// Get a traverser for Ancestor:: axis.
	System.out.println("\n* ANCESTOR from "+"<"+lastNodeName+"> " + lastNode);	
	QeDtmUtils.timeAxisTraverser(dtm2, Axis.ANCESTOR, lastNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);

	// Get a traverser for Preceding:: axis.
	System.out.println("\n* PRECEDING from "+"<"+lastNodeName+"> " + lastNode);			   
	QeDtmUtils.timeAxisTraverser(dtm2, Axis.PRECEDING, lastNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);
											   
	// Get a traverser for Preceding:: axis.
	System.out.println("\n* PRECEDING-SIBLING from "+"<"+lastNodeName+"> " + lastNode);			   
	QeDtmUtils.timeAxisTraverser(dtm2, Axis.PRECEDINGSIBLING, lastNode, rtData);
	System.out.println("Time="+rtData[0] + " : " + "LastNode="+rtData[1]+" nodes="+rtData[2]);
  
}

}
  
