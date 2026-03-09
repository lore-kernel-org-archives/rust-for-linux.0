Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022114.outbound.protection.outlook.com [52.101.101.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C9E29D281;
	Mon,  9 Mar 2026 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080920; cv=fail; b=He2v37Bo3KlZ/SMpD0Mi/nZOZowk1VdR8RqVUvtDOTC7uNwc98ux6QYBUqnoD3Rpqb8Ubt8XWysdcvW3qLP0bQwf7t7tHe2DBvUMQLT7po1JqZuSxGRzwtSUQYlpNs8/TtS28UiYRzXc47kYT4WA/HD96w6MuybGzbSMHGsVRBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080920; c=relaxed/simple;
	bh=HjQllKRj2vuPF+WupFqtG5mV80UJ5CCu8XFxt5fiHtc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=LxPKKgfpFujjFyTaUrpm7IJgLaEZNxH11ggDahIx82drTsOknE6b2Hk0yMMWj4HwSGAeqde8HP5H9UPxeM2PIVXtm47bkZd8p26S7xeW9U40Swbr6OSGUmLrpjugHtURqSSs4m/Y4AtNg1+6VPGpvusniYXo/JvcHRCIlSqqx68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zDHSUiKq; arc=fail smtp.client-ip=52.101.101.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zDHSUiKq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kg/5DtSbiM2uSB23Kgb4Pv9dSq5JfRpNl7z8Z6rCKCbddrkSRjyEwgb+Ey0t0jXLTKGckEnTN/VZmuM7m/c/QKCRaBuOiyk22mGxk55sdjN/G1rfS9/C8ZAS+967qxqWG/IlxUX8cUdwNoN2nt2UiBTlhLTuwvmYYxPrNRdpWZEjkXo7toMBezOnQe42q39FVB8BpXV3Bf//BMvEvP0MkhQIL7JbUddx1Gs+m1ovj4/bITcWzWL1ap/BIPzKIrUMZNzytyNzjxa7e/5H7RhS93qs0uioton/KoOkVCcS9MBWSqzL2z9FRuoaitW17Ik5gsODmBOuN9uFBllb5EtltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tztKSX/vJJmULC+p1o25MLcZq81aRSVAo9ibOA8JBI8=;
 b=ZdBxn/A1FFP51biIpWiPCrqcH671AnlxQXhfr02vgXC2n503l43qSiYSOA4MnpjMhI8XNZFzQ33RLl6ofDKbM59vTfed0PmgRJbnjEh3OgM6NzEKeteJzVRQhEum8K9vjaspZjKWiimjwfVl72Xq/c4GArTMCdQwHuqxDsL9JXFjJA9C3KlQLXLMevfvVtxvCmQbjkdiuvvfGhWxCftf47aoVj8dg1Pe5lJx+9uMUEmdM6QM6upsc5mKitLygiyTg90Gb6G4W3vEsJxZpy4VaUWqU6+hnl9lwX9rQ6GiuxShtGui3klajkl3sVWLaQUp7PsvucScKioX6aHcHjmFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tztKSX/vJJmULC+p1o25MLcZq81aRSVAo9ibOA8JBI8=;
 b=zDHSUiKqFkRaNRsgvk1rD0urhh8XgTUGjCAwtfR2R+rlg9n1d+8K43TGxpdwJr5LuJLhe5H2gT6iVsiWH8fl6HzY65owdpvyc9bSs1aIQF2R94MR9dqfIaItAPM3pqsfZKC4T6UlwyQ8P5FFHQTaJc+5EItlDDvNJEx+P+YsMbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8899.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:48f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 18:28:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 18:28:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 18:28:34 +0000
Message-Id: <DGYGQ78QQUDO.1TVZTLEWVG6HL@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
X-Mailer: aerc 0.21.0
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
 <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
 <fd45410a-43cc-4d8a-a750-6f3211dd2797@nvidia.com>
In-Reply-To: <fd45410a-43cc-4d8a-a750-6f3211dd2797@nvidia.com>
X-ClientProxiedBy: LO4P265CA0313.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: fe235b42-0ac1-473c-27cc-08de7e09acb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	VB61MZzQreJF2GXdSXm+PuPrigZos2+f+p6TNsgmClX3Ivjnt40sAlQ/7bqDEvMPn3qS2bGBlc+WTvAqfqzjdnbLf9nTUeNmKqfb327skIg4CYvc/y0sPadzz3caOUSaA0J6QQ5pXjjeyc7D6iWQuMYZQVU+62TPwm0S/DKVSul6KqV2EBgVX0wyXWUoy6FvdIl63WCaUk0pOACT8VDJsq6/dZP1ZNti72QyCerjSJYSrtat3povUz5wB2HaPTnkCTuM9YDSIsYA+OhxFmSazLh6zAP1ouwwolB1lzj6ewgBTPkzZVixKHxvyBdymtLols7r5mg2Z2xie3um+dbYemPolxKgeJhYULgdaGBqTSi/lMlwYEIl6oJ/HRO8Qpq5meDM0etY6/IgwJpGPMqeT14a1vrVNWGae8cxLL7GLMq2jWCIjX+biyceMinm0ckYAva0aVxcuQIabZX3dyqw8z0wtZhU45cwm8kTOZdPZebSKh9yyzxDqoaFM7oO0JXvvibvFHSMjminpt+s0h/223/9FtzeqNLSMtl8cgYPgFejeLfTKsna3r/5HPxwH9wjB6gQyCAr3TYNyHlbwM46f6L7bzON0Smcnvs02K1kuGtI7A3d7AKym8+yyacIS2ZJVE+OgyMzSdbzUgjrPRkhGftvI3QXkfFwHrlE/jpkk6VJ48rf7UeQxqzNteGYJgDSvIhr4wv8qXUUeXRO7EULsBTvI+h5m8lKOV0LXJ4+DT/sUsan/obsPGR4Zqfp9oMzwZ63Qs9dekrGIiZvbeTF2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkhzM1YvNXBaKytpUkg5aHBGUlhnTnRwRmNsMDZVN2NxUXdHdkk3bkFHMlVv?=
 =?utf-8?B?Q3dJMHVoSGprSWJNY09xSVFVOEoxb1lLOXJZcDlIQ3pXNHNicGJsU05DcHhp?=
 =?utf-8?B?QU1SeVJBTzFBMkNnUkRnelNncWRZditURWhDNGxwelIrOVZobWFQNWFZN2Vx?=
 =?utf-8?B?TGlpN0VDTStGUTA4dTdmL29JYlFMMVQxdS9MVzlaVWFwSVZHY0lWUmw1Y0Jq?=
 =?utf-8?B?QzZTWE1RdjdZUGhuTUV0YXhLc0JKZzFEQzJYelJGM2dzdDUyVTc2SXl4d1Ir?=
 =?utf-8?B?NzdlcVI5RFpqeXYvM2R5U05BcmhsZFEzTjhZZ2ZXUXBJbitSOTRwa2ZkRVdt?=
 =?utf-8?B?WkNSZU1JelFLcjN6QUI5UVBEaUdBeFJzNGdpNFdTMWJKMFVXR0JxcmtLWmE3?=
 =?utf-8?B?V2lVZytWQ0ZVSWx0bm1EdFFmNU9xVW92bHBhWHZDVG1ZT0NjbDRyamp2V2ha?=
 =?utf-8?B?Vlg1QXlVd2o1c2NhdkxaNmljVEpINVBacDh2Y0FvMlRub2FDV1lwK1BBdk5w?=
 =?utf-8?B?R2ZIU2Q2N1U5NFM3T3V3bDNXcXl6dndLdFVTV3M5ZjJERldtZDlMTk82TkFo?=
 =?utf-8?B?YXorTlR4ano2aWZuZnZqOW1OaC9ocHJLejJsMExqdGxNS3o5bGxCcDdLWVhl?=
 =?utf-8?B?dGNJaEN3aE9kQmxjb2kzRWRHNTk2TGFiNlZKWjVldWE1R0JsNkM1bmNVUTlO?=
 =?utf-8?B?QXBmaFdjcXovdGU4bWxsVUJHWDdRUE1ZOUVDUk1JZXhkNGhlSmpHQnEwbnJG?=
 =?utf-8?B?YUdYa09PbXpSY1Q0anNCTGRoV3NhQ3VBc1ZJcWVtVmYwdEh2RmkrL3I4aTNo?=
 =?utf-8?B?K2llQ2wrM3RXUDdrYzBnNXIvVHB3eG1QM1FNWWVwT2ZBN2k3L3hOc3V3U2V6?=
 =?utf-8?B?S0t2T0FNRXpGOE1IbDNkcjhpNkNXWk4vZlRBWTlrNWp2WHdaZXR2TXMxUml5?=
 =?utf-8?B?YnZEZU02LzJ0aUgwUFhWdldISlZUdnhkKzZRbDlybjZCSGdSUVFnN0o1dVVH?=
 =?utf-8?B?TjlTYVQxQ0tnRWRqT3BnOUxvMVpZaVNESFdLeVhkSXVDV1BWZSttT1NxbFVr?=
 =?utf-8?B?dVJ5TnJnOTFxY0MzKzFnUDFTZVRYbXlrQlZsbk1nY1BDU1F3T29Zc05XYVBl?=
 =?utf-8?B?b0ZWK0owQ2RkWVlLRVVGMk1ZekRBbDQwa2V2dzROY1BuTjZXMHU3ditTRjVu?=
 =?utf-8?B?L1FxSEpBMzIyU0FkRk8rN1IwQzdoNVcyK1Z2SG84blQrV1FLK3NtbFBHNy9I?=
 =?utf-8?B?WWlwVzRBUk1PbjBhZXdBUjNGSnFpam8wTTZPU2lER1d5YXRwaTdkenV6TXZ0?=
 =?utf-8?B?QzRIUXF0WDhQdERQVTNodGgwQlYyTzBHaWp4aVF3NWpOeXRkTlNacjZJN0hv?=
 =?utf-8?B?bE44aGlZM284aVdtRXJoditZNEh4QlBtVW5BQUpmbmtGRThnSG1uSDFrbVps?=
 =?utf-8?B?dGtKMUhYWHB3dm9obVQyMTZoVjRiZmwyLzFQSG9DYUdSUlFxbm5ySmR5ZG1l?=
 =?utf-8?B?QzNGUStOYzlicjlWSjFQRDhrbk1LQmJ2QXpYbFhCQVRRY09PQjhidzJ5VG5U?=
 =?utf-8?B?VjhONDJKd0FtTm9mYlNyM1BpOXpEYU45byt3OVY0MHYxZmNGK2N1cEVmZ2FG?=
 =?utf-8?B?RXdxZXhxUzdhZlBJTnhwQytBQjBqdXBvZGNoUnF4KzIvRlExQ0VkODIzREdC?=
 =?utf-8?B?RVViNmV1azRhTTFWOHg5R3lmczNKaDR1MUxIdDc3T2dCNG9TZnl4U2ZydDhH?=
 =?utf-8?B?cEtuN3BrNiswYWlVR3FnTTZWb0dSOFpUZkdiaExTUWgwY2ZwV0N2MG9Hd2xz?=
 =?utf-8?B?N3NsTm9OZ3B0Y1c3eVJpaVRSK0oyd2ZWdVhTZkQvRFFacTh1Y1JPSVNlbW1a?=
 =?utf-8?B?R2ZmbmJmWldsT2JlWGN5YXBEb09EN1Z5QnN2OEg2Ym1iZ3RyZmx3WG85eWYw?=
 =?utf-8?B?Tjgvay9iZFhQUUZ5NDFlK0tRRXZjOFpRWWdnN1AycitocnVZQlgvOHdIcGpZ?=
 =?utf-8?B?NWsvTndybXpENWlDcFRZMkNRbTgxK0Vub0FYUWFkM1FISXlCZkYxc1NtOGlX?=
 =?utf-8?B?WjIrS2kyeExDanVkMmFYUllERURUaWlLUjBJK1Z1MVRhNEVkOEZsNWlYanNt?=
 =?utf-8?B?VmtoWmFCMjQ1dTRGdG0yTUR5RDVmRk1NVVlKN08reHNZUjlVOFZvaGFJa3pN?=
 =?utf-8?B?UG0rb1NOQnEydkNxUEVRR0doNmdyVy84aHpFRGxvdDZEeWZZbkhsY2lzNzMx?=
 =?utf-8?B?VjNqNDlVRk5IWkpzVTNtNkZCd2tEWmhLM3ViaTIwZm1iZUw1UUtNL1pPOFVz?=
 =?utf-8?B?QUhCR0dMc2R6UFZIQ3IyS1YxMnpUSDVHQ1FVdjBJUGhCdlNPTU5kdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fe235b42-0ac1-473c-27cc-08de7e09acb8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:28:35.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GCWIOXzpHgk7QeBPEt5FrK0V3B0pBByoE/ddK7wLXdSg+SmZX8zLtQOhCf01OR9yaZACLCvFKLCFbYXfBh8qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8899

On Mon Mar 9, 2026 at 6:01 PM GMT, John Hubbard wrote:
> On 3/9/26 10:51 AM, Joel Fernandes wrote:
>> On 3/9/2026 1:34 PM, John Hubbard wrote:
>>> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
> ...
>>>> TBH, this is quite a readability hit, the previous was much more reada=
ble IMHO.
>>>
>>> Yes, I think so too, except that "WithBase::of::<E>" makes a lot more
>>> sense on-screen, than "&E::ID". The latter just looks quite random,
>>> so this part is an improvement.
>>>
>>> Let's break down the remaining troublesome part a bit:
>>>
>>>     regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1)
>>>
>>> * "regs::" can be omitted with a "use" statement, right?
>>>
>>> * ::zeroed() maybe should be the default behavior here, and then
>>>   it could also be omitted?
>>=20
>> The issue with omitting it is it still needs a constructor? so if not ze=
roed()
>> it would still need ::default() I think.
>>=20
>>>
>>> * .with_value(mbox1) I'm sure this is necessary, but the construction
>>>   is unfortunately much less clear than .write(value)! Thoughts?
>>=20
>> yeah, also perhaps the whole thing should have a macro! to de-sugar. The
>> patterns seem somewhat repetitive.

Once we agreed on how bitfield macros should work, this could just be

    bar.write(WithBase::of::<E>(), bitfield!(NV_PFCALON_FALCON_MAILBOX1 { v=
alue: mbox1 }))

or something similar.

Or as Danilo pointed out, for the generic mailbox using bitfields isn't rea=
lly
meaningful, so the bitfield should eventually be removed and replaced with =
a
direct write of primitive integer.

>
> Yes, and actually, I don't immediately see why we have to specify both
> a base value and a register name, because registers have a fixed base
> address.
>
> What about this instead (*very* approximately):
>
>    // set up or construct NV_PFALCON_FALCON_MAILBOX1:
>
>    let reg =3D NV_PFALCON_FALCON_MAILBOX1::zeroed(&bar);

This doesn't really make sense. What does "zeroed(&bar)" even mean? You're
neither zeroing the register on the bar, nor constructing a zeroed value?

Best,
Gary

>
>    reg.write(NV_PFALCON_FALCON_MAILBOX1, new_mbox1_val);

>
>
>
> thanks,

