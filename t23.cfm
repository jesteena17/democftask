<html>
    <head>
        <link rel="stylesheet" href="./css/loop.css">
        <link rel="stylesheet" href="./css/style.css">
        <script src="./js/jquery-1.12.4.js"></script>
        <script src="./js/jquery-ui.js"></script>
        <script src="./js/t23.js"></script>
    </head>
    <body>
        <cfoutput>
            <p>Design the form as like
                https://examples.wufoo.com/forms/employment-application/
                Add javascript validation for all required fields (which will have red * in the label).
                While clicking on the Submit button, data needs to be saved into Database. Database code should be in
                CFC https://blog.adamcameron.me/2014/05/defining-datasources-in-applicationcfc.html
                http://www.richmediacs.com/user_manuals/Dreamweaver/RMCS_CMS/CreateARationalDatabase.html
            <p>
            <div class="form">
                <form id="f1" action="" method="post" name="f1" enctype="multipart/form-data"
                    onsubmit="return checkForm(this);">
                    <div class="topform">
                        FORM
                    </div>
                    <p class="p1">
                    <h4>Employment Application</h4>
                    <p>Infinity Box Inc.</p>
                    </p>
                    <hr>
                    <div class="common" id="jobpost">
                        <label for="jobposition" id="jobpostlabels" class="labels">Which position are you applying
                            for?<span class="star">*</span></label>
                        <select name="jobposition" class="commonfield" id="jobposition">
                            <option value=""></option>
                            <option value="id">Interface Designer</option>
                            <option value="se">Software Engineer</option>
                            <option value="sa">System Administrator</option>
                            <option value="om">Office Manager</option>
                        </select>
                        <span id="errmsgforpost"></span>
                    </div>
                    <div class="common jobrelocate" id="jobrelocate">
                        <label for="relocate" class="labels">Are you willing to relocate?<span
                                class="star">*</span></label>
                        <div>
                            <input type="radio" name="relocate" value="yes" checked id="relocate1">Yes
                        </div>
                        <div>
                            <input type="radio" name="relocate" value="no" id="relocate2">No
                        </div>
                        <span class="errmsgforrelocate"></span>
                    </div>
                    <div class="common jobdate" id="jobdate">
                        <label for="relocate" class="labels">When can you start? <span class="star">*</span></label>
                        <div id="datefield">
                            <div class="lab">
                                <span class="labinput">
                                    <input type="text" size="3" name="arrivalMonth" id="arrivalMonth" /> /&nbsp;
                                </span>
                                <span>MM</span>
                            </div>
                            <div class="lab">
                                <span class="labinput"> <input type="text" size="3" name="arrivalDay" id="arrivalDay" />
                                    /&nbsp;
                                </span>
                                <span>DD</span>
                            </div>
                            <div class="lab">
                                <span class="labinput"> <input type="text" size="5" name="arrivalYear"
                                        id="arrivalYear" /></span>
                                <span>YYYY</span>
                            </div>&nbsp;
                            <input type="hidden" name="joindate" id="datepicker" onchange="updateDate(this.form)">
                        </div>
                        <span id="errmsgfordate"></span>
                    </div>
                    <div class="common jobsite" id="jobsite">
                        <label for="site" class="labels">Portfolio Web Site<span class="star">*</span></label>
                        <input type="text" class="commonfield" name="site" value="http://" id="site" />
                        <span id="errmsgforjobsite"></span>
                    </div>
                    <div class="common resume" id="resume">
                        <label for="site" class="labels">Attach a Copy of Your Resume<span class="star">*</span></label>
                        <input type="file" class="commonfield" name="FiletoUpload" id="FiletoUpload"
                            onchange="return fileValidation()" />
                        <span id="errmsgforresume"><small>Word or PDF Documents Only</small></span>
                    </div>
                    <div class="common salary" id="salary"><br>
                        <label for="site" class="labels">Salary Requirements<span class="star">*</span></label>
                        <div id="datefield">
                            <div class="lab">
                                <span class="labinput">
                                    $ <input type="text" size="15" name="dollar" id="dollar" /> .&nbsp;
                                </span>
                                <span><small>Dollars</small>
                                </span>
                            </div>
                            <div class="lab">
                                <span class="labinput"> <input type="text" size="4" name="cents" value="00"
                                        id="cents" /> &nbsp;
                                </span>
                                <span><small>Cents</small>
                                </span>
                            </div>
                        </div>
                        <span id="errmsgforsalary"></span>
                    </div>
                    <hr>
                    <p>Your Contact Information</p>
                    <div class="common cname" id="cname">
                        <label for="cname" class="labels">Name<span class="star">*</span></label>
                        <div id="datefield">
                            <div class="lab">
                                <span class="labinput">
                                    <input type="text" size="15" name="cfname" id="cfname" /> &nbsp;
                                </span>
                                <span><small>First</small>
                                </span>
                            </div>
                            <div class="lab">
                                <span class="labinput"> <input type="text" size="15" name="clname" id="clname" /> &nbsp;
                                </span>
                                <span><small>Last</small>
                                </span>
                            </div>
                        </div>
                        <span id="errmsgforname"></span>
                    </div>
                    <div class="common email" id="email">
                        <label for="cemail" class="labels">Email Address<span class="star">*</span></label>
                        <input type="text" class="commonfield" name="cemail" id="cemail" />
                        <span id="errmsgforemail"></span>
                    </div>
                    <div class="common phone" id="phone">
                        <label for="cphone" class="labels">Phone<span class="star">*</span></label>
                        <div id="datefield">
                            <div class="lab">
                                <span class="labinput">
                                    <input type="text" size="5" name="cphone1" id="cphone1" /> -&nbsp;
                                </span>
                                <span><small> ###### </small>
                                </span>
                            </div>
                            <div class="lab">
                                <span class="labinput">
                                    <input type="text" size="5" name="cphone2" id="cphone2" /> -&nbsp;
                                </span>
                                <span><small> ###### </small>
                                </span>
                            </div>
                            <div class="lab">
                                <span class="labinput">
                                    <input type="text" size="5" name="cphone3" id="cphone3" /> &nbsp;
                                </span>
                                <span><small> ###### </small>
                                </span>
                            </div>
                        </div>
                        <span id="errmsgforphone"></span>
                    </div>
                    <div>
                        <input type="submit" name="sub" id="sub" value="Submit" />
                    </div>
                </form>
            </div>
            <cfset variables.validMimeTypes = {
                'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
                ,'application/vnd.ms-powerpoint': {extension: 'ppt', application: 'PowerPoint (97-2003)'}
                ,'application/vnd.openxmlformats-officedocument.presentationml.presentation': {extension: 'pptx',
                application: 'PowerPoint (2007)'}
                ,'image/jpeg': {extension: 'jpg'}
                ,'image/png': {extension: 'png'}
                } />
            <cfif structKeyExists(form,"sub") and (cgi.request_method is "post" )>
                    <cfset thisPath=expandPath('.') & '/empResumes/'>
                    <cfset f_dir=GetDirectoryFromPath(thisPath)>
                    <cftry>
                        <cffile action="upload" filefield="FiletoUpload" destination="#f_dir#" mode="600"
                            accept="#StructKeyList(variables.validMimeTypes)#" strict="true" result="uploadResult"
                            nameconflict="makeunique">
                            <cfcatch type="any">
                                <cfif FindNoCase( "No data was received in the uploaded" , cfcatch.message )>
                                    <cfabort showerror="Zero length file">
                                    <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file"
                                    , cfcatch.message )>
                                    <cfabort showerror="Invalid file type">
                                    <cfelseif FindNoCase( "did not contain a file." , cfcatch.message )>
                                    <cfabort showerror="Empty form field">
                                    <cfelse>
                                    <cfabort showerror="Unhandled File Upload Error">
                                </cfif>
                            </cfcatch>
                    </cftry>
                    <cfset phone="#form.cphone1#" &"#form.cphone2#"&"#form.cphone3#">
                    <cfset salary="#form.dollar#" &'.'&"#form.cents#">
                    <cfinvoke component="t23" method="storeemployeeinfo" returnvariable="result">
                        <cfinvokeargument name="cfname" value="#form.cfname#" />
                        <cfinvokeargument name="clname" value="#form.clname#" />
                        <cfinvokeargument name="cemail" value="#form.cemail#" />
                        <cfinvokeargument name="phone" value="#phone#" />
                        <cfinvokeargument name="joindate" value="#form.joindate#" />
                        <cfinvokeargument name="jobposition" value="#form.jobposition#" />
                        <cfinvokeargument name="site" value="#form.site#" />
                        <cfinvokeargument name="resumefile" value="#uploadResult.serverFile#" />
                        <cfinvokeargument name="salary" value="#salary#" />
                        <cfinvokeargument name="relocate" value="#form.relocate#" />
                    </cfinvoke>
                    <cfif result GT 0>
                        <script>
                            alert("Employee Addedd Successfully");
                        </script>
                    </cfif>
            </cfif>
        </cfoutput>
    </body>
</html>