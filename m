Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021117.outbound.protection.outlook.com [52.101.100.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889534029E;
	Sat,  4 Jul 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783183961; cv=fail; b=mcSujuh53cm4wzh2bW5NkWgaeTLQy5hZWkeC/5YnuFfXCqpZEK6Uj3CmpShwIGJ49lR4aANjDkD9UXV3pnsVvddRC4iPkXqR+PoPY2MqBBhKs/fDooVLV6LdT3IogQEe1FTz+hCo3loIpEZWFQ17T7MT7ahNyREFAe9EOfUv9q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783183961; c=relaxed/simple;
	bh=Qi0q6jSwVlkoS9ffDKbdzK83SPdaTzo9ZFIum+bUe4Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SjNnfGtRKYb3WyVmb3GTLYNpXIbDIAJgVUprGLtlFkjb3zv3vakLZNZu8k6Gj/V/XDH1qIrgXnjByQVpFLOMYOS1ScHdq33eDjo0guKyLercuvnvKsV/Vwqgt9PZsblbDRCDiRSePWp9i1pfjFEyQ3R2sF6KdPUW0eXRz73jmhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rXxMrmvr; arc=fail smtp.client-ip=52.101.100.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rXxMrmvr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trDkx899dc/tfOeqFZ/5DXl+L1u2LY9IgkRBqXItRE2nMBrhIS47S09PF0v/A5eVvxIdmiQrmQMf3cmqqb9fQTo7HszHsTArz5AegEBSczeEWM1p7AVQ/fSwRAVrtGSfDf3+VFuj7KHfrrTV/oh8y/CR9phunJnyDflLrBJZMD7b8lv3xxxPWtiuhfcG7buX+Z8sHVdQeNL2SO3ABCI5oQ3Y6C8kkIMk3ACnnwzEylWvnzpMD999ASdPebP9Z7xtDLTf4UQRgbNMHNZckjEoves59YfUUoEmm7vw2K9APKdaW6bSYKeaUu2kjCdZj7XSUVTmAd31a3gxFAvJkvOsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m1ZfbN7LahvYU2Hz+3So8A9/G0DPcmNoQJnSIBk+x8=;
 b=YzWL+lXjEXwpcFaEuxnKuQI5wWdTaGTkwkUnRNroYgO01AbRySonUkfJA+aRTmM2x0/ufULJnp3M87T3YAoZdSJdI3pcuDriEGVfPrh6/YOS4wejKIf4+TGA6DS3oKJfLXpzpA8Y1C30r9xWDdSRVB6hDnLCCMg+7OrtvJtCsF34GXWYMaMU2WbjL74CNjsWwRVtAjYCcctBUkch0cFvsxcpRcI1fmbCkb1G9mXkWy8xIrr6ZGMA+MTYxaHz7b6sm+9wSDLjtKnIcNa+GelsEyO6G6MrQ2Z9QbfCncmOVzn1Kv9GAqoc0X/2UCWjNwxyBOKeP3ccakZ9a1D1MTMb3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m1ZfbN7LahvYU2Hz+3So8A9/G0DPcmNoQJnSIBk+x8=;
 b=rXxMrmvrhvBGAPQosJ0hdEj5FKmLoWN4+hHYP9Q+h1QTUlEmgR5/q3GMIogjhAu31d56raFg6+qmqVApD5ISEkU4rh7GKFX3xLCUhZGYyDHFyckjXavIiu7LFFr02rcpZh3AIASs4lUzjpQNUb365Y0fItBsIEc1kfxskXG7o18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9125.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:491::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Sat, 4 Jul
 2026 16:52:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Sat, 4 Jul 2026
 16:52:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Jul 2026 17:52:35 +0100
Message-Id: <DJPXYGA9HD3B.30I15MLPUM7DR@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Waiman
 Long" <longman@redhat.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] rust: sync: create lock class using
 `#[track_caller]`
From: "Gary Guo" <gary@garyguo.net>
To: "Peter Zijlstra" <peterz@infradead.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
 <20260703140140.GE651302@noisy.programming.kicks-ass.net>
 <DJP06ILK15W3.2XGWM3VAKNF04@garyguo.net>
 <20260703223242.GS751831@noisy.programming.kicks-ass.net>
In-Reply-To: <20260703223242.GS751831@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: LO4P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 637303bc-3968-42f5-820c-08ded9eca683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1ARi0Gl40Lmxo2nOkzCnfO/4jIAC+P1OMcDewVeoF45fpxR6hMcRbQ5fKN+iXz9iyoXgxlBb6Xe35Jv+Wzso9Le5P9gAPER2SNasn0ocbQxFXx/5mnjGoA7cgA3jEagyDlC+hNgk3OqgLsGQoAtb2VUTLA/OXo/H/4k8C8Mi0w/iURlH67tjKgpDyW8CQw+hTKXM44YsXcJyQGkTYYzG9tCq6siz4iiLNnQHhz8NhFu2Fmx2IygGa6sy8HQd/LhAjfxhgwiwgQ9K01xsaCcRHiPUJYqJFpjcVngHC8fubdkeg36k9bAadPYwDcNYFRqM8nyKX7kFA4LRz3MSufiAlrDXVL+ubycohvYPGgQ1ltBpUf6F8WsZ6R49PKW/uj8waaGMXBYAvtIL31KLQJjfaccekla+mUB+wqhq0PQnYbgZe1DRIyly++N9pCJCTS4ciw0Sdkxd3HIR52grCNKWjy9sdr+JU1LgsRlE6nI9sz0vzqCJSdbuIJvq/7NcfyBeFuNCBcFj0FYgCP7vRDB5QPFeIl68f0+iZhvBX8VzzzFQEuYnHHPd7p76M+ntOUqdsjNd8T2ILrItuD3WaXzywsr+ylp3lMlOrRrlgvmaTpSb9LlPfr6WoPpvhbs+ft0Z0XfNx+UvgIWS59YpOdjT4Dx7ll4JQCejMGTolPnKGeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1JUZVRqYmErT1VCRndaRGo0TC85ck1jSm9jaEVqTXB6UFJNSkVzNE9xcjdz?=
 =?utf-8?B?L21NRHMyRktjcFlBbWtwUWJaV3dPV29uSXNlbHJ1Z2lieXNUQUppU0NmWThs?=
 =?utf-8?B?VjJPR3VxZDVtdzh2R3pFRG9HeWtQaU5tMkZZakJkc09SMktMeWRDeDFUVVVD?=
 =?utf-8?B?YVN4N1BBQ0dGZEZOd2VnQ2FOR2VBemVqUlNwam9uVFRid3QyTVk5LzdZU0lq?=
 =?utf-8?B?K1Qyam9mSUd4Ui9Pd1lzUHo0SnBVd0ZYRE9YRE9HbXd2Nmw3dkZ0SkxWOWdY?=
 =?utf-8?B?bjVpTzhmUkxiZjdWV0x0SGxYSzljai9GSVJ1eWRDeENJNE9RUWxFeXU5dTNz?=
 =?utf-8?B?NTk4dm4yMmU4M200dkpiZG5sb1lDWnBKalZrSmxyT3VpYjFZTmRncStUNmFR?=
 =?utf-8?B?bkNZZEU0SW4veksxR24zdTRwYkNFNTE1TWh2TklCUWdKYm9aZitBVlhOQ3Iv?=
 =?utf-8?B?U2ZIZXBYY3h0cXB0d2FVL201VGYrZWo5WDNndjNpRmcxb3Q4Q0Z0R3YzalAy?=
 =?utf-8?B?YXQ0ckxtU1A4eTArWXhBMUZRS1E3VjFEMWh3V0JnVVZ6UUxKSkRLdS9WU25B?=
 =?utf-8?B?dmN1cWJuTFg0aS9kWkhHZUlpY2FHNDlrQ2ZIdjMwUjlLRkszMVdXOVF0NTdO?=
 =?utf-8?B?OUpFN09jSEF1T2tEdzd6d0JWMU95blpGc081YXc0MThjQ2FxMWZzOFpVcFFM?=
 =?utf-8?B?M3FUYVFTanlmMWxGMEY1aFo5aTIwRTJHZDFmNlcvZlJrUE5RTDlJK0JSVTNs?=
 =?utf-8?B?WmdTcGVMcGQ0RVN5YU0wb3RLUWZ2ZEdXdGhiaVBaNjBWY0R3TkViSWRIZ3JE?=
 =?utf-8?B?cnYwbTN3K3IzalBNcW1kKzhmZEQyYklWR0UwaHlLQnpHNmgxRTZFSXBxczhG?=
 =?utf-8?B?K3RKWTA3d0JMSEpzVC9QNk8yQ01oYXBEQWNuNHVjdVV0cFkySjJ2ZE5XUHVX?=
 =?utf-8?B?a3dYTU9IREp4UTNJUkZKeGlDZGZWS0RwQkNqUzBmOWV1RkdxWGtyWlBzZUNz?=
 =?utf-8?B?Rk9LY0dsclBMaTJiek9IUUd4dGtqN2NjSytuREt2QVlaMDNFNkl1YklRc2pS?=
 =?utf-8?B?cTlMb0lraUY0S3JxSmFIL2dYbGYxVXVGeXBUWGFJUmFQY3grQlVpdjdPMzRm?=
 =?utf-8?B?bHRXWDNjZDZjNzF6Y1ltRHZ5SHFQS041RTc0OHVUeWxJRmgxUlRUdzMxUFJU?=
 =?utf-8?B?c0hFdlR1ZXg2OUF4MnlNOVZUekdpZmNCWXRxZ2k2ZkdGendvazRRU0s1UXR1?=
 =?utf-8?B?WjZGNG43V0JtL3loVmpyeEtGbm85Vm15eXVmb2drR1kzTHd2alFiTWQ2MVBP?=
 =?utf-8?B?ZlNOS3RUY3YxeUhtTXJYTjZPdEFLZEZXMjYrbE1rNXRDTzJMMlRsR3FMcGVZ?=
 =?utf-8?B?OEdaeEl0N205amJoZmU0aUxVVzk1c0R5S0VPcmtrZ3FlVHVQTENpOXNwUndi?=
 =?utf-8?B?TmJDZXNHalRtYlhabElXTmorVVE4Q2o2d0pLQkpaUlBnMTRjK0pjTnBrWUxT?=
 =?utf-8?B?VytDcjBHL0g4ZnArQlBtK1YrcTd2NzVzblcwZEtUaU9zSXNJcUI1cUl1T282?=
 =?utf-8?B?UDNQNWFORGE0bEpHSDlHV1kvNEo3S3N4d2h0ckQxeDlxd2RqamFDeVBoZUE1?=
 =?utf-8?B?MEN2U05wV01ZZHJOaWZXR3k1WHpOUnd5VXNIVHAwZnlnVEJQTGpUQVIzMjhK?=
 =?utf-8?B?ZHY0TUZ5YnR3Q3NiUDJzQlNpUjcyVERyWGxlU1BKY1NBZlV1YzVrQnhJOTE3?=
 =?utf-8?B?OEVCd3g4ZTFSV050NUtWTVNGSGJWTDk3aE5ZbDR4ODJPTnVCU1FSTjBDQjJl?=
 =?utf-8?B?V3pGNEFlRFhES2p5U1VheGcxNU9maC9wQUhjVHNpbFBidjZab2xUOVhiWW5S?=
 =?utf-8?B?aDFVN2YzQWNQQnBZTDA0U0pUOHpVbXF1UnUva0puQWF1YmRrZDhPdmhqQWdp?=
 =?utf-8?B?OWxpWGNvYXI2S1dYdGVNM0lzOFFRaDEzSEw5WVhwaDRTU0ZJN3VmQzdrOVdl?=
 =?utf-8?B?U0k0Y3VSaWRtVXlpOTl0cnVEc21Vb2F3T3BRTnlnKzd4UGJqaHN1MzluTGdn?=
 =?utf-8?B?MC82THovSHhrSUtWL0NFTVIyWnc4b284RkMvOURTREJjWFB2cVYvZ2M3Rkdq?=
 =?utf-8?B?LzR0T2lCWEYvZVprT2tSQjBMcjNGUGJ1OEVOQW1yV1hKRGZ6bWhlV0VGQm1G?=
 =?utf-8?B?eGJxNHJnNXNsaTd0WVFxMTFYdkdyNmk2VjIwOVVFd1lqcURmZFBZNXJnd3lF?=
 =?utf-8?B?bC8ydzBnSm1rbDBtYVNmTTI1Szk4SjhSQWNZWEN0YzBDQjVpcWZIWENWMVY1?=
 =?utf-8?B?U0N4TW5UUGRpQ2tzTEhSRXdMMkNKK1psRU9qelJGajJFc1JqL0s5Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 637303bc-3968-42f5-820c-08ded9eca683
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2026 16:52:36.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH4CAsbtOY8dqV3oH+4t5zAEX6NkbGQl2He0lRSsxVXPr7Su8jXDcC/ZXGC9rLgUiEwlC8utkAEXzXjgnaJScw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9125

On Fri Jul 3, 2026 at 11:32 PM BST, Peter Zijlstra wrote:
> On Fri, Jul 03, 2026 at 03:24:29PM +0100, Gary Guo wrote:
>> [snip] On the lockdep side,
>> essentially the name will be "(rust)", while the actual name can be retr=
ieved
>> from the lock class key.
>>=20
>> So for
>>=20
>>     let foo =3D KBox::pin_init(Mutex::new(42));
>>=20
>> in, say, foo.c:123
>>=20
>> it will eventually call
>>=20
>>     struct rust_location *loc =3D /* static generated by the Rust compil=
er */;
>>     mutex_init_lockdep(foo, "(rust)", (struct lock_class_key *)loc)
>>=20
>> And when "(rust)" is encountered as lock class name, instead of printing=
 the
>> string as is, lockdep will call
>>=20
>>     lockdep_print_rust_name(loc)
>>=20
>> which will be doing essentially
>>=20
>>     pr_cont("foo.c:123");
>
> That seems quite terrible. The C names are based on the expression used
> to initialize the class and are thus somewhat descriptive. But file:line
> combos are horrid identifiers for locks.
>
> Why would you want to do this?

I do think this is not ideal, however the current code is already doing thi=
s.
This RFC series isn't changing the name at all, just represent this in a
different way.

The reason that file:line is used for names is due to the fundamental diffe=
rence
between initialization in C and Rust. In C you create something uninitializ=
ed
first, and then initialize it, and it'll be UB if the value is used before
initialization or (for some types) initialize a value twice. In Rust we use
pin_init to ensure that a value cannot be used uninitialized.

The way the syntax is write out currently is something like

    pin_init!(MyStruct {
        my_mutex <- new_mutex!(initial_data),
    })

[
    which this series is turning it to

    pin_init!(MyStruct {
        my_mutex <- Mutex::new(initial_data),
    })
]

as you can see the `new_mutex!` or `Mutx::new` does not know where it is go=
ing
to be initialized to, because we prevent people from being able to name a
yet-to-be-initialized place.

It is possible to use the C approach (which early days of Rust-for-Linux do=
es
use), but doing so require a lot of unsafe keywords because you are relying=
 on
the programmer to not mess things up, instead of having the compiler check.

So the best alternative that we can use for the name under this constraint =
is
the file:line combo. It is less descriptive, but at least it does tell you =
where
the lock class is used, so you can still trace it back. Given lockdep is a
debugging feature, I think the less descriptive name, albeit inconvenient, =
is
not a dealbreaker.

The trade off here is the convenience of creating a lock (safely) vs the
descriptiveness of the name, and I think the former is more important. It i=
s
still possible to explicit give a name if it helps (Binder is actually doin=
g
this already), but this currently cannot be implicitly created.

Best,
Gary

