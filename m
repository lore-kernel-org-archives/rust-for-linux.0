Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022133.outbound.protection.outlook.com [52.101.96.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E474B404B;
	Mon, 28 Sep 2026 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596303; cv=fail; b=B//QOxx5CmwcV6S4ke4qoyEE0NYjbrpSo//z8oh7zC/4WUm6FP3lx0xBVTn+9By13vEXJySK8s/n3uRrmZcwNr/FF1yDqXGYXTNepWfI+UeOvlbUNQZMa9SdmcWKMpDrXl9yTUs+l94bxdC+UyQ0S8WgDtmcp5qhdQRwFw6yc78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596303; c=relaxed/simple;
	bh=0d/2Ia1vfv3BAh6Cxl80+0kcvNgKAMnDMy3bt3O9OTU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=j9tFMXoiK40cQAZDj0O8y/t77sQqfvKEzaf6yEJ1o30AM2tWQ+N3Md6hcY/iRHd8muzNPGBTlMHlm6USj1rZqXZ8P2fvfQkST/3zQ0o8pl4kq7Gg+wH+xg2AobMF4/4+4oembPAV00Vhf+yKR6+eb7IW97DaJexIALbNZgdh6N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qn8tqkXz; arc=fail smtp.client-ip=52.101.96.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qn8tqkXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJ/Wcuw7qiToda7g/3MVAzkDQAYL98CSPky3NNg0Dxwk/PImwKsv4LSCe72fbtfhQ0R2Yg3w+eSvICVcJoSvZjI/xIhzYN1uJMM5pXFk50+vuALGqKExDeKGfWr88Pf695U0GW1qD5wJJSU9OOm8tOu0aLlO4VDwLPTyntSvG2xZ3vTOMoSUG4vVSN8QrsS1XJVpNRdqTHTxguAfGuwHn6iIsdK6O1e1jjjmYQqkea1MR4jAf5oxAFqplYWQoAHkHjmFU1/Yl8tjjRXEAYmyuIJRvyzOEHWmxn5ynuL0k+vldZjHeWdocJLiT5gwkmkeV2hKtbvOwmVCD9wUbIgAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzfxCmA+AepoO1W7hR51USi+2uVWEoXFGH7hMUaHoec=;
 b=gNYWHeAJ33+VUhbE92n4NAD/4zFjMD3J31tjkKbEPpt9VFHofnA9BaJsZcs+qUsVHOr+aBGgscREoCSI0InB+NAUSBMPpInwsiJR0wRdpnhILXUmPrt2Ds2euubdjVzTxw2TZdrJes/sKODEOsYjcJmpQ7rbcHVc+FC94NPIO/WVLFRfxazGH2GZYdpXGKmFwBWEXSAAbpssYD+IKOmCfmKiU9HFqsYFWwGwqAMK54H0wtnPrLdbSgB1vY4spB0EAIS2yw7O/ki/QOVQpg8JjXh92HQycyOzDqF9H9PAtqIxvh4z9x2gz9kAT+iwTnyAv/CPUsxLMxSfMHOCbhiKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzfxCmA+AepoO1W7hR51USi+2uVWEoXFGH7hMUaHoec=;
 b=qn8tqkXzKo421F3jJyN4W/wxA+bOIwrfMzfOHIz+ctYPATJPw6ATh6m1xJ3irHJcORFvtZiWqu0LPKtyTLgRxsUIW81pfSOrEAYLTW8Owf+51PrEf+DeOqfFtlDWYJo7m0gN0sdazJHJbQiQOC+tFmCB1TeVEu4BRjwaGBhuWp0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOCP265MB8641.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:51:37 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:51:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 12:51:36 +0100
Message-Id: <DLQXEUPBK9YP.32KOE82CSMXLJ@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] rust: pin-init: internal: handle item and expr
 diagnostics differently
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260923140618.1978181-1-gary@kernel.org>
In-Reply-To: <20260923140618.1978181-1-gary@kernel.org>
X-ClientProxiedBy: LO4P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::19) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOCP265MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb4f8e1-31cb-421c-b074-08df1d56da05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|7416014|10070799003|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Jn0mWyEmCYLH3enAa3shG/CWR4X2rcbsbEtoTxPiW15oD5Kg45YW4b9n+kd8pKSuAZvA2AUtRipnE0StpBPlCHTepYDHzY8tuq73Z0Tx2zZjg++6Z+NQRtol/W47JCvzyeqPR4b8Hyf7ovu8Oyew6kNOTfQzkDpt726ks2rw9HPfoCpyz6NNAmoPBvd2a9H7YiIEne2eHaFwqilRIfCMN9e3GbTAhvPrIf1EX/PH7EfLWeTWxNr9G8H1nT59BWiwQbw2gjW6n7fRDENM8M5NN+YuDvNRQysyvBDxDjLPF85ZlU4c+urDDH+oTh8lBOOvBMni7QKeA5r7rYKHwuku1qV0va9TpuKnQbhCys5fMLOX9Lt8cuS0/2YOTgSW2OSiaEx5xwLn9ZDYsaW4yQywpKy0AUrnVsj8pfyYFs/99ekNEUqqPsVJRknC0z+PCeLbBW06Vslql5aEkOnDxNhhnL6hia9q5z+jwKxWYh0rNvj3SSxjsSxIrh0Ta2jCycHU8kr3hKQJLqplTtRZw6KT9sJr7208ZRfmAhpRLQgjSLl4vAENOlnsDhmeQZpI/AWk2aqJaMKdsBvePmVrM9SvroMi2X/dr3eONNBenrDiv0epQefIOoyzQ9fgD8Ri06slHq/wrCgeIO5qtp60UukOtk0RZwvE64NabFQyaOgeiSYA8+JUa0ffP9vpDyEJTUbHBly9s/SDAsRlhJmcS8r+ZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(7416014)(10070799003)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGR5Z1g2cVRudzhtQlNDanhNUUExTmozTktieFVXc2xrNExEZVRHVngrR2h1?=
 =?utf-8?B?ZnY3QWZBQkpHVXNOMm1QaThjUkg2Uytqdk16T2JGVWs3N2UraHRmL0lzZU1N?=
 =?utf-8?B?U0I1RG1lTlgvdnNjdUxRRnVwR09oOVd6dERseGZIenl4dzE1VU1XM0dPNkNB?=
 =?utf-8?B?Uk9GUWNCRUlkYnc2dDh3bzhBcG9DNmpJb2lLQVo3L3oxR3J4VTMwakFWZ3Er?=
 =?utf-8?B?MkJtQnh2WmdGVU9Qd1FEbS90aWF0OXp5WVBTNkt1UUtVdGdzeDN6NTVsaC9u?=
 =?utf-8?B?c1Jwd0dJN0ZGMTcyWXRFZnRaQzZWYkhUaDhvUm5LUmlWSGlvSWNRYkFEUSsr?=
 =?utf-8?B?a28yck4wUTk2WFdEV2NtU3pGR3dISEhDeFc1VnphVHdiN1JFb3lsL2hZYXhr?=
 =?utf-8?B?d21TMlhiMWhtbFRnenAvcm1HZS80UHpEVGkxTC9EOFdLN01jZlFqUThLVTc1?=
 =?utf-8?B?elgwcnkrRXJvMWd0N3VVNTFUVWMvbjY4L1RHeW1UZWNZVXpaZ2JQZXJRNVZP?=
 =?utf-8?B?aGZsQWp3M1NyS0YrVnltbHY1OEFMeElyemxjVjgwQ0xzdkFsajVld1Ztcmw3?=
 =?utf-8?B?bWtZdUp4WHNZTmhTbXZuVWdPSDJFeDJzQkRJYnM5bkpvUzhVbEM0WFpETnFS?=
 =?utf-8?B?SG9xMG4wRElkMUIrNUw3c1RveTkzOEI3Rk0rRzFmekRXNk12Y3JnUzBONlhH?=
 =?utf-8?B?OFhMT3JpOGpIaitaYk9laVdFRWtzQkhQa2lqOGs2UWV0TDhCYU9QK1dQWHpm?=
 =?utf-8?B?dFBUbHA0MWJ2SlZ6RVg0bm5QTGZYVXdBbkRoTUhIUytGaTY5Lys1TnhLTFFx?=
 =?utf-8?B?WXNWbGhQUlRpUVVoaVdrRzFMK1k0OTVGck81cVZPQkl2NXZWVUFtMTZCSkwy?=
 =?utf-8?B?V2FPNHd6OTcwalZVdTJybDRjWDN6S0VySEZZajZHWS9IdEUwamg5NnBWbEt3?=
 =?utf-8?B?ODcvUlNxaXE1Nkl4LytMK1BQQ2pUK09yQXJOSEMvdmFUNFJnckVVd3pJVU9Q?=
 =?utf-8?B?NVZROXNpVCtEb1IxUUhNbktOMkVNY3R2Q1NVNlY4aDZUdFRoMEV0ZFo2Y2JU?=
 =?utf-8?B?Zk1RY1hYTFg2cHRzUEZTM1k5SjRFbmtFRG1vRVduRFlEVVlFS0EzcnpFOFEx?=
 =?utf-8?B?YmFsMTlxM2htMW1kdFAwM3diUFRwekNZbkhOcTFHRCtSaENuUnVMc1U2eDdN?=
 =?utf-8?B?S3ZzRlp6UENjQWFadlB4cUlXSUJreXJoeUxYTTVTYStqT1o2SjRHeDIxWmtN?=
 =?utf-8?B?R1JtRFh3UGhkbnpma1ltSDh6ODM0ZG9rSDk2RXYxUTJFSUVRSTg0aEs2V3hD?=
 =?utf-8?B?NDhDSWltVS9TWHZ1NlMwVGh2dlFFNkVLQ1JHdzNOeVFsQWFsRDVtWTliTWY4?=
 =?utf-8?B?bml4eUNyWWV5UlFSL0FaSjJSamFINFU1SGV5UGxWNS9nMzRaRnJsS0tSVm56?=
 =?utf-8?B?M3JXL21KSnhoVkN4Y0pYQmRjdm1IWUpmNlZHUzBVTU1jdmgxTWxOMkkzdFhs?=
 =?utf-8?B?T2J3bW1uMEhKS1NXTVFuVDkxUi9rWVh5RlowT1g1TkVWalFRM0ZwMW01My9P?=
 =?utf-8?B?d1h5bmZqMzdsL0ZwNE9UOWd0TE9oaEg5QXZJYW85WURXcGpNa29ZQnZ4ME94?=
 =?utf-8?B?ZllhOU54VkdzSERscHVpNCtXSHVIKzk2QVhhZ1NrRkJQb0VoNmJETjl4Sm90?=
 =?utf-8?B?Y2Q3bzZJQ2pybG5XVCtNMGlXMld6NjdCUFkxSEYrdzNIR3cwM2hJVUhtd2tU?=
 =?utf-8?B?OGVBSDZUR0lCYm9JQnlRZ1pjRTd1Y3Yrbmw0VVI4bTJmMUJFMWpPQlgzRVUx?=
 =?utf-8?B?ZTVxZ0QycFZCWTdSbXdmTitXdDJVNyt3YVJZK1l5YkxZQm1yTU5VdnJOdmpZ?=
 =?utf-8?B?VEQzSGgxcTJXcnR5WjZYWVJQREwvMk9MZ3ZoNlVtUmx6NVo3UnZwRmgzcHpS?=
 =?utf-8?B?K0Uxc1dPcmNYSmUyZ0piTWtSK0tRVzFZbjVTd0dENHF4SElycXBwL0pYbmIy?=
 =?utf-8?B?NDJRWmxqVDRycDlNQlBPeE5DZlozaGhXOFlwY084QmZXUEptdHg2c3F5R1JH?=
 =?utf-8?B?d3pqM3ZKaWFLbkFuTm1wZGhCNGZsa1pFQVJUc25LaUswbGJ2L2t4a2pqZi9T?=
 =?utf-8?B?NGNqODc0UnRnYzMzVUZpaW51QTVGR25SeXhHbC9hU1RHb0xFSTh2K2tFeUk1?=
 =?utf-8?B?NmFPUHRWUWZCRDRSamFuK1R4cmZQVVdvRzdwL0JnSmpQWkx1TUpmR2dLSFRu?=
 =?utf-8?B?V21EQmJXSDJSQWxzVzh2MHBPcWhjcHVjSDVFeXJFVTVFOFZrTWd3dFMvUS9F?=
 =?utf-8?B?WG80aURuemRnUi93SVRiYUFTM0RnVXdXOGlGc2ZYMnR6amJGM3JPQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb4f8e1-31cb-421c-b074-08df1d56da05
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:51:37.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3q8sEeG1yTicTsq19iNjaDuvwNTHQ0CPQ/lFqs4GvB30Col4KojkMinUzd9gnwQVSshSfpkQwJIunzta5aeNuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8641

Applied to pin-init-next, with R-b tag provided by Benno in person.

95593ed36161 rust: pin-init: internal: improve diagnostics robustness again=
st panicking
 rust/pin-init/internal/src/diagnostics.rs | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

73c1f157907c rust: pin-init: internal: make `DiagCtxt` available inside par=
ser
 rust/pin-init/internal/src/diagnostics.rs | 84 +++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++-------------------
 rust/pin-init/internal/src/init.rs        | 41 ++++++++++++++-------------=
--------------
 rust/pin-init/internal/src/lib.rs         | 32 +++++++++++++++++----------=
-----
 3 files changed, 96 insertions(+), 61 deletions(-)
[ Reflow the long diagnostics message that exceeds 100 columns. ]

01c3d218e8fa rust: pin-init: internal: handle item and expr diagnostics dif=
ferently
 rust/pin-init/internal/src/diagnostics.rs | 55 +++++++++++++++++++++++++++=
++++++++++++++++++++--------
 rust/pin-init/internal/src/lib.rs         | 12 ++++++------
 2 files changed, 53 insertions(+), 14 deletions(-)

Best,
Gary
