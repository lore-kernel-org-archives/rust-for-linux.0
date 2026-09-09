Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021131.outbound.protection.outlook.com [52.101.100.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116A457269C;
	Wed,  9 Sep 2026 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964365; cv=fail; b=RD4zEpkbMa7P10c06Jf50gy3iQf6rS88lUd/aBRMYAukUM/YRNngWenR8M6SwmwvEWr6y8iViKoK3WJBQ/ljzP8RMOqEYW99kmlx4l1Z8lmuO4xMtGiB0ixP8vlP74vlTo44OuYPMqbzK/tg1x0wICeE0pPrdAf2L1qgZhNav7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964365; c=relaxed/simple;
	bh=bMzvtUADnVcPEGRLoFwikehLRiod9lvAQo6ID9T85nA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=clbf80f37DVTHQYvdbuK3lyxzXRrDonl+fRCtCuc72MJ51Zf8X3chYOrjbmAbztDQRPi8tWo8HVfrCUhno6kXmZlD/MDTJEJbtO29YqMRAJKQHMB9DagwKQUJuFaKzawAeEWq3U/lK726KPyODw3+2lYMT+9fMJ8LovRUNtqEjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZTOzyrXO; arc=fail smtp.client-ip=52.101.100.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZTOzyrXO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFEvaZ5mS/CitMXzWU7y40H6ZP9uSdIRlov9e698iviftpUH+awVxC23XvHvMwuozmVwhjZvUcNI9k53w2rZqA4+D/jy2NjplG32rt1j2M0Gc/D5eY7pGc7EatU6jaZkFIGO9vj5qeugnIfLwrCWF8zpkMeFVIfMa8wGZPQYR6RvyPzKLvgeP/nd7rKN/kRleT8u0zzQoRYvQb8areErli80ynlsbZYbKML8o91nMGfWWc/KDfbIJieSSARw/R9EJV9MnVUsjzngGjwEiuOuHtRBn4BeMvaxEyxLnb6KCLCCEIBoWw1kbQ2SSaAK+5B0JEevbPpAnPI2OTLPfrUYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihuTDalZcr4nRCqM/GPc1jdOabtZY7eu0nS+aDvINIg=;
 b=NHkYHKzF40zdjSfi7TIa3HRt29CnMkWnQNSwu0hHQK4Lj69QDoguBQsSPnSECOrpHlmP5VR2kdxQuiVLmlWQIpFR+3IWyA0LQXT7ILOMf1XWixz15ndaPIHnigaTE8jVUKkYZwflgm+NcJ7MmCfOgJBbB69qsbIl3+M5bDiPlgGC9NaNQ31QL7wQJca07GkBYjjbroYpoSvAhl5zkjY/iwslHfUNYAl0p+0oFhD9l/HcCRJqcBbhnFCwYim7oQ99kCOkU/IAO6n2gY5VV523jmJ/RlwwBk2z5q2cJc0jIERaoTWlWYFQwAWlLUP0IfVMjLYdSCSAoUmW1stxv1E3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihuTDalZcr4nRCqM/GPc1jdOabtZY7eu0nS+aDvINIg=;
 b=ZTOzyrXOW5xF3WJV0oYRBIC9+Ixt+0hs2NCHEdusSzd9URhtDg7EbnKTYqloNJaR775jBn9rNURJx+QwBXKQ3Br+ukuMPHLeBoMQ5BAnAH3+grQmygzB79bwhNKfxPAUVk6ZtX13utsjLK+Z9KZWTliC2Co8N3EJelMm3foCKmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1804.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 14:32:38 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 14:32:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 15:32:38 +0100
Message-Id: <DLAUXSH2302V.2OKAZYA7XOEEF@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] rust: const_eval: add a mechanism to do const
 trait calls
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
 <CANiq72mgqhjAYR-a5gSnMjK++TVc1n6RFpj=Go6QqXtQRX3=9g@mail.gmail.com>
 <DL5SQWU5QH9S.1F1V38FAA5Y4Q@garyguo.net>
 <DL8Z2OZLK8KS.1KVH6W27ZTOWG@nvidia.com>
In-Reply-To: <DL8Z2OZLK8KS.1KVH6W27ZTOWG@nvidia.com>
X-ClientProxiedBy: LO6P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1804:EE_
X-MS-Office365-Filtering-Correlation-Id: 1562b1f9-8246-467b-5249-08df0e7f32bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|4143699003|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7zqNHEWrWdiLS8AtjklHeKmnJZ4hqdNmGLemntUd0yV3tudc4gbgQqunV5yLZPjlSZH/8NObOO/p0nd2VWUypQp0W2avR1YoZSnmP0rHL+nIwXvy/gLh9fE+b3VNiuhGeE/hGHatQWoAWhCSw5Czfw6sQJwKCuQ6FszQSEIbjD6rtleCmVmg7dox399Oa865bJOldLsIM3QfZrUJDf1YT2phirCJUIqRz1CWc3+3+A1HujxIzBWCQlsR6QgyvXf77nMv124JAsq3DAuMOmeDM23YStUqXFQWHIV0cWwS5Gh1azFh6ZiftPPDvCG+dgD8sYwC6qaArAKpKphG61udrqzzn4bVoMRYYXcXKtDcyYKx+bnzLuQnfCmU4TiRYqUtnq1HklmRXcDaSV7h1CQHmJTnVm0TLB1oxl7HlmRS5p/Qk7i8Ep23cnodwMAhtzcN8XApV4fqMvzAxcsmIU603iHxwZ+v0P6ZvSjtO3G4Mnbs4nExYrKKa0Fd/wCe8VS9nOj+fGjkfyHABP71Ehgb3f7d/RTQhDmBBwO15UpsaRj43cYmspOh95n1cfaR9GrggQ7QqHBe1UaCxVj/djs2lEcqFhR5f7YB82POFvX54WfoNb5E0MuR6jk1MHfe/JT4tSsMT28Buw3i8gl7nsduhrf98X1n2nCJZqecnjLXsr4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjE3ZDY4U0U5RTVxMXlaNHlxejN4Q0NEMnNhWlVVZVNKWlBsQVdHSXRtL2ZF?=
 =?utf-8?B?WllZc1V4cEV2Qm9LcnNDclAxcVdKNkpTVXJFZnFKVVFaSG1TYjFCV01XODFK?=
 =?utf-8?B?RXdVOHQrUkVTOHlxYXVCdlZJckttaWxzMGdEYm1jM2ttdzd0T1hibGYzME1x?=
 =?utf-8?B?TmY4WkMzQUFLS0xFMDJsVWUxS3cwUzY1TjFkODQ3WVlmMGY0UTZTSU50OGN6?=
 =?utf-8?B?KzdmQXFtaDRKYjJ5WTBnc3JoRTdRQWIrM0JYM3Bud2VCMTIwR0laa1AyVlZu?=
 =?utf-8?B?N3U4NFdNQUJKdzVZWUNLOCtrd21STjFQTzhVOXFvU1FvcUEvbEJOS3RqNWw1?=
 =?utf-8?B?U2RaOURpU0ROUXZzTWlpbnlXMUlCNUlNYXVhRmtsVDZybEhrbmp6Y2dDdnFC?=
 =?utf-8?B?dDlBOXBPTUg4NlVadzl6WFRIQjVPL3dGWEFCMGlIMkkvbFhOMWx5dHpQcUJv?=
 =?utf-8?B?ZEhacXUvZjBnODJ1WUlER25DRWlaSER3V2IzeXQwdnNHbjVMNTBucmduWDlY?=
 =?utf-8?B?d1JxRDMxOU9oenN5S0REMmpUYzQ0MnBFYWZrdzlwMnk1SDlhN0VEVGxPeko2?=
 =?utf-8?B?OTY0RnJqc3FiWWFmRXdYRnpzK1Fza3RFcXJ2V1ozZ0JMd1l0RytjeWdDeExP?=
 =?utf-8?B?a0ZSYVVyZzd2N2prZXkzbklXSmpwMzZiZEFBeisvNUZoemJ1ZFJJVU1pV2V5?=
 =?utf-8?B?Sm8xQXVDY2NHNzdYSmN1RjNGa2N6QVdGaHcvWlRIVDVkczVFdEpkN201MCtX?=
 =?utf-8?B?NE5lVVdMYTRzWllwMjVGT2NsN2JXN2pkTG1aRE5qOEUzVERFeG1LekFOQVEx?=
 =?utf-8?B?a0xoU2ZUKzRGMFV6VExhTzdQMC9OekZ0RVp5N1VnQnNldmNLSXNYWUN0TE1I?=
 =?utf-8?B?RFdITFo1M29nRFM5T05oN0RWYjBwaE5pNDQ0emRpbDdHZTBKNDRwOUU2cmZE?=
 =?utf-8?B?YS9GcDIxamNlNE52UjFPM0hZUCt6S3hkMnNyaWdQUWVuZnh5R2lpbXQ2UE1i?=
 =?utf-8?B?czMrTktQL2NXa2tWV2luMW5pQy9DTnVoRUFCc2hnam5LYXI0R0Y2K29CMXZl?=
 =?utf-8?B?ZkZTYzNtZGk2RW0rMGh3WWY3VUI1TndPS2dZeUF3OW80NUFyL1FVY1RzOGNE?=
 =?utf-8?B?RWV1LzdUTWc5cVBtTXNyTVNkVXpaalhJbHAxa3VQbmJnc0I2cGlUK3hsYllC?=
 =?utf-8?B?VXFOTThsQ3JGMTB2T1dkKy8wMm1sRTdkZnI1OWRKc1prZU0vQUhNcktiTXEv?=
 =?utf-8?B?TVR6V2czY3FDTUgxanN6cnJXT3JCbWJLOXlESHMxejBZUU1maVZKdEd6Nk56?=
 =?utf-8?B?RkVXZ2pvQUJrdEN5bnRFZ0FiUTZXMms3U3VkYkpGRFRwaUJkejdpamEzeERp?=
 =?utf-8?B?Nk9ES2VRMzJScjkzWVBCYklxSy8wb1hCb0IzS0NsMDAvRWhieS9ZZTFMOXJK?=
 =?utf-8?B?QytzaThpeVhuSXR1UTY1b1F6aEhUdzgvZUZjQmJwQVdhMUM1Rk1HNjdTUVYv?=
 =?utf-8?B?bmhsa3dtZGNXMGxaZ3Q0U3dvbUZNa0lybVJrbk5PeUE3ZnNkQnZwaFNVU1VE?=
 =?utf-8?B?Q1JGWUNNQnh6MUh1dFRaSGtpMEVRd1diUUs3TkVKYXczRzJoOVh6RWEvSEpr?=
 =?utf-8?B?KzVCdmhjSk05dGtQUzVKWjZCczFBZDZuMjNxYzRsbWNMVW5MWXFhVTR1ZGdv?=
 =?utf-8?B?Vy8rVmFEYVVLeHk3VENVeldGV1owUTRESTZtTHUvYlc2czBvN2p0ekFBSWRj?=
 =?utf-8?B?RmU1YlpiN2psb2ltU3lVWEZRVWlMK3VSL1RRV3pLTTJhUGRWdjRyZTBoU2Jo?=
 =?utf-8?B?LzlkRUpFeGR2SmdJdGpPYTlWU1U5MDcyZFBwRDg3ZHpVVUVkUnBEcnpTaGlY?=
 =?utf-8?B?ZTBLNkZrYVlLTjA2bXB3Y084UytVVnF4b0FuMGs0VzFvQW9sUnlnTHNVaEds?=
 =?utf-8?B?WUhCRDV4N2wwcEowYk1wWmtPaDRGM29rc2toT0thaDVRTTNoMldEUTVHOGtL?=
 =?utf-8?B?cFdVUXo5RS9WWHI1TXZjTFNraGxta1NiVENrSWhQWlBYVjZNbHR6SkU3Vk90?=
 =?utf-8?B?N3JGWlBmTGlIWmtTMUcxNmxxRjd4WnJScmR6UUtyRldJMmVPVklsazlIWmhD?=
 =?utf-8?B?UmhVc3IyOHVCL0pQeUdyV1NGWUQ2cHloU1BLdy9CN0ZIbldNdDljRFZlb0Vz?=
 =?utf-8?B?QWN6djhtakQwc2RFMDJaZjlIK0l4SnVDRnlReUVKWDFsQ3hocCtUVUxkcTVz?=
 =?utf-8?B?YjlQQUl3ZUp4UFJaTTlvV0VLVkE1MURibWs5MUFkaXBuSUZmY2E4aHBJakp5?=
 =?utf-8?B?cForcXR1K0ROZHlWK3pIbTBDbzUyRTVzUkRLVFR4RHppZzl3TnBTZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1562b1f9-8246-467b-5249-08df0e7f32bc
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:32:38.5853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlbN6mJ4wtzrrVC8fyq36RuZ7r+GyuvriIMA3hdpJypRoROm1GdsinhvN6nPasVuTu1uhDLWPkHg9tKyrwplXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1804

On Mon Sep 7, 2026 at 10:21 AM BST, Eliot Courtney wrote:
> On Fri Sep 4, 2026 at 12:46 AM JST, Gary Guo wrote:
>> On Thu Sep 3, 2026 at 4:34 PM BST, Miguel Ojeda wrote:
>>> On Thu, Sep 3, 2026 at 5:21=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
>>>>
>>>> Add a mechanism to perform const trait method calls, with the same typ=
e
>>>> inference capabilities. This would only work for concrete types (not i=
nside
>>>> generic functions).
>>>>
>>>> As an example, convert `as_char_ptr_in_const_context`, so instead of
>>>>
>>>>     kernel::str::as_char_ptr_in_const_context(c_str)
>>>>
>>>> one may write
>>>>
>>>>     const_call!(c_str.as_char_ptr())
>>>>
>>>> instead.
>>>>
>>>> Signed-off-by: Gary Guo <gary@garyguo.net>
>>>
>>> Thanks for resending this!
>>>
>>> So I definitely like having `#[const_eval_only]`, because we do want
>>> to limit those calls sometimes and it is nice to have C++'s equivalent
>>> to `consteval` (perhaps this could be called just `#[consteval]` to
>>> match?); i.e. what we talked about in the call.

I'm okay with either. I put in `_only` because I think it makes it very cle=
ar
that this is not just const-evalutable (that's provided by `const`) and is
*always* const evaled.

>>>
>>> On `Const` and `const_call!`, i.e. the other two patches: I am not
>>> sure if we care that much to introduce a macro for it, but it doesn't
>>> look bad either. I guess perhaps it helps to have a consistent way to
>>> do it and to easily remove it later when the actual feature lands in
>>> Rust. I would like to hear some thoughts on it from others.

>>
>> I think it's good to have such macro compared to our current approach; i=
t can be
>> made into a identity macro once we have const trait impl.
>>
>> FWIW, I even considered an extra macro that allow you to write
>>
>>     #[const_trait_impl] // #[const_trait_impl(foreign)] for core types
>>     impl MyTrait for MyType {}
>>
>> and generate the `impl Const` part too (and also add a line to the docum=
entation
>> that the method is const-callable with `const_call!()`).
>>
>> Best,
>> Gary
>
> I agree with the consteval macro, that sounds very nice.
>
> On the const_call! I have similar thoughts to Miguel. I reckon if we
> have a bunch of prospective users of this right now, and some thoughts
> on what would use this in the future then it's good. If it's just one
> use case right now, then not so sure.

Some other candidates include `Alignable` (we currently have a "const_align=
_up")
and maybe `IntoSafeCast`.

Best,
Gary
