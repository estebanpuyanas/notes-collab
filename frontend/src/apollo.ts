import { ApolloClient, InMemoryCache, split, HttpLink } from '@apollo/client';
import { WebSocketLink } from '@apollo/client/link/ws';
import { getMainDefinition } from '@apollo/client/utilities';

const http = new HttpLink({ uri: 'http://localhost:4000/api' });
const ws = new WebSocketLink({ uri: 'ws://localhost:4000/socket', options: { reconnect: true } });

const link = split(
  ({ query }) => {
    const def = getMainDefinition(query);
    return def.kind === 'OperationDefinition' && def.operation === 'subscription';
  },
  ws,
  http
);

export const client = new ApolloClient({ link, cache: new InMemoryCache() });