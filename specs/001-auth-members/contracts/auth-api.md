# Auth API Contract — 001-auth-members

Envelope: `{ "success": bool, "data": object|null, "message": string }`

## POST /api/auth/register

**Body**: `{ "name", "email", "password", "password_confirmation" }`

**201**: `{ "success": true, "data": { "user": {...}, "token": "..." }, "message": "" }`

**422**: validation errors

## POST /api/auth/login

**Body**: `{ "email", "password" }`

**200**: `{ "success": true, "data": { "user": {...}, "token": "..." }, "message": "" }`

**401**: invalid credentials

## POST /api/auth/logout

**Headers**: `Authorization: Bearer {token}`

**200**: `{ "success": true, "data": null, "message": "Sesión cerrada" }`

## GET /api/profile

**Headers**: `Authorization: Bearer {token}`

**200**: `{ "success": true, "data": { "id", "name", "email", "phone?", "role" }, "message": "" }`

## PUT /api/profile

**Body**: `{ "name", "phone?" }`

**200**: updated profile in `data`
