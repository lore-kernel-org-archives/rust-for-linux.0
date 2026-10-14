Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020089.outbound.protection.outlook.com [52.101.196.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87BE4B512D;
	Wed, 14 Oct 2026 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987938; cv=fail; b=YDDg6Y9OvxX8c1Jgc56omucfCYkvE0hgCRU6cgcOVStH2KDhy4oCRQEiSHEbIJBuQ1PUaBhkoG8lNf9aZ3MBIYoduzl6JDvg+VG+hvsyFLTl1+RcVM10uqOM7Fug3Qf3oGsGD0JTEAM1GiS0J8c2agKUVwv8CnbFp/tOTGV0sss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987938; c=relaxed/simple;
	bh=C4k8tF9qF1wtjstnhQkMnVDxvFr4qN7SjCZU+WujH/4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FsYrqK/1pR3QUtQRanyfq0BK6i+Y3IMXDvlmBbWZim5JfxCydXN7ttoh7YAmze3WiWh2g8khyXXANX2NLnwtUo5muk5famVqE0FvsDtmmvBWZW/29mOdc5hn9AvfjEHKXzUxt/SYDOlDDv0edk4p3xwpHhVtN2fA5mPqm6JQcAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=RF/Nxk44; arc=fail smtp.client-ip=52.101.196.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="RF/Nxk44"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1TY4582aMEo0awvX6Dm9BZlti4Oi5Nx+2dKWc7k7MGs4fFmqWa+/uV4wJBdCA/kfkvtB8a66YSgSYfXHZf4lhBM8sW1xnUtcXdkEMWeZu2VX/CLaUyExmEUQgFaaaIG9onLT/EeAHrHcx6NUI1NEThjktkUoSVDXQWBt00+6+wPTQKHT4eUqh8hD7dppsNC/jqY8UYy1isBA024tg/J55bNwaO3ezGPLgzEoNknR8kMdjXzlx/nvi9Jmnpwd6zMHNYfDwFLrDV2XlA+fMFPTP9JQsgRpPKCUGyx7dQeaq9/BN923PTvcmYyl5oLiLEQjt01+thL1CzutJpwXy6XXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9zxCWwyUSXsUxPiS1CkCJVN7lgAIfqTrLTIzMmnqYE=;
 b=oh59wPOaqfVlylW0SabwrH/x1B0nkmJjpqrFhN4Ls6KmGRz8iNpgqVzrnmrfbaR5gnUD43801gHgA2StZ4CBp/0izvotlZUheZlAZB3IcnGNF3eYMK9xTbECxDUHhbHxmPUUn4T8oSh/t+6PB1EqZsp+G/q7yWasCxl/kdw4oqQkprLhxZkhlw90N4ByGshjiTSOXI59OQML8R9rie4ztetRlS5yWXD+yifIVIE0Xam7K6fCBz6W2UYNtK0YBNhHZbng/Uv7jORIYPWRcSVpMrcvypO2s3Kv9CQ6lGkS9ARK4SuhC7jZUi77O8jjdN7Hwu3gU3oZvg8qoOK8kZTKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9zxCWwyUSXsUxPiS1CkCJVN7lgAIfqTrLTIzMmnqYE=;
 b=RF/Nxk44m1Rfb3JOQRF6QplsocZfHA60Vv2ls27ZQelAAZAQDjLxWRI5AMKDbPkV1jPf+za5onLHyKTYFpIwg7u4q4B7fWD+q/RfeLdN6q1NfEL+sPP3ftUuyA0Nx56l7Rz/SpnMnGgCOpK00pIpNvYkRP/jiomEmIk2INtU07U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB637404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:601::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:25:32 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 14:25:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 15:25:31 +0100
Message-Id: <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 1/2] rust: non_empty: add NonEmpty
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Lorenzo Delgado"
 <lnsdev@proton.me>
X-Mailer: aerc 0.22.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
 <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
In-Reply-To: <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0490.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB637404:EE_
X-MS-Office365-Filtering-Correlation-Id: a2fff322-c1d8-4dc2-e8dc-08df29ff011f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|6133799003|10067099003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5xQJcfnKI3ZoTPdzfl6OmopnAuK6Ci9y2Wl2g5XlQQYwatNSPcqUbR5V23kTM70iHvX53d+DzmZ6b6i+1lQX5fLLnSilN4MIsQJ5ShHasCKFFaBz9kqdj57sypriD8JVVZF8Mj3AwfiR1z9IMcAPEdW2OSLshG3iMzsmDGtqCq6rf/1Z+C2h9YKQy92M/DuAsIN0wacRM1wQBJRKCMDWzoOtntoaq9wJRA/inIgGBMnN8BRxiuVeUtF2DDMveYgQq5vTa9DU2UAHnje4akybE9Wi73GDJe8rHXaFKFZ9A1Y0u/BZPnai7lWRZANHmdC0NqjR4aXkXIs+Ujt7kd7y9xRyhgZFOkowYwGtfhCJLD58o+T1s9TAlVzKBsoeB+IUXMTKmwSgOdCoZAH9Mk42gyWd1/H8l+bSg+cuPhAVmyzeJg/qDtgizYQDdOxxdaps8LuLuDrkskXOqbjZnQIs6502ds8leEpbhQNXJIRROX1XKk7KLVYrR1RehN0SiAJL+vZIHrb5w7dN79udV3dsKJfy7IWn2VgCWvLcJwExZSFBjcTGcY0irRnijJKsDbWutzQ4AtGG88bK4+kJLyQ6r0PBDZiFzF8aNK77A2WQ+6RUUQrgJYY7+BZ4RPCvl41GlHalnIjxPr9LvfKCyFFu3GB1PToJ+gq1yx5cuqwYqMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGhVWDI4VnAzQ1lKWHQ1RjRjV1FZbXVBNDRVOTU2U0FqVVN0Sm1vUTdqTHhk?=
 =?utf-8?B?ZndCa2tGeTVoOFJnS3U5Qy9TRDU4N1IzQTN0MnRxSmF3MDN6a0dhd2N1NnIy?=
 =?utf-8?B?bjFoWWFwWjlzRk9UNFlSVk5rWDNtSnRzYWVaeHBoZ1lISUFwVUIvdVBUTmhE?=
 =?utf-8?B?L0tFMTZpeWNUNitCaHpQaWFMdWNvUW1zODRkbnE4RXczeXViQVovK3M3Zjlq?=
 =?utf-8?B?TEtleUlnS3JVNVpiM1RtTlpMYzY0OWZYVWlHS1FBT3JYU014dG9XN0Z6RnZl?=
 =?utf-8?B?bDczVmF0QnJFVWg5eG55bTFyTGlMUTI3N2RBUjNBWnV5YWx2RmJiQUlYcnA4?=
 =?utf-8?B?dU1vYVBLR0M2LzFYd0t4SW0raFFrcm44UlNjWjVMeFc3b2F5VzkxMy95S0ls?=
 =?utf-8?B?TWlsUm0xd1B3RmdvNXhLTzcxQVNwUUVkV2FiYmVxUFRuTUVsVDh2VGx2YmJV?=
 =?utf-8?B?Y3RZdE1MQm5uQTJaeGQrWEI2MVdGSFpYQ1JCUEdZZHU1aFA3cEFsenVBem9G?=
 =?utf-8?B?Ti9xaGtkYzVTMyt2QkwxTWxjZ3NGai9BZUJ5aU1zVDJpVFNYUmZVTW9GZmUr?=
 =?utf-8?B?bzRleVFNbGFhTnVOYkhKaVhlMWwrMGF0Lzh3V1p2ZFErdVhpd0xEVWZIMVBz?=
 =?utf-8?B?L21vdFp4TTVGcnBpbTBrSUJjU21iaTVkVXVLdzZBUDMxazlYRktqdGNvSERJ?=
 =?utf-8?B?RWd3WVErQ0FsVmxPbGVxYjY4NDJSeGdiOVhaci9JUW93QTNQbDRNbDJmaFoz?=
 =?utf-8?B?aW1vd3BmY1dKbmNtUTZldy9OcDBieGZRb1ZqekJxRUdWbUM5bjBIeFBiWGx5?=
 =?utf-8?B?ZnovSFpsZDZaZ0tqeFJJSHl5WjNXb1BXcTMyREh0ZGFXaFJlVzBpeWErOW9Y?=
 =?utf-8?B?K3ozd056aVhsa3duTk5HZ1ltK1EzUkhMeFRhTzI3U3A2UzZxblpvZXY1bGkv?=
 =?utf-8?B?aVV6ZktkclZDVlorcVdXcXVxNzdIeC9ucWhNaWJUaHdmTkttN0J4Y0pzL1BJ?=
 =?utf-8?B?ZkFydWdpb2RUNHdGaC8vYTJ2VDVtSmxPbUxocHlvNlRqWHc0RkZlWWt3bWhK?=
 =?utf-8?B?WTI0OVhHMExXOG5XRWU1WnpORUl2VE5IemVQOGxtbG54TnlrZk8zbDkrQXdI?=
 =?utf-8?B?WklKa0RtbzZ6Qmw5a0RqQTRMRDlzV1ltS1BKTnlOTGxrcTdPbURGVHJQc3ZO?=
 =?utf-8?B?Wm1PNGRKMXAwSGFwNy96TDdTTHJGalYxUkZkSDBkbjQvcEw1bVk1ZUI5V2Zh?=
 =?utf-8?B?NkFMWExOSkwwSkpFM3lsNDFZeTZGYXBOOVhNTzBEQmlXekQrSnZnaUFXQWlE?=
 =?utf-8?B?R0REUDBlelljeGZEck5jaW8ySVRFaTRFNTNxanQzN1c2SG8wOU53TFRWTnpa?=
 =?utf-8?B?R0c2ZzFpdC91MHBuYWRhMHNtREgyaDViOHBvU0w0QXY3QTJXbmdaNFdTSzl6?=
 =?utf-8?B?NjA1VGsrbXlTcVRYVzVrZ0ZsN0lzTFlyNUJOTy9jdTNBcGpUdnBoUytZRTBn?=
 =?utf-8?B?b2hHT1VCN2RPSmMxTVdzaGxLWDhxTVVqOXkzaTNwOGdMVHlRVVFFV3BFTHB1?=
 =?utf-8?B?UnE1RUlybDFPM0dJV3FLeC9rdkYxS2g4MkJkNytXQ0pEaWdaQjhkclJGL2dj?=
 =?utf-8?B?R3EyUUpWL1FhS0dIWVVWckkrRXM1VGdBUWpHRXhSTEZpSHpSM1NOSm9qQ2py?=
 =?utf-8?B?alNhSFUweHJHOXZpcDc3ZE1MSmNvajhMZ0VQYzByZzgzYm03NkFYZFRDcUVm?=
 =?utf-8?B?WFRYNFBTZ042OEs4WmJTRThIdUlrYkd0aVA0cjIxcVM2SjRXVi9kbHVLWHRZ?=
 =?utf-8?B?Nm5LMExPNWU3OGtUa2tqUGRkU2Y5U2RoQ2llYXM2ODBFelBQTE1kRkRtWnZx?=
 =?utf-8?B?WFEwUjQzRFJUNWtYcjhhZ2Y3TkxEZXA5cktJUTVTQ3Nwc3ErcTVCUHB2ci90?=
 =?utf-8?B?SXk5T1JBdnpYd0w4dGNxNnlKM2Q5NkszZlhMT2RwaFFrc1FjcEFuRGhsS05B?=
 =?utf-8?B?OU1Ec2JTRzZ0d0lmaUsyN0E3L0VSalZXNDllcXQwSmNRb21FN1kzSkZWY3Fa?=
 =?utf-8?B?eEFsdXZBaUJOV1hacmpzRGg4dXQ5Z09Jd2FoR2x0STBiNGJTZnBKejljbkhI?=
 =?utf-8?B?ZWV6cFI4blg3QkN2Y2d2dTMxbVRhR1JPNjhZM3RDa0tPc3YxZVIrejlwanU4?=
 =?utf-8?B?dWZGMEhKWEFmeDdkUGlsbWVxelU3SEJjTG5VaVVuSHE3dmtlSHlNM3J5K05W?=
 =?utf-8?B?eVA5ZVlWMTJwMlNESU9VckV2WCtaSGN1MmdqYkd5dGZjWFNiL2dTWjhyUms2?=
 =?utf-8?Q?zzZxkIkWgmA/s0tQ2V?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fff322-c1d8-4dc2-e8dc-08df29ff011f
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:25:32.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esZxAlAFiuPmjldygCV1Ep+3zon0ZZku0r+8FWUacQmn1cItMU/PY9mXS8nMFbjRo2yNs9luS4tX7okdZ6LM9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB637404

On Wed Oct 14, 2026 at 12:55 PM BST, Miguel Ojeda wrote:
> On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Lorenzo Delgado <lnsdev@proton.m=
e> wrote:
>>
>> +/// A container that can report whether it holds any element.
>> +///
>> +/// The result must not change while the container is only reachable th=
rough a shared reference.
>> +///
>> +/// Unsafe code may only rely on the result for a container type whose =
implementation it trusts,
>> +/// such as the ones in this module, since a safe implementation can re=
turn anything.
>> +pub trait IsEmpty {
>> +    /// Returns `true` if the container holds no element.
>> +    fn is_empty(&self) -> bool;
>> +}
>
> Do we need this to be a safe trait? If it is unsafe, then we can
> simplify the invariant and more easily think about the type, like
> other `Non*`s, no?

I think in this case the meaning of "empty" depends on the container itself=
.
Unsafe code that relies on "is_empty" would be the `NonEmpty<Container>` it=
self,
so it just needs to trust itself (as boundary of unsafe is module level).

I think of almost all of the text above can be removed. The invariant of
`NonEmpty` can just be "`IsEmpty::is_empty` has returned true" and how it i=
s
interpreted is up to the container type.

Best,
Gary

