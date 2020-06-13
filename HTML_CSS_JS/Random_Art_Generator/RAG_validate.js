//Test for the random word:
function validate_random_word() {
    var random_word = document.getElementById("rand_word").value;
    var test_criterion = /^[A-Za-z]+$/;
    
    if (test_criterion.test(random_word)) {
        if (random_word.length <= 30) {
            document.getElementById("rand-word-prompt").innerHTML = " ";
            return true
        }
        else {
            document.getElementById("rand-word-prompt").style.color = "#9c170e";
            document.getElementById("rand-word-prompt").innerHTML = "That's not possible. No meaingful word has more than 30 letters";
            return false
        }
    }
    else {
        document.getElementById("rand-word-prompt").style.color = "#9c170e"; 
        document.getElementById("rand-word-prompt").innerHTML = "You have entered an invalid value";
        return false
    }
}

//Test for the entered numbers:
function validate_number(minn, maxn, html_id, html_prompt) {
    var x;
    x = document.getElementById(html_id).value;
    if (isNaN(x) || x < minn || x > maxn) {
        document.getElementById(html_prompt).style.color = "#9c170e";
        prompt_message = "Please enter a number from " + minn + " to " + maxn ;
        document.getElementById(html_prompt).innerHTML = prompt_message;
        return false
    }
    else {
        document.getElementById(html_prompt).innerHTML = " ";
        return true
    } 
}

//function to validate the checkboxes:
function validate_checkbox() {
    var checkboxs = document.getElementsByName("feels");
    
    for(var i=0,l=checkboxs.length;i<l;i++)
    {
        if(checkboxs[i].checked)
        {
            document.getElementById("feels-prompt").innerHTML = " ";
            return true
        }
    }
    document.getElementById("feels-prompt").style.color = "#9c170e";
    document.getElementById("feels-prompt").innerHTML = "How are you feeling?";
    return false
}

// Function to validate the radio buttons:
function validate_radio(html_name, html_prompt, choose_what) {
    var radios;
    radios = document.getElementsByName(html_name);
    
    for(var i=0,l=radios.length;i<l;i++)
    {
        if(radios[i].checked)
        {
            document.getElementById(html_prompt).innerHTML = " ";
            return true
        }
    }
    document.getElementById(html_prompt).style.color = "#9c170e";
    document.getElementById(html_prompt).innerHTML = "Please choose a " + choose_what;
    return false
}

// Test for submitting the form:
function validate_form_submit() {
    var random_word = document.getElementById("rand_word").value;
    var test_criterion = /^[A-Za-z]+$/;
    
    var test_form = 0
    
    // Test the random word:
    if (validate_random_word()) {
            test_form = test_form + 1;
    }
       
    // Test the prime color selection:
    if (validate_radio('prime-col', 'prime-col-prompt', 'primary color')) {
        test_form = test_form + 1;
    }

    // Test the secondary color color selection:
    if (validate_radio('sec-col', 'sec-col-prompt', 'secondary color')) {
        test_form = test_form + 1;
    }
    
    // Test the brush type selection:
    if (validate_radio('brush', 'brush-prompt', 'brush')) {
        test_form = test_form + 1;
    }

    // Test the feeling selection:
    if(validate_checkbox()) {       
        test_form = test_form + 1;
    }
    
    // Test the random number:
    if(validate_number(1, 1000000, 'rand-num', 'rand-num-prompt')) {
        test_form = test_form + 1;
    }
    
    // test the age:
    if(validate_number(1, 120, 'age', 'age-prompt')) {
        test_form = test_form + 1;
    }
    
    // Does it add up?
    if (test_form == 7) {
            document.getElementById("order_output").style.color = "#3e6b7d";
            document.getElementById("order_output").innerHTML = "<strong>Thanks! Preparing your artwork...</strong>";
    }
}