Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75F3A254D;
	Fri, 16 Oct 2026 02:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118244; cv=fail; b=PjZQCDMcIUAYSxDCdoDcf1uyPc9wiMMER72u8bHKD4Qb7UZnM56ofbR34CWRfj534PHcGi+4Wex2zc6mQXUJzGTIM8GfQKMFUrTxpxKw5N6i/q31mMutiy6IIRafiR0awDzrjsPvJMq+VM45YkkLLrygX7tl5zQeRYePQWICu4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118244; c=relaxed/simple;
	bh=Kpk7/uov+tpMrlyviNHmoHuktkEcHdDYPVTA+56d/1k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PIFf6X+TlABRgtMBWHyykxh2yE3QBvPE9sQwklYkFq3OugF3JMWearFS4egoXjlP1gdce8WXZ4+0/d77YP7IdCM94SrbTqgAp8huAXBMAkHXOUxD5FdPXHPkabFFDlV10Q6Dc2SENURd95vtOPgaEmxtC0fnUWR5Iz/odNMD16E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sDl2WMMu; arc=fail smtp.client-ip=40.107.208.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sDl2WMMu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpl0tjMbED6oVWlqWXNTv3r/7EjDKt/7bhMkvv93eh/+l8Saeed+4vsCDXTyMDTfT3zEdcvONJ+6ZWbkrTyA5x+7fhTS5LEOsym1riVE6gLpKnUXWuZqM5nPvqIKU+LmoZsxNFESEUM/ETWkwgW/0J/4Ua2ByiV0hY9hZSiONvz9XoQ/6mZ3jS4lM2OD4A8MzqkUCUnT4VxLnPY8rdN/ZaiaYr+DvLKgWcHO9fH9WdJSUDz2EeB+LIdaoOs/2ybFmHdu3z9Mws2Q06gCdC5EweXFFYcs6juwQ4JW6pgsCTOiOewc42c1Ra2TQAnlW2DYVapmQiafbtkpwaYiTHDw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdEGxcYUmPNY8Tcko97LMZaczb12pGS2QQ7YKiSGY7s=;
 b=UuYhQKUOe2+3CPPTMj/ho49YEowJ+uz+gIIrsooxevP2WCkfF5wrtLXMIzgJ7na77SOQVt+mndFbE9evPHL8NzuBt0sCEx7TEGEdzdzRF9fb2AkxIc0GrKiV9lXBbI/0lgUdzpuwSp3WEouEeTmNV3248r1aXFDpukrK2DE6OGAO4ebSqMcnxrV/8wFqogWUf4BxZdQKwXcnjuD/1yT0XST6w9IFN0sjiKmY5uKpcyqaJhagmpiKAi/DiX0u7kqdpJ1yuUcSKp0JTc8hWuFGUSK04EATIPISQ5wB0U1d9uLyNSEn7AECX3mvHvcv6pZ1e9cbEYbHxngKJhw7iKx7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdEGxcYUmPNY8Tcko97LMZaczb12pGS2QQ7YKiSGY7s=;
 b=sDl2WMMuyWy/gMSjcfb84u6pBBaIatDP7N/bGLE2pr9+U/dbcvrpv3xg4KLR4ztDRaxglwVBVbrkmt32lEkMHHaLWNTCYsABBzHqItKKTzADARFnBOPD8vy6xHoxNKRiWBhfXZGSLm0VTMWpWBoVIF7nZw6XI5KdCtd0n/ZIS5/N3JmUO/4W4edMrByLFFKQzTmsYqegW8+Z9rX7pR0N2bUR70nMyUjjk14lH5Ccoes6lcHmknjXK4imnT4t+8HiLQmeHRx2JpX84IzbNQACVkwiWJFlhr3sNnkP4tSfkFKGQ/lk9t2j1TiGnGRrZub5r4mVqWsN7yTzzLKtpVL78Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SJ1PR12MB6170.namprd12.prod.outlook.com (2603:10b6:a03:45b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Fri, 16 Oct
 2026 02:37:07 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0522.011; Fri, 16 Oct 2026
 02:37:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 11:37:04 +0900
Message-Id: <DM5WW2RYOJ9M.13D3BEFPC92AQ@nvidia.com>
Cc: "Lorenzo Delgado" <lnsdev@proton.me>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 2/2] rust: uaccess: use NonEmpty in strcpy_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-2-4463cc0338f8@proton.me>
 <DM5FNHG3HA25.LXCECF3U879T@nvidia.com>
 <DM5GVHEF9QJJ.3OZP69ZE63RH5@garyguo.net>
In-Reply-To: <DM5GVHEF9QJJ.3OZP69ZE63RH5@garyguo.net>
X-ClientProxiedBy: TY4P286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::19) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SJ1PR12MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ab9fed-2bce-44a5-38d0-08df2b2e5ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|7416014|1800799024|376014|10067099003|22082099003|6133799003|18002099003|4143699003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	Eq7TzjPrGLOJBpp6aSq1hSXy77mgV8iDggHsQJj2453YLsDOEml5cT5RzQGOyfqNxVWaQ3mEaDcctfKL323LyQ4ktP1zZWYLD+k2LJZoDr7fO/vs38p0A7U0DypAUHaYptdr9kCoNqpILjhhxByYnJcHKWAH+dUUDPxgFTBMtpgoQNlpAGr1ajpYq0zGvlj9g1KWkz46RBDDJ4Nn6EC+KHdRwsDreOyhX+2i8xseoaMZzeq6nIjluuVRKL5m56rm1ZtD5wNSyJv7svDngSQGa3Y8/LIJbvIMwmWv9Rs8+cFVer2WSzko+E7hKgsydPUn9gKOBZ4EIi23WCGCtK471Lp+XYst7vTM0FSPI7lggeIhJGTjW3t110aKvKiVx3+zG7LKf7ZOaPJOGhgREUCL+m0KFdw2dsrmMi3r4bVHCuQLGNx68BXDMi6/WDzzbHlbf5HiMY/L7c+mgyjsPqZllw/ssMfiGW3D3CUyvvBev5gmBYYSP5v5ELRcBTGAsgsAkTvqYRYl9LWp91g/pOqD3ELCoyWVCq/5AijZN+lpaOr9YnjaCq2VUCCNIIG+JXGTuqBkpQyrMMukkpp8/AnXAcAgJCMDsHcRPw+qAUEsiABNW9n3rzg1ye521z0wAtVRy9scIeDtKU5d/EwVSrSf9O/jtlnd/cK074oiXq+OCL4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(7416014)(1800799024)(376014)(10067099003)(22082099003)(6133799003)(18002099003)(4143699003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODg0N3hwWVJyaWZjQnhsWXl0OGdFK2ZQY0tQMnY5ejdzUERFWExvNWVERVZE?=
 =?utf-8?B?MXVSclBCZkl4M1ZGeUNLdGlaY0JDdnVCRXFYN09tbkdXZnZMRGNFOVgxWDU0?=
 =?utf-8?B?NTE1QUk1RGdOMVdGRTBkclFHSXdlWmh4U3MyU1NMYjZqWm52YVhNSHRKLzJ0?=
 =?utf-8?B?d3l0RG9WY21hSk1zRzZ1RlZBQ1NjR000MmJWM2lWV3EwMHh3TnFib1lOdGRo?=
 =?utf-8?B?YVFCT3c1aWhCendsS01lV2hXNFlhTjhaU1NaUThadnV6WGV0NThMUGtwZk5L?=
 =?utf-8?B?amhIWm5ob2MrZFVxU1dUd3R5WDVGcXZKUEZyY2I1dk9kR25xN1BTSHVxSXIx?=
 =?utf-8?B?N0lEeWZDbHZKWDVJTzRlRU5pMnQ5emE4b2wxR3ZlQUNiV3NwTkUvaFlXMnFB?=
 =?utf-8?B?T2txeDRLbzdxU0xPYXd3ZFJ3Wjc3czNHbUxyT3RZbGc0SzVEck1hNVg2SUU2?=
 =?utf-8?B?RnJUQmpGT2h2Vnk4R1ZZUGN5WFF0bFRPVEtGVWx2THZGak9ZN0RuUStLSE9O?=
 =?utf-8?B?TEVjb0RIRWh5QmtYQXRJTHBCMnJDNmtJaVNidkhUa1V2M1R5MlVOcjNlajFu?=
 =?utf-8?B?ZzloT0JWWkg3MXlhVjJFYlcyQWlZdlpPdG1vQjFUdHNxQUpyZGFqUi9vRE1L?=
 =?utf-8?B?STVud21oQ1NkUGF6UnlFUzBGekRTVkpTQU9YK3FPdUU4UXgzcVV0NTNjTjV3?=
 =?utf-8?B?dmFqVUNnbUlnTUlzZG1GV2hEV3U1MWwzQzFyTGwxUEpzVEYvcG5qSXVEdElq?=
 =?utf-8?B?dXZ3cWJQQXJicWU4ay9neTY0YWI1QWMxRTRsYzFQVVJhSXN2QlNzaGpEVk43?=
 =?utf-8?B?QXlmT09kWHR5VFN5ZXA1RWt6R3k4TXV6RGdQdUdDNTBEM2EvVkpWRGRNYS9h?=
 =?utf-8?B?MjV3dk9kMjNWRlQzdGhJb3JSTUZIRHZaWEthZkdCbWFFU2g1elYrN0tQM25z?=
 =?utf-8?B?d3lvb2pyQ1R1WmtndG85QmNnNXFTMlNJdTVIQU5zMXIzOUJCWENSclZjQWk1?=
 =?utf-8?B?VTg2UjFHTldKTFJWQkxTOHk3MDFBbVhkbFNGUSs3ZU5heFJFeDVzSmRpbmY3?=
 =?utf-8?B?VmdTQ1NlbkZDVDhQZkI2UGUzQ2kvbGxDQllkVlZ0djkxYjB1cFJLOThTYm1m?=
 =?utf-8?B?Y0RoRExNM1pwWHc2a0dCa3d0Q3l1Rm83N3RQNnZ5Q0l0MGtkNWdocDR3czhV?=
 =?utf-8?B?TWUxNTR2UFB5UkN4QTd1TkNpMlY4b3hvOUVSbDIvNVhIT2JXOExmbzRtaGFJ?=
 =?utf-8?B?NkNLVVRxOXczU082WTFNN0xtelFQMXZLa2Q3QlF5UzBwTlBjdEFZUjNqeVd6?=
 =?utf-8?B?SGUxb2NnZHc5Q0drS2FOR3BaTU1LRnZTNlN3a0RuZWRuL1ZIUmFMbDdYL0Nk?=
 =?utf-8?B?YWVXLzUxNFk5SjArZmFhVUpScGhNMnhtK0hWWE9PUyt4NDVYSkthQUJ2TGNQ?=
 =?utf-8?B?Ry9yQjlCekxUMXhibXo5cEhCNkl6Zk96aXJqT0U2bjdCZXUrMEdROVlXK3Nz?=
 =?utf-8?B?RWFVVE1JaHJodW9yMTAvNU5hTnBiUTB6TG1tMXZPc2xVL3ljL1M3TllaMm9h?=
 =?utf-8?B?RXhLTXAzLzdTRXVHaXV1cjlKSEs3WllaQXM4a2pzQkRmNzJsMjluS3FLLzVB?=
 =?utf-8?B?bVBTQWZlMHhoditsYVdlczJPS0FpVzZvd28vN1pwUDBWbjc2K0Y5QnVQNUd4?=
 =?utf-8?B?MkZOek1pNkRNRTFsK1lDWlpDNWVVOVdpUXM5M3N5VWpjRlBrMXR1KzdBM25R?=
 =?utf-8?B?TmZyV3JHU1pBY3BqR0VvaTc2QXcyK3NwaklOK1hMNG9wM3l5dnV4SUtqTnYy?=
 =?utf-8?B?clZpTm83Um5yNUxJWVZpTVVwVU5TbTRQYmdNNXNBTjZYQmVWdmpYSWgxWU5z?=
 =?utf-8?B?OThhS0k3dnJURkdJck1ZM3Bub1ZzbXFKNGZRMVhpMWNZSjZtdmhrcHlOb0d2?=
 =?utf-8?B?UEZ3Z3RyUHhFS3BuQWZvK1hHVGxpRW5obk1JdU5ycVlJazZQYlJ1VloxZnpn?=
 =?utf-8?B?UTkxdGNEQitncFhUaW5USHgxazFVOHFyTGtEbEtNdStJSWh0SkVxTC8xT1R1?=
 =?utf-8?B?UmNOZzkxK0lmbWQ0WkNOZzZYelE5RS91dTBsdlNpS0I2bXVydWxkUmx2cjlx?=
 =?utf-8?B?SEtmckp0bnJmN2p0RUNxNjBFamsvbUNOMTQvL3pGRzBRb2xQNVpLdml2WUhO?=
 =?utf-8?B?TjNmZjlWM09CazNuNUtLMkZNV05RM09hTjBqNTJyOXBCL3V6dzR5dFpBNm1w?=
 =?utf-8?B?ZHVvbjNQbjM4Z3R2TkdsRk5xQk9qcUhqeWREQys1N2dzR3lIU1czN2cyWFZ5?=
 =?utf-8?B?YU1wUGNLUzFTOEt6dzRFT0paNG1nZ0xMU1g0L2k4c2h5NWtIVkZ6MHRtaURD?=
 =?utf-8?Q?iYvGk+FhDj+/F4TBcVcuja4G9tHGPISouZl5m3qTphOFQ?=
X-MS-Exchange-AntiSpam-MessageData-1: voBlY6Qr4jGcJQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ab9fed-2bce-44a5-38d0-08df2b2e5ee1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 02:37:07.1561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZF+64/9GdL1dU5weD4UV1xpZq8dGFUjRLtPEhXdt0yIhg1t5tu/uksqMXWvpC8rV4bFbYXLIG7t+osimab/xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6170

On Thu Oct 15, 2026 at 11:04 PM JST, Gary Guo wrote:
> On Thu Oct 15, 2026 at 2:06 PM BST, Alexandre Courbot wrote:
>> On Wed Oct 14, 2026 at 5:30 PM JST, Lorenzo Delgado wrote:
>> <...>
>>> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>>> index 5f6c4d7a1a51..1cc5c7580d3a 100644
>>> --- a/rust/kernel/uaccess.rs
>>> +++ b/rust/kernel/uaccess.rs
>>> @@ -11,6 +11,7 @@
>>>      error::Result,
>>>      ffi::{c_char, c_void},
>>>      fs::file,
>>> +    non_empty::NonEmpty,
>>>      prelude::*,
>>>      ptr::KnownSize,
>>>      transmute::{AsBytes, FromBytes},
>>> @@ -383,20 +384,16 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut=
 Vec<u8, A>, flags: Flags) -> R
>>>      /// Read a NUL-terminated string from userspace and return it.
>>>      ///
>>>      /// The string is read into `buf` and a NUL-terminator is added if=
 the end of `buf` is reached.
>>> -    /// Since there must be space to add a NUL-terminator, the buffer =
must not be empty. The
>>> +    /// Since there must be space to add a NUL-terminator, `buf` is a =
[`NonEmpty`] slice. The
>>>      /// returned `&CStr` points into `buf`.
>>>      ///
>>>      /// Fails with [`EFAULT`] if the read happens on a bad address (so=
me data may have been
>>>      /// copied).
>>>      #[doc(alias =3D "strncpy_from_user")]
>>> -    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<=
&'buf CStr> {
>>> -        if buf.is_empty() {
>>> -            return Err(EINVAL);
>>> -        }
>>> -
>>> +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut NonEmpty<[u8]>) =
-> Result<&'buf CStr> {
>>
>> I understand this was done per the v1 feedback, but won't it make it
>> more tedious for users to call this method? (hard to tell as there are
>> no users at the moment :))
>>
>> We could still benefit from `NonEmpty` if we replace the `buf.is_empty`
>> by an attempt to build it and return `EINVAL` if that fails (what v1 did
>> basically) and calling `last_mut` on it to remove the
>> `unwrap_unchecked`.
>>
>> Of course if callers are expected to already work with a `NonEmpty` then
>> that's fine, but otherwise my concern is that every one of them would
>> have to manually build one to perform a check that this method can
>> easily do.
>
> I think it might also be reasonable to invoke errorenous behaviour here, =
by do a
> `WARN` and just return c""?

That would make the doccomment saying that "The returned `&CStr` points
into `buf`" incorrect though.

If callers are expected to mostly pass slices into fixed-size arrays,
`NonEmpty::from_mut()` makes building one trivial (and we could even
envision a `From` conversion to makes it implicit), so I don't feel
strongly about it as long as we can confirm that this is how this method
will be used.
