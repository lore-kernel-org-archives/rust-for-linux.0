Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022081.outbound.protection.outlook.com [52.101.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8201C7293
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Oct 2024 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728057202; cv=fail; b=fIkdeJSvKgqaUsSPgB403ujt29i0Fz4zCxqM9kcB6nBBmRITVHxl54oTAha8jFvk/6zapmMG8V5Xlro8d5U9RKoiRIVepe9J/RxESHfwBSKtMoWdwKYOCNcUaUmgUw7LlsPCZlKhxcMVl4+85WV9Jm/Cm99d/xkUN9VbxQpT5AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728057202; c=relaxed/simple;
	bh=KyeCB2K8KwYvb0Hj2iKAFdVAtWF72sFBeYxE6Unc3pI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nJntlWwbTyicb1ELsUO8QAYbInRnQllsZCJl8M8nehn+lad/ss+2DNK1iGCGLRUC9c+CCF72h/s0wkM2l1m2USJpZdtcWCdxZEIPmZXYA4v+w8yFREmQXneTH2Vdl02sAcnVqFMsw9pr8K+qQySwGRpMbUomcL3hn7qaYN1E4/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wZChxtLO; arc=fail smtp.client-ip=52.101.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wZChxtLO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl8gLgmA/55zROkfFH5e1u47C0wvpQHUCJxBUSbEBgIEp3eHG9HTwgyBVGdf80iv8CEUmWvntFPLYLGMFGLl2TRz93CGx1SXsWGiGfYdTJDwmdWWPhIfYp6ZugiukUJjOrrwXtEd45C5Qb4qpuYMzZo9APbMVREpbtB5gsYEhSHhzTBQOKdxbooRv3IkUe8/qx7D7Rn1qUmvQqqU/IMWPLomngjXvchDcUTExECN6la2efr3DhJDJDDdcnTENqEtiWez2TmH37RzKwaW6Wc3+qxvGDbBRJSJ9I/aWQP0PgU+e5aZWoZRtHacQf0g9Yp5DKtXvkRQC0uQ6LuFZAC3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF5w86t5AhVJVs3QqLyX6S6brqTG1ycQmch8LF5LzeI=;
 b=m5WjO1mBKsRlxfYgb2V90yQKbwW+8c6qIoGWngWVxd52F9wPP8UaWwC0OTjfV5t9G0Cw76iQAYXw+J7AV51o668LKavilawlQbdR8UhkT51l5JYLWYPQVnEPB9017QxXSXadVvgB8ndRdjmnQSTAhY8pUK8CyQrXnM4334hXhURGScP+7kOUaus4b+I5vJUlRkj8Bem6szjiJFVsaxrR46DYcjeqHu6V49GSh5MsWhO1eY+n0O9igbCU4mqVnMn3jQ1yayfjZF1HmIaiE3K+k9MictKN95CmJ75jMfzJ/g3pPgqUBDZBs9575qRRzyhRuysWZ95D0mcnhQMbNrPqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF5w86t5AhVJVs3QqLyX6S6brqTG1ycQmch8LF5LzeI=;
 b=wZChxtLOaoYsW5wHD7W+PLDhloei4oHBlL17pCMvzWwZ0KILMcGW+7b7Ja4NHwDq0d5m6V0gmgUy9I9GuDX+zNqBsar7yGDR+aIVotynL72LVPUDopvPAkHboAxHcB8wPf5ifCvrnMDocp2XnLmAKn48/CSY8li6cQCyXg5kSBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO2P265MB2557.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:12d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 15:53:17 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 15:53:17 +0000
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
Subject: [PATCH 0/3] implement `kernel::sync::Refcount` and convert users
Date: Fri,  4 Oct 2024 16:52:21 +0100
Message-ID: <20241004155247.2210469-1-gary@garyguo.net>
X-Mailer: git-send-email 2.44.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO2P265MB2557:EE_
X-MS-Office365-Filtering-Correlation-Id: 292111fe-9f4e-449c-a8db-08dce48ca976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZpNbfYsKjvGpNxISKlqL/7Pm9zWO3g1stgba3b9K7zBcDcD7r6mJEUpEKfIP?=
 =?us-ascii?Q?PxQKj8GL/VEGAqjZB4OvttlNrecvJNXHfFy2jZCplgbQyRM5F0ldKcG+dEUz?=
 =?us-ascii?Q?XaLvjcjS5puTNf/Mn1YNuPk5uCsJvTQ3ztTPQ7xwZg5Ox3qwLkgQK5TLgVpN?=
 =?us-ascii?Q?MoEI8B8X7i0Y3rTt0Of2fMa5Q6YAiZFqENjdUIzbFhPjQZIDE3NYuNQNsmg6?=
 =?us-ascii?Q?jNWr18dHJn0ccoZ+7ijV/rPudK97lheqaq6boGowoBj4FJC77cduKwx7Xa7f?=
 =?us-ascii?Q?UIgQCNYlEmsA1y5pUcKY6tgHt2LSyOuVanb2Di2UnKXT/riU295qEhR4djmV?=
 =?us-ascii?Q?gLKI2YDSQVVPj7kThVKTv/xhXKdlf1VoFIp60ZbYld5GkI/iGBJxcetPHOOR?=
 =?us-ascii?Q?1Tu82SxvVOkpu9S+EKlfd68nTcqhEwSC+chCwAVwPXJpIb8ufl0dzmpIuyPG?=
 =?us-ascii?Q?4k5sUlGB8F+NfiLpZ6umgLv2u6UD6KGhbtchlI3C026HxhpUC28ZZ5tJfaik?=
 =?us-ascii?Q?QsjReF3Pe0+dRotqUtGep3lXojBsuXbQ0HC9+pmKTWGmgy7YDGQ+xEjh7QLk?=
 =?us-ascii?Q?TS5HoqR8I1Y/51I7y/HkzLm6AIwmlB1D6MVbdTFeoYZwmEe84BGUogOrNEp7?=
 =?us-ascii?Q?AJSSTafM3q1KcsFjdL2IgB4ndn8oVFzykSQOC5V/A77+v8HYU0FwRr6PIC/d?=
 =?us-ascii?Q?Ju7tK5W2rB8GZBbNNxW7nbOZ8SKczU0aSx0VdPyz1knXuGIxZBq/mHI8azLG?=
 =?us-ascii?Q?xx04GwQqKn0vCBPI6935DyyOl++zvPMFmWdQym+wzezUctQy0Z5M/T2kV52E?=
 =?us-ascii?Q?yqJLrDszdL4B9nx51M4kyFW80FR+H/uPzR0ragVltCpXQXEzOQVnBqhpGDpT?=
 =?us-ascii?Q?U9jMuUNnPE2PVnmSMxh798vZH0J5fbbbwrjeR90GYb041AU96tLuIswdTdXZ?=
 =?us-ascii?Q?Sju/j9dpITMa0ulEH4pnaB4stdrYJIq8TP5faPLVJ/Ai1LzwZNL4lsVyPdPd?=
 =?us-ascii?Q?5EQw8woVh8bMm6cvPClNUwuEprMAmT2f+EOyg76JYrCz99bU5WrY3hPKXs7r?=
 =?us-ascii?Q?4QzZYACGyQN41CMZgv6eXN7KmfKx4S5+TaPhl144pG56Gb1eP0nNNo50D4uJ?=
 =?us-ascii?Q?ZF54qNkrYt/+kpVh0Gaw5UUdIh2QBylj2ggx1T39okUbHuUGQluzhXAm1MFF?=
 =?us-ascii?Q?CINrwUXoh/aW79ixWmukIEir9kiCq06+dFYYTdRUG+XgLCp5kFlm1Bu7VGAZ?=
 =?us-ascii?Q?jj/W14EAF+vfOCu1G1Q0YNQZ4V1jG2aWHOTI2ZVqsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q9tGYACopCwQv07Skl1NXdYrfDLoAh2U4LZrozJFh6cvlKLDAjKKs/oUbJra?=
 =?us-ascii?Q?f0FztE+zPHkihGkgue+Yn6S6CcYO0s3mxh+GmVNcdAcAaPaxWvRRdKml9rEg?=
 =?us-ascii?Q?rw4SFRP8uT3ZLmnh2Re6ODFKDs5tXPgdC06wLaan0jJPT2PK3c2cvcDlfb5p?=
 =?us-ascii?Q?pyiB2YwzfKtEWU1+KBa81EbsJVFoD+W+nHKqGDK8BO2V0Q4rM4hmhPzgbiyG?=
 =?us-ascii?Q?TmmzYNURgNHuvmBByhV4rr4bUi5SmBj5rlul93hjGBa+tJtCLAUVGYhN7XXq?=
 =?us-ascii?Q?mRJTJMJd/coCe2KsojNdo7riQ7nOPn104sFdgs+BzDP6RmDRDRanNkSbHKu0?=
 =?us-ascii?Q?xmg5dc86Glc7JOyc7vTkJyf1ZKtqHDlxREFKtKOO3iFUXABxzv314Ozd3y3K?=
 =?us-ascii?Q?sQE1xolwSnYmwN64/kG81G45U2ph3EojPbdIRi6CHN+Kx3mqId+0xxlSbCeY?=
 =?us-ascii?Q?SsujIfUOYnCf9L8365hTVvI03hgiZ91rJWsSF4pPCWgr9Es+wG/fTCT2nej/?=
 =?us-ascii?Q?fxfN6oIA+99trTXOpz7oR+nY3T2hoCbSFvNlR5yVXPJubTATbOgMKOIgAl1n?=
 =?us-ascii?Q?Ssmg4lTkEVAwJtNF4b+bVSAk/HnNk0/+R0qhSz3yK0j/y2uWg0B6vIjJlLWM?=
 =?us-ascii?Q?A9qtFo2UN83NAe02FuIk4LWXOZ0jo3TnHH7T4WI9mqbFDSbJraSQxQIkaOLY?=
 =?us-ascii?Q?gUxQ25PVYUIgPopRG+2siWbHr2zMPyrmRf0kntyyYV37moQGrm2I70sBfjzD?=
 =?us-ascii?Q?npf18Ufpj5i+yL9PS/T0NUiLhxoEj9bztq/I1gOsUJGf18odrhge61u/h942?=
 =?us-ascii?Q?nsquOEHkgqjDC12CWxxpApZb7RcZ3ofk9zPx8LjlSXKu3ncTHGliNfVe79VP?=
 =?us-ascii?Q?U9yTXiXsIW/lNSsjdtr3Rx6vuecwUT6kuyB+KUmKx9Yvn1e/Fpo+OEpfTdcA?=
 =?us-ascii?Q?QNAvBbPRv8Qnymw7TX1ERxwmhrEa2l0ldppOmWloMUtuAmXxMF6nB88GolYz?=
 =?us-ascii?Q?4l9o+PCkfrEHTg6oD36RMr4r+PvqfobpBdWEuM1TKIyZVp0Q1+RzxTFu3Woe?=
 =?us-ascii?Q?qfgs0TM4xlXsEPY29UPGCATBTjZMnNVM5BE9BXxosAdCQ7xVx4KXsI+1/sHu?=
 =?us-ascii?Q?6tXEi5igYAAkQqcKZh4OAbM54XzRWP9SydTkI2iE/E4Nl/1KIj5hwAgctcfO?=
 =?us-ascii?Q?o0RWbi38cHpLQqXJ9mO2FqEEHrk/X3ED6qdKfBZzYxOmMflChWQbP4XGVibe?=
 =?us-ascii?Q?aaNKBP/QHP7+UbAVz4mhQ6Bwgj+jefnDYDqdPyIBQrJP5MdZlYSSansrJymH?=
 =?us-ascii?Q?uRxUESGdHWvHjLvd4t6LUOpiWfsFbVugLQ/OIGJzcNMZJ/OGgJ3cIaz690QL?=
 =?us-ascii?Q?LXVRpAFI9XHPyZ7LAgQzKWgT0vVHlziy+FkxB7pbPe/sfK5rHWy25NYMjzok?=
 =?us-ascii?Q?zgaCJVtZ/7Xcfv4I1mxd3fCl8LYEMrJfezisnnytA5V0fgPqRLCQp6i4X+wU?=
 =?us-ascii?Q?kb15uON39caKnUaMyQojWoQ09rgugvvosvmJNKxVNAipzcDwlRGqVs0cIKU6?=
 =?us-ascii?Q?bzMJjQdXMEhhIC9f9SLB8qGfL1hzpz9qzP92PrNt?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 292111fe-9f4e-449c-a8db-08dce48ca976
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 15:53:17.0907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wS0om8GlyCRG9SpbeBFgGkL8Cf/L14cXnhmmsiJFhCq9GVfwN+1y5A/iJ8orjdpJp+IRHfT9mtbh7Ntqj2odg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2557

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

Gary Guo (3):
  rust: implement `kernel::sync::Refcount`
  rust: convert `Arc` to use `Refcount`
  rust: block: convert `block::mq` to use `Refcount`

 rust/helpers/refcount.c            |  15 ++++
 rust/kernel/block/mq/operations.rs |   7 +-
 rust/kernel/block/mq/request.rs    |  70 ++++++-------------
 rust/kernel/sync.rs                |   2 +
 rust/kernel/sync/arc.rs            |  45 ++++++------
 rust/kernel/sync/refcount.rs       | 106 +++++++++++++++++++++++++++++
 6 files changed, 168 insertions(+), 77 deletions(-)
 create mode 100644 rust/kernel/sync/refcount.rs


base-commit: c94d8cdb9ade6357824d6c2338e03d1cc726d43a
-- 
2.44.1

