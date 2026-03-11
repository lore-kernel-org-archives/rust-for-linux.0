Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022102.outbound.protection.outlook.com [52.101.96.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9142DA759;
	Wed, 11 Mar 2026 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249374; cv=fail; b=CVjt9DoJM0JKdhD9HCpSpGWcwlzLR+5pBkcdOPu4g/WWsZbhkdc3iU6sQKqRLWZhfe7Igy1mHQI+ITiDJQteV2UG0MnrcuNJ4KeLVqCHhBJTFyk+0SF/LpUZoxx4dgK8L6JAUOgBFkWau7MxjSB5t8z7dTQfK/D++b7xc15y3us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249374; c=relaxed/simple;
	bh=JZe66o0v5eXJoHrSTi3707oFo8hKL6pEDAy4Uw7h/0c=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=A9oi33h+By5vty0ccVMCZtJJfnejs2kItbCRQykJ4R+Jv789l0dKuiO3oy4IaIa2u2WDrGQwFIYy2C1pxk7Pbi5/n3P12PvjOoSvvKHE2IhUYFQt30Y1ANn6N0LihaH7KJ7ILWcmBpilWvpULtbA7NSNEhPU74X2IxNGiEMq2i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=P16uQH+V; arc=fail smtp.client-ip=52.101.96.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="P16uQH+V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NP9POmjox9YjpreTNuFPapEdNNs82iBxMCdyX1KgIzUIehKCSZ4IvR1HY/UB/SHrYdmjYjsLo6mpjlBp/9FG93wIf7U5pbcqqntCj4L1NdE/8SO+e59r2wxlpvMWdnVpGEYoKqDwck/7oHToICbpSxBlwboBsi6KX3Uxv3I5IG9r949DK0R7TX6lTQBA3uFJ/MTbJ/CSGIcLioJuWG+jo3ok5VgOhTgf+isCoIfgI6N+jgU69Yv+FWjVMfGH3kJ1JP45M4XSmCxeE97tG+fO2bXiJWQJM/D8weCaKLPe6XTC/qVAzZDxDWfWiA0fBxd6QKMnQsKObGVn5oSPW1aFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+N23rm5oMdbUpWdjopMeQ31iA2t9AAIyyMogJ/kwtk=;
 b=bvs+2EaX7kVjtaT5wxalXiLznXMkLIqNaWGMD8ge3lh5zhNyF84nq6+bh+YQdmW336kn68xYrHC1DBTGwC/cO6RzQzMoTguc7oXy/+5dnjzZDzTeGMs7txrWUxVpC2MwGGDysmaFAB7OmpQZoQwYDl7h0ZYfMPxRX+YPszAjA4i+Ey/DN7i+83yexjy7R/w22/vnQ60GbqlvlJYVFUXqrFxYGrF93dx1Ik4sVdQc/6cVicnP6ovjrZKVXbwWlfvAPykLNR2o0C9+jPWvDBq8FEKvprzi7igfDim0rjoihU3V4uqReBULsnLT86wrGvkezneUR49PkmV34fWIb/kiNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+N23rm5oMdbUpWdjopMeQ31iA2t9AAIyyMogJ/kwtk=;
 b=P16uQH+VRH9ayf80mbxrY6Ngw64TSbl+5/Vs2pWr32I/kX0XaCkgQ7DQgQBD13xmjmoXnhrIU+lwf5v+SlGGb8HPGIWNxD6UFsxYPZAvQP/2boSwqt8yOx+294uSEfULnDgZosXXkVQtIOh7ZGvqtDO4YJZyV1w8+mygFPpadbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3296.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:177::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 17:16:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 17:16:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 17:16:08 +0000
Message-Id: <DH04FTT27SDA.LWOJUDEQ9V0A@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
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
X-Mailer: aerc 0.21.0
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
 <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
 <DGZZLNFLSJ4E.2P42FMI1XT47W@nvidia.com>
 <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
 <DH02G8SWF726.6XKAQ0XLYE3D@garyguo.net>
 <DH03AMF92KPJ.34AJPXRVWF2Q5@kernel.org>
In-Reply-To: <DH03AMF92KPJ.34AJPXRVWF2Q5@kernel.org>
X-ClientProxiedBy: LO4P123CA0558.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3296:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ebf56b-6076-4b3f-5f40-08de7f91e2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wxw8el/1aOuHlvoKGaXFjT+v6GCBY9FWmXEBu4QFUEY1h28eQy4rrDCw3vq8VLC2TRgIiwgTmHKdijfmkkvcr7YSCRKizrypLtdih469eaoRqvy0A5rX85MHr2AIylZijQH2Z37CbVeU3U2cAr7TUPMrIAv6jft7oHEdfjzfBNZDKTktd3vaVUlD3n8vTvWgcmkkf+2Tv4enBQsf3zeSNu6r6JOvtqzDgLjvEGdHx3oelgq0HY9dd326m6KggPwIm5kyCxKZNpIKwWwb4j/fvtju+0oWWrx6xtvphE87IQigAnByN1ULIdiw6uHTqR0qCFIfwGMYgSikZmFbnpPWgjdXVqmrbXEH+ra0vsyt6nH+X+632bpXJSIObTbHW/4nMZPvlVmuK+6BwH7psJtY2lmTQLEw/A2FNQr1dSBcXhSywAQ0QXZTqYuoNnDbV00YgmYBR8l04sgeXFqRgiuKNSfnjI6WbC2d9V9btXmhKDDD33V6F4SLyWAoXLyqR0s8buF23TQvJFHjI5SQAG4y64McOZ3w+NhHFrRsbrxQ5eHScp0SVBX975r7tjK6OXQLoPo10TLvegibgAFi93ODxizzoKRupzcbP1iNOE9+TUKMcVCiwT9s/Atk6pISfSvrZIrpx7sdHVP8jDZacgATnL4Au+QxdhIA5GbVEwbfZ4qkgBpTS9LBUaHoEyvLjlShMidboK/UqRgJqCT1Gex7MsANRBXUkZaNCyG9sbzSShk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW9rR3RSdmZtYzUwVUdpbjBXK1czNm9WaENtbXBsWm1kRUJUUXJOcmpzVVFC?=
 =?utf-8?B?RkZUNWpkeE45emVWWjBIR0Z2TFhZMmJ2WmloWEpyMlZwQUtZakJKM2R6cGx6?=
 =?utf-8?B?UFM2RVA0emlpaWtPNFNRNVY5UUJYODZ1S0I0M0pocWsrSE9wTStsNCtLcUxj?=
 =?utf-8?B?a1BGOXVYQml2akdOUS9tU2o2M080UVdXZjI5ZCt3cVhrYjF2cXBNc25UMUl5?=
 =?utf-8?B?NkNQejNyYlFkVHpxRUJPOHBNZ2doWlMwcjBObXJWeW9SYkJwNzlsSHRWV1ZL?=
 =?utf-8?B?K09aTXUrQnFwQUdaYU0yYnFmSGNibVFkbjFUbGx2dHBsenZyWHoxaytZTCtX?=
 =?utf-8?B?UVBQeWlFd3RzOXdpUC8xd3FrVGcrWSs0aVBPakZpYWUzOHhuTGZIWHluQVE0?=
 =?utf-8?B?VmZkVlNOOWZQdnFyTnJRSU9EdDNoMnh3dzlmQTlQRzlXdlpDbU5SZTJNKzQ2?=
 =?utf-8?B?dVZ1bGo4QnVMUGRrOURIci9jK2tBMkFQMmhBb1NNbVpJSk41SHdtVHFNQ1ly?=
 =?utf-8?B?dGs3Z2lTKzMyU3FRNEwyNGdxanE5Q3RkeUhISks5UWlOVTdIaFpaS3BwNEJT?=
 =?utf-8?B?TkVPVUtLOFdxaWJlalNSRE5idVpEUFpLOXJxMmlZaDl0TFRhQ0FneE5MbWpn?=
 =?utf-8?B?M3NkTFREQlZ6NEUvVGpPZ1E5aHlTL1NkSVYvOFRzTjltYVZoOW0xMlJzVVE4?=
 =?utf-8?B?OXU4OHBtSUFaOFlVQk9aTE1ra05rN014dXlvZndUdE5DWUZSclk1UCtBWHAw?=
 =?utf-8?B?b3lvV3AvRGJpdHBncFhJYk5qNFRwU05ZMVFqNWVSWTgrMzFrbWQ0ektnUEtv?=
 =?utf-8?B?KzI2OVBRSDY2V2l0T0Q1SDlUSnA4V05oZ0Rab0hIUmNrdkFtbHBFVEZpN2Rq?=
 =?utf-8?B?cENxSGFzMUNHejlwMmRnVitjOVdjSytrUmRIcFlpeHJhclpHMmRpbTV6WWJQ?=
 =?utf-8?B?M2xuRENPd0Z1R3BZeGlOTm55czl2OVZvdU5XblkwZitLb1crQ29yMStvdGo4?=
 =?utf-8?B?T2QxSFV6aU55em15UklzNGpCSlZ6MXNjMW42UnVseS9lZk5SUGhXakJ1R3hR?=
 =?utf-8?B?enhqcG5EYXoyK2UwQ0M5VFBwc1JkcmR5NTBHT2s3V2F4N1VZYWlYVGFQSlJX?=
 =?utf-8?B?TmZiMlJOdXB6NTVGdVhsbis4Q2xzKzFSbERiSlpZVnhLd1pUdjBOYjZXS0hS?=
 =?utf-8?B?WXFSS2JuUjJLU1NHZ1pnajcwbFh5SzZjQkMzN3JJd1d2UlRubERvZDBhV0RF?=
 =?utf-8?B?TTlaTVhIUzlBMFRQZ0t4S0wyZXlZRVRjNERDclFGNjNTTXhLci9RZDNDREIx?=
 =?utf-8?B?b0JzYkJiUjUySkh0akFKalNCM0JjeENreCtBV3Y4aXNJUlp3YlhFblllMkJ0?=
 =?utf-8?B?NHdsV0FMKzdyU3BXT0FpYnJEL0NHbWRCQmcvKy9kakl1ejdrc1U2Z1pWRUYr?=
 =?utf-8?B?R0ZGc1Q1QnZsL2wwZmUrYVc4OVhqbFoxV2RjdllqbUxSaElJY1NvSE4rT01k?=
 =?utf-8?B?V1UyR3MzSGl0VjhQaEM1WTRoSnVWVDBiMDQxYnltVzFxdWxxUVF2b3ZsZUhK?=
 =?utf-8?B?UzdzcThmWDE1NVBkb09MakJQWGJrNjdjbFF2Mmd2VldGMkNzLzhOaHA1VFdL?=
 =?utf-8?B?Z0VESEl3aktka0loM0JUZFpKV2ZsQjNuS2V4MmFtRGVHQ0NJa0owaHgrMHdT?=
 =?utf-8?B?U21UcEczK21RRnFsK2IxKzRFaUwyYkd1OFFyV1UrbC9XT0RHbnVpYjB2am1n?=
 =?utf-8?B?WnFBWS8xTFpNUHQ3UkRuY2tNT1hHWWs5NkVvWkdoU3NXTlAya00xUHljd2FX?=
 =?utf-8?B?K2N0VWlVeCtVZkNyTUUvWEdqS240MGFQNDV6OUpaY3hiSko4M0tQbHdEb3Yz?=
 =?utf-8?B?NmhTVzN2Ylh6czFjZ2E3R1RtclhvdUpETFFnM2tvVDFYd3NjM09QTi9SZTJK?=
 =?utf-8?B?Z2ltN0JNVDlpaHY4T2ZpQUVRNDBOZ08yY1JMaU01NW5KK3JqWDBYZXZtWWhs?=
 =?utf-8?B?WW50dm90WU84V2lSNkNRNWxHOENaejArWEtCdnBkdGtJT1RySjVVQy9xazZm?=
 =?utf-8?B?cVNZSUJ3cmREU2R0Mzk4NkFJSm1Sc2x2M2xVZ25UT1BObkUzYWtYc3cwWngx?=
 =?utf-8?B?TzFaMjM0dlpVUFN1YXU3eW02b3FOUmxZT1kxZHlUR3VPVUdXOENQZkZDK3RK?=
 =?utf-8?B?RVA4TzQ3cHpCclhqMXR3bDRraGZUYnNNQllOWHZQdU8waGhrd0VoZDc5QkNS?=
 =?utf-8?B?cko1SEdEOUs2UUJOU1ppSFVCb1lDRnpPdktzSEFnMXp4SUgzeWsvaTltSGg4?=
 =?utf-8?B?SmhUZlQxN1JNRmwrYjl1SWt4N0ZEMWd2TU9SZXFCK0NJL3lLREcyZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ebf56b-6076-4b3f-5f40-08de7f91e2ef
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 17:16:08.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLZMbkc9Rnw2+5ctUW7g5BDGqTOLBnx+/s9STxITNNQI+eKylHonkFgumU8HZXKzdiVMThsNEI23s3w5/OJEFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3296

On Wed Mar 11, 2026 at 4:22 PM GMT, Danilo Krummrich wrote:
> On Wed Mar 11, 2026 at 4:42 PM CET, Gary Guo wrote:
>> On Wed Mar 11, 2026 at 2:56 PM GMT, Danilo Krummrich wrote:
>>>
>>> 	fn write<T, L>(&self, location: L, value: T)
>>> 	where
>>> 	    L: IoLoc<T>,
>>> 	    Self: IoKnownSize + IoCapable<L::IoType>,
>>>
>>> Which is the reason why L: IoLoc<T>, i.e. the relative location is on T=
, not on
>>> L.
>>
>> The location has nothing to do with `value`, just the type `T`.
>
> (Cutting all the above, since it all boils down to the same thing.)
>
> So, that's what I mean, the relative location is on type T (the value typ=
e), not
> on L (the location type), hence T can't just be an arbitrary primitive, n=
o?

The location is on the trait impl of `L`, it just may depend on `T`.

For a register location, say, `UART_TX`, it is itself contain full informat=
ion
on location; the `IoLoc<u8>` impl of it would be just used to constrain the=
 type
so that no other types than u8 gets used.

Yes, for the case of `()` or `WithBase`, it is itself only partial informat=
ion
and the location is only complete with an associated type. But this is more=
 just
a type-system trick so that we can avoid spelling out the full register nam=
e.

For the `write_val` case for a bitfield, I would basically consider the can=
onical
way of doing a register write is

    bar.write(REGISTER_NAME, bitfield)

value. Where

    bar.write((), bitfield)

or (`write_val`) is a nice sugar to avoid writing the name multiple times.

>
>>> So, what you could say is
>>>
>>>   - read() takes an absolute location and returns something that encode=
s a value
>>>     and relative location
>>>
>>>   - write() takes a base location (or absolute location) and something =
that
>>>     encodes a value and relative location
>>
>> Only `location` gives you the location. Value has nothing to do with loc=
ations at all. Type
>> inference does the trick.
>
> The value does have something to do with the relative location, as it com=
es from
> the value type. You can't pass an "independent" value whose type does not=
 carry
> location information, can you?

You can also not pass an "independent" value to register of a different typ=
e.
With my FIFO example, you cannot write

    bar.write(UART_TX, 0u32)

because `UART_TX: IoLoc<u8>` only. It doesn't mean that the `0u32` suddenly
start carrying location information.

I just view this as type system working as designed.

Best,
Gary
