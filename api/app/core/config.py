from typing import Optional

from pydantic import BaseSettings, EmailStr


class Settings(BaseSettings):
    path: str
    app_title: str = 'BucketList-API'
    database_url: str = 'sqlite+aiosqlite:///./fastapi.db'
    secret: str = 'SECRET_KEY_FOR_FASTAPI_USERS'
    first_superuser_email: Optional[EmailStr] = None
    first_superuser_password: Optional[str] = None

    class Config:
        env_file = '.env'


settings = Settings()
