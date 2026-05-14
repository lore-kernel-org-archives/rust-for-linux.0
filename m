Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020123.outbound.protection.outlook.com [52.101.196.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8F22083;
	Thu, 14 May 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787115; cv=fail; b=CuaRLwTbGK9Pss0aLxRyqDzCpVKkfd+4+uM8jGw2X1lIwVS41PGBa66HRVxh/xHgnh/QU3qXO1bPj58UHhjhvlTxusdkjRIMrEZ/ivicUDh3t8sWCxWSc8eqN9gevJvA4l4q/1Rq2otStplwAxLimGJpgVPcWgX1o5kThfCnOLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787115; c=relaxed/simple;
	bh=kGNcMXwjNBbBocV7wxbFR7esafnyG3G16MjllwQSH04=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mbGesFiUf4hqEAwHKCjK9HzM0lDUy0u4wXUieTIo5fQHZfoHmNfnZwi0PBn7Su5uDdV8Jr/NKYNxWB5rZQ40azcnSCQONnnqQG2w5Sk1ij2W7TvS26pSZpZyz71MLcfPObaBGd2uiYzlw99y645fRCnKQeTVriqZ4RKCRo57S2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CVtkP4hN; arc=fail smtp.client-ip=52.101.196.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CVtkP4hN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ij+HQpNe7OX2GCe3u0ymZUKT28TeEgGuCeLqKG5W3iGkg5bS3RJa0pVTeS6QeoMDwafOjxmloAEjgGiO+UnibL9rD9RHV69bcuRcUyT3ktGv0WiUs90YkcCSGgL0PAtX9AbMxIL/p3jZJoNOTl9HMF34wslSsWJp85URFI3rxy/gZ5c6YFW87do1/IeMnES1AW99z3XkPs5wG2LeCfQXLuA6BcwSyk0L9CaIn63tC35CrdyCUj8tJhUwMs460Q0tw5BpCMH2rAaRAxZVmIvwhOO4Lf2y8hr8ojAY/erX5JhNd59p5oQWxXhZGyXiIjUGdYISpGYaKvu1rjK/P7UEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR5671qpWDTlfq2rC6soDAH7mg7Usg8st0SJS7nj4w8=;
 b=Vr9Cb8v9VPXJ/ELenanpGT5GP0RX/B1vxYHAMD8JbhPuuR1A8zgmrlnsCL3Vk3MzBVpMX3gtjN47nnV+Rytmo2HlXz3AbyHfJ33rjwWoKgEfiAfnPUeAD22wmTTEEFjhyeby3iTLEASiph2dLITYUbZ+XXnu4Hy17nCC3qFpkM4mBUhr6GeY+R7wqGIV+N1P+TlY6KLUWvk+yYkzn9ON7npEty55qFE51M44ygind6exRjxrpvqywVM/GfoQ+yQslPJGkj96O6X3nfQYVyaBJ/ukV7WYOKXCIYY7QqRaakgdurhqX/PxGWdwR2sUq5jVTIY9n/9VeoASO12P2VLirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR5671qpWDTlfq2rC6soDAH7mg7Usg8st0SJS7nj4w8=;
 b=CVtkP4hN3fKLBP92PC/8/rCWgwZ2GW/G+lr+5As8x6YJO9Og5wMPCWWowKkGtkFuTn6ZtALIWT8nAmxyH/YQPWu+/vTgrh8uR7lG+e9WlMJQbVMx2VEzn9xagCn/pw9/7G+DaVSo/md4L8G77MGOgW1g1wXF1ipUSLyucL7DprM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB2122.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 19:31:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 19:31:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 20:31:50 +0100
Message-Id: <DIINELAI1YG8.NXOFWHLEEFYK@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Mohamad Alsadhan" <mo@sdhn.cc>
Subject: Re: (subset) [PATCH 0/8] rust: pin-init: internal refactors
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
In-Reply-To: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
X-ClientProxiedBy: LO4P123CA0694.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB2122:EE_
X-MS-Office365-Filtering-Correlation-Id: 904179ff-cffa-42fe-99b6-08deb1ef7234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LHOGXqZ9uVMbhRGZbOPfiTUNNXLyy4efnRXA3EC+Z5wPtZFhqnfUm2MSXldLnlt2GOIICXItxHfAXbSlc2mgDR0D9md9f3Ur0JkefjiB7EIQsXA9SCnwiecfOe97TQdqwR+lM2wmbozrhZXHxXpPwbpHnv4HFP4uYfTD7KA0OkQoPa9ojwKHHCL3eEsymnSR7AZvCdDwqwaUc6ooA+GmaAojmh34KgnAHSux9Ef2g3R9uc4Al1HDxb7LCbO5pMLGjKTnAxOp2aWBqswHHyXWfSJ2g1uLxGNtTPfw1qRCNiqYxnUO7A2f0bsuGndTY2qlgrgkydmPYnrCVE5qiuwGj0hGUGyV6Ta/JPyetxQyo66jviFuZaCvInPdm2+YfFaxLA/vIBWeUMxtgP+VfaeTz0ACKNjYBXFUM5iPKPt709ZzaGeQyZq9cfn+sapEIs5mF3yAypikjRJbd4K1Lw4cJUNA1PPia5b1JPaf5hOIx8jBvGHvzlaIFBR9bOE3BRT4KN8dxpnnJMkkkvIpNXVhdWgE9edtBN36YMH2AEcaB8VB4rcqH7yrN30fnP40eBmHHuYxqJu7ohnuw1tkO51nSwLxh/R8CmF9oxgjRzMUuS4GU7kUlYVXoNbcrc0PmnFERRXauOSYtxA/+G9rJl8En1jdW6S5nd8vh+KEAYbFyOvHJEPQSbsWzkdqWMYKMbmF3vq5zUacKgbt8THpMWkf7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YndYNk83anMzTVorSitSZUxOREwyZTRqQWh3TVpvY1dGbU40bWpUeXNxQUw1?=
 =?utf-8?B?QnJvdVk4M2Iwd1BHS2NHUDdKSUFBcVRuUHpCV1ZOSk91NzI3MmhOS1dqNXFW?=
 =?utf-8?B?b3JKUjBCZzRwdUEza2srU3dZaHlpZW5hd09yaENMd21FRHNuNURVTmZXakdE?=
 =?utf-8?B?Ri9UOUh2R2dKb3Zhc1d4UUtFTGJPQThJTTJ3Z0txNG5Uby9jNDBjRTYxbmJ6?=
 =?utf-8?B?RFBzZ252bUJrREt4ZGJzdU8xNjhUWTFBYm9VWllwb2hoVkx4dmdoVzhlNi9x?=
 =?utf-8?B?cUFkMjFjM0R1TzBsemtIR3c3L25tZTExRlo0YUFYZzJ2SHlOV2FyeGE4dXJS?=
 =?utf-8?B?bEQyMTZpMkpHYXplbmdodUtPeTd3cjNidUFZTnFpSmJVOHRnWUhBU3lrSlZX?=
 =?utf-8?B?UG05Q0o0Vmk2ampNMm9yNVk5bHFXZ09aRjlHSk9GUWp5OTdtZWhzWk4zb3Bs?=
 =?utf-8?B?S2p5b3d4MW5vQlNYTkdhVHVCSWtOcS9yOVh1ZGRyQWt4RU1WODBmcUswUmEv?=
 =?utf-8?B?cUdza0w4aGN6aEw2SlMxKytPWWd0V0ZkZzdYUWE0cjMzdmI3dHNGaFpMKy85?=
 =?utf-8?B?SmFITUtnWmdlSW43MmNJUGs1bDFteE83OVhZUWRRdzdGcUM3Vk8vS3B5RXcv?=
 =?utf-8?B?djhWc2pVNXhobkswQ1JKYjF2L3Q4NUtTckVQNG9qaTJqNDl1YWt1UkpJMHBI?=
 =?utf-8?B?Vi9ScGR3eSs2QTR4MnVIZ2l3bDk4RHlRRW5nY0pwR2hnWktjTGozOWtVTG8z?=
 =?utf-8?B?K2NBUFIrZU10dy95elEzcWswcjI3bG4yb2lENEtycnRVcVJmZ0RpTzM2R3Q4?=
 =?utf-8?B?YkJnWE05di9nd1l4Z3JaMVNQOHRpTXRRcUFzSGtNTTdJSGo4ZForZTJaZkEx?=
 =?utf-8?B?M0RXSWRiSVYvODI0djMxOU1pUC9TeW1IQk9wa0g1eGdQT1RtQjRMUHYvVU5G?=
 =?utf-8?B?b1dObXA4UGdsWlJMK2haeDQrbFYrSTFod0FVNGdKTHlrRWpObnhtT2Vmc0Jw?=
 =?utf-8?B?TUNySE4wS3pBK0RmSlI5Nm5rRzRTOUE2M2JaZ2dtcXJUME4xSGpQakJkNXJk?=
 =?utf-8?B?a245cUhvWlVXMVFIQUFDNys5OTlFV1owcUlucldTSG93VHEvTGgwK0VqTkJS?=
 =?utf-8?B?eG1TS1lmYTBwdmNMemo0bCtxWUFDcHlZdmdjdUtpV1JNN2ljVEt5MVVWRGtF?=
 =?utf-8?B?RmF3WEFmUjBpdHFzVmFUUHI1bnlQTXkyeGJwNnY2ckRhdlozMEFaTkd3Tzhj?=
 =?utf-8?B?SEJHL1NGZWRTcEdXTGVlRDU1c1JETUpCd01kcmRCY3pLNEZLRGI1a3hjV2VO?=
 =?utf-8?B?VXBYUnhtVEg3aXRzRXlQNk80eXF0NkV6VDJlUWhDMU0vUE8rZGJUelptR3Qz?=
 =?utf-8?B?bVc5NGlEcHNiWTFsZnNBcmFvYnYyVUhNaTEwNjJ6WkpaQ01lc0pPVjU0OW5O?=
 =?utf-8?B?M0s5RXFLWHF6Mmx4cEVBaHRUYnY4eDY2VlEvaU1FeDZIbEZKNDhtbWhtZXBm?=
 =?utf-8?B?akJlTS9lakNEc2hNV3VLRVRCMkhEYmtPWFhUanVUOXY2NWpZQVNuVEtTR3Vi?=
 =?utf-8?B?ZjlIQ2xLUHQwczV0QzBZWXVpdFFqZkw3SWIySStMZHpWZGMyUnNhOWVXZ3hn?=
 =?utf-8?B?MVIvcHhzREltMU9wdVV5YTVhMFNHN004ZElKNEdRdDRJN1NqemYzN2o3OTdv?=
 =?utf-8?B?SG5lVlBHSjljallqOWVzbTI5cmh5Y0JZWHdra2lFY3ZnRXNRR2tUaVV1Y2tj?=
 =?utf-8?B?MURyd0N0R3R6OGoyVFpKS1FVTWFzV3JGTkR5dVpRUkdOWEJoc05qN0NtbVpO?=
 =?utf-8?B?NXp4SEVOOUVLM1dQQlk5Vm5mRTZRSGQ4c1NYM2cweHlpWW51TEZha25oUHFO?=
 =?utf-8?B?YWI1ZFFBUEF1VEpnQ1ZhL0J4bHgydGk0Z3dBWkllSTNmamlxNUJvUVhuenlz?=
 =?utf-8?B?Z2JVSGpXTWtwSUFzT2FON3BuenBaQkpNTmhTUTR6WGJWTGhyVUJXc0gybVh4?=
 =?utf-8?B?bkswdGtDZGs3R2ErNGpOMGpvellxK1luazN3cVVuUGNYZTVWZkZxdTBrOUh5?=
 =?utf-8?B?R216OUhlb2xRdkh5U0lVelVJOElMck5vdnU4K0QyU1h6R0d4WEcrT3dZZzJp?=
 =?utf-8?B?eC9sVTlJZ2gyaXd6MmtaWkwwelNaWWZtUnpUdXAwUC9pVFZBOWtrNmZ0SjZF?=
 =?utf-8?B?aCtOMVlkRkpVRDJiY2RSeUNadjA0di9TTlB4UUZVbm4rRnRwR0pwYzVKcnlG?=
 =?utf-8?B?TjZoNVVoSjhwaFVacENaZ3JiZ2UzT3FlMGlqdU1FQkhXcy85STdGQXhEbnlm?=
 =?utf-8?B?T3VreXZ2MTcwV2tKOXZ4dkxEbWEyd1ByQlhxcmtZcWUybnV5ZzZ0dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 904179ff-cffa-42fe-99b6-08deb1ef7234
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 19:31:50.5100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSGS6QZUm9rUYE/UhmAFNlE6+yC3x/rKyhGlX+QEVsWiIzhgr55SfVzGV13gb4IxA3F5Hi79ZuOHGnb87PYD+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2122

On Tue May 12, 2026 at 1:09 PM BST, Gary Guo wrote:
> This series include some internal refactors to pin-init macros that
> simplifies the codebase and allows new features to be built more easily o=
n
> top.
>
> This includes the following upstream PRs:
>
> - internal: pin_data: add struct to record field info
>   https://github.com/Rust-for-Linux/pin-init/pull/152
>
> - internal: add `PhantomInvariant` and `PhantomInvariantLifetime`
>   https://github.com/Rust-for-Linux/pin-init/pull/150
>
> - Rework initialization and accessor generation
>   https://github.com/Rust-for-Linux/pin-init/pull/143
>
> There're more improvements/fixes/features upcoming that would benefit fro=
m
> this refactor, so I would want to land this relatively soon. Benno has
> looked at them and is OK with the approach, but didn't have time to do a
> full review; if someone else would like to take look at them it'll be
> hugely appreciated.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Gary Guo (2):
>       rust: pin-init: internal: pin_data: use closure for `handle_field`
>       rust: pin-init: internal: add `PhantomInvariant` and `PhantomInvari=
antLifetime`
>
> Mohamad Alsadhan (1):
>       rust: pin-init: internal: pin_data: add struct to record field info

I've applied the above subset to pin-init-next, the two PRs that introduce =
these
commits are merged on GitHub side so other PRs that depend on them can be
rebased and tested with our CI suite.

I plan to apply the other patches in the series next Monday, and then send =
out a
new round of sync patches series of 3-4 upstream improvement PRs that depen=
d on
them.

Best,
Gary
