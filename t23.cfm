<!--
Design the form as like
https://examples.wufoo.com/forms/employment-application/
Add javascript validation for all required fields (which will have red * in the label).
While clicking on the Submit button, data needs to be saved into Database. Database code should be in CFC
-->
<link rel="stylesheet" href="./css/loop.css">
<link rel="stylesheet" href="./css/style.css">
<script src="./js/jquery-1.12.4.js"></script>
<script src="./js/jquery-ui.js"></script>
<script src="./js/jvs.js"></script>
<div class="form">
    <form id="f1" action="" method="post" name="f1" onsubmit="return checkForm(this)">
        <div class="topform">
            FORM
        </div>
        <h4>Employment Application</h4>
        <p>Infinity Box Inc.</p>
        <hr>
        <div class="common" id="jobpost">
            <label for="jobposition" id="jobpostlabels" class="labels">Which position are you applying for?<span
                    class="star">*</span></label>
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
            <label for="relocate" class="labels">Are you willing to relocate?<span class="star">*</span></label>
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
                    <span class="labinput"> <input type="text" size="3" name="arrivalDay" id="arrivalDay" /> /&nbsp;
                    </span>
                    <span>DD</span>
                </div>
                <div class="lab">
                    <span class="labinput"> <input type="text" size="5" name="arrivalYear" id="arrivalYear" /></span>
                    <span>YYYY</span>
                </div>&nbsp;
                <input type="hidden" id="datepicker" onchange="updateDate(this.form)">
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
        <div class="common salary" id="salary">
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
                    <span class="labinput"> <input type="text" size="4" name="cents" id="cents" /> &nbsp;
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
                    <span><small>###</small>
                    </span>
                </div>
                <div class="lab">
                    <span class="labinput">
                        <input type="text" size="5" name="cphone2" id="cphone2" /> -&nbsp;
                    </span>
                    <span><small>###</small>
                    </span>
                </div>
                <div class="lab">
                    <span class="labinput">
                        <input type="text" size="5" name="cphone3" id="cphone3" /> &nbsp;
                    </span>
                    <span><small>###</small>
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