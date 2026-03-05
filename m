Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D420ED;
	Thu,  5 Mar 2026 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674321; cv=fail; b=a4ad0YpETZsAv+10mZ2KrMEQ2zlPRd0IcUGYG3ytYRKnNrJP66j/6FWmWtgC2WnaQo203i1wISBgT5NHJkd8848cECKTbIPrdLQD5sYwzsWD1JYE0Sctcm3m2D1SAN7ylx37xs5/mv/2xzD2qKX6b6mlU0YLTJaZT8UTk/EvIpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674321; c=relaxed/simple;
	bh=ALn3XFzH2nyEjYvKD4bqQOcUQ1TmBbfp2ttl6lctX0E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UYKhjKiggPIx5WtJpZWEkeYH/8pu5UHcPWxNH63li2UkTlsbnlO5jKaujVIRmjrnkvvfWFAz4AvHwYmSZ1mrVhF/zhwgMJbI1oqPytoKpv6UkVT7NcqV+CudbODEBfmvdyCh0bqA+mN5GpTmFo18jABxuBpgPAJ8FCrP31fwH8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JPok0T5N; arc=fail smtp.client-ip=52.101.48.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JPok0T5N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCTznO1I4g9Rxh0YuzOZlGuaIF2HNo3sZNGHfgMsVNxaQHEtxfH7Vqjf2/AtHCOACeTsVKc5hD13zf9iiY8fNDJCaQaiIZRz7nqA92yZTTonLSX7hOQO+aa9T7kyHPBKTXelebk1EQLiPLOh3A419QCQBxoh6zmoa5IbzRaXdLOiLtnVwgbI8E6ix+rxRWHWaqsGInXSce8KV7QHZFt4tn2aTOXFaQXOtYRuUUP5nU1MsRkA6w0wSZPUQd8g6c4U22bQlB6MsvggTtmqoIsdIlrloY+0dQl7uTb5kn3IwNMJk5SN/NUx+xcznXSTAqljf3kgYAx4GrJvSfvmy/JXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NdIURIKp7RIeANwOuN8+e6He0Vc73gmooBBe/fRgkM=;
 b=mN9RdaHBR68Uoru1gW1J1Npe0qQGsZba5Hi5K93EL+GqkSMMAD7skZ4qjID5Bce1sMf/B14VIYVdietQ9G2xHbEyuCg91f3fC/R0sfhp9CmFs8H8uCFex7leFbX6oSrxCDCyC2RjZjIcP1mwoYeMbCCET1eMBiXhD3c+T3AzCjkrk1aJwZC6gTc3VC5ZDMOXVV0DhbIHYT6Hvk5yLIN0NSgV6i+MvwNQ3ki8lfX4lDyu2zfQPZNjT65dNm3kvPww7rXq5XRxdeU1opJ2zyPC8ZP6J7+XSFdoQwhfCQKhPp50cV4iBVEaQ95z7YJY1y1ugLBzp3uI7MZ06cnlRN4Lgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NdIURIKp7RIeANwOuN8+e6He0Vc73gmooBBe/fRgkM=;
 b=JPok0T5N1GbMcK+r1wZoJVP0gM5BsdcEzQEBsiyI2OT7/9V0tb2q742j3c882+2bwfSLbPHJurVNjwDkHNArn7YSWasaz8RhJzTuR9H2bCzQ7ihVhOeRJ8Q3nucJFHGxpNCz/R6LqMKroPsttt9j0PmjIAvvEXzh/ZEXArjQp78IWQUha3xMT64of6XuUsK+bT06zK+0HI1XrlHmEyyC3FevJDZYKYygb9qiizmQIKkAj+AUF6XWH0UBin5GiviGg0zg7Aj7i2VKNhK0JjJ241OrX9XKKYKUyJ6Nn696jOAFNS6kiGgeisOHTiijYW8q3sazZHjVx2w6S/K0/kJ+oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Thu, 5 Mar 2026 01:31:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 01:31:55 +0000
Message-ID: <22041c9e-1eda-4273-b5be-6f277dec4a4c@nvidia.com>
Date: Wed, 4 Mar 2026 17:31:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
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
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGUGFGFA7FVJ.297YIFEBLO3SH@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: ec825541-ac37-4a12-afaa-08de7a56fc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	W8JP27/MS3/p5SGEx3sIYgvfHmKbUlbYMdI811xavjBJVxJ8EYhJSm+tkcJ0pj3AKH7DiiWpp9hpXspWUwJGoOFfHk9wjzw4+Wb+nRylcW7j5MjcV4CTg6xFdSEbQpkmxx83l/q5Y0Qm47ywHQC49pTHjw4+2DIHgys92HN2Lc3y1uA2V5ak+esUb1ALUiC/gy0BuNgCQGqQ/wHbZFdm3U2QwYj2bRL3cSP0eMoNV+J5vkj/1RMVVyGa5uhfRI2farSYWs4r2xLcEgnXXK5mFXMO/2aJ/Z0F9u1XRFER4nvbKgyYW/4Fv1y+imt397Zx87tfkDbPJb+kAZ3RTQTqmxHsZwTUk6nMQcYMSKAPl8m1E5jdkNqKNtNvKjaC0W2mmVkr7Rso7M5Lm0R8P/mcfO6+Qn8lZ2ocZBNc95lgbB0uVyjIIK3/s2eGQ/Z6Fl7GOhwoGbZG5OzyeqG0HFDpdgmjHpaWD2USYPjQtULwVxsgV5izL90T88wn4nY8KSycXLnxwHzEc53/5z1s9Bc4El1ZCzuwNFok/6GRlSWqUdd8TkJP1QKuKt8PAOA/uSDVj8kfj+0IrsUm4dNqeEgSQDT0o5eAdYbGRWggqKGHHF/VuyELxVDQzQb/LddJRXlnL9X8xwY3FH4uUsenGNya/e+igQ4kXBAVHLfdW3qFjdDXFHu1qFI6EZk/Z5+UDGbjaMbWX/DXhF+0A+33cblgFOvKvaDSlW2I5fz5/U+/c78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFJrYkZBZGhKazNOMDBvNnB4M0tINmYxNVhoMGczSkhWSmtVTWZLdWcvNGxY?=
 =?utf-8?B?OW1RNmlnbVNiaTdYdW1zdDJzTGZTNlhmU2pXd1o1d00rSUNBeUgvdVRROXEv?=
 =?utf-8?B?RG5VZ2p6cFRKd21OMFQ1clVhWXFZQ1lxenJCcW1lQUlXdW82dmFvMG0ydGdx?=
 =?utf-8?B?T1lvMWVYUy95U1hpVFdzcTdpemNXbGZ1RjBXc0ZyU3o5eDh0eEUvZVNIRjU4?=
 =?utf-8?B?NDFzMFFIVlNuKzM4MXJjRmUycVh6UjRuTUN5Z05LRDlveTBDMGdhNmxRcjc4?=
 =?utf-8?B?dmZBMVdQL2doeThsUkZ5YWRUWkIwMkk3c29YZG05TmtCTFd4SWlQRkNIclcr?=
 =?utf-8?B?eUFOZklVWURkN3BhWDNBdVhmR2liYmlJMlhDUG5iYXgzYTNpR05DNkd2Q3Vm?=
 =?utf-8?B?ME5xUTJ2MGpYYmFkWUdIbzl0RVNMWnI3c0NobkZrUVplaHBmaTRNeGFDa1E4?=
 =?utf-8?B?V0VLcFVnZElrZ1l0OUJja2dwV1ozczRFTEVEbzd2MkpSTHVJbzdUR1JPME0v?=
 =?utf-8?B?ZTY0Um9BTXFXMVU0Y0k0K2huaWtOVzJkUFlLOGdibXRSZ2I5M0JSeldidG1S?=
 =?utf-8?B?QVRrY016TW82VnE4blJDT1JSWjBsZE5XdUpUQ2xmMUJlaEsrY3RnN3cvbjdM?=
 =?utf-8?B?eklBMitvbGxWOEovYUJLblFncU9OR2o2QkhENVVMSVQwbllOQjlNOG5WL1BP?=
 =?utf-8?B?OEpTM2NETHdwVUVxd1ZDVFY5SVdhTG4xSHlOdWZVNzR5Q09DZzlrd2VRWmVO?=
 =?utf-8?B?NFlWQlk1YUNpbzNuckl4RkJtWnBlVnZFd2NibjJaenJ3a2M1RGNOaVd5VmtB?=
 =?utf-8?B?N1Z0ODlTazdkcTMzeHREbVFFeDJoekY4MVdaRHlid2QyM0c3ei9YRUorSUwv?=
 =?utf-8?B?eWpYbmtFOU56OUpmb1dlejdxb096ZlhkYkVNRGQyam9qUGQxZW0yb0ROZkFs?=
 =?utf-8?B?SFhkd1RwVGVKVXVVZWxaOFk4NzdjaURKelpsa21tT2I1R05LaHhZOUhkd0Jz?=
 =?utf-8?B?WEoybjRKOHJJZHBWbE4yanhzbnZFeGVOdEc0L1BpNVMvRlBuZ1VRU2lZY3Nx?=
 =?utf-8?B?R1ArUUlYc0FZZ0ExNzlpaUVRYTcxYXYyamVKM0Y2S2czbTNzblFUTnpxbE9a?=
 =?utf-8?B?anM3MU5LQThEY2RuUWtKVG11YjY5OWpLM2FiY091Lzdxb254TlVadjNoWE1X?=
 =?utf-8?B?ZkhDYjdzUVJyVllWTVFPQVB2bnVhWlkzMVNLSlZyZnFGb3d5em42WEpRbEVI?=
 =?utf-8?B?UmhrcmVkaFhvd3hPTDV1RUZ3eWdROWZoS3JqVDNNV2d2WEU1Z1NVUVpPN29N?=
 =?utf-8?B?MVZCTVhkOFJCaTRJdWVMYVAyNVNGa2tqMUtXenZ0SklBeU1GNlFhSzdJc0d5?=
 =?utf-8?B?Z3QzWVg1Q3FYU1NtcDZpUzRuWmE3SElMZ0pVaHNkU2E4WDE0N005WEs3alR5?=
 =?utf-8?B?VWFzMXRvdzUvSHBSeHp5bitJaFA1SHhUeU5WZ0NidHY1WlJ4RzdTdWc5TklG?=
 =?utf-8?B?MWJBd2tEMEtSQXVWUWFBVTIxeThNVExJVFBwdjFISVU4U1liSG9kWVduODdu?=
 =?utf-8?B?Sk1Vb0QwOThFSEhBclFNcVlZQytHL3U3cDFRZlNXRVlCNDNoNFNQd04zL2ov?=
 =?utf-8?B?bzc2d2htSnFqUzJQbFpkb0RTREVIL0dqbjYrUEl5VE11aWs3ZFRRSU5WMURP?=
 =?utf-8?B?VU1VbWdhdFAzYUZXUDNBVW5FU2ZhU3NibEZNYlJUWHJYK3RYRGplaDV0WHBC?=
 =?utf-8?B?ZXN6ZW9zK0dCa2I2a2hNTzRuZ0prLzAxRTZnNS9melM0OEQzdTZ3NVBiUG9M?=
 =?utf-8?B?a2pobEg2RDljZWpTWWl4M0c0NjQ3L0kzU3phTHpNYWJuSGUrTFMyK3FsNmdS?=
 =?utf-8?B?UUVHMUVFeHY0YVhTalBMR1c5SUVJT2xvVjdSdks3Q2o2M2FoQWhhQzJlWXA0?=
 =?utf-8?B?Vlk5cHJpMDJqaEVpY3dsTE10dEpQTUZyWEtTOE5qYlhZOVdVT1NIaDZsMGFj?=
 =?utf-8?B?UXFSWk9jR09lV29xUitFNlU3aGIwbW54dnpsREEzSGlvbUZvSzVXbER5UVAz?=
 =?utf-8?B?aGdDbWpWQWJVOWdxUzMvWHNnVENQNWtpM3pQSW5YRUhpQ0crdzBwRjVDdUdu?=
 =?utf-8?B?TmJydFlTbkpyZzRKMmFZQWpLd3ByK0lrS1hNc0srejRmNWFUMWlicG9GM3RJ?=
 =?utf-8?B?aVBwRUtTQmUxZHZSeGpmcnE0bE1FKzcwQzJVWnl5aFM2c1NxUzJwalBlaWx3?=
 =?utf-8?B?T3FIUmNXZEl2VW11RnZVM0prcGV6QUltajR0RmFmcjMzWUl4WDFPSHR2U0Rt?=
 =?utf-8?B?ZTdJOEd4bnEyUXQ5SUloaTdEL3hBUWFTdjN2Qk5JTTBFejRveVNFZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec825541-ac37-4a12-afaa-08de7a56fc66
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:31:55.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /T9gRRp8ojp3szgWDclYkx1QgAUQX97Jd/TtgLBHVwwKI4Zb+F48A6IOa97076De9PRR3vKJR0l8pgOEykYTHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213

On 3/4/26 5:23 PM, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 4:14 AM JST, John Hubbard wrote:
>> On 3/4/26 11:04 AM, Gary Guo wrote:
>>> On Wed Mar 4, 2026 at 6:53 PM GMT, John Hubbard wrote:
>>>> On 3/4/26 3:18 AM, Gary Guo wrote:
>>>>> On Wed Mar 4, 2026 at 3:47 AM GMT, John Hubbard wrote:
>>>> ...
>>>> +#[inline(always)]
>>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> Option<usize> {
>>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
>>>> +    match value.checked_add(ALIGN - 1) {
>>>> +        Some(v) => Some(v & !(ALIGN - 1)),
>>>> +        None => None,
>>>> +    }
>>>> +}
>>>
>>> I think your signature should probably just be
>>>
>>> pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize> {
>>>     ...
>>> }
>>>
>>
>> OK yes that's a bit nicer. I've done that for v6, thanks!
> 
> Hold on a bit - if we are purposing this new method for use in const
> contexts, what use do we have for a `None` return value? By definition
> we would know both `value` and `align` and thus the result is
> deterministic.
> 
> We do have an alignment method for non-const contexts already. Gary's
> initial comment was:
> 
>> Either this function is always used in const context, in which case
>> you take `ALIGN` as normal function parameter and use `build_assert` and
>> `build_error`
> 
> So why not make both arguments generic in this new method, and fail at
> build in case of overflow? 

At this point, it is completely impossible to write a patch that complies
with Gary, Danilo, and Alex. It's all over the map.

Here's what is staged in v6 so far. I don't care anymore what we end up
with, but let's pick something:

Author: John Hubbard <jhubbard@nvidia.com>
Date:   Thu Feb 19 14:44:02 2026 -0800

    rust: ptr: add const_align_up()
    
    Add const_align_up() to kernel::ptr as the const-compatible equivalent
    of Alignable::align_up().
    
    Suggested-by: Danilo Krummrich <dakr@kernel.org>
    Suggested-by: Gary Guo <gary@garyguo.net>
    Suggested-by: Miguel Ojeda <ojeda@kernel.org>
    Signed-off-by: John Hubbard <jhubbard@nvidia.com>

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fe..1e15aac4faca 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -225,3 +225,27 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Aligns `value` up to `align`.
+///
+/// This is the const-compatible equivalent of [`Alignable::align_up`].
+///
+/// Returns [`None`] on overflow.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::ptr::{const_align_up, Alignment};
+/// use kernel::sizes::SZ_4K;
+///
+/// assert_eq!(const_align_up(0x4f, Alignment::new::<16>()), Some(0x50));
+/// assert_eq!(const_align_up(0x40, Alignment::new::<16>()), Some(0x40));
+/// assert_eq!(const_align_up(1, Alignment::new::<SZ_4K>()), Some(SZ_4K));
+/// ```
+#[inline(always)]
+pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize> {
+    match value.checked_add(align.as_usize() - 1) {
+        Some(v) => Some(v & align.mask()),
+        None => None,
+    }
+}



thanks,
-- 
John Hubbard

