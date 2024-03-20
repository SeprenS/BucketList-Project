from typing import Optional

from fastapi_users import schemas
from pydantic import Field


class UserRead(schemas.BaseUser[int]):
    nickname: str


class UserCreate(schemas.BaseUserCreate):
    nickname: str = Field(min_length=1, max_length=50)


class UserUpdate(schemas.BaseUserUpdate):
    nickname: Optional[str] = Field(min_length=1, max_length=50)
