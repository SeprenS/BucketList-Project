development in progress

requirements: python >= 3.9

startup from console process:
1. Go to .BucketList-Project/api in bash, create venv and activate it
```bash
python -m venv venv
```
```bash
source venv/Scripts/activate
```

2. Install all the dependencies from requirements.txt
```bash
pip install -r requirements.txt
```

3. Create the database

```bash
alembic upgrade head
```

4. Start the uvicorn server (the --reload flag is responsible for reloading the server in case of any errors)
```bash
uvicorn app.main:app --reload
```
the server will be available on http://localhost:8000

you can read the swagger api documentation on http://localhost:8000/docs

stack: sqlalchemy, Fastapi, fastapi-users, pydantic, uvicorn

author: [Kazakov Vladislav](https://github.com/vlad-crab)