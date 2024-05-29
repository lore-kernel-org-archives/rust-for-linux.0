Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11021011.outbound.protection.outlook.com [52.101.196.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA3D1C68AD
	for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 20:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717014563; cv=fail; b=H5OmIJThu9LhTtXkaH+KGcN6y6S1TynP6fvR1E/0+S+yxZI793RFzl7HJFUWh0mwkbt2ptUaWwQzuMbdqE0t7Fd5OH9FbvVhX8nfAbL5QbXvphZRq3VmsKjbZnvkizgNkqMKiO4uvek1xCU9BSZitqJPoA3OzPWEnBZepvrJlpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717014563; c=relaxed/simple;
	bh=PQ0U9Hld5L+x2nAPuthe/IJ3YlrjKuD7Seyzx4+OBY4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hNOvj7HE7dd1X9wDG4qn8bZprsjtoP4YlA3vHoIHo2j1Bh9vBjL8fWM08aVl2CObxsOyZhCTG9sDnH4rThLPf0TpY6hU1sTbkB9GXb+1OEHcDlbD4zPfJzeD1EFUWOIgDfUlOtAv5tD91XTkClAGM1p7M7azo0khqwtrY3QjShU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=y6vvsI1S; arc=fail smtp.client-ip=52.101.196.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="y6vvsI1S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwK0r+lYP4rChaB5RfadEj9JZVpaLznpE4fWS0NRvokoPXm3Uj4y8oM1jTLieQBNKJFmAwPJtKrmgy1rCYaoXMqtRbj7Fk1Pa4197hJqcbI/fRwP3DbchVEe5qcbOThFkM2zQ34lEk0ED7nvjml3yzW3OiLTgmMm07JXsv34HfZwfZL4AI+qkS1k5xOpeGE6cjZNb6iYHFcVQXhSsk+LnukFl6Srz2OrurxLYTAYyCN+ywtUvbGsj+SIJBU/RLNEh93LhB7NBnSKvyXn9L3YVdSBm3ET+BDCty7rwKMCE0mvvplbnFmtKaisYmEM4ZujjaMPlJ1CZU//IocZpFIHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2l64WAgIR9dR1Sg5xWF2vblRfy5H1Ja1oG6YSb5PZc4=;
 b=LP6p/dpS6uvn17xEszSa71NaJoQTIDbB4FcRAx/YbT2ISZLXi9C18ECK02aEGF0R1yZZDb/K6BgsRWo1xfCM3XsPretve8uzQPcvhR0uToluvI2iU+gCXRnqJ3YUNHNW/H6K3TceaANBkuNZNwAWINGRmDxj1Gjfag5vG0JWAL7q/RpqsEn59Q2lpn6PU9Al9tqK5/qDfYVapA3Masd+SXUyZsjvMQzvvzzky1DnAGgUNithl5ZlJrN6YT+INuJ7iUXfVn0NFJrD2zzKMAbaD716W0S/9RP+yQauyKutYIrVLy9PGoTt4KTq3val93P7mOBc/m1AMkXz3gSirMUbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2l64WAgIR9dR1Sg5xWF2vblRfy5H1Ja1oG6YSb5PZc4=;
 b=y6vvsI1SdYNEP/WFSdU2XidZ7EKcZwbIZhop7+yFEVKjkMwZLftlbRReSElq4ebkLEpqq4DaGGSjY4WXL/yxOq2DOi3j3dymJDSoHQXsbfSubE5rcPaC0kgtJXp7jwSLUiOQLb15vpG+6ppxSOfcA88cN0FhaMrnBdpLbvyTWoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO9P265MB7874.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 29 May
 2024 20:29:18 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.7611.016; Wed, 29 May 2024
 20:29:18 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org
Subject: [RFC PATCH 0/2] kbuild: rust: provide an option to inline C helpers into Rust
Date: Wed, 29 May 2024 21:28:13 +0100
Message-ID: <20240529202817.3641974-1-gary@garyguo.net>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0222.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::11) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO9P265MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: dff99b5e-9310-48ae-9d1d-08dc801e03f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UX1geYXgOdmXYjx7Q8aBnh320aicu89xMYccTURgq9aSyQhayTrwqKJiW/U5?=
 =?us-ascii?Q?b1O7dOC4ghWOUVzpzwZvVSMmY0nUJVCSyu/M78yz+EGBM1fd5auJXourB1Ju?=
 =?us-ascii?Q?y8ME3/FJpGerYyqs2LM2oID2jMB2D0WEP9Ec6qzeStyhCh9v9u5OAZTdHvGS?=
 =?us-ascii?Q?GX8zylG4bPHQ+qIHYb8CCYOdrP1fTTdfJUDQtLYZwRJ2eqxFYyj8KcC+st+k?=
 =?us-ascii?Q?Eq/0X4i5yqLWVUf1/XEHbbkm7cwp2V0g5ClDr7L3PCp+G0m5XBqbVoUDsE6p?=
 =?us-ascii?Q?K4oeGm9b5pp1OH2b5t1/ch+NGeY+fwlqJu8lBFJk69HpmM0u4jdkE9M0PFgj?=
 =?us-ascii?Q?NBzC/BuAIRlEgbEP3k7Zc2tS2v1RgoElfQqvwuly8tOTt3EZhguYcMDpd3H2?=
 =?us-ascii?Q?hzG21BdUEbmPagfqf2Of0sg5O/ws/N//NHbAQVkF/t9gUAZxd5ix2Icfo2l0?=
 =?us-ascii?Q?jIN/M+sGij8XVoLvPc6ZLA4LxClTFWzNYq3F/Fq8f7SMODZYY1t3GWLfDjpg?=
 =?us-ascii?Q?HeK/ikIl1iO0OJRkXO1x9mKt7bUCWzdGLf1K/QxynpYM+ujqttlKKmc6ocl+?=
 =?us-ascii?Q?uFqpivaW3+UYp15aoJPge8ri7ciLuk4qoSbl7WUg/0PGdC5USSJOLZ9zMY6P?=
 =?us-ascii?Q?/RT/w6G2Dw1ygHt/xraU3km4IO7Q9gOp8Gv8r4+E4jrDO7H+sINwzpsjjDL+?=
 =?us-ascii?Q?AwYoTV4Hw7MAnNkECse80N9Jur0R2L+J1bGpUVHNBSyofty84apqMy0JSEAQ?=
 =?us-ascii?Q?uCc5AZlRnn3p+Q1OfW46WJzKONIbepr1qqjP50cWLNJKcYGySEzY7Fx8H0Wf?=
 =?us-ascii?Q?rAkXYj4POjtfMCSfukXzKu65yJcnvJy/JnrRehMaPZSCay5IiNGfOmPqnJrH?=
 =?us-ascii?Q?cKNsIEk2Im3X6fAktkn1nGcmTb7G+ZGQHs5pnYqnZpk54Vk+R7eLZ0J6+tUV?=
 =?us-ascii?Q?asUUMi9Hg4RzCPBshSNu4b5UAzqPCrPpk/u5a2GGg+OkG9wEBYfXmRL/59dZ?=
 =?us-ascii?Q?x0Whl14oAyqip0zyEURPHZRKZ/RlLNfmMqssHNQJ47QLGajPKj7K4quZx9pI?=
 =?us-ascii?Q?lIo5nolV+hv1fzsKd6F5aWM96HpfjJkwBJOqPhUPiEx54CaWxyVM2jdcyhuz?=
 =?us-ascii?Q?BMhw58ZOYvvzlRsiMYQuj5rs7UqnxPGkyQbTndEucEgXgPIb1xwK14rJdkZs?=
 =?us-ascii?Q?7HFfn45P+Tp69f0cHRDnXJ0S5GJMIgHeoxV6y/fxwGQECifw6lVRaVVucdon?=
 =?us-ascii?Q?FVrpnKKRoqevgxwZ32YISbCVyxnTmLR0S+qURJWgEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3PwbfyHRTygsqGj+hEwKB9xQ2sroLPHnpzboiobqNN90kog5mKk1NHNqE7jF?=
 =?us-ascii?Q?jDWx/9YLBs0UyuZlN4cuGCE7cdY/3a0UP4TQaiTdfyQhLbTscIYKHllbbz09?=
 =?us-ascii?Q?UfMYpf4lgh4PlFViSTqujmJtjJsstsTI5t9LUKmhWE/gM/dY1dyI6NFPpmH1?=
 =?us-ascii?Q?jWTpS4nVWGYZGnPBedN4U5n1nzQcGEZm2K+Kw78KICThhAGLeFadcirRi7wy?=
 =?us-ascii?Q?jNR1GtEEwMmFlBRejkWCqD79mnVluc/uak3s4XkCH/xGHEx5OnLGrBWwrBDm?=
 =?us-ascii?Q?+L46/W5DctrQGQgjSRd2pd2vOXbrVzcrrx2Gdr+FdF5egXQWNXWpu2i5dC9S?=
 =?us-ascii?Q?/EjzptHGjU/sxxxOKsUw6+XUKDcTxWDrhAZhoet/sa6vPuvmM6KvzSavmusM?=
 =?us-ascii?Q?qOvxAZrJRAlGb1/i2pyjRm2eBVSjo3lHqDLcsEDAfUV54fmYPxhRV8pYXgtg?=
 =?us-ascii?Q?cQWHErejFa5xOOOoaP04yO0RN3ZgFYYgQscMXUzdsAvXEi22o8whlKluKqy0?=
 =?us-ascii?Q?2xHmy4lyUV4rLGPkcbf2lTAtlsYNZfT/wGqgLu+tcZu02NFKkj5zpACHLeKu?=
 =?us-ascii?Q?huU10qYeV5Y9m6nNvRAnB8moQa6khSJ5oTnUXAMkE0JGGLtNv2YQgOL4V1A9?=
 =?us-ascii?Q?o6ALGYd3XTvLupV6wcNtX8jveGtGOwptTxgNvrXik5XrOlaVRXuK/RMAyWf0?=
 =?us-ascii?Q?LxvWUnCFY6XhkRirJOwCQ3TeFnXMzwTUe3CGD3Ir8x4a/w0v52fw3vlfZQrC?=
 =?us-ascii?Q?BFtpgK/B/72jf84jIEYO9lycd66z4mx6yxniEWdSeo92J72z3dUhGCPk9Dk7?=
 =?us-ascii?Q?bg5HyZrDDEmM0QRAEdRFSwl6gFsYHKQiZudEn79T3tSJ6y8ooYBTci61CrwK?=
 =?us-ascii?Q?U95s7DA/SCd13he6YQGvq2DTWkpX3txgJN0liqXK5QUnhdxu9PgQwIFNFRQl?=
 =?us-ascii?Q?Ix3JKOkgbnYBuXq4UaWJ1+WTVIN7mUorBXBN1RKw50H4rT94UYDFqnWzfpFv?=
 =?us-ascii?Q?jI4wo6yVffCZWXpLCWkn41dsHn7qfFDXRHe3P6WeTQ6rGf7MSuTH/oHpbGjb?=
 =?us-ascii?Q?eOMAPBpG452F9XimHs7qRA5OrDjGWfJjIidmB2mwUnv6G+VKXVAnQGV5m5D4?=
 =?us-ascii?Q?698N/1ROpcI7x5l+9MHYF5MkTvmAd5scDlHot3MHHiPv1fElfRD3/3LnlYlI?=
 =?us-ascii?Q?Vm9YswDG9deEfueu668lngtaBO3qgz1YFcT/QcmcCdjcRaJnmmvjQHGcZsBp?=
 =?us-ascii?Q?3Mzeq2+E7YTZ8Y6aMY8WE3RXzctVBwibRkkMgiUmpVoGUQVn60CYyOYgkspn?=
 =?us-ascii?Q?o93nutuRXbEldB/1tLap6dOPRKlaH2C/rCp2yufuqAOFaBYAhL6sFRpBxJkK?=
 =?us-ascii?Q?2Ask2OceMCuLNtp4t0QEc2YSCDZOa8uKiiF1BF6wdNd03cf50FCQjkYGPLZ+?=
 =?us-ascii?Q?0IC5+tCXU9bprfe4PtPRBgsnw16LCPp5DF1xMtS99/wX2uXPVtBEvBYMXesK?=
 =?us-ascii?Q?PNVUoLaAdr0n8IMNJrSvsel14Dx7Amsh1GPmmb/0wju5E9is31Jx6dOzO94h?=
 =?us-ascii?Q?FbM+O7z7ru6r6rNAHayP7AyA/Vf0ISh8ufq99bXEcPn6HA2WvIyCQ50/pMY/?=
 =?us-ascii?Q?lwc7ftjlcx/QxaTw3Rw55W/L530frq8pvzUOF/RumeON?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dff99b5e-9310-48ae-9d1d-08dc801e03f5
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 20:29:18.5575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P019Z+KjLoyFxRBL44fZ9sure+/UJM8s7gt4Qx3/fLbslbenbeyB9ULfDNq/ixnA1RFi6HxW1tMza+qoZTHX2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7874

Currently we have quite a few helper function to aid calling from Rust
into inline/macro functions in C. These functions are typically
implemented with macros or inline functions because we want them to be
fast, so we want to actually have them inlined without the additional
function call overhead. However, we also don't want to re-implement
these functions in Rust to avoid accidental behaviour divergence.

This RFC presents an option `RUST_LTO_HELPERS` to inline C helpers into
Rust. This is similar to LTO, but we perform the extra inlining and
optimisation per Rust crate (compilation unit) instead of at final
linking time, thus has better compilation speed. It also means that this
presented approach work for loadable modules as well.

Andreas tested a variant of this patchset with his Rust NVMe driver and
saw an average performance gain of 3.4% with the option enabled.

Gary Guo (2):
  kbuild: rust: auto generate rust helper exports
  kbuild: rust: provide an option to inline C helpers into Rust

 Makefile               |  4 ++-
 lib/Kconfig.debug      | 10 +++++++
 rust/Makefile          | 35 +++++++++++++++++++++---
 rust/exports.c         |  4 +++
 rust/helpers.c         | 61 +++++++++++++++---------------------------
 scripts/Makefile.build |  5 +++-
 6 files changed, 74 insertions(+), 45 deletions(-)


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.42.0

