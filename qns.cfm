<style>
    table {
        width: 60%;
        border-collapse: collapse;

    }

    th {
        padding: 10px;
        font-weight: 300;
    }

    td {
        width: 30%;
        padding: 30px
    }
</style>

<table border="1" align="center">
    <tr>
        <th>1</th>
        <th>Create a page with text box & submit button. Input for the text box is any number between 1 to 5. Based upon
            the user input, you should show the corresponding string. 5 is Very good. 4 is good. 3 is fair. 1 & 2 is Ok.
            Use cfif, cfelseif,cfelse to do this functionality.
        </th>
        <td><a href="t1.cfm">t1.cfm</a></td>
    </tr>
    <tr>
        <th>2</th>
        <th>Create a page with text box & submit button. Input for the text box is any number between 1 to 5. Based upon
            the user input, you should show the corresponding string. 5 is Very good. 4 is good. 3 is fair. 1 & 2 is Ok.
            Use cfcase to do this functionality.
        </th>
        <td><a href="t2.cfm">t2.cfm</a></td>
    </tr>
    <tr>
        <th>3</th>
        <th>Create a page with text box & submit button. Input for the text box is "3,8,9,11,12"
            While click on submit, result page should show numbers divided by 3. So the result must be 3,9,12. Should
            use cfcontinue in the appropriate place.
        </th>
        <td><a href="t3.cfm">t3.cfm</a></td>
    </tr>
    <tr>
        <th>4</th>
        <th>Show below details in a page
            Today's date, current Month in numeric, current month in word, Last friday date, Last day of month. Show
            Last 5 days date & day like below.
            Sunday should be red,
            Monday - green,
            Tuesday - orange,
            Wednesday - yellow,
            Thursday - bold black,
            Friday - blue,
            Saturday - bold red

            02-Dec-2010 - Thursday
            01-Dec-2010 - Wednesday
            30-Nov-2010 - Tuesday
            29-Dec-2010 - Monday
            28-Dec-2010 - Sunday
        </th>
        <td><a href="t4.cfm">t4.cfm</a></td>
    </tr>
    <tr>
        <th>5</th>
        <th>Get user & his mother date of birth. show users age & At what age his mother delivered him. Tell him how
            many days are remaining for his & his mother’s birthday.</th>
        <td><a href="t5.cfm">t5.cfm</a></td>
    </tr>
    <tr>
        <th>6</th>
        <th>Create a web page that will have two text boxes and a submit button. When submitted, the page will post to
            self
            Create a structure in ColdFusion with the values from the text box. The text entered in text box one is the
            key, and the text entered in text box 2 is the value. CFDUMP the structure.
        </th>
        <td><a href="t6.cfm">t6.cfm</a></td>
    </tr>
    <tr>
        <th>7</th>
        <th>Create a web page that will have two text boxes and a submit button. When submitted, the page will post to
            self.
            Create a structure in ColdFusion with the values from the text box. The text entered in textbox one is the
            key, and the text entered in textbox 2 is the value. Each time you submit the form, the values entered
            previously should also be shown.
            It means, if I submit a form with 'ColdFusion', 'super', then I should see a dump with the key as
            'ColdFusion' & value as 'Super'.
            Now, If I enter 'php', 'good', then I should see both ColdFusion, php on the screen along with their values.
            CFDUMP the structure.
        </th>
        <td><a href="t7.cfm">t7.cfm</a></td>
    </tr>
    <tr>
        <th>8</th>
        <th>Create a web page that will have two text boxes and a submit button. When submitted, the page will post to
            self.
            Create a structure in ColdFusion with the values from the text box. The text entered in text box one is the
            key, and the text entered in text box 2 is the value. Each time you submit the form, the values entered
            previously should also maintained in the structure.
            It means, if I submit a form with 'ColdFusion', 'super', then structure should have key as 'ColdFusion' &
            value as 'Super'.
            Now, If I enter 'php', 'good', then structure should have both ColdFusion, php along with their values.
            If I enter ColdFusion again, with different value, then the new value should replace the old value.
            CFDUMP the structure.
        </th>
        <td><a href="t8.cfm">t8.cfm</a></td>
    </tr>
    <tr>
        <th>9</th>
        <th>Create a web page that will have two text boxes and a submit button. When submitted, the page will post to
            self.
            Create a structure in ColdFusion with the values from the text box. The text entered in text box one is the
            key, and the text entered in text box 2 is the value. Each time you submit the form, the values entered
            previously should also maintained in the structure.
            It means, if I submit a form with 'ColdFusion', 'super', then structure should have key as 'ColdFusion' &
            value as 'Super'.
            Now, If I enter 'php', 'good', then structure should have both ColdFusion, php along with their values.
            CFDUMP the structure.
            This is different from CF_Struct_3 task. If I enter ColdFusion and ColdFusion is already present, then the
            system should say, 'ColdFusion already present. Cannot add again'
        </th>
        <td><a href="t9.cfm">t9.cfm</a></td>
    </tr>
    <tr>
        <th>10</th>
        <th>ColdFusion Structure
            --------------------
            Create a web page that will have two text boxes and a submit button. When submitted, the page will post to
            self
            Create a structure in ColdFusion with the values from the text box. The text entered in text box one is the
            key, and the text entered in text box 2 is the value. Each time you submit the form, the values entered
            previously should also be shown.
            It means, if I submit a form with 'ColdFusion', 'super', then structure should have key as 'ColdFusion' &
            value as 'Super'.
            Now, If I enter 'php', 'good', then structure should have both ColdFusion, php along with their values
            In this task, you should show the keys in alphabetical order.
        </th>
        <td><a href="t10.cfm">t10.cfm</a></td>
    </tr>
    <tr>
        <th>11</th>
        <th>Create a cfm page with a function named ‘multiply’. It should give results for the following function calls.

        </th>
        <td><a href="t11.cfm">t11.cfm</a></td>
    </tr>
    <tr>
        <th>12</th>
        <th>In SQL create a table with firstname & last name columns. insert 10 records into that table.
            There is no primary key & numberic column in this table. Create a page with text box & submit button.
            User can enter numeric value less than 10. While click on submit, you should show all data from table
            as well as show Query’s nth row first name column without looping. Here n is value of the user input.
        </th>
        <td><a href="t12.cfm">t12.cfm</a></td>
    </tr>
    <tr>
        <th>13</th>
        <th>Highlight search keyword:
            You have variable with content “the quick brown fox jumps over the lazy dog”
            Create a page with text box & submit submit button. If you user gave “the” as input, then you need to show
            the result as,Found the key word in 2 times - the quick brown fox jumps over the lazy dog. if input is dog
            then result should be,Found the key word in 1 time - the quick brown fox jumps over the lazy dog
        </th>
        <td><a href="t13.cfm">t13.cfm</a></td>
    </tr>
    <tr>
        <th>14</th>
        <th>Create a form with Image name text box , description text area & Image upload field. User can upload only
            small size jpg,png and gif files. Add validation to check uploaded file type & file size. User should not
            upload a image which is greater than 1 MB. Once user uploaded a image,create a thumbnail image (20*20 size)
            from uploaded images. In list page, show thumbnail image & image name. While clicking on the image name, it
            should redirect the user to details page which will show image name, description & original uploaded image.
        </th>
        <td><a href="t14.cfm">t14.cfm</a></td>
    </tr>
    <tr>
        <th>15</th>
        <th>Create a component with function multiply. Create a cfm page which need to call that function with different
            arguments (mentioned below) using cfinvoke tag, cfobject tag and createobject function. It should give
            results for the following function calls with different number of arguments
            mulitiply(1,2)
            mulitiply(1,2,3)
            mulitiply(1,2,3,4)
        </th>
        <td><a href="t15.cfm">t15.cfm</a></td>
    </tr>
    <tr>
        <th>16</th>
        <th>Write a CF program to print data by 3 rows and 3 columns like the example below.

            1 4 7
            2 5 8
            3 6 9
        </th>
        <td><a href="t16.cfm">t16.cfm</a></td>
    </tr>
    <tr>
        <th>17</th>
        <th>Create a page with text box & submit button. User can enter numeric value in the text box & click the submit
            button. If user entered non numeric character, page should validate user input using JS.
            While clicking on submit button, page should show up 1 to given input number, odd numbers should be in blue,
            even numbers should be in green.
        </th>
        <td><a href="t17.cfm">t17.cfm</a></td>
    </tr>
    <tr>
        <th>18</th>
        <th>Need to create a query data type variable manually with out using cfquery tag. Need to use neccesary query
            functions.
            Query will have 3 columns
            ID - Number
            Name - String
            email - String
            This Query variable should have 3 rows of data.
        </th>
        <td><a href="t18.cfm">t18.cfm</a></td>
    </tr>
    <tr>
        <th>19</th>
        <th>ColdFusion Cookies
            --------------------
            Create a web page that will have one submit button. When submitted, the page will post to self.
            Create a cookie named 'VisitsCounter' and every time the submit button is clicked and the page is posted,
            the 'VisitsCounter' should be increased by 1 and the increased value is shown on the page.
        </th>
        <td><a href="t19.cfm">t19.cfm</a></td>
    </tr>
    <tr>
        <th>20</th>
        <th>Create a page with two textboxes (captcha and email). Create captcha using cfimage tag.To validate the
            fields captcha(text validation) and email(email validation)using server side validation.Once user entered
            the captcha & clicked on submit,then check the entered text is equal to captcha text.If correct then Page
            should show the message(Email Address successfully subscribe our newsletter).</th>
        <td><a href="t20.cfm">t20.cfm</a></td>
    </tr>
    <tr>
        <th>21</th>
        <th>Create a birthday wishes page which contains the following fields.
            Birthday Baby Name: Text box
            His Email Id : Text box
            Birthday Wishes: Text area
            Greeting image : File upload field
            While clicking on the submit, it should send greeting mail to the birthday guy’s mail id.
            Greeting images should be in attachment along with mail.
        </th>
        <td><a href="t21.cfm">t21.cfm</a></td>
    </tr>
    <tr>
        <th>22</th>
        <th>Show the below json info in table format.
            Json:
            [{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]
            Table format:
            Name Age Location
            Saravanan 27 Dubai
            Ram 26 Kovilpatti</th>
        <td><a href="t22.cfm">t22.cfm</a></td>
    </tr>
    <tr>
        <th>23</th>
        <th>Design the form as like
            https://examples.wufoo.com/forms/employment-application/
            Add javascript validation for all required fields (which will have red * in the label).
            While clicking on the Submit button, data needs to be saved into Database. Database code should be in CFC
        </th>
        <td><a href="t23.cfm">t23.cfm</a></td>
    </tr>
    <tr>
        <th>24</th>
        <th>Create a subscribe form with first name, Email id text boxes.Near email id text box, check button should be
            there.Below these text boxes submit button should be there. By default the submit button should be disabled.
            While clicking that, check mail id in Database using Ajax. If the user entered the mail id there, then it
            would give an error message like "Mail id is already there". If not, enable the submit button. While
            clicking on the submit button it will insert first name & email id into the database.
        </th>
        <td><a href="t24.cfm">t24.cfm</a></td>
    </tr>
    <tr>
        <th>25</th>
        <th>1.Write in Index.cfm, that will save the words in a given paragraph of text into the database as individual
            records. It means, each word is one row.
            Ex: "India is huge country."
            This will create 4 rows in the table.
            <br>
            2.Write another cfm page, that retrieves the records from database and tells the total number of times a
            word is present,
            * Words with length less than 3 are not counted.
            * Numbers are not counted and saved into the database.
            * Result should be in decreasing order of the count of words
            * Result should be in decreasing order of length of the text
            * Result should be in alphabetical order
            Ex: India is huge country. India has 29 states. Indians are nice. It has a nice climate.
            Should return
            - India (2)
            - nice (2)
            - has (2)
            - country (1)
            - Indians (1)
            - huge (1)
            - are (1)
            - climate(1)
            - states (1)
        </th>
        <td><a href="t25_1.cfm">t25_1</a><br>
            <a href="t25_2.cfm">t25_2</a><br>
            <a href="t25_3.cfm">t25_3</a>
        </td>
    </tr>
    <tr>
        <th>26</th>
        <th>ColdFusion & DB
            ------------------
            In CF_DB_WordCount_1 task, rather than using a text area, you should read from a uploaded txt file
        </th>
        <td><a href="t26_1.cfm">t26_1</a><br>
            <a href="t26_2.cfm">t26_2</a><br>
            <a href="t26_3.cfm">t26_3</a>
        </td>
    </tr>


    <tr>
        <th>27</th>
        <th>Login page with user name & password. Once a user enters the correct details, it should redirect to
            welcome.cfm, if not, it will show an error message in the login page. If any one of the users, directly
            access the welcome.cfm without login, Application should redirect the user in to log in page.In welcome
            page, there must be a logout link, which will log out the user from the application & redirect to log in
            page.
        </th>
        <td><a href="http://localhost:8500/t27/">t27</a>
        </td>
    </tr>

    <tr>
        <th>28</th>
        <th>You need to create a very basic simple CMS. It will have 2 parts. Admin part, login enabled. So users who
            have admin or editor roles can login into this area & can see list of pages, add/edit & delete pages. User
            side : Page list as menu, while clicking on it will show page name & description.
            Table user
            userid, username, pwd, role (values will be admin, editor, user)
            Table page
            pageid, pagename, pagedescs

        </th>
        <td><a href="http://localhost:8500/demoregisterlogin/index.cfm">t28</a>

        </td>
    </tr>
</table>