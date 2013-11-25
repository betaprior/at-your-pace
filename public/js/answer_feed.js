var testJSON = '[{"response":{"user_id":5,"first_name":"Retha","last_name":"Schulist","question_id":1,"question_text":"Explain the relationship between the business cycle and tax revenue / government spending. Why does this present a challenge to policy makers? ","response_id":1,"value":"The relationship is that during recessions, people have less money so the taxes that the government is able to impose are smaller, however, because people have less money they demand more cervices like health care and pensions from the government, which can make the government dive into depth since the fewer taxes that it collects cannot fulfill the increased welfare needs of the people. Policy makers have to devise solutions for balancing the smaller budget with the increased demand for free services, as well as plan for future shortcomings.\n","created_at":"2013-11-24T19:04:24+00:00","created_at_epoch":1385319864}},{"response":{"user_id":1,"first_name":"Ignacio","last_name":"Rutherford","question_id":1,"question_text":"Explain the relationship between the business cycle and tax revenue / government spending. Why does this present a challenge to policy makers? ","response_id":2,"value":"As businesses make less money and are selling less of their goods and services the government begins to make less and less money as a result. If there is less to get taxes from the government has less time to spend. The issue that arises is that the best way to make the businesses begin to perform better is for the government to increase their spending.\nPolicy makers then have to decide where the best place is to put in the small amount of money that the government does have.","created_at":"2013-11-24T19:04:24+00:00","created_at_epoch":1385319864}},{"response":{"user_id":5,"first_name":"Retha","last_name":"Schulist","question_id":1,"question_text":"Explain the relationship between the business cycle and tax revenue / government spending. Why does this present a challenge to policy makers? ","response_id":3,"value":"Tax revenue increases during economic expansion because of the general increase in household income, which translates into more income taxes being paid to the federal and state governments. Conversely, during a recession there is less tax revenue because households have less income. This is a problem because during expansions the government spends more money on government programs and military with their revenue, but during a recession when the government needs to spend more money to boost the economy, they have less revenue. This causes policy to consider saving more money during an economic expansion in order to prepare for a possible recession in the future. \n","created_at":"2013-11-24T19:04:24+00:00","created_at_epoch":1385319864}},{"response":{"user_id":3,"first_name":"Garnett","last_name":"Boehm","question_id":1,"question_text":"Explain the relationship between the business cycle and tax revenue / government spending. Why does this present a challenge to policy makers? ","response_id":4,"value":" During a recession, income decreases, and so income tax does so as well. Government spending goes up during a recession, due to the Keynesian approach to the issue. This is a challenge to policy makers, as taxes are needed for spending, and yet they run in reverse directions during recessions. Policy makers must learn to balance this problem when creating laws.","created_at":"2013-11-24T19:04:24+00:00","created_at_epoch":1385319864}}]'

testJSON = testJSON.replace(/[\n]/g,"");

var grades = ["A", "B", "C", "D", "F"];

var answerElmtT = "<div class='answer'></div>";
var contDivElmtT = "<div class='answer-container'></div>";
var subInfoElmtT = "<div class='submission-info'></div>";
var subTimeElmtT = "<span class='submission-time'></span>";
var subNameElmtT = "<span class='submission-name'></span>";
var qaTextElmtT = "<div class='question-answer-text'>";
var aTextElmtT = "<p class='answer-text'></p>";
var qTextElmtT = "<p class='question-text'></p>";
var gradeSubElmtT = "<div class='grade-submission'></div>";
var gradeSelectElmtT = '<select></select>';
var gradeOptionElmtT = '<option></option>';
var footerDivElmtT = "<div class='answer-footer'></div>";

function getDateStr( utcSeconds )
{
    var d = new Date(0);
    d.setUTCSeconds(utcSeconds);
    
    var hh = d.getUTCHours();
    var mm = d.getUTCMinutes();

    var ampm = " AM"
    
    // This line gives you 12-hour (not 24) time
    if (hh > 12) {hh = hh - 12; ampm = " PM"}
    // These lines ensure you have two-digits
    if (hh < 10) {hh = "0"+hh;}
    if (mm < 10) {mm = "0"+mm;}
    
    return hh + ":" + mm + ampm;
}

function createAnswerElement ( submissionUtcSeconds, userName, questionText,
                   answerText, answerId )
{   
    var $answerElmt = $(answerElmtT).clone();
    var $contDivElmt = $(contDivElmtT).clone();
    var $subInfoElmt = $(subInfoElmtT).clone();
    var $subTimeElmt = $(subTimeElmtT).clone();
    var $subNameElmt = $(subNameElmtT).clone();
    var $qaTextElmt = $(qaTextElmtT).clone();
    var $aTextElmt = $(aTextElmtT).clone();
    var $qTextElmt = $(qTextElmtT).clone();
    var $gradeSubElmt = $(gradeSubElmtT).clone();
    var $gradeSelectElmt = $(gradeSelectElmtT).clone();
    var $footerDivElmt = $(footerDivElmtT).clone();
    
    for (var i = 0; i < grades.length; i++ ) {
    grade = grades[i];
    var $gradeOptionElmt = $(gradeOptionElmtT).clone();
    $gradeOptionElmt.attr("value", grade);
    $gradeOptionElmt.text(grade);
    $gradeSelectElmt.append($gradeOptionElmt);
    }
    
    
    $subTimeElmt.text(getDateStr(submissionUtcSeconds));
    $subNameElmt.text(userName);
    $qTextElmt.text(questionText);
    $aTextElmt.text(answerText);
    $gradeSelectElmt.attr("id", answerId);
    
    $gradeSelectElmt.change( function () {
    console.log("Grade for response " + answerId + ": " +
            this.options[this.selectedIndex].value);
    $answer = $(this).closest(".answer");
    /*
    if ( ! $answer.hasClass("graded") ) {
        $answer.addClass("graded");
    }
    */
    $answer.stop();
    $answer.css("background-color", "#FFEB7A").delay(5000).slideUp();
    });

    $gradeSubElmt.append($gradeSelectElmt);
    $subInfoElmt.append($subTimeElmt);
    $subInfoElmt.append($subNameElmt);
    $qaTextElmt.append($qTextElmt);
    $qaTextElmt.append($aTextElmt);
    $contDivElmt.append($subInfoElmt);
    $contDivElmt.append($qaTextElmt);
    $answerElmt.append($contDivElmt);
    $answerElmt.append($gradeSubElmt);
    $answerElmt.append($footerDivElmt);
    
    return $answerElmt.get(0);
}

function updateAnswerFeed ( responseArray )
{
    var domRoot = document.getElementById("answer-feed");

    for (var i = 0; i < responseArray.length; i++) {
    var userName = ( responseArray[i]['response']['first_name'] + " " + 
             responseArray[i]['response']['last_name'] );
    
    var answerElmt = createAnswerElement(
        responseArray[i]['response']['created_at_epoch'],
        userName,
        responseArray[i]['response']['question_text'],
        responseArray[i]['response']['value'],
        responseArray[i]['response']['response_id'] );

    $(answerElmt).hide();
    $(answerElmt).css('background-color', '#7ADAFF');
    
    $(domRoot).prepend( answerElmt );

    $(answerElmt).slideToggle().delay(1000).animate(
        { backgroundColor: 'transparent' });
    }
    
}

function buildAnswerFeed ( responseArray ) {
    var domRoot = document.getElementById("answer-feed");
    
    for (var i = 0; i < responseArray.length; i++) {
    var userName = ( responseArray[i]['response']['first_name'] + " " + 
             responseArray[i]['response']['last_name'] );
    
    var answerElmt = createAnswerElement(
        responseArray[i]['response']['created_at_epoch'],
        userName,
        responseArray[i]['response']['question_text'],
        responseArray[i]['response']['value'],
        responseArray[i]['response']['response_id'] );
    domRoot.appendChild( answerElmt );
    }

    
}

function addElements( responseArray, index )
{
    // Between 3 and 6 seconds
    timeout = 5000 + Math.random() * 5000;
    
    setTimeout( function () {
    if ( index < 0 ) {
        index = responseArray.length - 1;
    }
    
    updateAnswerFeed( [ responseArray[index] ] );
    index--;
    
    addElements( responseArray, index - 1 );
    }, timeout);
}

