Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020086.outbound.protection.outlook.com [52.101.195.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F33311968;
	Tue,  5 May 2026 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988955; cv=fail; b=jPBOM7IIsQGJQ3LnUXzxx5Ml9xptItzoaOLyA7+X1AvE/qwCo3LnvxSs+Dd5uoDSm3dHv4nPYRdBT/laJdSsiC9cE/DVxjOLTkFqrEzIwyfov1ek8v8Itj+4uhmpbQmMccOH0vXaeyV9ZdEYjJJSUPzoXY67xarmvDQZm3eLzfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988955; c=relaxed/simple;
	bh=IZPd+S6DIZAHOyMqXnw4RbD7doyn/jQda/vQrQFjeGM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=id8/Je48LvS8sYx3SW0lQPJN4iHuh9576q2NukEmUCVsOBvNK0jsH6KLSlQZIOlrRCjfnePtaDfxu5ot2cuKDm9QnLJlm8CacuxDq0atYqJnsYWcnVrmQD3gBsPe1MPUktJdkZFJamx9BiWmw+yL1aI3wzPqX+szo/QFQKVVR7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=KeoDxjZ9; arc=fail smtp.client-ip=52.101.195.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="KeoDxjZ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqjLPtM3waBpUyPHmFOUgGgzdm/25AomrYcPD/urRtohL7lKmi5m8luF3EOSEK3fg9h0xsJCVEGqtof4DBFN6JjN125N7nPukk2t/UxCVg/k03d5Gx48uLXM9Jj9Hf0E+MVAMyB728st0a7NHaxYcGU383QdSfG/cK2oqsL9+EFAedoIpxJVWzHyHGdKphfq2yKg2aKn2hrtR/Z2lasxhYyoYjA1a5RnLtWUBV40IbBjY29DWbPRd20ojA6i8DfXbC0yXiZHeP/xKfaEgCdCcjzKJ7wkjcwN917WbKfptRjy18fqGrm7b81YvlPLQ1cY7bjNEPiDGKhWuTjvCKwe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pixQ/5VVB+ugWS0Ils63Ehxzzu+CSj71KaAD8lHtZ7s=;
 b=hkgx19+FWdZOhpQi0Z9+QlvHw+A0RvKObEtSVs34WvD4ulIGSFL8otl0f0abKfXuAoNA/io0WKhCo/bwsvDyO/O0x8Yu0qNhjSGxPHWHuwHzpZOFPGe4wdWBPGZ3kjxGSNnbyXMcrXrdyjX8XgjI/I2S6K7xDt4UfQvt/xDbSvQau5rPxoppzGW2+9N6XIVTumiwz/46bYr8t/evB5eB9IIz2QQzTvyraLcYkR1/0cNo7pAp47p2ZRliPsBc1WeG1hEnB8+xFgllbk9L6qi/zh/9oP0B+YwzfhYi2w+qpv7D4oSoq5feHS2t/0K9UVyz/Pobs3o3/ATiDnGy2Zouzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pixQ/5VVB+ugWS0Ils63Ehxzzu+CSj71KaAD8lHtZ7s=;
 b=KeoDxjZ9N/g0qO9KyoNYK4uBuszaC87LsxU3B4ycF7nQVXRhRGWiHDjUieYIkX6xdfI3TvvKVbC+qm0QM4thENtZpCi0yPvFsXt9w7nUoXBUsqNrVhjpdR1aDTw+/6PHRZhioNX6on74kygw+JgP9h4fsGrDZ9YrviUv6mq/ZO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1978.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:103::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 13:49:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 13:49:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 14:49:09 +0100
Message-Id: <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Trevor Gross"
 <tmgross@umich.edu>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init
 maintainer's profile entry
From: "Gary Guo" <gary@garyguo.net>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Benno Lossin"
 <lossin@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Linux Doc Mailing
 List" <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
 <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
In-Reply-To: <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
X-ClientProxiedBy: LO0P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1978:EE_
X-MS-Office365-Filtering-Correlation-Id: bc43ee68-938c-4903-63a9-08deaaad1562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0/IZWKhbcswt9Ze3CXv0X44RcOQfIlO0+0Tc+Cf8UlfR9ZrVqBHv5VdDfS/XVHyPoAHKdMMAIUdAKxzeGtmdhbpDfSoxR62pYaXbjqSgn1oJSvQ57T8Jvto4PogbZ/hwgApOy2quAgNpPZLfD/rxddHxYUXW4pTo9mMwP6fwmZL5zYZx4PfN/K/ZMddY8ELJDE6tVvxE+MjIz9uXJ5MqyXcmpIe0FBKvXdLxORuUAzh/Hyh/hA5UESD/3gUHo/r4/d2Mv4m8bctBIxnyUIen/v7remFZ+BEVTadWK7xvD/qWratVsbBjZN/EeXa26J/bmRtSgVk1NT3L+7KQcAAkiEuOGV0rMBEHZzPVcvsUPVDoFHKlSaU0SbDD7Z47KAhES0xjjs5f8+2IJuqOMTffurkzdRuUYzXZ3yMzZ3rwwoq/fhI6lPzsEB2zJjkzRLmmlPfXCK4HO/ea8Hf9oEK+spytRpSp1DHFO78kEDUDrb3iY9zm+bL3085koPhPdwaqd16gYpVeJQyxZknDtp3dAbQOPyvzcCyN4JcWDESSZgmkZ/2/x7f2uEuKT1f4GepK08dXeeImV4T8yvARV5gcB6XT31iDJRyR3xJxgCgpjlDtzdrU7qmH7KZiKgt8GP1k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFphRVhRYTAybEozVHR5a0ZFWENVOFMrRnRObDY1R3plYjhWYVlSS0hLQk5a?=
 =?utf-8?B?M0p2aFVrSng3V0l4RUhpSVFONHFLcitMWkdFNWxIU0RPbG1qRXNnTUtudmxG?=
 =?utf-8?B?S0RHUkg5aDNQTFZJVlN2d01PWDBFUnZkOXE1UmNMSHJtbGF5b2puMWdmSlNT?=
 =?utf-8?B?Z1B5ODNBREt2YXA2S0JwYlBqVDR2MVdHRDh6dnR6cG1FQ2EvVmtJN042K200?=
 =?utf-8?B?a0EwN1RWM2dVMFkyZjA3TjJwblR1VXF4bkljOVgvd3p6bHFuU2dqOW5nYW1C?=
 =?utf-8?B?U2xzQ1RoUVlId2RCK3ZhOUREclkvTjVNYUYvTzM1ZVVWNTc2dFJ0c2NsaUs0?=
 =?utf-8?B?UzBlZWtKK1ZHNlQ1alZYbVNiZmxPUm10aXVzWnNyOFpLVHluanJsaXNYUjFa?=
 =?utf-8?B?Yk1PMFg1N2laZzFiallTMHRhS25obElPQnZuRWlMQUlPdXl0OHp5L1RURnpt?=
 =?utf-8?B?YXFYWlA0VTBiZnJTaFpaWTN3YStDMWwyMEFTZ21pOTN4TCs2MitVbmxQODlx?=
 =?utf-8?B?SUpKemxITXkrZ3RyVjgxMUFEOFRBSTN3S0Q1b2owY0M1cGdxVXVIYjYwMUN0?=
 =?utf-8?B?NWxjM3Ewb3pmYlAyekZhR2NKN2xrWWloRmU1a2lvdkVrcmh2MHM3dVRoQlE3?=
 =?utf-8?B?R3F1YlR0bTgwWVIrdC9uamtUN1kxaXN4aWxWWFJmMlhXeVR3eG5MM0xSVkYz?=
 =?utf-8?B?S0Vid29lZWF2UzJpbnF3dmRmTlN6dWwxMHVOb0ZVcWhIdDFnTXIxTWF5R3Nz?=
 =?utf-8?B?d1JSMlhIalJSbGQyc0tLRXhhcUhaQ2YyWk1Ld1JsMkl3dFBTakFHbDFvbFpT?=
 =?utf-8?B?RFp4QVhIVVl5Q1lObHlZRGk5OXBsOTIyaWwwM3pjUlZpd3hJQkk3MytnL3lt?=
 =?utf-8?B?WmZSM3kxdHRsYkJNRVdYMTM3dnc0cFNia1dCR3I0OFZiR0l5bmpjU2diV25z?=
 =?utf-8?B?SG0yc1A0aDJLQUM2d3gyNkxNSUtjRjlUN2ZmUHE2RTh2NGRHRG40OXM1L2xM?=
 =?utf-8?B?QU1BMkpCUFNVTWpoNmlnVGpvVUxuS2tma00rZStWZSsyZGlUN0FmS04wTmVH?=
 =?utf-8?B?ZStMVWZRK1hVUmpNbFBOVWZRamFrb2lhYThFd0dzM3ZmRXJYWk1RZ1JRREhK?=
 =?utf-8?B?OXczMWk2TGpaRVZ4WEN4akFjYTVWZzc2T3FVL0VUUXpwNXA2emFqRHdoQVh5?=
 =?utf-8?B?RTBNN081RUsrMXI4QVNaUTljUzRrSk5rTnBtZmUxa1dHcnNGK0NMcUJxTVhV?=
 =?utf-8?B?MWJ5NVdQcTN6NnUrK204QWVvbTZCc2VmcUVIUFQ1a2FkS3Vya1J0Wk51SjVM?=
 =?utf-8?B?VVlCN1dzVUpTK2R6a21MTVVPTUdjWnJLUithOWcvbzhYY0t4dFc2NGxZM1V1?=
 =?utf-8?B?a1VhdWg3bnVLYlJmdHIyd1NjS0FEd05YenVELzZYdC9UM1c0cGJ1ODQxZmh1?=
 =?utf-8?B?ajhCbC9Ic3dQRDB1VVl5S0t1L2xPNjNKckZhNTNZc3B4Y09YOEc1Z1FUWGxq?=
 =?utf-8?B?OVp3c0kxK2dXdVQyRmZyQzhoWldDR0xnRW0vUmloVGxkcWZvNW9ueWZ1aWZX?=
 =?utf-8?B?RHA1aGlpcFpsanVzeGZIQkRGTHd2ZEhtN0Fqa3VMU2RWK01zN2dQTENzYklo?=
 =?utf-8?B?YlZjczhoQVVQWGlMclFkNFhkVEIxemJnWGlSalJnbTdWWnV1amdNeWphem1u?=
 =?utf-8?B?SWUwa3c4bkR6dEJlWk90WTBxTEx3dGMrN1BJakcvTFpMWHUzbFdUNmorK2ls?=
 =?utf-8?B?ek5NdlhTak5hTEN4eGZicXc2bEsyOHUxbDhFcmJhcWt4L25ORDIxbFZLK2tV?=
 =?utf-8?B?amw1RUtqRmxBTHdUcmxiV2w2UFhKT3RMaFVLMXgyN2t2TG1VTnB4cGhqeFlh?=
 =?utf-8?B?bEoxNDdYQXprL2lFM1c5cGtBSCs5N1ZMRW10QlRRSU9seXB3TDlHQkdXZzZn?=
 =?utf-8?B?ZEEwQllxTGZKZWRKZE1VQVZlQ0R0Y01oK01ZNVplaDdqNndiTWN6azZiMSt6?=
 =?utf-8?B?VCtPM3ZuNlZXblhZb2YxQTBZVmJ3VEl4N1R4eTRLY3NjSHJHNEQ2Mld1QTJN?=
 =?utf-8?B?c0FZVmpFbkxtbkFHNXBHRUpHMzgwMWZlZnpSYk9jMlA2aTZmMWRPdHdTbFM5?=
 =?utf-8?B?L0tTV09QWDU5c0tacThha3JLb1pMYW4ydDhIVkd0VXdtTVo3STdmSEZvdFIx?=
 =?utf-8?B?WVJNM3lUSC85UzIzOVVVWE56MTFWUkNqTjlxclV0SmtpT0R6SnhwRzVBYVUw?=
 =?utf-8?B?WE5NSGlNZEpEV296OVd5Q0lQNEg5bldNYkc3cmtaRmtyaG01Z0tlTTFpUmtL?=
 =?utf-8?B?MFFOenkrZ3pGVjM4MTB0RE12ZzFReWYzdWJHZk9vd21ycXhQcmVGdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bc43ee68-938c-4903-63a9-08deaaad1562
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 13:49:10.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kl/1tE/ef6aIOsGOatJsyMmRchyW22nCqnBfDP4YC6Q/1ci9dX2KMi8IkUkBDTXD/HfePHsuHUXzLiTHaDxDHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1978

On Tue May 5, 2026 at 2:25 PM BST, Mauro Carvalho Chehab wrote:
> This maintainer's entry is not inside documentation nor is
> ReST, preventing Sphinx to create a hyperlink to it.
>
> Change it to point to the already-formatted URL.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS                   |  2 +-
>  rust/pin-init/CONTRIBUTING.md | 72 -----------------------------------
>  2 files changed, 1 insertion(+), 73 deletions(-)
>  delete mode 100644 rust/pin-init/CONTRIBUTING.md
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8700472b3ae3..b16c8f85d099 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23402,7 +23402,7 @@ S:	Maintained
>  W:	https://rust-for-linux.com/pin-init
>  B:	https://github.com/Rust-for-Linux/pin-init/issues
>  C:	zulip://rust-for-linux.zulipchat.com
> -P:	rust/pin-init/CONTRIBUTING.md
> +P:	https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md
>  T:	git https://github.com/Rust-for-Linux/linux.git pin-init-next
>  F:	rust/kernel/init.rs
>  F:	rust/pin-init/
> diff --git a/rust/pin-init/CONTRIBUTING.md b/rust/pin-init/CONTRIBUTING.m=
d
> deleted file mode 100644
> index 16c899a7ae0b..000000000000
> --- a/rust/pin-init/CONTRIBUTING.md
> +++ /dev/null

This file is part of the bidirectional source sync.

I think this file is still meaningful in its present location even if not
rendered, so people touching the code would be able to see it and be aware.=
 The
presence of file is more visible than a P entry in the MAINTAINERS file.

That said, if Miguel and/or Benno think it's fine to not have this file, I'=
m
also okay with it being removed.

Best,
Gary

> @@ -1,72 +0,0 @@
> -# Contributing to `pin-init`
> -
> -Thanks for showing interest in contributing to `pin-init`! This document=
 outlines the guidelines for
> -contributing to `pin-init`.
> -
> -All contributions are double-licensed under Apache 2.0 and MIT. You can =
find the respective licenses
> -in the `LICENSE-APACHE` and `LICENSE-MIT` files.
> -
> -## Non-Code Contributions
> -
> -### Bug Reports
> -
> -For any type of bug report, please submit an issue using the bug report =
issue template.
> -
> -If the issue is a soundness issue, please privately report it as a secur=
ity vulnerability via the
> -GitHub web interface.
> -
> -### Feature Requests
> -
> -If you have any feature requests, please submit an issue using the featu=
re request issue template.
> -compare
> -### Questions and Getting Help
> -
> -You can ask questions in the Discussions page of the GitHub repository. =
If you're encountering
> -problems or just have questions related to `pin-init` in the Linux kerne=
l, you can also ask your
> -questions in the [Rust-for-Linux Zulip](https://rust-for-linux.zulipchat=
.com/) or see
> -<https://rust-for-linux.com/contact>.
> -
> -## Contributing Code
> -
> -### Linux Kernel
> -
> -`pin-init` is used by the Linux kernel and all commits are synchronized =
to it. For this reason, the
> -same requirements for commits apply to `pin-init`. See [the kernel's doc=
umentation] for details. The
> -rest of this document will also cover some of the rules listed there and=
 additional ones.
> -
> -[the kernel's documentation]: https://docs.kernel.org/process/submitting=
-patches.html
> -
> -Contributions to `pin-init` ideally go through the [GitHub repository], =
because that repository runs
> -a CI with lots of tests not present in the kernel. However, patches are =
also accepted (though not
> -preferred). Do note that there are some files that are only present in t=
he GitHub repository such as
> -tests, licenses and cargo related files. Making changes to them can only=
 happen via GitHub.
> -
> -[GitHub repository]: https://github.com/Rust-for-Linux/pin-init
> -
> -### Commit Style
> -
> -Everything must compile without errors or warnings and all tests must pa=
ss after **every commit**.
> -This is important for bisection and also required by the kernel.
> -
> -Each commit should be a single, logically cohesive change. Of course it'=
s best to keep the changes
> -small and digestible, but logically linked changes should be made in the=
 same commit. For example,
> -when fixing typos, create a single commit that fixes all of them instead=
 of one commit per typo.
> -
> -Commits must have a meaningful commit title. Commits with changes to fil=
es in the `internal`
> -directory should have a title prefixed with `internal:`. The commit mess=
age should explain the
> -change and its rationale. You also have to add your `Signed-off-by` tag,=
 see [Developer's
> -Certificate of Origin]. This has to be done for both mailing list submis=
sions as well as GitHub
> -submissions.
> -
> -[Developer's Certificate of Origin]: https://docs.kernel.org/process/sub=
mitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
> -
> -Any changes made to public APIs must be documented not only in the commi=
t message, but also in the
> -`CHANGELOG.md` file. This is especially important for breaking changes, =
as those warrant a major
> -version bump.
> -
> -If you make changes to the top-level crate documentation, you also need =
to update the `README.md`
> -via `cargo rdme`.
> -
> -Some of these rules can be ignored if the change is done solely to files=
 that are not present in the
> -kernel version of this library. Those files are documented in the `sync-=
kernel.sh` script at the
> -very bottom in the `--exclude` flag given to the `git am` command.

