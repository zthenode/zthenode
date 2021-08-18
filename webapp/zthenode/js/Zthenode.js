/*
**********************************************************************
** Copyright (c) 1988-2021 $organization$     
** 
** This software is provided by the author and contributors ``as is'' 
** and any express or implied warranties, including, but not limited to, 
** the implied warranties of merchantability and fitness for a particular 
** purpose are disclaimed. In no event shall the author or contributors 
** be liable for any direct, indirect, incidental, special, exemplary, 
** or consequential damages (including, but not limited to, procurement 
** of substitute goods or services; loss of use, data, or profits; or 
** business interruption) however caused and on any theory of liability, 
** whether in contract, strict liability, or tort (including negligence 
** or otherwise) arising in any way out of the use of this software, 
** even if advised of the possibility of such damage.
** 
**   File: Zthenode.js
** 
** Author: $author$           
**   Date: 8/17/2021
**********************************************************************
*/

/*
**
** function includeHTML
** 
*/
function includeHTML(elementId, fileAttribute, notFound, requestFailed) {

    if (!elementId) { elementId = 'include'; }
    if (!fileAttribute) { fileAttribute = 'include'; }
    if (!notFound) { notFound = ''; }
    if (!requestFailed) { notFound = ''; }

    if (elementId) {
        var element = document.getElementById(elementId);

        if (element) {
            var file = element.getAttribute(fileAttribute);

            if (file) {
                var xhttp = new XMLHttpRequest();

                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4) {
                        if (this.status == 200) { element.innerHTML = this.responseText; }
                        else {
                            if (this.status == 404) { element.innerHTML = notFound; }
                            else {
                                element.innerHTML = requestFailed;
                            }
                        }
                    }
                }
                xhttp.open('GET', file, true);
                xhttp.send();
            }
        }
    }
}

/*
**
** function getFormFieldValue
**
*/
function getFormFieldValue(name, form) {
   if (!form) { form = 'form'; }
   if (name) {
       if ((field = document[form][name])) {
           if ((value = field.value)) {
               return value;
           } else {
               len = field.length;
               if (0 < len) {
                   for (i = 0; i < len; i++) {
                       if (field[i].checked) {
                           if ((value = field[i].value)) {
                               return value;
                           }
                       }
                   }
               }
           }
       }
   } else {
       alert("failed on getFormFieldValue(0, '" + form + "')");
   }
   return '';
}

/*
**
** function getFormValue
**
*/
function getFormValue(name, form, defaultValue) {
   if (!form) { form = 'form'; }
   if (name) {
       if ((value = getFormFieldValue(name, form))) {
           return value;
       }
       if (!defaultValue) {
            alert("failed on getFormValue('" + name + "', '" + form + "')");
       } else {
           return defaultValue;
       }
   } else {
       alert("failed on getFormValue(0, '" + form + "')");
   }
   return '';
}

/*
**
** function getFormValue2
**
*/
function getFormValue2(name1, name2, form, defaultValue) {
   if ((value = getFormFieldValue(name1, form))) {
       return value;
   }
   if ((value = getFormValue(name2, form, defaultValue))) {
       return value;
   }
   return '';
}

/*
**
** function setFormSubmit
**
*/
function setFormSubmit(action, method, form) {
   if (!form) { form = 'form'; }
   if ((field = document[form])) {
       if (action) {
           if ('' != action) {
               field.action = action;
           }
       }
       if (method) {
           if ('' != method) {
               field.method = method;
           }
       }
   }
   return true;
}

/*
**
** function setFormSubmit2
**
*/
function setFormSubmit2(action1, action2, method, form) {
   if (!form) { form = 'form'; }
   if ((field = document[form])) {
       if (action1) {
           if ('' != action1) {
               field.action = action1;
           } else {
               if (action2) {
                   if ('' != action2) {
                       field.action = action2;
                   }
               }
           }
       } else {
           if (action2) {
               if ('' != action2) {
                   field.action = action2;
               }
           }
       }
       if (method) {
           if ('' != method) {
               field.method = method;
           }
       }
   }
   return true;
}

/*
**
** function onClickLocation
** 
*/
function onClickLocation(event, location) { 
    if (event.stopPropagation) {
        event.stopPropagation();
    } else {
        if (window.event) {
            window.event.cancelBubble = true;
        }
    }
    if (location) {
        window.location = location;
    }
}
var thisParentLocation = false, thisSelfLocation = false;
function onLocationInit(parentLocation, selfLocation) {
    thisParentLocation = parentLocation;
    thisSelfLocation = selfLocation;
}
function onClickParentLocation(event, location) {
    if (thisParentLocation) { location = thisParentLocation; }
    onClickLocation(event, location);
}
function onClickSelfLocation(event, location) {
    if (thisSelfLocation) { location = thisSelfLocation; }
    onClickLocation(event, location);
}

/*
**
** function onDropdownClick
** 
*/
var thisDropdown = false, initDropdown = false;
function onDropdownInit(dropdown) {
    thisDropdown = dropdown;
    initDropdown = true;
}
function onDropdownClick(dropdown, event) {
    if (!dropdown) { dropdown = "myDropdown"; }
    if (dropdown) {
        var x = document.getElementById(dropdown);
        if (x) {
            thisDropdown = dropdown;
            if (x.style.display !== "block") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    }
    if (event) {
        if (event.stopPropagation) {
            event.stopPropagation();
        } else {
            if (window.event) {
                window.event.cancelBubble = true;
            }
        }
    }
}
function myDropdownClick(dropdown, event) {
    if (!dropdown) { dropdown = "myDropdown"; }
    onDropdownClick(dropdown, event);
}

/*
**
** function onDropoverClick
** 
*/
var thisDropover = false, initDropover = false;
function onDropoverInit(dropover) {
    thisDropover = dropover;
    initDropover = true;
}
function onDropoverClick(dropover) {
    if (!dropover) { dropover = "myDropover"; }
    if (dropover) {
        var y = document.getElementsByName(dropover);
        if (y) {
            var n = y.length;
            if (n > 0) {
                thisDropover = dropover;
                for (i = 0; i < n; ++i) {
                    var x = y[i];
                    if (x) {
                        if (x.style.visibility !== "visible") {
                            x.style.visibility = "visible";
                        } else {
                            x.style.visibility = "hidden";
                        }
                    }
                }
            }
        }
    }
}

/*
**
** function onPopdownClick
** 
*/
var thisPopdown = false, initPopdown = false;
function onPopdownInit(popdown) {
    thisPopdown = popdown;
    initPopdown = true;
}
function onPopdownClick(popdown, event) {
    if (!popdown) { popdown = "myPopdown"; }
    if (popdown) {
        var x = document.getElementById(popdown);
        if (x) {
            thisPopdown = popdown;
            if (x.style.display !== "block") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    }
    if (event) {
        if (event.stopPropagation) {
            event.stopPropagation();
        } else {
            if (window.event) {
                window.event.cancelBubble = true;
            }
        }
    }
}
function myPopdownClick(popdown, event) {
    if (!popdown) { popdown = "myPopdown"; }
    onPopdownClick(popdown, event);
}

/*
**
** window.onclick = function
** 
*/
window.onclick = function(event) {
    if ((!event.target.matches('.popdown')) 
        && (!event.target.matches('.popdown-button')) 
        && (!event.target.matches('.popdown-dots')) 
        && (!event.target.matches('.popdown-dot'))
        && (!event.target.matches('.popdown-content'))
        && (!event.target.matches('.popdown-item'))
        && (thisPopdown)) {
        var x = document.getElementById(thisPopdown);
        if (x) {
            if (x.style.display === "block") {
                x.style.display = "none";
            } else {
                if (initPopdown) { 
                    x.style.display = "block"; 
                }
            }
        }
    }
    if ((!event.target.matches('.dropdown')) 
        && (!event.target.matches('.dropdown-button')) 
        && (!event.target.matches('.dropdown-bars')) 
        && (!event.target.matches('.dropdown-bar'))
        && (!event.target.matches('.dropdown-content'))
        && (!event.target.matches('.dropdown-item'))
        && (thisDropdown)) {
        var x = document.getElementById(thisDropdown);
        if (x) {
            if (x.style.display === "block") {
                x.style.display = "none";
            } else {
                if (initDropdown) { 
                    x.style.display = "block"; 
                }
            }
        }
    }
    if ((!event.target.matches('.dropover')) 
        && (!event.target.matches('.dropover-button')) 
        && (!event.target.matches('.dropover-bars')) 
        && (!event.target.matches('.dropover-bar'))
        && (thisDropover)) {
        var y = document.getElementsByName(thisDropover);
        if (y) {
            var n = y.length;
            if (n > 0) {
                var o = true;
                for (i = 0; (i < n); ++i) {
                    var x = y[i];
                    if (x.contains(event.target)) {
                        o = false;
                    }
                }
                if (o) {
                    for (i = 0; (i < n); ++i) {
                        x = y[i];
                        if (x.style.visibility === "visible") {
                            x.style.visibility = "hidden";
                        } else {
                            if (initDropover) { 
                                x.style.visibility = "visible"; 
                            }
                        }
                    }
                }
            }
        }
    }
}

/*
**
** 
** 
*/
