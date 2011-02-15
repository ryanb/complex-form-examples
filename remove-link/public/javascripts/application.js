// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function insert_fields(element_id, content) {
  var new_id = new Date().getTime();
  $(element_id).insert({
    bottom: content.replace(/NEW_RECORD/g, new_id)
  });
}

function remove_fields(link) {
  var hidden_field = $(link).previous("input[type=hidden]");
  if (hidden_field) {
    hidden_field.value = '1';
  }
  $(link).up(".field").hide();
}
