Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022134.outbound.protection.outlook.com [52.101.96.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4B4749C9
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 11:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040206; cv=fail; b=omP2U3xOZAfHaNP9rNwcuHHwOzs5h4+KJzocAi81WvXZrzT+3xKton6IQsb+VzT1WGnjM+IS8jqS0VZ7eMPlmSe8wxjHTP6Ovkx4me9dExc0bqxxt69rbc0C+QWfSPzRic+LUdqg/LEMDdnj4LWDqm9ueNWbNz4ZHktSkSqQLo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040206; c=relaxed/simple;
	bh=0GgvOLHApolWCFScpB722KYvs+kV6fl9t/bJD+gJH4k=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=t1Eep4oNXJjGfcmRZsp/udZnO0g4EjGUuQ4aMxKKpoGIRoODvDwwZWFZf7OEtXs0mT+FZvYTtohf1KbkNwa7wSS+hMnhhsHRBwG3zxikhkfYVf5G0NnrPqlkD7p+g9zysdqvUJbR/VRBow9cH6ncMCd+ca0zGmkqsQ8eVYom3IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=KfU66U6F; arc=fail smtp.client-ip=52.101.96.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="KfU66U6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCD7bH0zNQ7ZNxJ9NZzTicG/As6XiiFAbQLKorXSQVr1Ij4LelfxUFkUhPIAgjHwqXO6xWKEULu9qo/N3pcvOxVaNfwsY59ziA5xTRxEq4tc9JykWMIdFlFoxwbFOoSL4WtwODJZbF08N/HFU6hKuh8Cvp+CRaDejN/jQBfVKH1GuuCzVTNhW/wxYi7kAbvD31ob9pY1yejFkFV8ovJmCsurZfyfZxPVGoaGvsdD1lnhROKH9bMLSv3ypc1XlkjgaWwL2WnRCw5cmOVAiitrIDQV1LRPw8bWNf/UNhPvRbaNUdrgecrF5wj2OiY9CfcsJlKr2ZLiKa9V7r8Rg247iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lzmT5o94chQ+HbCNN6EXV6znsizF8wC7tWFvRao3Uo=;
 b=Q+i0Xy27bBZO2Jjeee6befUjVPSzhvQljkknAdtT9vAjYYQ2qmgoDfwy0iZmcyaAhZQrT4dKmPLlLMIasPfzYzfjjwITeBTtX7mYm5OZpuXidin1+79NCbwcno6hCU+OBUkx5WfE4IquduVDPLS/DwXD24ompAzTtCyHkrW7jV+4O6OyGZSMUhpxboJM0l5f7D2DNbKE+/fZM9zGgpJOLVhb2+sbHcIcvAWi7qbhyQg74jtBxBjzQzXmMCa+hBLL5QP6zlJ8U4P1l/bgA7EXeZ77W/nMdwfH+cC6Y0sQOkSyy0TWNBS2Jo9E5jcxr3lGzYXABGKRC/v1ZY5O3TrLqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lzmT5o94chQ+HbCNN6EXV6znsizF8wC7tWFvRao3Uo=;
 b=KfU66U6FrAXY20/VzBg9aa7bdoVwOAVOZ12POMzB8ulET6dNUXkr73OBcB4O4kma1y1QZYCEZ3y27wx95O7W9AmHQa8YiV0U+zq26GaOGLLWOqsAj1V3PqZ//h/D+ahcLjOb9zJjyu91uUTRAMTSsHdFhi/4URTKVXTYTNvLO1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO9P265MB7931.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:36:38 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 11:36:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 12:36:37 +0100
Message-Id: <DLBLTKG6KVE9.VNWH1D3896J6@garyguo.net>
Subject: Re: [PATCH] rust: kbuild: export symbols from the `uapi` crate
From: "Gary Guo" <gary@garyguo.net>
To: "Alistair Popple" <apopple@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Asahi Lina"
 <lina+kernel@asahilina.net>, "Martin Rodriguez Reboredo"
 <yakoyoku@gmail.com>
X-Mailer: aerc 0.22.0
References: <20260909060623.888777-1-apopple@nvidia.com>
 <DLAUS65AAH2A.39ZT3OE05AR1K@garyguo.net>
 <aqIQNhGdRTsv4v52@nvdebian.thelocal>
In-Reply-To: <aqIQNhGdRTsv4v52@nvdebian.thelocal>
X-ClientProxiedBy: LO4P123CA0610.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::12) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO9P265MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: dd79d202-4eae-43ab-a6cc-08df0f2fc674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|366016|376014|7416014|6133799003|4143699003|56012099006|22082099003|18002099003|3023799007|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	8g7WpRm/Np1qNX9DEsNmAAqc/FVdIzEozQVaiK6iF7ONy69wK3s9F6S4oUhDjtipnexfYRCp57nN2ID6o/P5n045ebdso9EHD7nkI9tbd40CkfAEj5dCgchqLRl4BnsqSBouK0IxtW7zxzfgDrTiNQ9l36jcCWcWzewVcMiqABUbia8c0IM+ZNeAWs/JemhqEJ9TrSUXnv5TmymOPIs0L3qrLjAvzanWYWunHvl7h7lPt0zjuo2VqiRuAdZbCwpUHuTeMo1+g9AEbkh9brrUqMLtQ7Ea3CrI2AqjW4nHs2pT9sDoZb2MFDDybRINJfk93ZdsBVByolfq8OnDSg58xGu5CAbJWx+4cYvDjRcv44IpvISHRadhZymx/80ihI4CzcgCyrcIZeeOpWxB98Gy5vf7daXNhn8l6za04+S1vVg3FSbkXz1He73x17dPp0bFlitL+YIYUrcddBOjyFWp7+oLsANhFo/W4rQyBbLJlYZgR6Z4S6EdBfrNo0Uc93T3iHsR9+dg66irpldg5x7uMtGW65QlarG+aJOx1rEqdHWfZYhmJmNi4+vHbIxAVeouHzYWphfB/MORYh//5eyXwBNgJRU2+bNX5c/1sh1KhGgTc/pOO9Yu0XB/1WFD0h/TZ9me/UFdgWLFMWs8DmQUfiztFvbwK1Nk4SUUFTsfYTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(366016)(376014)(7416014)(6133799003)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007)(10067099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFEwaWoyYVNlRXU1dktGdTIrbGp0UnJ6Z3dHRlJ5QXJMV3NYd3p2bUw5bVpG?=
 =?utf-8?B?YitsbXR6QmZtYXY4UlN5d1VDTWFYdUw0QjREWXg5T0F6dko0TWtMTmQvMWgv?=
 =?utf-8?B?RGl1T3JmdU1yVmdhd3lXODdlSlRBVTM5S1REeTBQNzN6WFJTQithWEd2Q29h?=
 =?utf-8?B?TmxvYmlkSzlkVUljSjFOTytvdnI5RGd4eUpVTTdHNmJPNnQ3MEsxOGVrWjFY?=
 =?utf-8?B?SjJqMytZR3lqMmhEYkk4ZDM0UVhvUnRiZEZLZkxRNERJQjRTdWV0RmdYSjZu?=
 =?utf-8?B?cE9teFdaRWtYRkdHVlNNeThRM1hnTlBuUWpmY0Ruazg4WmVjbDhJWHJvSkpT?=
 =?utf-8?B?WlFzb2F1WXhkTnAvZVBWbEp0eWhtdTExbDRMRjNwbElnWDVQWkxqbERma2Ja?=
 =?utf-8?B?cSt1NXZoYm80d1RTOHdtQ3I2ZTdBR2pIQXdZcW9hVnh5UlNVMXJOdU9TTkdT?=
 =?utf-8?B?WThJdnZDd3ZtdFhzSnJidk9Gck9yN2VmS1ZEWHVRaldZWWVwNVBJRnRKU1dj?=
 =?utf-8?B?eWN6U1prMXY3T25qZFc3LzdDZXM0STBnWlJaTTl0RktqTENhVHVBamE3cHRm?=
 =?utf-8?B?VWFWRkRRWmFNRVFFV3pqaGpNMkt2aEI2WldKL3paRjNDWGR1ckIzL2tsQ1hK?=
 =?utf-8?B?UHJsK1c3TWZ1eGIzU2pGeVlrRVFLdlMwWHF1cmJlS3p2RnpvV3VvalNSc0RZ?=
 =?utf-8?B?QjBKak1RVlBVL1Y3MVVDbVNOR053Z2E4TnFUNHViaStKWVhBSnJ4SG5VOHVn?=
 =?utf-8?B?RVZTaE00eHVZTGxtTU5IUE5IN2I1aDJPb1o4bVhQd0F2WE1iaU5IcTN5ZFRI?=
 =?utf-8?B?YnhoY0dMVGpQSEJ0TXQybUJ3a0x3bXlIaHIveElkTy9ubzRybDhiVWZKWWlP?=
 =?utf-8?B?Sytwb09xaW5IT2F6L09CRjBTYTFHNUMwQjNKRTkrVkJBS0lLaUtBTzZBNDFW?=
 =?utf-8?B?M251SGJHY1FDcEhEeVpjcnlOWDlwMFFNM205TFJaQlI5UTJwVXlZeFRPN09D?=
 =?utf-8?B?OVZYU05Td0VYTTl6aE5HL3pZLy9sQXhORjkzdXZzeGZMeCt4SUdUeWNQMTZV?=
 =?utf-8?B?S01OaEhYWnVuRC9IYm41bFZ5T3JxR2RGUEZHeDk0Q2w0QnQxdkhnbGVHSldm?=
 =?utf-8?B?SzJ2V1krdGlwQXNOZ0p5ZHI4bFJFVU1POU1XOHdDa2sxTUc1YmJoSFFPOG9x?=
 =?utf-8?B?R0JXMFdEeDg1NEVQQ1NFZUlwZEl1bXplY0I2emhEWVR4Y1kvWUV0SkRmQTI2?=
 =?utf-8?B?V2xMb0gxZXdUVWhSSlIxODF3YXIzZUU1aGI3dHRDOUNoMlM1VGd2SmtjVnMx?=
 =?utf-8?B?VWg2ajVJS2NiYTVEYW1sWlJJdDVhRWZ4dlFwU01pS1gwekttRjFjL0VXbUVs?=
 =?utf-8?B?QXc3UG9hUnNWYUhIWk13OW50UHoxTzI4TTNKZFZpYVFrNlNNNTJWZnNyTnht?=
 =?utf-8?B?bzhmQlpib2pEZVZFVllxUk44elNQNXJpVEFaNW9oeWI5ajU4RTlZdUxHNkk1?=
 =?utf-8?B?TW04UnJjNEtoK3A2Q2sxYlErSEpHeCtGMGU1Y3pRV3dCb2QwenZrdWZaTk5R?=
 =?utf-8?B?N2NjanIwNDc5T3I1WVFqZzU0WXVNL1hVdnZab3pncy9TWXYvdVpRVG1uOFBu?=
 =?utf-8?B?ZkhWS25zYkYwY0ZKdE9IYXB2Zmt5QTJmeVR0OTlqTVBpelVIelF1VnFwRmk0?=
 =?utf-8?B?M2hGaG1EY0lhYzlaQ21rQnR0dmtsckpnM1NVdXNPa1JGVUZiamhETTZwbWdq?=
 =?utf-8?B?dFRvdkdZRmYxSDl5OTFaNEdOOC94ZW14OEVVWmNNaG13aWxHRENjUExyOStt?=
 =?utf-8?B?eGRaWEZHbEs1SHJQYWV2T0VCa3IvdzZFT0Fsc2lWd0JHbUt4RVVZbVh0aEZ2?=
 =?utf-8?B?dXZyd3FrNENYVmhwZ1h3dzdnWnNUVU1PWmtIVkJhMmdMNUFyVGJmNTdHSU5X?=
 =?utf-8?B?enAybFlOTkFhUml3eWdTcTVpNnh5a3NCR1FPeHpXYmp3YS9nSHFOMEhRcHUy?=
 =?utf-8?B?MXFwd1RCNmQ4cWFKL1lIS2hyZjdkZVkrY2pOUld4MXhtSXpsMXN3cjZVNXdP?=
 =?utf-8?B?RzNOKytHWGE5eGtpQjBkamhzR2FUZ0YwMFBxNFNSRTZWRnh1NEZrWHJWYVVs?=
 =?utf-8?B?c0ppV0JoSVp4a085M01kYlFqdHpoNER1UVNLbVRaVURzQ2pCRnN6Q2d3bHBa?=
 =?utf-8?B?OGc5NGRWNjdRdlRCUnp3YWNRRlpMMlpnNWxCWDlyNlNkMlg2U2NzOUtHclpy?=
 =?utf-8?B?NUJoUnIvbTh4dVMyQUt0eHNnTDd1dCtVODZ1Vndaa2d4U25NTXpCbkpTOVNB?=
 =?utf-8?B?SWo2THZITEsxYnJVamE0UmhxL2ZsTDloUldUem9iWGVXVW52UkJ2dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dd79d202-4eae-43ab-a6cc-08df0f2fc674
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:36:37.8287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLA1HolnKp5NzzGnGugsoe8hH6hkD2gLrr3pKgU7iAQ29QKGNyULoa2xXjEEl8nrJpVTQ65LH3SW4LcmUok1tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7931

On Thu Sep 10, 2026 at 3:21 AM BST, Alistair Popple wrote:
> On 2026-09-10 at 00:25 +1000, Gary Guo <gary@garyguo.net> wrote...
>> On Wed Sep 9, 2026 at 7:06 AM BST, Alistair Popple wrote:
>> > Symbols from the `bindings` crate and the C helpers are exported so
>> > that loadable modules can link against code the compiler chose not to
>> > instantiate in the module itself. The `uapi` crate has the same proble=
m
>> > but nothing from it is exported.
>> >
>> > In practice this goes unnoticed because the only functions in `uapi`
>> > are the trivial `Default` implementations generated by `bindgen`,
>> > which rustc inlines across crates. With CONFIG_RUST_DEBUG_ASSERTIONS=
=3Dy
>> > however, the `Default` implementation for structs can grow past the
>> > automatic cross-crate inlining threshold. The module then references t=
he
>> > copy in `uapi.o`, which is not exported, and the build fails:
>> >
>> >   ERROR: modpost: drivers/gpu/nova-drm.ko: symbol '_RNvXsH_Csk9v2ZIpWb=
Wt_4uapiNtB5_17drm_nova_info_gpuNtNtCsfr3MPOfBGpN_4core7default7Default7def=
ault' undefined!
>>=20
>> Hmm, uapi' ideally should just be type exports and produce no code.
>>=20
>> Default implementation should carry `#[inline]` annotation so they're
>> only codegenned in actual user crate. Rust's `#[derive(Default)]` would =
always
>> add that. Can you check if that's bindgen-produced manual Default impl t=
hat
>> somehow misses the attribute?
>
> Right, bindgen-produced Default impl do not have that attribute. For exam=
ple
> here is the bindgen generated implementation I see:

Perhaps you can open an issue upstream?=20

>
> impl Default for drm_nova_info_gpu {
>     fn default() -> Self {
>         let mut s =3D ::core::mem::MaybeUninit::<Self>::uninit();
>         unsafe {
>             ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
>             s.assume_init()
>         }
>     }
> }
>
> Manually adding #[inline] fixes the problem of course. I guess we could a=
dd some
> sed Makefile hackery to manually add it. For example something like the b=
elow,
> not sure if that would be preferred?

Yeah, textual hacks are a bit too fragile (especially that it'll break when
upstream bindgen adds these annotations). So if you need these impls, I thi=
nk
exporting these symbols are fine.

That said, you can achieve what you need with `drm_nova_info_gpu::zeroed()`
instead?

Best,
Gary

>
> ---
>
> diff --cc rust/Makefile
> index da1a7409d984,da1a7409d984..535a3bf181bb
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@@ -525,13 -525,13 +525,16 @@@ quiet_cmd_bindgen =3D BINDGEN $
>   $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags =3D=
 \
>       $(shell grep -Ev '^#|^$$' $(src)/bindgen_parameters)
>   $(obj)/bindings/bindings_generated.rs: private bindgen_target_extra =3D=
 ; \
> --    sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const \1=
/g' $@
> ++    sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const \1=
/g; \
> ++        s/^([[:space:]]*)fn default\(\) -> Self \{/\1#[inline]\n\1fn de=
fault() -> Self {/' $@
>   $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_helper.=
h \
>       $(src)/bindgen_parameters FORCE
>         $(call if_changed_dep,bindgen)
>  =20
>   $(obj)/uapi/uapi_generated.rs: private bindgen_target_flags =3D \
>       $(shell grep -Ev '^#|^$$' $(src)/bindgen_parameters)
> ++$(obj)/uapi/uapi_generated.rs: private bindgen_target_extra =3D ; \
> ++    sed -Ei 's/^([[:space:]]*)fn default\(\) -> Self \{/\1#[inline]\n\1=
fn default() -> Self {/' $@
>   $(obj)/uapi/uapi_generated.rs: $(src)/uapi/uapi_helper.h \
>       $(src)/bindgen_parameters FORCE
>         $(call if_changed_dep,bindgen)
>

