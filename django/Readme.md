## How to init the project
1. Make a folder```mkdir my_app```
2. cd into it
3. Create a virtual envirnment
       ```
         python -m venv venv
       ```
4. Activate the V env
       ```
         source venv\\Scripts\\activate
       ```
5. Install django
       ```
         pip install django
       ```
6. Freeze Dependencies
        ```
           pip freeze > requirements.txt
       ```
7. Come to root `cd ..`
8. Start django project
        ```
           django-admin startproject my_app my_app
         ```
9. Make app
       ```
           python manage.py startapp app_name
       ```
10. Register app
      In `my_app/settings.py`, add `'app_name'` to INSTALLED_APPS:

        INSTALLED_APPS = [
            ...
            'quiz_logic',
        ]
11. Migrate the Database
- after making the schema, make the migratios to use
     ```
     python manage.py makemigrations
      python manage.py migrate
    ```
     
