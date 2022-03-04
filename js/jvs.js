$(function () {
    $("#datepicker").datepicker({
        showOn: "both",
        buttonImage: "./t23icon.webp",
        buttonImageOnly: true,
        buttonText: "Select date"
    });
});

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