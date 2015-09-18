if (typeof jQuery !== 'undefined') {
function showSpinner(visible) {
         $('spinner').style.display = visible ? "inline" : "none";
     }
     Ajax.Responders.register({
     onLoading: function() {
           showSpinner(true);
     },
     onComplete: function() {
     if(!Ajax.activeRequestCount) showSpinner(false);
     }
});
}