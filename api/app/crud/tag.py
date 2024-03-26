from app.crud.base import CRUDBase
from app.models.tag import Tag


class TagCRUD(CRUDBase):
    pass


tag_crud = TagCRUD(Tag)
