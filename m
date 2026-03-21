Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC030E837;
	Sat, 21 Mar 2026 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100524; cv=fail; b=eg8l1JdB9dii+5PirIZt6euitVBOlp5uDyGQ0+FR94oK1RG4TQ236dfPpdzbjv33i/gk3ABijn5j2IcyT5kLniXmxxdOjC/lwir3wjtxbv7PYbCJ+mO8kcDJ66FQ+oeyPwsEwR2zoRYoxx7n9c3HuuqmLFbimmpkqQKD0O4Kt2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100524; c=relaxed/simple;
	bh=wlJmoJ0Ar+pRsruCILDzqG8foGmdTPNLj/ohzMvCu64=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=uviGvgdpgkYt3SSxu4Bqza4hPAuHhfMFjgcVmvPOqXBtNliajGcs8y8D1eYWoLe3XEvmBs9RitWhdEPjsdBBg1nPDzl2E6RY08zsaSHLf8ETB+DP9MOctI92b+WvFM9q5+am8WrBzn/0Rrfp3Dz+T/4wB3evoPDN3+tAJjKc0eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RNmgJUsB; arc=fail smtp.client-ip=52.101.53.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RNmgJUsB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmRbKjFDYznGYGV04mY5LntLPhx8BixGEHDk0PvRLrUiBBFbvGWg4c3DUI49/B36vZ9GudlTOEddCbba+gGp3oW0jfu7NfbVIV+aaDRiFjWUynCmzy5NM9so1v52yZvDPx73jQs78duVsmaBAcjLN3FaS7M0c4WSa9wfonNDP7Gy/idfL8p4hGb1nyn+r5ZSDQRhNBAqOlnwkGver9bXvJ4vq8vVVXeeC7JeHJXBYGqgAfDizWPxuIy+Fjv5Sv21nkxV7NDZTfPhxz01fP/dSn4EgqcLz/gTfAKHeDDHwjIE67i/Y4GcDIwUOCbJLajDw5nk+rEcCCGVoqVv1LtXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwnOSLDMg8+vYDoiGCfIU1pBRqslv8CpkajYSu6bi0w=;
 b=yXmRPwz7GrTZpJM5jAQVP4j+P7KTUJBFUJGJQhdKn4mPKvvskpJKpYlprua2MiOVEyGn3e8piAMPSva3DsZzxjCPsl6SsgC0AwKchdtxMTbDoh67jFAaNWlEod5et2EY3wn1u0oErVOb1NQmmG2z+lCGmXsg4u8xjoAc01WzuArHuCQloaaiavY3wyQ9LLUOBLb1dvx8chEjobmYLxEr4YscSnNCcFKdgzXgbN9YZ1lhsjcA66AvDSIB9ioRKwwMMYociPSX7jq55MK+1A2Vk3WlpyWpoejVC3o9jPOnWro/ruWXf+rLwYFiK8B7D33XaI/bSbLrr3kvCbPB8wWqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwnOSLDMg8+vYDoiGCfIU1pBRqslv8CpkajYSu6bi0w=;
 b=RNmgJUsBtc/DAc9zW4jOMPn3my1oTK35mB+qn2lplfJlwvYocpfdaGR+3NPIf8JA/tSeSgpHjWQVrDdnA9aCbWuPDcT3TiPQ6TLP1a/s5o/oDNNCu+7oMGsz7x/jnHunEpTovK0I35gJ+kBf4BP+z0Tj46X4Ae3TRtbMvezt9eoRIzv4SPGmP9hMoAki/14gOb6YFpBXSQwLKd79ZVzPG5pJR3+ANTaWv3OPp5rsR6I3ySMGf4PD8ra/59NBSgwJN3ZVxevjFMBGodG7LMX3r4iMUSmyZ09BwvE/l1uE8jJTmKn3buvhdMVA8+stFjhJ/dvy3VEL3oiV0a1+H44Sng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:41:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:41:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 22:41:55 +0900
Message-Id: <DH8I59NUUWR2.3LOLJPY6SEABC@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: move Cmdq's DMA handle to a struct
 member
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260319-b4-cmdq-dma-handle-v1-1-57840b4a4f90@nvidia.com>
 <DH7MBMNV5WPI.E9TXUC279THZ@kernel.org>
In-Reply-To: <DH7MBMNV5WPI.E9TXUC279THZ@kernel.org>
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: a72731a2-d393-49d8-2ae9-08de874fa00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	Sc171izl6YVqq1W13/KtA9WjHGoxXkmBQCPra4cs6HOTEjD7L2NlUTRme85VWwXLll12Sao6NXTGj5Ug5WJQ3pStMuna5N7/qiS10o6yoHowAUBy7nqGsj7eTzacP0XvrZxwmETCj+jnaARugxEhOxwFSANBQg81msHBtyh9U0zWeT8GnlycQ2GvTo1iGNIV3l5EwwO+lHtsGdxTs50KofyoBnlJ5u7ariwGXhAZ2C8bxkhhHejhuF195jb2uMTv3Km2/QhCFvMtBvOHRXnnfpUMSHQN3l1IaiD6DZGwwet/Gsd4BcBGHdPb1IlDFFNB2AlaILgC2NXEedVtk7BtlLv6k34tS9qpEu4jhdrx4CEKLy5/C/ES17fCoVzzzwkSnHyQwavwy8UuhidfNVunxEo7dVt8qJAdf05sUGra1K2L46TbnmsI1YnEvcAY/2SC0x2ztXFDOMdIImfhyDL580JinT50TJ1DXgZ4Vuu6RFFw2kGbjuvGdCQGLVLEL89gTuG/O2dGk2MstNNdOp9Ut5GCluYKzwSSz3tNc/ZA3onQ+iuqcSnJg/flfJNqNjWw7V8NebmeL6MlptG1WcZtjbfDd72spL7eycviqVg/8wVE4efPrWGTjWMU5Iapi3IkV++XkY331FbIxlTWN3IYhtWEJgRVlN67SR+r9vCyTo3i380PtOAKfCA4w/hA3tWMcqC2k/2HHFZ5yWa61QqhNQgFGj4z4/NvkKHalE2O558=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnBKK01hWTd0ZERoRFFFcFNRZVlmNUJCYTBMWHR6VFB1SGloc1hrcm9TczRR?=
 =?utf-8?B?QW5kMEJ5eVpzRWdKbTk0SjZwYjNHSDZLR3dMNjFiSUNvODZJSVVUZ200VlFM?=
 =?utf-8?B?Skd6cGFQemg5YzAyaytBTVRPSzFTSkRoUEs2SGJFMkg0ZlYyYXBYYlJtWXRF?=
 =?utf-8?B?QldZSkpWZVpxaEhCOTZqMHdBUDdzSkZpVGoxaktnUHlRYVduTndZTkpTeFVQ?=
 =?utf-8?B?L3p6NDM3MjcyZVdHZjE0NktxbjJQMlhjRmtiQkx1SGc0Y1B0Nm5LdGtiRzNi?=
 =?utf-8?B?OVAzRjVybkUvRjZ4UUx0bmRWT1VGR0tweGxTTGM2RnNTTzdSb1FaQVJkQ1ow?=
 =?utf-8?B?emxmY1ZVYzJxYWVaZkQxYndWeStRWDIrUXBwcWZxZzcvSzFHT21lT21zSm9Q?=
 =?utf-8?B?V1hDMmR2dFYwWEp0NnZCRFV3WWlMR3FDRGo1eVRDOUE2dGMySXp6K1pBT2NN?=
 =?utf-8?B?c0hpNGt6MmROMDJTQS92WityNXZvNjB6blljY1BoT0x6dlg2UW9iNG5yMHZ4?=
 =?utf-8?B?V1EzNW03SWt1TlNjL081VndRazcyT3hOSkxpTFRZWTIrM2dRKzBnbStLa25n?=
 =?utf-8?B?Wk5wOFhYUmdUcTVNWjYvdko2S3QrWmJRMHdENXh2N2lZc0pRM3RZZnJwbldZ?=
 =?utf-8?B?bkxYQjFFdi96MXU4WU40eEZ2MU9NVHNkaW42VlRqV3hTNjhPaFcrK1dXM2lG?=
 =?utf-8?B?SUlwSCsyalFMKzRZOGZPeS9URXRwNVdIbSt5VmNsZ0ZCTzNJWFJVaWpiUGsv?=
 =?utf-8?B?V1RMK0IyNGUza0JvQVphemFBVThONkFpY0xTQUs2VnpWZ2F4QVVhRmdsQzI2?=
 =?utf-8?B?R3hScS8yenFxZGROMTBFMXFGTHZFOG04L1FRU2VzTFQrODQraHQvWUdaUXVx?=
 =?utf-8?B?dlJ1VW1YL3dHbzVRQTVvR3pla2dZQ1NYWGdMRE5sNE80N2FxbjJGeE0ybG00?=
 =?utf-8?B?TjM1TWVkUmI1SlN5dFlHMEEwRUlSbmtWcUNvekVTbWpiaWRCc2g3d1ZmQ3NX?=
 =?utf-8?B?V0FYYUx4aTMwT1YrR3VzUlVYZkd1YitzaFdkbFhBM0wxTlVaclo0VFRyMG5n?=
 =?utf-8?B?NTFBTGdsQk41QjhYWnIyTG83dnM1a3dOQWFpZEJVb1RGWHpsbHB4WThEaDlt?=
 =?utf-8?B?KzRVT2M3TURKMG1QY2x4dlh3ZzdMeFZ1L1JFT09KZVFnQkpaNHdUUU9YcEJr?=
 =?utf-8?B?aHJDRGlnNU9TK1Y1YzIyRjJ4Rk9HVXcyMzdrMW1tUXBMSkV6Z1U2YlVaSVZ4?=
 =?utf-8?B?TE5TSG9yRzdGT2huUUF0UXczSU9ZL3VUQnFpak50YVRtaDRkWHFySVdWWS8r?=
 =?utf-8?B?S3p5OUJOS2w2RVdiazV5cVRKdzkzUThQVUJ2SnQyOGtIQlFzODl4bktuaVYx?=
 =?utf-8?B?RTN0dHFRMDErdUFvMzJWdGVERzN0aUhicnM0UlRycU9IRDFqY0VCKzZUUnhX?=
 =?utf-8?B?aGg4WnRBUVZyZDdHd2lJOFZrRUNOUklBdEIwMzdGN2FZOXpNSURxR2hNRHBu?=
 =?utf-8?B?MTZCZmJKc0JMUGtRSTR5MmFVMVlJQkxoV0xwUk11Vi9zWnhXajlhQ3NkWDRl?=
 =?utf-8?B?Smc1ZENXV1MzOXJPRXRvQ3RZRElSM0EwRXFsa2w4RTROcHhyTzZJYjdqc0w4?=
 =?utf-8?B?blVtK2FhZTVsaXFhL3pZZ05waWZ1RGphYi80RkI4Sjc0QW44UVVQeVllYzdO?=
 =?utf-8?B?REtCQUFVZUJoNXdmc3JwcS9VVDVWRFdSdEFtOXljYlVYVWNMM1dKRXpaaWIr?=
 =?utf-8?B?TUZzSXNvWmg1YnFmR2h5c1JndnB6RDZQTVpGZVRESGdJNzBxemYxOUswT053?=
 =?utf-8?B?MjhFUlVleFg4cTVSTGZwUFNpdnVhWCtHcUovSjR1YnY4OWdNRko0aEV5WVJL?=
 =?utf-8?B?bm5SemhEVXNyTjBWamtSc0RHdjRHc2xrVjZzMUdCSDdsc2F0VWxYWTIybXEz?=
 =?utf-8?B?SkxmUHVnUEdiMTBhVG9qTCtVR09xc01UbTdYVFBDbWc2OGVNaFluS3V2SFhU?=
 =?utf-8?B?eGN3ZjlRTTVpdFpVOTdDSSttTTBIbTZkWm16Yis4bGNrWGg3VlZSc3JXM0RT?=
 =?utf-8?B?VUg0eXJPb0J1aVlqKzJTcnRZSFBOYWlMZmkrRGk4M085UG1RMmxMOUlJUzUy?=
 =?utf-8?B?anRrN0daaStJb096b3M3V3lJVU9YV3NMV0hFNlk2di9aRGxEWVFjMFdacDdP?=
 =?utf-8?B?RnRtQ0Z2YXdXMU1LL2NHd283Y3dNTVNkTlFBbTg2WnNLanAydWFiYkxYZ01M?=
 =?utf-8?B?RDkycHBZaXVwRnJWR0wyS05TMkM3Wml2WU1zc2l4V1VnLzV1V1hwcTNqVlli?=
 =?utf-8?B?QmtvMTdlNjA3ZVg3VExGZHV2SUdmRFJSYUhQVkhYc09MdjdycGRaUHpCRlZL?=
 =?utf-8?Q?VsZTeqXBt7Ank2lgNnAqANyvC+xaaml9qVJdZFTCrehB/?=
X-MS-Exchange-AntiSpam-MessageData-1: ttPXw92j1dTaPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72731a2-d393-49d8-2ae9-08de874fa00c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:41:59.2449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csiuHSMkWNrlLloVdkJDhKgfUoYA2k6ZdT03DCWWfDA2i1lMxCSGv1Jvkvtz5XewGJizhN9YKFdf0ueE7SzMuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

On Fri Mar 20, 2026 at 9:45 PM JST, Danilo Krummrich wrote:
> On Thu Mar 19, 2026 at 7:00 AM CET, Alexandre Courbot wrote:
>> The command-queue structure has a `dma_handle` method that returns the
>> DMA handle to the memory segment shared with the GSP. This works, but is
>> not ideal for the following reasons:
>>
>> - That method is effectively only ever called once, and is technically
>>   an accessor method since the handle doesn't change over time,
>> - It feels a bit out-of-place with the other methods of `Cmdq` which
>>   only deal with the sending or receiving of messages,
>> - The method has `pub(crate)` visibility, allowing other driver code to
>>   access this highly-sensitive handle.
>>
>> Address all these issues by turning `dma_handle` into a struct member
>> with `pub(super)` visibility. This keeps the method space focused, and
>> also ensures the member is not visible outside of the modules that need
>> it.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Linking my note from the original patch series [1].
>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
>
> [1] https://lore.kernel.org/all/DH60S91O053Z.1DDUJSL0D6NQQ@kernel.org/

Do you want me to add a `Link:` tag to the commit?
