Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA572DB795;
	Sun, 13 Sep 2026 01:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263500; cv=fail; b=TYj/tkSOBlnNueHhW9YkaGU6bMijtruwvl4dlDQwYA+/fGr3BcXoycQFJd+kq9WyLVlJH8CIFelBbvxNI4kfKSmM5xl9IO8Xngus793+EFNd66/UdkF2jexq3JxgsWLquUsjdglexBCVEAy63m+f4gBgws2OpNMwlbKoieI48n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263500; c=relaxed/simple;
	bh=NWBrL1zvkuD+QbqHxDKMaE33GyLm42Dj0AaaTjGeZxI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VoTRM75o+bUbXuGYiRtWn20+oG4thC4O9JJC/+WusdodINaHX1PX7z1KFnMj27qZiIw3GVK4o8elxgRoxWqNf7F/fid8IwM7RuiQZ6dffbSzZ9MHP39HAVugZYL4bdCQPRsv9PXDU4wA6xJdYLX4/+JHVq8waa2jc2cpjxIq2Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IuN77x7Y; arc=fail smtp.client-ip=40.107.209.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IuN77x7Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi+9s9BN0HFtWfqdfy70CkRSYdsYQrSI2IBiZJP0+V5p8LM4K4jyNwJTQCkZB1MVnOaA5ht6/YhJ3Vx6lISB3VbqO2g+KKp44/1Ar+DcaQyB+roCiK2t/7CTCQWrKCN3P55yWPQ7pssrnCSfnBuJFifQolUP3dO9uu74wG6XEoZdd1ex7PpJ7/K68WfI5GVboT9bPlMmJj7tTddDoYhEr6cW0Lt5mo3+LspVSsLglc8ulxmjCZxxed3lO4ZyGo0l9TkaJDpbF90jxCZVXpBMU8Cxr8ChDf1J5VmTbiabJoYgs3vqP3vymxNV06DjPDXECKoPqw9hwk7NgwUEdjGcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm8YXT/3C8rvrxd0l8/m+qTT2TGGyhC1PPU6LBHuRTQ=;
 b=u79w+zxXXUR/1Wi5RDvatE/E4XD3UwOxE3r+zpKoduc4B4Bt6v1i1+6n4kj0n9ic8H3OrVigo7gChGnpy/5Mgb59bxsnQ7dcvAkvS2UlsfFVSOVWqR2WyLxOHJkgtka6ckhmk2PvYyNdC/d1dYqQZ7AOkCrUjkvVu3At1ARXA+FZ7+ZwhXuoYb4n/N+fFK3xQRG5JljKHVZVkOvIM730k4ybYb6gRMQbv6PZil9jPfaXYVVG5/3lW7d3MN2z7xZ3W8Dv45Eerqf/HuuzRmdrfBkCel45/hhVMypFAoy0BPc9zOc2921Z1/bqK30H2gmnAvU27tRj+VcZ/rQ21g7uCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm8YXT/3C8rvrxd0l8/m+qTT2TGGyhC1PPU6LBHuRTQ=;
 b=IuN77x7YZsIPXhgP6nb5+EKZBdtkMADr1AahWFydUyOZN89p3LsjcJqzZlDCZplGN+5qT8xIbNFxVf8mRnbLoTIi/vAtnZ7qbCQvDCABUrn2Kj5pX0/Cny48+mmgW4+97n2tRzn+tXHSthw7mtZfqofC/wXur4puoiN8a8RSbnARA33e/hFYXmj/yrF2pmtNStTXmJWBRil8XuJslqS03UZwR+Cd+YuB7HTypypuUD3cBPn7Nlnv/8XP3ajLGI2k96K8N/541peIBdn/OFrMnEbPd0o/RDntdPau4txdpE8yS0JDtWljNkccsZTlIU6Hiv24HZFkbvRc6ih7zSLhNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sun, 13 Sep
 2026 01:38:14 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 01:38:14 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 13 Sep 2026 10:38:11 +0900
Message-Id: <DLDSZ09SM8HI.3PHPYGLV2YZBX@nvidia.com>
Cc: <git@younes.io>, "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: num: document why Integer is sealed
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Younes Akhouayri via B4 Relay" <devnull+git.younes.io@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260908-docs-rust-num-integer-sealing-safety-v2-1-e8c65234db82@younes.io>
In-Reply-To: <20260908-docs-rust-num-integer-sealing-safety-v2-1-e8c65234db82@younes.io>
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: d777b275-3bd3-42ad-cd87-08df1137ad8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|7416014|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yLNj8UR2N0hWfK6f4V7uBQ029Z4H39eDXmWJTVphqDr8d+udxUbFRsdmlbTEzsvpC81kAY4pLb3xNOn167TD3SwCj6EADI/JhGi4fCyaH5pM+noWY9THerUVkfqC9Ps23N/+Ok9qapBZ1qnVb13uULoNpIX9wHWLK6cP3Ec/8i7fZelHEj2LgFn6YBUfDlcArPViGKW5fbgx6DWOMjIlVnKjzo3UDOtgT0ICpL5iFAvrqyc1Db0AEF6PR9TEas44/IMPUNVh3zOTsJtLUybHIKNYNu9Q1J/yjfbIyAaGdfQv5bCkD/6RrBvVWAh4KhVP0O+XuASEVAZK9hlolRlkUWaMsoMCoy3f/UrpJQDo0BN9/4rLCTKm1HQ4WCMNB0Y56YwKtzrrtWVXgA7aEUH1bz2HDdsaRtY7IV4g/ReGHwgQens3Ryb3Qvg1vJ5QzV7GIIJjEMWD3IScaVs0T9dy/Vxg/uJqQdII67lxn1uRNcwjrFyC4WSsga7ypwUQDYGnkIjyEWP5KujpRwsk/PQcBiV9T1BTt3EUIrdVnck+t7vB7sgEf8gcHXkh62ZCO8m7QpZpcgrW5A0fAM0ShbtEh1v4pJb9G/yAJDB3TIQOc9uIZnpIcPWKanOHQ262UfEnqxFYncsl2S2CImgg+dOEQFGXNJQA5wgU5QrPbLwWOwg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(7416014)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzZyVExSWEc3My9rWVJqeGRwK3VrNjhzYUhBZXhzbm5CNUtsdjdMSHRTekNx?=
 =?utf-8?B?V21MUzhYb2RUK2d2MmFvZnBGWWxrTlg4Vmc4ZmN0U05iMXRyVlpXQU9QMTBy?=
 =?utf-8?B?czVEalZiZHhhQUpLV1BlZFRhR3lBQmtHcWgxVjVjeWN5bUMxUTFlMUg1V0xH?=
 =?utf-8?B?YWpRY0lFZDNQSlI4NVRnTmRzSHczcjN3eWNncnM2b24zZnBlbEdwejQ1VFgz?=
 =?utf-8?B?MWNOcW50Qk96S25uVlhBODVzZk9hSmg2cXlqUmJ6b3BzNkt1RkdhWVlybnBO?=
 =?utf-8?B?ZDRqMGZZSTd2dWZOR2doeCtRbDNpSFB4ZXpoZ0ErSEIzRWJ0UFE1dU91djB4?=
 =?utf-8?B?dEg3ZFBIS21CYjNSNUFiN2psK0ZGQVRCclBKaVI0WWY3SkV5UWFWb2FKcStC?=
 =?utf-8?B?MGp4SDFWU1JPb2VReFhaR0x1RHB3S0Y0L2RtVkhqMUdBL2ZnQ0I2NE5HVVlP?=
 =?utf-8?B?NDAwR0p3cUg1aEhJVlV3YlpZYzZvWVhNOGptY2F6bjBIK0RhL0krMTNxc1VQ?=
 =?utf-8?B?WGRVTzBzbEpxZnpTS0ZBclpacy9pU0pncnp6Uzgvek12Q25qU1ZaQTFGWWdD?=
 =?utf-8?B?Sm5lSVpnaUp5aVR6dEY1ajVoSUFGOGk4UlZUcURGaGh4NFdUUFczQVF4NDdz?=
 =?utf-8?B?YTJhaDA1NVhKdzFkRGdKbzE4bkpTd1F1eWJUdC9QSWxCcHpJaHN3U0JqWDV6?=
 =?utf-8?B?a2cwNnJtWlVWWFI3bVJUTEJOZWdkZVhPT2pDRmhIQVBPK2pySWVUajFGL05l?=
 =?utf-8?B?Y1FmcEpvZi9HQ0dVWHRqRVhKWWVEdmtBdlp1UzcwM21EVll2V2dKOVFxWjNH?=
 =?utf-8?B?RkM2TEduRG12d09mYXJ2Q2d4TEVna1FwS3BaUXJCb3dFaTJ2aXNZaHI1UDhm?=
 =?utf-8?B?Q3pYT3FTeURuMTRJODlzUWpaYUZzd2FoSHg4OWZKVWRON0ZaQUJrV1ZkWS8z?=
 =?utf-8?B?UitPU0UrVVBROU50S1lRTGJVUjBsRVNxdUhpYWRYc0NRTnR3M3E2TElua2ph?=
 =?utf-8?B?dTR4MEd2b1pKMGljR2EwSkYwakJaQ3ZGQW1yR2wrZFpwb3hKM05nYXdYMEFt?=
 =?utf-8?B?UTI0U0NobzVnei9HdVhEbytrVmdiQyt1aDBBeFl2WlJyenlSQUgwU0twdEFy?=
 =?utf-8?B?VHgzcHpnTVF4akFiWWl5S2d6VVpHZjNtS2JGMzkxMU1pODFaR0ZXYmg1dGtx?=
 =?utf-8?B?K2poZEthTmE0eWt5OW9YSzFsVjRNZzJ1UHdyMTdwOEhOWitOTzRUNUtTNFQ5?=
 =?utf-8?B?R1JPdlNzVTFCVVZmT1JkRFgrZ3p1bVpaT0VtdjhhbVI5Z3l1MHRmbkRFVkhn?=
 =?utf-8?B?bmdFY0xZdGgvWXZpbkdIODV0QmwrOHZDdFVJdndxR3oyTkpFa2YxdzB2Z2xY?=
 =?utf-8?B?VkJLK0JZcjV1OXNvNlExMjcra3d2Zk9sWXUrNTlCU3ZwZEVjNmdUTDF0VE0v?=
 =?utf-8?B?RHRJM29SdTE1djhWSytMSzF0ajhEWHlBczZBenVGT0FPVmx0SGYxbkg3NWtp?=
 =?utf-8?B?c0gxaWlxUTlhdmxSaEV5WHo0cUFYY3Y3VHZaSFhVQVRidnVlV2ZGMjlyRkNW?=
 =?utf-8?B?KzJvdm0zR2dVang0QVNlNEhERU92MFc4Sk9JNmk1ZXNjcWFSSzk4TnBQRjl6?=
 =?utf-8?B?bXZXbDdPODdHN3N3NE51am1aNEs2bFpseTZWcEYrSGQxUGJ1SnJkZDFCVytN?=
 =?utf-8?B?bG9qQ3F6LzVsakkvYzlPalVNQTA4U1k1UkJPSC9HeFR1T1VYZDJ5WGlKcVEx?=
 =?utf-8?B?QWh1ZHRqdnBCYnQxOFNJZUd6VmhTWGYxUWdCR2ZzUzAyRTh6Z3ZTcVIwUmpC?=
 =?utf-8?B?RndKS2lSTzB2U041L0R1aGY0S1B0QmJ5c3N5czdja2xvRFVSalMvSVpLWVg5?=
 =?utf-8?B?Y1NoN3ZOQzlnODFsRjVFdUFxSnZsZTFKYjVJYmxvN093VjAzQTY3cXdwQlJW?=
 =?utf-8?B?UlRPNmUrMzErUzJCM2ZDTGI3S1JUWXlrVWpIWExuR0RodkVRUmQ1ZG53Mm5E?=
 =?utf-8?B?N1R4MCtlajl6M2dRN014dXZNelF1dE12VktBYmJQQ1NMS2xoTmVHckgxNG4x?=
 =?utf-8?B?dWRvL1AvVjQ2T21zaDhuY3kzM0VBcGYwSUtyWUM0bUc4cHRxVkpNbXFlUkdz?=
 =?utf-8?B?MWMrZWl4Y1BCK3I0dk9YVVdFZVZwZ1NpMVhjWDNiMUNJTVVQQkdsMVNNYmtB?=
 =?utf-8?B?U211RFNRZm1pQ1cxRDloRTFvK2dWZXpVK3dDOGRCZXN6Tll3RWlMekZlTDVC?=
 =?utf-8?B?VFNiMVdoRHIrSmlGL3ZlQlRxV215SkFXMzdwZjY2UXEvdmlDRWUxVlF1WXg0?=
 =?utf-8?B?K0pJMmNxdFpDcUV2ZGhjVUpLeUttc1VYWHVOZGFCb3VSYXlLYmk4Zks0YmlL?=
 =?utf-8?Q?NJHSJcYEQVi0fy9HHLCMBaGzvFbIFGlv43oHXffDIQ9B3?=
X-MS-Exchange-AntiSpam-MessageData-1: cWJBZ5Ek0GfUVw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d777b275-3bd3-42ad-cd87-08df1137ad8e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 01:38:14.3945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JL6RXwKoeI5Unh2AxVBxWCtEQVm0x39+/c+6IXnh0XiH/qxtcoqTYzEtCBJ4sY8kAv9awy8poa0/KvNkhPJS8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142

On Tue Sep 8, 2026 at 1:39 PM JST, Younes Akhouayri via B4 Relay wrote:
> From: Younes Akhouayri <git@younes.io>
>
> Bounded relies on Integer implementations to provide primitive integer
> semantics. Unsafe blocks use those semantics to justify unchecked
> construction and conversion, but their safety comments do not say why a
> safe trait may be trusted.
>
> Document the seal at those safety comments and next to the private
> supertrait.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/all/CANiq72m8kycbfQ1teyne-OtB5d5TsUcX_WW0FC=
kWB3Ayyg-qWw@mail.gmail.com/
> Link: https://lore.kernel.org/all/DL88SQWYU15W.2CVZB5NVSSJGK@garyguo.net/
> Link: https://lore.kernel.org/all/CANiq72kx-YPPEruOFdu-Dp7GX+8=3DEt6svG+s=
QtqEmmF7kpnVyQ@mail.gmail.com/
> Signed-off-by: Younes Akhouayri <git@younes.io>
> ---
> Changes in v2:
> - Shorten the comment explaining why `Integer` is sealed.
> - Mention the seal in the `SAFETY` comments that rely on it.
> - Link to v1: https://patch.msgid.link/20260906-docs-rust-num-integer-sea=
ling-safety-v1-1-78057391302c@younes.io
>
> To: Alexandre Courbot <acourbot@nvidia.com>
> To: Yury Norov <yury.norov@gmail.com>
> To: Miguel Ojeda <ojeda@kernel.org>
> To: Boqun Feng <boqun@kernel.org>
> To: Gary Guo <gary@garyguo.net>
> To: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> To: Benno Lossin <lossin@kernel.org>
> To: Andreas Hindborg <a.hindborg@kernel.org>
> To: Alice Ryhl <aliceryhl@google.com>
> To: Trevor Gross <tmgross@umich.edu>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Daniel Almeida <daniel.almeida@collabora.com>
> To: Tamir Duberstein <tamird@kernel.org>
> To: Onur =C3=96zkan <work@onurozkan.dev>
> Cc: rust-for-linux@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  rust/kernel/num.rs         |  1 +
>  rust/kernel/num/bounded.rs | 48 ++++++++++++++++++++++++++--------------=
------
>  2 files changed, 28 insertions(+), 21 deletions(-)
>
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> index de589792a77a..0449e84a384a 100644
> --- a/rust/kernel/num.rs
> +++ b/rust/kernel/num.rs
> @@ -21,6 +21,7 @@ pub trait Sealed {}
> =20
>  /// Describes core properties of integer types.
>  pub trait Integer:
> +    // Sealed so that unsafe code can rely on the correctness of its imp=
lementations.
>      private::Sealed
>      + Sized
>      + Copy
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index 2a2b0a4bca5e..1a3f369cd886 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -336,7 +336,8 @@ impl<T, const N: u32> Bounded<T, N>
>      /// ```
>      pub fn try_new(value: T) -> Option<Self> {
>          fits_within(value, N).then(|| {
> -            // SAFETY: `fits_within` confirmed that `value` can be repre=
sented within `N` bits.
> +            // SAFETY: `Integer` is sealed, so `fits_within` has primiti=
ve integer semantics and
> +            // confirmed that `value` can be represented within `N` bits=
.

I know this was suggested on v1, but do these comments need to be
updated? The seal on `Integer` guarantees that all implementors have
proper integer semantics. `fits_within` relies on that to guarantee that
a given value can be represented in some number of bits. So wouldn't
relying on the guarantee provided by `fits_within` here be sufficient?

I'm nitpicking a bit here because SAFETY comments are simpler to
understand and maintain if they are simple - as long as they are
correct, of course.
