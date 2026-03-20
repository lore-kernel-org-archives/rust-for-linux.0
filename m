Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020113.outbound.protection.outlook.com [52.101.195.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C830E85D
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038734; cv=fail; b=T58PcO/GPBXB7cOGwie20jYlyXBEUOb8AHCKEHMDe1o8GRt7yIlZa1DeiFQlR0BlOERP9Q0NREmDoh3Xl3YppIdeLq/gHZLHN6NBUZWx/QPwRKiS8HorkL6U7MOdqGG9mgigmZ/nOBuB6n/7Bik8+Q+hbgQzl4u4Jz2SpAAY4Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038734; c=relaxed/simple;
	bh=QhVls3FCmOMoAyAIvyz4NCrtc357yylpUUsinZKXSQw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=QM8oBytyPM2sNXZlMF+nQEyXOYY9v3f8ylhNXa4IulZkV5ltECidX1aqHDIAy0/RFhrX+NzJnqtYB6D3aK/jyzE77vJQB/NhGc0mM4QyFD6CF5Rr5WVt43PPo+AGwYF8JnsvheHyJPMMAhBR82DRKs8/dg5hXrfN9FJ+gTgg2mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NvDwm4JH; arc=fail smtp.client-ip=52.101.195.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NvDwm4JH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AY8np6cpbnceQoYc7ZLduNMZmHM5mqGJrka6wZLQEiRIw4KIJCLcDwISxpBJ6Y3EGvNgo5qmyBXCzepSBoMER8O4ijD1iSpTaaECkzh6TqxsX+rjtPOudvDxRsuR/uRHblV2rVvG32/1sN5gCvHRgDyHtI2uXGd6VIckCOX2S/liZ827IFt6jahx3e1fS/ETVof8x4RWJpTWlxhRYnI4M/y47/c+15XnfBXWviBUvNjRT6tK9hNsO3K0E4wENDlQXQDPzO+78SJePr9UrpmoWEKNBpIm5aMsEwtlcC1dECMZBfALGN4P5bwzSPH/UMrHcLkQuyBD+NCaXbJHqtLsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhVls3FCmOMoAyAIvyz4NCrtc357yylpUUsinZKXSQw=;
 b=eqELpb92vt7yvnwwfUh/h8ANUp6ZAzN19ZszFOhRD5kKF9NZ67BF+COEx7bfE1gFcFkUFcZpVIZtl5ZGJZfis25ieYrbRHpe7G2rrMM4zIPxrq/DKHqHqWYs1RLNFT9tPcR3OVwZkWvdVtoxQao4Gx1Vk/fYpbfD1Mwhg+9OW+kjAxKlC0YGe1jUR4Z7Z2gy35bbGK8rdYFkAOAqhoIdfazwp0s+BLCS0jkr3OVLnO2BY3uwhbyMdZmX4JCeehiqs5AwVcCY0E2xreOPaYEoLuv3tAhkVTLho9i9VXDvCucdGu03NLTZJrorDq5Qre/6qPq8bo06zyv7MnKF+Fa5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhVls3FCmOMoAyAIvyz4NCrtc357yylpUUsinZKXSQw=;
 b=NvDwm4JHVlgteN+dD9Wswjo7Rs26uyS6vCq3qPntMP1fhZePK7qeSuzJnAl9UKAnM8W3PBcL73UOYK4NQfKXjty5G1hVVdDMpRmXKIBMpUg1TTDdtnxjHQLbSZKvAyErr/0oK0ldyqxJmS6jedPFg/vfKw74Yx0OpNjL3rOdG+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7849.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:419::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 20:32:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.022; Fri, 20 Mar 2026
 20:32:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 20:32:10 +0000
Message-Id: <DH7W8TLZAKUB.2E0Q2VS546HBS@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Roman Gushchin" <roman.gushchin@linux.dev>, "John Hubbard"
 <jhubbard@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Zi Yan" <ziy@nvidia.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Jason Gunthorpe" <jgg@nvidia.com>, "Leon
 Romanovsky" <leonro@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: Sashiko.dev for Rust for Linux
X-Mailer: aerc 0.21.0
References: <1f94cf47-9898-405d-bdf2-29e21cd87528@nvidia.com>
 <87ldfmtfk7.fsf@linux.dev>
In-Reply-To: <87ldfmtfk7.fsf@linux.dev>
X-ClientProxiedBy: LO4P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: b364b3b4-0d43-4d52-9369-08de86bfc339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1AyNQ7jqhQaZxAl2NQZTJU5GLJ4BR++baZl0zZsLNLmyOb6uzlwb4t/3hbgEBEFNXtUn4yft+sROKna/puAXIix13y4zmkqqTqJij7NTgxF8tv/rDkRqQl2Iqu4xmPk+/ZGfzt3qzkPjcZGKzcHLx608wkLkkiQHxd8bRi9beFri+DuLHUSWlMsnWaxisMZ0maa8bXICmvrjfPorDJicS1CYp0zu8OcqV03vB1iYG6J7TKMN2FJJa1CUchBbyFjwCd6ttcifzHUuoFfj9F+uErMM0a9sJlbeGGOz9JwwwU062ohP4bF6ZYmy0DpoYwsuZKOx+FL85Tc8/RIfkDPNSMRp8Y5LIR1FfwmOBp3w7F7i+G2TZIIBoX806eB3claUCJKqJcWhA9RMLLiB4Zh3yDsm3hzjuMjuVnHj8Jt4FLYNWEFiV/OTYhTTEAAbdK/1nXCXu0JGCaIjp7cL3UZngD0ugmbZA4jFGmX3n33cu5WFgtvset9R75RUhmBG8OU/WIwKRep/Op6zrQS4mixnbiZd1cZNLJtPtf5RRJ1hyOgu80XjmC6+zTxySfHGQrio3dDhYcCuI/cZPLmtkFa1/K6uXE1hNKgbjyshEvsgGuHTTbf1hLPh/Psnc0t+HBUOYyglMfGTx22E1oqc7TlyfCfbL9hDG0oMn1Zu9usvkuGaOoCOnbi5yw0gfWmLVC/Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjY0aFBoejBFMXl3REFpMWt3Z21SMnRQeGo5dTZOQWdBbzZRQ213NmZXazUz?=
 =?utf-8?B?OCszY0FjK1RFNmY0K2ZTN2RrcWlJZUpGam0vbFFRS0JyZTZnUWk3TFdPYWV2?=
 =?utf-8?B?emozSXR4N0k4UWF3VEpVMDI2eUdJc29UdjNTdDBVNEdWaXNwekhGYkR3TWc0?=
 =?utf-8?B?NEF4NVRQS2xXUDFFYjBwcVd1eG1QZEQxKytqTmNhU3dlR0p0enUwczVhelRh?=
 =?utf-8?B?NUdySTFaSTV3VUROYWJJT00zVVBDQ2IyNldxZThPUXI1UVVkcm5jT1NGV083?=
 =?utf-8?B?Y1NpeU1pdllEMklhUWRGSnNEeGxpWnZWWnVOR1hieUxJNzEvV3RmOHh5N3hH?=
 =?utf-8?B?aXZtTG4rNjE1Q1d1QjMzbktUOUphNnVTMXJwWHJncHNIVkg0T0N4KzFobzdU?=
 =?utf-8?B?UWQyYksvUnpuMzRZdEo1cXQzS29RWkpXSWFpenZ3amZ4TVNLSnFZWlQ1M2l6?=
 =?utf-8?B?L2tsR2R2YkZwV0ovY29MSFRSd2ZDVnRtdHNSUFlDcDFPZjlYVnYwQ3JwS0J1?=
 =?utf-8?B?eGFWODVmSkE1blFKalVlM2ZmaUpuQTMrM1V6dy80UEFkSFV0dHZGMzZJbGhR?=
 =?utf-8?B?b1VxTlRXVlpseEhoWlJ2SW5zZExlN09DL1pDczFwSC9IbDkxRlduYWVxWGN5?=
 =?utf-8?B?eWhPRUVRN3o2SzNyZHA2RjlQNmVEdGlaWXJ3SmxzNU4zdjVHQnRpdUZUR0g0?=
 =?utf-8?B?cnRTK2xMejdnV3pHMkx0ZWxJL0NBZWRXKzdsaWFmUXhUOUJodlNrY0xzNHpQ?=
 =?utf-8?B?WXJScEpPZjlYMktEL1IzS0FZN3NYVmZoNllDV3BqSzFSckViMlBqeFlzYW9E?=
 =?utf-8?B?bGl0TFBjdlFsbnM5REhYc2h4aFF6anArMWl2OWFHN294S2V4bndPWTZMelln?=
 =?utf-8?B?RXg5d3QxMHBBT0E2b21YOFNxRWdYNU15ZkM5RVpMZnAxL2lMSjFrSFo5aGVw?=
 =?utf-8?B?b2RrNFpvUG9WbzdrWDUremE1eEoyY2RHN0RGVXFjV1V2blU0clBJTXRCeDBC?=
 =?utf-8?B?S2h3NXkyeDV1ak5Pa2xubWx3ekMrK0dpMzNOeDdlVCtoYTF1Yld6Mm0rVWkr?=
 =?utf-8?B?NjFXMDFSdU5sbzIzcXlBRWprMHJJSFc1dVZPaXliL2dpbS9KZGQzUmFDZ2JH?=
 =?utf-8?B?NWlXUHRyUXRlMjJFdW9BRWVPNmhjekJLMG5BazJMejVzZi9xR25RRTdKenFS?=
 =?utf-8?B?Qk52Y1pZVUlpYWt3cDdOc1hOUnJvWnh1Sk9ZNS8vNWVrbjFVSTkyYk1PNjhl?=
 =?utf-8?B?NDlOb096VGs1amlzUXkxSDA5YVQyVkwwRzlQbUliN01IVzNNU09CcnMxemhM?=
 =?utf-8?B?TTl1eXhLWXNydmR4QTFTZWhvTDdjd0pqVmNNb1l5M3FPYWszSmNYL2lyZUtk?=
 =?utf-8?B?ejFhNTBjNjI5UWY0UklURkpsRS9WQ1Y4STRiVUlJWlNZbjFESFFGT1J6eUlq?=
 =?utf-8?B?cldSeGw2a2NBcVpsZHFTMGMwb1kxUVdjVTUySVJNQWtwbTdZV2VhWVlqa1RR?=
 =?utf-8?B?MWR0NVdEZTdROXVoVm1GSC84d1hJVCtkOENnY2Rudm1Ja3dwdmpZNGxPNjFE?=
 =?utf-8?B?Q3RXUnFQbm9DaHlDWDRZb21xaUlaSUJlTVNlZ1U4Nm1LTTk0VmRRNDNXQjFh?=
 =?utf-8?B?T0p5OUpGdzV1VHdOZXpaUjJHb0FTZGJCd0NERlp4WXFWQVg0eUZTbEEwL2hE?=
 =?utf-8?B?SXExNnVhYkFaNWRMUy9OejV6L1JJd1hpVDNDVzkxL0tLR2sxVkNBazJ1NTAy?=
 =?utf-8?B?czJkMXpiMDkzNFNnTkFQRWVvcHFmSURhWmVkcUF6SzYzSkpCTW83UkFGZDBL?=
 =?utf-8?B?dWszVVhNR2Y5dURINkc0ZUJieDNVd0trUm1QZE4wa1Q2V0xmLzM2SmQ4WkVr?=
 =?utf-8?B?ZzAxNGxDMTNtcVFxR2hwRDlxbWphNXU5RzhrblRYdzZQSjN2R1JYVjR3Z3lQ?=
 =?utf-8?B?NDJ0WHluVzUrWWN2bTB2dGtBeWU5bHdpYzVtU3kyWEc4alorbmJodFBIK0U2?=
 =?utf-8?B?clZEdGhweU9IeFRwYlYxZTdaOUhsVlRHaW9CeXpzVExENGE5ZEoxcmdCZkp2?=
 =?utf-8?B?K3VMNVBJaVF1Rk1wRUNmY2l3UEg4R2QzNW9DVXBQUStUSnNhY1JGellDWlJu?=
 =?utf-8?B?Szc0amdHZ21OZzdCbSt5akdhTGJjRXNnYUZvODhXbjNLQi9BTnIzSFVlUWJv?=
 =?utf-8?B?RDJiOGIrdVJNUDFLeWdHWVk4VWwyTWt6OFlBY09zTXd4bmRiWWJ6RHRRbWJH?=
 =?utf-8?B?Ykl5dUhFYlZlMGlDMm1XbTJ5dS9oa2Y5dzlYRm5PaXV6T0szV09QcmZrQ0Vw?=
 =?utf-8?B?Z0M3bHA2ZkxHVmljZE9COXdKRU51M3ZVWHVjbHdabjQxT2NLdjlYUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b364b3b4-0d43-4d52-9369-08de86bfc339
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 20:32:10.6312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siZAB7ydC1Gs5Gr0ag1AtNLRPKntLX9AvPPaB4nIF/VddOi1TdCiEJPOdpHk/Qjxj/0DDbbLZQPiB6DpKwOatA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7849

On Fri Mar 20, 2026 at 8:24 PM GMT, Roman Gushchin wrote:
> John Hubbard <jhubbard@nvidia.com> writes:
>
>> Hi Roman, Miguel,
>
> Hi John!
>
>> I was delighted with sashiko.dev after just a very quick peek at a
>> few of its linux-mm reviews. Up until now, the AI code reviewers
>> have often fixated on trivia, but this one goes right to real
>> issues that actually matter. Sweeeet!
>
> Thank you!
>
>> So what would it take to get similar results for Rust for Linux?
>> (A bunch of us are working on drivers/gpu/nova-core and=20
>> drivers/gpu/drm/nova, which are written in Rust.)
>>
>> I'm guessing a combination of "add rust-for-linux to the list
>> of mailing lists", and a whole bunch of new Rules/Skills?
>
> Yes, I'm going to add rust-for-linux (will appear ~tomorrow), but a
> bunch of patchsets which cc'ed lkml have already been reviewed, please,
> take a look.
>
> We don't need any rules/skills to get *some* reviews, but we certainly
> might need some prompts to get *better* reviews, both in terms of bug
> discovery and false positives. If you'll master something, I'm more than
> happy to give it a try.
>
> Thanks,
> Roman

Hi Roman,

First of all, great work. It has already produced useful review on my patch=
sets.

I've seen a few false positives on Sashiko which seems to be that it unders=
tands
the Rust code from an userspace Rust perspective and doesn't know some of o=
ur
unique constructs (most notably, the way we handling bindings/FFI).

I'm preparing some prompt changes locally and am testing these out, to see =
if it
reduces false positives. It appears to me that the prompt for Sashiko is fr=
om
https://github.com/masoncl/review-prompts? If I made a PR there it would
eventually land in Sashiko, too, right?

Best,
Gary
