Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E7353A68;
	Mon, 31 Aug 2026 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788140541; cv=fail; b=IbCMNdGFxytFgxyg1Lo/5D/ZKFwMhf6fOjV1I0zO5x4pLVShjfBHw7nrc/JsSofA9DygtdosVlETkXTMz4R3GvU2SOGS9PLKx21d4d57jQeAo/Fn5ZHDKZeVfH8MdNFyOv1ivdCTvtvIVH7bFC90lBc4YSDBuEBkhVVV1JApt8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788140541; c=relaxed/simple;
	bh=vR3jhWSXLrOQlxc+PV89VQppHpRVgXngNutWyKyDsCI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ZtSR7mn+CTLs52+xBLYNi7VGAjV5HQdNGwzMqcrEJ0lsv1K+EXKsmMBmiQOibkD2vlVrMvj8TELoGgp+fLpwh1XklhepU/7lvpJSUQeh/FlPzgezjeTCk+R9Ovu3w596BM5//4r+6RLEXmTvYgZoFsDx3uXLQiQKrA7kkNbTFBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kEtCbnlu; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kEtCbnlu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mfv8RdqDkgvsGDJEJRok06OA6yhJ7oTQ7d43d9pyf/cVLx8rstekyHSoDZSr+z61hAUCpOUIkKSlelIKmG12nJXGbAEX26yxXz4yQsaCR0/6r8hp/uylCcwSb8TLyBtsHrYJM5BouCoyLCgCTqakDFb7JswRlfjlHNHR3V4PLpFFIZCrm2VWP7CrPXoos1XLjKfeoqqPsk4lrtnTu5GRtf0NNV+CDaRo73ngIC+u3JdOkRl4Qs8Re/3w3rC+kT1SDMYTV/fVMmj3yGMutMsV705pfrFxEQ5G40jze1UEIBkqtkY6RR3Rn48RENTWLawn1SHXFObeuwbwkbCYLqZmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7msrfBh59LeOAc9JJXp3dJjBOZW00JYCizLvH7W+8sU=;
 b=oQEP2Z+wi3tSC4cqlmxbOx/GT+MxooKZIN0T3DiLDBgh/UaC4Udp/qS8zT4xaNNjs8nZKuI8ESObdhDL4G25U5KZfL9g6mzTpfYTFNxFFo9tMCNYgPpvYs8ugFacPhyvENbuikQ4MBHvEzfu/EujqIzfWLZQF0KVfO14+7+qWx0D38VFQ8IpqJLs44xj68fFRH+IvCiSHx5O8HsOApikcZwwynh08FOHbZkZUiscMF0Rk/iLfGD9jNOGghoAD8QnDR7sziEvz1BMVGK+ehl5kZfujzPEWCByZRnPyF2u8es6JHPgD52U0BOKi27+T5Y+ah8lBtzP1BSRk1GO+dlh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7msrfBh59LeOAc9JJXp3dJjBOZW00JYCizLvH7W+8sU=;
 b=kEtCbnluKXBUESweSTk2cTryaTxSWfCEPNpODWqyKeqoLr5qt3oIBO6tCttGHGvQh/6vCZUkyw2Y53PPDAEndXhHhlfA8hyXfJR6z+sFWBO6f0OOrCRSnF2HjRsczP/0C52ppyASz/RhRGojrBYFKVa0Vhj73VBNiQdnJejRaqED/gf1K/0I2kfO+utqnZdHa2sEmSkvBNExI2OQyOPo68Y0KOi3BJrCcJ+MZLx87azbUsJOtjEL2SEEEFR4Ke5Hb2yo3K1mXrY6g42OfVIBDeewvRHfjyxvZrXpOiOQ1/rVPmIpdZlQYD1zdlEisY5FFbB/7AXO7DpETkyYtXJp5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 01:42:15 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 01:42:15 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:42:12 +0900
Message-Id: <DL2QX074UH63.370PM3VT8E2BF@nvidia.com>
Subject: Re: [PATCH v8 1/1] rust: introduce abstractions for fwctl
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Vlastimil Babka (SUSE)"
 <vbabka@kernel.org>
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
Content-Transfer-Encoding: quoted-printable
References: <20260813152312.1311142-1-zhiw@nvidia.com>
 <20260813152312.1311142-2-zhiw@nvidia.com>
 <DKP1Z8PZZX83.GZ924NDYZYPB@garyguo.net>
 <DKWU6FXYZTYB.FY9L7L4OTXCZ@nvidia.com>
 <DKX4J0P3CSDN.1YERNGPN5NY58@garyguo.net>
In-Reply-To: <DKX4J0P3CSDN.1YERNGPN5NY58@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 8850d059-a73b-418b-c709-08df070115b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|23010399003|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	hjCecuFZQzrk/VCdCrrg5vLI6W/6vVEyzDaYPD3YDgyIb4CvEA/0bHcNRJmGaD8MJkLdbMBpNMxh2Bm5DmkA8dPnG/PCX8am9cOfnWNckCO+ORKFF8Ivik1/ma9DhDVVD2J1NJGUI72E6rKI2pn4L3IO8JUEXuaBlvqZv8iF240fMZ2zu07ca0uPk8SNZtQkGUyGRstEcqT08YexTCkMat8VZLqsHYTYHEfVvdVlDvHLfCXgc8/bp4mD1HPn4tNOLj/SJQdyeTz6cAZ8wFBJKF6cliOuCBUSe/CURM7pIGBXefXyYoqrNNW5wuHubajarxy+DjgBkGy0wD9FC52SBk75dbKkq5huE2PzoRzKK7PI9GAO4/fdbWF1Gp8Uu8I1g26btw3SvIvcxCRsinUQiG/ZLCIQeojguf/S5BueVS/QamV9wUveb0vcyVjXqchzecGU3WGNYJbqeZzcyoSE65Qo73Xy7P67A2zVKK0FZdVPz/AO03dooIDK3WYze9QfFTjRBVgVA+xbYOyojGxQ+2sCjrlMslyqQrQSQ5eR5FT6CXICwio222eQm0rCjSFKZu5jJ/gDe/Ve5K3YkVqHSOxCdqiZnfMxoiQd25KJk86ZegnXg7nE327gJXQ0/m0hbKHDr2Q7+iM4Mc4C9kjGSxmhV3Ls/3re1wEQCJxs97k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjBGOVY5aHUrWmM0RVVnVUYzaStGeFFoa2NvVTB4Ny9HUTlyVGxaamthWXVu?=
 =?utf-8?B?aXNrRzVWK3g0V0g0Y3BNaHZOMUtzS3VjeUozUFlxUjc3clZucHQwUnVZOVpj?=
 =?utf-8?B?SVFuUFU5bXlhMFJoQm5taUNDTDhuVlF6Q2JCT0JNcWFTL2dMNXlFdnNxUkFs?=
 =?utf-8?B?S2ZjODdUUm1mQVZnb0ZLMmdyZEw1NUNTZk45TEFLaWlvZmpmV2tGSDdnTWdD?=
 =?utf-8?B?WEsrY29qQVZlWFB4SnB2ZVp2MC9oUHJlTlBCNnBIVDlWNUpQejlvaDZLUXR5?=
 =?utf-8?B?VjlDNnZNRkxPa1hqS0xSZ0c3ZlEwL3I5enlsY3hEbmV5dlVOTDhHZllSS1JW?=
 =?utf-8?B?TGVESHpqckdxajdRUkNuMFdEOFJmTHZ0NXlnR1VEbkxKK1N1UW9HM1NLL1lQ?=
 =?utf-8?B?eWdqVUJPenY2Nkw2QkxLRG1ZeUw2eDZ4Tk9qdDVDd2RkdUp4OXNQeERjczJp?=
 =?utf-8?B?dE94cmRXbXVBV1F3eUJhK2pSa2M0Z0VQUWdXbjZpK080anJsWEU3Z044OVJ4?=
 =?utf-8?B?S2pVUUkxQ0JVY3dibGtmd2ExeVZTQXpwekdZTTNVYlhSakxTLzBYczlyeFgr?=
 =?utf-8?B?LzVEOWpQS1hsVVZ1Z3pjMC8vQkErL0VmVEpMS2JkV205dENBN295MnhZZWVL?=
 =?utf-8?B?OHFSTjdveHB6THM3c2k3b2Qvb1hrMVhjNnZIa09RenRWbTFoMEM4WkJDWVNJ?=
 =?utf-8?B?dXlwOUoyb1lBZGlMMnFFV2Z3cGZiMHFqT255TUt3VmF3V1Y2OE4vc0JNS2t2?=
 =?utf-8?B?WStHNkRqRXJsclNzYTVtTEtGeEtMekVaWEZmMWs4d0ZmcU9YMHpLVzFzVmhz?=
 =?utf-8?B?eWpqUVdhMlptc0xob2xPM0FzV1FmREtuQS9IeGlrQ21qVnYzR3loTHJoMUd0?=
 =?utf-8?B?UTVDK1lVeDdGUUdsSFNvcGtvM3p3VHg0OHRVWERVcXJmWnVNNCtIQXpHU3Ny?=
 =?utf-8?B?WUhrdkZBOWl1elhRMkpBSHdZM2lVSmRBRGYvOS96ZDFyZ3hhOVpMWm9sZ0tn?=
 =?utf-8?B?eUovYU1aeFgxMlprWC85dE80Q0ZUdVdxYlAwYjNwZ1dsT3hFK1ZsNEJ6V0xM?=
 =?utf-8?B?Z1N5UW52VERZbGl4dHdvV3V3c0pNaE8yaFlQMll4cjgybk9GdGlKUCttTXN2?=
 =?utf-8?B?MVFWS3hrd1VWMkRlTHRhOXVyaHgwbEZyVVl4Mll3OTJlc2FXalljUXpPc2dM?=
 =?utf-8?B?dGxaaG5oYStWRXRJNjlqZE41QzJJcWVaR1VIclVHQTlxd2svdlAvWWg3NHND?=
 =?utf-8?B?cXE2UGNMRTdzZnp2R29zNFUwK3BSbkxWWlozWGZtcDBjYkt4VzRVK0taa2FS?=
 =?utf-8?B?cW45Tk5XNmJ6WjJmZXFnWFUzRk1HYUxnWnZJbktHYkNxd0R5aU9iOWtQK1Ar?=
 =?utf-8?B?RjNaRXpaNFQzVDlTQVZTM2dlUk9NQ1ozNHFIL3RDZVJTQlZCa2FjTWJGVnZB?=
 =?utf-8?B?dFlrWXAyL09EeGpKZmQvbEEySHIzQTNVOGw2VXhqUUdCRi81azRtNWsrZVZ4?=
 =?utf-8?B?b2VLcHRoQ0RHYk1hZTlsb2dzejF2UWVGcko3MTZuTFI2VDRQZStZYWlNeEdQ?=
 =?utf-8?B?UUpZSUdudzhDK3gvU0JIQVpKMXY5Vi92RUFvR1A3RUhWYjEwQjFubklwbm1a?=
 =?utf-8?B?Z3VxQWVLL2Q1ZmRrZndSSDQ4U0N1aW5uOGFiTm9sc3JxZlpYbXFMQkp0NUpi?=
 =?utf-8?B?RW9KaWlkTTdWM1BVK3ZRVzhpK2pEVXYvVWYwek1VWVRHeGdsZGk4VXQyVUdk?=
 =?utf-8?B?MjFHeG92VjZBT3pEOHltRXUwOFZyMG11TU5UOEZ4VlFBRTBSTk50L1BnYnhC?=
 =?utf-8?B?Z1MxbSsrUXo2K1hncFdNTmhpb0NWZW16aTVlQlp4OENlMzJ2amRuZFJOZEZT?=
 =?utf-8?B?TlhTczhZMDdvSUFIUmJsNVQyenRkL3ZGQTVvdVJkeVJZV1FnNmhWYWxHU0FW?=
 =?utf-8?B?VUFyTitHZ3FxQVBpUngzR0d5VEljbmV0ZU9BMFoxSFZUNnBaVXg5cHhaUjVR?=
 =?utf-8?B?MUxTR3licDBFSElnYytRY3pJVlZmTUlHb3R6dEhaNWZLRDZQNlNrbjNlbTk1?=
 =?utf-8?B?dGJyWHZXY1lkYjNIZW1sNk5mUmp4RXlDR3gxU1hMNnh5bHBmMVFFb0VGWXVO?=
 =?utf-8?B?ZnZkK1A1dCtyTlBHUEZBRzAzYUFvSEN1MGxTVlEwZDZCb09wSlV2QzNrbVpN?=
 =?utf-8?B?N05Xd3k3WGh2ZTFDTkFlemJxdEhTREQ5SFF6WjQ2dkJObzdJb3FHMkFaYVBw?=
 =?utf-8?B?azhoT3B0OThKUEFiTkREeldXZUY4OWlKRkhvY2ptVVZjSUluQ2dMREZzMlly?=
 =?utf-8?B?YTBrUnpVS2lraE43TitFUVc5b29YZEQxZE82NWNIUmhRZG9zaE13RFJUaGRu?=
 =?utf-8?Q?K041ATRxFUHUzUUvD5ZSABdiIfao/7mVVrPdNjQGx68OF?=
X-MS-Exchange-AntiSpam-MessageData-1: c5d29PN4ivqrlA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8850d059-a73b-418b-c709-08df070115b4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 01:42:15.3427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CR9AZBSLne5UOZA3IedgandudIYTEj3V6eWgTDjbxuGlGHgcIF4LFeGmKJIssZDnHwQErgmeODNDiYVenZPasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561

On Mon Aug 24, 2026 at 8:06 PM JST, Gary Guo wrote:
> On Mon Aug 24, 2026 at 3:59 AM BST, Alexandre Courbot wrote:
>> On Sat Aug 15, 2026 at 8:25 AM JST, Gary Guo wrote:
>>> On Thu Aug 13, 2026 at 4:23 PM BST, Zhi Wang wrote:
>>>> diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
>>>> new file mode 100644
>>>> index 000000000000..e6a8513a47d0
>>>> --- /dev/null
>>>> +++ b/rust/kernel/fwctl.rs
>>>> @@ -0,0 +1,593 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +//! Abstractions for the fwctl subsystem.
>>>> +//!
>>>> +//! C header: `include/linux/fwctl.h`
>>>> +
>>>> +use crate::{
>>>> +    bindings,
>>>> +    container_of,
>>>> +    device,
>>>> +    prelude::*,
>>>> +    sync::aref::{
>>>> +        ARef,
>>>> +        AlwaysRefCounted, //
>>>> +    },
>>>> +    types::Opaque, //
>>>> +};
>>>> +use core::{
>>>> +    alloc::Layout,
>>>> +    cell::UnsafeCell,
>>>> +    marker::PhantomData,
>>>> +    ptr::NonNull,
>>>> +    slice, //
>>>> +};
>>>> +
>>>> +/// Returns a kmalloc-compatible allocation size for `T`.
>>>> +const fn kmalloc_aligned_size<T>() -> usize {
>>>> +    Layout::new::<T>().pad_to_align().size()
>>>
>>> What's this function doing?  This is just identical to `size_of::<T>()`=
.
>>>
>>> The layout from a specific type is already padded to its alignment. You=
 only
>>> need to call `pad_to_align()`, say, if you are computing a layout or in=
creasing
>>> the alignment of layout.
>>
>> IIRC this was meant to be a const version of `Kmalloc::aligned_layout`
>> [1], which although it is equivalent carries the intent better than just
>> using `size_of`. But here it would maybe be better to just make
>> `Kmalloc::aligned_layout` const and call it instead.
>
> That'd certainly be better than having a duplicate impl.
>
> However, I do wonder if we should just codify the fact that kamlloc works=
 for
> all padded layouts (which is true for all type layouts in Rust) and so we=
 don't
> need to call that (and perhaps also just remove the method).

(+ Danilo, Alice, Vlastimil)

The guarantee indeed exists, it is even already codified in slab.h:

    * bytes. For @size of power of two bytes, the alignment is also guarant=
eed
    * to be at least to the size. For other sizes, the alignment is guarant=
eed to
    * be at least the largest power-of-two divisor of @size.

I guess it could still be worth using `Kmalloc::aligned_layout` (which
references that guarantee) in order to track the intent, but that local
`kmalloc_aligned_size` does look superfluous.
