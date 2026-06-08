Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D491732AAA0;
	Mon,  8 Jun 2026 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919884; cv=fail; b=FQC1e7WNarEccRX5pj7dJYyu0RZ8ucZuj7WLXaPLq8yKZPT5zfUFpMrd3t7T01wPRZ71BQ8b3fr2qciz2Vw0Zd8FJ0HipfCFhrr7hkfRucL7ewEXHAorTt7pYH0wgA26GBCHtUeylqWwBAzu1ZCL+YSWsS1UK3A/6Sdn24VwToc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919884; c=relaxed/simple;
	bh=wB18KX9t5Cfn3JnRZvex6LQ/eMT/sD5u+/YMKv0Aq7Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Dlf1WuMz5WcCevqbChPlFUWLyM8RcndW0gO1MI2xS0LFZubgpXkAq4PxVH7dP0mWEJwfp3ArkG7nTQbVpYRm0OZLwTvl0f5GO3rypcewWVJ7wOL5E34lvlY2z1hCzM/nEK/R/bOLJR2C/kf5oGQNLhzpFQbEench0hRnDnivIaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Fljovu+7; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Fljovu+7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOqcKIx0yiazyDJWtwya2JfvvoVjaaJgcCUZgl3T4HW+QspIP79zgQ9SxQ8jjHgZuV3elNAIqAyWobOG4hUyGTQTVqIboMVxNQsPWuYF+SS0vQnbT+aIWvb7mY54tr1cV/w5RO+c4JDyJQGd+ZB+dxoG49cAAF8twGzKcAfnWIDjLI6zbAPLd+YawWBQj+/Dc1atq43u6nK1uaGcgeee556YR4LmXT+xTBj/ir1UUuM+p3Ei6Ggc/8KxX0H9rSLrfmcW9M42MXFhLeEl//9P2k5+qyT1R0dTNSWS+AKzMz0J+dS6D8MwqTbixpD5jHbwTK6YdZ9p7haXrYDI43o1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDGHUR6pDsA0n5Ki3TCcbgQFwwxMpyl9tp0nmArHANU=;
 b=xjNVYBGP9uM0KrWu27xKTzpJwK293fy04Mft37XHoZ22+XtSHHMvVAppIjJ1c//EfPIj+/tLApMHmT/PyyR8uWio1kIPPbpShlRE1QnUzEHXeCC1M5DImtfaQakTybtAUiDTLtc1BFA9gIp9HwYwXOp2WIxUV7DJ4Y7S/qjvS5bzh/X+oNi5u3lt+N4/vf97kWdEQ62KLJfxTRanpexgImXSxCkN8skKf7SfAhe6f3CTf40yF3eU1wYMC/gbIZSJDBZ+4UvRUD20/qeXx36bS+4WvoJ9pOgrlJmfclmSRGO8egIq8DILOcjXdz2EQ4S2rUPqe7L4LFwA0TBJf6fpjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDGHUR6pDsA0n5Ki3TCcbgQFwwxMpyl9tp0nmArHANU=;
 b=Fljovu+7kJlIph2drVnIYNj+zXd9vlA3V2/QCNmvBHhGuHLa98+Jhcd8DCYgqm+kY9Difb359tZyOYn6DtkJlsr7iGxbeTe44JP/xjKEbX/OW+EPmAeSQesJ/tLalDpMjfrmQ8sg7OYbq0+myLsAaD/6nNiPV4xRc1wYRJDSvMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO5P265MB9389.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 11:57:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:57:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 12:57:58 +0100
Message-Id: <DJ3NEPPY3VBW.18SDYBTB63K7A@garyguo.net>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rust: add a wrapper for the `nr_online_nodes` C
 function
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>
X-Mailer: aerc 0.21.0
References: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org>
 <20260605-cpu-helpers-v2-2-0ad227f0d91b@kernel.org>
 <DJ3MAHWC1974.1MKBKAXGMNAJG@garyguo.net> <87wlw9gsg2.fsf@kernel.org>
In-Reply-To: <87wlw9gsg2.fsf@kernel.org>
X-ClientProxiedBy: LO3P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO5P265MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 226923e4-09da-483a-2c79-08dec5552f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mVbyFge6pCK+cOZ/Sftr8FJBYRFGAaSCimKlq5kyem4fTITfy5XWBLgVhsIU6k9+S1Us0o5OK+2kgFey/ii55iE3vhREmOkn9tRR7szSD7CETbujMiCvRvIPZ73ZvKo1/0+n1CDVCBsWT4PUHY0HrW4h0sWIM31Vv4RSXnnUWBnHJ4hZXWlpOjresQlvpa/hQp0v/L5TIqfWpU/Us1v4bQfD+Mt7V/59oz1fnch7nqbyDz73N3kaY6JSFyBY4LDYCc/0ILtUtRujg2zO3tDAtilGXjuL0kJs7AeSxSQvwzfiqXH5nG+mYBsgDnCq0rtdKyPmJZNau5i+kCMEsYNSEFh8hnucLZLb2dFjFLph17mKqHSF8HbW107CVzOsHwEGkQJE9TTcFYLO3DwXUZ7G2sTeLl5+8vEQM20JyQi7DtwFb8Tb1P7JenfDkDac0ulvlY8SmtXb5p14qlWPMIgVA+GF+sCUfbaOe2ztMyxNoWPm1eBgxlYYxXQ6rZSYZWIPSzC33SN7AXEfbzTqkbHDXbdSwmTnBnstX7u/KcDfU27SxVggkRGtkjlNuRX73xUQeYlDN/AUgaKY6xGa08gF5U9tk+9HAmN4djJKI5xLYCeow3PDGYzNs8UlIR4kSRZPFoT9ee9o5P0gRc8U5jC/1L2jI6kWDUBASZLVUjMd3lQqAZk/zc1MEPtTiwU3J3K+3IVwWtYdTf4bnY66qif+bN/8l1kOVS6K52HFSSrlZIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3JlVmJ3ZmVpUTFnTFFRazhvTm53NENtZWVXWEFQRHZ4TUVEVFY3YWpLK3Ru?=
 =?utf-8?B?cHZxZ0FXMHFwV1FCVkVRL2xaZExpZFJhc05aVUZGVFR2WXdUVUcydTBFMDhx?=
 =?utf-8?B?NkR6N0dGdmZweXk3RjJWVTJhL1ZhM0NBUDk1TC9iNERIWmk4czZuOTdsaGow?=
 =?utf-8?B?Z0NZSWFCUWF0UnRCL3ZNRk0yZ0FxTG9nVjU0NXpNdXZlWjN0dTJUdXkwWEpT?=
 =?utf-8?B?VGQwR055WTg1VUcwNVBsMmNPOFV2MDl1blVzZEpJL0JiaWZmVWhBb3dnSlUw?=
 =?utf-8?B?MjhNbENNa0RITGJRUmxLb3R3OVdLV0tNbTJNTWxFam1ManhyZUl4eWFjUWE1?=
 =?utf-8?B?dkpURDRaaGxGS3F3TmRpbTJ3VTM3czl4ZERoVGJsL1MwaVJmYmNWdmwvaldE?=
 =?utf-8?B?L0YxYVE4eER1S3l3VXRPeGIyUnNBRmV5WTJHUVFkUXdEQ3JGN2RmTGFQaW4z?=
 =?utf-8?B?dHFYYkVxL1FWQU1QKzl0eHZZdjVtbHlOSHd3RWI3elpNYTExRCtCL3Z6NEpK?=
 =?utf-8?B?SHNUTTI4WkNMY2RxTFZTUkNlS1YzVldNOHBGZXhCdXNIZjVwZWc0eGZla3F2?=
 =?utf-8?B?cnlZTHowY2J0WEZweHlXc090UVkyeGNGNnJESTFETnFwbFNpQkJ0T2twUThq?=
 =?utf-8?B?VHg0SjhYN29MM0FHeUJiOHJVNGhGbEZ2RVU4d3JWaFV3Tys4blJ0NWpyRjMy?=
 =?utf-8?B?bUlCNWllcG5heEFsS3pIUFI3NWdnOVZ4SUpjZWpVNVhta1FWenlHYWUxTVJi?=
 =?utf-8?B?QXN1djFUbEREbnhMc0wyMDJJR2NLalJ6MERzUE5FN1R2S3E2U3pmbDNrLzli?=
 =?utf-8?B?VDBQWEgrWlMwWHBmMGNUWjJzSXV3ekdWVGFtdFFubk1QYkFnMkZnK0JNdTNF?=
 =?utf-8?B?N1dFT3NSK21WQnVMeUZHaEVGczN5bzBPVjVNL0JpMmRidkV0MmE2czEzNUNE?=
 =?utf-8?B?VTR1NE5tTVZQR3pGbU5oeUxBN2VwR0FJc3AvamxLcndTeTJJeUtDVEJtYTFH?=
 =?utf-8?B?RDd4aW54K1gyY214eXE2V1lUSE1ETkJ1MThOeEt1YXZtTC9VM2tYZDBid3FV?=
 =?utf-8?B?K0UxWkkvd3B3TkQvSU4vREdtbytRbTNmUWRsekFyWDlDM3lsaDBXQm1uY2VJ?=
 =?utf-8?B?QiswUmRlSnNLVjJRYTU4cUFIS2l5MTdlMmVLdVE5bzVvM2Y4UG5VNitUL2Jx?=
 =?utf-8?B?TjJwZjVwOEFSdlVJb2ZVUTBXSzZPWFh4aVA1L1R4ZkZZazhIYlZpK0Zoam03?=
 =?utf-8?B?eitRa2R2Q0VVZVY5RHl2RHZEWHoxOHpnb1ZuT1owL29sM3V0M2NHWnBqVDlJ?=
 =?utf-8?B?WmM0OXM0bVVjN1lrOW10Z2R0Q3FYYjdnRTM1WGJWOFhLbHZQL01NT284aWVI?=
 =?utf-8?B?L3labzRBQ3FWZDFSdm1XTWZPb2JzYTRtV1dnYkd3aUxJbkJCU3Y4alBjdUp0?=
 =?utf-8?B?ZXNrZXdVa3FrVG5CSHVSZEVXR3p2K3llditPRnN3SnBxT0VjSDFyRndHR3NI?=
 =?utf-8?B?MnQwejhBNEpDckxxWHZaUUxUL3hvQzZvU0NqbUdhb0ZxUzJhTFV2SnA1bmQ3?=
 =?utf-8?B?cmUwVmtJbDc3MkZqQnJTQ0JFOGpzTTErZ3VDL1BRajlmTTdDMmV1enVYOEhr?=
 =?utf-8?B?Nm9GR0EwandhbmFQRVA0M0tnS1JpQ1lWckRqY2dBQ29IRDRmZkI0T2hIR2py?=
 =?utf-8?B?ZllsNFlheVlkdkUyUHJoRjZyMDlmRjBVeTZobVh0NkQ5SjJyUEo1ZWJkcUxi?=
 =?utf-8?B?YWxzV2lEeDN2TS9yK2FDMkE3cndXRnAzZmtUdmNnNmlZd2YvR0tUU1Y4SGNz?=
 =?utf-8?B?KzdUbms1bHEzUzdLNTh4RUZGL2V6aWk5ZUw4UjF6My93emhIOCswblhpSFZl?=
 =?utf-8?B?YzdTSm8raTZaRFp2bTFmQkV2NjNaMGNDK1l0aUJadFdZOVh6SEZFcnpLdVl0?=
 =?utf-8?B?YnNvWHdZRkUzbVZqekxHMHh2L1lYZzNlYURBRWw5TUNNaUt0SXZ5MEYrRGFU?=
 =?utf-8?B?QURVSFphN3RGODk4K3lYcnVHVm4xLzBzTGNIUUlCNWNQbndQSFYvbVdva3Fa?=
 =?utf-8?B?VEdZbWRKZmg5MVVvekR0WTY2UUVjbGhvclN0ek5xTEkzaVFSM1IyV1pPeExL?=
 =?utf-8?B?S0R1YTUwWTc1UXQ3VmR0aC9wM21pRnlXOVB4QzlyOEpOMi9pSTdCSDgvU3NV?=
 =?utf-8?B?RWg5UCtpbCtRSEx5Z0RtT3NrUmVpYzVxV3F2V2hTc2s0MDR2VGpQNm1oVlNx?=
 =?utf-8?B?YXdrQmRISm1aMEROR28wWElDcFNJT2tPbzZ3aXZnejhDZk1lY01uZytuYlE0?=
 =?utf-8?B?QUQvNmd3SDg2Z1crZzYvTWwwREtncVpaeEZHNUt5Zm1JKzROMlNxUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 226923e4-09da-483a-2c79-08dec5552f6c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:57:59.2976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jmZZ+/c3GMOHFCsQRYd1bNxPk9QNBRe0nxFRuNjJZJ31ozQvVQtqE8i/8CFe3jin/LpsIelRRGualIq2bMpAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO5P265MB9389

On Mon Jun 8, 2026 at 12:52 PM BST, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Fri Jun 5, 2026 at 1:54 PM BST, Andreas Hindborg wrote:
>>> This function returns the number of online NUMA nodes.
>>>
>>> The wrapper is needed by the Rust null block driver.
>>>
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/lib.rs  |  1 +
>>>  rust/kernel/numa.rs | 19 +++++++++++++++++++
>>>  2 files changed, 20 insertions(+)
>>>
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index b72b2fbe046d..00713b2adcac 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -97,6 +97,7 @@
>>>  #[cfg(CONFIG_NET)]
>>>  pub mod net;
>>>  pub mod num;
>>> +pub mod numa;
>>>  pub mod of;
>>>  #[cfg(CONFIG_PM_OPP)]
>>>  pub mod opp;
>>> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
>>> new file mode 100644
>>> index 000000000000..760db072a6c1
>>> --- /dev/null
>>> +++ b/rust/kernel/numa.rs
>>> @@ -0,0 +1,19 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! NUMA topology utilities.
>>> +//!
>>> +//! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodem=
ask.h)
>>> +
>>> +use crate::bindings;
>>> +
>>> +/// Returns the number of online NUMA nodes.
>>> +#[inline]
>>> +pub fn num_online_nodes() -> u32 {
>>> +    // NOTE: In some configurations, we can read this variable without=
 an unsafe block.
>>> +    // SAFETY: When NUMA is enabled, this is a global mutable static. =
We do as C and just read it,
>>> +    // even though it might race.
>>
>> Can we do better and do a relaxed load instead?
>
> Yes, that sounds reasonable.
>
> But what are the semantics of a relaxed load when other writers are not
> using atomic primitives? Does it make a difference?

This is the whole CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC again.

Technically not okay, but this happens common in C code that people can cho=
ose
to ignore it :)

But let's not advocate for that in Rust code.

Best,
Gary
