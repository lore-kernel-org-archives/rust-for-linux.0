Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020114.outbound.protection.outlook.com [52.101.195.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A615378D8D;
	Sat,  6 Jun 2026 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748552; cv=fail; b=pPssRlsaGr2ypVu1NdoHREaAnGMgVUcaBbecfUQiLaiHZYGo0XXn0R2AoHffHkEDs0xlKRccqVu9CFfxgnnCqn61CfdgWuCATdCEf4zBtppP0yjDCLgW2xYgheUDWrZhsa5oocPiDh2jEIaZSUj+YRWPS8TI4ast7fXK52VMtig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748552; c=relaxed/simple;
	bh=Zc8fJvEIiTUxWdA6koF/+mqUZe7e79AvosKGJEVzSNE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=twisdCc07HEtEi8fggFw2dpMPpWk0eQnbvMf6r8Rf36bKXXVPoyN5iMBRngf00BdDIjZc4W1jYz6vHbcJq1Y+VmFsa23cs2TwM7kOcvWlszDkpRlVsT5t9TkJfGdq2yZd5c0za4YcSConQDb4wmE5J5anpv82Fa4wEBGtx72ZC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QY7DAD5w; arc=fail smtp.client-ip=52.101.195.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QY7DAD5w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbjoMEiYs4wOhbqLl1+bAjkZjl8unpjbyegsjiQ132NB9GVMAiqTm/0h/VlJQrmAAFGBdExyAYh0T1VPFQeNeofOdBAEjDN5O5xzDh8snBJEPT0KUUVs/Z72MYgWINED6E0jfMGXjArwCv/8r0jyxKLPsJpBJbanth6tFQ0TCC5f8+lQF+v6s9nLDcM2xUDOntHjvodPA2Uhu6xcsMPReeIEwADtH+3x9Uc7KQza2YRxZYgmSQ3SEo977qq9OdApX4/D4pPPeWQV77dpLB72s6h1rCOD56ZYEVO5nv+DYtPEuz/QeSS/nRd+ZkPPM2tqlX4PhBWiFo3fVsRSPoQIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khCzuvKM+7o0PD4VwIziHV4RHl3I6CVFnWGQDMckBDU=;
 b=s3RLRbvSOjz+eVM9YpvvpBiCsTz0Eh0HQrHI1CLtEqvOxzsiYXOpgx+mWIr8xwXysVTF09yGKaJrfzNq25NF7WkWWj59D10MINpqHuHuFXUSN4e/1YiKzQND3UoLJePoGmcOheDFsk2dsb8q3ee7IZ5FSRs+18DBC3cEBVUPAZKSQMhe3I3T+in1qP/2Ynf7J1qr1MhURYVtP2uPkFBy57X/CTlRNcCGoS1U4NW3w+02Xv/uSsYruu6Y4WODo/uD47dlA29FC63G3Bf+IYqLMZx7mJuLjtNTAsE4hXHlScVoBkRsxvMXE686Hjy+s/Oq4M1Lz1oS2wNgCT9LjjhHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khCzuvKM+7o0PD4VwIziHV4RHl3I6CVFnWGQDMckBDU=;
 b=QY7DAD5wfWgNFt9pTwNzc6xX9up2NlexqL2w4KssceaYxRgXb+YcX7woAqjz6kcElz76ylQKMkOWgJmiK1+IxpTYR9Y6/AnqpDvwDEP31Bqxvl8nv+EuMZFWzMUMbRI7+bNHLnTELwH45m7M06djJ9GQAROXAv9rz8nYl6kjFUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6506.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sat, 6 Jun 2026
 12:22:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.010; Sat, 6 Jun 2026
 12:22:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Jun 2026 13:22:26 +0100
Message-Id: <DJ1YOCK6GQLK.2B3X2OMI93JMM@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: impl_flags: add method to return underlying
 integer
X-Mailer: aerc 0.21.0
References: <20260605-impl-flags-inner-v2-1-ad1ff3f7ad2b@kernel.org>
 <CANiq72nKtrhU0ccpS9h+s+Li6eQtQWD-Npd72zih54e6+aepDw@mail.gmail.com>
In-Reply-To: <CANiq72nKtrhU0ccpS9h+s+Li6eQtQWD-Npd72zih54e6+aepDw@mail.gmail.com>
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 95df4aad-1ee7-4cd5-000e-08dec3c64536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|22082099003|18002099003|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pn5+b+0eRuc3G/l+eR/oKnJDGH9FfnEDooJJ4sZz4v+GjzX5hxUM0i17cghBYEroioD0qDBImCoEUwCqa56ugjuTIc3EEGQxfV7yl7rU6TOfQ7cWmUXb5iT8iMOMKM068/2qv7hL2SxADiFzzCr1ld8/wZ+LSi7Xo5NVmeSwhMk8Bf6gFNPPX/LuZMQH4pQo+4utxiFuqbztAVnzfb/O4WHnpi25SF4kARWQnt79dvMdoOk1jC8K6ZvKeX7O11j98RMV85vbrE3dWygey9DA80hYOgF93Kog5A2xxrDqm3Vq5bQ9MuHntJ7ifhKHGtCAm11zx8k8znVjc7nBjUy4ZFvMxPy5CQbX5mpJX4rK8U+s/AZDCVYMaCaQKrP37MTPZ99N+SS8d1l+Bs4uud1Vhx73jnJy1up9h8dHIdLAxNg9sM85eOFM09OJp9KnJ7TQUn4Gep005x5vTahBlUfPi1y6wIKBkh6IrdQIALTMT5+XrbKXfQOeMWFhTi7Ycu9VsB8S5iRFVgbkXMCwmQiKvC7eMYn2AGRtMRGZKFQQmiPXqy9ZxVLlC7AK2ATLZxyGjB2p57HfUJDw85Hgv5zT48DMVjQLofMB4TumocqLv6gb83SU9xby70m/nl96+ktJ7WI5nrIRztRPjwxlWSTUjjEisQndLSeT5SjgqdwzhRUhw3HMdsV5oOUL0NNupQh3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(22082099003)(18002099003)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGx1UlY3SWV5bXNwUlc5WHgrM2VNNW1KQVpUZE5oQlhwWWtNRVFqNkZML3NF?=
 =?utf-8?B?TEFTb3ZvM0I1TU1LYkpmQkFlYlFhdXVsV1R3cDN5QWVrTStCOUtPcGxzSmRO?=
 =?utf-8?B?RGtWM25nenR2QWpDeVVKc1JwaHpXYnNIREhvVXZqZ0NyTzArRTNZcXJZRFRV?=
 =?utf-8?B?MVN0R3d0REhGQURXSVA3ODhxajcxY0Q3TFRCcVhSOHI0c0UyWGxSVEJDOWtT?=
 =?utf-8?B?Y3RDZFFpZGVzVWd6YWFwcWE0akgvZlBKVElaTmsycGo0NjI4czNvYWlYM0Ri?=
 =?utf-8?B?OHVKWlo5MVlJUi9BdEI0TUdscTBQTklwaVVGdWQrdG5VcGxPWUN4Qk9jcWtZ?=
 =?utf-8?B?cXhrWThRZktHekEwa0lFUDlrYUJYb2FWZVdqS0doT2FjV2dGTG1hTVFSVVd4?=
 =?utf-8?B?cndUU09CZWdQTnlId29BWHR0ZmVBZnJNWmVTS0RpN1lHOFhvNXhaQmYzY0pG?=
 =?utf-8?B?V3Evd1AxSWdkdEtRbWRxa1NOQ1hEdFdVcytyTEgwV2x6ZTV0azc4V0RXU2Uv?=
 =?utf-8?B?VklIM3JtTzEzU0sxRzE3RkJTMW4zMVVLdldGQm1lYUtpV3J2Uyt2VDZCZ2Fr?=
 =?utf-8?B?VEdId3htMElreERIMzI3Qm5INHpaRWpVcHFiRzZiQnBDcVFYc01QZ0J1Z3Vs?=
 =?utf-8?B?bjFDZzFlVXhoNkE2TExST1Q5Yng3b2RaeitlMWdqV2I1b0s5QTZLcVk1SEt2?=
 =?utf-8?B?NlY0ZnVIN3BjU2s2WGRLc0MyWjdWRGFETkV3dFFXQ3k4dUNIUVF1MjBUM1kw?=
 =?utf-8?B?VXpPMzg4bUJwV0RRWk83TW9vdGlQVEtZQUdVMUYyZnpPTWt0RDBlb1JKeVly?=
 =?utf-8?B?N2hnNmlBNnJqa0ZLcGUrZEVnNmZhakNSL1hHTGU2RVJWMVp2NjlFL2E1bVlC?=
 =?utf-8?B?YUFVYS95TDBSWklBQW9mT2ZDektEckYzMDczTkZjWUNtSisrZlJQL2FiZ1R2?=
 =?utf-8?B?R1hBS1RSQkp6NXBoQ1dPMHQ1akRYVzNxR3NyaUM0SVZhY2VZSERRcjBONHVS?=
 =?utf-8?B?aE5oR1hqN1hFT09NZG1YVDNvc2RTVGtGZUdPbGlSYnFmcFdxbS9jRENqeDRz?=
 =?utf-8?B?ZVZReUEwLzRHZitJMkp2TkxScXlxWWlqRjh2RDUwbmh4alhnNHR4ci8rMEZi?=
 =?utf-8?B?QVQ0QU5Jdlk2c3RTU1RXb1FoSkRrTkw2YTcyandRMDllUzlFZWd4Smh1UWty?=
 =?utf-8?B?TmhYSEI3ZThEWXVQVnpScjMvTFZzY3ByTXF6VjBNTXBYbzdtNHRkVExQV0Vo?=
 =?utf-8?B?VGpOb2FiNUtnVmRVQjI2WFcwYjBlQUNnOUswY1hIbUp6Z3NHemZvNmo4RGFV?=
 =?utf-8?B?YUNVMEorNEg3WWlJMVR2YWNJOFNNOGNuZDlpVWtLYWZrWjBiL3JkUmRnNTB1?=
 =?utf-8?B?VXRFTWxCMzFQNlNrNWxHcnNIUVQzb2xOSXpyQTZ0bnRvTVc5bHhMVG5Ba1dD?=
 =?utf-8?B?WkV4bEFNcTRpd2IxWXhUVHN6OEVIcTA0NGljQ282ZmRmZU9reUhuVXROYzN4?=
 =?utf-8?B?eWVQWHIwSkdNVlR4WW40ZjZ6WDZ0MzNFbUdCb0h5RjNJWHhTZUs5aXh0MEcr?=
 =?utf-8?B?bTJjWnlDOGtPdUl4YUNCK2crRHk2bEV2RWhCcUNpbVVoNmd1MVV4SWJoQXFa?=
 =?utf-8?B?Z0xUZ0ZMU1h6K2NJeHpQckJEV0tiL3l1M3hBU0YyNEsxdE5qSkEzTHVQdU9m?=
 =?utf-8?B?R2cwcUQ2YlVLSzZmQXFuYlBjdFVBWTdDTDVpSkUvQkJSTEZTREI4dEJKWWtl?=
 =?utf-8?B?ei85Si9vaU9QMnhoU0pLQW5Xc3NQWkJEZEV4YXJ2Q0w3OXNOM2tPUjh3WS9Y?=
 =?utf-8?B?enlvR2dNQ2hFRFQ5dWNod0RSeEtPK2lrQnE3NnRYNk1OTWRqSFZWUzN5Tmky?=
 =?utf-8?B?RUhQTmdkeUJIeXNRRzlScWQ2dTk1ZXlBZlViMlRLejJWN0lGZ3lBcFhIZkJv?=
 =?utf-8?B?SzdOaTFpeVVVby95VkNtU3Y0Uis0ekRjWWRva3ZCSlhlQ3cxVVJkZG5PbnFH?=
 =?utf-8?B?WUhQNnNETTE4bkp0K1FhT1lTVlhxeEI4enN4aWtTdjg4czF5cWduZzRvak5F?=
 =?utf-8?B?VGQ1RUcrR2Z1M3p1MFQwb25Jb2FLREZpY1lTcHdkaTNPcXpRQU9ncjZ3b09r?=
 =?utf-8?B?YWk5Y1AyQzFRZEU4NG5LREs4dW96SjZGeWRTNitPLzRVajM4NC9jSDF2OHlq?=
 =?utf-8?B?bCs5Mk9MazFNRmMzeXBqZHVLWmtkTlNwemRIU2ltSnU3OU82NW1UcmdiRnFH?=
 =?utf-8?B?d2NOY0txcEhnODQzanhtMHUvNjlyY01YcytpREMwNUJ1NWFSRGwrRDY0eDlI?=
 =?utf-8?B?aWtBem5hMHJrdVpaUGNmWlZhYmtCeW9Hdi9SYjBBKzlqZUF5a1k1dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 95df4aad-1ee7-4cd5-000e-08dec3c64536
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 12:22:26.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUTLmYLNILhlxtDx4yyvICad0bza98vO6WfdQ/8b/TADAriCFsKgt6jeRwZsC03ycxFvt2FanJR1mb7DG5Waqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6506

On Sat Jun 6, 2026 at 12:01 AM BST, Miguel Ojeda wrote:
> On Fri, Jun 5, 2026 at 12:55=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> +/// An optional visibility specifier in the inner-field position of the
>> +/// bitmask struct controls the visibility of the generated `bits`
>> +/// accessor. Declare it `pub` (e.g., `pub struct Permissions(pub u32)`=
)
>> +/// to expose the raw integer outside the defining module =E2=80=94 use=
ful when
>> +/// passing the value to C APIs. Omit it to keep `bits` private.
>
> Hmm... It is clever, but it can be quite confusing. Could we use some
> other way of "tagging" it?
>
> I would also put `()` in `bits`, and make it a intra-doc links, to
> make it extra clear it is the method we are talking about here.
>
> And why do we call this "private", given the `From` as Sashiko points out=
?

I think I suggested this approach because I don't want people to be able to
easily be able to get integers while enums could be used. But I didn't know=
 that
the `From` impl already exists for flags.

Given the case we could probably just unconditionally expose the `bits` met=
hod
(and whatever mechanism we use to avoid exposing bits would also remove the
From/TryFrom/bits/all_bits/...)

Best,
Gary

>
> i.e. your example works if you do (without the patch):
>
>     /// let raw: u32 =3D read_only.into();
>     /// assert_eq!(raw, Permission::Read as u32);
>
>>  ///     /// Represents multiple permissions.
>>  ///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
>> -///     pub struct Permissions(u32);
>> +///     pub struct Permissions(pub u32);
>
> I would prefer if we had separate examples for "optional features"
> like this; otherwise, people may think this is the "common" way of
> doing it -- and I assume in cases like this we want users to avoid
> exposing if not needed, no?
>
>> +            /// The visibility of this method is controlled by the opti=
onal
>> +            /// visibility specifier in the inner-field position of the
>> +            /// bitmask struct declaration.
>
> I would make this paragraph a comment as Sashiko points out.
>
> Cheers,
> Miguel


