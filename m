Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93173A9637;
	Tue,  7 Apr 2026 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566116; cv=fail; b=dWqCh8fPiyjpsadvxBuDAmYY9SaeVkmmSJVamO1+oi81+yayzgGsOBdFuPADjmC4uQfhRDV1EhLK+Tp7kOfu2NA7atbNRkGAatdc+L5aGTnpgKZOqKN9KLz7JDg3+zbN4b/YMrRAgOr507fMERKs3dQDgi++/WflLsJgPGUffSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566116; c=relaxed/simple;
	bh=70OtmZJL+BunhtjAbBx7LaIALeeO1+BdCKbzdNVo8f4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=sulAqUUrRHdGvLAbbRfcxOzsc8o1PTHFY4EK55V2vvXp2QjiqQ8j6ZUcLxkYi8WgW3emSBrTt+ORsQZ1xLfdYnURQ/M5XjJ+AvgVcLqQCfInrrGArRxs1wSRbkwvuIVCQqQI+F53yJW9XFvOEvP6b7r5YHG1sshF4hwAE5AJQn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=i3yNUhux; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="i3yNUhux"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSlolifhtBT8Cz3Zb8ViWh9aG9j1CaAVq69dbCZq/fCD6YCRUDvtaK4cipchfvlCjWfeQuX4rf+sLGL56sxBtmpx2kn0t8B/DJpnCO0lwxp+QqHrnRtu9ruxl1i46QhvVsz2GNMZ9IXd1+8Slqx0aMqwoGkJCBmMGvV3WQMnIOmrnDbUhvW9ZQvP9BmlDPat+cq+o4/OVLokE/Ce7oRe8zjO9uLNNaMrcBWI/+BWyxYtoPz9JLVuLIgUMNSXhsszVLzLPVdt2GbnDfOKKnmyZIL8GADKPurNofwoiA93G8PAhBtpQZdCHbds3r3aZdIjHTxKgGDNJZREeboGgOaYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ghdzI6rRbaudRgQgI/zPUZg2WcAMkabjfsEuqlfUik=;
 b=GFNNvOtyNSDMTQ0geODIt2z97JgH2NaFGkmWkOY01M8moOQpwfeH7UT7xFXamgmpqOYpHkkxOb0x8EWipyyHjhYBMf3PNcMPhecqHZCZn5LB0TUk6nQRxSi0rgVKn7RAUZVSkp9zRvSUDhzZYixYeanKhjcz9JUFqJWALF5x1/H4liXw8wxyCBA/qVIMmPAG8DCKPPTvQMgXX8lKN0RQ0JFsNB018giaM/UDcLSl6y/Vvt/sIgNR6b8t0mwihU1EHicCC0UGyYqRpHp589mxhIdDrJBa6Um7+jevkXidGMnilvIE4uKCo5EtntJ9bXoZi91hLyxPihWxKpveFDRMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ghdzI6rRbaudRgQgI/zPUZg2WcAMkabjfsEuqlfUik=;
 b=i3yNUhuxvzH/j60xJBnF66JfOhHwryDW0hszDhCgnC5fUYnofzvNgUtHxYqePhqZqjS0jLXBhDlogVL5UDMSlYQ7jMOZ/wJ9LkR+i729G8MdaX+IqzWJJdSlg2qGAXV1ZAaKeem2ajacGFQbs45i8zP2TSSRjE3EV85F2fD8BxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LNXP265MB2441.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Tue, 7 Apr
 2026 12:48:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 12:48:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 13:48:30 +0100
Message-Id: <DHMXNMLMMVDR.3E3J1SYEH8EKF@garyguo.net>
Subject: Re: [PATCH v4 1/3] rust: helpers: add workqueue helpers
From: "Gary Guo" <gary@garyguo.net>
To: <aakash.bollineni@multicorewareinc.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson Almeida
 Filho" <wedsonaf@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, "Boqun Feng" <boqun@kernel.org>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260407-workqueue-v3-final-v4-0-c27da7e5f175@multicorewareinc.com> <20260407-workqueue-v3-final-v4-1-c27da7e5f175@multicorewareinc.com>
In-Reply-To: <20260407-workqueue-v3-final-v4-1-c27da7e5f175@multicorewareinc.com>
X-ClientProxiedBy: LO4P265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LNXP265MB2441:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df7196f-445b-4bbe-69ae-08de94a3f8ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nAoJe9ehnVUnlSNXfPPh9uJi4+UDSuZ0I88IhvvZY358XiIGh5VZ5d2ibAVFDWWhIq0ddmPBK9rM+/USgtYpANF5Yg0fVZgl6+U6MrNMcwFiGJ14GhyCzxPe1zK4g+KxtuF7M3wgYzqO8+Epdb/dnoazRYb7ybQIX/A2Txq9pxhtiomXjmJVQxkU/AV5Rf2Yi+9C7ZjxdivEYK+yhUwHVtdt/iVCb8t3N52rDLMIHe4EG9RTM2IjEFVB3DExvsltR/ogqICoJOWqBNcR42NR77PHEoFBE8UtWmHxuyLmwzyBiyt7SvjdKmYnHYOOFXVSYtlsOlpv/noXSWStQ/5ZO7jKupcck+VB7OOAzP1iDCgjNtEmIjwaA0+DTfDGQXwWua08tY5ytNC93djkRhWE4D69GWGUeFjaNpxqvVnQRzfReGp057RvOeNo1pu6LP70h1LbD1m3yOi7IRVcleBBl02TwJJ1dazA37mTk2PqjJdTwflgJKIGQCcui1blwsYe5Me/huu6jLd15HtATQ7FsGAZpMFdHqd/7KAPA2z2RHIcZdjj0m7GFO5bHYRn1dNZ9GxzwNCX34SlecOxg7XBbKkLymrPlb+1rumooD3NdAw/PXe5omMN/l5ntKj4rJ+t4KaBXRnWH7hhy3lh2Kzd0eXD+t3vFOsI/7bXTFmpUbhdMpHrzrnMYgWssF1DKm5mJEU0Sgsom1wEMJBSmEmPUE1taUG7s3TpUD/1rqqDaULWIxorTNrYWA/dVPHlVSdm6G36gKg/E4v0KOMZJ3hmiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWtTeldIRnd6ZEVoSWFjUnVZVkdNMFg0SFA5NlUvY1JTbDg4NGg0Y2tyV08w?=
 =?utf-8?B?Wm0wRjhDZ1AyTHFBWVdzWlcyaGhmb3Vjdm9NU2pDRnVGRkN6QlJ4RWcxb21P?=
 =?utf-8?B?QlZMOGRSYjZZUzdIdjlzd3E5NWtReWJucFptMVJBcTMxeHpvak13dzhDQVl4?=
 =?utf-8?B?Y3hlZHhEa2ZhcCsyakdaeStBUHIrRURaOHc2M0lBVjVzTHJkR2Y1dnAvWjVF?=
 =?utf-8?B?ME1MM2F4cHowOThrQUlZYmM5bEtOaGVrTnYzOGd4VmtoRHAzKytROVlKVisy?=
 =?utf-8?B?N01PUjI1YndiWEwrQ3pPYlpMQWFXV2NrUS9DRkFqZW5na0FYUUE3Qm1GaWxH?=
 =?utf-8?B?ZmNTRlFsa2NKZUpIaXZzWjYrLzF3M1BzZm1RaE9rQWJEbGFpNiszUnlrckx3?=
 =?utf-8?B?Wnd5bHJPQVlmUDFhTHZPeTRNU1cyT0JnYWpQaDNUelkycHgxaDBnQkJqcXhk?=
 =?utf-8?B?akxvOGx2dmczcWFnZU1XNGFtVjgwQmV6Mk9HWWdndWJwZVJFZUFrb21GdW5S?=
 =?utf-8?B?d0hUSDQyYzB0RzhIdzVJVWtEdUdLTUVzWWRaekUrVlRXVEpOUFpjYjZIMzMv?=
 =?utf-8?B?WEhzOWhXd2xhTTJSeWVvQ0ZGa29XU1Z0OFlYWTl1aXNXbGJmamZZWjJ5cWRS?=
 =?utf-8?B?dFpPYWsvOGhucm9WOVFuNDhqVmJ3QjU5S3cydjJFWnRTa0V5MXhBMGxNSTZs?=
 =?utf-8?B?Y0hhY3RiUTY2NU1mbmdmcXE4aVY0WDkvMGh0bER4OGU2UjBYYzdPQnY2SFo5?=
 =?utf-8?B?ZitqS3NvSjZ3SFdUNUlKNkpnV1lVeWVRSXVLMVRIeW5ac0REY2txYWZkb3hj?=
 =?utf-8?B?dVRZMTNSOHpqWjU0ZGJPc2NBaVB0M1VsTWlNWldvZDc5aVlDekRnRmxGZGNV?=
 =?utf-8?B?QlJBSGM0TnMrdGd1SDNTYVRuTWhPb0hJcE83WU91S0FTZ3ZhYjFJWERsdGp3?=
 =?utf-8?B?YmlpUmRrYWFnbk9Ja2FZYUViaVhxekFWVkpSWnVNSURlMDU5M2Z3L1BPQnJE?=
 =?utf-8?B?VGg5cmV1anlhV1JQbDg5d3NWTFpQK3R0RGFhK0ZCL3l6QUxsVmdIUUJIS29a?=
 =?utf-8?B?Z3VYcWpuSHBkK2Y3L2ovSys1aEVycEc3Q0orMFJEVDV1OVhnWWJMaUc2VjNR?=
 =?utf-8?B?SUd0Tlh0TXV1bm5uckVYZlM0bGVPQlBaRmxKSTIxSEJuZ0tkRWFZOEw5am9z?=
 =?utf-8?B?ZmYxNnRwSU1VRCtTaURkQzVsbk9obXQvVTFqNHZsWEFoMUF4U05TazVvNzUv?=
 =?utf-8?B?eVh6RXNLdDNkd1hXK0VyQTRGOFZIOUdMNGxWTjV5WHBVQlZTbVR2NHlUbWRM?=
 =?utf-8?B?Sm5QdmdkYjFqOTAzcXQ0V1hqUW9RaEdibE1KRVI5SjNUK3NjY2lJVWdZbHpn?=
 =?utf-8?B?VVlXdG1lQW1TL2tFblcwM1NUODZ5ckpTUm12QlhKcVhBS3lzSENTUjQ0YnVw?=
 =?utf-8?B?UzhPSTB5Z3ZTT2hLVnlGZmtuQkkxa0hKcy9wRnp0TEVvd0hGNHEwcTRWN1VF?=
 =?utf-8?B?VEJCdUpIU0gzN3hvdm15dzhRV0xDZFRrNGtHWFUycWhSaUMwWmpLUncvQWFu?=
 =?utf-8?B?MXdxbDM1SVNoMWpneEZwU3dRVmkwUzYxQnJNN3BFNFFId2J5V3VjZEZQR2h0?=
 =?utf-8?B?NS9YRG5zMVJvS2dZcTQvcnNPaWhvTVNaem9LeExYTDNNQURISHlWYklsRnU4?=
 =?utf-8?B?Uks4SDQ1VUVTV3kxWTlxS3NBbGcxaEIvekdYWWQ5eUkvbTUxeWxxOUR4amRO?=
 =?utf-8?B?MFpZc1RzMk9XZWhEWkg3MWgxdUs3c3VhOWM5Ry83dTZBM2pzandPcXFRRTZS?=
 =?utf-8?B?eEF1NVRjWUJBVkxCRG9GUkZhblk2Q1lyY2YvZG9sdzhmQnFCTzdoMXc1UnZ4?=
 =?utf-8?B?cVpaYWZJNm0vb0Vvd3hXd29OOWdqUjUwMmdic2czU1Y3VjZHb2RkUjYyNnJG?=
 =?utf-8?B?TTVGcHg4aDNsbEZHOXV6OUtFT1A4bHFUbWdhbFJKR0hYME9Lck5IdWxFSVhv?=
 =?utf-8?B?MFZlYUh4citVdGxiRWtrY0taZGxoNEEyNjVrNjJQM3Z3NGdSbFR4RnFub0Nu?=
 =?utf-8?B?TEQ3L3Vsd1cvbWRiRDJuZFlxZ0h2ZU9OUXdlZzQ1SWNYZEhrVHlMU0FXVWdt?=
 =?utf-8?B?MkJJZ0NKRlFVRDFxc0kxZjNpRmJEUkpoU0EwTVJVY1J1TERrZndRbk9yeko1?=
 =?utf-8?B?c0VSL1VBKzNDR1ZBbXZLQ3c0bmkxUktDd052ZkMvMmsrVHhsNnRzdkdYZkMy?=
 =?utf-8?B?b2svaWgzT0MrZjU1OFUxT3RnTWFFQTg1dlllRWZsYjZyYlIra2tjV3Y0M1ZQ?=
 =?utf-8?B?bUlhWmkranlYYXVtYU5GdWllK2ZhcWRuUWc0cGtrQ3JjZzhia3Zhdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df7196f-445b-4bbe-69ae-08de94a3f8ff
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 12:48:31.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPPXpO06SynOFBeZ0cLHFfAthPTCmh8S3KbrsENQIoKeWrcp6dMrUQYzlmopHRg9SyEGi2SRWmCd8EGuiFFSxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2441

On Tue Apr 7, 2026 at 11:37 AM BST, Aakash Bollineni via B4 Relay wrote:
> From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
>
> Add C-helpers to bridge the Rust workqueue abstraction with the
> kernel's C workqueue macros. These helpers wrap core workqueue
> functions that are either inline or macros in C, making them
> accessible to Rust FFI.
> New wrappers:
> - rust_helper_work_pending(): Wraps work_pending().
> - rust_helper_cancel_work_sync(): Wraps cancel_work_sync().
> - rust_helper_cancel_delayed_work_sync(): Wraps cancel_delayed_work_sync(=
).

These lines are of very low information density. Just state what's wrapped.

> - rust_helper_init_delayed_work(): Performs robust initialization of
>   a delayed_work structure, ensuring the correct timer function
>   (delayed_work_timer_fn) and lockdep maps are initialized using
>   standard kernel macros.
> These helpers are essential for supporting safe cancellation and
> correct DelayedWork lifecycle management in the Rust workqueue API.
>
> Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
> ---
>  rust/helpers/workqueue.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
> index ce1c3a5b2150..85a6c0b9e4d5 100644
> --- a/rust/helpers/workqueue.c
> +++ b/rust/helpers/workqueue.c
> @@ -14,3 +14,35 @@ __rust_helper void rust_helper_init_work_with_key(stru=
ct work_struct *work,
>  	INIT_LIST_HEAD(&work->entry);
>  	work->func =3D func;
>  }
> +
> +__rust_helper bool rust_helper_work_pending(struct work_struct *work)
> +{
> +	return work_pending(work);
> +}
> +
> +__rust_helper bool rust_helper_cancel_work_sync(struct work_struct *work=
)
> +{
> +	return cancel_work_sync(work);
> +}
> +
> +__rust_helper bool rust_helper_cancel_delayed_work_sync(struct delayed_w=
ork *dwork)
> +{
> +	return cancel_delayed_work_sync(dwork);
> +}
> +
> +__rust_helper void rust_helper_init_delayed_work(struct delayed_work *dw=
ork,
> +						 work_func_t func,
> +						 const char *name,
> +						 struct lock_class_key *key,
> +						 const char *tname,
> +						 struct lock_class_key *tkey)
> +{
> +	INIT_DELAYED_WORK(dwork, func);

This is just broken. You're initializing things multiple times.

> +	lockdep_init_map(&dwork->work.lockdep_map, name, key, 0);

The two lines above can just be

    rust_helper_init_work(&dwork->work, func, 0, name, key);

> +	timer_init_key(&dwork->timer, dwork->timer.function, TIMER_IRQSAFE, tna=
me, tkey);

The existing impl of INIT_DELAYED_WORK uses `delayed_work_timer_fn`.

> +}
> +
> +__rust_helper void *rust_helper_get_dwork_timer_fn(void)
> +{
> +	return (void *)delayed_work_timer_fn;

Why?

> +}

