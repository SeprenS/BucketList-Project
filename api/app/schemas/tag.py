from pydantic import BaseModel


class TagDB(BaseModel):
    title: str
    id: int
