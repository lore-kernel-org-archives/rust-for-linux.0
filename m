Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021123.outbound.protection.outlook.com [52.101.95.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B6D327C08;
	Sun,  1 Mar 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772371392; cv=fail; b=k9QytSf2VG+kw5PVQ/GievjgGB22NcdTtyuckWwEto1x7RjP2X2y7z58VCKtpa+oYpkFRWkBzuPIlzzWUO2Xxq5m2bD6x2WZXZCsX9XGdynIDIDH0kuqkOw7qhQZyiKbqxUDwF1ppEaEZMj/LtDCxVKz/G5BDV76WGYcYFK/x5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772371392; c=relaxed/simple;
	bh=2IdQkZh4wm7y2PeZWQI7egWCKqwrxgJltCTDOU9rdSs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HGntC7qhmETKPX9i/2o4V9w0a6dPOlY6tQbVghOL3s8LYS6OBGY8P8QscWZw6WI/JHiWe6NZd9Q0JZlZpJ3XEBesg+zw2OFmA++t73fjsGuOoBEmBxN32seyPlKFZj3gQYkfYjlvqkjQhZ0VD9pVDQhxuG/OQ/5L8Ez+4m3x/ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fm9DBZbE; arc=fail smtp.client-ip=52.101.95.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fm9DBZbE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yanOTu+sr3MXVHaruWbbdt9OsCUyZViyv/Pwy16F0lywn5YskpJnO+wdERUIVupZmMWknbGKbxYDphq6Y6QFKohRSKJ26A3lSIkLwsI+uiI+OYVYCFNWT9Kl9hPOp+EAlvKE9CD0xaZM57YnbLj0Rcd75SFRm5O7JVpqitVKYwtFIEUR03a76eAOEgaNCdR4j755YmCNtKnhPp2XK2ZmciQXvPW4r40WIVt/XeEx/8skyFkZXoBT/AiI/RmOYbEZO/g5xhzNoX9ZK7zoOhgcLwXdxWM21AUUG7RGcZLnydgPOIwQNguaPL1BqV83PSW2YJB+XJLRq0vXfgWCwlqD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09JbOyJumfdVxqIYJXgOeJc3J0ZSDRrbTiZW71+kQZE=;
 b=GB3xnqSEd4JRAainO5UwTC3P0vAw617S4kFV8Be2POaYUu8D+PsThnWEgGZxGqiEe5XWEgWij12Mm/7Kb0kkFgMW+aE9KMx1Ynd3WRGZ54WyJSskpfhDrqWuNjoobv2wu08HebLOAqOQMR7VPalOR4J+R9nWXAc+lakPzrkCjMBXmPduwLaETBf2gm+ZxOcSOhUN543wzmiP9Ip4YuOH0K6VoDkptRImqMCSitpRHt+UZT6r6twKV77GDKBl+8Znij0fHo11CKBaxX/boFsSuOp9DGHzyRaibbuoYutP3QgFkdLFLeg2iq4uMpKtBVnLIKEWrzEX8vltHviILCvoNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09JbOyJumfdVxqIYJXgOeJc3J0ZSDRrbTiZW71+kQZE=;
 b=fm9DBZbEj+JmDEqpUQXkmFaw9cEyF9fun8D4o7uOSIWtRJ4aO+VanmWUTias89DfChcgyYWl+ZjSyUDBFvzbBLCXhPSGfa6YcwTE/SnRT9XG4xzV/vFX7GJoP/0fGziHY2EsPoGwf8tFZKRInDYNzQ0pzBkX+L4fVk6O5DRG9j0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB3647.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 13:23:08 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.015; Sun, 1 Mar 2026
 13:23:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 13:23:07 +0000
Message-Id: <DGRH7Z2G22XR.LDEVDDGWC5B4@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Dave
 Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
 <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
 <edb5bd481d43fecdc626256579caee41@nvidia.com>
In-Reply-To: <edb5bd481d43fecdc626256579caee41@nvidia.com>
X-ClientProxiedBy: LO4P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB3647:EE_
X-MS-Office365-Filtering-Correlation-Id: 3682b8cf-d61d-450d-229e-08de7795adae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	+/y9LAoUWUj4T3tQdSuouosoQbpaQiO4jfpm8yovRaVGtBlRW7pIxuzXufj+qrwasmSyCQw8obWd8/8ZsBJKUKmPOauoUKUKP5nsxTKyn9XurVbMq37vTO6dscHZtPUbzMDny7KZCLRSc5kzEBT9vtju0Ywpv1W/YLG+lmXTbUpAbsUK9jBJGcJR02m/VmqxQ4AsG2wqpYeFuNMZac+Et8S5g5lmhRe+QG/bIsfPtbKuIsihjJl3xojM1k2zZo6lDvKVERaQTxg2Qd41X0ad1IqomPk+0e/FU5VIc8qh4MUwrRtmWSvt3vCsespQZ9Tx1gIemWNYjxGZP9uMzLXP5QHwR88LUZmwbPKYbrUCFFGsMn6NLWOgYZpQRfAohAT3r00Xc6S/krINg5uqmgDtNgEIlm5heV/fgYR2ixhPO6ENZ6iabDaNZqQdZLQRgIM5xIShxErQMPqiCRWKA/piM/3Hy6wbowlP4n3tLR5XQTH83pSjC5Xd4mieNVGD9yFZUvWTMesOyq0b316jXJVIJn9axSNUyo1aIEBNBOtr0REFwIQowY7r+WJvDaX2RQiA/PhFyECJJsEX5X4fZ3tLjN1oKtl7ONd/mSx5tB/mjCMc3XpLpRkacl/sP84BjyBY2b9/wiGkmuny2Hu756kvnc9m5RLOvhm7xm9cDoWfxsW7CWn3ySK1n4BjhB4uMz0szd9xk9MA8WcP5Fq3tWTiGlLLC65BtvlKpw5H5yrQ/Ak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmNIdklzUm9pU1Q1aUJHS2ZweVV5ZG9rLzFNSnJ5Nlc1bFFKd3NwQnJhYk80?=
 =?utf-8?B?dnBhay9QKzNpK2xEYUFJSDBiMHVheVF6WFJvamd2WXFOdEp5Kzg3Y2lwcUJy?=
 =?utf-8?B?bHFPRFVNeFY3YVE1aG1lZWc5bDNFUyttOVpFcWEvNG5zOENLMjY5bG9hcHRj?=
 =?utf-8?B?QlFtOGVWL0RGVW1VRHpYa2VZZU84Y2dua3ZDODU2TXBHUGpoL2JkdnFjTmdQ?=
 =?utf-8?B?R014cFRockhGL0pCaXd0NnN6ZkV4Y0NIaS9KWDJWRURVVms0T09ZMkN5VzNm?=
 =?utf-8?B?akNsQ25NR0ZlTnZ0cjFPelhmcjlzRFZibHJUdjhSZ3lzSUNVbGhERHFmUnJa?=
 =?utf-8?B?U3Fkd1E1eXd1S242NW1XTTdlb0R0VDU0WnlrTEphSnlBank2dHlQcWlERzd4?=
 =?utf-8?B?NGxxaURiYmlUSWtJbDd3Ri96eUk1TVR4emFObnI2MzhqOE9TRlNDTWVYVEdB?=
 =?utf-8?B?NlJ1dVZsZkZ2SFdmUDdMQU5jVm1rVGRTNUZHbjE3UVpwOC9pWTNYK0p0eENQ?=
 =?utf-8?B?WnVTNHNrQUdBTVlvN2VEN1VaSnlPQ1NKa2QxVkJsZFVjNkVpY1JOS3hMN25w?=
 =?utf-8?B?dllBR2xHQS9TVkxYbTc3dVowQmFZRmFvZjdDV0xKN1UwRFZGb2hTYUE5aWty?=
 =?utf-8?B?OWdwRURpZlBzZkgrY0xGdU9nVHF0M1R5dDN6ZThZZk5JRU5jazRyTE5ZUGlt?=
 =?utf-8?B?cVQ1cjZvRWg2cXlPV1RyODFSa3RFbmFkK3BZWE01a1NlbTNYMGNCZmFuSllh?=
 =?utf-8?B?QmpWVWdXeC94bUh5cDBFa3dWWXZuWS9OT1pIZitrU0grbXkwUFhwbDJEU1Ry?=
 =?utf-8?B?TW5IOGZmR3NzcE90Z1FDU1BDTk4zMWgxbW1Gb3B0K3pKUDY5YXZJVWJqNCtD?=
 =?utf-8?B?aUtCV2VIaDE2a0FuTytuMG5Jc1pvaVNlcWxWd3hRSzlMSXZjdGdEVXY1R0Zz?=
 =?utf-8?B?cllXSmRVOEtyblgwN01zNkpIVXZVZk8rQlFrOVBMZDdMU1JPSVJ2ZFdKWE52?=
 =?utf-8?B?alA4NTBmWHhRZnAzSUxNTXk5UDVEcm5tWStjRSsyNVlWRHRubm5EeHRQMS8v?=
 =?utf-8?B?VHpmY1VtSlFUaVFjWFc4c1NlNGwvSktHSjhtR1BzSTVZbUh5a1luM0V0anFM?=
 =?utf-8?B?Y25uQXI5dmhkVmcxZmMrVnptZzFNQmN3ZlBia2RKaHFRL00xL0tPMkpORUky?=
 =?utf-8?B?NWVVUWtpZjRPTTgzRFFpQnU2K0w1NUlPN2d0cG1BNXFPK09JTWxtR3JSSFVE?=
 =?utf-8?B?MThaVGR0MXFtdVJyZmJ6VVYxcTdIUCtCTmlCQzFHWko5VW13RjVWSm9MUTZR?=
 =?utf-8?B?WVRnZ1FXSjVIWUFpTnU2ZEhWU3VmTGsxR1I0ZkdUSWttbnBIOExrL0txNi8x?=
 =?utf-8?B?eEI3Q0NGRFZMaHVncld6a1Z4c24wd0N4OVlmZDFMdjJRWmZiVUhUdmM2Y0Qx?=
 =?utf-8?B?ZHlaclhZWGpHUU5uamNPYk8xOXAzVmx1ZzBRNk9Gb3lsM3doL1RzNzhFR1Vx?=
 =?utf-8?B?d3VhcWRpeEJOT09kS29DQ1VwQldPMnVtZVlMamtnM3ZpZm05Q2gwOHpmOHEr?=
 =?utf-8?B?cUc4WVhtNy8zWkZZVTdCNWFLQnpxRVFmWm1nWC9xaVZkalBURG40ZzBQcjZv?=
 =?utf-8?B?UWYzTE1MWERJRGpPY0NrdnF0QTlzVFMxODBTMmpFTkYydTBwcW41UWVNSkZD?=
 =?utf-8?B?TXpQVGRxbEVQQjRFVEdCMXg3WWRYWmRVK3lnVEZwZlBHd0dKMnpQcXROelIw?=
 =?utf-8?B?UkttSVY4OEFiWFNCU2gvMk1kZ2JvVkpzSnlTYmo1b0svWHRLVGR2dTVNbkxs?=
 =?utf-8?B?ZStzUXZVcTdPUkJZaVY0RHFvc2JDNE9nRmgwVFRHL1lhN3FaNkUwVVJ2MEZL?=
 =?utf-8?B?MmM3THNNUWpPZWFMQmlTWFhZa3U3UDRnL0dVMHg0d0ZFUzF4ZUdDOWhiN0Mw?=
 =?utf-8?B?T1RNa0VmYTJxMFcrTndKK01rV0N1Y3RDTTBtVE82WGgxRXAzS2h2enJEemtx?=
 =?utf-8?B?TmRKcTZuVTA0M3k1NEhKcG5JUUNyKzhEMUZNS0F0SmJPL01nc0VJcWxyZTkr?=
 =?utf-8?B?SUVjQ2grc0REMis2M0RnL2wyNGpZM28vZUpvWU9MaUQ4TUg4WndwUFI5bFc0?=
 =?utf-8?B?YmhlL0NsNGtMczBoNEs0eGgyMCs4NjVFeUFXOE10Sys1VkFoVHU4T0lNd3Js?=
 =?utf-8?B?a2R1RXdHSXpWNDM4VDBQSWpvSmJCYzVzSEFFTkp2Zk1nbE1QU04yREFLb1Iv?=
 =?utf-8?B?VWhkL0ppc3BUcENDU2dzKzVHZHdoTDlhUWh2Q0xsWllpbUxxVGwrTWU2ZHcr?=
 =?utf-8?B?aTAybHFTc092YWdGTDVYeGVmYUFOcEZ6Q2N3OTFKVUlkRWVGMkJQZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3682b8cf-d61d-450d-229e-08de7795adae
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:23:08.1653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mqg9RnmSSJNAwNV5I7dVcI1E6nt2ernGpxGk6SPwSes5jigYUTH4DM2hzrnZIR9J767iFF7mHvIHO7mYT9Ji5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3647

On Thu Feb 19, 2026 at 3:31 PM GMT, Joel Fernandes wrote:
> On Wed, Feb 19, 2026 at 09:54:27AM +0100, Miguel Ojeda wrote:
>> If you all think something should be mentioned for practical reasons,
>> then please don't let `rustdoc` force you to not mention it, i.e.
>> please feel free to remove the square brackets if needed.
>>
>> In other words, I don't want the intra-doc links convention we have to
>> make it harder for you to write certain things exceptionally.
>
> Thanks Miguel, that's helpful! I've kept the GpuBuddyInner mention in
> the invariants but removed the square brackets to avoid the rustdoc
> warning while still providing the reference for readers.
>
> Joel

I started to think that the way we document invariants is problematic. For =
most
of the types, the invariants mentioned does not make sense to end up in pub=
lic
facing docs.

Perhaps we should:
- Document invariants on specific fields as doc comments on the fields. So =
they
  don't show up in the doc unless document-private-items is enabled.
- Invariants across multiple fields perhaps should either be documented as
  normal (non-doc) comments, or we do something like:

struct Foo {
    field_a: X,
    field_b: Y,
    // Put invariants here
    _invariant: (),
}

This has an additional benefit where when you're constructing the type, you=
're
forced to write

Foo {
    ...,
    _invariant: (),
}

where you're reminded that invariants exist on the type and cannot forget t=
o
write an invariant comment.

Best,
Gary
