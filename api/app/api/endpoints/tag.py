from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from app.core.user import current_superuser
from app.core.db import get_async_session
from app.schemas.tag import TagDB
from app.crud.tag import tag_crud

router = APIRouter()


@router.get(
    '/',
    response_model=list[TagDB],
)
async def get_all_tags(
    session: AsyncSession = Depends(get_async_session)
):
    tags = await tag_crud.get_multi(session=session)
    return tags
