Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021122.outbound.protection.outlook.com [52.101.100.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4A3448B82;
	Tue, 11 Aug 2026 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456579; cv=fail; b=W8XO00ZJJ4Zj0hGLMm+RAtTluWmvty3RJYnxt9KVyV0LgS634XS3oLNXlEx+WF43YhS5ckPXvgMgorlHBNjb8iAMRbBkeRZccpGfsZBCEjqnGCubN61aGKtFFeG9zCqi4m7BqD36jaVXdx8WPkq+3PQmor5sKI7VqIiaDnXANVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456579; c=relaxed/simple;
	bh=jDqxyRhr5TfwjTNdgQoaI3M3rMzL5bg2OPtJcU+1SAM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=rt4Hx1cvRRSULiHxBwfYfxqpRLWEsJLs3HWGn9m2ZrJZ+KqNr1mPnyWb9MuzrnFJ/2B58tj/IgoxpN0Ys1N7ZHU0HR1vp7rpW0Me5ewdgoAmgNGvKVXhHz8oqe0SlJrhfX4FtUSy5bTETAOhZNymg9bFk27u8fbpYAORJcCO+MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DX+5seNc; arc=fail smtp.client-ip=52.101.100.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DX+5seNc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kx+xkbOpCBtUTeDUZfTV+/F13/pYQT6ez0Yih7UE2mxCeHYV8uErlH9sAVTmGw9DSFVLwXLmQ4DK475cBDx/2n/4QLpSoo1c+D2zBdy+oE6gXqkeanGfZsVD2vimX0bM1B0Cf1E+w/JhFLEA/aavG683Gnb4fEckGExUS6K+cz9m9P6atbnn1OnYjtjVAyideL2AE10eCF1apezjjD6JXq/7NPaw0C7dl4KK1SLGc2HJXwOTL2xcC2otZ7zYRm0SQ3nq6ebCP/mSR2rA+SbZCoYSqRk7iwsrUS+t8XXetOOxMkru8YAhxWjS0+X6oa0p5Alvf7wOT8TxJ/gZbvlQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tuzu/F5LLZAuzJIOZXOOokH6sTmWNXDji1QXn2hdXhU=;
 b=YpdjsV1fcOjsBRW2Z57zjDNAKIYdvDfzz+cA1jDsagzeWYmTFmAuisvxyHbn5BmcqOc6D1Mv8ylzOnl3hXHS/ABZb58ZplNbFdvdzcU/ONh6gkMtkDxOxCrfCywRlE40FVYADZaYyTiY7zYSezS83fkQ1MdHcuApSbyCvvPYv/aDhmuLoNkKKRGsbqkKydSJVBaD3PKah6fgagAxAnx7wfDkZV2y+yXObFS7OkbiWiWMqw7I3UT3l0nbYtV6IsyApsmRze3f8c7Sw2Y07OScbZWQLyVAiJC4x93YRqHUA01OBa3Ww9gso1sB2XCscFsdkMwkUFwLsJh71R80Auu7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tuzu/F5LLZAuzJIOZXOOokH6sTmWNXDji1QXn2hdXhU=;
 b=DX+5seNcNAbmmMv7GXwUJ810hUmpMCcc+jUSII96Fv0Kn8aVuPiB76LOTeglnG/ZoMmCUcMTdaAnL7dLww5zvokArhFEWUWr8O5+C7slpdQ6kSEPZ85QDsiDLzHSj+f5NsgB3B1W2S6I2M2KD4D2iJeMsN8mqFFxQg1J7/Vbonk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB8765.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:56:00 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:56:00 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/3] rust: macros: vtable: add `#[optional]` attribute
Date: Tue, 11 Aug 2026 14:55:54 +0100
Message-Id: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOope2oC/yWMUQrCMBAFr1L222ATqQavIiKbuLUrbSrZtARK7
 26in/N4MxsIRSaBa7NBpJWF51BAHxrwA4YXKX4WBtOac2u1VmtCN9JjQh9npQ3avusuJ6sdFOU
 Tqef8y93uf5bFvcmn2qgPh0LKRQx+qNPIYckqUE7HCSVRhH3/AkrMmoeUAAAA
X-Change-ID: 20260811-vtable_macro-12a8f557381b
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786456560; l=1113;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=jDqxyRhr5TfwjTNdgQoaI3M3rMzL5bg2OPtJcU+1SAM=;
 b=RRYMvI01zXZCv+gebJbOZQoU6uzVoCVFY2HTHLsDWNjYImD4K35iJLY7ZKcLnBgJiQZRYF+hg
 /StanoZ8C0MBrh4N/O4sxAUzPBnrZUh7f2outbYcC8+coFaZeChY7fg
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d86c57-28c8-43d5-41b5-08def7b046b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10070799003|18002099003|921020|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	OmE9GXYFiuzmQhGHqnc+Rj1Wf6u99Z9bZJ/pI5MtnJS2oQjYjG003ND9EdheMvx+uCw3rWRnWz8CwZOY4Ym94Akwt7xZGO1Pq084gffah5kGqoTWOh15JCvnwrgFuxfXRhKlgZBGUzWeQ0RsTET7slV7GLzppJ+Bp0aTrv0Q5ju8wqB0ep7bpvOW4SIzGPH6x6FxqNWVhJ2u1cfmxPChjPjDg1A1N+/JKZqtmD19q0gEQaJGMbNp2o2g6l0IJMDr4kDHzVILVWALtBO1Wp6G0Jursr/SuAooXJPSQcticQ0l5ZbPFf/htJ2ptA3KaCIJSP3qMCDMHf2SfGIjAY01iMIzskH3/L4HMEiB4o0TQfRB5BbaEetrTpuSgeBMBJz8liXSMHLiMb4kBFGdv5DYIgir2WVFhJQL7rtAxwAYJaG8oG9PxXHLCAbZ+RQwIMXVMxwJbFwjhg3AVwfHih4GuW/KeHilUvaRvdpliaeCfKHMc9bTDWwH1+rzxMNJD8z9aI+e7f0t3PNV+zMjzvUIkgPcK7fAMlm/YKWuGQEKx+0ejcaw9GKZBZ14ELmBYSS/T94n+ir3IqEqAqL3uq0NzXAWyjeElC26u7skBCSTvBtHKdtTNTAbdgRqJXeTzGwjthY46aMim6INuYIPLLW1EdFvIgxVUiToPhKL4mpio1KaYFk9wDhgwLvuW3eoXyfAjx9oFpabaM7q2xhwQgiMDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10070799003)(18002099003)(921020)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzBZODBxL1RKZzBxUmMzdVkwWjFnaUdSdVBLTjRrUkp2TVpnVkN6aG9KZ3ll?=
 =?utf-8?B?UVU2RStNNjZvV0VadjJYU2Y5VjVUUWRYdkRjQUU5Q0xKK0xpSnVqYkRGODl6?=
 =?utf-8?B?eXp6YmsvaGtid0tzbkpqdi8relFUNzVRME96K2xOUWgxSFpPU29wWER2N09S?=
 =?utf-8?B?OTdaUDI0bjdjck9BVlUwZkF5c2VwTUk5ck9EL2hFZGw1YUlMWHU2NWlObEV6?=
 =?utf-8?B?YjZaM2EwVlJHUit6aDlYLytETDVXakJHbXJDaXcrakdjR3YwaW5qSlBZRHpU?=
 =?utf-8?B?NGR4Mzl3MmVaK3N5dHhRYTdmZHZLRCtoQkNlWHZsamZxZWc3SGdWaHNRRHVB?=
 =?utf-8?B?REc0LzR1K2hhbE9PcHdlYVV3NHBleCtQTnFsTXVPeVpNQmFmcHYrdjJwSDAw?=
 =?utf-8?B?akJXVEpRVkFOcDIyY081aWY5ajc3ZGVxUnQycVJNc05YZ3dTSHRMakgvNEVC?=
 =?utf-8?B?UDQ0TnA3OUpuOFZaMlF0cFl5K0VZSGdMYVJkSituSG1FZTRmTFI4Wk5ONFdw?=
 =?utf-8?B?a2owVGM4ZmR3ZkJsc0NQVCtyWmhaZFBVWUxTL0lUMTJ6NllIUlVYNzNxN3Nj?=
 =?utf-8?B?UWk0RjZ6NUhsQk85eXZKeitxb0t6WmFaTlEzaXF0UHVCOTBpRk82R3JMck9E?=
 =?utf-8?B?amRFcEdzS01uMVNGaS9DbnViVkZwMU9UVW84WVdoK2g4L3VzbmZkcjBaZGww?=
 =?utf-8?B?b0xaS2ozS0kzS0ZNMkZvVnFYKzVQY2pmZ013b2Fnck8wSGJuL1pkSXpYQ2x0?=
 =?utf-8?B?TjgvR2VXQTRlbThYbTc1aUVzNWRDRm1NSGNRdjdCYXhSUmpEZnBlZjhqNHZw?=
 =?utf-8?B?T0xCTTVGRVRzaDNjUTU0am1qMkI4OGZJQXBsbGtmSk01b2ZBMmJKOFJqUzJZ?=
 =?utf-8?B?Wm5wcEt5SS9ZMTFZVzEwYnQyT1R0KzEyNi9qTGhOblZXaHRKMVh5NHhPTjFU?=
 =?utf-8?B?emxXNjNWL2l2V2t4dHJiUXhkeGhvb1VuM1dFTXR0ZzJGTWt2YXlOSkVqMEdq?=
 =?utf-8?B?aEJrZTR4MjdyKzUvcHdjTFdFdTU1LzRNUXpsWXorbzFEYVZ1NDJya2k4QWt5?=
 =?utf-8?B?eGdmWVNNZ2NIWTkyQTZZeEJlOUI5ejZ6ZzNiaFh4aHd0eXF2ZllwYUJIcmli?=
 =?utf-8?B?T1JRcFJ3dHlKd1U3b1R5Rm03Mm8wVi9kQkNkdDE3UGJmSzltWmZ1clA4MGZq?=
 =?utf-8?B?SlNWOUtrRTI3RitKMXRZMk91ZFRpTFB1TDJSRFJZVFVoVm9UbDcyM0p2NGZB?=
 =?utf-8?B?SkIvVUNDL3NiMndWc1BuU3JSTnIzQkNFb2ZuY2NyOXIrSzFrUlRYWFFWc0VS?=
 =?utf-8?B?VFNER2F2cnJXMGtZdDNkVWtJb1ZIMEt2dHdGbHd3alJzVnFDRVZZUk5RL3pW?=
 =?utf-8?B?M2lxQ2R3RUczSFpWMG1JK1V6Y1EzUHpEVXNURXYvRFhscExUY3BzTWphWWQy?=
 =?utf-8?B?Vzkwa0d6WEsxeE94MjFoMjdQcEdZb1NZc05YaTQvQm9peXFQSW5tcmFQRk5x?=
 =?utf-8?B?RmFsZ0poeVpteGlFaGRQQUJ5UDVrVXZmWWlBaGNOc0pvbnVXTkovbGt2a3dx?=
 =?utf-8?B?QmM0ODZzOWR1Z3dMWFh4TnF2YldDdVZRcEFiVXM2MDZnRXNES1l1bXZpb2FC?=
 =?utf-8?B?ZmdLOEQ5LzFyQ1pDSjNiUXVMZW1neTJtQ050dDBDQTNlT2x4UnNiUnZIZXRY?=
 =?utf-8?B?NzAwbmhRcE1GSXQrNnd0YjVFbmNpRXIvUkxPVVhCRDJITjQ3cHd0MlFWRVI3?=
 =?utf-8?B?MURJY1hFVVg1b0wraXhQZGowTHM2OVowSXBtRW44RjJXTjNESGVUNjJoR3RP?=
 =?utf-8?B?ZFFZQXJzanRmbFNpdHA0eHBKUEM3Y3lpbG9WQUF2SEFSaGZkTmFNYlF5dnNE?=
 =?utf-8?B?Rnc0eFJpcU5zOERVdkdSTWhPcUhIRFpyejhWcXRIclNKVEFGNUpRQUlDbkNj?=
 =?utf-8?B?bzJpTlRiRUxTNEtmQ2phWCtVdVcxd0xmNkwvNlpuYkdrY1I2WmdZWmxWdlhG?=
 =?utf-8?B?Nzc4UFdyTEFCemxobndMcFg4WVBXNThvU3JqeFdadDVCcDBOeXZoY1JhQVRv?=
 =?utf-8?B?NUNmWTBsNWhIVnNqeHVvcFpGdzVNL09lZzhvT015Z0dpSW1kR05CSXFSQ2Ex?=
 =?utf-8?B?UFdyUnlabVp2Vm1uajFmN0RhTS9uaHJBeTd2RVNrT0N2YUdWTlZMU3c0Yy9x?=
 =?utf-8?B?Y2Irc05YdFMzemVUNUViYlN4L2RWQjNaKzZwdmVHVTE4dGtsQVNlbENHQVlR?=
 =?utf-8?B?aE4wbTBhRkE0Rk1DMllDa3IyWTdhUkpHSFRBVlVPYjFVV2FjaXd1NS9VS0lI?=
 =?utf-8?B?d3BFMExFZUE0U1dZam5ZL0JJam4zczdoTFdpa3hJMGc0QjdZMGpYUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d86c57-28c8-43d5-41b5-08def7b046b0
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:56:00.6809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uN+Q57Ok29fsRFhTZxzxwQCF+TTYaimbizIEMpBf+3VD1xu+C1i+Ub4Quc+X/R5vzycyCEmpykgA/wDgvEgYEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8765

Currently there are a lot of boilerplate with the
`build_error!(VTABLE_DEFAULT_ERROR)` because Rust want a default
implementation but we insert `NULL` into C vtable and never call the
Rust-side method if it is not overridden.

Add an `#[optional]` attribute that injects the same default
implementation to avoid duplicating this everywhere. As an example, the
misc device vtable trait is converted.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (3):
      rust: macros: vtable: hide generated `HAS_` constants for required methods
      rust: macros: vtable: add `#[optional]` attribute
      rust: misc: use `#[optional]` attribute of `#[vtable]` macro

 rust/kernel/miscdevice.rs | 35 +++++++++++++----------------------
 rust/macros/lib.rs        | 39 +++++++++++----------------------------
 rust/macros/vtable.rs     | 43 ++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 62 insertions(+), 55 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260811-vtable_macro-12a8f557381b

Best regards,
--  
Gary Guo <gary@garyguo.net>

