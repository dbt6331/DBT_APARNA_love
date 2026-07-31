{% macro count_new(column_name) %}
count({{ column_name }}) as column_count
       
{% endmacro %}