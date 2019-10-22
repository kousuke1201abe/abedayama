export const getApiUri = () => {
  const { protocol, host } = window.location;
  return `${protocol}//${host}`;
};
