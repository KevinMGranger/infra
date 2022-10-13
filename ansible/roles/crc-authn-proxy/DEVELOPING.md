# The General Idea

- have a "sidecar" to HAProxy that collects information from the tailscale API.
- give user information back to HAProxy
  - correlate source IP with user info
  - group info comes from tags
- set the relevant headers

# Phases

Splitting this up into chunks so I can verify I'm not barking up the wrong tree.
And because my attempts in the past have been... annoying.

1. Get HAProxy working as a Level 7 proxy in the first place (or is it already? 🤨).
   - test with API as well as UI
2. Hard-code the auth header.
   - test with API and UI
3. Hard-code the _IP_ mapping, just to make sure I have that logic down.
4. Create simple SPOE program that just hardcodes the auth header, still.
   - start with python for the POC.
5. Make SPOE program use tailscale info just for user mapping.
   - `tailscale status --json` for now (future: real API)
   - cache info just in the program for now (future: some sorta DB)
   - test with a shared account (can make one for work-- been meaning to anyway)

## Polish

- Consider: Rewrite It In Rust.
- Add other info such as login name, display name. I think that's available through the tailscale API.
- Kubernetes support.

# Notes

- HAProxy has a feature called SPO(E|A|P) which lets it communicate with another program over a binary protocol.
  This program can inspect and alter requests.
- How do we handle revoking access?
  - Well, if you just remove their access entirely, they can't connect. Problem solved!
  - As for tag-based groups, that's harder. We should poll the API periodically, but they'd have to wait whatever the poll period is. Could have it forcibly re-poll on SIGUSR1 or dbus something.
 
# Questions of Questionable Relevance

## Reachability
- can start with hard-coded /etc/hosts, but that won't scale.
- could easily have a public DNS record that points to a tailscale IP. A bit weird, but... eh.
  - need to set up an IngressController that will "take over" other routes.
  - also need to configure the API server to listen on another FQDN, right?
- can you add tags to a share link, so they instantly get access once they're added?
