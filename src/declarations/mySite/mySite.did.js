export const idlFactory = ({ IDL }) => {
  return IDL.Service({ 'fibonacci' : IDL.Func([IDL.Nat], [IDL.Nat], []) });
};
export const init = ({ IDL }) => { return []; };
