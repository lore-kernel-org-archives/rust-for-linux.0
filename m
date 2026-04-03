Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022103.outbound.protection.outlook.com [52.101.96.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C853A5439;
	Fri,  3 Apr 2026 12:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775220991; cv=fail; b=BRZiRwniCwfCSL6mx4Pmnm77H02o4JpXgBGS1ytLk671ttafrCeV8P0ud7VTz6Qi1+rz9K+BYUPkBmiTm5hnA24LUheA/wB5GI2Gs59b+D/BfSs1gIXBAPG2kdhTyJ2e7ABOGfvVUq3E+zNlBeNXq5pG9W+MmUiXY4ucvYXdVUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775220991; c=relaxed/simple;
	bh=+pzFgDufSBJ7x/Z3kPgeOdWyzdUOmy51NkK4Nl5ZGxo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pUyyxreLqWtCgeTACCQDvVLbvZUUKBucCBv04P4FqsjHtes9wU8SfDKzFCsPFC03nLH+vthVP5oaws7QN5j0FglmNNMX1Pjp75RKROATGEUZazu5DvxSR8X3VsWdbatwX7Zm8aDu2WpwfdSgNfhhd2pLvvfGouk0zQQ7tU3og1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zwmJAge4; arc=fail smtp.client-ip=52.101.96.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zwmJAge4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiRYvnLwF7bZGcETpDI+ZZfSbTt+Q9STxep4Ww3AuhKglzLIF30TK/ZqnxLcYgmL41PHDDSbwGVwP+LjRTUa3QWfOHWCiy9P8ms5h1VzZlssxb4MFvtmykElD6py5PnbeeGdhUk5ZV19JSibb62CcqpwX8ckTYeGLq0Aq9Li+bibXk/Wuf+yd1w1eCKSFM7YecRm/QApdoYY4v46K5CEd3pVz4uADZdQZMLn+93sSJLFJD9U0DfjBe9OFxDFOBsrZD4Tuarbzg4ydFWuXyrcXvJXpy14GcS7v1YfKEAl+xIrJMTFEpb4sW9QX0AeXuS9lZszqr3drYIED3ROVsu1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pzFgDufSBJ7x/Z3kPgeOdWyzdUOmy51NkK4Nl5ZGxo=;
 b=HUj/ffAcODr8HUIm2iY9zqD+wIAjLiHdAjrVYRBknsb30paiqpWdTdbuusAtp1oWXpva+zFOjbDrSXfbszzFYW7aoXeG0nltqyaTwcgK3J8oFDrNh+4WgXqCb99k8dmo66MNpBR8p78Rqw2XNneGOPqig4YAHrZL9vDyUfLmfDmV1p8jLDepqfgPq9yuEcR/78wJ0VDMnS+ua1CeQna6fQqi+SpTS2c2P/33he06MDTAwcEI7tmR9bAYRqoBTfOJzOyfsNDI8VyWk2PfA5NDy4G9XZlR8kn04IKwaQv625cg7miMhnXx/sbwVRemAGmaxIcVNtK5n+ucRdbrQjyGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pzFgDufSBJ7x/Z3kPgeOdWyzdUOmy51NkK4Nl5ZGxo=;
 b=zwmJAge4965Lv3T9v3GrC2hjFFQ0ZI6jBWI0JSxZAavVAC/XLWtaug+UoqDIihypDjJaMVDn4LJvgfiGW2/h4gYNNY5HOkA4Y8ekQfKVYMkdUsCmzLJtF0yz9SN7vZcjCtRaoUmyCTrA4B8OqgWlYU2caKUUdkb8ApI0kCUuRfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3326.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 12:56:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 12:56:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 13:56:15 +0100
Message-Id: <DHJJBDSSO9E2.3AFITSAZJMXCM@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, <'@google.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
 <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
 <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
 <DHIACQY3YL4M.3F7LSF1BZBUY6@nvidia.com>
 <f2ba20ab-7c56-4e57-ae71-06b35a696a44@nvidia.com>
 <DHJDGQ1WAOP7.1BHAVWX0OSZXF@nvidia.com>
In-Reply-To: <DHJDGQ1WAOP7.1BHAVWX0OSZXF@nvidia.com>
X-ClientProxiedBy: LO4P123CA0432.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad0c6d1-a68f-47a7-3b56-08de91806494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9S5xQv7AZKgCN6SsIhcXiIT2ieTfR1E3P3GFfNVr6rt/u1iwbVicarK2u2SxFi42+P7NIJGbV8+FGRNE5w+8/M+9w95P3ltOIDyWR6FQnUWtpbFqh3uFHc8VYbvXpx8D4ZsvbzyKo3u0DIC7BLtfA3XMzM1ZtGW/edpcYBPQGmRkwYaULzMv7Ygchjkm5HECI8EgOktlxKhzEFZTvYZxW8bWg5nTsokzPWkC6/w8dy3rPvUghtjc+On+Zrt/Ij9cuF/oCxlc4J+Y/fleXv2EwesCum4cv3IBZzAf/KPfyOqRHd1I50ODvHQ3bsK8f9Bu0a4mhCsFn8ELVqs4izE/EverBN9o/olQyJ6960qm/8WnUouhTdAD5mLNljAaCOn1dwPVT9Gmz2OcPsILC8ZOSBfa0sjpY+HLPa2EJW3O6vxjxdabxn/JFRZ2zl/9Ln70vE8ogRAYPjcQbQRSD7uRvj3j5TNbroRvNvHPxSRrnqiE/JE1goq6jtu8GcNCN3CvxLbgxBqhY/j6xG27/I4BZ8kqtj4lJFl00cEC8UfCNoXNt6euzVvmiYjYghTNGkQ5k/C/cRDZm3odBHwfidflp5bUcbJkJNIuDkkdPOGFIjy/9yNo+NUx9SwH/Rpd7zAA8sfV/as9yqAO9JBXC3zePJvrdXsGx2n+ArH4lpVuvSwp4ux1DitR3+7X6civ2xyYa6C3yU5WxRdYHT1onnlh10NlewoaFeOFvERlbiPizoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzhVMUllSVUveFphaHFoQjhzMkdzcHVWeXU4SFNJTHJDdzI0bVhnanZsYlNm?=
 =?utf-8?B?VUU4Q0Zldy8yVkJSYlJJTmVRWWNObVVzakhIeVN0TVhXKzFWYURWb0NaY3gz?=
 =?utf-8?B?c0ZvU0xoSytGTytlYXUxNFQ5ZnhGMGtLSVRiOEJodndQREdPK09JbUNmd2VI?=
 =?utf-8?B?NGxhTXV4dC9CV2hHS2tMa0x4VzlydjFwd0pYY0M4QWY0OWFzdXhRUzJWN2dR?=
 =?utf-8?B?NWZEM0JRQW9BS2l2WncyVDZPMVpCU3JuNWIzdnlnVjBPNHNpWVBxREhxR2d1?=
 =?utf-8?B?dHBZTXFlUmZUQks1MFE5My8rcjdIT3VucGlETlhwUWRITXJPWGdMYWFDWmFt?=
 =?utf-8?B?Z1BrNDJyZ3N3aTdDQjJBanhZeXJzNDY3bjZmYkx6REpXYXdKekROeDQyanVB?=
 =?utf-8?B?a2JXOXZyYzZHcFVYNnhQZlBWSzhNU3Y0WnNUbVU4Um1OU1VJV25kcmhoZkRi?=
 =?utf-8?B?R2kvbjNqTEMreDk3ZC96dkFHdnU0blNmSWtQUGZxMjBTTmFjaVNPdlJUUWdQ?=
 =?utf-8?B?VVFwYVhoY3U3ek9Da05lVmR3blRpaWJKcFoxZG5Ha21ZVC9SQlRYR2JSY2Jl?=
 =?utf-8?B?YWRqVDA2eHBuOGc0R2VkSlpkT3k5WFZLbWQzc1VjWElRT2ozWlU1ek9DVjc0?=
 =?utf-8?B?Y1pZUE5rNS90a0ZIUXRGY0E1SWJONjZuRjhFRlJkQURaa1ZIUldSa3dmZTVJ?=
 =?utf-8?B?OXdFbTJ0Z1g0dDVFTldxOS9hY0lFOUlDRUtPLzRuN25HUzJkYUxEbVhSK2tM?=
 =?utf-8?B?c0pWQTFvdjlVYnJJOFdZK29CL25lcm9EMExjSlVBS3Rhc2QxNHV5b2lXU1JS?=
 =?utf-8?B?NkxrQXNLQ0dGc0RzNWMwMHg0a050WVViUUIrVVBhSTlITEY0MmRhblJzU2kr?=
 =?utf-8?B?ZTFFcWcyV3lTcEVndml2VG1MRHVtOU8vK2pzSTc5WXJrdmZLbjhpampOaUlF?=
 =?utf-8?B?bit6M2dTcU9BQ2NpZW9sSXR4OWdnVkVVU1cxM0R2MlVBbjVkUU96cU01Uzha?=
 =?utf-8?B?RXpjVyt2M2kwWWxES3R0Y0JHSXRDaTdoWk83ZkNlRG1SMTB4WWdraFAwSnpD?=
 =?utf-8?B?UWliamRKb1BKeXF3T1dvbVg5TjZNQmdCbkNOMkw3ekk0NU1uemcwcjRsc21K?=
 =?utf-8?B?NElBNm1yNVAxcWlvbEpwRHcxU0MyZkVhSHZsL2JPQzQ4alRBaGxHekFzUXpZ?=
 =?utf-8?B?RkgrZE9JS2g1cnJETGcvcGFSbk54a09aazRWOTlaNjA4WFhkQTE2VTY2d1RT?=
 =?utf-8?B?S3dxRzhVcnJaNDBENDM1TjdzdTIzeDB6ZnlHaHFFbzNlaUxvL1kvOW1odDFP?=
 =?utf-8?B?ZTFSMjRWQkJsUkN1Y1VWUzM1VGNIdjFoVG9wTWZha0xVZEpsdDJEc2lDMlhW?=
 =?utf-8?B?TkttNGhZcDI3a0k0b2VKcVA0dVNlTGFlZUJJY09IVVROdnBBL1VualJWSWRx?=
 =?utf-8?B?SmtjNTMyeFJKQ1hqZ25JZHZKM2xXMHlpOXhobElKdzQvVnh5aDZqckUxM0JW?=
 =?utf-8?B?UGpGNTMxeS9nTGpITVJuRnFBUUQ4SDBOZldBc0hVWDBKMVl3dExSQm0wOHFV?=
 =?utf-8?B?R1U0UWdOUXNHL1dmM3ZRMHBvV2tkaXJpYUgvODV3T09reXZTNXZYMnBTaHRj?=
 =?utf-8?B?WDd0SG9rNzRMejlkZ1pQdjJVUDQwVDRldWJIM0paOWU0TFhTbDBCcFZXdlg1?=
 =?utf-8?B?NHF4UHNCNnpnQ2FaeG5tWXErejdiYXJocUN4VHF4Z3laKzkzK0NvWHBzS01p?=
 =?utf-8?B?cytTcThBallwNUtReUxlbU1mZnh6Tys0K2Z6eHpFcVN3MlhIMXFRekxaWVp3?=
 =?utf-8?B?MUUzVnB1NXpsWmJhdFpSRk9RdldiM1Zmd2RHSnE0WG5ET3VOK0J5TnJCZEZq?=
 =?utf-8?B?cTA3c2ppVVk4amhsRTlrN01xbzkzQTN3RUtndnVSRXA3OEh6SlFzVUIzb3pO?=
 =?utf-8?B?V3VTZ2FHWTRqSmJLLzlmeFExYjRVMW90SExCQmJLd3RiTWhpalV6S3ZpMk1X?=
 =?utf-8?B?THVtQzNIVmx5UTBONEhneUZFTEM0SjU4L1VpVVdIc2I0OHNpTmpNOXdxU0hV?=
 =?utf-8?B?NTFQU2Rxbnd4MXFzcnQyUHVhckRMSFdPeG9FSDgwdEV6TThpOFdia1lWRW5K?=
 =?utf-8?B?L3k3N2JkQ0Zuck1HbVpKTEFzak51YVBlM1JlSFlxSHJPUkN1S1pKYTNrT1Jz?=
 =?utf-8?B?cUFySmttQWhYTXBJT1ZnVUQvenh3c3ZIZXhlNVpyR3dFMUZIeU9LV1lXTXBa?=
 =?utf-8?B?WFBhOEhVbVhCd1hubmF0WC9ySVIrd0V3NFJXNnNsWW83RWFnM2QyZGJ0cEky?=
 =?utf-8?B?Yk56YlBWOVM3WVg4bS9kNWFYbW81VHZXVXVMVW9vTitSL0p3cUJ5Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad0c6d1-a68f-47a7-3b56-08de91806494
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 12:56:16.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCFWtOrR7CxHCe5yJbLAKGCmki+a/lG8gAgAtszxCmBVPdFCxqTlSWvOKMh5SwcK6SLE38bAd+td1ty6AauP2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3326

On Fri Apr 3, 2026 at 9:21 AM BST, Alexandre Courbot wrote:
> On Fri Apr 3, 2026 at 10:36 AM JST, John Hubbard wrote:
>> On 4/1/26 6:42 PM, Alexandre Courbot wrote:
>>> On Thu Apr 2, 2026 at 6:20 AM JST, Danilo Krummrich wrote:
>>>> On Wed Apr 1, 2026 at 10:22 PM CEST, John Hubbard wrote:
>>>>> On 4/1/26 2:46 AM, Alice Ryhl wrote:
>> ...
>>>> The reason is that when I proposed this I was thinking of it as a mark=
er trait
>>>> for "complex" types around u32, u64, etc. that we can use in DRM APIs =
(or any
>>>> other device centric API) though generics.
>>>>
>>>> For instance, instead of GpuVm<T>::vm_start() -> u64, it could be
>>>> GpuVm<T, V: DeviceSize>::vm_start() -> V.
>>>=20
>>> With the proposed naming this becomes `GpuVm<T, V: SizeConstants>`. Why
>>> not just name it `Size`? Sure it's a very common word, but we have the
>>> module to scope the name properly.
>>
>> I was waiting to see if anyone else weighed in.
>>
>> SizeConstants accurately describes what this trait provides. Size is
>> too general. Again, I think it's best to name things for what they
>> are or what they provide. And then, if they look odd in some use case,
>> that's a hint to consider if that use case is precisely the best way
>> to compose what you want to do.
>>
>> Anyway, I'm pretty sold on SizeConstants, so I'm hoping to stay with
>> that, are you OK with it?
>
> Yes, as mentioned on my v4 review. I agree `SizeConstants` describes
> what this trait provides currently - but was also thinking that this
> trait might grow into depending on some arithmetic operations to allow
> generic code to be written for anything that is a size in the general
> sense.

We can always rename it when we need to grow the trait. We can leave
bikeshedding to the future.

Best,
Gary

>
> That being said, we can also write said generic code by depending on the
> required ops explicitly, so limiting the trait to providing constants
> doesn't really limit us.

