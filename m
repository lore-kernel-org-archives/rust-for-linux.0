Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020106.outbound.protection.outlook.com [52.101.196.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACD140DFAA;
	Tue, 10 Mar 2026 22:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182010; cv=fail; b=bvR9Mb9/+oLRZMNIQXVA+sNYVHpePV19q5ns2Z6izTWjwKuEKfijbQ4oyUES0MjY+OOMiUdKUi1lFmGElkwclX1iowrATrtQqRzEqkc4Q+DvH5w8lTfTTAsLFblACQWezCFhwJE14gk+yGYEHhlUR+czIHljsGIECcPO2oGvkzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182010; c=relaxed/simple;
	bh=WrhU+CLqbwlvOB8kR4iZMEHxD/Cm2wlrXyUinkigCIA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=C9kfFO6GrlvxIjBAvthKtTSFNzizKet4KWiVskIporxVaamPV9tIxylmU47cmB3AtleVSyeR6+/q/WE2huvu/kLWs0FWdl5XQAxbDOxxYhHx3pFzMD7bHYFzNlpCqOjAjZR/jdUzfU5c2g3zUXtpvU66wjG6HroN3ZngwuATTnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=th8kUaDz; arc=fail smtp.client-ip=52.101.196.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="th8kUaDz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KF3kdLz4HWzHqvUK1QwthKGurscu6XC/2fD+ug3rZSZg9t+vfIl52xypnJnHB/LJWLSg/hjO7VET2TzVSMKC5XEH1IwyLRtavkbH7doKywbI7GgvsiMJfLfo2qcGSXmoDYFU6CuADW9i+sQQSwRZtFySK6U98DjjOOBZY2RPyZ+wODNjO6IxN94xz9PdJC65/Dx/0Y5/Ef01fQPkMzr1LVhu/wMC5xDTZoBVgokQneJEbvYJbl3MrSR8F56IboQR20YyEH9ICE3wnwZCZ0ZO7R89kzRuEfzhiLDZ3b8q9wODTHerHTsAacjDZSPQtft0p0vDr0Bh9UmXeQAMdoS6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYCrPfJTVOfoClhh7ZWM4zpwjQLh1Pmk6B3LZOmqV8Y=;
 b=Tp+1SOaEKO46tTwOvNmofMy9CDXhs7dGGIXY6nv7W8tm5dBJCKinE+x0fKTa9ZI0T+svUitlYUto070JH1pHe7vELY96WVIU+rjklrgzRCY7OIKdYoKVYW4qtqQUGGyGGKZCJ4bkDzqNOc6x4j9A/jEoPl6j8JnDxwYJ14lyrE4zb4jL5ZVv1zzL7kkMrxFwY9t4a/z27D2RoWUtsKWWr2pSrquUEOTGpPFkDC8KIjxO0HRMtWF8RwCudVb8LUGHAsblQ9/NDwqKA7DpWqF51iWPNaPlQDyLO41rq2qqrYOHNIsomL1+j0mSAIiUvOdRuWIkx12w4o3SoceqjVxRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYCrPfJTVOfoClhh7ZWM4zpwjQLh1Pmk6B3LZOmqV8Y=;
 b=th8kUaDz8XgX996Jwmkk0tI/+Et9q1DUES8ody+QAuaiO7m1Ae4bbhzOQ5jniL0l106s4pLDHpAzAZYmNFEEr/pxskgI9R/6v6eTi8z9hiMv6C4Ljo8GRnfe07jhQCVmr1BUPc4PJyRYXn6EGuTY+ZcUHAr9Z9mkBPPX6M7VvxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2071.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Tue, 10 Mar
 2026 22:33:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 22:33:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 22:33:24 +0000
Message-Id: <DGZGK7BW0J65.2T447EQK6I0HV@garyguo.net>
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
In-Reply-To: <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2071:EE_
X-MS-Office365-Filtering-Correlation-Id: 998b16e2-5fd7-46ce-7f0e-08de7ef50b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	awBJ8yIUNXYvdNpaEw0Z9+aelRi1TnKJDd0tRJZ3NZCpYUtvo2+eBN8vUx2idpDI5uI65kB0GX0+bJ48T7pOgt41xN5IypjNCzv1X60KYs7IXe05EpcEa/5mOa0tvyoTe0akIUdq0/GsuRBi3kIJv7MMoBAGrtIZFDICXtT6YA/LotAwm4ccLaqfHXKahRga1cBGHu3AWDTadb7WI56zGGMmfaO2r2EFt8R8trsBrAMrR5zpqwpDa+VcHL8X2xScZaWmFCqdNwFcTiefMZNu0fKmcY6T5TVBsF/+EeSgjVVRrGjmVxyk7VsgHjMUoPsb08TMdPiD8EdHA2PDnj44n3b1A0iCFR3pq9cUK/pk6xEkjO7RcoWdWB2udla1a0VI0njXIXfmYErMEKEJNRSFEyN10++q9WMvrk6aqgqrXpXMu5h8MXQM4g9TbK8TL8Z3/PnvqpuEJDzewy4mB8E1r7AkFapP8L0VfT0NYKydaJEvlAqr1MjlHUc4eYIhUeyfXtwPzq3QImcdm9JWCrw6jh33zS33A926R6CjWig26aNAOdm2GdX3x1TBsG1XF/kj0ehkUklfkQytdXuQKv73hSWfwCNTxVvTcfoX+TxRWfoJSkrAn2MH2q68/ShPDUNoOIhjDepRbsgIBh+U0e8k9i/LCgDInSbsEiI5tdUZPsAqym6OQ92ik9i3cQ6uUG1Q6npHeJEBJJ/R+fagvmYOf9S1RS/E4GOjEMwgJdlCPk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rng0L1BCcUVQL05wVUxjRlZwUjlUU2Q2TWIrclNFTFFrd2FtT280T3pMOVkz?=
 =?utf-8?B?ZDVBNFh6ZVY2ZGV1ekpUWUtMOXorbGRaSmRSRXh6T09EWitEUmJjRkVhTGhy?=
 =?utf-8?B?YW9nQXNFem5kV2JpdEgyaGFkVjJyT0phbkRBZUFadWFiUjZVcXdZeGNOVTFz?=
 =?utf-8?B?VnVqd201aWd6dmxtbk9NV3d4SFhpVjhGbUxOKzFvVHlGUUFEakFPN1hGNEYz?=
 =?utf-8?B?NHE4Y3RPS3RwOW44TFlpeGs1UXlQYXU5Szd5bksyd2RhVHpWSVpybjlxd1E3?=
 =?utf-8?B?TjZlZWNxcVloNEdwTDVHMDZIK3ZjY2c3VDJROVQ2SzFhbCs3ZE5nMmR6RWVj?=
 =?utf-8?B?emJBcit3WnQwNHVRbzJrdmxBclQ1Y1FINEt2KzlVaEFhbHA1eTJIZTVZYVBk?=
 =?utf-8?B?NlVsQ1NhWWV3QTJSb1VXUUNKbEc2WDNJcXRyaFZ5MjNpZVVrTWtaaWVuWXRD?=
 =?utf-8?B?YTdqaEI4MndDZzVVUStMT2FMQ0hGYXVqZUN5aklwL2NZOGp1ZDNjYnZPSm1m?=
 =?utf-8?B?c3N5eVU0SXFIMEwyVVBGUlFkWnZrTTFoSTVJcElLU3hpdTczZXZvUUlUOWRY?=
 =?utf-8?B?R2IxVzRTT2NQbFNFQ2Zjc2VPellvQ0JmL20xR0llVWJQRjVFT3JtMG9YYjJB?=
 =?utf-8?B?Qm1PbWhXT0prdmNkL1NsV21wNFZGWFoxaWEzeUdlMmFJU0ZsRlgwVGs3dWwz?=
 =?utf-8?B?d1ZaN050cG9jSEZ5d1FmcC90WHBLK1VGN3UrSWlhVTVhMnRnSHJ3ZUI2aUFR?=
 =?utf-8?B?clFURnpTSUtGNnFqUDVXYUlCYVFyT1BzU2FFZkZhNEtDTkI0OHg4ME41dWxY?=
 =?utf-8?B?RllQV1RoWGZuTHY0RXJISjE3RjlsL2xPZ1dxVkNsdmJENFlHaUt1TFNVQTNT?=
 =?utf-8?B?YTM5cG5rcmh2c2V3WXJMdDBvbm9tN0hTT3d1dmxSSitNbW5XRGgvRWFIVWh5?=
 =?utf-8?B?eFdkZGlQRDVXQTJ6L0pkblRNT0xYZmxmQ004eFBCaHQvSG9jbmRneFVtUklr?=
 =?utf-8?B?R0xzRVdFS2tPSzNxN1dJWENNNjhnb0FxQWZvYktVRERkZlBQWFpSazZvMEQ5?=
 =?utf-8?B?ZjVxZytKYnF6MkdSQ1hvTlFvZG5WYnJSQU54ZVg3RWlQcENkS0x1Ny9rMzZk?=
 =?utf-8?B?c290VlZ1cGV1ZmhjdnFxMDFxakcvRk9YSTEyTnBOSkdwNlVTWTRQSkxzQ3ha?=
 =?utf-8?B?WUpjMnZpemZaaDZFV3Y1KzNFY1ZZZEY1aWl4SDZmSEY3N0t2TVlpcUloRnk0?=
 =?utf-8?B?V2VLaC9zaEQ5dm9naE11VFkxNHFhb3FtZVlsaHVrMW5vTVNPVmhMdzlFL1Fz?=
 =?utf-8?B?NStxSkZFRURiZk1ibk5oZXZrSTdQTnVjSWlkWm11N1lLc1VadlBRcXlldmtS?=
 =?utf-8?B?UkhJVWdKSWZDVllXV1JZSFk3VExxUE1ic0NyVVhwWWdGUEQ0VEF3YXVSc0Ux?=
 =?utf-8?B?cU9PaWhGaGdCM2V4WHdRUHJjUWdSRzJwaEovN0RocHN6SFkwVU01WGVPbXds?=
 =?utf-8?B?bHBMOTBMMU1GWk1jYjBTeEQ1UGt5RUd1NkNiOG9EUHdObnlDVmozZGlwMUU0?=
 =?utf-8?B?MDB6ZWNmN3dlNG1DUDg3OXlnZXdOMlc5M3FJNnNuVythMVVvWEYza3ZjaFh6?=
 =?utf-8?B?WWVkS2pERFBSakJ4Z3JqeVkxSU9OUXAyT1lsWFhTUFlIQS9LNGRVWFM0MXNz?=
 =?utf-8?B?MXppdEt4eVdJVytXSzArRVhLTWpwaUR4NFlqY3RiK3lCam9JVTM5dTNtUUQ1?=
 =?utf-8?B?R3I4WE5qMm56aE1VN3NpaS9DR3ZaM3lEY0UwSXNqTmpmT3ArZ3ZWRTloeitq?=
 =?utf-8?B?cWZxZjdqNjlLZHFOZ25HbG05bE5ETFdFTE1rM1l2dXpESWkwK0h0cG5TS2tm?=
 =?utf-8?B?cHFjMjQwQmNhUUhXV3dTNFhNbXFMNHdOOGxyTHdDamlHaHZ5eHpHY1ExMmR0?=
 =?utf-8?B?VUhvTEtlemozdEY0Zk1BVzRlYjFUTTRVWE1BSnVzQzdjbVJtMjJ3UlB4cWZY?=
 =?utf-8?B?c2dOR3o5R2EydHprRlhXc1ZEZS9aKzQ5dlF2REVlMGJFRzRKQ0pFTFZhVXB1?=
 =?utf-8?B?eSs1MUNDK3R0enl6VEhDeGhwRzI1cFE1VmN3UDk5Q1FnZ1RwLytTQXRmQlVj?=
 =?utf-8?B?ZzIwSkxNQzRYWlVmL0xIcG5Zc3F1Rlp4S0dqSkpWbm5NVGh2OUMxUXRrcU9D?=
 =?utf-8?B?M1d4TkxSU1RuVmRpY21UV1ZxM0M1OEc2TmJIZ0lORnFyMXZaUnRBQ1lIa1py?=
 =?utf-8?B?czFWZnpEOUNGQklNdElZSkQ3RkNzNldaYnJIdEcxZmtDOVBMc0VPVVYvcDJ3?=
 =?utf-8?B?b1MzbFk0eHpGckp0ZktIako0OUJhQzQwbGluMjNUaVhXejBWMC81dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 998b16e2-5fd7-46ce-7f0e-08de7ef50b05
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:33:25.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfuxACfiy431BPbOitWrS7sxD/m1cZSjn+fegEBUZRFhhHlmbFKJ93sMEmOGcFkblLyh6YHoHR543i9YoTApyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2071

On Tue Mar 10, 2026 at 4:34 PM GMT, Danilo Krummrich wrote:
> On Mon Mar 9, 2026 at 4:14 PM CET, Alexandre Courbot wrote:
>> +    /// Generic infallible write of value bearing its location, with co=
mpile-time bounds check.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// Tuples carrying a location and a value can be used with this me=
thod:
>> +    ///
>> +    /// ```no_run
>> +    /// use kernel::io::{Io, Mmio};
>> +    ///
>> +    /// fn do_writes(io: &Mmio) {
>> +    ///     // 32-bit write of value `1` at address `0x10`.
>> +    ///     io.write_val((0x10, 1u32));
>> +    /// }
>> +    /// ```
>> +    #[inline(always)]
>> +    fn write_val<T, L, V>(&self, value: V)
>
> Still not super satisfied with the name write_val() plus I have some more
> considerations, sorry. :)
>
> Let's look at this:
>
> 	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>
> 	// Pass around, do some modifications, etc.
>
> 	bar.write_val(reg);
>
> In this case read() returns an object that encodes the absolute location =
and
> value, i.e. read() pairs with write_val(), which is a bit odd.

I mean, it also pairs with `bar.write(regs::NV_PMC_BOOT_0, reg)`, so it's n=
ot
totally odd. We just need to teach that "write_val" infers the register loc=
ation
from value.

>
> In this example:
>
> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
>
> 	// Pass around, do some modifications, etc.
>
> 	bar.write(WithBase::of::<E>(), reg);
>
> read() pairs with write(), since the object returned by read() does only =
encode
> a relative location, so we have to supply the base location through the f=
irst
> argument of write().
>
> Well, technically it also pairs with write_val(), as we could also pass t=
his as
> tuple to write_val().
>
> 	bar.write_val((WithBase::of::<E>(), reg));
>
> However, my point is that this is a bit inconsistent and I think a user w=
ould
> expect something more symmetric.
>
> For instance, let's say write() would become the single argument one, the=
n
> read() could return an impl of IntoIoVal, so we would have
>
> 	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
> 	bar.write(reg);
>
> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
> 	bar.write(reg);

How would you modify the value then? `reg` becomes a combined pair with bot=
h
location and value, and we would start need to use a closure to mutate inne=
r
values again, which in my opinion is bad.

This would again become the `IoWrite` design of the last iteration which is=
 the
part that I disliked most.

>
> and additionally we can have
>
> 	let val =3D bar.read_val(regs::NV_PFALCON_FALCON_RM::of::<E>());
> 	bar.write_val(WithBase::of::<E>(), val);
>
> The same goes for
>
> 	let val =3D bar.read_val(regs::NV_PMC_BOOT_0);
> 	bar.write_val(regs::NV_PMC_BOOT_0, val);
>
> which for complex values does not achieve anything, but makes sense for t=
he FIFO
> register use-case, as val could also be a primitive, e.g. u32.
>
> With a dynamic base, and a single field we could just do the following to
> support such primitives:
>
> 	let val =3D bar.read_val(regs::NV_PFALCON_FALCON_RM::of::<E>());
> 	bar.write_val(regs::NV_PFALCON_FALCON_RM::of::<E>(), val);
>
> I think adding this symmetry should be trivial, as most of this already c=
ompiles
> with the current code.
>
> Also, let's not get into a discussion whether we name on or the other wri=
te()
> vs.  write_foo(). I just turned it around as I think with the specific na=
me
> write_val() it makes more sense this way around.

To me flipping this around is the odd one. If this is flipped around then t=
his
should be named `write_at`, but then it becomes odd as it is the dual of `r=
ead`
and we won't have `read_at`.

Best,
Gary

>
> But I'm perfectly happy either way as long as we find descriptive names t=
hat
> actually make sense.
>
> Unfortunately, I can't really think of a good name for write_val() with i=
ts
> current semantics. If we flip it around as in my examples above, the _val=
()
> prefix seems fine. Maybe write_reg() and read_reg()?
>
>> +    where
>> +        L: IoLoc<T>,
>> +        V: IntoIoVal<T, L>,
>> +        Self: IoKnownSize + IoCapable<L::IoType>,
>> +    {
>> +        let (location, value) =3D value.into_io_val();
>> +
>> +        self.write(location, value)
>> +    }

