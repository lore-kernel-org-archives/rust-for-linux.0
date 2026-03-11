Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021129.outbound.protection.outlook.com [52.101.95.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C8D34CDD;
	Wed, 11 Mar 2026 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233895; cv=fail; b=oyOO7mo+uAD4Z6SOVHJCIzNRt20hgBH8hjR+TMduhk/fzEQhAJeO/mbzhZV+Lw7bkdqPtBs+qk/GhZmMYEsIO+Md4d2xSzwz/+b5zPEDYDWc2myjfAA9Q8tB1Ffoof2OSXrBWZeRmBLs5K048h0mHRi6JgyRTPpTOiUQz3iLrV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233895; c=relaxed/simple;
	bh=A/uaLsYxVxFjCK9S1+KvVW0NH2io9NM+3MXRAZdODpc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MJnMnUsMLSDIzgNyjaAMvC8sYbH5qrpl5YE3ViY6vuhReyBj1b9BskQik7ZocbSyKbUvrA8g1Y4nqkycIrCrI8LrTEmKxQoNDIiHofPnA11X19NXvgNURjumOwilBIrN7JIuaOnqXFcJIR4o/QhF1A81WDgzshey0KR/AkfUJmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UBTWt1ir; arc=fail smtp.client-ip=52.101.95.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UBTWt1ir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4xD4ohpjI+1eBjsmdG3GQfWzzrszrHWI92PVVbvJAe0tCF/o0Wk+6i68ANoeIXYuvhxc/7wdkex1HAuUdtbpfgdeG744IpMnRyNnWVjLIFhGIU/ed0Drzb1gfAsCa57I0XWYdQO/KXyrXv2Ol/OX27h5BOyGSsBf2LY6jAqn9Mailm1QgZmv3N0J2GNKnXUv0jXP6QnQdD69ZK+X8Tun8rEOaPVSu4peTur/3go+tjqJgFYOQhAAxr4Dy/YacNtNdzmKbsgCV1xEP4G7idSLm32ZpMdAOc0DC8mtOA5V+nuZXEZApT7MO9+NGKwxqd+QRDRwl72DLG8wlZhag92bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GasjP8w4LhuNTOdb0JoEvV+4FDoq+ZyVQI1xrnSobw=;
 b=vDsrPe+eH353SLEOxEK+nfraJP077CH1AGL8DXHaar7o2E3VUIFNjn7yqMetwFZav265cd3fyGiHy5xYF3rGRggzVhnCUuF1n3xu8/PG8ogpSKtUPiVyzlzS/gUcq6y0Wk68HDLIWQIF3seh56yjJAmEiMeg9nX4X2VvAy8b1F4pWvW3dTV3DCXjKne9kTjsaM5JqxJsZ2Un8rO/9OVnXzxfZdAGJOYJDlBlxlroMRRF2xxwaoH/dHK30v4sZEljaPVppb2X/4lv3thP3a8FJziJfBspYDTdUBte1GxFRxUm7oISO7FotU8HKWTgzvh/Hf3KgCcfPdsBINMaWMBaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GasjP8w4LhuNTOdb0JoEvV+4FDoq+ZyVQI1xrnSobw=;
 b=UBTWt1irpu7cyquz2Ky1qCuxU5cKISFTw4Y/FTvcqdyCplbyruaxfAtFYD3Auf4b2Wvtoj56u/pitJNBX4ug6n9RFLjpxDbUPyE2+OuAq/Lqy5297dC3ZW2W/7PoHPCmiqS4H5JgYYr8eXGhYjKHB3rw8krOS1R6djDB4ZbPkAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3297.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 12:58:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 12:58:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 12:58:10 +0000
Message-Id: <DGZYYB7XDN4N.3L7ZRCJSQH2QE@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Danilo Krummrich" <dakr@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
 <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>
In-Reply-To: <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>
X-ClientProxiedBy: LO2P265CA0263.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::35) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3297:EE_
X-MS-Office365-Filtering-Correlation-Id: 9431e805-bbaf-431c-71b9-08de7f6dd924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7HX7Y+Inx6n6fiIz9POY5Y/ztSA8xjYEekEnaAAOFa2QFV3XEQLNYsj79n9Dh1Ay6b4j7Rc0gONyhIHXewWTlmztp+UZWP9pwLmFHXOXYh+RvCrLr5djGSGgLiBs0YexxdHsAZzsOJH/mcWrTtsH1C7y1yS8IQwZEBPEg34fWzNEOpQbV10+LwYMgmLq76Mb28ykwNPipMqVtGUTk3/WzltQ9IBiocKdfdcPCyLCM7HW1S/7SO9LR65pJ08JjaugPTLTFcI1szeFR2VJjXPZWE0KT4yOWf5WoyJ5ik9ZALikxR1irudloDTXW0ZsZlVcchQjKsLJaCjGUyhafGoDKQuPKV1uPQEbFZEsHgBw9uHujZsvqjz0L4lWMAi9j3JnrWfmjkxVF+bs1l3oeXqaJJ+yiH3TUhSSAn19caUolRemKxz3YMEAoBRfpz5fFlb2Jsnwast+kmAGfAk/3i1uAbuclioWsYM5FNBRgSWk1vtrH+RRomk1lORunT/LJyXzmGd1pTNsMZcjmDqRzglpH+EtXh7f3m1Q4f8JkUyqH87xfvvFm9wSWAZdWJu+czk+8U3iT7NU2FhzVWNxoUTAu53r8QuNScWnNUsv3GObYBbiNomAFor/vUv6WZSBELlVuNwbPn+SKHauwl5YGraqxjU7pl1jZ3b/XRy5U945p3qA42Ix3OgwsQOJ7J36S6fkMKv7bydjZB4PN3/sO1SPXr28B8MhfEB5ViItDdmhqoc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVIbzE0SmIyS3dKb001T2s4WXpObUxIMEJvQy84WG9mZVZ4VEkxL0lQc1M1?=
 =?utf-8?B?MFdHYTZ3YjcrQlBPVVUxNTFSMWZGWm9yY0M5Qi96Mll5akFIZzkxakljK2Mv?=
 =?utf-8?B?OEs0SWh1bVJTZG5HZ0pvVTE2dGxlaE9ONnVCc2xKMFBNOXNvc0RvM2lPWTU0?=
 =?utf-8?B?V2J6cVZ1UXdxSmNFTzdZK3ZteXpNd0hVK09FRTUwQlNVWU1sdTA5UWU0UHNZ?=
 =?utf-8?B?dCtqMmtoZzNmTy9Tc0pvUFlCN0hOQVhpdTdEV2FnSmh6K2lkYU44WVlRRVpF?=
 =?utf-8?B?bThyZEpWS1lSbGRxMC9MelM2Z3BqZEJGd2N6c1hrS0N0bWxOTnh1NTdZc1U4?=
 =?utf-8?B?cjBjV2dZWitSczBWRDJEOEltcy8wNERUUHFLOU9wZVI5eStETjR3Yk5BcmNS?=
 =?utf-8?B?bEN4KzFWOE1OVFhmSGh6NDRFZHRzY3htb3JhaXNzWmo5cXE2ZkFod0VsRzdO?=
 =?utf-8?B?VE11SmxjUXZkUkpHaDFXQndQcjd4RkowR29Vd2ZRZGRvUzhCK2tNbXowdE4v?=
 =?utf-8?B?eVR6Nm1wVnJHWEViQVFkQ0NUQWRzMFZuMzdoWGk4bTlVYVdzYXZic0MyaVNx?=
 =?utf-8?B?cWdiMk9DNUxpZ1J4N3JocHFUMm9RNmdUb3lyb1F0QzU0TjFocEIyejFMemlR?=
 =?utf-8?B?UVNNem03R1Z2eWVJeFdmY0VVeGt2d0RlQTVRK0RxRVZ6Z0IrdFRWdGU4QnU4?=
 =?utf-8?B?SVV4SmErbWJMdDQyZzRJOHYvekRvSEs2Z0hZcGdJTUdjbHNEOXVXUWo0a2Rp?=
 =?utf-8?B?V0ZRUjA1Rkxmc0xwNW1acVZzRno1QnZUd3hHa2p2SGtFa0I1eXdUa1hNd21t?=
 =?utf-8?B?Y0ZKblVVVVdCb0xVdXhRMVQyeGlYZmJpc0Z0VGdCcjkyQXcvVmhNVzRxYTdK?=
 =?utf-8?B?ckJBQkN0RnlaUDduQjlhVWhxK29NT0I4ZDRGOHI4bE5lWWg4dk1vZFlRZ1JQ?=
 =?utf-8?B?V0VTd29sYmVjYXJpc0ZaNFNsS1c5d2REeDZ4aXFMdXdBREpONjBEbWk3Y0c3?=
 =?utf-8?B?cHRRT1RUaGJZNzNjTFRTdlBnREM4YU5LcTZNb1BiS2RwbFQ0ekk2NjZmaTRL?=
 =?utf-8?B?Mis3clN3ZTZpV1NOY280dWYvWTJma2MyOFBvVUMveEhpZmRnMm5kQW1wT3JG?=
 =?utf-8?B?UFJMZldPa0M3ZVM2ODU4aVFXT0x2NmFwQ2dCVGoveURlaExtRE81ZTkvTDht?=
 =?utf-8?B?QjF0NGw5MTkyV2xmaTNTRXlRc2hERTVPY051UkRnU0hwR1p0RTI1RlMwMm1W?=
 =?utf-8?B?c0Zja2dmVy9weDRuM2d2ODlLd3MybXVmMmZ5NHJJQVBVdFFPY2ozeEJyTlRr?=
 =?utf-8?B?MzNVSGl0c01UbkRGQitGOEV1Vlh5VmpoNWFCU2pnRXBISWNNbnFmb0JCb1hP?=
 =?utf-8?B?ZTBDai9aMmZPUFVDQS9ZTUhRYVR4VmNQWFJMMkxJOUhxbzJIWmk1N1owK041?=
 =?utf-8?B?c2tRUHdVYS9jblJUd2tXMUc5K0hTZUpab01aWnhtNGpvMWVjK0lYRGtQbHdG?=
 =?utf-8?B?UGlseDJNSHBRZmlaMzZRZGRFTzdyR3dZRkNocktwaDBQK1ZCckVxcVhSb2pE?=
 =?utf-8?B?RERjYUVSSjZlSW9YN0ZwSUNFcW5ER2NZK2xBQU9XWUlpa0c4VllkQkdaMkc1?=
 =?utf-8?B?eFFsL3pqOGhyV1dvYXJoMy9COHlPNnltQ2J0Q3ZqUDkxNWFNbC9NVnZObE9T?=
 =?utf-8?B?S1Jaakp0cVNuZnZwUytGaWd3OENFRDRWbTE0R2FSMTVwT1RuV1dOSkFxSndv?=
 =?utf-8?B?VXhscFFnL3lyZzJOTWZ5RElQUW1wTHA1cnRsNXJuSTRhbm1UNW10ZXVjN0U1?=
 =?utf-8?B?UGpUYVRYaWlQLzVSeDFjNENDR1puWkw0QmIzU1dEcTA0emdNK0NUc2NWZlRF?=
 =?utf-8?B?aktTT2J4Y0F0V053RlEzclJub1Q2N2IzREgyRGRIOGRrVFAyaFRlcUVTUmdR?=
 =?utf-8?B?Z0xTNmVvNWQxTmMreGh1b3Q2YkFWZDR3cXJLVGNqai9hZlhRTUdpWWxzSTZp?=
 =?utf-8?B?YWJvdVp6d2t6SDN2aC9NSS9vMGpHRUg5bGU1R1pVTkZUM3pjWklVbHZza2Nz?=
 =?utf-8?B?cFdsOE1Sd05OeE1zUXZjR2dtOENaNndYd0Irc0VsMng4UVlCNVpwUjB5RmVl?=
 =?utf-8?B?aGRJNVBpVzNieTNhUzVtN0hTbmdkaUpveTQ0Y0w1OC9TVEx2SEZnRVdaRm5y?=
 =?utf-8?B?RnRVSU9XYmFDek1KcThKYnQ1bUQvT2ozb0FEazM5c3BSV2ZTQk43WXM0OE5n?=
 =?utf-8?B?dWRCaUFvTW1sVk9wWWpxc3VpamwwZFFBRFJYeEYvd1BuVjE1ellVMXNBaVBU?=
 =?utf-8?B?U042WnllVkgycjBSSnZBa2llRGxrRVB2SkM1Nll4eDJ1dE1vY2VJZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9431e805-bbaf-431c-71b9-08de7f6dd924
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:58:10.5270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HR+kun6NITbhvLEYX4kbtmaWnjBA3C7IZJlSoEhByp5ucXh2y4Q9kT4yUFZcpp9icZWFqBMUnGuFxYcN4aWFbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3297

On Tue Mar 10, 2026 at 3:56 AM GMT, Eliot Courtney wrote:
> On Tue Mar 10, 2026 at 11:01 AM JST, Gary Guo wrote:
>>> +    pub(in crate::gsp) fn advance_cpu_read_ptr(qs: &CoherentAllocation=
<GspMem>, count: u32) {
>>> +        let rptr =3D cpu_read_ptr(qs).wrapping_add(count) % MSGQ_NUM_P=
AGES;
>>> +
>>> +        // Ensure read pointer is properly ordered.
>>> +        fence(Ordering::SeqCst);
>>> +
>>> +        // PANIC: A `dma::CoherentAllocation` always contains at least=
 one element.
>>> +        || -> Result {
>>> +            dma_write!(qs, [0]?.cpuq.rx.0.readPtr, rptr);
>>> +            Ok(())
>>> +        }()
>>> +        .unwrap()
>>> +    }
>>> +
>>> +    pub(in crate::gsp) fn cpu_write_ptr(qs: &CoherentAllocation<GspMem=
>) -> u32 {
>>> +        // PANIC: A `dma::CoherentAllocation` always contains at least=
 one element.
>>> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.tx.0.writePtr) =
% MSGQ_NUM_PAGES) }().unwrap()
>>> +    }
>>> +
>>> +    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &CoherentAllocatio=
n<GspMem>, count: u32) {
>>> +        let wptr =3D cpu_write_ptr(qs).wrapping_add(count) & MSGQ_NUM_=
PAGES;
>>
>> Not really related to your change, but this `&` probably require a comme=
nt, as
>> it has different behaviour compared to `%` given the `MSGQ_NUM_PAGES` is=
 not
>> power of two. I suppose this is actually intended so there's a way to
>> distinguish between empty and full ring buffer?
>>
>> Best,
>> Gary
>
> This is actually incorrect and I have fixed it here[1]. I think it
> should be merged in drm-rust-next now.

Right, I recollect reviewing your series which is why I am confused when I =
still
see the `&` present, thinking that this must be intentional rather than
accidental.

If this patch is intended to go through -fixes, then we should really land =
your
series via -fixes too, otherwise it is just causing unnecessary conflicts o=
n
linux-next.

Best,
Gary

>
> [1]: https://lore.kernel.org/all/20260129-nova-core-cmdq1-v3-0-2ede85493a=
27@nvidia.com/

