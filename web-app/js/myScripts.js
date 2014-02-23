var myScripts = new Object();

myScripts.ajaxPost = function(formId, handleAs, responseFunction){
    if (!handleAs){
        handleAs = "text"
    }
    if (!responseFunction){
        responseFunction = function(data){}
    }
    dojo.xhrPost({
        form: formId,
        handleAs: handleAs,
        load: function(data){
            responseFunction(data)
        },
        error: function(error){
                alert("An unexpected error occurred: " + error);
            }
    });
}


myScripts.ajaxPostReplace = function(formId, elementId, actionLink){
    dojo.require("dojox.html._base"); // eval response data
    var elementId = elementId;
    var form = dojo.byId(formId);
    var orgActionLink = dojo.attr(form, "action");
    if (actionLink){
        dojo.attr(form, "action", actionLink);
    }
    myScripts.ajaxPost(formId, null, function(data){
        var node = dojo.byId(elementId)
        dojox.html.set(node, data, {
             executeScripts: true
        });
        // reset actionLink
        if (actionLink){
            dojo.attr(form, "action", orgActionLink);
        }
    })
}


myScripts.ajaxPost2 = function(formId1, handleAs, responseFunction){
    if (!handleAs){
        handleAs = "text"
    }
    if (!responseFunction){
        responseFunction = function(data){}
    }
    dojo.xhrPost({
        form: formId1,
        handleAs: handleAs,
        load: function(data){
            responseFunction(data)
        },
        error: function(error){
                alert("An unexpected error occurred: " + error);
            }
    });
}


myScripts.ajaxPostReplace2 = function(formId1, elementId, actionLink){
    dojo.require("dojox.html._base"); // eval response data
    var elementId = elementId;
    var form = dojo.byId(formId1);
    var orgActionLink = dojo.attr(form, "action");
    if (actionLink){
        dojo.attr(form, "action", actionLink);
    }
    myScripts.ajaxPost2(formId1, null, function(data){
        var node = dojo.byId(elementId)
        dojox.html.set(node, data, {
             executeScripts: true
        });
        // reset actionLink
        if (actionLink){
            dojo.attr(form, "action", orgActionLink);
        }
    })
}