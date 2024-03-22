from fastapi import APIRouter
from fastapi.responses import JSONResponse

router = APIRouter()


@router.get('/')
async def health_check():
    return JSONResponse(content="Server is up and OK", status_code=200)
