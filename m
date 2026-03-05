Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010031.outbound.protection.outlook.com [52.101.46.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEB13C2768;
	Thu,  5 Mar 2026 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723848; cv=fail; b=dIY1r59z9Jn+ldmQJSAADsvRS2pmvM1OetcqG3uwjWt2j2S4q2a73phfURXyw54j5Ujy4tTWNlrjiDRg68b2PgeRnqpvv0J4w+TvP3fTEQsqvD2z62nDu3OKnK1iJo38QYACG9/1FBVwFulslnKxPh8L9bJq2LS732PcLEb2LTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723848; c=relaxed/simple;
	bh=RzhuFBr94oZM/t5JbNoDGS/08q9DeR5WXua2kGRSttI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iH9r1+juvKjTTXW9uPnHrNubFuqNf8eTheJc5ZJhyoE3jpGuzHIAuUqCvjWkl5zenEQ3AXJtVcRvIEYhwff5+5j8FZ87z+ZIhQfMD7Xfkfp7UDKOnpYs/5roGCIk1hBYcG6iUL8U7MfP4GldK5zC+zS7S9S1/x2RN/vaulng+XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hIoqJ3p4; arc=fail smtp.client-ip=52.101.46.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hIoqJ3p4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGI+geCqtLOO1lOF9DJjMOxqRQrgmdemdkq+aCtvqSw8kJmZvd//DyqF2hK55dBmdOwsJ8Hd/fYOKSkoV4tXLovoIWjPLCsQsjg1TcnwsDa1KfUMV/SON07kezA4VR6pe8lPVAHl9thibYVFVybKGyGKlW7KfvnRikn84DDlQd565R9qu9a50Ga+dY/VhYdYS6iQqObX+4flik1e9TfTtEtp3ufeyn/eJNUooUgAhiSAYuteADjgpry7yd84VrlH//WzPQ03BKceCJkTSv2gvaktzf/7H/yjr34kiXd0L6F6suQb5WKe1/IdD255fe2gSY9p3s53TcCieNWeJZnBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhHBn4h63OZISTWF9yZeOU4TvP7I6k2hCORG3QTvZoA=;
 b=adj/OgO/QJ71sn3JlhY5klqSae/vxD3xSfMGafpQc7PijDunV2PUoMaqo+KeOhzMJuCd8y5Zj4/a4qLFi3UKRXGKGiRJkvBZFRS9yGDbcqG1+FwNWUoQD6uxYJ3Ropamp5IPiTTyxeIqmku7szAJ+Arm1yoVMysUM1O+tdBqDJ6Dw67NeV4PA7lQATsqzAklMrzFbtpFDc/lEDawhGCVa8CYsozDKIEr3GIWl7Lmp4Bvknw1obSJx38biycm/5tIb+3n+L1LuUCx8Nt16XqYsC7qmvWshE4kb73HB6Q7J4Cqiy6UGwdev5k0lEgYoDLUfaW3wyNW59uFDKoicL0+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhHBn4h63OZISTWF9yZeOU4TvP7I6k2hCORG3QTvZoA=;
 b=hIoqJ3p4a2ZWTI8uL5mu3DQp6fo+MdX8ds0nrRIAYXZSHWT2JCK9zG+LpmHbJaTOZUHSZNfHpZmlvAkQdJj+dA4Fhon7ZmaMKwtWAZ1nD2iUy/ca1GuXJYnPpAmjAHXCGK3KEIxM7VUfSfDLdYB9JZt/oLGDr/uX/xa6QUzYTxl3L4oObdZhhMNa4cLjwEqYRZlKqs+xcc/TMUmZ+PjVzW7PnBMuUK5jpeNHCCrJ1oi18i5V8OF4UUJOaq1XN52ZXrXfUOPIn8qrK3AA99hc20tB9WTAlnGzvw4Q98D3tcyEd+0z3zAjLWKmO44+ntOHE2LZgqkP7hChKc8ImpvL1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7974.namprd12.prod.outlook.com (2603:10b6:806:307::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:17:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 15:17:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 00:17:10 +0900
Message-Id: <DGUY5H3I551B.13IYZC7DRSW7E@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
 <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>
 <DGUWID9C75CR.5V8H58RTA0FJ@nvidia.com>
 <DGUWMT9LMQ3J.15EB6M581ZKVC@garyguo.net>
In-Reply-To: <DGUWMT9LMQ3J.15EB6M581ZKVC@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:405:3::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 9977eac9-935d-495c-f855-08de7aca4789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	aEyDOhNDp9qSvcO2oZOQ8dQNKXyiGBXYhBQJAscwUbPejEr6ZMZ3Ypk4zA9GuTsJe2uE5uPWZJYjX7tBV7+VvSEkfZZ6JTdz4DJFVWFLguyKgdnEomq9FgXNhO2Sr1bwRelOpV8CkCptZTfSLlF/GWZ6sPZ9QT90uJZWGxU/+WXufy0ue/qGMCg6gED6+Q/Hy8yKrHfoFKWKjmNAMLbFIDTgBQ1Hsn3n1Wtj548BoxKRLQG0m2bmD9lrAb4hGssCPgcGz4KfRQalBEG6sQMUco2Jft+nal8kXlUJZGIB+6etyVZVzUlK5kfyHNxyWHYLqWbwES0EHLZvL9zn2zTYwe2kWJaYzsx6LqHOOIJ5Ux7vIA8wQ4pn0B4er+4GEfJ6sBn4byOfyIXFJcVX27nFEnEsLv9XhUSo5mx0uzcLjFqAl6sZxIMGboRoFAZ/gTARNKtU4pGZa5SdtwX1WOc3hwgUGBxx/fnILlIkrkiMmZuW3NTONpsUDJG4SrlGuZ/Djt1GOY369QSNlaA3kcNkt3IppH5DXVT200TTeGRr4O0/VrNVAu39jGMv43XjHpZFr7gXhB0NN14rmVJ7BiNS/G6LB2yUHpzN0JuTYqw5IA8lL8VCA3V9IW8DYbpJVc/llSjbgeCZT9B/1BQIUfUV8cHAVRxhfAVb365MKesOuWLfJhmbzhtXYAGMrHWKG4vzlaSIJ0g5NVkjL0eq2UTHDcHZZfqK4AZH+s6Fex+Jbpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T01aQ3FrNU0xclIvOFo0OStiSGMySHB1QThWU21MOXJVR0h0em1WYjNWV2ZG?=
 =?utf-8?B?WGVNN3NianNlOTB2Q3NCaGtnNW13d3pzNmpUWWFIR2RqazkyQnZzTTFWeERR?=
 =?utf-8?B?b0FwZ29VZ3FGS2doZXZGMGVVVFFreTY2Y0luVjZjWWptcWhwcGtWSVpKam1a?=
 =?utf-8?B?a1NkNTU0dkpiZmpKdGJNQnFMcjc1YVYxOGNYdFU2Ly9vTUlyQUgvcW16d0ly?=
 =?utf-8?B?TlkrZGJpRnFmYzljNjJhL0J2ZGtnUyt4SGs5U29JTThkTFE4dWpFMS9Oemdi?=
 =?utf-8?B?SFh3N2hWZ2U1NkZTS0RscWZTRUFJMTBPWThYYjRmR0pySytaTTFrZk11K0tM?=
 =?utf-8?B?Ym5iYVg5bXVKR2EwZnhMRWV4NHdjS1RPVUdSK1ZoQXBIT3J5WGxqMWNZS3hM?=
 =?utf-8?B?aW5Ta3grb1BveVVTNFIwd0ZSbHJmZVZ3bFhPZXdyQnpucFo4RUUyWDFteGo2?=
 =?utf-8?B?ekEvVkhUMmpaaXR1bzliTy9BTVlDZDF6MkhTZ1Q2R0dHdjVwUHh1MkRKRWFi?=
 =?utf-8?B?UmZENnMwd3piWGRrVWQ4NlZTb2ZXQmR6aFY0OFBqRS9pWGd6Wi9KOFVYTy90?=
 =?utf-8?B?enV5a0VvMzJ5NDlZT3lNdGt2VEtmNDExT2xZeURac3h0Qi92OVQrdFFoSEFp?=
 =?utf-8?B?dTRUTkxGUHNCOTk1OW1JNi9HbkxVSlFUd3M4TG5DY2pESVFoUXFScGk5RVc3?=
 =?utf-8?B?aFN6bUxlSmZuYy9IN1RCNll1ODJMaENHYy9ybjNkci9pRXl3Szl5TGRKSmY4?=
 =?utf-8?B?cVkrdzYxYi9KN0FpK1FHaDM1cHI3TW5kRXcyYVh3WUtHdHN3ZjN6SUpwZmhI?=
 =?utf-8?B?cGhwNGlmSmxUamRxdjY2YUxpSjREYUYzQVJWWW9Zd2N3NThzem5xaG5IMi8r?=
 =?utf-8?B?d2FvcUFhVXQrZTVFWTJSM0RxN3FjVHFiMjRiT0RrQU1mbG1VYjV0Y2k2YWxP?=
 =?utf-8?B?c1lzRUVBWCtkbTJMQ3FzRUkzejFwbFFmVHJwTmVoNlZtdUptKzRsVTJyQmZ2?=
 =?utf-8?B?dzl0MnVqbU5KMWVva3RVZHBYZk84dnhxcmpyQm82Q0t3cCsrbVBxSWNIQm84?=
 =?utf-8?B?NExwZDB6YjZzZk9NZDZEUTA2N3V1RGlVSEZiR1BBKy9OSGdPZ202ejVta2tJ?=
 =?utf-8?B?TU1jbkgzTW8vTHVIWE9pR3RSOTJXR2x0Rzh1bnp6ZVFtMk1nbFhJTi9TWldh?=
 =?utf-8?B?d09FU1JCNDZsWkFkeGNjaStlc2ttZWY2TExCRU5YblhJNEpHdFVyOVAyZExh?=
 =?utf-8?B?S21YcEdHTVFoelRnQlNGR0tYaml3cnBpUTFnMllUQ0RUajNtTERIVzV2bUtv?=
 =?utf-8?B?U3lmazN2YlcvbVpLTXQyK0VKNnY3MFJVTFZGa2Q0K2RmQ1ZIV2lDLzgrTHo2?=
 =?utf-8?B?VDY3MWdabVZQL3lTU1ZXNjJGQUVKQjY5U2I2VmI2MFgzV3ErY0ZOYzljVXRB?=
 =?utf-8?B?ay9yUEdZa2Q3SC92ZHBhaGtrelo5ZG5USnhyV1FVV1JMdWNZZE9yTlBjWWQ5?=
 =?utf-8?B?VVd1WWZvWEwySDZMTHIrV2kzZnI1RFFrMTEycGRnU2hMRUNlNSt1TVh0RWh3?=
 =?utf-8?B?OEYrMXZvYlNDaGl2UmN4NThoS0g4Q1JsUHFsS3RpY1BXQU5yQUZiUnl4NnN0?=
 =?utf-8?B?Wmc5V2hQR3lyV3NqVUpZWHBvSXhXanFZTHBxODBvSlgrUXEzS1d2MzFhRWtp?=
 =?utf-8?B?TVUwTzk5ZE1tamJ2UFdhbTMyQk5ZUllQVVNneFgxUkV3bjM0UmJXMlNFSjlq?=
 =?utf-8?B?MldkRHI2MUJWd05vMEx3d2NOK0ErMjd3bk93NlNQeE5SMEFhMlY4Vy9JR1dz?=
 =?utf-8?B?NHJZQzI5SFdZMDM2bHl1VkszbTF4eURTY0UvT0dySUdhcDRzVFVPcWRSeEFu?=
 =?utf-8?B?UnUvTzlCR29ETjNHR2hCbCtiaHlkMmdqT2ZINzQ4ZllpZk1Ob01ORURMMy9u?=
 =?utf-8?B?enFIR3ZNaitQQktOMDRzUjYvUzdLUWw1WWQ2OFJGbTRqZkFsOTJmZ0Z3RDVh?=
 =?utf-8?B?SEM4RFZIUnd1c0Nhd0NMeFlaSXRyOTZYMzZ3SndLS2NDRGRpUjlqMG5UQVJt?=
 =?utf-8?B?QkNMbmhVaEtjaUVXUHlMV2U3UncwcFl6RVVXWG9CQ0hNMTlTay9hUi9ZR2xl?=
 =?utf-8?B?ZlB1Sk9OcG9LQ0ZmUjYzSk9VNWgxbU8vWmIyUkh1c2h6Zk0xSDYxU0d2MXBi?=
 =?utf-8?B?Y0QxVkpQVWpXdm9XUFQ1TWgyWUtDKzl5WmV5RFdzQTJoeWxQeXpxUVF0NGJ5?=
 =?utf-8?B?R0V6RnlSb2JhdjYzT1AyMkppVFdLRFU2RFhUd1VGbFhjWUJ6SFNzMnZPRDZH?=
 =?utf-8?B?U01STy9JdXlNcXVubVJyQjhoakpvM2d5cXZoTlN6Z3ZhL2l2cDc2WnN2YVhB?=
 =?utf-8?Q?JPriNICKaOye3QBWvPm48taHyWI5OpQHIUYPVljwbrJU+?=
X-MS-Exchange-AntiSpam-MessageData-1: ZBOgmLvdGrnczg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9977eac9-935d-495c-f855-08de7aca4789
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:17:20.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XykTcFSBV9fsqbCLNZo+2inxZQLWgnijqGnDy62Uk+fRnTxrQaRH7i3Ayql6D9ePdgQ0fikjZDUzFqkJ0ai7cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7974

On Thu Mar 5, 2026 at 11:05 PM JST, Gary Guo wrote:
> On Thu Mar 5, 2026 at 1:59 PM GMT, Alexandre Courbot wrote:
>> On Thu Mar 5, 2026 at 9:28 PM JST, Gary Guo wrote:
>>>>
>>>>   const TEST_ALIGN: usize =3D const_align_up::<256, 10>();
>>>>
>>>> This uses purely const asserts, but you have to work with two `usize`
>>>> arguments. The version below looks a bit nicer as it leverages the
>>>> power-of-two invariant of `Alignment`:
>>>>
>>>>   impl Alignment {
>>>>       const fn const_align_up(self, value: usize) -> usize {
>>>>           build_assert!(value <=3D usize::MAX - !self.mask());
>>>>
>>>>           (value + !self.mask()) & self.mask()
>>>>       }
>>>
>>> This is fine, too, although I think just returning an `Option` and ask =
user to
>>> unwrap it in const eval is better.
>>
>> Why? Aren't unwraps something we want to avoid?
>>
>> We already have fallible methods for non-const contexts, so why give
>> another method that essentially behaves the same when we want to use it
>> in scenarios where we know the result will be successful anyway?
>
> Unwrap is only bad when it can panic. It's not an issue for things that i=
s
> apparently const eval only, e.g. inside `const {}` or `const FOO: Bar =3D=
 baz`.

If we go that route we are just providing const versions of the
`align_up` methods of `Alignable`. Why not, but it looks very redundant
to me.
