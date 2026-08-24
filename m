Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021075.outbound.protection.outlook.com [52.101.95.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE143ED3D8;
	Mon, 24 Aug 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569580; cv=fail; b=g9MaAQX7JGTvTu0FOR+knPiPxRbXcrTfQ/DhdaokmQoyEQVE7wpWA8fbRAGEJJBZ3rwd39Yb5XGdWHY7pS11z5u13y5gYDrzVZ+cKwBcEbgwnBdG/3oYvrT5S8TWO/CVpMEowPo58AbTBEEcTr+hA5HcfJgYATrEEPm944IlVzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569580; c=relaxed/simple;
	bh=KvFgTwiYyCv7Vv8ssaoFkIrPyRj6PsQHYqLXxxXzpOk=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=qjYRAJ95SNiDexry9ISbudhMkB2K96jud2sn0vTMAWVGsjAuPjqu9kKrJhZbkqWwGRKU/dSz9GozALWutnzMQdQuaDs4SGRGoNsGlPdO03+5FUnUyNifGM4PDmQuzCwQQzA98tv3tKqa54LEE7UhJ2/VnfSV0DvFqWVJnEzEQBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=A+XbqI17; arc=fail smtp.client-ip=52.101.95.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="A+XbqI17"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zXBHfCxCq6qSSuY44DQvPWqEWYiiZUjyC0WGp8ZdVHicB49Fo4XPKuw29fbwyFBcrBCqoru5r3jovbi1f5aP5iYm/2waikrQo7FvTWWJQrPGckGdmgQY40Qh9ATH1ukUz65uqTja5HPEGJG6XfMEQv7D2k9j1HfFF4Ptiq/0qR1CEJzpFaFyip/NmJdHHmcVSnt9t9KKEGXzT9rs8eqk6QqGi+nIUmzzSwVW4SLGbxenQgIMoYnBxkk4pPARHUfQyS8/4W/bvAQ2nhXFYrcBCYDsrcuOp7C4GGcKHw+vTvLU225aXAYpZEwH2MgDlLAxGFYBQY3Cw7dWMYHs1MLe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zETNxoI4sz69uZIw7BFtcjZxUcL9NXEf3q6gFcXaZhQ=;
 b=WnbpEelqZ7Vju3gsgVx/fpVxyKFLttyYdnYxHnjudT5GVCXjFvcEz0t+BCuIVNf7MfQhpMkVBFDtfNTymcb/kbZDP7jbRr/fEBws2AUCRLY/vXkNbWptKhKq8cdD2RLRB8781DAZH9cVLbUKNKh9x8f0quf3+t98O0VKD1X6k7P2q8Wcp+aYNar3QsGu9aTpNr/swtkrRH1Lxoz6wLkMJeoTccmhCv2fb6VvlTORRycPe72MtNipwF52QhLeLGzQ86WdyMdWfwjDY2OGabV2EkGqNeyfkct42RncHl2pRS8CfZR867gVcvwzJrKBUq0ZAWjnhD9o6n0vX1sOnToMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zETNxoI4sz69uZIw7BFtcjZxUcL9NXEf3q6gFcXaZhQ=;
 b=A+XbqI17JeMtJ+ML2WM+Vx/xvGyh/PA2t9Urwn4gaMiu2FCrporibsKHS+63NlTGl7CRJVt4N3X48+hRgtugu37b87iBP89Ty8hicJ0BhVp+PS1g0mCpJyLuQx0zxGZQVn6a4AEnX0/6GnaVvX35ompSovgJ1cebfHq3Nt01zyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1835.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Mon, 24 Aug
 2026 11:06:13 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 11:06:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 12:06:12 +0100
Message-Id: <DKX4J0P3CSDN.1YERNGPN5NY58@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Zhi Wang" <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dakr@kernel.org>, <jgg@nvidia.com>,
 <dave.jiang@intel.com>, <saeedm@nvidia.com>, <jic23@kernel.org>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: Re: [PATCH v8 1/1] rust: introduce abstractions for fwctl
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260813152312.1311142-1-zhiw@nvidia.com>
 <20260813152312.1311142-2-zhiw@nvidia.com>
 <DKP1Z8PZZX83.GZ924NDYZYPB@garyguo.net>
 <DKWU6FXYZTYB.FY9L7L4OTXCZ@nvidia.com>
In-Reply-To: <DKWU6FXYZTYB.FY9L7L4OTXCZ@nvidia.com>
X-ClientProxiedBy: LO4P123CA0544.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::9) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1835:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb7b413-8fdb-4699-f9e5-08df01cfb5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|23010399003|7416014|366016|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	WSslrxPOgRhMprHCjrURVxHcNgNXfYGXwyydYMK73B0BEQAq7qNLiNi0gxgO/bkmw6d78uwIBniHqfhzgprBJkBZu4kRrZHNpqu1G3Nwe28+WJM9aKC1uSf2Hox1OtVaxLVuset550ikeMZ7hAU460pcIJG0Mz6VQ62Kq8TGIbXGZF5/tcCLUjVi4Bjp2ErdnQs2lxuAlv6TgEgN/pKEcS+HhqzqkRlW6BAKSwNnL0UdyB4O/y8A2klKCUSwMZHJqO1qeVGT9+GnKtd0zY2CjwQACgPEhe8RRCL/SgcX/2fGiHOcSMDF8g1f8J1UUUG2lfEc9MdBQTxrePtZ6Q5qmOP7XS0xF/vfF3szQItwdV9gQ/jxAB9nPUGWFnSQTob9KwWtg5ZO7/rVHVe140lQyDkd2wJhXj93XPoZD7jKD/f0QNncBAeWLLMhQi/ALKFNkLWjRBmnuhDEfan0T53Qu2R4fUB/syDMgGDN5GKG4QD+1DGZZGh8C6FmDhSiurvdJHipSOY7ZPbkzLY0Lx+JZhHFpwdOZYFiWOWE2lu8t9Js4kjnY4z+lcXYDjBPFlPGXOlSLqCLL/fgwFOgltjKLGUnxw8nrIgkRrXdEZgGPfKjrCyDAVrEv7lPN5QK2v58XH5NzyruqV4wZNthReQ4/MT5TBWntZ+Vw8Xu754TtLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(7416014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXo4THhaV3g2Mis4SE5rYmg5RUJncUJVTE5IV0tTS1ZZbWI4citvS1JFdjhh?=
 =?utf-8?B?SFlqLzdXWWZuTGlwMHpKRTBCdDMzZjdsNWo4eHJwa050TlFwZHc4U01lbG9X?=
 =?utf-8?B?ZElzb1o0djgzaEo4TFRwbFRlS3RwYXBmU3o1Tk9KVGxxd0FyNjJ1NTVEZlBx?=
 =?utf-8?B?Z0VIUEtSV1NuWDVPcEVGOXNBakRGNlBwcm40dndKajFTWURhd1NSV1E1REs5?=
 =?utf-8?B?NWgzcHpiM0psaiszbTJHayt0R0FSNllUekxEbWdWam9UWHVwYVhTdWJWUTNz?=
 =?utf-8?B?U2lTUmN5ZFJGNi9tZnFHMmh6cG1ZNnkxYjlBWllrUTJQNk4zYXN3RTBHZUhS?=
 =?utf-8?B?RmVlVTMrTWtyTEVyNmQ3M2VPdFFzci9mVTEySFJhSG50Q3ZlOUpIWVovb0hN?=
 =?utf-8?B?aDA0WjNhUGkzVE1GN3VRNFVlS1UySFF0NnN1bzVFTURzYTdaSFRScjhjaFVX?=
 =?utf-8?B?RjdZTGQrMXZVWkNadENjeXlmdTU1UnZ3clhnSmlZR2p0YVNIZnBxM0tVSnJy?=
 =?utf-8?B?ZVhMRTNqU1VUUm5jK2lTVFZaendOWVJpM2FyVGg0NksraFFja2QvQ2Z3K0do?=
 =?utf-8?B?ejkvbDFBUHJMUFluTHJpcmZ5aksvMlRUc2VSdHh4RStVaWdHTXUxWDNlbFNB?=
 =?utf-8?B?WHJNS1VGUlpwVnZDVjNaQjN4WUc3aysvbUNUMGdWeTNxdGdSNnZnTUhubWxx?=
 =?utf-8?B?UnJVZ0QzdUMzdmdVRHpLUWljbWhFRk1CK3Q4ZnFVQ2V2aE1jRTJ6RFRhc3Iw?=
 =?utf-8?B?QmFEZ1M3Q29YRjJJLzRndHREZXFxanlyaXNzcFlUOUdHZFNLSWt0MWFHb0Nh?=
 =?utf-8?B?dVVBcnNCdjlSNFJGbk1xemdYQ2t1TUR4ZThncURvT2V6Q1h0TE1lMlBjT0Zi?=
 =?utf-8?B?ZTJ2ejE3NlFncTlxNzErVlVFKzEyMHlkM1dTVDFWOENHdjFjMnBhSWhJamdF?=
 =?utf-8?B?cEk1R3FVdFNhbkNsV2lueVArOUFLZEM1Ri8rUzlXbVRSaSt4SjlqMDQzeWJE?=
 =?utf-8?B?N3RyVkZOQnNkdzB2bmRNY0RnMnV0TTdWRE5IVzQzOW1KN281ZzZPb1B6T05s?=
 =?utf-8?B?RVRPQ1M2VzRLUTI0a0lSY0Q3VEsremt6MTF3VGNsMGFlRE56S1B5blBWVGhR?=
 =?utf-8?B?bHI3Zm9HajBjNXdmcTNjejg3TS9OWjZsSElETjk3dGZhK2VqZkNFWjE3Vm1Y?=
 =?utf-8?B?UW8xclN5TXJCdjhFWXVJRWcvYXE1cjB5ZmEra04zNHpEYVBUbERVeTU0Mkt1?=
 =?utf-8?B?cGVkbGZTUTh5WUZ4bmxDV2h1YjVqNm1MOExSeExnUitJaVp6OE1CRG1NaVA1?=
 =?utf-8?B?QnpBcksrTjRhdkpFRFdDdjJENHdhYzVsV0luZGhSMnZMZ1V5Q2pheFNvRDMv?=
 =?utf-8?B?aVMvQ2hwRit2ZmVRbEVEbWtxQllBblJDaU9rOTRTMUZNZ0tqb0ZMRmNoRzdv?=
 =?utf-8?B?b041MUpGeTAyN3B1T0NncVIybmg5S1BhckFNcnl4V1pQNktidmJWNzBWaC9z?=
 =?utf-8?B?UUZDNFhFVUxRalNGWS9MeXRhcWNHZmFVOWs3SmdjRnBzamxJMHVQYjZBVk5j?=
 =?utf-8?B?Z0o2SDBWVThJNWp0Q284VG44MExRRWdRR2Urbm5jNWg3TnoxOUVrZ2F4UEUw?=
 =?utf-8?B?QTFLZi80MTE4UWx2TXVlUE5EZ0VNaVlzMllCeGtVSWRMYytUTm11dlBsZ3RF?=
 =?utf-8?B?aHZuaHJMcEMxZHd1ajh6YzJ3SnFkMVZpTERRYjFCSTFjdk9ybVZ2RXpmQ3Zu?=
 =?utf-8?B?L3RwT0hleGc1MDVlYzQ3QitsM2VvdWhVcklWdGtwWWNWWkIxZWNxUFlRVzZS?=
 =?utf-8?B?Y0o0eFZERXJkZzNHTEVET2hqTzZPejhESGRWQmY4SzhmOW1xM3dTTXZoN0xi?=
 =?utf-8?B?QVZRaUZxdzhTdWFOQWR2S29MMVVPMHhDWDFCdTNVSTNkQVNETTVhSlkwck9v?=
 =?utf-8?B?UjhIUTVjSFduYjhzUXlydnBySTVJUEQwbVlNV3UraEdEUUxNblEzVUlzOE4z?=
 =?utf-8?B?MDcveGRpR2RVdVk3Y00rRitnNXk0S2szWWx2NEk1K1doSmVHS3dTbXJsVDRa?=
 =?utf-8?B?djlmbU5jUTJ3SDR6SE9udnptN1pQOU1KZHA3V1JCckgrRW1xblIvTnk1RVdo?=
 =?utf-8?B?WlBaVmVRZU9KVEJnMWYxcWNkY2JVRWhoTGNWMzBKQmVkenlvUHhLaDVIbjlF?=
 =?utf-8?B?L1Y3ekhPQUdCT0pBdUVhclVrR3dCMVRocjB2eFVYVFpkc1BZVEJ0eFRoaHhE?=
 =?utf-8?B?eWUzbUh2SVBCSjM2MzJlNVRPbVBDQzNhUWExV3EvWG1Za3lkYkt6S1VRZ2dO?=
 =?utf-8?B?cTd6R1Q5a3g2Mkp0aFFxTWxLVTBVWmlGQUFySUNIbzFOVkt2RDNTQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb7b413-8fdb-4699-f9e5-08df01cfb5d8
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 11:06:13.1890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8asXUW5exGScJg/2iTHMVR9GMMCyRDgLM8bqCYdW76lMqMwaQpjmyAsjdolowzvMrTsAVAjTim7MjKLCdKkQLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1835

On Mon Aug 24, 2026 at 3:59 AM BST, Alexandre Courbot wrote:
> On Sat Aug 15, 2026 at 8:25 AM JST, Gary Guo wrote:
>> On Thu Aug 13, 2026 at 4:23 PM BST, Zhi Wang wrote:
>>> diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
>>> new file mode 100644
>>> index 000000000000..e6a8513a47d0
>>> --- /dev/null
>>> +++ b/rust/kernel/fwctl.rs
>>> @@ -0,0 +1,593 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +//! Abstractions for the fwctl subsystem.
>>> +//!
>>> +//! C header: `include/linux/fwctl.h`
>>> +
>>> +use crate::{
>>> +    bindings,
>>> +    container_of,
>>> +    device,
>>> +    prelude::*,
>>> +    sync::aref::{
>>> +        ARef,
>>> +        AlwaysRefCounted, //
>>> +    },
>>> +    types::Opaque, //
>>> +};
>>> +use core::{
>>> +    alloc::Layout,
>>> +    cell::UnsafeCell,
>>> +    marker::PhantomData,
>>> +    ptr::NonNull,
>>> +    slice, //
>>> +};
>>> +
>>> +/// Returns a kmalloc-compatible allocation size for `T`.
>>> +const fn kmalloc_aligned_size<T>() -> usize {
>>> +    Layout::new::<T>().pad_to_align().size()
>>
>> What's this function doing?  This is just identical to `size_of::<T>()`.
>>
>> The layout from a specific type is already padded to its alignment. You =
only
>> need to call `pad_to_align()`, say, if you are computing a layout or inc=
reasing
>> the alignment of layout.
>
> IIRC this was meant to be a const version of `Kmalloc::aligned_layout`
> [1], which although it is equivalent carries the intent better than just
> using `size_of`. But here it would maybe be better to just make
> `Kmalloc::aligned_layout` const and call it instead.

That'd certainly be better than having a duplicate impl.

However, I do wonder if we should just codify the fact that kamlloc works f=
or
all padded layouts (which is true for all type layouts in Rust) and so we d=
on't
need to call that (and perhaps also just remove the method).

Best,
Gary
