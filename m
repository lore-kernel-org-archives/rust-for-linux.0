Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020091.outbound.protection.outlook.com [52.101.196.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967474ABBAB;
	Mon, 28 Sep 2026 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594893; cv=fail; b=YYQhk1JjJNx53A0PW+FHvqul/0r1CrA1RRMDEsGFTKCx438nXjWLiaWTXYCO1utO7nEj1o6TcSlWttP81SOsmiTrxApslmKKHO0MVsKEY9wEIWQWKKpkTf++9Sf0JFBdH6xsDa45Yoimu1qgxE01ADrvBzPqlYT99J3o8CkrAVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594893; c=relaxed/simple;
	bh=e/mwI/NWN40AqgrBMZgsaoUwfOxDQYEFujVCKW+4XPU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BNcJm92IrtslhmO7dyyW2YNqyINz1PGaJhFthsPAej701d6poidlzY/7zSwFLuqBoSvBiNut62Uf354ZpquUF1IYeIgm/Y64N3fDcTrMYfgX4CKbdKoFfYw5iqoYFd8pKLLWG30kX2MoJIcB9+a0mhSwo9jWPwBR7kNwmR16r54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=z+StrgKj; arc=fail smtp.client-ip=52.101.196.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="z+StrgKj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+xPqvmwRDUxeQa8mfup0OhA8AiUYGWznxcmAGJvNcJbhsM7W5qAJbcJTJY6CqQjliTbMeHwkjTiOpzl/kTM01JyPPOcfqDaSbYSC8gSapNlIWzqcrq1P8LkkDwp1XwQyiorOJIgLTcZidYvuklFi6b8puNNG0EdipNiCJCHmFRtT3SbIYj4neTwZbrkf4VZrWRjlfAtL5okWcqh7tim7Ain20Zua+QjWWId8HE9lDRSDT9infA/ewtUdWsWHrGW3jfUMhtIwDGuayCpi8YqEWhYJMe6F/L0+rmLAhMsbqHg+TAq4/PDCbmXc2UULlMTWG1GDyWTZ4KkzX+n0QdJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6ceozg7uOiZzu3opVUwHpJCSkhFYSy4hKMpXM/5oTI=;
 b=qGjzOzoMWvJtcSjme1fbABQhOjdFMTtyRsnyB1y9OzNMQbT9nFJec+8YcCnmoJ5KRNDyhqsJDJ4A/3z3hdLf1bAQw8YB6xd45FUlKYQejQPJGVdi4EIwsaNuMlDacr+8KkAq944XHH4wQ2K3JMACEQamvJDAPyzXDu/XreD1sVBuyYJvAmSeQ9xLjkF4acIhmOaOgepa/80ojpRWtjuxa366Zv69wmJvxmzvf7pU3hn+7gma9qG2rIUB0PC4SG8eIRZK+FqAIxbRNxOmPNd5F+VnElEtNh82ompQ+m5AgfAIor4aqIqYnDceFM7sG91tpzzUu51mcsHSl1G7ZGWOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6ceozg7uOiZzu3opVUwHpJCSkhFYSy4hKMpXM/5oTI=;
 b=z+StrgKjRWKA+EKNcgERjErjqBy2wx4kyYAX1uu9qpogqxTrPTXyOalSFqJ/94+xkUCqpTs4oxBqL/tpAY71men2EW88vGlEqYO+OXSu26EhEl+g9dPyIniiLJwhZeCp/hCHhs5P6aTCelvIMkEhpVn2D3wSL+a3AJ824pETIK4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6349.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:28:07 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:28:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 12:28:05 +0100
Message-Id: <DLQWWUKZ61KN.1X8VCC2YLPD53@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260921115708.4009754-1-gary@kernel.org>
 <CANiq72nR-QzR3zOiV=RL4je4U8m_hCsPhOD3SxAcjc+4VCrMsw@mail.gmail.com>
In-Reply-To: <CANiq72nR-QzR3zOiV=RL4je4U8m_hCsPhOD3SxAcjc+4VCrMsw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0481.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::18) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 506f1c1a-cd27-4f8e-0b80-08df1d53918a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|7416014|3023799007|10067099003|5023799004|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	d5+cn/27hBay7ZSOc2LDkza27hcWTiYMc06vvU1yrzdr4LjFHCn0wpQCFHC9dP39d2ok2oHqzwMa5PvA/KzydYh46XToC3NycdozFWe0VvlDJsiAEFg3mLJ8VLszdtmWo9mzmk7uhh+9gy27K8vf08+jmnqjwnGz7CBHWJWih+HYzVswv85H7It9rwYHvdZXm8LC8PkgQBGLABxqBUt/vhf8c5toKw5QU+oGv/O1QH8GYi9fGfDeVb2bI2zTW6H2jLATXm6UM6tsTaKJi3mQ7bjf8MxzT4F1pme22vAfhv4Sb9nOzZjAsjOk1Y8fb7C5fJdGpSJtFeN+Sz0jWyzT3iyYpzFB5xQJRIKZa7i3OhFToZOb9UhmNJpC3UYmehH47HMSkxq3zVPKr/ZFGOb8CBPXHaTX4s4+jyEjQ1f5W3Inkxdvn9qLmMoRt4gD482R3xaIPIM1zCIYqnqVhGSeJ37scXG6xTVbHkiaSIaNobRAEMof6LLGL5rmyiWKqUlB9bqJJm2GFwBMzlZBIJF/NOHJYj6DFnu4YTMmSIgFcM7EPSC1vnOcxpYYn3O8bdOGuOA6CRSN3ROaVWOFm+VGBBNfqEumxaJtB9Tz4TKpqCKGeUU7W5TGzHG/kqVV6HskABM0lvs6RO+OBKYyGGBuFo11gz056bZYfEA7DhnxzEY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(7416014)(3023799007)(10067099003)(5023799004)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFJuUThZcXd3R2dNTURTcGNlRTFSbU1RaGx0WVFaV0luZ2M1bXhkYnpNSERV?=
 =?utf-8?B?MGxQYVFNZzdoMUFRT2JaY3RBS2p1Rk55WWJKclluNDVncEJEWE1wUUgvTlZr?=
 =?utf-8?B?YmVlRXAzT0tXQ2lRdEdYdVRiRlgvR0x0amhYaExaOEFxVmo3clhldmNzOXRW?=
 =?utf-8?B?Z2Uwa1o4N1JLeVdCcFRZNG8xUWVBamV4Zy8wdHdVTGNySFJ1dWt6V2dNdWRL?=
 =?utf-8?B?OVhrZyszdDRzSzBPRGhxWkpjVlZvT3N0b0F1Qk5tNU1vSStTeWlPditSd1R0?=
 =?utf-8?B?NzI4a1hWWDdFVi90dytQUU1PbVFUZDNrNnNIUG5qNDBJTTJqY2EzT3VPOTZK?=
 =?utf-8?B?dWtmVEZwZHVpZmZIUXV2QkxDUUNQR1RPSmZ4VURtNDZ3dFhoRWYrM0RkWCtR?=
 =?utf-8?B?K0xkakNtNGsrTDZmR2RYcUpSWHFGSjd0aEpDaHpIOU0wYTZia2IzS0pkQ0Zl?=
 =?utf-8?B?TWxPaFJtZktWR3RGblduMzZVSEhueGtMNUZXaGdHbTkyOUhWMFdxM0daRktQ?=
 =?utf-8?B?R0JydElMNzU5WEUzUkFpU3BTRHVGOWk2Wlh4T3cydmxMdk5XbWNFaTJKOEVx?=
 =?utf-8?B?Mzd3ekVFaUN3VjJkRjFQckk4SG45MU45M2RtZlQvMTE5Q3g5R2FqbnFXNnhB?=
 =?utf-8?B?MGFxNC96MTN2U3J2NEIzL0Vjc0pTSDV0Uzg5ODVTSFZ6a3pwSGFCQjFjVFdG?=
 =?utf-8?B?bzBFOW5GVzg3Q1hUWVdGSXVWa3hBMDk0ZzlxdUowQzBmZzN6T3JKVW1sRkd2?=
 =?utf-8?B?VmxUSU5nM2g2RWFuWjFieDZmNUtHcjZ1L0ZXWWR0RnpqaGNDV3FwVHRSMThP?=
 =?utf-8?B?SllvYTZkY0RNMEFCR05qWFJnUEZvYkpVbG9xUVlwSlZLUUo3OXBOSzdoNXpG?=
 =?utf-8?B?RGV2SXp6bjZoK05SbUh6QVduaCsxWEROVmFFZ1I1V1h1M0FsRmdmVHlHSThT?=
 =?utf-8?B?bFNPWjR2SGptMDd0U1d6cDZXV2g5RUFsTDM3bWVyZGYvdG5uS1lYQSs1TDVw?=
 =?utf-8?B?dFB1SEJ4UE1zZndDdHdZYkJKV2JDbkhYWWp2YTVvWCtqNkUvTDV4YVMxYUxz?=
 =?utf-8?B?QWRYNFFJVVVQY2FyekQ0TW8xc2NWTUc1TVBiT0NJeEVLbFlsSWR0YmdKNXFJ?=
 =?utf-8?B?YWFidDV4TkZ3S1FFMTNsQkdHYkxLUkpDWHBzaGF3ZE9TZUpDZElOMjkyTHBu?=
 =?utf-8?B?Ry95clNpNitiTzBJV21DWUdWNmoyMStXWmJRQm1OdnhLRm1FRjlYa3dLMlFk?=
 =?utf-8?B?OWIycmtPcXRzN01DM3BmcWY5eXpBbFlpaFRueWUxNnRURXdYRENYMVlWaTNj?=
 =?utf-8?B?R3ZuRXc5YzEycHBJeDhWOSsxcHF6cXNManZlR0tMRCtwUTlVT1ZBbHlubHBo?=
 =?utf-8?B?MDYrZ1hsVjZFU0IreUwxZjVJbE9pb2duV2gxV0IyWmtZWnVONlB1aGFkbkJi?=
 =?utf-8?B?R3k5VnhKY09nL056RnVVZGxSNDhJL3h3WDFJMTRXOExpQ1pZdUR3Wk9weGpZ?=
 =?utf-8?B?Rkh5QjZvV2dFcEhlV1NsSnAvdFNleDZoam1BOEY2Ym1DVEFINUE4b2xIa05E?=
 =?utf-8?B?MkR6M2dJdm52ZVczYU1YOVc5TnRvcERXU29vZERVdm1iUW8wTWNXc1BXLzdj?=
 =?utf-8?B?Y2FpMXdya1lGK0w4R0Q3RzVmL0g0YVBHSytuQ1dqeVJVTGhNUDVtdHYrRi9O?=
 =?utf-8?B?N3JGVUtDaHR5ZWlpRlovTlFJQWpkQlVnMnZvL0xiUjZTWU1EWnBqYkJHMDc4?=
 =?utf-8?B?MllrTWJpQkxQNThDVnVQMHM1bnRCMDJiRVZJZTJiY0llTitSczIycCttYmlw?=
 =?utf-8?B?OHNNVDFnM2R2VWc0bjFvK2kxWmo2eGNIVm1jZHBJOWF4Y2UyekVNd216azgy?=
 =?utf-8?B?OHRjWWlEbE9GaGxhU09oa291OWFGSC9YaGxyc0NmcmZVTVNRZE8vZmt2RWhW?=
 =?utf-8?B?akdaUDJsWVNJaTFOUnMyL3VUM1djekp3TXpYZlp1SzBTaU5WZkpmOGxyT016?=
 =?utf-8?B?N0FWTWdibWdoU25iSms3Y3IyalBtQ1grelVlQVZNWjFZVitwMS8zZDgzaXlQ?=
 =?utf-8?B?RS92WG5lWHlOcEFCbmVyN2ZkdGh1Z2FWTXNJYk9sNzI5cmVhTS9zR091Y0pY?=
 =?utf-8?B?VlZ0QUM5dWttc2t4cFhmY2NiNWRybldpdlRNZXVzb05qdVNrSVpZUU1YUWtO?=
 =?utf-8?B?d1o4MWlNVEpKN3AwemdScmJudzBGcTJOQzkwYzJERW1CeXUvYjVBYnNwUFlj?=
 =?utf-8?B?TXlZMWpabWk4T3JpVUppampGdEVtc0lHSWJWamp4S0xxd2xZaHViaGlMT2Fl?=
 =?utf-8?B?ZXV6eXlhcVVUN2YvTXRRRlJMMHNkUGN3SGxvR0J2emFnVTU3NGU2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 506f1c1a-cd27-4f8e-0b80-08df1d53918a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:28:07.2444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APzsCpi66Ln8ebzisWxaFSCDxnb4VioI6jCK0Xl5jDm/BIg/RQ10CfZvEePyNfORi6eFf/21jpsVbV0enw3/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6349

On Mon Sep 28, 2026 at 10:31 AM BST, Miguel Ojeda wrote:
> On Mon, Sep 21, 2026 at 1:57=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>>
>> Miguel, please let me know if you're okay with the proc-macro2
>> modification.
>>
>> I'd like to take this via pin-init-next if possible.
>
> If you think the diagnostics improvements are worth it, then I guess
> it is fine. The ones in the commit message do not seem like a big
> deal, but I assume the upcoming ones you mention in pin-init are
> bigger improvements?

Some examples from pin-init's diagnostics test suite (latest development tr=
ee,
w/ selfref feature):

Suggestion not matching the quoted span:

    error: expected nothing or `..Zeroable::init_zeroed()`.
      --> tests/ui/compile-fail/zeroable/invalid_spread.rs:15:11
       |
    15 |         ..MyZeroable::init_zeroed()
       |           ^^^^^^^^^^

vs:

    error: expected nothing or `..Zeroable::init_zeroed()`.
      --> tests/ui/compile-fail/zeroable/invalid_spread.rs:15:9
       |
    15 |         ..MyZeroable::init_zeroed()
       |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^

Attribute diagnostics confusingly point to the `#`:

    error: `#[pin]` attribute specified more than once
     --> tests/ui/compile-fail/pin_data/twice_pin.rs:6:5
      |
    6 |     #[pin]
      |     ^

vs:

      error: `#[pin]` attribute specified more than once
     --> tests/ui/compile-fail/pin_data/twice_pin.rs:6:5
      |
    6 |     #[pin]
      |     ^^^^^^

Self-ref pin-init variance check points to the ADT that is not the problem.=
 In
this case, the `dyn` is causing invariance. There's no way to actually poin=
t to
that specific part, so pin-init wants to point to the whole type and let us=
er
decide. Without `join`, we can only point to the first token, which may con=
fuse
user to think that is the issue:

    error: lifetime may not live long enough
     --> tests/ui/compile-fail/pin_data/selfref_covariant_check.rs:5:14
      |
    3 | #[pin_data]
      | ----------- in this procedural macro expansion
    4 | struct SelfRef {
    5 |     not_cov: Box<dyn Fn(&'str str) -> bool + 'str>,
      |              ^^^
      |              |
      |              lifetime `'__short` defined here
      |              lifetime `'__long` defined here
      |              function was supposed to return data with lifetime `'_=
_long` but it is returning data with lifetime `'__short`
      |
      =3D help: consider adding the following bound: `'__short: '__long`
      =3D note: this error originates in the attribute macro `pin_data` (in=
 Nightly builds, run with -Z macro-backtrace for more info)

vs:

    error: lifetime may not live long enough
     --> tests/ui/compile-fail/pin_data/selfref_covariant_check.rs:5:14
      |
    3 | #[pin_data]
      | ----------- in this procedural macro expansion
    4 | struct SelfRef {
    5 |     not_cov: Box<dyn Fn(&'str str) -> bool + 'str>,
      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      |              |
      |              lifetime `'__short` defined here
      |              lifetime `'__long` defined here
      |              function was supposed to return data with lifetime `'_=
_long` but it is returning data with lifetime `'__short`
      |
      =3D help: consider adding the following bound: `'__short: '__long`
      =3D note: this error originates in the attribute macro `pin_data` (in=
 Nightly builds, run with -Z macro-backtrace for more info)

For some spans we try to point to the full operation, where first span can =
be
confusing to user:

    error[E0277]: `?` couldn't convert the error to `std::alloc::AllocError=
`
      --> tests/ui/compile-fail/init/no_error_coercion.rs:18:15
       |
    18 |             bar <- init!(Bar { b: 42 }),
       |             --^
       |             | |
       |             | the trait `From<Infallible>` is not implemented for =
`std::alloc::AllocError`
       |             this can't be annotated with `?` because it has type `=
Result<_, Infallible>`
       |
       =3D note: the question mark operation (`?`) implicitly performs a co=
nversion on the error value using the `From` trait
       =3D note: this error originates in the macro `init` (in Nightly buil=
ds, run with -Z macro-backtrace for more info)

vs:

    error[E0277]: `?` couldn't convert the error to `std::alloc::AllocError=
`
      --> tests/ui/compile-fail/init/no_error_coercion.rs:18:15
       |
    18 |             bar <- init!(Bar { b: 42 }),
       |             --^------------------------
       |             | |
       |             | the trait `From<Infallible>` is not implemented for =
`std::alloc::AllocError`
       |             this can't be annotated with `?` because it has type `=
Result<_, Infallible>`
       |
       =3D note: the question mark operation (`?`) implicitly performs a co=
nversion on the error value using the `From` trait
       =3D note: this error originates in the macro `init` (in Nightly buil=
ds, run with -Z macro-backtrace for more info)

Another thing is that pin-init's diagnostics test suite is built with Cargo=
,
and the build script of proc-macro2 will probe if the nightly feature is
available and enable proc_macro_span automatically. So if this is not enabl=
ed on
RfL side, the diagnostics can diverge from what we expect.

I think the self-ref one is the main motivating factor, because the diagnos=
tics
with that can be confusing in general. That said, I have improved it much o=
ver
the last week, it seems that it is not *that* needed anymore.

So, none of these are really big deals and that can be said to diagnostics =
in
general. But I think the change needed here is small enough that any improv=
ement
can be used to justify that. I also submitted the proc-macro2 change upstre=
am
too: https://github.com/dtolnay/proc-macro2/pull/542; if that is merged and=
 we
later update proc-macro2, we should get down to just a single Makefile line
change.

Best,
Gary

>
> (I would also probably had shown the improved example outputs in the
> commit message for comparison; and especially one of the upcoming ones
> if those are more important to get right)
>
> If so, then please feel free to pick it up, thanks! The change itself
> looks good.
>
> Link: https://github.com/rust-lang/rust/issues/54725
>
> I would also wrap the `README.md` like
>
>   identifiers, to remove the `unicode-ident` dependency, and to build
>   with 1.85 with nightly features enabled.
>
> to keep it like the previous lines.
>
> Nit: "a overall" -> "an overall"
>
> Cheers,
> Miguel


