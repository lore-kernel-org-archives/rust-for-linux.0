Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC03132E6BD;
	Thu,  2 Apr 2026 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142322; cv=fail; b=OhznlAjQCTjWD7wcIiPlaRd6WQ5glwz5TU86S9hj2slel3Yp/9lqjg8+S+zEGemtegj6QIXqeyaEh3iQD0OVe1xXfpZqZ+lYFDFxJQNNaSA4EFKT186VQhPTJRSpeuD9kAJscUo839wkXjtpLBRkKJgW9gt84TwinsmRkhvv2gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142322; c=relaxed/simple;
	bh=Wja1zgfh5WjeonVOX7RA2NOwYdAwOlOrDWvY/DTsvjs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WzxgmRa5r65Csx+Z9OK7fCDB2pnTvKXwjfAY4oE2MUWADaBcRyNk9V73QIyEo2Lzm6HRp8LYEX0X58VyypLFzzw+9VeLSeiVchGhpRk6btjfhsEKHD+n0Z8/LEd/q4cNAOJ42R0fC9r1uIPJE1bSxMkLoyjW/aIzmlFS16zSa48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X+T1UjL6; arc=fail smtp.client-ip=40.107.208.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X+T1UjL6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2ew0ico4SyIqZrYlPCoSnx37Sa+m7AHe+9XS3Xj11LkEJtnhXW2VDGy8ehPifoE1ypwwB7hl3boHYYrm5lMWPaV3UOfKYpZ+x6nxw2AQQWCc1brhOHqv4C8V6MVG7UYuOi4bubWKST0EYI/rBxYodzGL9kv/SiurjEg0AVvgbhDqwLc11Me0GrBhtXoxgyl4tCzcUq/ctQ41Z9sl9amM1HLHcnT1/G2EQg4gvZiJ1iAX1o4rrG2Jv3zMLrRSmqlABTblny3RmzZAdg6pPox+HxV3tcNDbeKzzd8jygxJVZp37UgPGb4NyihaqTWy8HIlHyVH1GMohXwSR0THQe/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxl1NASLQtf4PVKpz0SA7Bc2aJgy+ZeenPD5Y2+o9/U=;
 b=gCcwkT/eASyh/WtosQstdTh2HMzw49bC3l56tZwjCmLWzhJ2ll7GUfx60YiEbSqsC87I36AkVhVJNGoqwLWXOGKQc6gJOB6JEur0H5rPajqfkG/NZHbKesmFOoBDD6A+guOHcOGt1Mhj7ibOvOBmYPiN7hqrWpana7xRdYQ3j6GJqS3/R/QXxEWgTFQQVDDK/CSmypNeR26F4c53JwQh3wp1q/c8SePw62L+H3HxC4ibphYsdcJ52XvlDSe0YlqV1GgitHQrcKTe2qdbh07yC9nGXT5zM1NANjgM6i5x4hXAryUgk5M3wB54Rb4AtmdaiuPNZfWDWuKysSXI1rdjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxl1NASLQtf4PVKpz0SA7Bc2aJgy+ZeenPD5Y2+o9/U=;
 b=X+T1UjL6y7NJf25AbF0b4J7bq++GN/spIrp8CxkVvnfVQJoSKcgqg6Pt5T9wKetXOzTKqmmGI6GwjUF8WU72LLiHeei0ohA3gxQsSuPdHMMVQl8mlIM5caCaCtn3leKl5tTm5Fw9aH8CYePvTpzjbCLKxHeao03DwLp2+Qv6p4wmK5knpqWldirqcS4Ch3m70qPSjpbk6waigedx3zoHWDgzdgIiMRNjvhQpgGWoWNYOmBHHQ7NqJWepTT8R6pGLt5qmz9HJtURTcYEPrnx+hy/BSUzlGBhY3wdCh9TqGSZ85oEyFehWhoGdANdzXpCLWPVNtg0RtVmhGJl2m0znkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB7114.namprd12.prod.outlook.com (2603:10b6:510:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Thu, 2 Apr
 2026 15:05:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 15:05:16 +0000
Message-ID: <2edf0385-b756-4dcb-a235-d16236b0177c@nvidia.com>
Date: Thu, 2 Apr 2026 11:05:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] gpu: nova-core: use SizeConstants trait for u64
 size constants
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260401222743.148710-1-jhubbard@nvidia.com>
 <20260401222743.148710-3-jhubbard@nvidia.com>
 <b1c23169-9368-4ec5-98f9-f73fe8128305@nvidia.com>
 <DHIR7Y4FLM2H.ENO8SJ92Q24J@nvidia.com>
 <aadd85a7-efc5-4d4e-893f-533049de54d6@nvidia.com>
Content-Language: en-US
In-Reply-To: <aadd85a7-efc5-4d4e-893f-533049de54d6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:208:32f::30) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce36ebb-d0bc-499f-390c-08de90c93f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KtU1b5Uzm6fX8R5qhbzJqMqTvAujpRO0bws3ScPUpPBh7ICvlaZkSAAdy7cB5YLNycWb85sTOnvh6H1+CbTw08sVOjI4MDwP7M3YGLN7gpRpLlR8zKiTYjVFmXWqm3US1V4MEoLrg1m3NPmZEoSOa9r1vlx2ZMty0rSf/B2X+wSAsq+RAZtLftwA/92eRVBMTvH7+p1dVzo126kKyl8kKkWW5OT3Auvzs7RGKpZIsVgyd3NLGw98O2xVwd2iBwsqyj3S34WjagDB156M0sd6WzRjc9bF3GfVKnxwyk3KC0vO3GU0GpCRs7xv/KMOP82OVTYsFbSgb7UeinLKCXI+o++JWG5tJHiFkF64N6SermXEeyrQLYBmV1rvsPDsunoomI1yOYYcPR0ytnuMEX4BCqyHCzsithysb7gXuSH3gJsMtz17ChpgXgh+/1P0wWjcBSZ8G1zwH0p2NZdIW8t6XWiY1d/FPzgFpyYspy5x7qpDHjqJEHsuJRPFUWzSm9kw4/YcnDTCIEEkc5hOOAqW5sWl0hDByho3rVO75jw6XR1024HmtrQs1EW0xDy5nvQ2/14TPBSD5PVfGPTkgFJTP0U73fwqC/1MPch0ZGKI5BbcyU3+aTpNfPCV7fXdR41FRVlMZGGQT+JCnlgHVnCVCyI6GhF1t8AamSynApULNyzFWVoGGACTZyF5/3q+ThWVxQ2RfdoAHECY9FEj1gHf7SmBoffrsG2LUs6CZYcuJ0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGF0SXIzb2RyUW00YWdmNGtKZjhheTlITUVzcEd6WTZjcjBBbEF5U1plOTBz?=
 =?utf-8?B?a0tibDlYZ21YRHZPRG5rZ1h6cHBQS1ZmWFNOd2xTaWliSzVzdW9ROE04MVhV?=
 =?utf-8?B?TGUvZVV5L1l3b3RMcWRBOVQ5WWNva0k2c0c4VDlwaUxiY0pYa3lWRWl6UTFI?=
 =?utf-8?B?VjJMU1p5VCtWYkZsZUhXWWFkaThFWENuWndvYlcrWGpOVzAzSDF6NjRLVHFv?=
 =?utf-8?B?SjJwWXJHbk83U3NjbkpVbEdoUk9HQzhsN2I5eC9vTzR3dmdDZUUzdGo4azdl?=
 =?utf-8?B?NFQzS1llajZuUEpFMDkvQ0w4YkpVUFlQSURkbEtJeWZkRkRCaVlNTUpJL0lq?=
 =?utf-8?B?enBKOHMyNDBpNTFnWmhDbDNPZGg4NCswaFZxcFJyVVR3RzZYbkNXTEtQbm96?=
 =?utf-8?B?THFGRC9RQ2JVSi9qWmg3TjVOalAyZERTTHF6Ri9ZK25qTUFOTzJHRnJDTjlJ?=
 =?utf-8?B?dW42SFZqVHRRRW95aGhxb0wwL3BiL2J3N2pHOXpjQmlwNlJVYlVlMG41bE4r?=
 =?utf-8?B?UTUrTFM1ZENtSEtXZ2cyRmRBZWZ5RThPaGJaL3VyeGdzN0RPeG5xRnAwU3ZU?=
 =?utf-8?B?Zm5QeHAzOFc4WTdnNkxhRDI0U010Y1BwWU13ZkpsOWlTalBjOFl4UUkyUzhI?=
 =?utf-8?B?MmNUc3p4cUpzdVIrNUE1b3NDUCtzSmJwLzMrcHNsZTIyL0IwRE8wbk8wRy9u?=
 =?utf-8?B?L2I4NUFobEQ2YTVDcE1aeWVvd0MwOUNEcXY2aWtabWU5bFVXTXFBN2lvZnA2?=
 =?utf-8?B?eGVoZ2JjeFY5S25SY3krTG4wNGZ2N2FQWDc3ek10RWVQYnQ5NEpvc2xFNTJt?=
 =?utf-8?B?WWFhbVkrQUZkbFJPbjkwY0FXYStxWk5YUExpMHhWdkpLTzNCNk0wYlQrSWpm?=
 =?utf-8?B?ZmdzcTYzV2RzWGZLWjhzVGRiS3g4YjVVaEpPQ3hONlpRbTZKc2xyQ284cWpx?=
 =?utf-8?B?bXY1VXFqakVaRTZHbjhuMFJYZ0tidTFEWmVKcFJWajdZc2g5T2U4NnF4Q2ZM?=
 =?utf-8?B?M1NnTFpoS1NkeFkwWlJ0WjFFSmV2UEhXNysxa0dvU1pUVnJnK1p3VjJFZW4z?=
 =?utf-8?B?aUpSV2ltYkZCekd4RWFjWDF3V1NOaEMrNEpleG11NWhKb3NJWHFuVjlNcWtm?=
 =?utf-8?B?OS9POUptUi9PU1JuUVR1MG91QVJzYVZzM0RQT3l3K2wzY1JKd0RLejN6SFVp?=
 =?utf-8?B?dWFTZEV0ZzdaL0x6QTdnRHRYckl0cHNOZk5jaE0zczNRVUg1cWF3andPMzN4?=
 =?utf-8?B?cUZ6VmlYUCszT3F2eTZwMG9vekpFOFZBMWZlMW42YVVsM3BNZHpVOGtXOXBL?=
 =?utf-8?B?aEYvZkNoeVRWYXppNUNzSGlFZ2VHSVdSN2lKd2RrTTRBNEt4MGl2UU1CWkZn?=
 =?utf-8?B?YlVYTXh5NmF1NFBLYmVDdlE2WVN1TGlaS0xuRU9mdkp5K1U1NEVmVlB0dW11?=
 =?utf-8?B?c0tZSEE0My9zN240SmZ4WXpnSXU4VER3Q3NNeGhaWXQvTDlQbS9sbERyVFNX?=
 =?utf-8?B?Mm9DQ2RMcm9ITEFGd0x1WlN3NGNDcmZ4OXBSd21VQTNQeFFMOUtyZkN0WFcr?=
 =?utf-8?B?dmxpUlZLalJRL1F4Qm5CYXNxOHppSTVnYkh1VzNTUFpYKzFkTzZ5RGJGbVR2?=
 =?utf-8?B?Q2gxQUxyeFFEaTNNSlBCQTh5RjdNR0VRemtmc2FLNVEwbjBGUXJ0YjE0WjlC?=
 =?utf-8?B?L0xNSVZCczBrRHROcmZTd0JCWGY5a0ZXVVRnZVVBVDRTSWd1VkovcUZOb2J6?=
 =?utf-8?B?WVNRMkZ6TGRLUVEzNVlUUFMwa0taUGxpVTZwbDVFdWhOSmV1NlhESW9rWmFz?=
 =?utf-8?B?RWtWeVdyenFXc3lGNk9tNjRXYnJrdm1ZVTRFQzFGcFVpcUlSaEEreStFcHVy?=
 =?utf-8?B?dmEyeU8rR1p4ai9ScUEvYlg2RGVJYkg2VFc5VTlRTFZuM05Eb0VRYWlURk9v?=
 =?utf-8?B?aTRjUktHZFAvZHA3TzFnUnJwU2VWamVxQmRONS9KYmd5alRMdXNwSmdTZFI0?=
 =?utf-8?B?VklNTVMwNnBFMWNmTGFHZXNDQmQ4aDNFajZ3V3NpakhES3FCZThxdy9TSURH?=
 =?utf-8?B?YUN4SUt0Z0daZTlGN1RoUHVVTjZSeU1QOVI5cyt4UldHZUo2TnVSRG52TDF6?=
 =?utf-8?B?SG1zUHFCdldwZWVDSDNSRjl0SnBZTGRjam9obEYvWFh0eDNrZkt3aFR2L2dT?=
 =?utf-8?B?UlE5UDRpUTMweGZLZzBRK25DNElMZ2pDRkU5Y0lrbDYwQkhEcU5leXZMMnEw?=
 =?utf-8?B?UDFFamJ2V2NUaTlsN2Q4L1dkbCs2RXU1TG9ZVnNjd1hLTjdoSUlZYmRhTlZx?=
 =?utf-8?B?aThjV0l2eVNmWlpZQVFka0NObnAzZzFoWjQvenFDVWwxeDYxY1BJZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce36ebb-d0bc-499f-390c-08de90c93f6a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 15:05:16.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqhS1WKfiItQlMghlBmA40Ubtfuasg16k7QVOjTG8ZRSN0bqcpoC63Mm2pz5VkapGI59K63AA3C/MDOsxbvh0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114



On 4/2/2026 10:59 AM, Joel Fernandes wrote:
> 
> 
> On 4/2/2026 10:55 AM, Alexandre Courbot wrote:
>> On Thu Apr 2, 2026 at 11:33 PM JST, Joel Fernandes wrote:
>>>
>>>
>>> On 4/1/2026 6:27 PM, John Hubbard wrote:
>>>> Replace manual usize-to-u64 conversions of SZ_* constants with the
>>>> SizeConstants trait's associated constants on u64. With the
>>>> SizeConstants trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M)
>>>> and similar.
>>>>
>>>> This removes several now-unused imports: usize_as_u64, FromSafeCast,
>>>> and individual SZ_* type-level constants.
>>>>
>>>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>
>>> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>
>>> I am very happy to see this series since I have these issues with mm
>>> patches quite a bit, which this series will resolve. Should I update the
>>> nova mm series to use these, or wait for it to be merged? The issue with
>>> updating the nova mm series is, then I'll have to either:
>>>
>>>  a) carry the series as a dependency.
>>>  b) wait for it to merge into drm-rust-next and rebase
>>>
>>> I could do a) and add a [REFERENCE] prefix to the patches, similar to how I
>>> did for some drm buddy bindings patches. Thoughts?
>>
>> There is no need to carry the series into yours, just add a link to the
>> cover letter to your dependencies and folks can pick them up.
>>
>> b4 also provides a dependency management mechanism, and will even fetch
>> them automatically if the people applying your series also use it.
> 
> Oooh, b4 can actually track dependencies not in any tree as well? I have to
> check that out.
> 

There is also the issue of if we sure we are going forward with this as the
final api (I am inclined to believe it is). Trying to avoid reworking too
much, I'd rather wait in that case for it to be confirmed as being slated
for merge.




