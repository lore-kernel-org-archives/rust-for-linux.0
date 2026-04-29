Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020141.outbound.protection.outlook.com [52.101.196.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0FC138490;
	Wed, 29 Apr 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462477; cv=fail; b=kwmH1OWMGfNsss32m2L8lxrRLJIj9LSy3brRqsGlInglGJYylDkb4tw4w4YsU4TwKXsR8w3bNhAkP/P8Sy5IjnwYS8YLvKkAqT8GHHwcGccP28/3A5ldiwjQ2zTQz1IqSEAmy/ceaufWC88s1inyQ16fJXt0lW9w9OrJdgm7hVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462477; c=relaxed/simple;
	bh=BZv0/56Aol4MfgfD5NnGvtKgzXG4DN4Eo08KFOsmheY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=f7E6Po7YcZxyai6FNhnkVr4BQdtZAdZ9YAq733dMJc5Da/i18SZMIvRpQ9RRP3RWEXf15JCL5BxsOY69Ri/+FDPUSlyyRtFWNKHkPjtUqA+1Rs1i/6YT3M0ipOdKrarcoiO/dkEI2QER9My1bgtNHgL2eURHJ1yP21VM/dzGETw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=RyaHOxI0; arc=fail smtp.client-ip=52.101.196.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="RyaHOxI0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkrTdkKjyliYMYHelM4DHqntB+j6pp42I+qWHxAhRvoIPk0CoK+a2U2nYtRDaHWE7NqtnYlFGCcnGT3d+zJbFGDC2vl3LRzJ2n4RkOFCxFWV7A8eRmK+LftSNaGmRIMhL+GvD/Q4MUTmvm1MxjqB9Qkn1+KzudgFueD+bLQ3bHknoRuWnGi+lJckqzJ9fygjYCL8IRmp0wyvbbgH76hRgNh7GYFtY7I9KOKA6shuRshJhQUyX515uiHqgHSzQ/ns9MhjFozCDrqzWfu3t3GP4gQl9h+YfMRxB628pAj5Hh7j/bboE6V3KqHI2uieWkPlVrXbQzMuoOzmpGL3KT4g5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BUNvauESAB0czGCU7T42IBsf0MlKcM8TtgsbQr3D5o=;
 b=xysdDAGhjknMNHG54QxkhVGdHTYNQOGXBPmGFWh9K3PVlApeGa7bTRaDZE7Jzq7IXE1c4TFkjh99fpSE2fjwmGQ7HqqA5/O6sI/LdMr+/UacRu5s90sp+dDk0HxKpcIfYsZPDC2DKxrAXU4hrPbqVioQQ6UYFwt6bWO0hmqbsKDXKqAWoeN8Jyv2QePn/g9ukQ01wSp3zt14Nz8a569WXX/mUgg7TJAXJ0+NVXUXbdBPTMGng/nBeAK+L3yvCq+C/mFjFHJinBkZtx7utyoStE1aqqKWQGOyI/KgTSBbh2NdK4n87LZDarS0opqjt0WhZrnLtx/koxuK0WKf+M8WZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BUNvauESAB0czGCU7T42IBsf0MlKcM8TtgsbQr3D5o=;
 b=RyaHOxI0oJk0/+q1xCqHoiUWnozyiLwajs3OtrijDLtC0GivxCSdbcGjn/ByeYQ3N0jpFXwcOUw8cOU6K6feRgKZmeW1+Xd5f5cdEy62kRtmPkMbozNRP8OU2WZLw2nYUBFzNygSxpDUQ29C0QuFG1GoXdQset9K0+DJYntGhxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB2857.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:181::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 11:34:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 11:34:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 12:34:31 +0100
Message-Id: <DI5LUYIPIYB5.1CY8G9M7R5W6H@garyguo.net>
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: drm: fix unsound initialization in
 drm::Device::new
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260428-fix-drm-1-v1-1-755057178066@nvidia.com>
 <afG7Np4Lmv9k7D1U@google.com>
In-Reply-To: <afG7Np4Lmv9k7D1U@google.com>
X-ClientProxiedBy: LO4P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB2857:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9975ac-23eb-4732-7bed-08dea5e347d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	louo1T8xIeTuv0SV62TWutgfoR8/Sl3ADbTQ5mxlVhHOVsU8x01yaItVOh2ydThi/R0XGQuI2klbooqzYQD32x00AvPtVqmVjw7c77DNznexC4vRztV8auf0/YE8lOTH1vp1llFrzy4UNyy0U8Da1Str4u9YZxtHNPUC05VIVjhflP5sQiElMcS63vmo28lZov/8OFjnl0t9X2W2judCHKHtPRpxK8/g1+e21lyEQOd+cKCkfTmYn2GAqf2WCPctVx4tm3Lt+Brr3BiBtqBaFPCh6L+FMEisq0AJ4HGGRkJ27KVw6qgyYJOCOk+PCykwHRU2PTheKTnz+pIFSsbtByMEDnI69zU1SmTdoEd/R8QwSK1FfQs7lSPMwiLJN43WFv92oWxKkQ/TxJQG2Zyzy2yWgI+as+UBYtC4Y/K+5KPq7LFliaGEt+tX9xtwC4hig80i+F8EXJNXfyymPW66GzY9Zsmkn/u0OL6RDzA/GQ9JvhvQgbljeHb0BZ21SyvfOJj0HV7BI/XF/XUTY5leqt9VAKpk2L4kO7fAe9ZPjhwHnRRfo7PMBKsAMj1/8RV8jHeekoQTZAYukhXRbhYbO0QpzMMQ2Rx6QSXJM8u/BDDbmpKD7KYSEvrj1KaZjVoWrzJ4JBOE/l8g6xOwII5IPhOj+xf46Q9/Ob2AJZ73Qp9HDQ9A2TjLNzCHVwL2KlBoRQaPeXXeUm9pFnsz8jKMVLVlQXkz74W9OgexnPi/tDc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2l4TnhjQmJVNjdtSVNrSzAyVTNPY1JEbVFwenhXZGVyb3NIVUcwa1c1R2Mx?=
 =?utf-8?B?OHRGNVI5RStEMnBSNEpSb1ZvYkNsR3NWUjFQM0pKd29LT1pqQ3o4bjJaRXN0?=
 =?utf-8?B?dytETHViUzVpR3R0L3h3SWhGZTBtZllqWkYvQ3pEeXJSNDQ4Ylo4ZHR0SHdz?=
 =?utf-8?B?d0Y5OGtOTWJhRkYrWVVzcVZrNEZla1ZNUHIyV3JiclVMR25LbE9PWisvVDJj?=
 =?utf-8?B?aDVQM3IxVmdjQ2JqOWc0T0NNYnIrZGxyaGZNbmE0akV6bVJQakZZYzF1Nzcy?=
 =?utf-8?B?ZGlTVm5UZkRZVlBRS3F5RENYSGhLRWlVSW5TcXltNFRGdG1qSnlSK2U0ZC9w?=
 =?utf-8?B?aEVvMnJROGJQQmhjamVDdVpHT1VGMy9YTm1mZXpwNXh0S1hkS2Y3ZS85KzYv?=
 =?utf-8?B?c2lkVHJMaEZJM2p0bE9IRDVMcFBQMkpvZy9wSjZvT2FkM0lhZkhMdmZ3YTlG?=
 =?utf-8?B?NmZXdWpvZ3JqbEJmSVhudURiMTdIRWYxRmU2OHN4MW83M1c0NHk5MW5OTGtu?=
 =?utf-8?B?b0VRaUh2RnFTbTdWdmprV1k1bXQxSXMvaUJRWGdMOW93SEhhMXJBdlltVHc2?=
 =?utf-8?B?QWwrZkxBS09yaWthUGVLSGh0WlJDamx3YXZwamkwZXgyS0xRV1h2Y2tqOWNM?=
 =?utf-8?B?YnJVUHVHYWt4UmJOMERicE0rK2hEVGQ5djVGUm0zTUczT00xdDdhdENrS2pX?=
 =?utf-8?B?ZHhneVhyTEYvSDNyb3VSQ0lDZlNRUW9PQ0NtZmRpQXVGVHRkczB2MVE2eDhu?=
 =?utf-8?B?VjJlM3VCNHM3QzA3K2J0ZUtabk0yR2h1Wkl3VzBqSVUrcFNHdHY5Q1hnRy9V?=
 =?utf-8?B?RkhldmIwdUdsVFJwZWo5VFBQRFowbVkzeEhJa2FGamw1Snk5VGcrbWRuQ09r?=
 =?utf-8?B?NFFvN1hRUjlQcEJnaFA1Tms1S0pBUVNURkt2U3lMWUxkcnFLNjhoUFpnQTZs?=
 =?utf-8?B?aU9NNXd2V05DeCtRTTExdTVveTJKVVVReWIvc1NrU1RFNURUR1hNNGkvNCty?=
 =?utf-8?B?QXhkTExVQmNUdzQ2U2tvY1k4RGY4RitiSDEyMkkzeGtZN3F4SVhySXhOS3BU?=
 =?utf-8?B?MFRPem1kNGg5NjBrNkxqa1pMN3VSa0YxOXA0dDFpUVJCeUlvUDFJczJ5bzlh?=
 =?utf-8?B?amcxcUw4WHVxQ213SHZZcnhvRWJkREtZZFdQM1MvalNKSnJ6d3RYMDMvTzdU?=
 =?utf-8?B?bGVLMytBU3V2ZzltNlR5S2d1SFluMWwzNWszc2g3MlFiU3d6eFdTUVRxVnVS?=
 =?utf-8?B?WklHUFZ5QmhUSFFFK0E1N1NvZVNPS28wU3NlY0J4WDBqdFUrc0IzdjdYWkQ1?=
 =?utf-8?B?ZVd1WmZjVFRPU3dLUE1VU3QxZnlPOXpCR0pGZ2gwWmlJa2svcU9EQkZaUzNj?=
 =?utf-8?B?ZjNicEFMdE0vemUrTG8wdDJjVG5xM21ZSWJzSTAvVE1hcVg0ZS9Nbys5SlN6?=
 =?utf-8?B?SWhWRE9JdzRUUUhudDdYRVZPY29MNmZMeWp1ZlA0RzhEMFNnTzlEb25BVEhC?=
 =?utf-8?B?dGxrMXIxUTNOaW8yNVNOZWxrNXpRUXBEeEMvMUFOZW9NU2Z1TFRxYnk5WTlG?=
 =?utf-8?B?aVFBa1NQOEc1N2lKNndlVXVKYjdxVU5rSnFPTVcxdHk0RUgvbEZtalJPc2w4?=
 =?utf-8?B?YkpnZWdUWWNIaHNsSWswejV3dWdWQWNGbTBFRkY0Tm5WSkdnVGhmQ05ZUk9R?=
 =?utf-8?B?MmdKQmRCUHc3S3h0eUZlMjJQc21sZXRQQzBuUkttZGFiUVcyUE1qQXRHV0ha?=
 =?utf-8?B?ZUZMWEZiV0hGSFpkZTA0bVU3QlQxWHN6aU0rSUMvRXBKcDRaU0k0MU01V3Rj?=
 =?utf-8?B?bC9wekNIOUwzVWgxK3FteC9OT043RGlRL1FuN3lRaWhkdDFxUnVyeFUrYmtG?=
 =?utf-8?B?ajZ0SUxSSjhvb1kyNkFQbGlENmNtbm5KNndacHcwQ2puenVZTkZ1Y3ozT2la?=
 =?utf-8?B?NzF1WVg3czV2TUFlUytLcWRBUklqZE94MTB5c3ZjaVRNeFhSS210eS9kSUxM?=
 =?utf-8?B?SkRKZllyTDZvd3MrdVdCYjh0YWFNTHdvRGZ5azJoak52RUVHSmg1dVFLRXZy?=
 =?utf-8?B?UTBnTDQwTXZnblJQMFdza25CcUNUYkp0RFA3UzRFcWIrazlKOGw4YjdwTkRX?=
 =?utf-8?B?bVFtVkVJRXUzRzFjaVQvUWoycDJMb1VIVHQzc1AwSFRwb0creXVzQnkvSnpF?=
 =?utf-8?B?anRBeXI0TmkySm14ZW9jMXU4cTcyU2VWeE9acjJ6R0lWVGxMeVpCSXJSRG5o?=
 =?utf-8?B?QVVUbjRzVVlYTnpnT1lxbTRWKzVHWVFHeEJNalN2TDN5Q3hBOFlTWDllQmtl?=
 =?utf-8?B?MWlVQUlOaUNBUkRpZ0JQc3EwczNFQU5sQXJQZGw3WWwzVnpEd21Edz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9975ac-23eb-4732-7bed-08dea5e347d4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 11:34:31.5422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aV+JRbeBWJmFvI8/f1yTjsQWrABC0XKUcsE4rW3IFQPWLx4zOgkgDTBJvDNauHLotK+T5u+ADXhIfqTpoHQMnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2857

On Wed Apr 29, 2026 at 9:03 AM BST, Alice Ryhl wrote:
>
>> @@ -133,6 +140,10 @@ pub fn new(dev: &device::Device, data: impl PinInit=
<T::Data, Error>) -> Result<A
>>          .cast();
>>          let raw_drm =3D NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOM=
EM)?;
>> =20
>> +        // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `=
__drm_dev_alloc` was
>> +        // successful.
>> +        let drm_dev =3D unsafe { Self::into_drm_device(raw_drm) };
>> +
>>          // SAFETY: `raw_drm` is a valid pointer to `Self`.
>>          let raw_data =3D unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr())=
.data) };
>> =20
>> @@ -140,15 +151,14 @@ pub fn new(dev: &device::Device, data: impl PinIni=
t<T::Data, Error>) -> Result<A
>>          // - `raw_data` is a valid pointer to uninitialized memory.
>>          // - `raw_data` will not move until it is dropped.
>>          unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
>> -            // SAFETY: `raw_drm` is a valid pointer to `Self`, given th=
at `__drm_dev_alloc` was
>> -            // successful.
>> -            let drm_dev =3D unsafe { Self::into_drm_device(raw_drm) };
>> -
>>              // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_d=
ev` must be valid and the
>>              // refcount must be non-zero.
>>              unsafe { bindings::drm_dev_put(drm_dev) };
>>          })?;
>> =20
>> +        // SAFETY: `drm_dev` is still private to this function.
>> +        unsafe { (*drm_dev).driver =3D &Self::VTABLE };
>
> It would be bad if this ended up being a reference to a local variable.
> Please use `&const { Self::VTABLE }` so that it doesn't compile if this
> occurs.

Self::VTABLE and `const {}` are both just constants and there's no differen=
ce
here.

If you want to guaranteed static promotion it should be

    const { &Self::VTABLE }

Best,
Gary
