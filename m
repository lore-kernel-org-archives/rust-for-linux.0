Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022123.outbound.protection.outlook.com [52.101.96.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5039C65B;
	Thu,  5 Mar 2026 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713724; cv=fail; b=VcFwaeDh6RN3xsbytpoNRxVDEJFLoGOlnHbESjReY7V4qfHQIjXzHAA0vyvF9BV5UhjepTwtourDHGyQfgVELBK3LDonJgAqdfrglX3iSZnURPj5r5hZ+MPwDpN2SUuAkHwZQ65vfgfq3q8gn2PP++C5c2yxnN77XvpkEBoP4Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713724; c=relaxed/simple;
	bh=y6ZDxImvISr5yJucOL686BGFG68pTLo9ji8jYcUBtNs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=OOyElLqxtwTRfPEfbmRPBMtgMCUzj3C1OHbRBfV1zIQ8ayNa3v7IPWcbdzBy0Zpf/lOohe8Cde0oHzrbN/wOxO6DYz3KIYrWWRQFAPF8CF8QVYg7tG08o/eB4jI1HWjH8Jx9ZE5fSiGeJ40NE8xCsTOQgP3fP5XMnj55VCEyD4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xQEFfnrB; arc=fail smtp.client-ip=52.101.96.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xQEFfnrB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOOI+QCIKfjwLcu3LMFMu53E+JVBoKiUkWYtgSKaBLQHcgyrdFrXycyaNkxOvG/RvIPPhHbeXawpLM5hRE6IsEwOAuWzkVKsI2yoZ24csR72jFL7pvn/Tuh0P5I3g9k5udLsarcq4w0wblEh0KmGIlGAb/03e2hoj/n8qzVMqWgCxRfYvENG1O9e29r3Pu67NDsBs+zn2MA7rIJ90kghNtS1zFrsEPrhNdR3keKnW5RSMOiduFgg59owAdhxAEFTM4V8BnKqyC/sQwvCsdcspa8EA0lJOU62TtGfqU8Tm2QBRPPYxTmmjOhRPoh12tLOY0w3dcR8Xm+0l3nUQRYdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaT2Q5qOOtkTi4nLEVAfgpVdpCwQVkNht4mUzsnI/tc=;
 b=DEjm+ZmG3hyzVZG03t/8cRpfZXsAT+sSjHn3i/c1GwFf1zs+0oq6VuTS8RFSDovZEGLuasA0zpJ//XcpF0FPaGwzp8d+4rL156PcJSKg6eD1aJHoEIo6sJ2MVY5Pbm82zZSs4NvqLFcpsH9kxdubUNmgbGb8LW3K+mKbN5eWPxrWX0UsqZSATkD7NNtW1l7QCnSieP5fVyH/SrgtbCXvnArUX50OiOW2vlvp9S29ZjLAg9aZQ6SbpgTEFq5xvihleHK6pDLf/qgN0u8c2gTigTJeTjNTnjEQFbzHxrd4/nDHQ5BofdZZWQohbq/Vb0wuodVVzvY30Q0nkfNnNNvWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaT2Q5qOOtkTi4nLEVAfgpVdpCwQVkNht4mUzsnI/tc=;
 b=xQEFfnrBlhZgR//65ExNMHfRyjvS0EDPuTYLzL4FcPpwAO96qso40ZzUL9MD2l2lNOmb+X+WvSrNCQuKiwlG2qZDeMDdUyCtTR2BSTyaeIL5ijCGKkLqVV9Y8A2T9cyW/lkSyvFuxwJsIP0tOgrMV2nwGeJ1kCLWAQUlLaLVz4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7920.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 12:28:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 12:28:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 12:28:37 +0000
Message-Id: <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
 <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
 <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
 <DGUGFGFA7FVJ.297YIFEBLO3SH@nvidia.com>
 <22041c9e-1eda-4273-b5be-6f277dec4a4c@nvidia.com>
 <DGUNQN0P5850.3E1UV2JK8WJEW@nvidia.com>
In-Reply-To: <DGUNQN0P5850.3E1UV2JK8WJEW@nvidia.com>
X-ClientProxiedBy: LO4P123CA0264.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: fc993dfe-4e5b-4c2d-4d1f-08de7ab2bab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	8MOv8rhZBlJqkV50+DQSSkOonYZzDR3xMDqfV4Q4Zb2455WuG5hyHQYCKxkuZdEbk2BB4sNG0bYg3ZI/ektjvZFomZ1HNZvJCYODNiXGWKAFYRBRub7OQIXvmqzh4CJsP88mdvQo+A8IaUs9hXqpSAfvfUdHDhpBe7wOQmobX6oLHaZXAbQ9InpQ0Qcj/StFBKkJ/6rlhLh2BSdDyzUzUNFbveDvxf0pHnXc5ezbJT8eL5U91Ch+eSAXSJBImPGp2arjHPG7zvCj+Tek0CvsxpqLj/oV+bHZ4DaQ7pjrocqidQY5aghKSaI7grqbeRS4PsGbIqCoc1UQqEDaV5kTJu7PeLyz7krOhij/GKBsIIPq51MVM6nPcGZVZzEf4mxQehuyUVdUaIgGI/7D/+KslEvlRSpxpVOUjK0VDe3hJfdTy25ubGddrTdQWBsS3SrO/RHoAHPG+rDa31BKIHfUmho3LVIZkV+m+Z9v2d7pZ/J6bnl6obhDtzWFKvN2NudECpORA+eRyRkY8mPPr/m0N5GB7EPl+F8xklddJho4K0ky58RtBqJZZzIgqkkQZ6Vs37fkW3w8a4JM5yzFkpHNoxSFwgnP+/VfQylSXZ1ZIxcq/HScoefoOIzC5ybQrqH9qq5EYmSzVA0h+L3k6GcoH439NbGFPV0pcPsPJibrxbrwicDujRiKTBukXHlkegNZm5jYAvY45I0GT1dNcclGORxkE0WfXlsAI9Kg2TkbTsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z253bmZnS2tXTFNRQXJ4L3MwZjZmaFhnTzdpY1JtRHBoakd3ZnJsc21RT1hk?=
 =?utf-8?B?aUJlZnVPMlo4SFpHa0xKOWlMRndhU1VVR25WSDhWckRkT3BnUHo4M3FCVUFw?=
 =?utf-8?B?S0NNdFE2eTA1Q0hBYTBFTHA4eWdYUU15TCtCWGZacHNNZXFQUFZyZ0ErODJ3?=
 =?utf-8?B?WmpTOUVrS3BaWGRJRFdCL0lJYVlqVFplK0g3eHZCY3NJQldqSk02WnZORXpQ?=
 =?utf-8?B?VjVJTGxKYmNNUUhsNkxqbUxqbGQzSkhpT3AyYndTekZqaU56TkFCczRpTG45?=
 =?utf-8?B?djRtUlZvNnRrWmpmcmtTd2IzMXpMMlNCY0JqZDluazFHWE96TDBLMHM5NUFo?=
 =?utf-8?B?TGo2czJyd0V1WUlRQzZzTUYzVVcyMmJkYUpDYXVIYmdhSmhGUUlwZmp0Skk1?=
 =?utf-8?B?OXkyb0tZZHNtNE03clYyWnJxYkRPNWhGZ09CYnNmcWljVERzWWo5R3BRYUZl?=
 =?utf-8?B?eHFzK3ZvUSt3RnFiYlVhNk5UcHBwYVNKUHFDZFlrS0JCSDJWMnp4eXJlbWJn?=
 =?utf-8?B?amtlOFlGQnZSS2pHWWdvKzU4YVVQazBqcU82dTlnbzQzTlpzOTQvMDR6YlUx?=
 =?utf-8?B?c0lsZFp4UTIvbGxkWkFTNDBZcFZUTFBja3laelhBengwbFBrSUoyeXJqN3F4?=
 =?utf-8?B?SUhRdmh4cUNqNEJCOFFuOHY5UlBMWTIwaWZ3Yi8xZktaNU1iaG1vVjhkSC9F?=
 =?utf-8?B?aEY2UlVVMHlOZDB2ZkhYVVhHbXpHV3VtbWFnOG5jTzNGRVJ5NWpzSHRrTWw4?=
 =?utf-8?B?VktqSFhzOU9GKytTN01DU0VQRit5d1BOanlUV1RNbDdEY1VORG9aRndZVEZF?=
 =?utf-8?B?TFBYTHRxV1VOREtIS2NNTnVRNTg3SlNlUGJjbUJyZDByWXVjeVFXRXczZEtT?=
 =?utf-8?B?eU1aMFF5NkExYVVKbTVGSi9sV0twMUR5YWlmaHdqRnFWUklvMkZYK3NHTU05?=
 =?utf-8?B?YkNUL3R2WEdJZnBKMjBCZEgzd2c4bzk0c21DWkJVdCtoNVdaZVRvYTlPcEVK?=
 =?utf-8?B?QXdSUG5tejJtSjZaV1h6aVFrdW01N0ptUk4zay8yUXg2VEpaQnZiUHN1ai9O?=
 =?utf-8?B?ZktvUXRKbElhMit5ZTd0L3hlN0RQTXBEWlQ5dSsxVnI5RktFeVQ5VTVZZDBj?=
 =?utf-8?B?SkZDUnNLY2VRNVpacHNmd2FhcEhHaXlEc0d5RGtDdW5hcnhCWnpqWXFrMWE4?=
 =?utf-8?B?ZjE0LzNiYmw3TDBWRm5UWmtGSi91WUJXUFBRbC8zRVJnWkgwc2RMblZzbDRi?=
 =?utf-8?B?dGFreE0rZ3FWQ1dIeHJUVVdzdjF5VHlDeGZCVmJXdmxVK0hTTlBrSXpKbHVH?=
 =?utf-8?B?TFBmRFlzc3lBeEFrSlY4UXpaYzhTMEkvZzNEd2dTalpBMFFidlN1VkFMd1Ur?=
 =?utf-8?B?ajNFM2tjUnludFd1ckZPa2FDN0h1UStRRUxMY29ReXBjNzVTMWtMTWRod1hM?=
 =?utf-8?B?Rm5BL3FQUWxZSzErR0tpVFJ0M1NzREVrWFpaNGZEdEJLbll4ZkxQc1FyRFlx?=
 =?utf-8?B?eDJ1ZzViMXBOWm5mRlI5WU9vSGJOKzdldXZLcU5GUXhsMk4vbkpSL3V2ZjBw?=
 =?utf-8?B?SURQc1pMbkIzZWhxaGZYY01FS0xjZlRCeFNwa29iUWdNakRQbnV6RUhsRkdP?=
 =?utf-8?B?YWpOckdHSjViNlBCVlhwcnpiNkxwVUFQc2hNTTFHcFo0bVBpN1VNeEZuVExL?=
 =?utf-8?B?SSs3bmdpcDR0NnkxSWRtZS9tTU8yYy95aEpTV2VOMEh1Q1NTQStPNVpRb0Nl?=
 =?utf-8?B?M0xkZzZOQlBGLzNmS0Y1d2VXYklRNGxiVW9icTF1V0UxaHFUNXZwc1l3bFBi?=
 =?utf-8?B?czZadzdlaFBkT0RBTzBoN3ZWUWp5QlFoSHNGaGNzeEV6ZXpjUjlKR3dkcXRq?=
 =?utf-8?B?d2VNYlRnVURVZktEUmZrRWJWVmtuS09UWXdYOTk3bjRnZURoUGhQVElKMVhm?=
 =?utf-8?B?N3ZPeTF3WWxXcytpRFZQSllHUVg5S0pNTDNsSUpmNXVJRStHNEN2amJNLytS?=
 =?utf-8?B?QnVWM1dxOGI4aUFUVTUvM2IyNVBjOE5zRUJORWtkOFU3WE1ZUjlGSDBqVFh4?=
 =?utf-8?B?YzR3UGVMU0M2WXdackEzdzF5OFJGMHFuZWJmYmFHaE5HWXNucEtESVFwZkdS?=
 =?utf-8?B?aWVzRWt1VUFzRklWbDFmMzVzeTlORkpPbkVBblEvOXVtS3hmd2thN2VvMnhF?=
 =?utf-8?B?R3Z3OVZibjA2VG81UTdPWjRRK0pRZjVNMk41bFBuNVRSd2pQa2hxOGUweE1S?=
 =?utf-8?B?NUpITGw0T2N5eDJxa21QS1VHZDMxS1YyY3AzekFwVkxROVhFRWhueU13dDd4?=
 =?utf-8?B?ZHFRUnJvMXdkbEdreGl4NEFoY0Q3UHBXWGxSTjRtVy9KSTF1bVhzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fc993dfe-4e5b-4c2d-4d1f-08de7ab2bab7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:28:38.9332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XQC+ViswfQxESsMV/jnERq8NmUpXNODDeXQmk08d+zuCl/jEYg02xYqW0dd2rYk6ywBChnCeDrHgoOhKwMlnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7920

On Thu Mar 5, 2026 at 7:07 AM GMT, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 10:31 AM JST, John Hubbard wrote:
>> On 3/4/26 5:23 PM, Alexandre Courbot wrote:
>>> On Thu Mar 5, 2026 at 4:14 AM JST, John Hubbard wrote:
>>>> On 3/4/26 11:04 AM, Gary Guo wrote:
>>>>> On Wed Mar 4, 2026 at 6:53 PM GMT, John Hubbard wrote:
>>>>>> On 3/4/26 3:18 AM, Gary Guo wrote:
>>>>>>> On Wed Mar 4, 2026 at 3:47 AM GMT, John Hubbard wrote:
>>>>>> ...
>>>>>> +#[inline(always)]
>>>>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> Op=
tion<usize> {
>>>>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power=
 of two") };
>>>>>> +    match value.checked_add(ALIGN - 1) {
>>>>>> +        Some(v) =3D> Some(v & !(ALIGN - 1)),
>>>>>> +        None =3D> None,
>>>>>> +    }
>>>>>> +}
>>>>>
>>>>> I think your signature should probably just be
>>>>>
>>>>> pub const fn const_align_up(value: usize, align: Alignment) -> Option=
<usize> {
>>>>>     ...
>>>>> }
>>>>>
>>>>
>>>> OK yes that's a bit nicer. I've done that for v6, thanks!
>>>=20
>>> Hold on a bit - if we are purposing this new method for use in const
>>> contexts, what use do we have for a `None` return value? By definition
>>> we would know both `value` and `align` and thus the result is
>>> deterministic.
>>>=20
>>> We do have an alignment method for non-const contexts already. Gary's
>>> initial comment was:
>>>=20
>>>> Either this function is always used in const context, in which case
>>>> you take `ALIGN` as normal function parameter and use `build_assert` a=
nd
>>>> `build_error`
>>>=20
>>> So why not make both arguments generic in this new method, and fail at
>>> build in case of overflow?=20
>>
>> At this point, it is completely impossible to write a patch that complie=
s
>> with Gary, Danilo, and Alex. It's all over the map.
>
> IIUC it is possible. Let's summarize the constraints:
>
> - Gary wants to avoid a panic in case this gets called at runtime,
> - Danilo suggested returning a Result that can be discarded in const
>   context (but took that suggestion back as we already have methods for
>   non-const contexts and thus wouldn't bring any benefit),
> - I also pointed out that there is not reason to have a failure path for
>   const context and suggested two generic arguments.
>
> So here is what I had in mind, if using a standalone function:
>
>   pub const fn const_align_up<const ALIGN: usize, const VALUE: usize>() -=
> usize {
>       const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of =
two") };
>       const {
>           assert!(
>               VALUE <=3D usize::MAX - (ALIGN - 1),
>               "requested alignment would overflow"
>           )
>       };
>
>       (VALUE + (ALIGN - 1)) & !(ALIGN - 1)
>   }

Eh, no, please don't start put everything into const generics params. These=
 are
severely limited in usability, you can only refer to actual constant values=
, and
won't be able to use them in, say, const functions.

If we're going down this route I'd just want

    pub const fn const_align_up(align: usize, value: usize) -> usize

and use build asserts inside. If this is only used in const, then using
`build_assert!` is perfectly fine.

I think John just want to express `usize.align_up(Alignment)` in const cont=
ext,
which we can't do with stable features only right now, hence I sugggested a
specific const function that has the same signature as the extension trait
method.

Returning a `Option` isn't an issue in const contexts, you can just use
`Option::unwrap` which is const (might need to enable a feature in 1.78, bu=
t it
is stable for a while now).

So you just have

    const TEST_ALIGN: usize =3D const_align_up(10, Alignment::new::<256>())=
.unwrap();

which would become

    const TEST_ALIGN: usize =3D 10.align_up(Alignmnet::new::<256>()).unwrap=
();

when we have const trait impl.

>
>   const TEST_ALIGN: usize =3D const_align_up::<256, 10>();
>
> This uses purely const asserts, but you have to work with two `usize`
> arguments. The version below looks a bit nicer as it leverages the
> power-of-two invariant of `Alignment`:
>
>   impl Alignment {
>       const fn const_align_up(self, value: usize) -> usize {
>           build_assert!(value <=3D usize::MAX - !self.mask());
>
>           (value + !self.mask()) & self.mask()
>       }

This is fine, too, although I think just returning an `Option` and ask user=
 to
unwrap it in const eval is better.

Best,
Gary

>   }
>
>   const TEST_ALIGN2: usize =3D Alignment::new::<256>().const_align_up(10)=
;
>
> It has to trade the const asserts for `build_assert`, which could cause
> these cryptic error messages if called in a non-const context, so we
> should document that this is only to be called in const contexts. But
> otherwise it fits the bill and looks reasonable imho.
>
> Unfortunate that we cannot make it generic against all integer types
> without `const_trait_impl`, but generating `const_align_usize_up`,
> `const_align_u32_up`... etc using a macro should be doable if needed.
>
> Oh and if this cannot reach consensus I am ok with just dropping this
> patch for now and doing something like this in the next one:
>
>   const SZ_128K_ALIGN_MASK: usize =3D Alignment::new::<SZ_128K>().mask();
>
>   const PMU_RESERVED_SIZE: usize =3D SZ_8M + SZ_16M + SZ_4K;
>   // Align to 128K.
>   const PMU_RESERVED_SIZE_ALIGNED: u32 =3D num::usize_into_u32::<
>       { (PMU_RESERVED_SIZE + !SZ_128K_ALIGN_MASK) & SZ_128K_ALIGN_MASK },
>   >();

