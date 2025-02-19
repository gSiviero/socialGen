drop dataverse  TinySocial if exists;
create dataverse TinySocial;
use TinySocial;
create type EmploymentType as {
  organization: string,
  start_date: date,
  end_date: date?
};

create type GleambookUserType as {
  id: int64,
  alias: string,
  name: string,
  user_since: datetime,
  friend_ids: {{ int64 }},
  employment: [EmploymentType]
};

create type GleambookMessageType as {
  message_id: int64,
  author_id: int64,
  in_response_to: int64?,
  sender_location: point,
  send_time: datetime,
  message: string
};

create type ChirpUserType as {
  screen_name: string,
  lang: string,
  friends_count: int32,
  statuses_count: int32,
  name: string,
  followers_count: int32
};

create type ChirpMessageType as {
  chirpid: int64,
  user: ChirpUserType,
  sender_location: point,
  send_time: datetime,
  referred_topics: {{ string }},
  message_text: string
};

create external dataset GleambookUsers(GleambookUserType)
	using localfs(("path"= "localhost:///home/giulliano/IdeaProjects/socialGen/p1/gbook_users.adm") ,("format"="adm"));

create external dataset GleambookMessages(GleambookMessageType)
	using localfs(("path"= "localhost:///home/giulliano/IdeaProjects/socialGen/p1/gbook_messages.adm") ,("format"="adm"));