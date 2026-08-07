Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020090.outbound.protection.outlook.com [52.101.196.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28B941D233;
	Fri,  7 Aug 2026 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113804; cv=fail; b=Gmk4L+H2gwVnQUPnZ/11cfOH0s9HLQ+Zos5ZV9d1uvqXHP9kmLSmPGg8LxrrBZvxDisaCBo9Bfm5paQrZfHf4ue3ILgSkGkv3pFYDrLOZB06A0GIpVewBa82LLj74v5pOPNeeX3odl4MhYgJSlec7+C6ivHrzlCQDvdQP7XSa6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113804; c=relaxed/simple;
	bh=0CdSxNOaeCJuqyG8ru5dgt5L7APlHfMLqFowW8BwD0o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bjLdjZWYnTNMpJe7xHbstVm7lA91a3aEsGgXHCtapSHVp4SDLOXCtMvUqb8GCWGVA5CuPcV8/mhhh/+LSlWgKMdik3aWE0ZxOmkqQq8tqCTpTLbPOkdP1n9HNbfvRgcP37eHkUWSg4axnxbZfZBYtemV86sFAUZPTbi1BHo+XQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FzCn6rWK; arc=fail smtp.client-ip=52.101.196.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FzCn6rWK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBCjgB5Sw5gga6Vxhp6dsfmhCV0U2aEaMofE6DTodI1vTfbJHoWwtpGOpJ+WtAAxFVzqD0gz2DDHyRgw+Rdwvavsja4PNycvZe8qpsjwG0H83R+gKQCuo9DC/Nnt+Af+lucWB5Gi93rJgda+VrFAasVwAhWrJL0o5ICJjB3QO33KLIsHpZfP0g7jlemTKVwaAXLYwNqnzDz8P6YIMpaXPsjqHxIpYmtm5KtfW/N2H3efvbEKvDaNbplzfx++IJzPFDo5z/Zb+ibzigia3HdzRwwWJJgjArA5r5A+GmQ5UE/y8yN1ux6E0rPfi1ljY+vSap+1OyHnAqEaY8uwWpTL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMd8GXVkLeceh6bUhYTwEwV92jL01sgm7X90AQbxONE=;
 b=cf4gPXkEtNUgoZOxnGjVdSG48sapI/Gsb+kw38KPWzh50phtvPcyrIFr0Unj1kAXNRVsTsuGmSUc+4ZWIXYen75oXGoGW3utcLukLEY9VHTU6x6IHir6/sBwpnl/+ZXweMd0r1/MSUEbe5FPb8nIwUu3BVq6jPTsXGW1j87rEQL2Fm6nRkTzXdh9LezvFZAcjWhe2ZIT322MkToR0MSQ4FM5G1GqkwckIKFV3EanLyMY8kOEjv6Vao11t+UMugIsJZQMeU4aKDgvnfPmLmyzJBiak1JgOVGeQDaGjE6sgmcpZ38MShfY7H8erCho0Rc4Iyd5tb8oyHBdBaXeQQPw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMd8GXVkLeceh6bUhYTwEwV92jL01sgm7X90AQbxONE=;
 b=FzCn6rWKAWRQW2z90XQk+dgStihQMqv2YmuQbtkzKNdwVZqghQnBgLhKx+3DeFwY5N5G9EHkB1Jcw1zCN3wTvFj77n5+BGgH4IPGjCN0uAn9IQLAMvb0lx222ppM4q72QCh/8FtfRr1c3BH/IZ/dGCSXvGQ45Fqdo/AgMD9CfiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB5081.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:196::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 14:43:08 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 14:43:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 15:43:08 +0100
Message-Id: <DKISHUP2OL6U.1NEMCW4S0Z9FR@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: miscdevice: add registration data to MiscDevice
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260807-miscdevice-data-v1-1-43c4233e0b03@google.com>
In-Reply-To: <20260807-miscdevice-data-v1-1-43c4233e0b03@google.com>
X-ClientProxiedBy: LO4P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::14) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dba403b-5929-4fe5-3e05-08def49232b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|23010399003|5023799004|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p/z/2rH1shT4YhJnxCV8HV9/UBzK6Tj4EnTs0gqZD4rguNGn6emCHS8Vvib4kcxPCbBbeE5qAA6hbhQfHRWj5t/r4d39C6j6RA2Oj9j0ARFf8i/LH8kwFAy6Q3VCtUMRwQN0YAlXoMXEMGJT61CJpbRxhiSEyiLlCLhjft/VtxEUFbrEXA08mE0ZRci7mKFHJ6WV5wuBh6iM65rmu/obcGkXC3mV0r4ZQuKcgq7N6Ahjs4dDWzznhznirTJYXBHJp+IOEhQeHIsM3eQDKzO5Y+HXySBLP/ga58WndGllTfVEbk8KuDnUQRLrVc12oLWhnI3r7XE/8M4zyrJl7vpxZmrhd7QP7rPX3uESkzvRniAIvMzfq0glte1FJEay19DiKHsB/jxzgtHhxbkz1zrV/Ledpp3HXhwHFy9i0GNmIPn1/bXPktueiVJGz1a0FecRwvY2RtskUAC92/bkxLXu5K30Du3H5AXnC8z57OAypLQD4+lOCVXcMh9wEdpVr7ytdPFMnmjjoFwCJamglM3S1RdWgdOhUqBNLJbhEeWCvShLNa+rzlPsisTGvgprMIttii0btOK7+RhFPal+4TciW7LMlsXQ0sAIxRNULWoQ3NdLmAEspXTTHSGDCjJflP0Va021j94Lp7elaQYv0XVdp3lz5+I3JEAut1XRd2LCWZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(23010399003)(5023799004)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlNmcXlZTWxNSzJxMnJsRkxrNTVYUkNGTnVFTzNEbVVRVklxanRydzdvSlJh?=
 =?utf-8?B?MCtBUFhvL2kray9XVzN1bElYMEFzNXlTbzZjRzIvRFYwVXpxNk1TQzBMaWlY?=
 =?utf-8?B?UUNYZm9tS0trcTdKM21YOGx2NUQyYTVIM3I0V044VWhPRm5nTEpQenZvQ2FG?=
 =?utf-8?B?T2V6NlF0QUVUc0poOFBpRXBLREQ3VFlBOG4ra3BDeGRuaFlKdEFqUHgrRWdX?=
 =?utf-8?B?V1h3QjA3blU5UzgxVVVjQlZzQ0svc2JVZmdtaXJ5YnpqcEhKS1V0TmFoQkZk?=
 =?utf-8?B?ME1Vdy9YUjM0cHFoRW9oQlRyQ1dPVGpKdXFyZnV6emtOWlo2dWR3cVpTQU1P?=
 =?utf-8?B?WXIzaUh5b3ExQnhHazFjWGhkckxUK2QyK1Y1U2R3dzlzVVdVVDZqSllhcFZn?=
 =?utf-8?B?U3phNkZNdUtUZTFOMURhOU1qcmhWb241NkVRQWtibkFFZDQxZExlbXF4dSs5?=
 =?utf-8?B?MVRtZW1rUmdwYmE0U0U1eDZsdVNxeXR0NnhzNXhNRkM5bHNQNFp1VldGSE9a?=
 =?utf-8?B?OVVHQjdHeVJybGdmdUI5RTZRYldpQ0ZNbWpVR3krQ2d1dWlqUDFuNy9kZnpS?=
 =?utf-8?B?UGhPZ0p5d25GbEN4UWR5cHNKZzgyS0Y1TXVzdnZseW5VbzE1a0pTcG5rN1h5?=
 =?utf-8?B?NVhTZ2ZNdi9XaWVsd3l6NGtSd1JEK0x3TmlvNlBNL1EvaEh6T09VWGNXUzht?=
 =?utf-8?B?ZXNxaEE0cG1NUnhvdHZ6alJGRXA1OFFEckZaQTkwR0RBVlAvbFo5T1AwbWh2?=
 =?utf-8?B?MldZNHBYVFcwaVpNcVJCbi9XUlpiQlAyWm5vMFdYMHd2WGl2TnJ5NXBoTlNr?=
 =?utf-8?B?c3cvU0VXK0NjMi85VzhzWDhpNklJUVNOSFB5WlBYclJOeXFpeU0wZUpWR2Fw?=
 =?utf-8?B?TGExOUVwUHc1SWMzNE9jbXB3Zm1aWHFHNE1vNm1XWjFETDlLN1h3eThpSTFk?=
 =?utf-8?B?OE1SajVoSXBvOUxvVDBFRGRpWjY4ZEtCV0pIT0lVSmlkUktSa0VPb0NoaEtj?=
 =?utf-8?B?Nlp1a0crVldpK0tBUTNIODRab1FZR1FrakRRaVM4OUhNc2MzaWZpSXpGUDI2?=
 =?utf-8?B?QllKNHFKalhJeEJwdUZpQmxQZzByK2E0b1VVWFB4LytoMzBtWmhIU3M1ZnJw?=
 =?utf-8?B?ZWxGKytYTFlUdm50STMzWVBHM1NOVzhqVWI2RUs3ejQ2NTZBZUhveHkwY0x2?=
 =?utf-8?B?NzR2QS9pQW1vR2l3NWt5SWdnUDhPSlFMRU8vYmRuSlNmQUJ6L2dlT1VPY1Ur?=
 =?utf-8?B?ZHladE5NeFZmMllpWnNvdkViaG5ITUhOTFYxZDd1bEV5WmpGcE5samxLSFRJ?=
 =?utf-8?B?RlFoOW85d05UNS9yd2l1bWRXc3B0VXd4ZHluWWNWM1lNOG9JWFFRTTBvSG5R?=
 =?utf-8?B?enNvd0JFelN1cXVYTDFIZHVHaWZ1ZG56RWtwRER1MUYyMDNXb3RsU0lhZHQy?=
 =?utf-8?B?TTB0RHR3Q2RtN2R4VkNCd2ViaFVnSENqZlJTUzZQeHdyN0R5bzQ3QWtJYTJM?=
 =?utf-8?B?Y3AwZ3kzeG9tWGh4N3h4UGtvSEZqNGFNWTFkZHVQN3Q4MWNmbHVvb1pDZFlD?=
 =?utf-8?B?NlQ5cXFXNmFEYThxQ2JIMU5Gdm45T1ZSODNrS2tCbnRmbFlncVBkZllaR2xm?=
 =?utf-8?B?RHV2Nms0KzI3ZWE0NFRIM2RCRHV5SlFHZ0MxRHlVK1l0cTlqSDE2NE1iYVpQ?=
 =?utf-8?B?VTlha3ZYdnduZHdwWnVvVkxVKzhLNllTckYrLzBTN0daYXVlaEU1c2dRZitN?=
 =?utf-8?B?WnZWMWpLcTVuVS9wL3MzT2gvei9IMDNYd0hDOUV2UGhac3A2MjJwdjdPQXhC?=
 =?utf-8?B?YTZRbkxFYjA2YVhYaXh0VnBaMnhjbGpMR0VJV25ZL1hqT2tVVXJaZGpoVWVk?=
 =?utf-8?B?VGowY1FkcmRyNTNTWmNINS91dkQzVmxRNi9nSkdUdCs5c3dPdVNOTXVHdTd2?=
 =?utf-8?B?a2FpWXF0U2ZNVUNRR0l6ZVdRR25HL2tZZDd1UVpCT0I4NHFxNHd6R01WSHov?=
 =?utf-8?B?ckh3anlkOHgzY2o2bDFlcm0rT0prZGpVMGcvVEpkbGFrZU5YYVhSU0w2UFlV?=
 =?utf-8?B?VmlVTm1aaS8xYnRNeUtLaXpHOFFLRlpLbjhLWHh3cUszRUNUb0RpWk1QdlRq?=
 =?utf-8?B?blBkRmRhbEJ4Ulh1U1VYVFdOY3Y5Qy9jbEtkdkx0SXdsdFpLYkxVVlRDQmtE?=
 =?utf-8?B?SEMyZnlaU29YSFJLN08remJaRUFOZU1MNHdDMjJnMDlQNTFMQk1GSWxFL1oz?=
 =?utf-8?B?ZkNBWVVDa1I0eXJxTVpJZTBjanVCeGo3WHVOUTc4V3VOUXQ3NGxsYmpSS0VZ?=
 =?utf-8?B?TldlNlVkYzgxaWNSV0JqT3VvRkFqUU9yc3lQZmFFS3o0R3dPYnZkQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dba403b-5929-4fe5-3e05-08def49232b8
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 14:43:08.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04dX8QG5/sx5qoevI0DhrAh0cUGbCKQttvbvcFJT9kgInOIc7kR5ZfszBpT5skBN64XpUZrT111ZccCbZzzwgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5081

On Fri Aug 7, 2026 at 3:22 PM BST, Alice Ryhl wrote:
> Currently when fds for a miscdevice are opened, the only "global" data
> they are given access to is the MiscDeviceRegistration value. However,
> this value doesn't let you store any user-provided data, so there is no
> way for different fds from the same miscdevice to interact with each
> other. Thus, let the user specify a type to be stored in the
> MiscDeviceRegistration in which the user can store whichever data they
> would like.
>
> The intended user of this patch is Rust course material. Miscdevice is a
> nice and relatively easy to use API for someone's first driver, and
> being able to persist data from fd to fd allows the student to interact
> with their driver using 'cat' and 'echo', even though each call opens a
> new fd.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/miscdevice.rs        | 42 ++++++++++++++++++++++++++++++----=
------
>  samples/rust/rust_misc_device.rs |  3 ++-
>  2 files changed, 34 insertions(+), 11 deletions(-)
>
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 3abef1b8543d..c4910918cd15 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -31,7 +31,10 @@
>          Opaque, //
>      },
>  };
> -use core::marker::PhantomData;
> +use core::{
> +    marker::PhantomData,
> +    ops::Deref, //
> +};
> =20
>  /// Options for creating a misc device.
>  #[derive(Copy, Clone)]
> @@ -62,25 +65,30 @@ pub const fn into_raw<T: MiscDevice>(self) -> binding=
s::miscdevice {
>  /// - Deregistration occurs exactly once in [`Drop`] via `misc_deregiste=
r()`.
>  /// - `inner` wraps a valid, pinned `miscdevice` created using
>  ///   [`MiscDeviceOptions::into_raw`].
> -#[repr(transparent)]
> +#[repr(C)]
>  #[pin_data(PinnedDrop)]
> -pub struct MiscDeviceRegistration<T> {
> +pub struct MiscDeviceRegistration<T: MiscDevice> {
>      #[pin]
>      inner: Opaque<bindings::miscdevice>,
> -    _t: PhantomData<T>,
> +    #[pin]
> +    data: T::RegistrationData,
>  }
> =20
>  // SAFETY: It is allowed to call `misc_deregister` on a different thread=
 from where you called
>  // `misc_register`.
> -unsafe impl<T> Send for MiscDeviceRegistration<T> {}
> +unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::R=
egistrationData: Send {}
>  // SAFETY: All `&self` methods on this type are written to ensure that i=
t is safe to call them in
> -// parallel.
> -unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
> +// parallel. The `RegistrationData` type is always `Sync`.
> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
> =20
>  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>      /// Register a misc device.
> -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error=
> {
> +    pub fn register(
> +        opts: MiscDeviceOptions,
> +        data: impl PinInit<T::RegistrationData, Error>,

We can just skip the `RegistrationData` and use `T`?

Best,
Gary


> +    ) -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
> +            data <- data,
>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::mis=
cdevice| {
>                  // SAFETY: The initializer can write to the provided `sl=
ot`.
>                  unsafe { slot.write(opts.into_raw::<T>()) };
> @@ -88,11 +96,14 @@ pub fn register(opts: MiscDeviceOptions) -> impl PinI=
nit<Self, Error> {
>                  // SAFETY: We just wrote the misc device options to the =
slot. The miscdevice will
>                  // get unregistered before `slot` is deallocated because=
 the memory is pinned and
>                  // the destructor of this type deallocates the memory.
> +                //
> +                // The `data` field is `Sync + 'static`, so it's okay fo=
r the `open` callback to
> +                // access it until the destructor is invoked.
> +                //
>                  // INVARIANT: If this returns `Ok(())`, then the `slot` =
will contain a registered
>                  // misc device.
>                  to_result(unsafe { bindings::misc_register(slot) })
>              }),
> -            _t: PhantomData,
>          })
>      }
> =20
> @@ -112,8 +123,16 @@ pub fn device(&self) -> &Device {
>      }
>  }
> =20
> +impl<T: MiscDevice> Deref for MiscDeviceRegistration<T> {
> +    type Target =3D T::RegistrationData;
> +    #[inline]
> +    fn deref(&self) -> &T::RegistrationData {
> +        &self.data
> +    }
> +}
> +
>  #[pinned_drop]
> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>      fn drop(self: Pin<&mut Self>) {
>          // SAFETY: We know that the device is registered by the type inv=
ariants.
>          unsafe { bindings::misc_deregister(self.inner.get()) };
> @@ -126,6 +145,9 @@ pub trait MiscDevice: Sized {
>      /// What kind of pointer should `Self` be wrapped in.
>      type Ptr: ForeignOwnable + Send + Sync;
> =20
> +    /// The registration data shared between all open files for this cha=
racter device.
> +    type RegistrationData: Sync + 'static;
> +
>      /// Called when the misc device is opened.
>      ///
>      /// The returned pointer will be stored as the private data for the =
file.
> diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_de=
vice.rs
> index 41e26c825060..0bde071743ef 100644
> --- a/samples/rust/rust_misc_device.rs
> +++ b/samples/rust/rust_misc_device.rs
> @@ -156,7 +156,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit=
<Self, Error> {
>          };
> =20
>          try_pin_init!(Self {
> -            _miscdev <- MiscDeviceRegistration::register(options),
> +            _miscdev <- MiscDeviceRegistration::register(options, Ok(())=
),
>          })
>      }
>  }
> @@ -176,6 +176,7 @@ struct RustMiscDevice {
>  #[vtable]
>  impl MiscDevice for RustMiscDevice {
>      type Ptr =3D Pin<KBox<Self>>;
> +    type RegistrationData =3D ();
> =20
>      fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result=
<Pin<KBox<Self>>> {
>          let dev =3D ARef::from(misc.device());
>
> ---
> base-commit: 220190f97da558e67cd01c62f1b84fe77b267a5a
> change-id: 20260807-miscdevice-data-71c727e8b2e5
>
> Best regards,


