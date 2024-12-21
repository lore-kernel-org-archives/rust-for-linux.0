Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020114.outbound.protection.outlook.com [52.101.195.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58513D52B
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Dec 2024 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734805865; cv=fail; b=nhTBFGyS7M78K2SN9y2qE33mLNG9aJjcRGwDd895iPhFzNoC4Td0MYVmkVlfU4qUtdlUfuXhrpelyDttM1fqCxvIJSfc18MUAAoWuwA2lQQoXvUgOujHKu9r1co3nvKjVOuSvF2m5w3At5kBHZWJpKlSujTPDtphuzTgQJZfvF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734805865; c=relaxed/simple;
	bh=S9aONrvMLGQXZxEi5NH2erl2MAJDkmi9TJGQJda2tlM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NThja49CK+U0XofUXhYKCeb+gP3/4EEcwfzhnVsQxUe7/2tlQIiLmW38klI84maNJSoh5CbkAytEIpAhxR+aQJ0la6U/o2x1b+ZvaN98udZ1Ss6dZVdKFKon+k5QaMYsBH45XgVYqbfZMrn42IUCUUPrBYtM7IrhhrpWSTWIg4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=B6idOykU; arc=fail smtp.client-ip=52.101.195.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="B6idOykU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/aedUip5/3/RYV6fuNj0j4mbTH2SsAo751x8xuiOo9R/uLwjaZlz9LiV/JCxzsvfweNDpUpIJn78+nbM+I2O900NQEArNSzTBQFmcGl30bMFx3I7hX7osq/vTPP+OZkQhi5onRL46yhhDByFOaWQMlP8WLGyOxIWKOeyy+X0PxIPiGS+IZcXcdZnEfQstumj4+lDS8MpR5dojSRizGbknWKZrQPilNUGoQY/9QUaRptpm2hEMt7VkIQpWRRkjsY7//bl2Fz4Q8t4GxlCFHqBxlJG9m6I4d9RS5lUz4VpeJCTSV+4+MchPQgTFhEdWkMQRB94plIHAEJSvm/jW6dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp5udyJb2yT1fgASL9THzxdPDU4R7zz91XjI7e2i9sI=;
 b=nwHiBuA5dHP81qaX5U/jkOMyCHy8eI8VefX6xadVUx2ME1HJmnnuzU5J6oc9dmP/axKoxs9NbqQ343PsuUTWSuyKFQZH0JGeuhaHGS2UtFvGlfBxBNR5G4EsKZcOLkmobzrys2E7s2rhWoP2lCWX0JoRmFunJ9iGk1dux2kBhEI7rsEFH1pBN7lgwRhE16Q9ND0tP1ShwDkbtomyu3wNOUGL/i3uT9SZC5usFD/9lMWeYL74TxxlqHENIt3V5zNdIce1HwNwf/QJSb5OeWYwScTqkdjENplc3JK6ae6R96i1ez4nETG3wLrFh194L4GmshvGje7KORFhmUPvUdgD8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp5udyJb2yT1fgASL9THzxdPDU4R7zz91XjI7e2i9sI=;
 b=B6idOykUw+mTxOVPS7TE2Gs1cBNmyioJ3xkTftB5HmQ2sQuW9KVX0Midj35bkOTA4GsU9TbPNMAklo35RxTCisAhJSIV1hJd9vj4VT4lPMPnglc2ecrXI9wuDRf3NgFtdhFK48f5Em7uCb2aDiyY8Wy5IPurfwefYWgGD9dHyew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO7P265MB7439.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Sat, 21 Dec
 2024 18:30:54 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 18:30:54 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/3] implement `kernel::sync::Refcount` and convert users
Date: Sat, 21 Dec 2024 18:29:43 +0000
Message-ID: <20241221183024.3929500-1-gary@garyguo.net>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::27) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO7P265MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: c5153fec-d4af-42bb-fdf7-08dd21ed9ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oU4qYGzKdxHX05waROjEbym+GBwujhH2WfrmAOUi/DVlx+z3576fhX/xKj19?=
 =?us-ascii?Q?8jfv4I56cNRYMQKV6FlsmjHrloUzdzL7rXWxpRBvzrtSCEt5NfrYaBHhi4VS?=
 =?us-ascii?Q?9yUWw77QmdImI3Sok7Mf1Fcqti1hiF+LATZtBKo3K4cKWwjqFRIsU0L622k+?=
 =?us-ascii?Q?7RkAsLkRrTCLEVUFJiNReClkSFP4kTFjqEzdRSX2v2gyB4oXDollYr5FV6HO?=
 =?us-ascii?Q?D5EylNrHdF32RpkzPs9zDU4Oj6BTCCJw0i0bFRJzf7d78p6PWtXJWTMlMBKn?=
 =?us-ascii?Q?zess8O+kzM3a6nZ/kDiNu1tDWCO/lsgiiznLtYckWVMiSAbZ5XJzJyYE6ePB?=
 =?us-ascii?Q?/O7T2Uw+1BiINX3PqooA4hyLrfeDHoPoOSQCJF8wCf+XOdAWeEXa/L8RAlPj?=
 =?us-ascii?Q?Z1/kRY7rurAUQgsVQFI8rbJduI+ENts6FI8jzo6H8OB8WLJdjVWT+y+WneDD?=
 =?us-ascii?Q?RfQImgpwH1KMTIhVWSaS/A1gr+InVxihZmUloBpbGijY3D+Mtjkb3Osx5PMI?=
 =?us-ascii?Q?ZZluegmssFgSS/4HnZjejD7HFDmEDEAnSO5h+0USZFVjDnyF9+gMlsz/78HX?=
 =?us-ascii?Q?3tGauSiMGpCS6LwpFCflW+KI0mXV4taVl8Zt2LmjIXfrKmkYYQLDmPGIMrY0?=
 =?us-ascii?Q?OWSWB8OCmq9yQNKCplxMm4Hp1whvXOqyp749liNa/CNtRErtYE7K/QMr02LV?=
 =?us-ascii?Q?LDSM8td6URe/Emir9Ekwqt31nEHyIB9KQeMWaX+8wn4UgC0EHTOveCOHwvDv?=
 =?us-ascii?Q?RKInkZQ1194NsWqvZpG3OkfhSkbf/R2zx+Zq/cQTB/eHJVCQx2UM3i9jdwSi?=
 =?us-ascii?Q?h2BlfG0jO1CTwTR6CYT50V4zwQPOPnqcLMdWkoqNVKWzx10U1REmFPuxDFWX?=
 =?us-ascii?Q?GAqJDNxdzqFTEStpmhx9p7iV/nNRpIa/O5qFXQIQMZo0nbg8b6sNRAAv0XrK?=
 =?us-ascii?Q?4TDtl1F/GIC9TknEL3qKG41h1gR7ONYU0Rp9hiatJ7CgUMA5niQf+Ait8ExY?=
 =?us-ascii?Q?BLETQCmIxkSkfTt+VkwkzXWPo0cLmszM1tjqXreHJI71CuGJK+yis+f9F6+o?=
 =?us-ascii?Q?G184DCW132z4rz0A5EgsMFVel3L26ciU8Deb3eUIzEFGhuFOabl3AE6h+Yr+?=
 =?us-ascii?Q?1fSRRaeIkGwM3Bt8x1a5CF3aVoY/BYlT9rpvKZg8Aa5rvL4oeCjm+CrncvMc?=
 =?us-ascii?Q?MISHA0FrHG+efHSQN9/Q3V+CIZHljP8S1B/oRZIGdajRgmrZeDnsLGyWNaMN?=
 =?us-ascii?Q?/zGgs3y+aNlBxBhjR71cSyOvHuBICysEMfGQogXeH0Xp4wKu2NCQ+Tb4uKO7?=
 =?us-ascii?Q?Spliz6MQ9iLhjmpIDgJSRkTa3lsmcj9o4Bx36xj+JuXWOGTvkUfeUJo26wRf?=
 =?us-ascii?Q?s9wOoVlVYzm33E2vpuktMzxPpbVY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FQJGUmlKm0SEaZnkpt07Tm5kpfgtqBpdY+5EkcPbvwpx4eijJETntUSA2p1+?=
 =?us-ascii?Q?zjrQWdr5s04hbGPfYRV+3SsncE2XUbeWMrU6kG8EI4Rr5E2kEilL1Mf7LhCk?=
 =?us-ascii?Q?d9/6IV/TNoSzowOkNTPCzRW0rxv/QvFeL0nXmfIYE0sP9L3ofmbajKjPg6wR?=
 =?us-ascii?Q?LRPB+XVxCWQrhszWu1mQflKR+/vzginOSnbwT4rNb1jFkdYJx6qywpZrMmZZ?=
 =?us-ascii?Q?EWD/3Cr3AhjR5hUYMPpFKD4nGoyAGHbjxFd9oEnyJWWwdedpQ4lX3FnWGU6H?=
 =?us-ascii?Q?DRhe+krWDyYUiM3AiNJwZ+B3WTxdgUy+U2NUvZq3EzIKvlDFH0ZwwDoDjeAM?=
 =?us-ascii?Q?irRYuie8nMn9iB+0qucwhrjCfj2dUd7XJtzNi4DqrF/t0YAaG2yLgXyTcP5a?=
 =?us-ascii?Q?U1Do/5oVE6NzpMpHau6xNun56sFor8R+dxnJiFAXy4lAS0lRxRLFpWbGS7q/?=
 =?us-ascii?Q?t1Z5PjPylkunkbLcOBavfTPuM0gwiDPni5tz+iATZPTjzMASYnTxwCww5mHX?=
 =?us-ascii?Q?L9gCJb+SmzARUzhSAwXkI7H53DzTHFIlA+v9L0uO55hFqM2SVBOG0U+VHlZ+?=
 =?us-ascii?Q?k4R90P0JaDE8kjI2RVTUR96h0SjcT26SJWoy8FBn47CNm/yFxP9HknCPFJrT?=
 =?us-ascii?Q?12dNzVT66HeT4R0sHiNiXyaR3Pkmztws0sW0kqsYN1f0PnpejYBZLng2Upyo?=
 =?us-ascii?Q?GD6JJaI2lj71FieOUt4zASb88a/5mdW2obbE7udk0eXUmAyIxIy0SZsRPeN2?=
 =?us-ascii?Q?aBLMPxbiuf/mzbtLk5K6RLjGpA20lk14KKY90xDnW1c/X0s2Wo/TwbHrLBGj?=
 =?us-ascii?Q?eyqqIbLL9GoFV6wSfAbNQHoN+XoPnztYosItMjpiLzG4FrE+3r4lO8sgp4A6?=
 =?us-ascii?Q?OQra/M/mkZJyp6py0tUBgMNQUfvtPzimM+aoD/ibZ5EXSFD2LJUrwWbG/0QU?=
 =?us-ascii?Q?NpMlWCyCdaVJzDzRqzTkF7pKres65oDdSqr84by3EjnGjjAVDXKJgMl908Cy?=
 =?us-ascii?Q?wLHzmKl+3m5nX9AyvP4ceBgw9FPhNYLoMSARjfJUvJYhMsGU5mRYtag6NwPj?=
 =?us-ascii?Q?MDUSgMdf6GQwZZ5FUhG26slFmyiqfvgh6F0BxyR70FOjceHRT5wDJNi1rDPN?=
 =?us-ascii?Q?VWOjtWxNDy262kygt4wmLF3sIs6IZs+3Zg5bxuYgufbzE/J/JphYqunb3LJT?=
 =?us-ascii?Q?ENLL6dFYIGwFs6dIKThuswvx6OSA319yrDK65NMEfS6oFeWaGRwuO21xRuCA?=
 =?us-ascii?Q?e6pC7BRM8q9O6+ZgYuPsqOdHF/e/q9yUWEq3+QXWCkSkiI5ZB5jqrDGhAgs1?=
 =?us-ascii?Q?tWMVqYAIcIHEij/+xafTOBBz0xG8LavOUJcjPhi8lDrkXQ5Gyoz9b/RCJyIB?=
 =?us-ascii?Q?RRqdMFP710P1Q+IgYXuaHEf4iQ6dVj3pJeaXAjBDwlC1EIfAhjmkXcxGshMg?=
 =?us-ascii?Q?+8p/1sbh1ruet3FvaV/o3d8wFAMDMdD26nc9ipuyEFgVCMzTyOquFjI38/jk?=
 =?us-ascii?Q?tMFlr+NOxpgKuk+JKyvdL2ysAd9czhvuOqUxLvrf1SjpuaXFkLLeC56t7LF8?=
 =?us-ascii?Q?VAUSdwcGw9/FOJK7drAqWFR7kDmxL+Rvce1Q2RfW8iUHu0Tf9LCg22ywY8kV?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c5153fec-d4af-42bb-fdf7-08dd21ed9ab6
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 18:30:54.5186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JAWpQBGiwKHi0tlFmuLGshIvcq7Kha2LGsRJ6EBf8utwf0ydY0OiysS4cMcGKayfFcEE277ThDqXOu0uCV8RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7439

Currently there're two refcount usage in rust/, `Arc` and `block::mq`.
`Arc` uses `refcount_t` with FFI calls directly, and `block::mq` use
Rust atomics and custom refcounting.

This series consolidate them to have a single `Refcount` which wraps
`refcount_t` and have it used by both.

With the removal of Rust `AtomicU64` this would also make the code work
for 32-bit systems. See [1] as a previous attempt to fix this issue.

Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://lore.kernel.org/rust-for-linux/20240905061214.3954271-1-davidgow@google.com/ [1]

Changes in v2:
- `Refcount::read` method is dropped
- `Refcount::dec_not_one` method is added and `Arc::into_unique_or_drop`
  is converted to use it.
- Link to v1: https://lore.kernel.org/rust-for-linux/20241004155247.2210469-1-gary@garyguo.net

Gary Guo (3):
  rust: implement `kernel::sync::Refcount`
  rust: convert `Arc` to use `Refcount`
  rust: block: convert `block::mq` to use `Refcount`

 rust/helpers/refcount.c            |  10 +++
 rust/kernel/block/mq/operations.rs |   7 +-
 rust/kernel/block/mq/request.rs    |  70 ++++++------------
 rust/kernel/sync.rs                |   2 +
 rust/kernel/sync/arc.rs            |  64 +++++++----------
 rust/kernel/sync/refcount.rs       | 109 +++++++++++++++++++++++++++++
 6 files changed, 172 insertions(+), 90 deletions(-)
 create mode 100644 rust/kernel/sync/refcount.rs


base-commit: 0c5928deada15a8d075516e6e0d9ee19011bb000
-- 
2.47.0

