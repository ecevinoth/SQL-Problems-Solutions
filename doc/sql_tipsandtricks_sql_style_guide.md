# SQL Style guide
## Naming and field conventions
## Uniform suffixes

## Naming and field conventions
  * Schema, table and column names should be in **snake_case**.
  * Use names based on the **business terminology**, rather than the source terminology.
  * Table names should be **plurals**, e.g. accounts.
  * Column names should be **singular name**, e.g. account_type.
  * Each model should have a **primary key**.
  * The primary key of a model should be named **<object>_id**, e.g. account_id.
  * Timestamp columns should be named **<event>_at**, e.g. created_at, and should be in UTC. If a different timezone is being used, this should be indicated with a suffix, e.g __created_at_pt__.
  * Booleans should be prefixed with **is_ or has_**.
  * Price/revenue fields should be in decimal currency (e.g. 19.99 for $19.99; many app databases store prices as integers in cents). If non-decimal currency is used, indicate this with suffix, e.g. price_in_cents.
  * Avoid reserved words as column names
  * **Consistency is key!** Use the same field names across models where possible, e.g. a key to the customers table should be named customer_id rather than user_id.
  

## Uniform suffixes
Use the correct suffix where appropriate
  * _id—a unique identifier such as a column that is a primary key.
  * _status—flag value or some other status of any type such as publication_status.
  * _total—the total or sum of a collection of values.
  * _num—denotes the field contains any kind of number.
  * _name—signifies a name such as first_name.
  * _seq—contains a contiguous sequence of values.
  * _date—denotes a column that contains the date of something.
  * _tally—a count.
  * _size—the size of something such as a file size or clothing.
  * _addr—an address for the record could be physical or intangible such as ip_addr.
