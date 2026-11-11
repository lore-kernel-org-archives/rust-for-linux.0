Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794406154;
	b=MR06Or5LMTzfcQXDnVTIlUYHCWqJq8GNtPga0xFcjVlvGRZk2RQg5iv03ix9bNpNy8HG
	 +QAOK3BwwpiAH7ba3mi1HqF6RtP9nnodEZeXoYzh+PF0R9VrFUrSZudIcUqUsHzaYEuYj
	 CGbSNxRtMY06dHv8qkEcwRdufwDcnaDOTqciM1aZvdrO7KQ7/OmYZeeqQQlCL4RcDGqio
	 gMJawzCeQujIrq13J3DlR+LnFn1/zJyAOByIfneOOYLxg0aJlVgJjLNvsbBTo1glTyesz
	 IV1rrE/fS37WDU1cutQkThSzB6a+swxN8vJ3UEXkNEi9oW6xptnOPdYx54yDjCbJ7Hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406154;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=WqOAVYnIFcF9um/myGofBSNbiC2EPR1FHVsr6EGrpUY=;
	b=z2VUHsVuA+o3iaiSH5sk2Totr8h74y3or5Sxp2qp+T+6/KZOpoOM43aLiMjCt0VsRwJ3
	 ED6GRgRxOUzh29TAThlAccFidF0aUdsB1Y+smBfX9RWdCDe5SF53NnJz+dC2iFkGgbtje
	 lFGXMMYwPf9ag52UThHU3r0LoR/r0JNErUBuXDJqohbkGUHTfPpRrgpeM0y6FORVgEvUW
	 HhCrRYSr3wgogULPlHXqXtuNMGytpYJHlkUqC8cWZvxdG7niNIRzQacSoqN6tEQyXSXNB
	 olVOZkpEjPowAk8kwLbDifKFXVkXzuznNawCe/CXVvYcXsfCr203OHyRWXI7ygpHJmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=JQGiqu9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.143
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021143.outbound.protection.outlook.com [52.101.100.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C13606A324
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 14:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C13606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=JQGiqu9I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lr/LH4JKRFG/SmT7WSbu9hOhJbqtliEF38bqkWfAojEvLMUAu1ukUe6tCZkRJXno7JemzzLfikOUA2JtMDyM7Q+mnf8OxpKkxtriygdys+uQaeoEonoDeBxabHskCOwDjROWn2+8+aMGg23MkG9Oc//eOms0oMFl2k4gdbFuGRMZoZrOmUPPL3VAn1xrIwr214LcVudtA+lGE4+icUzkbdiOLdBlSjanDw6JAY5eltWHwj0pKNsfr1OHhf/9MPHVMULjBHsHYfGcJywNtjFvyyX4e8oHpcpUvzHvRMZD2w+P3o+1OUWb8kVSz2iNiEn7Eq0QETPJZxcZZsQUzYYIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqOAVYnIFcF9um/myGofBSNbiC2EPR1FHVsr6EGrpUY=;
 b=RhoU2tXwZNb27TOTv6kl6RRVg5hOabG+r1ZZhHxHNc1bB+SHel1t7Cdv837BL+yuxXlfoBWxbpKYPBbSWUcDeNi7l0Y5dgzNlZGCJI86Mb5CgDGd0Rn0v9LroqFvcqLnknPURoaJhFHssN5CBzTjNTBuSOP3LT6LUtGbk48MQ1b4Eqr+lJfgfUlqgd4pQQ34Pu6S5Jq6WEFJzOrpbx1qIXlufPzOjyqNjunqMWsqnBqBjeOIhpLA6vEtMbbmIxbrbI1fwP1YcotFKRNV+8MK4pdF8y9lPSOxrBpS8wmm3VlhaRvb1wViW+hEmMYT6vZfPZk4kKth3SjQCNgLO5YyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqOAVYnIFcF9um/myGofBSNbiC2EPR1FHVsr6EGrpUY=;
 b=JQGiqu9IyTVST2Lub8+rU8a7OCgEOKQoF/KC1KOgQO4tqJYVWg1FK6leK+xrwwOwVymjNY4pbydokVk2oYo4I11Dnv4llqyrwbnqEeyr0N1OMvfT2G34qCZfPhdOduXBnQW5VEEbA+UTph6dtXSHZkz4D8/NIagV1vvf9uas4B4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWXP265MB3701.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:105::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 14:09:10 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 14:09:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 14:09:09 +0000
Message-Id: <DMSFW4SCHFGN.2551XSD4E2Q69@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC] klint: generate FFI preempt_count data from C LLVM IR
From: "Gary Guo" <gary@garyguo.net>
To: "Punnay Sharma" <punnaysharma805@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <CANw-i3nzboD-O6aKcLqtgCiY7quV2NbmzgO7wMbUKmETti1sEg@mail.gmail.com>
In-Reply-To: <CANw-i3nzboD-O6aKcLqtgCiY7quV2NbmzgO7wMbUKmETti1sEg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0341.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::22) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWXP265MB3701:EE_
X-MS-Office365-Filtering-Correlation-Id: 671138c7-799e-44f2-b319-08df3ffd5b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10070799003|3023799007|10067099003|261026121527099003|261026140227099003|261102123227099003|261021123027099003|261021121427099003|261028144727099003|261022075727099003|261022105027099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OBDG+MVN3/GmsUc7pDlVTCsET+enylejsZkDXtSYV5MaOjnGlhRLZt6j8bs5QAvk9e0O82uXJ9mk07UhWO7BH6Ycz7WyoWviY3CdfUYcJRhJbmNkLOnKSWoZJECm+k9qmNPV6YeGK3LFVgECtawSSSQJjgDpvBRw1fjxTxLfqxQ9GtFpVv2tLjLntkN+Gww+DQeYPA5MNgu6dDPHKqY1xc+1dKQUBIathLVFUDAPJxDysPStoAx3/+7Y3kh2izpQm0LU/wk7qB//IHg9PDqUT8qBUgxG/q72v7kgKi7p2mtqCV924A5Ttl3T8LALNwPoTYYCwjvNZhICJ2fW0NOVOGxVLpMe+op7nOFRbdNigK6J7sQtHLOAE1nO56HIW7+JmqRLijheSYS3wHrjSf2cOpVjSDJaj27Q4fbiD/lU6FS+TIy33+qDHRN/mYIz2kKLB9VbK1OA1jpkRsIc3nSPXbKoa3x6YFH8Ua9v38wQkb9WD9dTnpLmXcFMgsUd2NoWoWgLqmubOYhpyddhmdF0O6SHBl0DsfDwE7T9iJcqeDLHT3DdcMpajmg98BrxMoi7ihq3ELMYxwlSvfINHt1I82jVz/iwDG5ZKlHNp6tvsqvZubgZoFDXauIRRPWM5AsR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10070799003)(3023799007)(10067099003)(261026121527099003)(261026140227099003)(261102123227099003)(261021123027099003)(261021121427099003)(261028144727099003)(261022075727099003)(261022105027099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTVNZHYrZVFteHpRV1oyYVFRcmxUWTVMZldnT3ZOU2htY3FjQTV6WklCZTVF?=
 =?utf-8?B?VDNlZno5T3BrRnBVajNnY21XdXVEYlZ2NHhFSk1ZWVBsWXQ0dEg0c1BWWCtD?=
 =?utf-8?B?Tk05OWhGQnRKM2Y5OHZ5VGNOQTlGREgycTV4enVlaGZZUmFuZTZ4WWw5M0dP?=
 =?utf-8?B?eEZxVnU3c2lUWmxpY3lnejkrRFNJV3IxRUhUSmRIOEJ0T1M1RndYNStmY1kz?=
 =?utf-8?B?VGV1NlNzeThiOUR1eHMxVGpXQ1hJUHBWeUd1UTlDWFNzdnNRVFJXR2Ntd3dn?=
 =?utf-8?B?VE94YTFFQkszcktTR1B5UEpBQ2VNWDhBMmk4eGJTMy90Y2c4RnN4Sm9OWklv?=
 =?utf-8?B?WU1mc3RnK2I5cGJ6UVlEUG9zVUhrcUtONmhkOExaUFZEZHRhMlBnTG42MEpa?=
 =?utf-8?B?MFZWZHpGODlYRFlrODJKd2xUcThOOE50eW1tU1JnSksycXZ2eFEvd2E0cFVN?=
 =?utf-8?B?bCtHUzlzUjhJL3RJWFJ6d3RpSy9ZU2hlRnFnV2dPMVB0RmxZT2ZHOFZPdWxq?=
 =?utf-8?B?YVhzNG8wMFdwbnJSRDdud09KaHIrTk9EYkFjVi96Skg1VmwyNDNGaVBSQ29a?=
 =?utf-8?B?d0IwM0M2SjhUVlNHczFjMDZlSXVsTkhqVGRqSzFRc3JRTjY1NnIwSGFtZ1dI?=
 =?utf-8?B?U0hzcExwajNyM1k2UVIvUVRPd0IrMCtvSWcxOUZzNzl0MmhwNGF6bk9pOUZL?=
 =?utf-8?B?eEsxL09JNnZzbUVVMEVkTlY4V2VZZHhWRTBJN3BYampYTnZ6ZGVVZ2VENzds?=
 =?utf-8?B?aUI0bjVreEZjMnlJSTJKTDRta3dsYW5kRnN0UmZ1QUhaZVNiZmU5TjlxNG1t?=
 =?utf-8?B?QzcwOGkrdjl1dXlEcjZ6TXgvSlM5NzNxWElrTHNCeUlZTGxIblVPdFRrRktD?=
 =?utf-8?B?Q2wyRGdQZEZhYmowZzBVV2JVQnU4KzN1SWxXczFDa0Q5cFlSQnB1Z3V3Zkg1?=
 =?utf-8?B?NFNxK3B4SUN3YmVGNmp2NmF4cWxGV1FRU3VsbEJLYlJyeHVOcE9nRm5vQVEr?=
 =?utf-8?B?d1FnT3k5OVJEMUpGZWx5Y0U1TTU0dDhGaFdoREYrSXY0WWViUGYvdVlQd2Jk?=
 =?utf-8?B?SW9SdXNkOGcxbTcxWEp2dXk2UC8zcThYa1g1VG8zYnh4SnNwQUM4eGw1VWdz?=
 =?utf-8?B?eWUvRXZLRThzVnVJOXhpOGNQdU13YWM1dkNDRjBISjIrekhJN05qODRvMTlO?=
 =?utf-8?B?K1pTK0J5NWtQL01BbGlGNU1JdHdhYjc2MGh5VWcxU3RsVm1WZmlnREJyUkpw?=
 =?utf-8?B?aTJzcXgrTDZwUEpzOXVDdTErMElBWmpGaGI5a3diZ1d2N1U0NVBLY0dmMitF?=
 =?utf-8?B?dHBTYU9TR3p1MElYczl3N2J0ancyM2ZjRVhvUGZFN3ZINVFqMk45MlYvRFBv?=
 =?utf-8?B?RGRqZWpvZG12RDIzbGNxNXZoZGhTRkZSS1VlZHlYN1d4WnA5dTQzMGt6cDk0?=
 =?utf-8?B?dGtjQ0F3OG00cTNib2VrVk5GOVMvUEVmOHNTc3FxbnlzM0gzUmJKem1VQjBH?=
 =?utf-8?B?WUNpUldMQzdGTDVPRzA2c2lUbkltRWtIV1ZQbmcyZXU3SHZJZlQ3ZXhSclVN?=
 =?utf-8?B?MVhyenhvbUhLbmNxbmZTSk1aQUhUeUJKRExjMDMzQnJyOUxoM1QrS3dvTXkx?=
 =?utf-8?B?ekhJRlVyQm1SZFUwUmgyNWtpbmgwL1V0RWFBUEh2THprNndMMHV1T3RSRlhP?=
 =?utf-8?B?ZFFVcWNYZFRoUmdaKzVLZldlcU5vc0w1bG94Ui9QZ0dTc2pPZ3plem04U2pF?=
 =?utf-8?B?em12NFk1clFvbXdhVVpiSVYydmV3YnFDTlRRVmdqYzhHbFc0b2szM2plZU9D?=
 =?utf-8?B?WEFnV0dDVTh2alZIbEp6bzNERHBEV2M5M2g3N2tVcjM0SVN6R2JOd01OcnZ5?=
 =?utf-8?B?KzJXQy85eWNtOU1kWE1udVFpdGdSU1Z1VFM1L0IxNW1CMWlZYzI3dnpNWCt5?=
 =?utf-8?B?d3ZoendWUGdIOW5QSlVtOHBDNms5RHVjMnZnaTMzSkZyRkMxQ2tQV1djMm5C?=
 =?utf-8?B?R2NpR2trQkkzZ3ByQXJzN3h2SWc0SjBza29NeDVaVU41Z1dPd1lyUVNLdHZG?=
 =?utf-8?B?bGxaL0hlZW1tYk9VTUNTM1lBSitrSmV0R2VKM3o1VmEzWDBxbEZOLzdxZXZX?=
 =?utf-8?B?Y2E5dWF5ZUlueW96MkROQVMzK3ovYk54WjduQzkxMXhkN3UyQjlQTTRpd2Zu?=
 =?utf-8?B?Ni9OaTR5bUhlalZqSWNDTUd4VkNwUDBpSmx4aE1USGFyMWZwUmJINWQ1M3RC?=
 =?utf-8?B?RFZLRE4zYngyK2RMZmtYcU1ldFgzT08yRGZabUx5czh6MXVHYnpMMTJMMFpS?=
 =?utf-8?B?TFBzTkVLL0pxbkc1a2Jyb20yM1dVd2JhdkVGaFZsWkxZU0Y0bUZFZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 671138c7-799e-44f2-b319-08df3ffd5b2d
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:09:10.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i0Y9Xle3i1XSLAMHLog9kC47R4wuGgHI96wt9m2BJ5rquHEgnKXx69hH6qfuLjd1nwGMaJgn0HX3FFa8zDyEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3701

On Wed Nov 11, 2026 at 1:52 PM GMT, Punnay Sharma wrote:
> Hi Gary,
>
> I want to write a tool that makes the FFI data for the klint
> atomic_context lint. Before I start, I want your comments on the
> design and on the output format.
>
> Current state:
> I read ffi_property() in src/atomic_context.rs at commit
> 898b14f358fa. The table is a manual list of approximately 230 C
> symbols. An unlisted symbol gets FFI_USE_DEFAULT (adjust 0,
> expect 0). A call to an unlisted symbol in atomic context therefore
> gives a warning. krealloc() is MIGHT_SLEEP for all GFP flags.
> In your January RFC, the atomic_context lint is not enabled [1].
>
> Design I propose:
> 1. Input: an LLVM=3D1 build, a known .config, and
>    CONFIG_DEBUG_ATOMIC_SLEEP=3Dy.
> 2. Extraction: a Clang pass plugin, loaded with
>    KCFLAGS=3D-fpass-plugin=3D. The plugin runs at the pipeline start,
>    before the inliner. After inlining, preempt_disable() and
>    local_irq_disable() are inline asm on x86. Name-based seeds
>    then do not work. The plugin writes one facts file for each
>    object file.

This is too much LLM speak that I can't comprehend. Name-based seeds? what?

> 3. Solver (Rust): a whole-kernel call graph and a fixpoint for each
>    SCC. For each function, the solver records:
>    - the deltas for preempt, softirq, hardirq-disable and RCU
>      nesting
>    - may_sleep: Never, Always, Cond(param, mask) or Unknown
>    - an expect range, with the same semantics as klint
>    - the shortest call chain to a sleep primitive

Klint is specifically designed so it doesn't need the whole call graph. It =
is
designed to operate as part of normal compilation so it should operate on a
per-crate basis only.

> 4. Cond(param, mask) comes from might_alloc(). There,
>    __might_sleep() is control-dependent on
>    (gfp & __GFP_DIRECT_RECLAIM) [2].

One thing that I have in plan for a while is to allow it to be dependent on=
 enum
variants, so `Option<rcu::Guard>` as argument could work.

> 5. Indirect calls go into a separate list. The solver does not
>    merge them into may_sleep.
> 6. Output: a JSON database, the klint data, and a diff between two
>    git revisions.
> 7. Evaluation: fix commits for "sleeping function called from
>    invalid context", Smatch, and DSAC [3].
>
> Questions
>
> 1. Is FFI_USE_DEFAULT (adjust 0, expect 0) the long-term model for
>    unlisted C symbols?

It's a safer assumption that a function that is not known might sleep (i.e.
klint prefers to generate false-positive over false-negatives in this case)=
. Of
course, this can be changed.

> 2. Which part of the current false positives comes from the FFI
>    table? Which part comes from the MIR analysis?

Mostly latter, due to klint's inability to analyze `Option<rcu::Guard>`, ho=
wever
improvement on this front is being worked on.

> 3. Which format do you want in place of the match in
>    ffi_property()?
>    (a) A data file that klint reads, with the symbol name as the key.
>    (b) Generated Rust source for ffi_property().
>    (c) Other.

Any form is okay. The best approach is probably to have the annotations rea=
dily
available inside bindings_generated.rs, but that's somewhat unrealistic.

> 4. Do you want conditional properties? There are two cases:
>    (a) Flag-dependent: krealloc() with GFP_ATOMIC. For this, klint
>        must read the constant argument in MIR.
>    (b) Return-dependent: the adjust of spin_trylock().
> 5. Is data for the reverse direction useful? This is the context in
>    which C calls a function pointer field, for example an hrtimer
>    callback in Rust.

Could be, although in such cases I'd expect annotations to be placed on Rus=
t
code instead.

> 6. Does another person work on this now? I do not want to do the
>    same work two times.

No one is working on the FFI list, but I have a few prototypes about
data-dependent analysis.

Best,
Gary

>
> If the answer to question 2 is "few", I will make the JSON and diff
> output first. The klint output will then come second.
>
> Thanks,
> Punnay Sharma
>
> [1] https://lore.kernel.org/r/20260127172330.1492107-1-gary@kernel.org/
> [2] include/linux/sched/mm.h, might_alloc()
> [3] J.-J. Bai, J. Lawall, S.-M. Hu, "Effective Detection of
>     Sleep-in-Atomic-Context Bugs in the Linux Kernel", ACM TOCS,
>     2020. https://doi.org/10.1145/3381990


