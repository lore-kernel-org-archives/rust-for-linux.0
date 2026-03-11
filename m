Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021103.outbound.protection.outlook.com [52.101.100.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F4359A93;
	Wed, 11 Mar 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243765; cv=fail; b=cwFMGxeQh9res1/WCw4CVwlocLhdQSL3GHIHTUpqnZ3ICsxK6J8aTBG+RvJmofpnZuA2uFlF8Yj6cKIHQpHiidJifhbtWQAT8bSKazJVeLmGCIk2KArQHldW7LsDgqmZgCo8LR6t5c2jIuWYUIMtGPeCgrmVcAOENoS4qEa5NDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243765; c=relaxed/simple;
	bh=/gJAcRrkFbXyGwo8GirLVhoAT8uUzfJrWJfpsPGja54=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XrhHhFrM/ooSxjCIHHSMyq/A/SLfio0VsKRJ2q32WsU9vGpYI5FEOJbVCZODc+tobFEMIt307ldgeCJGW+U8r2u64zv05VOjIViCh8VyF2FP1qJC5GlgySF93twOYonGW1iAJnUn34O5hCbAoSS+Ns9cppavGNHNFay9sXkQuEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EnFuMjsj; arc=fail smtp.client-ip=52.101.100.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EnFuMjsj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdhXYMhZwLaoFsimVers0EpOc5BItPE3CH0iRfDYsC9YQgzZTM4mLuYQRAqAZRNOzDir4jzPuWe/mMx6zHVcxKykyMcWx8zZ2Jm8CNsTIqiQcPdzLQfsVAHxp6vuexKLgL7JY5WfgisJSud44ZWK7RxRxbq9l/Z8HovOTrdJU5P7VOD5hIhcyi+ppSSM5oLV2pAeSyyXu7tcEI3HedFk2Bp2oNEOcsZlNcmpk9FQg7aBzJZwRwUYekJtgRa7NEyLltyvufwnZQnYv2OuH1AbnlT1IUYcXJlNqgIXpmGbcl8YkZ6Tuzi8ZWCOrl+mCpDh4LNZB06Vcc3U6e98fd2NNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUVugMjCmAlRWuetDAhxgFGOM+/76Aunr58xC3wyRfM=;
 b=xm+rtIarx/sYH9DSWwy6qPGOH3EEWHEioaaXqKJ8hUbZqBX+LvFbVRKoAoNUzsdj37pJuuyn1aVzAVftKhbJJoCbSPY/mBZH0WfqbkYls9KKF4q/Jvq2NO63K+FUyzcoR5WNgtbD0kWM3bzJoFyHtNouXhpobUv51sOxpSS/ckqVbJfZd/Zj0+qivOaTrmsqIUbrJGAh365Lv3xV2o93gysssAFf/DJjQ8QzCs5fB2NlzQsxlnPPM26605LvBXqZoWssZztp2uguu9JyFSANIW5R+IFVNneGFBQ9EGFmla/vNbIRSql4afPqc4Qx7SqPpZm0QPgW0PtX6VBj6GcD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUVugMjCmAlRWuetDAhxgFGOM+/76Aunr58xC3wyRfM=;
 b=EnFuMjsjeJwLO2GwIyOe77ajVh0rx4eGqo/N2GqVTpBt00OZxxZUGFyOMC9c9+5xofdYZGpIPYx2k8nv5WaeicCKJvjXgWIemeLhlxO5Fx1Sq1trhqmKUJ9uVSDt4VTJ996UQaiVBnb8T0upHr0QXiW+BRVh6DBV54wncdtVdbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6951.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.14; Wed, 11 Mar
 2026 15:42:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 15:42:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 15:42:38 +0000
Message-Id: <DH02G8SWF726.6XKAQ0XLYE3D@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
 <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
 <DGZZLNFLSJ4E.2P42FMI1XT47W@nvidia.com>
 <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
In-Reply-To: <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
X-ClientProxiedBy: LNXP265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::32) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7ede98-31f5-4ac7-d524-08de7f84d366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0T2ipGTMdnlpfLM3LxD9r4YJ1B0K7DTVmw3vHbRqao7IG7LeqYnSGPg92e3S/VF7/dnNxAPB7brgOoXXrY+0qH/COuwoaf1NKUsFS330KUISwemM3vaAzrzzv/Q50bjEfcLg/VghauQiFVpN6i4ySRCmkI/ouSY6UJ9jLXYIpNKxXuTi/BU2mylF3DxHy5/aOZ+Jf4RKv1xZ0cbvhvgZk1YlmozomAtI+5KDn96MZym+ZE9X9arxlRYa/khwdlyxUaD7fqua5gYgNyrQxIKLiQuKwuedJmtgAtZY5/2gQt29qoelG5ipUMLh/VmwYDNfG0qEEhfxeKVMTZhQ/oEKXfQvk14/QAkK6/usodL/Ibxgw4OP0714Hw/qglekfc9SWUh3mb344PNcbpe8+gv7Zm/olw1sPcT+JANB9Q+avq0gKw39HeGVibo5P586ZoKNw0oYRPtEKvjRsHJ425kI0jTScismN8fceGQDC3uzYKyt+HU/WQ7M3pb051wXHnPWfjhDI7YenVHLuO9x2C7WP9s8I7HyF7kLD31lqTom5R5sdWwuihux00qhNfal4yl6uPZstx9K61CePGfvtjen2KxJqDq4e++qVA9xIotnT8r8HRLkvIASdfa85g9uYSb1kgVW2MZeWJMHHoD85d/3WQx8zzCxMmNxT+lNvCUe8Uqhx8btS8lk/81Rm5rONxWcYXAsp83Fye8hiOC2jyXwGPxfH2ztYnrJ3Ufjk0JAuo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEFqQUR4WVU1RUlvMXRJVUpiZUJ6UEZDMHhmT1ZEMEdneGFQOXEzTFBkQVZL?=
 =?utf-8?B?SXk1YnM2N3l1ODRHRkxIRS9NbURwVlBzaUxhazNpSVg3SkVnTWZWME5uUk81?=
 =?utf-8?B?cUk2SzlFZXkzQ2xreTJLVGJNQ2JjcEtwUG9mS3BCUmRobmNadWpla0QrbDdI?=
 =?utf-8?B?K2RBOFFiemZNN3hvZE00VXdQVXdXcDJJMWxCbTE5OVJ4cXFvVW1vNWNLYjUr?=
 =?utf-8?B?VHd5blZ1MTNkZ1pyWUJKcTF4WmM0eFY0eGRGd0QybHEwQUU4TVZDQnlhYU1G?=
 =?utf-8?B?M2ZCb2RoMCttQ0gyNUduOU1KWk1tUnQyb2ZLV2JxQk1taW9QR0tiaExVdVVS?=
 =?utf-8?B?M2h6dW1QMXBCQlJUSnZlUmFkQWhHYTdiYXc0Vm81KzVGd0xqVWkrdnkvdC9z?=
 =?utf-8?B?UUVCc0FGZFd5Wm1mOXV4RElMd0dUQXFSNXkwaFVSTG1zTm1ZT3g0RXljQTk2?=
 =?utf-8?B?bnEwUEdHY3ZIRXNvMURJNUhmVnR4c0prT2xCNCszT0Y2VHJrK0d3RmFIaGlx?=
 =?utf-8?B?WURjOEt1K1B0SEZPMnJ4amVyZ29YaGF4TVV0V09VYWVmaHEzUWFBUnk4VWMw?=
 =?utf-8?B?OFl3L21Hd1owQVZDam5NWFZFUlp3RkxzcVJyVjFCbktFemt3Tjk2UnhVY3FC?=
 =?utf-8?B?Yjl1ZXNlV0ZTbTJqSUtMT1RIVUpBY3VWNzR4UW1DNHAzV3hQb24rSEJlVzBs?=
 =?utf-8?B?NTZtMlJpNkw3V1JQNkliaXpCa2hlb0NxZEc4U1ZrMURmM1VTQm5PUGgydXBo?=
 =?utf-8?B?SmwvQ2VxbWJvV054alhYbTZTSnhFN1VNenlQN2VXMmxuNkdoNlJqNGVNTzFi?=
 =?utf-8?B?Snp5a0NUKzU1Sk5Kak5DekV6YjdYTnc1S2pXMU9qM1hROUVocEtZM0Y1UVJl?=
 =?utf-8?B?L1I1QWgwbnlFSVVJVTVQUjBRT3AvK29uY3ljTit0Z3E3NTZwalRPcHp3Z0hK?=
 =?utf-8?B?MkpVMU1NMFJtNFdrYmE0MEdXWUlNK2JuZlBMMk0zS0xZbWRqbjhNUE5XZEs5?=
 =?utf-8?B?YTNwM0RUOEFGS3p4VWk5aFlBNitxNjQrQWM2TUNaWlNPanVPQXF3MWpZMDVu?=
 =?utf-8?B?RDdCc0tDUndtYmpJTDQwODZqd1RUZlFZTmNvcUJNMm9FK2NOK2dKOHNpTFBN?=
 =?utf-8?B?Y2VqbXN3UGJNQVg0d3RWYXVBeU1wUW5pMFVtY1FQUysyYm9ZSTJUeVNnbjMx?=
 =?utf-8?B?Z2ZHdFNaU21WbzQyMGpZTndqazN6cHN6Qy9kNmY1NnhHemRPbURjeFZPSXdv?=
 =?utf-8?B?cDBCbmlpY0Jpci94VTJqRjBReFVYT3grR3MvSEVMSWRDMGg5elI2NnRBcjBI?=
 =?utf-8?B?MjYwWDBoMThJbi8wZlIvNDN5b1ZQVVJqbDZ4L0FzcS9iVDdxUXR4QTExTTNO?=
 =?utf-8?B?V2UvYVhvME5hc3lsM1k1THVvYmJWUmNCMXFiQjlJcDN5dW1JWVMrQ0JNU0ww?=
 =?utf-8?B?WUN3QkgzWXZFZGRFYzhUZDZIWGhvTTR1R0tMTE9TK2pXc3NBVGtnbnNyeXp0?=
 =?utf-8?B?bHhjRkVvbkh6ZE1pWC9IeW5YNktMZ1FVY2h6cHRBUXZGQU1RZHovendicmEv?=
 =?utf-8?B?VEdlNFQ2em5rcUIyc1ZkR1NLTVZralo4ZWJmbFdMYURtSlFCaDZ2MG4yWnRX?=
 =?utf-8?B?Z1dQSUN2WFMwdjJkN2krYWRIVGYza3hXNDlRZVl6RHU2aHVGR1p2MklMd2RK?=
 =?utf-8?B?WlJqZlQ0cFk4RGtrZ29iUTlTd3E0Vzl3eTlEdmFQMEhCN3hWSDFxS01EUkJX?=
 =?utf-8?B?R1ZXM2hBdS9PbGs3Y043Wlp6WnU4RDRpdTlxRWpEalNGTE10LzNBeUpLZlZP?=
 =?utf-8?B?Z0pOMERtdFJuM2N1Wk51QURaN2R3Q3N2Kzl3V1JOQlBNVkc5RlZqc2VrWE1j?=
 =?utf-8?B?ek5CQ09pVEZiTmd0Wk82TzQvcTI3ZVFwUDhuMFJ6OVN1Tkh6UnM4Y1ZyM0la?=
 =?utf-8?B?Zkt0NUZaeTBaRFRORHZMcVpCVnI5SDg2YzcveEZla1NDTDBDMVVjQkQ1NnZG?=
 =?utf-8?B?VENBd0tpZTNkcHdvMlhaRGNmN0hUVk9BekJQOTdodzFuNVhhN2MrVWJUS0Jk?=
 =?utf-8?B?YWhlamp3Mjd3U0ZLU2VDZ2NKTjhwT1M4SjZOSUtjek1qeEp3NmJLRURpWnlG?=
 =?utf-8?B?a2JmTUtDQStCNnQ0RFhxbmlRWHRZQlBhUjFTMC8rLzcvZmk5bnUvR2ZvS1RN?=
 =?utf-8?B?cVBBSFRkdC8xbHVRWHdHQkFhQnVkRDZxS2ZQb3RDb0VHeGRGQmVYbm81dW9Z?=
 =?utf-8?B?bUhKaG8rZWxLTmp6VW5DdThYbnNPT05uWXBtSm5NZXEyT1l3MUczaEt3T0Q2?=
 =?utf-8?B?dTFkbWpwOWxLaGplR1pzbHE1N3Ztb09FbUh4bDdWUC9UdC9oL2JzUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7ede98-31f5-4ac7-d524-08de7f84d366
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:42:39.3413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsTetdsHLWGNiCaGxQDLdAHDW6M31NywcfJIvhN3bBIkJDLI1muHKsHWDm5kb8+qJ6i/mkSATuD3f4muqxGheg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6951

On Wed Mar 11, 2026 at 2:56 PM GMT, Danilo Krummrich wrote:
> On Wed Mar 11, 2026 at 2:28 PM CET, Alexandre Courbot wrote:
>> The fact is, there is a symmetry between `read` and `write`:
>>
>> - `read` takes a location and returns a value,
>> - `write` takes a location and a value.
>
> This is not entirely true.
>
> read() takes an absolute location and returns something that encodes the =
value
> and a relative location, where for fixed registers the relative location =
is
> equivalent to an absolute location.

The value returned by `read` does not encode relative location. If a primit=
ive
is returned (of course, this is not currently supported by the `register!`
macro) for the FIFO register case, the returned integer has no location
informaiton whatsoever. What encodes the relative location is the type itse=
lf.

If you just construct the value yourself without using `read`, you can also=
 use
`write_val` or `bar.write(WithBase...)`.

>
> write() works with both an absolute location and something that encodes t=
he
> value and a relative location, or a base location and something that enco=
des the
> value and a relative location.
>
> 	// `reg` encodes the value and an absolute location.
> 	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>
> 	// `reg` encodes the value and a relative location.
> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
>
> 	// First argument is an absolute location, second argument is a type
> 	// that encodes a value and a relative location.
> 	bar.write(regs::NV_PFALCON_FALCON_RM::of::<E>(), reg);
>
> 	// First argument is a base location that infers the relative location
> 	// from `reg`.
> 	bar.write(WithBase::of::<E>(), reg);
>
> And yes, I am aware that the above wording around the difference between
> regs::NV_PFALCON_FALCON_RM::of::<E>() and WithBase::of::<E>() is at least=
 a bit
> vague technically, but my point is about how this appears to users.

The latter is just a type inferred version of the former, to avoid having y=
ou to
write the name twice. They're exactly the same.

>
> In any case, the fact that you can write WithBase::of::<E>() as a locatio=
n
> argument in the first place proves that `reg` is not *only* a value.

Not true as discussed above.

>
> 	fn write<T, L>(&self, location: L, value: T)
> 	where
> 	    L: IoLoc<T>,
> 	    Self: IoKnownSize + IoCapable<L::IoType>,
>
> Which is the reason why L: IoLoc<T>, i.e. the relative location is on T, =
not on
> L.

The location has nothing to do with `value`, just the type `T`.

>
> So, what you could say is
>
>   - read() takes an absolute location and returns something that encodes =
a value
>     and relative location
>
>   - write() takes a base location (or absolute location) and something th=
at
>     encodes a value and relative location

Only `location` gives you the location. Value has nothing to do with locati=
ons at all. Type
inference does the trick.

Best,
Gary

>
> But then there is the case with fixed registers that simply do not have a=
 base,
> but write() still asks for a base (or absolute) location.
>
>> `write_val` is really nothing but a convenience shortcut that has
>> technically no strong reason to exist. As Gary pointed out, the
>> counterpart of
>>
>>     let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>>
>> is
>>
>>     bar.write(regs::NV_PMC_BOOT_0, reg);
>
> I do not agree for the reasons mentioned above.
>
> In this case read() returns (location + value), while write() asks for lo=
cation
> *and* (location + value), i.e. there is no base location for fixed regist=
ers.
>
>> ... and we introduced `write_val` for those cases where the value
>> in itself provides its location, as `NV_PMC_BOOT_0` is redundant. But
>> the above statement could also be written:
>>
>>     bar.write((), reg);
>
> This makes more sense, as one could argue that a fixed register still req=
uires a
> base location, which is just always zero, but why would we bother users w=
ith
> this implementation detail?
>
> Is this really less confusing than an additional bar.write_reg(reg) that =
just
> works with any register?
>
>> which is exactly the same length as the `write_val` equivalent - it's
>> just that you need to remember that `()` can be used in this case. But
>> if you can remember that your register type can be used with
>> `write_val`, then why not this? This actually makes me doubt that
>> `write_val` is needed at all, and if we get rid of it, then we have a
>> symmetric API.
>
> Still not symmetric, and I also don't think we will have a lot of fun exp=
laining
> people why they have to call it as bar.write((), reg). :(
>
> OOC, how would you explain it when the question is raised without arguing=
 with
> implementation details?
>
>> We were so focused on this single issue for the last few revisions that
>> the single-argument write variant sounded like the only way to handle
>> this properly, but the `()` use proposed by Gary actually fulfills the
>> same role and doesn't introduce more burden when you think of it.
>>
>> So why not try without `write_val` at first? We can always add it later
>> if we feel the need (and the same applies to a `(location, value)`
>> symmetric read/write API).
>
> If you really think it's the best solution, I'm fine picking it up this w=
ay for
> now, but to me it still sounds like we have no solution for a very simple=
 case
> that does not at least raise an eyebrow.
>
>> And most importantly, that way we also don't have to worry about its
>> name. :)

