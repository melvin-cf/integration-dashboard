**Title**
----
External API for receiving test results from rspec framework

* **URL**

  /rspec

* **Method:**

  `POST` 
  
*  **URL Params**

   <_If URL params exist, specify them in accordance with name mentioned in URL section. Separate into optional and required. Document data constraints._> 

   **Required:**
 
   `env=[string]`
   `sut=[string]`

   **Optional:**
 
   `none`

* **Data Params**

  json file that is the output from rspec

* **Success Response:**

  * **Code:** 201 
    **Content:** `{ "Record" : "<UUID>" }`
 
* **Error Response:**

  * **Code:** 400 Bad Parameters <br />
    **Content:** `{"Error":"Missing SUT header"}`
    **Content:** `{"Error":"Missing ENV header"}`

  OR

  * **Code:** 406 UNPROCESSABLE ENTRY <br />
    **Content:** `{"Error":"Content Type missing"}`

* **Sample Call:**

* **Notes:**

