Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021116.outbound.protection.outlook.com [52.101.95.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC3369D45
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544403; cv=fail; b=meCcc60K6IH0BbK2RwVWnL4kcg64BWj8F4MZXYHAUwtB8Kkww7dP4eelWfiesxTkUF9SpE91/E6lkIlAOQKCCcj1y13Pv3VKbIpZgxk4M42xKmMicLkaJR/FcGtCE3dosK0CN//BDUrO7M/Iu6vzKb7gHw+53DVOHdXKG/kmtpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544403; c=relaxed/simple;
	bh=xRT4ZW3Gy8yvIvMsWW2lkEA6lC414mYtog0iOAFTtWM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=myYnWJyMvyxGRHUcdecH85uUyK8RLogOa+u6Tn3mB5lFHWmoGJ2RUUiQ18r/lFRcFb9rFjH988DGfdQE+NwFAF9KEshpoIg/NzmaRv6SPiBscRJYdsN+u730nqhGYnA/jiAIxZaYlGfVlxlL2UfQLSJnWWhw/PYnVQwIapHIrm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iH0x2bZC; arc=fail smtp.client-ip=52.101.95.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iH0x2bZC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwKyZWO2Um1v1VeS2C+kWTFu4nXhyI4wvzNMYo06FhSFWY3veV6aw3GekyBFXIbKZ8IgNL+lB/48V6XX93om+LzCE1ETyH+XJCsz+ufcrc8TlarYDx+FWE2r6g/CXCoAkzYhI1wq0saNcx/z0jYjhKmAgqz9aA50ECx5TFGUYNPNi/cG7rnvYSPxhUzIlZ15kCqR0lwZhp0zkh3f2GQeWKkJjcww62a5r5If8A2QlUOA0xYZb44zuNeXqFevLdxGwaAzE95ubCo92eDvGyHQY9lu4ko7Qvs4QyOV+IQ+uOyCGIdLE2rfrw0wU7JbtnVjcRDrGh8YpvKJcHfu3jRvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GtTu8/IQ1bhEuOOy1HJSj85G1Mw9Gzrcmo/tP36Y9o=;
 b=q3VT9XrSaimC9yjTg4rYmw6iAgf8TP6WVO1dE5RLW7V020QlIBEz3GLATP3U7ebDqFJItqYRY/lsD2hxOFMKL2+AAG74uKtV3oZbMR8s7iEtbTLZ/GpECo8LK3XFAloQsm/aQLCg8MbWNlrwZiQ0yKpB0/hOhKJ4mSbdlRrwIBULCfsoU4dk0FO3iqmsrsrlPDKvqw0PdjBuAjoKG3P4RfGjU9eKcp6RIIIL2uG95boBU815geWQgPJHrw8JvJ3LcQ374u4WQBpPDRWxiDh9NefWB9Z5aUPPa7tld5Sx8rSRWuka3v4qDrdspU6WJaZHxm4bdUITjSSYZ+m46JXXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GtTu8/IQ1bhEuOOy1HJSj85G1Mw9Gzrcmo/tP36Y9o=;
 b=iH0x2bZCkZbNYwJ0CEwTG2Cus5XlsOHN+EC4z++ik2T4ULSCN8baIC+ZUWkF/yMcE17Q3uVMlGuVyMatRJhSIrTstHYZJxZVraG1gneTbn0SNj6lwl+SSyhiaW+4t32VDOXvnnspXLeiUdVgKy6Vo2h4hnZdyez51Mo/E+9VMQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB2209.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 07:39:44 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 07:39:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 08:39:40 +0100
Message-Id: <DLGKJEW56ISI.4GL4YOSP4AY0@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Asahi Lina"
 <lina+kernel@asahilina.net>, "Martin Rodriguez Reboredo"
 <yakoyoku@gmail.com>
Subject: Re: [PATCH] rust: kbuild: export symbols from the `uapi` crate
From: "Gary Guo" <gary@garyguo.net>
To: "Alistair Popple" <apopple@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260909060623.888777-1-apopple@nvidia.com>
 <DLAUS65AAH2A.39ZT3OE05AR1K@garyguo.net>
 <aqIQNhGdRTsv4v52@nvdebian.thelocal>
 <DLBLTKG6KVE9.VNWH1D3896J6@garyguo.net>
 <aqnqBivf3is_1N7x@nvdebian.thelocal>
In-Reply-To: <aqnqBivf3is_1N7x@nvdebian.thelocal>
X-ClientProxiedBy: DU7P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::12) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB2209:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c2226e-3730-41de-9497-08df13c5ad16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|6133799003|22082099003|18002099003|56012099006|5023799004|10067099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	1UN8P3uhd/qSNkioWz/RKkXdBLaEjD4pwdIJWOKCedE88ieWTi6r8IoWXGpgAhUex7rURy3qaJnwrzeKDXPWJzamT8vEaIJm4gd7RbVZBpob/saEBrQnlY07VLBuoHaYvWEbTzoKXABiKrgG1WDacgZlyU30HnJHFXoCUrCiu4KbngVpv95jGrDw9C3TsqfaKyOZiHZavwlQm3bpx/VTvahbFeBnR7932k75JuZUK79cTEsl+A0/KLkCnZ99bvnwplNXstDAGjw07FXXxyKYhWDoFx1soYitNbkWwnEl1oqmLm6i0HfdEx+Gbj4o5eonPSOwXUWtbpWefyLLtMYPbDgXGHF0vQ1BOMkobARJAs5lXLgFITw1iRAmohmgsVVp4NeBiA6VmSTDfNqBeKdK9Kh7ZXBvdGOh2Hl520IrYYN/XCcqSPu8Mr6iG4uUoMSVidiJ/0kXoj3T9jQtMXveH648rUqP7Myzq1wZ3xoE2MKhRvfF0cA1TAXVLfDRhatRtEeWaj/+QQU1y8kkVMiS9BnGbXPYlvQM28T6hfk7K6oFWVaxcpbuf6UYsreKchvKLLL2DuzQrkjnzjJVcECXgQdT7mlcMuWjo7KMS1vZKoqLgsKTWhw2sebbfyUbnACDtvoPKl5SkGPR4dpX846DgL6Wllj4ITI+5D1+THvGMgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(10067099003)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUZtUWJwT0c0RFJCOFBUdnczQTFCaFlaVTlQMFV2cnVkZWZuanlsK1FqSFlK?=
 =?utf-8?B?a2xMdUNMQjllVS8xZXBaMGZjNVlhTVFKd3BDREdZekZPMkZ4c0RqUzJoeXds?=
 =?utf-8?B?bGhiajFRMk5OYWxBQy9sVThXS1NRQjdBbFNCcTN2ZzcrOGM1WFdxdEhTbU9w?=
 =?utf-8?B?ZHA3cFJyVUFocU9MT0lqZ0s3T2tDMjJSZE93TVpCdjhXWFNQOC9OZzZPbDZP?=
 =?utf-8?B?emU5eUtFTElEWG5UUFhiU015SFJ3dC9KZTIveklaYTFsTktCb3Rub2cvU20w?=
 =?utf-8?B?UmF5YzhBb2tXZHRWM2FXVS9nd2tqdkVuK3MwUWcrWlgvbmRNeXBkaEdXUUR1?=
 =?utf-8?B?WVhJMUhaYXY2L3pNMm1kVk9kRTZkeTlhaC92NWFMeGlCYWUyc3MyN3F4NGFD?=
 =?utf-8?B?QXFUaTljdXlLVDQ1SGVMN2dXRlhBQjQzU1hlVThoUGpvWDUzUnVIU2NiRnVS?=
 =?utf-8?B?Z1VYQ25NTVdpZHJPR3N1eGhDQXZBei9DQm8wcmNNNy9nUk95WGMyZTN2NTZR?=
 =?utf-8?B?KzJ2Wmg2UlBsNWp6Q0ZPQlVMZlNPczdRN3ZKYlJsaWJRZml5ZG1PZ0hEZ0dl?=
 =?utf-8?B?RE81dnRlRGtVSHdtTWhDUXJPNU9rTEpXVXBrdSthTEtHOUQ2WGdLaDVZS1pk?=
 =?utf-8?B?T0hUSVZtVDBSSUVGOEtsWUlaZDJPWUdncDM1cVFKckhWWTJmcXdIeko1bzQ1?=
 =?utf-8?B?djdySU9PRXZUWnd1V3R1a0ptUUhQbTVobmo2NjhlZEtObU5QTEV4SnVaTDZq?=
 =?utf-8?B?SFl6YnRxeFdZdUxNVTZ2TEd1Rlp0R1hXTktEK1lIRTZBa0IzQUN3MTNMQkJG?=
 =?utf-8?B?YXB4MjIrL21vNmhUZ2hGSUtianhYV0VDeXRQV0VxTkp3ZWtDRTRVOThaNDVs?=
 =?utf-8?B?QkVQNTEyQklBUVJwdU1BSk1xbGhnd1JGWVYxbkJzYVlrb3Fvb0xCeGhTUzdl?=
 =?utf-8?B?eXdEb3NMcVByeGRoS3h4RDhLZ0xLLzN5R3dHbUV1N1FmTlZWeGxnTkUvM3E4?=
 =?utf-8?B?bUdOdkp0dE9JYjcxdXdmZEw0eFhhSkV2emd5Z1k0SnFCcFU4Q2N4Z09QQlVF?=
 =?utf-8?B?R3RVMEJnbENoMHR2UndCdVpjcW1UWFVobXJYbzFaMko1RjNZeGxPbEZrMU9P?=
 =?utf-8?B?SXA3UkJqbXhCb0R4THhGSzdKS0pZN0NrNXllM0pSQXk1dHdNdEQzNDFyZzZk?=
 =?utf-8?B?MnVoVmZQck9EYXN1ZXVJR2xKQ296WitubHNHMkI1dVAzSlNHWTBPM0haSDMx?=
 =?utf-8?B?cVIxZytoM0VpMUZrN01nbkFzc1pyc1NxT29xbHpmRG9PMXh1Y3E2bVJ1SkYr?=
 =?utf-8?B?dGYxWEhWYkVxMU91TnlCL0xQdXpHeUR5aTdvZ0VUK3o0OHdjemdzUThEeVAy?=
 =?utf-8?B?cHRhWFJaNmlzUFdscS91SEdPN01xK09CMWZkbUxTdXUwNXV0RzVrL0xFRlRw?=
 =?utf-8?B?YkdaY3ZYWTB0T0k2K1BNLzRsNzkvSXBickw2WWxGOUNTQ2dUOUM4bjk4emw4?=
 =?utf-8?B?djlEb1NkZy8rREtyV0orYURNWWpHR09PWmZZNDFJempzczl1NHhXZmlSSFJy?=
 =?utf-8?B?QUVGbWZMd2RwSmFZb2x1RllxUUNlZTM2ZDRtMXFzUGplZ3UwdUh2QWtEcFZr?=
 =?utf-8?B?SjdNYUdpdUVmbUU3ZTVCTkZjaHdRWFFKOW1EcDQ4dFo3Qnd3TC8zSG4xZUlV?=
 =?utf-8?B?SG80dm01YXJidSt2Wi80MHBOUmxiTHBlTUFxb2diMlNVUjBHbURDSnlhVDlo?=
 =?utf-8?B?QTdLeXpmVjZtc3dUQ0szZmV5eHNHcVc1bWpCYU1FL1I0YUdhbXkyNjRsSXlW?=
 =?utf-8?B?RTNkYkxQY2E4MUNXcDZndjFnaUhuQkZrNTk1b0IrYnhCQ1MxSlI4akJTMXA4?=
 =?utf-8?B?dDA0ZUM0UVRxd05vcjREanZYSS9SbDlnTVBzZ0VkR1Q4TzUrVmVxQVlSK0RE?=
 =?utf-8?B?NmtKaUNHbTlIYzIweFZNWlNPckp5aSszQ0EwMDBlcWFwY01yWU1tY1BKUUQ3?=
 =?utf-8?B?MDZ5UlhXQSt6dlFMVlQzYUltMVVUekJxRHArUEdEMUxMQzM2TGVvVXlKSnJQ?=
 =?utf-8?B?cThJMCt4Vnd2Y3piSCsyekJ4OUp3SEEzZHdpSnhlNWlMWTRndEd1ZG43dENz?=
 =?utf-8?B?T1EzZzFQdmt3TU0zSjZ3bkw4aTBhMjJrcEdocXdBYzRndzg0Vk5SSS90dUM2?=
 =?utf-8?B?bXNzUmxGR1JSNlZuaTk2QTBkUGQ2cmZsOEY4Nkp4aDZFbjBjL2RkSFhmL1R2?=
 =?utf-8?B?a3NDZkcyWFMxWFVQanhCRmJCZFhJZWJsVWVNZXBMTTUwaW42MVNpRFBoR1Nt?=
 =?utf-8?Q?ni7mvlP50jiTEp4riQ?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c2226e-3730-41de-9497-08df13c5ad16
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 07:39:44.4167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rU9lU1OfLqIx0vWBf7rRexD6uEtLOrfZSx40ztKfPnNp2mIojp47wOsfBLhw+k295t0SeAArtQOTMhLh/3YOMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2209

On Wed Sep 16, 2026 at 2:25 AM BST, Alistair Popple wrote:
> On 2026-09-10 at 21:36 +1000, Gary Guo <gary@garyguo.net> wrote...
>> On Thu Sep 10, 2026 at 3:21 AM BST, Alistair Popple wrote:
>> > On 2026-09-10 at 00:25 +1000, Gary Guo <gary@garyguo.net> wrote...
>> >> On Wed Sep 9, 2026 at 7:06 AM BST, Alistair Popple wrote:
>> >> > Symbols from the `bindings` crate and the C helpers are exported so
>> >> > that loadable modules can link against code the compiler chose not =
to
>> >> > instantiate in the module itself. The `uapi` crate has the same pro=
blem
>> >> > but nothing from it is exported.
>> >> >
>> >> > In practice this goes unnoticed because the only functions in `uapi=
`
>> >> > are the trivial `Default` implementations generated by `bindgen`,
>> >> > which rustc inlines across crates. With CONFIG_RUST_DEBUG_ASSERTION=
S=3Dy
>> >> > however, the `Default` implementation for structs can grow past the
>> >> > automatic cross-crate inlining threshold. The module then reference=
s the
>> >> > copy in `uapi.o`, which is not exported, and the build fails:
>> >> >
>> >> >   ERROR: modpost: drivers/gpu/nova-drm.ko: symbol '_RNvXsH_Csk9v2ZI=
pWbWt_4uapiNtB5_17drm_nova_info_gpuNtNtCsfr3MPOfBGpN_4core7default7Default7=
default' undefined!
>> >>=20
>> >> Hmm, uapi' ideally should just be type exports and produce no code.
>> >>=20
>> >> Default implementation should carry `#[inline]` annotation so they're
>> >> only codegenned in actual user crate. Rust's `#[derive(Default)]` wou=
ld always
>> >> add that. Can you check if that's bindgen-produced manual Default imp=
l that
>> >> somehow misses the attribute?
>> >
>> > Right, bindgen-produced Default impl do not have that attribute. For e=
xample
>> > here is the bindgen generated implementation I see:
>>=20
>> Perhaps you can open an issue upstream?=20
>
> For sure - see https://github.com/rust-lang/rust-bindgen/issues/3494
>
> I wasn't quite sure of the justification for why we don't want to just ex=
port
> these, so please feel free to comment there.

Hi Alistair,

The justification is that the uapi crate should have no cost on its own (so=
 it
should generate no code), because that's just an API. Whoever uses it shoul=
d pay
the cost.

Exporting the symbols would hide all that.

So, I'd even suggest that ideally we don't link the object at all, so it be=
haves
uniformly, built-in modules or not.

Best,
Gary

>
>> >
>> > impl Default for drm_nova_info_gpu {
>> >     fn default() -> Self {
>> >         let mut s =3D ::core::mem::MaybeUninit::<Self>::uninit();
>> >         unsafe {
>> >             ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
>> >             s.assume_init()
>> >         }
>> >     }
>> > }
>> >
>> > Manually adding #[inline] fixes the problem of course. I guess we coul=
d add some
>> > sed Makefile hackery to manually add it. For example something like th=
e below,
>> > not sure if that would be preferred?
>>=20
>> Yeah, textual hacks are a bit too fragile (especially that it'll break w=
hen
>> upstream bindgen adds these annotations). So if you need these impls, I =
think
>> exporting these symbols are fine.
>
> Fun though :) But yes, I agree this is pretty hacky so would rather expor=
t the
> symbols, at least until bindgen is fixed.
>
>> That said, you can achieve what you need with `drm_nova_info_gpu::zeroed=
()`
>> instead?
>
> We could, but I'd rather fix this here as people are inevitably going to =
try and
> use default::Default() and the linker errors that come from it are pretty=
 obtuse
> and difficult to diagnose what the problem really is.
>
>  - Alistair
>
>> Best,
>> Gary
>>=20
>> >
>> > ---
>> >
>> > diff --cc rust/Makefile
>> > index da1a7409d984,da1a7409d984..535a3bf181bb
>> > --- a/rust/Makefile
>> > +++ b/rust/Makefile
>> > @@@ -525,13 -525,13 +525,16 @@@ quiet_cmd_bindgen =3D BINDGEN $
>> >   $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags =
=3D \
>> >       $(shell grep -Ev '^#|^$$' $(src)/bindgen_parameters)
>> >   $(obj)/bindings/bindings_generated.rs: private bindgen_target_extra =
=3D ; \
>> > --    sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const=
 \1/g' $@
>> > ++    sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const=
 \1/g; \
>> > ++        s/^([[:space:]]*)fn default\(\) -> Self \{/\1#[inline]\n\1fn=
 default() -> Self {/' $@
>> >   $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_help=
er.h \
>> >       $(src)/bindgen_parameters FORCE
>> >         $(call if_changed_dep,bindgen)
>> >  =20
>> >   $(obj)/uapi/uapi_generated.rs: private bindgen_target_flags =3D \
>> >       $(shell grep -Ev '^#|^$$' $(src)/bindgen_parameters)
>> > ++$(obj)/uapi/uapi_generated.rs: private bindgen_target_extra =3D ; \
>> > ++    sed -Ei 's/^([[:space:]]*)fn default\(\) -> Self \{/\1#[inline]\=
n\1fn default() -> Self {/' $@
>> >   $(obj)/uapi/uapi_generated.rs: $(src)/uapi/uapi_helper.h \
>> >       $(src)/bindgen_parameters FORCE
>> >         $(call if_changed_dep,bindgen)
>> >
>>=20


