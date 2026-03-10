Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DEC2E2EF9;
	Tue, 10 Mar 2026 01:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107952; cv=fail; b=CeqTjx1/4ujSc6WOb4FO2bz4RqjWe4bDHi1pMWUy2pufeJiCs3eVpjCXXGyrMQN8F3NTLlwOViRb8WHCeEv5XyqI6cJFWjbmaNYajoc4aYPIMYV3eKH6RPO53FUb3B3ZhT6BCtQVNu4BOeYnWsXrtCLKc+mITyaeNvRtHmOzCyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107952; c=relaxed/simple;
	bh=PL1VfeesP7snqvNuPr3HLEj+eZ5dVqWsL9b49s9c9XU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=jOFNO0Ej7OXlbEVGI/CB6wNOeWMI45b0wTDDhheD1LIh9zhafUfjoSKbleKMvkkCPi84Z4kHk72AuPICCp7EQsY95us/M682iEswIPkvOaVFhJ41fb2a27idNR+9vvt2mHjKgTCminqcVMyvtw9B2oThR0PdPS1adCB7eC80Bp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oGpN5QFT; arc=fail smtp.client-ip=40.107.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oGpN5QFT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iV8WBn1QsJEvvqUSDsq8iNsm1gfVkltgp5pTISjmWF3of0pro45QOhMoYSQt7I7FOtL+vviPaql0dabG8Frye1ybT+gRNLR/OF55ZepF4p0lLMLuN+LgcioE/5HBW7UuRjAmH43Hn4W8zfxvbEdSoBT8Qh+l8qULNM6n0do60N0YRRP9EJfmlnw5Ir/x/u+E2RYwA68ExEpgMKiAYKImXE5Zcrod04X85hRUQX8aLdnoTm32LSVCmdf0sl0m6hMQwSb5fCihQfPa/dUIPMQlvV6hegJaRBxdkNMmW5vK7T3aD4NbeLFwe8hujGT32KyvnkulcGBtSJ9CqBgjNARpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a95rJ6w0f88RLo61Rv8Vn8pB7OpWx4HJn47vCmHpp5A=;
 b=VTELfEeikCDBsvIa69eznufnhdWAil6qG036s23kj8hsKT9FpjdBFurZ0UgWmuMod7bj7y/BorbcPGIgfXbPxXy/9JRylU2Odz71J/bwkcFM1uSZNAMsE4wy3tFIvfMUsA5LDyXxwhlw4U5bdaHLdLfeoLAOwT7WPRTZn2p1E10a1NuftHQIL2GN0vpcUtV2C9D/XCq5bbnvr93W/Jrdy3QM3A73QUaSjF5xevP7X0ISbk1jaqE9IagKP/bt2JnwwvUmN07Imzk05D/i1fyCsQ1NWIYAc9WN2+wZ83VwBJKCKjgGHgybkCf0k8F6Dw0nLlnDUbrcF5cDtQkbDKVxQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a95rJ6w0f88RLo61Rv8Vn8pB7OpWx4HJn47vCmHpp5A=;
 b=oGpN5QFT/xm6WgL/lKSx7QhYqEgI3SSuFYXHpQVrAm2muekyDKY8S2Z4peIo0879Iw6SG27tsYa+j2e+1aaG+EEr903XMbrf1U125l6YA7LbEY7REanJjmpzbG8EyAGB1OYCNuaLYfkZyNR4bUaY8B0YQ5NiUKpBIUKn4Se/TZ4pEMZkLoyuU1COp3gzIb+j9yqjhlPYS/HRBlghoIUmVAyXso/kZaEA0i8i86V96dBqv+xbsKR/gWbp1q82lW3HXWHkY8eZdrQu0ixjFYN4ND26njQNuh+SIzOO1iCdopWQzeyzgsV9/rua5G81RQK788VpUSWI1IXRnyAMBMz1/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6536.namprd12.prod.outlook.com (2603:10b6:8:d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Tue, 10 Mar
 2026 01:59:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 01:59:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 10:59:01 +0900
Message-Id: <DGYQB3CDARJD.1A7709F52GRT0@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 06/10] rust: io: use generic read/write accessors for
 primitive accesses
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-6-424f80dd43bc@nvidia.com>
 <DGYCWW4AUI1Y.29UXVO4XOFCOA@garyguo.net>
 <DGYQA2AH0NDH.2VNSFLDEJGXYT@nvidia.com>
In-Reply-To: <DGYQA2AH0NDH.2VNSFLDEJGXYT@nvidia.com>
X-ClientProxiedBy: TYCP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: a95779fc-bbb3-47f7-6bba-08de7e489bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	rIuL9fSG/a5fVjX5amJ3cN74g90jQtfWWLgN7L0YRMJixZB4KuyZ8V2sO5fCrR43qUJuQAsPxRr3RVAkzSqmABiUkHiE4gMT3qbmdV93VzJt7BoxC9u5EswimJPqoE9CEjmqFRYwnYLVPmeWid2Zg+ossSkD6R79bOm7QrwNj5Qp3qWtqG1j/79rW0rvdQX44m7PjpLSJtf6xYmN9JoP5V2xDV8iOOs6mVzcyBPlL+xZcxj7aIuttQMa08TAKuRcoeIJ7QwVwsAesgdrJzoaaz5cCIBp2OIAT2ZaO22kY0tk5vI8k8HHSzQiSF/2GaPbFuevirafGg7AKt5UdohGfgmHw9rzTXHawIrnRxlTF79OwDzs4eMnQF+eQhEiQN+EMYvHd8KTNXdP6PLXfOeL4mjKi3moF5kg1EeaJAzcDUAZefj2Jp6+/L6tnqgucPPTYdcpTtnPZoqGdlsXN07r92Kedy2OgWleON0AFr/2W6043m16pY4SOKZy2SZkU37UK2lhQMBoq2XynDF3WTsysAsO8euJk5jbMxVglXKQ6H5moe50EPUQIE5ErK7RMYY71yAiGx3dUXH1ZeavU3xDz25R3TP2n21JkV3Lr1wCO4bSUh6Uraxa97sZfSe7+dZlhop99o7OjRHfdH6+BO7lya5x2P2MZFZzWXryKMJsDCfrx/4QqZT4h2hU8KtVRoAWoitJGtxui8hgKqbEiwFdk/w/FacgZ/gMosrm83voVqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGlBbDVwR1N5dVhGSG5pVjhDTXpHbzgrM0VsOGRmbmg5NzBwSVozNVh1L2pi?=
 =?utf-8?B?ZzNzMXRVckI5NzJJWDczVmQ1R1UyRzVBcHFLVUh4azlEd04ydUgrQ2hIRFph?=
 =?utf-8?B?NnJjUDZZaHhXMm5GbG5MUjBOYzhoUkloampyMzRFQmxRSWRpNzFmaGV1eTFQ?=
 =?utf-8?B?VG9DWG5KdWxRdHBQVXBGQ0t0SkY1SnpjLysvL1NNQzJ1dW1yaWFpRHlPOEVM?=
 =?utf-8?B?SlBKWEtsb2Nsb1JBMWdKdyszU0VRT0pocU4xaFFMaGxtQUVkM3ZrczVsV3dI?=
 =?utf-8?B?ZEx0SzZCejV2Q0Nqd3paVjd3akIwMXQ1ekc2azFTT1BQWlo1OW9jT2UvU2RJ?=
 =?utf-8?B?MkJsVWFuSmV0R2x4bnhUZUFOWnVYOCtZQ2pvNmFZbE8zQ09QU1gxZE5BWmFu?=
 =?utf-8?B?Tm1Rdm5QNlVXQ0g4L2kyOXN4SDZsYVMwSW5jNXZ0SzdFZW9GODJDVjdjcjFt?=
 =?utf-8?B?REIycGpoS1VoaTlaMXVNY2M0RVF5ZnJvRkVhU0Mxa3hjaHpuTFNrUkpnQnpm?=
 =?utf-8?B?MnBlUHdLTUtVUWlkc0huYzZQYS9lRzhROFRhRXlteGFUclJLYVdCN2RBRU12?=
 =?utf-8?B?L0dSVTJFZE9wZWFITEtKRTdaRjN6Z3ZkVDdmU2JPV2pVZnFHS25WdmNVbnFJ?=
 =?utf-8?B?cW80QXlxbDhvc3h4dkwwUVJDeW9pa091UFlsVHRpQ29KZnhZZThwelllUmRj?=
 =?utf-8?B?Q3ZuNHpabFpyTDBWaHl6UlVxRjJOWE56VThDYUpUdWRxcVNTRzlxRDZtQ2pQ?=
 =?utf-8?B?WS9CMVBudTh1endUOWdqeTljY0h0NS9EaTJnSTFCU21zVzFraEVBSDBNS1Bo?=
 =?utf-8?B?cy9OUno4TFFXMEZwb0VmaXYvMHkwQTVrN3VRWWpaSkZBdk5zY0RkWElURjhr?=
 =?utf-8?B?S0Qyc2xvVFdVSldqTkd4UG0wZXdDSHlNSzFaSkxmRkdQdW80eXZoaTVnckZF?=
 =?utf-8?B?eW00WGloSWJSTldLN3VSd1N4Q2kxUVJqZWtjeCtIZE5ycElOdG91b2lJVDkr?=
 =?utf-8?B?TGl3ZmJGWVZBdWpQS3lWajdCOHV5RTU3QWgyT1RjZll0cFJqWmNnYjMrSzZx?=
 =?utf-8?B?QmdiaC80OHdjb0tqODhidGdaYW9LYkxMZkhUOWw3QkU3SDhWQU5YME5SRUt5?=
 =?utf-8?B?RjZkMUJ3a1ExOXBpS3drSUJ4UXpYWkY0NjR3OC83QlJxMWFkcW5XSlhRT0hO?=
 =?utf-8?B?NDAxd2dYYllGbzFJUC90MHBJZzUwU052dE9paU1obmpFWUN2ZGZWVXR0YWNu?=
 =?utf-8?B?ai8yZkVqME5mMFVLRHgxMU5wQUtUSmc1TExqc1lJWHZJU2dtMkI0aC9Jb0Q4?=
 =?utf-8?B?Sm51ckovMG05VGRnK2xWZDhGeG1aMkVwN3lScC96TGlYbTB4MkpZYzkwbUdC?=
 =?utf-8?B?QWY0eE12OGtRZkpTZG5IdFJITk9paFZIN0lXSDVUMytDN0wvY0ovOFZaUGta?=
 =?utf-8?B?R21ZV2hSdGg2Y3lsNEVtWWZtWlQxRDFqd296R0d6Rm95WThjMnVWK3ZveERV?=
 =?utf-8?B?ak1QRHdYSG9uZXNCeGdMVWwrbDNEamNMc3A5VkphTmNiYzFiclI0Ynh6MlNZ?=
 =?utf-8?B?VTJ5UmJkaFRCVkl4aGltOXJiYmViQ3lJcjlqUVd4OXpzNTdjeCtRc1lBbFoy?=
 =?utf-8?B?T2wySThuLzJqbVYvaVJzVDhLSlVmZk9uOTdUYy9RZjl6cjVERERGOGw1c0Jj?=
 =?utf-8?B?NStONjRsbDFmR2p3YW9VVlZhMjRQSWxuUzJURFF6S3lNTS9EU0dBYkVWRk9p?=
 =?utf-8?B?bWhIRjN3alRna09pdExHdXgwczMvR2pEUUV5Ymhsa0IxQ2VHeFRqb2FOdHdv?=
 =?utf-8?B?ZlVNK3NZSFdDVUFMcWw4cGNlYkVtbC9HaE01MDdLaUxsNERVWVFWdlN0ME8z?=
 =?utf-8?B?Um1Dc2gwQ3RORlV5MVo3YUdSYURMQmhEZUViZkhxUWlPelR3VnJUTWMxMG93?=
 =?utf-8?B?SlNFUVcxZkl6dnRSSVVyOU5tbVFjc0I1Y21rTWtLcmE1ZEZmalV5d0Nhc2lJ?=
 =?utf-8?B?OTVRd280MSsrN0wvd0VZYVROUUE2RlgzN2RaNHpvR3lIS0lrZFJXbXZvZzVt?=
 =?utf-8?B?aE1ZQ0tET2VFRm5Fb3lIcmRqMzQ0UjNYbWhTZ2ErbFoxcjBUOGZIUjRpRjZp?=
 =?utf-8?B?TVB5azBucm0rNlI2ZGo2Yy9DMTlydC9pOEVIWVpkMlE4WXFVSUpDa2xIajZs?=
 =?utf-8?B?eEVHRlE2R3BESVArMFA1d0tkaFdRNnIzRmR4VmM5dEtvVWRhdXgxQ05zTzhq?=
 =?utf-8?B?Y3lKL3FUMVZZQzFQZzdIaXNMRTRzckVhblQzckpwbkQzMVY3dzZpVllyVmRU?=
 =?utf-8?B?VzRlRmNWZnBsSEZYREEvZklWNldtL0plZ1kybFNlWlpKcE0yU2FkM0RLTGFK?=
 =?utf-8?Q?wv8WnzGCxC3mi4k71MKxSONQgwHzvrElG4TRZZe1mpHV4?=
X-MS-Exchange-AntiSpam-MessageData-1: URjd2zHzT+jwFA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95779fc-bbb3-47f7-6bba-08de7e489bac
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:59:04.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVpsJvtHCkAqeReBzHTqPSVsE6u8Kd+xd8C9Bql0rY1T+Pv7kApzdSpL1C2SF9S3+1OXrN0dqtAIKfGYb8hh/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6536

On Tue Mar 10, 2026 at 10:57 AM JST, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 12:29 AM JST, Gary Guo wrote:
>> On Mon Mar 9, 2026 at 3:14 PM GMT, Alexandre Courbot wrote:
>>> By providing the required `IoLoc` implementations on `usize`, we can
>>> leverage the generic accessors and reduce the number of unsafe blocks i=
n
>>> the module.
>>>
>>> This also allows us to directly call the generic `read/write/update`
>>> methods with primitive types, so add examples illustrating this.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/io.rs | 199 +++++++++++++++++++++++++++++++++++-----------=
--------
>>>  1 file changed, 131 insertions(+), 68 deletions(-)
>>>
>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>> index 1db6572f4a42..ed6fab001a39 100644
>>> --- a/rust/kernel/io.rs
>>> +++ b/rust/kernel/io.rs
>>> @@ -197,6 +197,25 @@ pub trait IoLoc<T> {
>>>      fn offset(&self) -> usize;
>>>  }
>>> =20
>>> +/// Implements [`IoLoc<$ty>`] for [`usize`], allowing to use `usize` a=
s a parameter of
>>> +/// [`Io::read`] and [`Io::write`].
>>> +macro_rules! impl_usize_ioloc {
>>> +    ($($ty:ty),*) =3D> {
>>> +        $(
>>> +            impl IoLoc<$ty> for usize {
>>> +                type IoType =3D $ty;
>>> +
>>
>> #[inline(always)]
>>
>> the fact that this is a pointer is somewhat uneasy to me. I wonder if Cl=
ippy
>> with its inlining tweak would cause optimisation failure here.
>>
>> Could this be just `fn offset(self)`?
>
> Yes, this was a remnant from a previous design where I needed to either
> make `IoLoc` require `Copy` or use a reference here, so I opted for the
> latter.
>
> With the current code though we are using `IoLoc`s exactly one time, so
> we can consume `self` without requiring `Copy`.

I also guess this method should be renamed `into_offset` then?
