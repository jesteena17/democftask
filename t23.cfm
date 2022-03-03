<!--

Design the form as like
https://examples.wufoo.com/forms/employment-application/
Add javascript validation for all required fields (which will have red * in the label).
While clicking on the Submit button, data needs to be saved into Database. Database code should be in CFC


-->

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--  <link rel="stylesheet" href="/resources/demos/style.css">-->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


<script>
    $(function () {
        $("#datepicker").datepicker({
            showOn: "both",
            buttonImage: "https://rezstream.net/customer/photos/10052/mini_cal_icon.jpg",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
    });
</script>


<style>
    input[type="text"],
    select {
        /* align-items: center; */
        box-shadow: 0px -1.5px 1px darkgray;
        /* border: 0.5px solid lightgray; */
        border-top: 1px solid #7c7c7c;
        border-left: 1px solid #c3c3c3;
        border-right: 1px solid #c3c3c3;
        border-bottom: 1px solid #ddd;
        background: #fff;
    }

    body {
        background-color: rgb(4, 165, 4);
    }

    .common {
        display: grid;
        /* width: 100%; */
        row-gap: 20px;
        margin-left: 30px;
        margin-right: 30px !important;
        /* border: 1px solid green; */

    }

    #f1 {
        width: 35%;
        width: -webkit-fill-available;
        margin-left: 30px;
        margin-right: 30px !important;
    }

    .topform {
        background-color: yellowgreen;
        color: #fff;
    }

    .form {
        display: block;

        width: 37%;
        background-color: white;
        position: absolute;
        left: 31%;
    }

    #datefield {
        display: flex;
        align-items: self-start;
        justify-content: flex-start;
    }

    .lab {
        display: grid;
        /* text-align: center; */
    }


    .star {
        color: red;
    }

    .commonfield {
        width: 100%;
    }
</style>



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



<script>
    window.onload = function () {
        var div = document.getElementsByClassName('common')[0];
        var input = document.getElementsByClassName('commonfield')[0];
        var radios = document.querySelectorAll('input[type=radio][name="relocate"]');
        input.addEventListener('focus', function () {
            div.style.background = '#fff7c0';

        });

        radios.forEach(radio => radio.addEventListener('focus', () =>
            document.querySelector('.jobrelocate').style.background = '#fff7c0'


        ));
        radios.forEach(radio => radio.addEventListener('blur', () =>
            document.querySelector('.jobrelocate').style.background = 'transparent'


        ));
        input.addEventListener('blur', function () {
            div.style.background = 'transparent';

        });


    }
</script>

<script>

    function checkForm(form) {
        // validation fails if the input is blank
        if (form.jobposition.value == "") {

            // var input = document.getElementById("jobposition")[0];
            // var div = document.getElementById('jobpost');

            document.getElementById("jobpost").style.color = "red";
            document.getElementById("jobpost").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforpost").innerHTML = "*This field is required. Please enter a value.";
            // form.jobposition.focus();



            return false;
        }
        if (form.arrivalMonth.value == "" || form.arrivalDay.value == "" || form.arrivalYear.value == "") {

            // var input = document.getElementById("jobposition")[0];
            // var div = document.getElementById('jobpost');

            document.getElementById("jobdate").style.color = "red";
            document.getElementById("jobdate").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgfordate").innerHTML = "*This field is required. Please enter a value.";
            // form.jobposition.focus();



            return false;
        }

        if (form.site.value === "http://" || form.site.value == "") {

            // var input = document.getElementById("jobposition")[0];
            // var div = document.getElementById('jobpost');

            document.getElementById("jobsite").style.color = "red";
            document.getElementById("jobsite").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforjobsite").innerHTML = "*Please enter a valid url in http://website.com format.";
            // form.jobposition.focus();



            return false;
        }


        if (form.site.value === "http://" || form.site.value == "") {

            // var input = document.getElementById("jobposition")[0];
            // var div = document.getElementById('jobpost');

            document.getElementById("jobsite").style.color = "red";
            document.getElementById("jobsite").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforjobsite").innerHTML = "*Please enter a valid url in http://website.com format.";
            // form.jobposition.focus();



            return false;
        }
        if (form.cfname.value === "" || form.clname.value == "") {

            // var input = document.getElementById("jobposition")[0];
            // var div = document.getElementById('jobpost');

            document.getElementById("cname").style.color = "red";
            document.getElementById("cname").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforname").innerHTML = "*This field is required. Please enter a value.";
            // form.jobposition.focus();



            return false;
        }

        if (form.cemail.value === "") {

            // var input = document.getElementById("jobposition")[0];
            // var div = document.getElementById('jobpost');

            document.getElementById("email").style.color = "red";
            document.getElementById("email").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforemail").innerHTML = "*This field is required. Please enter a value.";
            // form.jobposition.focus();



            return false;
        }
        else if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.cemail.value))) {

            document.getElementById("email").style.color = "red";
            document.getElementById("email").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforemail").innerHTML = "*Please enter a Valid  value.";
            return false;
        }

        if (form.cphone1.value === "" || form.cphone2.value == "" || form.cphone3.value == "") {

            // var input = document.getElementById("jobposition")[0];
            // var div = document.getElementById('jobpost');

            document.getElementById("phone").style.color = "red";
            document.getElementById("phone").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforphone").innerHTML = "*This field is required. Please enter a value.";
            // form.jobposition.focus();



            return false;
        }
        else if (!(/^[0-9]{3}$/.test(form.cphone1.value)) ||
            !(/^[0-9]{3}$/.test(form.cphone2.value)) ||
            !(/^[0-9]{4}$/.test(form.cphone3.value))
        ) {

            document.getElementById("phone").style.color = "red";
            document.getElementById("phone").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforphone").innerHTML = "*Please enter a Valid 10 digit Number.";
            return false;
        }
        // validation was successful
        return true;
    }

</script>
<script>
    function fileValidation() {
        var fileInput =
            document.getElementById('FiletoUpload');

        var filePath = fileInput.value;

        // Allowing file type
        var allowedExtensions =
            /(\.pdf|\.doc|\.docx)$/i;

        if (!allowedExtensions.exec(filePath)) {
            // alert('Invalid file type,Upload Only PDF/DOC/DOCX document');
            document.getElementById("resume").style.color = "red";
            document.getElementById("resume").style.backgroundColor = "#FFDFDF";
            document.getElementById("errmsgforresume").innerHTML = "*Invalid file type,Upload Only PDF/DOC/DOCX document.";
            fileInput.value = '';
            return false;
        } else {
            var maxSize = '1024';
            if (fileInput.files && fileInput.files[0]) {
                var fsize = fileInput.files[0].size / 1024;
                if (fsize > maxSize) {
                    // alert('Maximum file size exceed, This file size is: ' + fsize + "KB");
                    document.getElementById("resume").style.color = "red";
                    document.getElementById("resume").style.backgroundColor = "#FFDFDF";
                    document.getElementById("errmsgforresume").innerHTML = '*Maximum file size exceed, This file size is: ' + fsize + "KB";
                    fileInput.value = '';
                    return false;
                } else {
                    // Image preview
                    if (fileInput.files && fileInput.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            document.getElementById(
                                'imagePreview').innerHTML =
                                '<img  width="200px" height="180px"  src="' + e.target.result +
                                '"/>';
                        };

                        reader.readAsDataURL(fileInput.files[0]);
                    }
                }
            }

        }
    }
</script>

<script>
    function updateDate(f) {
        var input = document.getElementById('datepicker').value;
        var d = new Date(input);
        if (!!d.valueOf()) { // Valid date
            document.getElementById('arrivalYear').value = d.getFullYear();
            document.getElementById('arrivalMonth').value = d.getMonth();
            document.getElementById('arrivalDay').value = d.getDate();

            var MM = parseInt(String(f.arrivalMonth.value), 10) + 1;

            if (MM < 10) {
                MM = "0" + (MM);
            }

            var DD = String(f.arrivalDay.value);
            if (DD < 10) {
                DD = "0" + DD;
            }
            var RT = String(f.buildingCode.value);
            var PT = String(f.PropType.value);
            if (RT == "spv") {
                RT = "b3"
            }
            if (RT == "CCK") {
                RT = "b1"
            }
            if (RT == "ICK") {
                RT = "b2"
            }
            if (PT == "b4") {
                RT = PT
            }
            f.returnurl.value = String(f.be.value) + "arrivalDate=" + String(f.arrivalYear.value) + MM + DD + "&nightsStay=" + String(f.nightsStay.value) + "&adults=" + String(f.adults.value) + "&children=" + String(f.children.value) + "&age3=" + String(f.age3.value) + "&hotelid=" + String(f.hotelid.value) + "&buildingCode=" + String(f.buildingCode.value) + "&roomType=" + RT;


        }
    }
</script>