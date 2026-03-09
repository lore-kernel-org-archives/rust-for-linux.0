Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C63016E3;
	Mon,  9 Mar 2026 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078705; cv=fail; b=mClEs9XH/mF8nS2dXw+raryPumwHnb8wKL/f7KU88Q/Tc9crufdTMDOg6Ps0l4CXwvxTz4FHi5rMkh82g98gcqLFN7+/rfRKMqXoXkOxkBKUalhmYun9EoOJuTz5nWgcAP0+X/i6GqpWICDWbkhOnyVc5kvGCEXv7om/pI1+NEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078705; c=relaxed/simple;
	bh=t2Nbm1Gc2djhL7HSfeKm6seBGhjnTQgfFYwf46WVRRs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kFl72ystKNeFWEwBLlG0oeT5FRcpF/fUXncniE3oo2SGLVxq1NT4Sqyq1Z3KAxhyyxWAPWjMurhQ4O2ZmL+IAmibc/TKdEJ47SQSk8dRtoWc/XzUvJvP636OOAHQsP1PUi0/vsk5lZjLO+mUscaxFy+Lyv8YFdpiWfHTg/Clwog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C36vHZu7; arc=fail smtp.client-ip=52.101.43.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C36vHZu7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yF0L+VeDjhY/FcO6iXoXBMr51FvtWuj5wYi4T4pjbtqbtv1hWEqZSXvom3YA7S7WRJMVU8p7nVuAMDqQQw8Mw5WDbAs2FmZQ9qN2zchH45MdTNx8vI2VsqI0frxxokN5tpM9hjYvhNs3rA+Y+KilF5fvA+ArA+sdhr8jJxH8KMMLtJ232rPpi93BNlelob8ScF++imGIA3VqZJz6m3wd/WRFLDwQEszlxVlAs5N57++RtfcbvtWSplO+o7GroZfS6mM8gj/EIQ8FOE3mJJGOPV8hlkLrYagxNb/IdZhgS+9gDX2Ew+LcbYz0YTbs24Ky63XizQNgsJx29UbB0Hp6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMT6YUUumdBGP9DVhLeP5WuEO/QgV4kpryAMEw7vTe8=;
 b=KhxDjis2Fz6HgmLsG4YJX+TTKhNvtQHjct+JiqLCxc/MiNmE2HONFGrl5tqEDlE2252UF0WOlkXx9vSQMd9DVwIeE2tEBFsDPM/fgIifze3hWSZ2b4UhmS4n2u4XSIX6oVY0W2MC4U6X19B9s8Em9rChDVG+P1i9ux7oPqFI67KvUKAn2nXAVtGpUOq9Q9v90O6OhYqZ1/4aTzNZp3r+ZDEWB7ZtOfLAeyOG8zCcIyWyPeuiafLL3dWGwYHIhXNDn/hTWIIskUHqCqjH6pdGMvIRBWIj52DO6LYoS7iM4gEPtRiRRh0QIodZx2T0WyRuTJZ+ZkDydVMb1esx3mpxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMT6YUUumdBGP9DVhLeP5WuEO/QgV4kpryAMEw7vTe8=;
 b=C36vHZu7q4pPBcEHYFRhlcz2yunEc8LZyzqN4Bk58namtlXMPB1QfmjRc7qIXHM3S4JgqEICFDHVMqOcY1TZOqYP1KR1BTHm92pcHUPtzgvwBADhaCJo2V2jAG15iMcD7CH73o8krQs2aCR0IiRE+cw7ILo33zR5sP+H2qLgc5JOc+KERBVbRIqdUpB0n/EQmxhmeE+YNBj34Xxqt0DAEtsklu5Qxa8CpewzsgtmXKTuS4VK5ZbqAps8/+WqNo4xlfgzXkWC4i5Di+e1lbQElr7w98xgdaBFJXwR6r1BlTK6pZahaYD+dIaUhCGhvzX+RU98iMUkVc9NTczsa3j7sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA3PR12MB8021.namprd12.prod.outlook.com (2603:10b6:806:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 17:51:40 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 17:51:40 +0000
Message-ID: <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
Date: Mon, 9 Mar 2026 13:51:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
To: John Hubbard <jhubbard@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR14CA0014.namprd14.prod.outlook.com
 (2603:10b6:208:23e::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA3PR12MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbfe611-5215-4e14-31b3-08de7e04847f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	57Z4SAtMzbU0OPM4U6lQY9dEEPJVK5jLaVp2Kjd6bR2sBIYU9kZa1bnZdmAbZ01F1vkjtfpuuvWsToEew3S8pbhCVY0RLETt5R5Qsw7D0DIacOvel4dVzBu93qkk9CwE1Knr2VYtpDKKZ6PSbd4FmyV6CgkpvsoyrK+pCkTInuzkBt8SEEaKmcZAz7bv4FcBqBarjfQCFJaTrQaAfX2KA9eIQmdg+GphBEl0w104wsmy0TOXpIapMNUoZ5DD2dMLNcQwXezM5m4jSnDlIi2DO7H2+n+OolyOWbYVXVg7uuUMTyjoUB77WRKGhGNZnbmZ21wAMUuTLogR/ghvwTbg46NNYFqNgXKaOM0GHOat7yvywDQ4YeBskr3bdAm6C4IxCA1+ehudoKHTr3lHv6XuwZgeyYrupN/rWizYQ0OMyQNcFHUMDs3F7jo4SvsY1Gg3ktH73eyvjAXqzYAMEIYLD4n0wNo46NhHl5CBcanLpU29l+8e74lJx4BBibYTRCbFLTIM4Nol5vMQmp8ohoVba2gZWP2qBku9SA8DLMjt/0FhAKBClqKUwOd5jhila3TFHMd3R0Vmw6g+hL3qnYkQ2suFMGzTdhnUe7XkhEHfdZpbB9gWWRl7Bd/2FauBJvHiDTt5P4eTfWxYg3E9rnLx2vT5NR9lL1dZq9r2mSvQUUlMDBJlEyH0nMKW8732Ks75b6s3JUVjn0EaJa4zdE7jq3p0+xGoLTTCOLkibuB2CL6FRG9EcLPG6bGpYHNZlfDHBHF/fkfmJmW3dPTHKTb5+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzlyazBScGJ6UkNVVzRkNGtWWnhFc0lmZG1WWjE1bGpHQ2R4SUhvMGdrNXFo?=
 =?utf-8?B?MjRpeXlPbWZYRHZNZGFjVk9FQXM0QmlScnFQeXI2bWRCTGMwU2FtQmxlZG5u?=
 =?utf-8?B?TmNpeUZ0N1NaN1kzcFd1WjZ4b2dITnRKVHAvakozMWdyQ0FoN096RnR3b1dn?=
 =?utf-8?B?eGZiT2o5SFYyaGVKMXYvT1ZlL3lLayt2S3owREwvdE1wSnVFV2hTRllnMlFC?=
 =?utf-8?B?YThOZmI1MEVhWStEdXFDWWt3ZFpCMjk4alhXeUthTHR1dlhhUE1yMTA1RTZR?=
 =?utf-8?B?a1A2dEhJaitGMmYwNHh4ellGTWRXZkdua1Q2b09xbXVwSEZ2SjFodFZrL25I?=
 =?utf-8?B?dHVxTjNDK1hvWUdnOEhQcVR4OWxkd0VXRnMwM2RzQnQ5SWxxUTFVSGhpQlRJ?=
 =?utf-8?B?R3RDT3dONTgyN2haa3lUTURDZzB2MXdnbHNYVEt4OFpSV00rZU10U0o5SlR1?=
 =?utf-8?B?dkdROE9ISUlxZW1UcnlOQUptTWpYckxhMHZDZkFIU0crMzdKQk5pcWVGOGtI?=
 =?utf-8?B?ekRMdGlGZms0OThVamR2VWVNZUYyZmRzS0hSNG1ac1M5VW1xc1VwcmNOcjlx?=
 =?utf-8?B?SnVkd3ZjNDhMeFh4cTRmVU1sc1M5NTJ0UXExSU5rcUliQ2VIQUc0NWM1b0FC?=
 =?utf-8?B?b2ZudkQ2VmpmVmtCL2w5alo3NXRQT3ZpUkZ1MzhrRnlGdnFibHJmdUJFc3Zm?=
 =?utf-8?B?OTJJSEdCSjZvWjk1cEw0UW9McVJRaHZDdkJhVm5DaCtkWVM0QVBzb1dKWW81?=
 =?utf-8?B?ZzFzSjNVeDJLK1lUMDVlbFVCMWpaVHpBeHRqZzdhN1NGVjlrKzBmVWFpV3Nm?=
 =?utf-8?B?b24yTHZ2MEc1S0dPcmh3TW4zM3Bodzc4QXhGZXZWM2JEQmNLWVBDWVFXTEgx?=
 =?utf-8?B?cDRaRTdDYUlscFo2SmkyckhDYnFwM05SVWNqdHloRjQ3eXk4clJSZlpkYkxX?=
 =?utf-8?B?N2JiR0ZOR1lhVmNQcG56TGdaNWVEWW1zTUlidjQyZTNJOCtHbVNlS2hmbE1p?=
 =?utf-8?B?WXRBVjBMRG5uOFZpUEdYQkIvVEJSNU94VXBiZUVGNlhLWjBta0sxRzdKa2wy?=
 =?utf-8?B?VXZTSGtyS1NoRUFtWGd0Sks1Z0VmKzllcGwza0Z1NTg2YVNSZzNvMENrQnA5?=
 =?utf-8?B?L1FwWFVJaDI3MVR0UFozUWdCQUFkNXBsMzJhS0d3OXZHbnFYZUpqTDhSNFI2?=
 =?utf-8?B?WEJrclU4SzBwRzZqc2pBMkEzU0x2eVhqVnBPaHVQekhZYUlBWGdkbFVMd01s?=
 =?utf-8?B?YjZJcno1TjZJb3EyK2xqRHNzM3RiSW5aRURCTTFJM1NQb3A3a2hUbThJaXpr?=
 =?utf-8?B?N04vTjd2WHpLeExTZWkrWnRKYzc3RVQzN3FYclEyd3ZxNXFHdXRycFM1d0tQ?=
 =?utf-8?B?TUh4WGZORm9leTlLc29LNFZDYy9pVHJ1RGRnc0tFeW0rSFE1dmw5ajRsK1pv?=
 =?utf-8?B?V0ZuOTZxUUVNSkJhTDZ5ZWFLaTREK295Yi9YUmY3ejN5cmU3SWVaQlZyZHo0?=
 =?utf-8?B?VHFvSUlDalI2Y0hMREw4alpCY281eDlEbC9pbk5WeFFuanJKdzU5WERtQWg2?=
 =?utf-8?B?UmMveWZRakJJanlpQ1BOaEhWb2lsYStZV3NUQ3NMd01ZcGhPZ1N4VDJTZkl4?=
 =?utf-8?B?dVVXOFJhdklUU1NpZUkxeTRQOENKZXhRNnBZS3BzNzFmeVVJRWNScW9INmNo?=
 =?utf-8?B?c05lMWY0OWYveENDMTJhakdlUGZGRmFtUUNnNnpCcUZ2K1VmQWV6VjRqemE2?=
 =?utf-8?B?dVZKK2FoUnpQRFRzNHM3WHNLRkZETnllN3RXKyszQ09sZFJSRzFkTzRtNXdu?=
 =?utf-8?B?TTIrRGFHZmdHRHVJUUx1N0RsbWFlejFuMU1pU2FKYUZJemxoN3hIRENpYXJU?=
 =?utf-8?B?bFFLdFUzWjhJMDNSVWFNazRmZGo2aVpOVVhDcXlQY1FDNEtpSXpEaUFEYnNq?=
 =?utf-8?B?QUFBOHVhNWpuWGNBb2lRV0FoM3Y1dzF5djdEajA5ZWZNdVp3SWV3T1ZVVkNB?=
 =?utf-8?B?dmxOMzkzLzRYdVlXc043eUo0RFZrdGFCMVJKRXBoMmNoK053ejM2dWZSZG54?=
 =?utf-8?B?Z3p3aXVpdERWQXhtajFuZm1Ob2dzcFVzWlNIblhaYUpiVjBGSjVlVkh6VjFH?=
 =?utf-8?B?ZHEyKzdSMkM1YjM1S3JmdFhRcWhJM3czcjNuWlY3N1hLLzA2R1ZjK2xUazRN?=
 =?utf-8?B?d0E5LzhTZmM5MUVWVDRtWHpCNFJWUDcxaENMWUtndFhGMmo4SkhCSEhJcHlZ?=
 =?utf-8?B?dFl2WHJCUWU0YTVXVUlwUnF4RUIvZnlva05PeUhSMnhrT1N6U0g1THZhYmlh?=
 =?utf-8?B?REtpT08rSFc3aFlpSFl0OGE1U0w3SjVjdjZXajFBQ1pZekdPOHIzUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbfe611-5215-4e14-31b3-08de7e04847f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:51:40.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsJzpCJJVWBxZRTBgy0aF6fvK2Q/LvF0dETNNdeDZIDgGVA8eE8e6HiCfOCNJKhdI/XwVnXsK1wOqnuYCzJZoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8021



On 3/9/2026 1:34 PM, John Hubbard wrote:
> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>
>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>>>
>>> @@ -797,26 +792,30 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
>>>      /// Writes values to the mailbox registers if provided.
>>>      pub(crate) fn write_mailboxes(&self, bar: &Bar0, mbox0: Option<u32>, mbox1: Option<u32>) {
>>>          if let Some(mbox0) = mbox0 {
>>> -            regs::NV_PFALCON_FALCON_MAILBOX0::default()
>>> -                .set_value(mbox0)
>>> -                .write(bar, &E::ID);
>>> +            bar.write(
>>> +                WithBase::of::<E>(),
>>> +                regs::NV_PFALCON_FALCON_MAILBOX0::zeroed().with_value(mbox0),
>>> +            );
>>>          }
>>>  
>>>          if let Some(mbox1) = mbox1 {
>>> -            regs::NV_PFALCON_FALCON_MAILBOX1::default()
>>> -                .set_value(mbox1)
>>> -                .write(bar, &E::ID);
>>> +            bar.write(
>>> +                WithBase::of::<E>(),
>>> +                regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1),
>>> +            );
>>>          }
>>>      }
>>
>> TBH, this is quite a readability hit, the previous was much more readable IMHO.
> 
> Yes, I think so too, except that "WithBase::of::<E>" makes a lot more
> sense on-screen, than "&E::ID". The latter just looks quite random,
> so this part is an improvement.
> 
> Let's break down the remaining troublesome part a bit:
> 
>     regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1)
> 
> * "regs::" can be omitted with a "use" statement, right?
> 
> * ::zeroed() maybe should be the default behavior here, and then
>   it could also be omitted?

The issue with omitting it is it still needs a constructor? so if not zeroed()
it would still need ::default() I think.

> 
> * .with_value(mbox1) I'm sure this is necessary, but the construction
>   is unfortunately much less clear than .write(value)! Thoughts?

yeah, also perhaps the whole thing should have a macro! to de-sugar. The
patterns seem somewhat repetitive.

thanks,

--
Joel Fernandes


