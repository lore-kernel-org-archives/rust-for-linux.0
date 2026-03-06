Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020138.outbound.protection.outlook.com [52.101.195.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BBB3148A8;
	Fri,  6 Mar 2026 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772761625; cv=fail; b=AOS3/o0iZ2l3N4b4U6NFqlcUyMvGLQw5AIAZrEHtJZF2DN3lN+4zg6HpCcE159vOCn0a8bbH4CSCUziB0AvC8UQ5dMDvAUJAjv8h04Oaadh2vbrpqS8rKMlKmFEGKELV3opB7kvSc82aD0FIRViqwUlGIPoRou08+7Fu8fW5rjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772761625; c=relaxed/simple;
	bh=Djbv0uKrEvSVFKHr4q7rI4CG7S4UgA24v7kkx68BeGM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=KX1erL9uc0u+ZhJMlHsy+emrzSnE6wejazKyu5niWPKsarWOyWB5K8qmyBcbEvkOKnhy8HTk9pJFAWpsoJlMcljDh0sUsRSnGZ79OKiUiqPbepYuLZyrkaOyW7Rd53jG7XWexv0+fvUyl9xVHwYexjrGNGy/rAbORl+hYkp6W+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EYgnI7rm; arc=fail smtp.client-ip=52.101.195.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EYgnI7rm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhUOdTMsK5fbHtCgtI8GDJiwbxIBFLaI7tChaTjHihnXUJTivoPcVadA9EhgU68cu1hhCAxebTBULlGHa12IA+7xCcmxCFPV6GTvaObZK4YgUfKuxuEvS4I6te62XemamcEakk+r+mFj76b9ujC3U/cLgu8woA7f1xus+QyQOwsw6cIZUz8iP5PCDIqnJy46kVWNfu9csWBqrdwFs7wFGHgBjkui6TkuAQjLeBLpOia8qJRtSfwT5cvXogQLjNZbBClBE+6NaTCz7jRGY/+xifYziWEdicJuq7iLVp/ozEvALa2SQGhq5o+iYAracZxNkCDoLs0jnNvbCscg/Mispg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBmxSlzTLvV6LlneZrlnZO14eFNjxE2kQvUt7rk4cWQ=;
 b=zJUTnfr/0tSepAIpIF9G2c/EWKj6t/ORT6D/Kw9ajQy/2lpwscxhcXXh3KgZ2yjKD6qqXneTCHLGtzdJFRl+vp66GKY2kR/jlJ2lJWvjXUyFIWqfgy69AggiUylzP1KAr+j1PNYgEr8PWlpYajZQ5p1GbqetuhjkSzjMtsOVkeLSKRqqHUbx3DJzdh5bTw/Klzp7hdRCFpkx0knb7vu/Gry0SVOn1u2NMUSUpeveD4EZpHDxEIZFJWMNjNtNVM8g37iAvnJgGOnLm3bsdhDC7maeRBo9SSGbOFDL36KowthmzdBobDaQkPY+qThTxrL2WgwrrGi+GKTHUcVAppK6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBmxSlzTLvV6LlneZrlnZO14eFNjxE2kQvUt7rk4cWQ=;
 b=EYgnI7rmLXFj8n0kiDa0nsx5pLRCw/9DCjeUeLWksCJX0Gs2fg6v6dYVMcN2faVN9577ORu/G412VI6UWES3OfGAW2EtGNuWIElITHR11+iOVLT4EMIITmopeTdKCvOl1m0HIPFg6nh/m/oN0cEE9hHGFJAykMw+PULZPJScXtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2515.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 01:47:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 01:47:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 01:46:59 +0000
Message-Id: <DGVBJOYKD5P6.5I2KDBIVJCIP@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
 <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
 <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>
In-Reply-To: <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>
X-ClientProxiedBy: LO4P265CA0306.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2515:EE_
X-MS-Office365-Filtering-Correlation-Id: 779bdfa5-a5b8-49be-78bf-08de7b22421a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	A01E6I52LsrLxpu4TiFqD1k1XPOa7+SIV2HRzffzpdTCETfhTWYtauBbRnqYvXv+HQA/TBrhEflGgBZn0evnvBncspgX/QsMv4OLjDkgYXnAz5NbK8J5aCwUQx3alICSLJLawjoWWWPjD2CzzxGW03jlzLfjJQCsCtkehfG3vz/S7vuK22AuFHVIu4KYIB8TYyI6qce6288XA/pSNpX4MrUtVa+BazOKJ2sIHv5+Men/KYva7Mg22LjBT5ujf59JuoY8HhI0HpwLJ1e8LQtFZHqUyvUtvDqfS3rv+dZesMjhQWeanqhAb/04dJeCRDXQKyNCoefHfb+UOFQ79DjGdWUP8jDWJtb3HkcxmlVSoQdFSj0JkIUe5yAnv74IIUbSi7u13VFQUFtuFJneRqGp1MpqUHp4UHLbzcRHKGC+Hp5iczrntftNdTpy7kySNzwNno9y8ppTv2RUmxaiuUDE5fWZ8e8Hwki/+gLOjhc2sV1v2THdC87nPigW6xmi5FJ0r9oDhJ+9RAI9W3BUOsj4ODkXIAM1uV94Ycho1S6Dj/jTb7TRFonPpfsUbI5RaWIOfqMYr+94xEzQhAex3ERWxZOZd2E6Ad1DFSRbpy8exvllcET4WHVWKDAVF7lWTMrO8x2LMSyM5oSJ5t6Lhqr4AfWUYtx5cz16Vr6OlT+UA7AJIwaXUwipuUoCdcVkp0wGXytSCR+v30u5UYMvciAIxJJaDRNDJ1tz0+t7l6chINk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnE4SkdPc3ovYTR5aldGY2YrVjZnc3JaT0pOV0xob1hRQUJjTCtlVjViVU1U?=
 =?utf-8?B?WHQ0eGl5MHU5UUllUkhhL09CVmR4UjYyZDhTbFU5ZXNSZVVTN2R6cmo2SUh0?=
 =?utf-8?B?S0VJZUFQbzVEZHFNTXJWaDZTYVZPd1hBK2JoYnVqa1J0Sy9ubi9Hd2I1NEFw?=
 =?utf-8?B?dlFySTNPTkZXT0ttcjZEbE9XZ25aUjhYYjZiVWxGemZ6TDB1RmZ3Q2l3cW9V?=
 =?utf-8?B?c0RCenMyS2NaYzB6dUhnZURUVTFVUms4dzR3N1hyVUxKODJhZVpldXZhaFRU?=
 =?utf-8?B?SFZsWEhkNzBCRk9RaFBsNVlVNEhWektwMFdsRUZ5Wm1wcjg5cWhZSmxtMXM2?=
 =?utf-8?B?bU5iZThzRGtKV2o1aEhRTVNCbUkyM0RMRzg4bzkzeTdLNlQxajNCck5LMDNC?=
 =?utf-8?B?NGg0UXFVdnlFNndrdzBwd1c5clY0dkFseUd0dnE1MWdIU0hEdGd3cmk3TFJv?=
 =?utf-8?B?dWltWm81TTBueXhXM2ROcUdnTWxTak5ybzY5a0g5OFdDc1FrR29tOURhcVgv?=
 =?utf-8?B?Qi94RVo1NHc0OEpibTJmUHA5RkFQcGhwTEVhTjcySXhHeUtqRVRaanlCRzNI?=
 =?utf-8?B?b3U2MnQxQXpNN2hrOGQ0dHNLazI0UlhUTUo2Mkp1Q0dqT2laVDByNUR0Mm1J?=
 =?utf-8?B?VUc0cWcyanhvQ08wZlpZUWZaUHdvSGZQUUJ1cG51SmE0a1RxTkZ2dmQyNnM1?=
 =?utf-8?B?bmFQckQwVlBaYlVtRU04cERncE9OQXY3K2RqSTFGbXA4WVFWS1Jhc1N5OEpX?=
 =?utf-8?B?SVZvNHlyVEl0T0tiOXNuRmw5dXJ1QWE2eTVodnQ4Q1krelBtTUJmSG9OQWZH?=
 =?utf-8?B?cDJqNHVnWmNwaGdUQm5ZMzB3MHpIVzZJQVpqcC91azlCYS94RDR2N09Zd2Rv?=
 =?utf-8?B?c3hRUEcvRFcvYkJSYWRqSnlVSmh4VGswVDVGaXVORFo2MmczNDNTMWlvMkg0?=
 =?utf-8?B?d2dGNmdVcFRCYjBPSnZwWHk2VUNsOFMyZmFzem1abzE4S28zU2lqS2lLT21O?=
 =?utf-8?B?SzNvSTJrTk9UbzVLL1JCTTJaSlZpYU5zbDMvNitXTHpsbDRndE9ZWE03Lzk5?=
 =?utf-8?B?aFN5MmViN3RQYmoyTTlGRStSQ1l1U2JpbEQzR1daQnYyeGRqZThwRzAvSG5m?=
 =?utf-8?B?Qi80aHNpbzFIdDVIY1p4Zm5HYmNYUXVWanhuMzNGMVZUL2F1cFdKTm1uWVk4?=
 =?utf-8?B?M1lORVBsbVNYb2UxY3NMUnhwL3U2aWhGQnNzeVZ3Ymg0cGFib1BrL2VTWmdR?=
 =?utf-8?B?UHo3VHZxWUptSE1Qd3Nuc1FpY2llWnR5dVQ4eE01TGtRRmpCRDJxQmlndU0w?=
 =?utf-8?B?cDhuZGg0Z1dGaDFWZVppdU1Mc01pZG1ZeCt5TjNqenZJdkxQakxFZ1ZHVFBm?=
 =?utf-8?B?ZXNpblVoUmZibE5sTWwxSjlZWkUwWElCdmhkWVZoVXBqcHRySnJaYVBwMmNB?=
 =?utf-8?B?WGZaSmF6U1hkdWlJdE9INzlHU0EvSjFabWFSTjk5ejJIbkVJRGMyZWxhbFdX?=
 =?utf-8?B?ZmtPS0ZXT3dYUWxuQnZzOFlMRmVLNE85QUZYNXFqVXhxN1FIMEd3WGNrU2lV?=
 =?utf-8?B?Sys0eEVHeGoxRW0xQkw5Q0pUWDJtaEJVcGt3ZGtLZWFKRlIrZldLQjJDWk5i?=
 =?utf-8?B?TkVqSklIdzNKYnZkY01Bd0J0R3crYmo0SURtY0hSbGlrcjcrcmxsK1pyUXpI?=
 =?utf-8?B?L2VVSVJRY2FJZEpFeEtGSUpNUUxyeEVBZHJQQ3VnSDIxTDRGVDRQbmFZVFBo?=
 =?utf-8?B?NXpwZTBoaTN1NStmY3AvVDYzY1V5SzB6akJ1NHdtTXlkb2tpbUZlTGpXMWwz?=
 =?utf-8?B?RlVLMTgxYW80ZGNSTzJsZ283VjFocWJaNWp0eXB1UnRhelRMZ0x0N0tiYlB5?=
 =?utf-8?B?b0ZOdWkyMXVaMXU1eXFrMDlmRUpvNjRjUmhoVUttNHJZZUlLZzUzbEl3UzV1?=
 =?utf-8?B?aStuS29Tb1AxakJXbEJMVThiY05henhDMDNuZlZBbFQwLzNlVmI0TDZKMjU3?=
 =?utf-8?B?TmVNSXpENWpVank4TFQ1a1cvM0xYRU1uVCs1MlJaWW1ySkdtWGtrOWYzaXFt?=
 =?utf-8?B?c3BBSUFubGxQUEJIRTlVYldEY0wvQ1RyMXNEaW5GeElXQmxTMUZvK1hubTBN?=
 =?utf-8?B?dGd2cEFYaHRSRnpYVTl6NXIrOS8wdVl2TDBYTGlJanVlWUxiYXdFL3ZPOU1L?=
 =?utf-8?B?bTl5bktkaldpUWFVUEs3WGV3OHB0ekdMRy8wV1JjTTQvVmdSMGpyK1hSK1Ex?=
 =?utf-8?B?SVlZQW5SaHVVcEF6L1JodjN5dlNIRXRBR3RuZjNGdzRMaHF4U3U1OGl5UkJk?=
 =?utf-8?B?U1RRM2pHbUVVdGYzSmovK0NwdUpvZnJyZGtnMzRoWVF4dUFDM2UyZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 779bdfa5-a5b8-49be-78bf-08de7b22421a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:47:00.2605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5WFTSLFJEy26EzXb1dIR0wCPhuQB0zoCqedf833XxGS/5N8/FCpCYKtiLaftAlCw6DPDnxbBa2pyBULkKCkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2515

On Fri Mar 6, 2026 at 12:48 AM GMT, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 8:16 PM JST, Danilo Krummrich wrote:
>> @Alex: It also seems that this is based on broken code, i.e. I noticed h=
ow the
>> DMA read is done in this case in e.g. gsp_read_ptr().
>>
>> 	fn cpu_read_ptr(&self) -> u32 {
>> 	    let gsp_mem =3D self.0.start_ptr();
>> =09
>> 	    // SAFETY:
>> 	    //  - The ['CoherentAllocation'] contains at least one object.
>> 	    //  - By the invariants of CoherentAllocation the pointer is valid.
>> 	    (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
>> 	}
>>
>> Why isn't this using dma_read!()? I think creating this reference is UB.
>
> We can't - technically we would have to have the `dma_read` in `cmdq.rs`
> so it can access the `CoherentAllocation` (and do an unwrap in the
> process):
>
>     dma_read!(self.0, 0, .gspq.rx.0.readPtr).unwrap()
>
> ... but that cannot be done as `MsgqRxHeader` is part of the bindings
> (i.e. in `fw.rs`) and thus its internal fields are not visible to
> `cmdq.rs`, as per our policy of making the bindigns opaque.
>
> This can probably be done better with I/O projections, but for now we
> have to do the read_volatile by ourselves. What makes this reference UB
> btw?

MsgqRxHeader does not have interior mutability and is not pinned. Thus data=
 must
not change underneath a `&MsgRxHeader`, which isn't true.

To correct this you need to make all methods take a pointer rather than
reference, or wrap the raw binding data inside `Opaque<>`.

Best,
Gary
