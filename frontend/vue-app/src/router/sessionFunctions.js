export async function checkAuthentication() {
  const response = await fetch('/api/sessions', {
    method: 'GET',
    credentials: 'include',
    headers: {
      'Content-Type': 'application/json',
    },
  })
  const data = await response.json()
  return data.logged_in
}

export async function logout() {
  await fetch('/api/sessions/0', {
    method: 'DELETE',
    credentials: 'include',
    headers: {
      'Content-Type': 'application/json',
    },
  })
}
