Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021090.outbound.protection.outlook.com [52.101.95.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B003125B1D2;
	Thu, 19 Feb 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771513378; cv=fail; b=YSs5p5wUn7RPsDAh2Kpzp6RqSm8LdFi/xlIM1lT+/8vtIr0KRsVQ7vxVFYtdi/RGpB5JrZNnPpPHoZoIEy+WLuv8l2Cx/gQysYpiPKpMlUEK4SEFXj/1cPxUXbWkfNYt+3JTkrYDeWZCZuyStiitFTM7Y0WSnswjKCFYsX3bojA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771513378; c=relaxed/simple;
	bh=kEa+XzUVUQdPMnaIUcb8cE7DlGldIXv5YDttzl4ntq8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=CURX71JBU1ZB7Fm6B66qZf9i+q9A/yjJE9pT8IlE5QIkv5kgB5XpJdWPhT9HFAH+mjY7+0P3rvW0uCEkSmDDTJYDNbYKEGb1kr4VePBBU8firzpMN1SuzFAKq4njrDmiYuDODlFg6yUWxX45OO6FwmWMBZ22p9o/6fSKK48aB1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=D5onZObi; arc=fail smtp.client-ip=52.101.95.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="D5onZObi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZtA42XsBAcT1IGUr02WKjBMkjv0b9Tf858kOjacNaT8pYmNs0T5zR5VgfA07KIsJiSyHK3mtDxvMacQkPQDXffinw2Nydb7AZZtQCPRR0kuBoAzk9k43K88eWa/bnFIkZUoUZDUiTzfQ0XCYFe/2t26GyLLU5mcAeiYNnzwkD6yhaQcEfGkVRbi2YpTmpOQXxoKYqRJalSytXor3O0KIfkdqezleHl7hNhvOa2OcxoZyV6yyOOuUYbnl4zEDJnbHDQ66g5VGB3tpIU34zDUeDeaTm/YAbqVKXazkeP/bChhMNfK2q32X/PTL7SDrQcl0ayRDIgZ+RZbk8sH1zYHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAAR7cr462LqeVlkP14z//vSPhZYF7vAFuDD7B3ngJU=;
 b=MxU0kIBQ3Sxwi+uT2Pb4mGCo+GWwpOb5f+iHnAZVRlc7GUHgv9evGoWvRTZWp1Mnpa7I0j+ilC1WUxBLqA3BHdx7RWJ5w60XdwjDY+gqoPl0DLBCOdhw4jm7aV+qed+2kDaR/5IpSbmduWJxS5fSKw77ZZ6IE7K5WVio3hscSMKibb1BR4JFkEGjNpPv1saTnWdxs+wYDEbetjp7rlUGuKPzolXJPshoPS7ye6gkHDUKKhXHNNrpkBOJef6hVZN9o1a8dzNwydXH3AXcYWpJPJ5kzAL9yjvZ4m34+JedAulhOO2D64QovhK5vqPb5ZOdMB1+Hg266t6KJP+awTE0Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAAR7cr462LqeVlkP14z//vSPhZYF7vAFuDD7B3ngJU=;
 b=D5onZObiiHONj7ZjmDPmqay13ZcqAve/SOqrTEApSdh2D8kYXyxC/N8E91NrOdPkUaefolsL5JO98mnX7ToaIDOqm7rTFk1LX4DoYpHz0kMgHDiwtgKcSuxnqGl89Y/iUry2/fgb1Dvyueb/mq01ymfAc8CHAVxI7WetlfQGD44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7953.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:40f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 15:02:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:02:51 +0000
Date: Thu, 19 Feb 2026 15:02:50 +0000
From: Gary Guo <gary@garyguo.net>
To: Jann Horn <jannh@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Arve_Hj?=
 =?UTF-8?Q?=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Carlos Llamas
 <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/2] binder+rust_binder: use current_euid() for
 transaction sender identity
In-Reply-To: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
References: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
Message-ID: <a2db884f83fc5086e34e222dbaad9bc2@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0392.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 173c96b9-eb13-418b-3a9d-08de6fc7f3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W/QC+JLBJrYb2E5ggOp5uLk7Vnf/QOsB323hugQUbYWiNBeGZbQ0XaPRytlk?=
 =?us-ascii?Q?s0tdImEdUhpEdlC7OvdVx5mt95al8RzR+8wvBhMdjV0n919QdA64PjT2OoMi?=
 =?us-ascii?Q?S/A77J0PbbuEP8bJitx67J+0ZYrYJ6KBukg/K1+EUBg3iV8ztvggDv8lstHm?=
 =?us-ascii?Q?D27B9hBF8o4EZxK/k1rkf2UPv1wsOgm1eNCqWG4yrQRviu73uobHvgbIMSu2?=
 =?us-ascii?Q?GRjDN2AlZQ1ryrnJ1izmMnwVIgnyRbcoAM45iVOH0axP3ItAsVCZq5qQGigh?=
 =?us-ascii?Q?maA5qO6I1OqIu6zX+5cQiXid/znc6eKY4uEz7YGMmw+gyDqWmuEWgA5KLtmp?=
 =?us-ascii?Q?8O0Z6DzAmFhyAUfvQIdaIk5ohuSi2GBDe1PX1PByyc+CAt64jYiDR6seG2sv?=
 =?us-ascii?Q?anQ7wwSo+0HEB1n10svGFAiO36us8DhfXx/Kxg6Njc0HbfEIlp8jdU3/gZck?=
 =?us-ascii?Q?4o48QIUIoysiazW6qAyDSH7K+DWkNOE6Xqhd/mPgYfJdooX6a4foNgkNOfoo?=
 =?us-ascii?Q?Ba3KzQ6XHalwQJKoh9Aonh3hrPJrNmvTRFRA0cWI7yGu0hRbOMjpVcECf0pn?=
 =?us-ascii?Q?zjL0oAoj6msFELplca/FLtafyQ3ppK4FSGipkRLQYZo8bOnAh3nOMoXNz61I?=
 =?us-ascii?Q?RlzC9KCBkGIhtHGAPziLbKQ3ixgYzWfp8yaH7SOHcIW2EL7i4FyJmiY+GE+r?=
 =?us-ascii?Q?c+hFBtrCQ9Ze0PnKv7myljhSdx+BTrjZVs39Uq5KrKygACFaCS/IWJCCaHy5?=
 =?us-ascii?Q?lx/NEPLHzaOUMXzaLuyRdIiSLRyYUvKxQOnkpJ463i9BjWoEDHtiAVldmjxl?=
 =?us-ascii?Q?y9b/A1XbIctohgsYJwj9xFBw/ZgaWGNzkwtj6PtRTcjLlTVqyI5ZWPu8ZBwp?=
 =?us-ascii?Q?m4DZySnX9rjZHSiuXa+dd9bzNlTOYilLaYUxyRhjPxLcF8SlZpyJ7mrP+m8Y?=
 =?us-ascii?Q?txlIVc0dCZ473S+mlKeBX61hDwWEV4sUYAiBK48LT4YzHGZ8A7DYeNNHGuVo?=
 =?us-ascii?Q?0gC+XxLKwBlYjv28RxWn5aaBOGPg5N6XQhq8+3x00TSZJ+MHesVYnzikoPI+?=
 =?us-ascii?Q?UZJhMHJiJA/J1ImBycYrVVstB7NTS35FFH4L3CcHLL/q4Vo/Brb4bhUdnzWW?=
 =?us-ascii?Q?Fm9Olijql7jNx0pkEsFXClwpYkKCDNoO9uwE+X7fTtRrqPgCpBAqzJaUqLq7?=
 =?us-ascii?Q?ug5wMAvdIT6LRtJPkznIIXeLbpxSE1LGfGnY9nqD/tgcpsRUz1kGIR217kfY?=
 =?us-ascii?Q?e4sqp4C5o2wPo4eSFpwjk3/wyEKOigK1IWR/OwwvK9ibRGGQ96k1FeVc7QEA?=
 =?us-ascii?Q?jzyk0f8TD9CChzR+7jcNZri6DUXQ9+xyobCwmshCFX5wR7Hf7eqMLwzNVM7T?=
 =?us-ascii?Q?0qR8aeBVP7lRUL5r9ZYLTguwBGEC0ihrPJDOrHTDFKYqjhQ8h5o3li8KntO4?=
 =?us-ascii?Q?gwtG2HB29SVuMsdnS8l5ppKQah/AvMb3VtDhaZ/2PWHV6xB3kBWcOZBPJuwm?=
 =?us-ascii?Q?hk4YejE+gU2OdHufYzKgM9NrcCaQkBGYWGcjG+sOeyHFfEfPAC2zhScf/mQY?=
 =?us-ascii?Q?CZaDjveGxa06MwDJWDU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oYyLgQCIsUXV0R+0LdARt1YiJpAPi/y6l4Vl7vWDUp/kwMQCdt8yTys1tfUA?=
 =?us-ascii?Q?5P5/00l5BYyK478rZljkch4OLw653a6Lz8QXwm+O8sWaqnG08R58MEELBree?=
 =?us-ascii?Q?/37iMN4FQvFGeDQINVRwM06a4qeYQSjBLGGafAD+PHeuTgdSa29wYu037eoR?=
 =?us-ascii?Q?wujzLeQF04Vc7UI9pZ0mD9h4lbL1+CIxjHjMpTLfzu6otAyIghcyOu+ecs0C?=
 =?us-ascii?Q?eCyni27+4+6W4w1MjX/GFTF2JwvXvQDROiU6SP2gw+bVBQHkp4sbtO1BwKVe?=
 =?us-ascii?Q?5ZVjEgVWyB95le+AFHmFiF/+ua8EK8/Yd1GUvqG576VGyTUKInQC34vpTJgc?=
 =?us-ascii?Q?KsmwQwuTxLTzBp6yDwmxj4Y/Csj7T2obBbVPQ2CBjST2cBNfHqzTHWqznd6u?=
 =?us-ascii?Q?lY3ZXjTBwxAlaLM46Wa/i4kMpAl7F7KhAOZmEECaAimfQjd16OeajoQgbPlI?=
 =?us-ascii?Q?/GOf+1FOyAIKTGvuxGZSnt8Bs55pKfYhIRHV/9rigr+thD1r06KPD6weiPvS?=
 =?us-ascii?Q?+XlgLRJ0PBGEvTFk5uc/0l9cF1OX3COi2p3MiYlgOalNMPhjzkzZmLSny/Ml?=
 =?us-ascii?Q?EYA2dyk4CQjlwlSap2wlLIkQqbhvq0VGqHlCZL9o9WBRmz++d8dAcCenFYos?=
 =?us-ascii?Q?mDUf8St510X16YSdM1C+jA2dghzOWUS23L1i2mE8ZlGoSD2/1MhPQBoJmqBA?=
 =?us-ascii?Q?+t2JN2QvUPjWI/mGpZNiPA9FgK2J7V+crjA1XoTK/l73yLImSQJ1h9G+FkpV?=
 =?us-ascii?Q?QMkxzhC1BjMT/6X+6GJZav0xEoeLlWDkHzB/ngQCHQJ66diWDmDd+UGnP/1P?=
 =?us-ascii?Q?AHZCHg0p6dCJjeN15IieYuWe8ofhHFMoBeLiLjLfk0uTQ9uZtCS2CAU5pmSK?=
 =?us-ascii?Q?NBOvQHiROTYQt1FBY9q4zLAacsisYM0V3QY+t56j0qrMfmG47CH4xU/w7bur?=
 =?us-ascii?Q?hYd0ITtUxMlRIpF6WbFpk5j3kbZNzazV4dYz7ABEb3AuZoZTxxOVDMiAMYXl?=
 =?us-ascii?Q?34IY2vKpq57m4GifgnMLUFjXi64nn+nbgplvdegGWOehRkbEXeSjIMP05z/s?=
 =?us-ascii?Q?fJGJJTWbbbJa9lRG9iVHWcRx4jcLGMguh1x6LibWFZn/Tlg3XXTuN0JsU9ry?=
 =?us-ascii?Q?5jgKiclfbWOjGsM+gFPNfrfGGsNPQ4ZDAzOLMpjm0j6qPR2zo1SUKOiVFcx4?=
 =?us-ascii?Q?jupxQSVuRum8sgZGhIvN7adsDpxpVfSbQO/98L1sLh8MWuUuKINgVFVbqgAr?=
 =?us-ascii?Q?yY2U1U7A99l8QvfyHm7gH9kGDCB7xhO3quxtDOD5SMSHThPyhpuPNXHgRjyF?=
 =?us-ascii?Q?SqO8qz0l9OW6djy4iJBQOmHf5Z75urCmb53MdmRebT3nWl7TKhY29sxSFiCj?=
 =?us-ascii?Q?wPtJKH/ChhtGWuTMimo6V4PP4ZlLT9AyFT4p1Y77hJ9U8SP614O+QWVcX1gx?=
 =?us-ascii?Q?tpGtCPbQz/JteWIf1l3TY+TAQpXLCS/WgcGtvqfVixPomvAhwIi9b+i1r0a/?=
 =?us-ascii?Q?/Q4gCYQ2n7rIoyvnGIXFvLHJeqxLVzy1H4E/Mdko/DWUa5kYOIqTEZ6XxbRl?=
 =?us-ascii?Q?1uIKJ5xP/IOxbFxOckxs9k9QrbOzOWBS6H/C0VAQC/G/DyJBGmxnPGVU3Cch?=
 =?us-ascii?Q?mSisw9zZlZyLIBh0URN54fNmWgbBN3pdNswycyjq7ZrNRRRgv09rKUnXZDYx?=
 =?us-ascii?Q?yhx97PfkYTclWdjyZK7TRJDqJk/CUhkWVW3WemZgqrh+xE3MCfl+38ratOuh?=
 =?us-ascii?Q?CHFwk5VELw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 173c96b9-eb13-418b-3a9d-08de6fc7f3c7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:02:51.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GUavYurx6L/WPVya9u5lR5iKbZaeUVL/WSxSw6qjh6PV3nwiUvzHUp3pOhClQZ0EZyMp+cBZfACukZOk5TXdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7953

On 2026-02-13 21:37, Jann Horn wrote:
> Based on the discussion on
> <https://lore.kernel.org/all/20260212-rust-uid-v1-1-deff4214c766@google.com/>,
> here's a proposed change to binder to stop looking at objective EUIDs.
> 
> This removes the last remaining users of Task::euid() (in Rust), and 
> the
> only remaining caller to task_euid() is the now-unused Rust wrapper.
> 
> (Sidenote: It might be worth considering whether it really makes sense
> to have functions like current_euid(), task_euid(), and so on in Rust -
> it might be less messy to just expose current_cred() and (if necessary)
> get_task_cred(), and then use the `Credential` abstraction around
> `struct cred` to access the various UID/GID/... fields.)
> 
> (build-tested only.)
> 
> Signed-off-by: Jann Horn <jannh@google.com>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
> Jann Horn (2):
>       binder: use current_euid() for transaction sender identity
>       rust_binder: use current_euid() for transaction sender identity
> 
>  drivers/android/binder.c              | 2 +-
>  drivers/android/binder/transaction.rs | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> ---
> base-commit: 3c4ae63073d84abee5d81ce46d86a94e9dae9c89
> change-id: 20260213-binder-uid-a24ede5026a8
> 
> --
> Jann Horn <jannh@google.com>
