Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F903A1D14;
	Fri, 10 Jul 2026 20:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715266; cv=fail; b=CFYuBzKYA89vROgqoRnQ4uQ65G0ZmfQffznfZ8UwZdj3JanYvBaTMATmv4xi5mh5CCQTE044sceavqYicrbSkx0o9dN5Fx9t9H4WvYuU2GKB/f+djVToDKixgDlpjHZ9gcB4EMZ9Yx2Rv0FL+cSDnVE9p0uOGnsGF+GXxWdknUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715266; c=relaxed/simple;
	bh=XSG+04TrKv+ZE7GivTi/6OXI3/zEc8tAREBRFCMbb8o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=u4T/m6i8Ve+1DPdcau5kQ8MNln9cM/uL/M9XGVyaBfHLSo6VH1uQCfHAOMioet9jnEdnKols8pzQ1AVyQudvQ2xLtOcYP97u6FOmTz9NyP4uI2A9p3MS2Ix+WBTYUyGVbVwgAsQMXF7wA4jfIZPbOKV5kc0iCe0yIdJBkTGjw+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZlXbqnc2; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZlXbqnc2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4WgAAhcTn0r2vup/ETzGT5Pq8cLLP0XZLXl4ikNkx/H6CUrBb6jmHkxQGARGjP5+x4rw7FWbdkv+vmDrZ5oPSX2/vqLHXSr64w1bE2X8WkuYBpYdLw7fV9RBIioSGM2XHvtN3mM10RvGl5DBKnD6iQxUU6EHPVCx3pPFb+d+guEWmK+V6QSYxe3igILJnwPwcAKCB3Y6gcGF7HxgjtVMIj412XDkBn5Wv4am28HckW1S5Xf4GiqGMSx6+8PGxALpJ5a8CBPVOuZygamHOq3vt6wDYi4h4TSZvnDEAu9rvUvy+nuEHuFSofzAgfRhAvd21pbUkSxY2oH9vBGB/gXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwmYA5ydNF/73fK1jhyhuGKlasDJHswzgxJn+/t+TOU=;
 b=w3lZDpRhgzpqOsoQIvkI5unWYQ4KxkbrYYPzLbh9nrBU3V0KDRgw/VuQ0kAl5L4WszZ89tf5NA0DVE6NWnzq6nvBfYoZEX0NE5eb/oJcold4C5I+pauloXsI84Usa5d9iPotMbi/u+sdfTRTu6tIHc6fPJw8wIWOxByaM8SqoSyMS02BqJ74H47u2k+Yvl3Sog9BGpg6fwCHETu8Lnb63FLO0psXuzqloBvnlgxuiZ8oO0mToM1xt4jXG9ktaLT3xLV3MZ4IOxHaUsUD+4TdQmlbJb8GqkfLhfwwXHRvO3kV3P6EHgHkasy6jxLWuepeVzlh/PuxcL2ql3ywbMt9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwmYA5ydNF/73fK1jhyhuGKlasDJHswzgxJn+/t+TOU=;
 b=ZlXbqnc2XczBr1qyO8LcK2ui68IZfzllqAOZkNA+5RT2/vn61QxlMaLOW9YhKAwznqKUNvE5a61bkGS+otRl2gn3Ldk8lHLuLfPZQWNcsr7yAuJITEP1M2rJEbIAhCgzGxnD7+Yt02h9sh16aj8jm1YbNEHtd1NzC4+QhUGqfWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6681.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.19; Fri, 10 Jul
 2026 20:27:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 20:27:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 21:27:37 +0100
Message-Id: <DJV6AD2E0WK3.BFCKB6AM6A79@garyguo.net>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <brauner@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] rust_binder: Add dynamic debug logging mask
From: "Gary Guo" <gary@garyguo.net>
To: "Carlos Llamas" <cmllamas@google.com>, <jahnavimn@google.com>
X-Mailer: aerc 0.21.0
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com>
 <alFMOYlB24vuOxP2@google.com>
In-Reply-To: <alFMOYlB24vuOxP2@google.com>
X-ClientProxiedBy: LO0P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: 70604715-e24e-4244-9c88-08dedec1af3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10070799003|22082099003|18002099003|4143699003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	W0/Ntya7Rn4H8K5NllF6Jr8xpa3d5lf2BQ3rypWHsFTY852eSNZUv9WOBsQk3tU5c2hY6PKzdHwfVGLYC8/UOljwbzSxpxjfOr/YU36jKfo3xTmaS5Ysc29Don9LxftvW4XWa7HSIztEdPtQVDV26/LfxEX6JRBtMUy9WFnP76fNENBTgXk0G0y5itk/9MGdPTShJGOravlxjdcssHjE+rHfIFATAfgt0ZpKUQPgnMajRwIYV3UBEDPhgrQV9zj+yT903KM1nK+7q+2AkcBfl5Y037XISij3a1wH1Akm4euCCdsFON2ptWyZ1raZKh4p8Kx6OaHoJB3/Khz0iE8Q3LZ/2OguypUhUHDjxfsrV9kq2HOsGM9T5gfm7jI4d3VmqD+AUGQ0FEiaohyzhAVRViw+M/l50D2v2TVljROvuCXA5M5PmhveSKSX3C4FuzRY+wltMd73/6Ndznud22ClqD8mS7uYNtmBlh7QcaDUgTGQ/qCljOcH+TfFrHlCNNQr30MsceuOnYwfiauX2KUkscPusx0NSI9NLlzHHu+GVU9XTS94mP/chxukif5/AZ4yZFIjBv9Aus/Di8jrB2DX3EkZtwoPVXr0uiRk3aMOiNCzLXOaUJnhbdGsC/6X6/wjyfbqd+Uwdr0v9jBUDx/QCH5JtsWvAa5i5vhlwAzqEeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10070799003)(22082099003)(18002099003)(4143699003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVV2T0F1ZXgvdUV6T0Y4UFVoaVB2dHhXOS9nY0pQOUYvNWZVK1d1L2l5N3BS?=
 =?utf-8?B?dlZWYThsWE5BR3FwUXBMSHJseFM5OHBvQWsyODRNYVRxWWJ4elNLcUQxU0Nt?=
 =?utf-8?B?Ly9IbWk3aGp6ZFNqSmRwb0srK1BNQTcwTDB0Y0VibnJCUTJYVEp4YnY5dmt0?=
 =?utf-8?B?WVhTZm1qUXJFaGNjWmx2QXVNOTZpZWIwN0JPdFRIVkVFZHJCMGFTRy9vazJQ?=
 =?utf-8?B?dit2UVpITmV0aVlDRzZEUjNIc2FOUU92R1oxV0dGODk1YUY1eUVDbm55b0di?=
 =?utf-8?B?L2x2RUhkdzJFMnUyMUlmN3NQaER3dmg2VkY3SXNHUXl2OXdGd0JJUFVXMWFx?=
 =?utf-8?B?MVZVNVBCc1FtNXdvSzZUL3JDUFl0RmZUYjF1QkllQkhpcStET0tyUFJTd05X?=
 =?utf-8?B?UVY4eEdVVzFBbTNjb3U1ejU2UDFtdm12QkdUUG91eDFHUUpEcU9TcVpuWjdx?=
 =?utf-8?B?aUI0cWVWWkZOc3A5ZlErWmtsNFJNbHRKSVI2N1A0c2FnMzd0d0xaOHV6Um1y?=
 =?utf-8?B?Y1lhbGFPQzl4T1NEWDNhdXNsMFEvZWxYdVVuWkQ4Z3hpdlNGOUZVNXVPMUN1?=
 =?utf-8?B?eXppUjV1MTJjRGRjc1lxTlQxRFhxLzlseFhoakVmdVp1cDRBUmJhd05rYU9G?=
 =?utf-8?B?V1p5eWE5SlcwWEtUbFh5TUNwZGtvWnpXVzZQN0hPYXgyaWlZQ3h5eWI5VEwv?=
 =?utf-8?B?QUE5NWFISVR2QXlOcm96ajNwZk5la3J6MXlFdmJqdmFFWStlK0R6bXRUSGVC?=
 =?utf-8?B?VGlHWktXUFBhcVBZTFJWL2JGZ2hCTVE0OW1NV1hFQmNiSFlHaXQ5TlRHNCtC?=
 =?utf-8?B?dEhCVW13Y0xicklEMnMwZHFwOGZCVlNscTlZKzFvRXRQMTlWRE1PNnRpT1Y1?=
 =?utf-8?B?VE9iSjVMNHdZYklvQnpIOTVwZlEyS2w3VVkyd0FmVGM2RGdPMmNLd0x3Uk5r?=
 =?utf-8?B?VE9XbnQrZm8vYk90c2dIU1ZuZlV2TXNwVkRLZXR0RjQ0KzRiK3lrR2U2TVo1?=
 =?utf-8?B?UjlyNGlLU2pncUprVldrSUdJR285Nmd5VStRZytybURlTVFqRkovRkVidzFu?=
 =?utf-8?B?VmllOGRPdWtFRFg5OHlkcEE5dDk2UzUzbTBqSXNxNG1YdVJDZ01xU2hMblRR?=
 =?utf-8?B?M3Z0SnBjc1pOUkd2U25MU2RQSjBQeFJpYzRlK21VWVFWcFlnTkdtaEhmdnIw?=
 =?utf-8?B?QVVCd3k5bVRTRzk4NHZYT0E2RGNYYUh5eEJnN2lJZm03MjcydkNYdTdTZVdw?=
 =?utf-8?B?WFhMRHMxeFV4WUQ5ZmhteXdWcmV6M2VtVHhoZUh6ZnBQY3VxUGZPTW84akhw?=
 =?utf-8?B?Z2laN0ptanFVK1pmSkh3ZllIdjlzaEhmTWZIV2szMTRUMzhmLzdoWTJlQ2RO?=
 =?utf-8?B?eGtwQjFPdG1DeXE5QUUrYituazlkODRrNHpybm1pa2JlUld4b2pTKzRLSkhS?=
 =?utf-8?B?bEkrVmR5OW4rQml4dDV0KytWdFp5aVNmYkxzOVBVbjNEVm8zNkljUTZWa1ZE?=
 =?utf-8?B?VjIySkZBVDZQVmZYb3BOR2hYZmFzUW9XVzRnVnNXaUd5MUZrTGF0WDNWejZt?=
 =?utf-8?B?c1RzVDhreS9SWnUxOXpYRzBycXlLYllPODd2UnlQUk5Xa0FXcDBUYmpYTW1V?=
 =?utf-8?B?M3lpclRXcE9uWlB1VWkyWHRPcVVzL2ZFTTJKQTJXbXdGemlUTW5wVzJ4cC9V?=
 =?utf-8?B?TXBjTFNaamhSdFBGWUoxSzM2ZEVZYXRkTEphUHdxWlhLamxma1Q5RVBYRlVn?=
 =?utf-8?B?OFFDKzF1dWcrS0JDamNOYjN6V2k5bVhOTytjWVBZWFRxQW9qK3RDQWVDb2Zw?=
 =?utf-8?B?K3JVN2VTeGtHcDVoK3hTRWtvdGJzc29rZzNtZDFnZkdpVHZkQm1kY3ZxSXZJ?=
 =?utf-8?B?S1RzbFFyeUVBbnBwYXRXZ3JVM0VoemhkL2RDNFo1djJGMnpKcDdyQzdHMG4v?=
 =?utf-8?B?dTQraFFEZ3hsN1g3TmZFaGxlM2g4Q1lqb0NnTlEwUkhLSDcvR1BvcnhiUUlB?=
 =?utf-8?B?ZDZMcENZR2wvekxiNC9meWJHZDZZblYrQ3JxbGtjeXFYd3FPZ1RtcFJhVmhR?=
 =?utf-8?B?OWcrdlR5T3BzcjRQRE5rSXo0Z1kydFlnQUV6VGJNZ2NYQkFtdDIzazhNcWRs?=
 =?utf-8?B?cHQ1SXVzVUprOXVUTk94ZFVxRzFQL3VUSTk3LzVQRkcwaTVteWs0ZllRdzVa?=
 =?utf-8?B?Y2pZWEJ3YW5DTXdtazQreU1BYmhtL0Q5bFpYc2FTQ0c0M0tkSHVFeDNoVnVP?=
 =?utf-8?B?Rkl3cHR5OWMrWDFqcEZlY0lWSWx5S0NCMTJmL3hsdEhUa0hUVzFUU3NmMElO?=
 =?utf-8?B?VDMzSnRVT0ZiQ2xQVFJsTTFDamxDMGk1MlFXZEQ0c0tXVWxmak5aQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 70604715-e24e-4244-9c88-08dedec1af3b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 20:27:38.4004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3Djg40V/HB23vYrmKQEqoD6IA7MMYGc1jYLDY0BJE+2NKkhsIw6hWBbDqwdRyuY+TNNtzkv8PG9mAzk6xes9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6681

On Fri Jul 10, 2026 at 8:47 PM BST, Carlos Llamas wrote:
> On Fri, Jul 10, 2026 at 02:32:52PM +0000, Jahnavi MN via B4 Relay wrote:
>> From: Jahnavi MN <jahnavimn@google.com>
>>=20
>> Implement a dynamic debug logging mask (`debug_mask`) for the
>> `rust_binder` module to allow dynamic runtime configuration of log
>> levels. This enables parity with the legacy C driver's debug mask.
>>=20
>> Since the Rust `module!` macro in the current kernel build does not yet
>> support declaring module parameters directly in Rust, we define the
>> `debug_mask` variable in a C companion file to expose it to the kernel
>> runtime and import it using FFI with volatile reads.
>>=20
>> To verify the setup, instrument process lifecycle events (open, flush,
>> and release) in `process.rs` under the new `BINDER_DEBUG_OPEN_CLOSE`
>> logging mask. These entry-point events are chosen for initial validation
>> because they represent the start of the Binder lifecycle and occur
>> at low frequency, allowing simple runtime verification of the dynamic
>> toggle without log noise.
>>=20
>> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
>> ---
>>  drivers/android/binder/debug.rs            | 80 +++++++++++++++++++++++=
+++++++
>>  drivers/android/binder/process.rs          |  7 ++-
>>  drivers/android/binder/rust_binder_main.rs |  2 +
>>  drivers/android/binder/rust_binderfs.c     |  3 ++
>>  rust/kernel/task.rs                        |  7 +++
>>  5 files changed, 98 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/android/binder/debug.rs b/drivers/android/binder/de=
bug.rs
>> new file mode 100644
>> index 000000000000..da48bce3df54
>> --- /dev/null
>> +++ b/drivers/android/binder/debug.rs
>> @@ -0,0 +1,80 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (C) 2026 Google LLC.
>> +
>> +//! Binder debugging helpers.
>> +
>> +#![allow(dead_code)]
>> +
>> +kernel::impl_flags!(
>> +    /// Represents multiple debug mask flags.
>> +    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
>> +    pub struct DebugMasks(u32);
>
> Where is this being used? I can't find it on subsequent patches.
> Maybe leftover from previous implementation?

impl_flags macro requires a type for a single flag and a type for flag mask=
s.

>
>> +
>> +    /// Represents a single debug mask category.
>> +    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
>> +    pub enum DebugMask {
>> +        UserError =3D 1 << 0,
>> +        FailedTransaction =3D 1 << 1,
>> +        DeadTransaction =3D 1 << 2,
>> +        OpenClose =3D 1 << 3,
>> +        DeadBinder =3D 1 << 4,
>> +        DeathNotification =3D 1 << 5,
>> +        ReadWrite =3D 1 << 6,
>> +        UserRefs =3D 1 << 7,
>> +        Threads =3D 1 << 8,
>> +        Transaction =3D 1 << 9,
>> +        TransactionComplete =3D 1 << 10,
>> +        FreeBuffer =3D 1 << 11,
>> +        InternalRefs =3D 1 << 12,
>> +        PriorityCap =3D 1 << 13,
>> +        Spinlocks =3D 1 << 14,
>> +    }
>> +);
>> diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/androi=
d/binder/rust_binder_main.rs
>> index df47aba05133..995e6131bb77 100644
>> --- a/drivers/android/binder/rust_binder_main.rs
>> +++ b/drivers/android/binder/rust_binder_main.rs
>> @@ -31,6 +31,8 @@
>>  mod context;
>>  mod deferred_close;
>>  mod defs;
>> +#[macro_use]
>> +mod debug;
>>  mod error;
>>  mod netlink;
>>  mod node;
>> diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/bi=
nder/rust_binderfs.c
>> index ade1c4d92499..fa8b38465550 100644
>> --- a/drivers/android/binder/rust_binderfs.c
>> +++ b/drivers/android/binder/rust_binderfs.c
>> @@ -51,6 +51,9 @@ DEFINE_SHOW_ATTRIBUTE(rust_binder_proc);
>>  char *rust_binder_devices_param =3D CONFIG_ANDROID_BINDER_DEVICES;
>>  module_param_named(rust_devices, rust_binder_devices_param, charp, 0444=
);
>> =20
>> +u32 rust_binder_debug_mask =3D 7;
>
> hmm, I'm not sure about this magic number. Do you think we can
> initialize on the rust end at init()? Or at least a comment about what
> flags we are setting as default here?

It doesn't even need that, just a

static rust_binder_debug_mask: Atomic<u32> =3D Atomic::new((FLAG_A as u32) =
| (FLAG_B as u32) | ...);

and a `extern u32` on C side should do.

would do. Unfortunately this has to be integer bit-or with casts (and canno=
t use
DebugMasks due to lack of const trait impl).

Best,
Gary
