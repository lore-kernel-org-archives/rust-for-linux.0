Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443815E97;
	Mon, 30 Mar 2026 19:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898154; cv=fail; b=guttpJ1iodN40NbVXbIgBNt6r+a39zI+UdaT30Nhhf1eMHPfIU5hN4M9Mb1xc2nakXPCkJ8Iy1EE4QYxDRlcaGoZhF3ECJFg43pysLPt+DScMThu+hXjgAZJGf6nh7QHaKGmrRF6QDb3zLQy3qgorpA1KuR9xVw9csybADi4tsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898154; c=relaxed/simple;
	bh=oN00tYQieFvt4aUXngHoilLXH0JLcSfjsXSlUs/suMM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GifQu7RthT4SeIBJrj0SqGU0uqwL1pxL/SfPyx4rPtFm6VnO+VCLfZMP2u+lz7rxG8BTVrFZpzRfgKlGletKlXQ0EeXsuqtilbl92PluJFsKjELJvZC51ItBP9PFjypfbDC342+4vuz/Prj0NMkWZBRJjVxj3QUYmfAZJ4M0ce4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PPX7Pv+2; arc=fail smtp.client-ip=52.101.85.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PPX7Pv+2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUdNtSLF7WWr+bIOhMgcmqTbGk1cDq8q8skTkvS3WJ44EeEQ2WmkixqWtj2FYxcLMFDcty8qFuOZ+bZsWQlEE2aG7MhLibJc3j8VY49+Bfu2Jffo7zUpItNUv0zNjvweJN5dUQaakZA+DCnLaALUT3uRZoAx57tw1ba4KvuFTBjxBb8nftevCtamYNk4SYJqVUSUYSOUSIWNNgbSOsyNBrJks/eQcAe0nQc8/8R39LfdnRcOhQp4/MwNu1l4H81RBdyHoMzFU1ZjPyhYcpdFvC7ra9XNgBrYPJ4h1WTC1dxQURk1VMRZEDHBxMkAaKZeVTfIK4rZ/TozlwjCTOHG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wm+ZN832o9SBjkSqxqJNmxXCS7cbX6S9aLpgbWlwYw=;
 b=bcSFN0faKr88emaYAXxk93wv0cp1f9ffe7Sfo284YwCMZSTePpbn2AXO4+a6EV6XtOx9vtj07Ea+fzgNblyS2+6ev5mi9Rce/FD+ZIK1bbsVXBxEL25AL6hJJedHtABGJAjQX5X5y7KG8FtN1MxUv59O3/7Lq7Kg3uJ4WHtO4CMxYFhxRJqwJJgjtbPTbk5aDiyM4hleEtI0tZfTf+0RqIBErqUJ787CA/6kR7u8UL4n+MzSfW79RqyKNk47FTMkjSjh27I4nMT7vLzPqwoab374U9pErlmAgTc+ZmxuSqkJINjEFFBvalio6YRu2QshxpXmk5NzCYB2esIoUAd8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wm+ZN832o9SBjkSqxqJNmxXCS7cbX6S9aLpgbWlwYw=;
 b=PPX7Pv+2yMdiZAyXSDkMjGddoTbiEK9l2+njTTflcBkkFFQUVHPPnF+VmbOuU07fzJSXRmDlnSKFNhlsAje3EuMbwEr2xsTycQ6mRmhFFJbZVD7NdjcS7JdxjYDb+tu/bVsfADEsgkV4Wla8kzaerKm/5Y5i/teEUk79pJjdPbBrXDqkQaWiFf3OH5PxhTPWSGWdHMpOBuTXmxG5hGSEwxjw6K4ZJaxlUnELo0OakQ1sDaSZH+TJaWKHpAdn/aSaUQvO62dhqxSi1DsL7YUGwKyv5B7mynm/vu5j9Kfs41s/nDlglalq6akzc2HydxH+dSHsEMTOUo68vDVUh6wrOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV3PR12MB9409.namprd12.prod.outlook.com (2603:10b6:408:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Mon, 30 Mar
 2026 19:15:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.011; Mon, 30 Mar 2026
 19:15:46 +0000
Message-ID: <ce3de9cd-0157-45a9-b50c-9a39245b3b8f@nvidia.com>
Date: Mon, 30 Mar 2026 12:15:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-7-jhubbard@nvidia.com>
 <DHG7AEASTW6E.2QTXB1D0GA0UF@nvidia.com>
 <79c3a1f1-50f4-475b-8a56-282289164ee3@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <79c3a1f1-50f4-475b-8a56-282289164ee3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV3PR12MB9409:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d525c5a-14b0-4367-7ad1-08de8e90beef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VvmZjlpeWXKeKpWSH5KjcsOvYSUvPKr7gfG/QVeTLBszVKYnw2KU6g8TdyyCeYVv9PMC8vjxm3JcsPcbwNyjlBO80QCnL2XI/yttYaxraqKw9HaUn4ftuEtYvaVa7YX9k8ic3FhQDLGi64VH2sOofH8LexOyXDLMdmaSZK9ZefEIRGexWbiH2c/6BJlRejeLgNAIkKvsdZYDN3KGtA1V4MreXmKvJ7i37UAUY5kNrGMJf64lZXdK2QsQXyv0DUZt5aiteD4JLtS9TmLVTRiH1NeFwX3O/9OQ8qqA2BlKkkXKt2tEQh5SM5DuQETf6vknowipyFllfpuLjBY0AGacjM7OBnBJ1Ep9yzwLjp5uT4wVsxkVB4WJ9dpGQtFjYbvS1fK2FNv94zYguteX4ejH7Rsa2SLwYMt+OyiJxtIJmiW95hg5YVPnr0UpK5fdIxlGqocJgThMmPRld7bogiHDeQQGFzzXRMPZikAPTMpUj21O6keoNaWaGOBIJ94PDc7X8hm/r1NyAcCPiIcwUq08VzplhAiDHAILf89YOkJZXy1CrQ2zC3yACuwSDZfMjkR1hEVlX0v0xEkmGPWEA3F9RCQDX7xs7rrGwLdAPQv5OG5p9H7qyTWL+HPpTNljNhR1BM5fR3hqtSpOXW063fSmIs63idXlxeYemE/pCNRuB66KoQf5vZ0mYpLq1kFitOIwguBFYM8FUoE+oHgVCIW5UqoEkCwFvl5inGUhvAQhOQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZqN3JGTksxN0FzeXQ4YWNvanp0NG1qQmlraHd0NnZjNGVSNU52Q2lwbGI4?=
 =?utf-8?B?eUxOR1lQSVNIYVYwYURFdFhPRXJ1NkdmMHRmY3ZCazdxNk4zREZENGxzRzE2?=
 =?utf-8?B?NEVHeld5WEhmUXhVZGplNEhLOFRLelNjMHhSTTB0REFaekwzTWMwcjhRM0Jy?=
 =?utf-8?B?UFQ5alpreVh3RFhtcUFjQi8xMFFVcHR4MUc5ellNeUhDaFNSVGZ4UituaXY3?=
 =?utf-8?B?eFAzOXkwRVBCSjhkenUwVUJ0dFRnUk14d2ZEOC8yWTN5MWthVDk4VGJvb3ph?=
 =?utf-8?B?QmxrVlQrekd2amZ0Q3o3R0dzR0NNdDZ5dE1ibTRHNlFiSmVTMUFuZHF6QVhz?=
 =?utf-8?B?Q0d2OE9LVTR6WXFxUmpPMCtXZUxQT2syVytvSk5VRnVwZUJrTXZRRXdYbERh?=
 =?utf-8?B?aVdMSkFub0FpS0dIVk8vY25uaTF3bjBhdTM5eldCeEZod1F0TWdJR2hLVG5l?=
 =?utf-8?B?REpwaW9iZEh2aXFaL1VaY2RkR2ZEd0ZKVk5BYjlQaDlmNGRzMVlQN0hUdXRJ?=
 =?utf-8?B?WFJZb2l1c1dMRm9zdkh1RmUxL25oTmNlYUxqVXQ4djZXS1lsSnBKanFxbTNx?=
 =?utf-8?B?RTF1UUVOemtJM2JmYkdlSHg0MXNhN2NFb1dXMXMrMFM5Y25EczJqdzhYcmsy?=
 =?utf-8?B?ZkdYaDNncWQ2SnZyZy85cDF0N0U4ZDBrcVoxQmJ0dFBTdXRoNHdYVzNPV2oy?=
 =?utf-8?B?d3Q4VUxmZDE2NGJ4OGFKTXRxaE4weGFOOGxQcitmaUpZaXFvVlN2anRXN2RW?=
 =?utf-8?B?ZEZZY3RNNXVWSGpQcWptTDJpVERIbkJFTk04MUs0VTZMNnEyeFpOU01PSEt2?=
 =?utf-8?B?cHhGZWp0dnZMMWxPSEEyeE95RDFZQlMxWGZPYzFCR29XTHErOS9GcFRzOEJl?=
 =?utf-8?B?UCtRUHBQaXVSeWwzakZJa2dLQlpSczYzTGxUNThDWHAvT2V4THM4clpBRFJG?=
 =?utf-8?B?YWx3a1NvamdJV2twZUZnSmZsQ0JmMGxCZGp4TEl0aHkyL3hSUEc5aGFia0lr?=
 =?utf-8?B?NWp5NlY4TE5Ed2JOYm10am5jdkhrczJING9BTkRVZmpmQWhQTGpqSkpoVU1l?=
 =?utf-8?B?aGlNaVVGMGYxeS92elExUkRwLzluMmdUaXlHdzRSVUFqMW8yNk5QOFMwTlBU?=
 =?utf-8?B?MTV5YmZhNTF6TWNMV2U2OXhYUDlQQmN5bjJ1bVZKYVdtNFFlUHNjOHJkTnFI?=
 =?utf-8?B?SWhTZTdVMWU4cCt2anVHQTlKSVBNbGxtRGlLSXpLOFliRkZHS1MvU01ISDY4?=
 =?utf-8?B?eDRweEx4N2JvOFV2UGYyZlBNTEtnUklIdWt6NUp5OERCd1NMTjl6MWpqS2pE?=
 =?utf-8?B?MFFieW1leDBxYi80SWVQcGdqVTZEOHZobjh4VXdUMG5xTjVOcXJJMnBoQTdO?=
 =?utf-8?B?Tm40UWIvVWg5QVQvSnd2bFhicjc1c0JnSHZvdER2aXJkS3VNQk1JZ2FTeFJO?=
 =?utf-8?B?b29yQmUwUno4eS9VUTZIKzJMNytnWmRFRWk0S0xzU0ZTUEx2MUY4dkI5Zitn?=
 =?utf-8?B?OHhLTmhvUjNuR0Z6UXpsa2lXekdLZFZtbkN2QlZWUlhlN1RTOE9SNlhXRWcy?=
 =?utf-8?B?VlBhT2FXWVZQbkV3YTJSdUd6MDRiMUQ3M3hsUE9JYVdiUG5FTFJlNVA3amJV?=
 =?utf-8?B?aVoraXAwU1Q3TDV5UVVvclhtVDhaN1pYMmVWRk5DUTZsZ0k0ZFFHZi9aOExa?=
 =?utf-8?B?eVl3OERlZlI4elFRdEswTzFmdTByVGRsU3NnVit0b055cjNqMjYxT3h2UkVL?=
 =?utf-8?B?ZEhIVnFCNGhJN2RMdGxTbGhmOXpINy80OXJJQVozRG9lY1JFT0dyU0NndDNz?=
 =?utf-8?B?SFJqc29SM1JaYmJXRzJDVTJVQnUyenlZejRXTHgrRWNXZVJqaW9WTlJla1VG?=
 =?utf-8?B?b3o5cmduS0xqMVowYW55NkcyUmlTdGM3U2pnRDhIMUgvMjlwSy8reElxSlhl?=
 =?utf-8?B?eWIyemMyb1RwYWw4WUxOZ282Nm43UzJMYThrU2JPb3B3MjBjNnBnTjdxa2Mz?=
 =?utf-8?B?MmhXMko2N3JaZmFSWEgrcnArTXVEYmkrU2ZHVFVXdXVDRTJ6ZUM3d3RFN3cy?=
 =?utf-8?B?bmNzNzQ0cGxCT3ZTWjNPaS9RZHJNZGlVQnYrMXFoczZkTVRFY1NPQ1YvdExV?=
 =?utf-8?B?NkNTaStQYUEvTkM5NmRBRmFuTHZxY2dLKzA4OGUza2l1cVFMSjVhQzQzamdF?=
 =?utf-8?B?MFZKTGRXemF0TVlud0JxZTRDUkRzQjczS0VKRUVEcDUrenhvYnlwL0hWQ0xH?=
 =?utf-8?B?bFRPOURHKy9mb1k4SHo1Y1NJT1d0OXVCbjFxSVlNaXIxQjczeXQ2VWRwdzh4?=
 =?utf-8?B?WjZrVDJPdmNCRlZRUDJhVzdQeSs3TjBJQ1k5U2Y4V1M4dllsTDBtZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d525c5a-14b0-4367-7ad1-08de8e90beef
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:15:46.5972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UC3ezP5YJ//aYzbVtgattkpj4jJVqp8nsu/jqU0STYId49AAIPRhqP1AS2z3bObf3Tdg5QcG/ktq7S4E2EE2Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9409

On 3/30/26 11:33 AM, Joel Fernandes wrote:
> On 3/30/2026 10:52 AM, Alexandre Courbot wrote:
>> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
...
>>> +pub(crate) trait GpuHal {
>>> +    /// Waits for GFW_BOOT completion if required by this hardware family.
>>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
>>> +}
>>> +
>>> +struct Tu102;
>>> +struct Gh100;
>>> +
>>> +impl GpuHal for Tu102 {
>>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
>>> +        gfw::wait_gfw_boot_completion(bar)
>>> +    }
>>> +}
>>> +
>>> +impl GpuHal for Gh100 {
>>> +    fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
>>> +        Ok(())
>>> +    }
>>> +}
>>
>> Please take a look at how other HALs are implemented: each HAL instance
>> is in its own module. That's not just a cosmetic choice; it allows us to
>> keep the chipset's specific HAL struct and its helpers completely
>> private and forces us to make code-sharing explicit. Furthermore, this
>> particular HAL is bound to grow, so let's split it properly from the
>> start.
>>
>> If you do that it also makes more sense to use constants (contrary to
>> Gary's feedback on v8), if only to align with the rest of the driver.
>>
>> Once this is done, making `gpu::hal::tu102` absorb the `gfw` module is
>> trivial, so let's do that while we are at it - having `gfw` as being
>> driver-wide makes little sense since it has a very limited role for a
>> specific subset of the chips we support.
> 
> I feel a HAL might be overkill for this. Looking at the series, this is also the
> only method. I am doubtful future architectures will have to once again wait for
> GFW boot (is that expected?).

Definitely not! We are moving to futurue firmware that does all of its
own initialization, without all of these intrusive and fussy
steps and interventions from the kernel driver that we are doing
today.

> 
> If not, we can just match or conditional on .arch(). We do that already in other
> places.
> 
> Something like:
>    if spec.chipset().arch() < Architecture::Hopper {
>        gfw::wait_gfw_boot_completion(bar)?;
>    }
> 
> 
> Thoughts?
> 

I have a feeling this matches an earlier version of the patchset,
actually. :).

I also think a HAL for this tiny aspect is overkill, but I also don't
really mind either putting it into a HAL, or not. Because either
way the code is readable.

thanks,
John Hubbard
