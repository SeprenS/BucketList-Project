from fastapi import APIRouter

from app.api.endpoints import health_check_router, user_router

main_router = APIRouter()

main_router.include_router(user_router)
main_router.include_router(
    health_check_router,
    tags=['Health Check']
)
