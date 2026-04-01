Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A378364040;
	Wed,  1 Apr 2026 20:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775074934; cv=fail; b=JBaNRF814fSVP8CgLHwoPzT5f/px+jrNQgxsOFNLCEq8X1kdPKUg1kDg8CYKjqrytfvXznJ5Tus9D3nhk8bu3PCxdBFF35QGAHH2WSZni29UQKPQvWknAHlw5aptY4KZKfFb6zDiTHUTL8rIpEYIv6Ji6jOS6Pk2B2Ol+Pv5dIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775074934; c=relaxed/simple;
	bh=73y+UeOyqxRruwfo5fuqiER9HE2/c/0DEG4WDrT6DD8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hby4vL743Vuq5WKgBObISIHB0I0Ybkt2AiLa51BjuHU1Y58M7wreyVKwFY5kSMWz5KxGufieFolbyL8Bf42/mkdhmY1Uf5Zyc+TDt5Oj9Rip57JKPfsnnZZl7c6QhDmz0ooIic6WP1USgYpS3EcP38vG0WWIQ9W4n3cM867JGlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JOisncJR; arc=fail smtp.client-ip=52.101.46.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JOisncJR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kchoRJa6+EdeQYL2UDV/3Q4E549+CaHqG6o78Zaai7wTM6b+sdSFcOG7CUXrEnYsOOSY8uVu4ZPgpJ7Ufc6BMASDHWnOKfw/GgLDYYsW5gTZwbG53ql/B4TZOIockI7gsgkuh9m3wwHcLP/vQm8GAcU7qn5uX1Ip6YOQJHNHEMy4hNxs76/jFD7pWgJIp8m/XkcjlOnungkSlHkwdR7XXmZQyI0ZcaxePlYFw+TaEjhKGHui7tA3gsGAntxwuGaJ60mIebTZExPDVyQuzTAkobq4AcGlcBzxD6/GbYFNQ+rBPAKaxke8yh6yk5ftCTzcU/G6uLeq0QLupRqtT5zq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Y4Htux6RtEmu4nBXzyx3mwDu0kdR706h61NizROwEo=;
 b=olbruIAkt6ouEZ7WJML3zkd2Qhr2TYxv/7MRV12xkk7zmlV5kR+FRlMlJEpwc3vdN1gr34nWIIFAv9biqcgyiESV6xjMUcNclwbeU4aB69yGQKO4rPTXU/6zdApPUyj4Tjp+thobVPy6wBqpO6K3Qemi/kMp1H4vhexkMV5/55xAVYbagD2/UKymHmI0tB8/hEHTX/bnkJwHrRyYN47+U6mntIBB3damXF292XKWje7ni0BKOij9qwwKjwUl8UuYjZURxnn7ZjexSq8YDqEsY5XS7H8tKqWL0eFyI9ZMbVa6lY897DHgPe7INNqPiy5s8y7zsuuaLsfWzKscGzbiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Y4Htux6RtEmu4nBXzyx3mwDu0kdR706h61NizROwEo=;
 b=JOisncJRfFebJ4Tp7D0gLVuAvTTzsLOFt1xIFSAQ2eUrEF6Rv5NaIDkOuyS09cN8s6XSvmjDmXXvJGFNJta6VyMQAKnSS6bdgXCvrg4utJac9B3v+XHAItjNfKAqFEBbscTm2L39SJisQLb4eMA+uvOPqNdn4xDbHvHLrsqOM6e6Axu+1CYSP/bov9dX3wmf4cv5gKssdXjEQsv4TGdbr4FJSGE2EGMmhS1jz70bQwMT7AMZ0NmElBMcecUpZYqb05jnfgR4oUIJTN3TVtXZR1BHJtcZfeAF8VLddFAxEfEZEekE+qXYNfh+UuliMRH20toeVxgF6ltGMbeAzMFjfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ0PR12MB6944.namprd12.prod.outlook.com (2603:10b6:a03:47b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 1 Apr
 2026 20:22:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 20:22:09 +0000
Message-ID: <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
Date: Wed, 1 Apr 2026 13:22:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
To: Alice Ryhl <aliceryhl@google.com>, '@google.com
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <aczpifqz5CoOFB3N@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ0PR12MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1de800-6a56-42cc-c4ec-08de902c5a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NGSoZ9wvgLebiqz9DXhVcNUH1IPk0u/t+M9repfzo+CQyPnMcHOBjZ9YHk93psCthpnuH4E3mXj2dM9AL3xeVt08XMcnzEYQQs/foQ5yT1/QLJbYntgjS6d1s4/kk4LCtfatd5Dp/p9VN6edHZI7rFXOmVZ9SbR8ZHIrgEHbdTlIrLxckV+gF54OkBDvrT899GhvGkaeYOzuCxSsTJ2XDrjMmgJTytFzPKI/GrfpPZEzyWdmC72iJAriCXfDQsCa+voHaEFSsdKFamGvrAhzMiXf0o6mZBFXCGt++mMu9q829zDICQaybjHqcnZu+QoxBHu2K/SFgLUEba7VVASe9y8Bx9zV4MgWC+NdorfPM9+KQwJRj+oyxDEWDbo8HYTP8BBMyXSGZfbncPpzIgCMGf87L9Ir7c2zc0uEgxSh9z+ULb45tc3NwdokSP+qO/GpsCekkPIHe+RZQ/rESReNu/Q2WeOhWestx8KtuHDi1Soi5LgBd38JEk3RJq1JPZmKOftteC35MRakw0WhBtc+DPJM9BlDwwUaZhtl2FwPttMqpKEaJPFUIZb9Zc8wYdFfwk6fUcAPF0kQF7tvw1zyKyJjbYUjNYL/rP/H6yGcBsBKcOdLgBRRErOgRgRW8gHiuF0nkSwxtD0qcD2E56KbNOBKHF1AWrchXx+tHMFSNmOwbIb2HTLrGcpmlKAsAXvbs5Y7UBwyZUCQ0I94YFYpsanpIbdUZt6a+xOCdvOtc+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWtsNzhYTUp2Tk53S3puU3V4OGRJRmREbEprYURsU093L3ArZFltVjhNVnE5?=
 =?utf-8?B?K2xCb3BpVGQ3SHpLaXI1M0llaFZtV0UwYTRlOTl2WG9OZE5WbFlxYkFOWENn?=
 =?utf-8?B?T2Z0YmsxbUxjWUdISGhaa2hVTnhaWXhkS0pUc3I2RG5QU21hRlNHUVFNZHpV?=
 =?utf-8?B?QkgrSXVrM3VoNEdpcWlEa3ZocWVWUERUakFnRjRUQms3U21MK0NVbWJMV21a?=
 =?utf-8?B?dVZLRTNxa3hNMHZKZ3VNYXU1QnJ0YkdGMk1wLzY5VnBDOXBGd25XQnIyUTlY?=
 =?utf-8?B?RkJ4MkVnRjcwajJtZFB4QUpOOUVPeUJHZVNQQ0NDTHZPZDQ4ZDQ3RWNlSFBB?=
 =?utf-8?B?SWpRQ2dTTVIyNmxFZFJnY1JLN05BQTJjTWR4U29RNHBiSDh4djhlNERaaG1v?=
 =?utf-8?B?clRkRTM2bEFLTzZmUmMrR1BobEJyU2NXZFdqd2IwbFQ1RkF5Um9XZ3VJSzNK?=
 =?utf-8?B?Z0NtUEFhNUZ4L0hvQkJBQVJLNGR5ZThDM0ZKMjVZRjBwdXBjTG9IMDFrUS9s?=
 =?utf-8?B?WXpTeVBsTmpjUWI5U250MTBJd3QxM2tuZG5sd3loK0o4TVc1UWhPZ0RFeG9a?=
 =?utf-8?B?bXFDQnhRTkg0eEFxUHFsNXVLKzA0TEdKNkpXTllOMVpvWGhMbjJ0RnVEdThl?=
 =?utf-8?B?R1BZMnBOU0ZqVzdoaEUxVkJaQVpaK25qOEErQnZlSzdKVDhjR0xiaGRPbWFr?=
 =?utf-8?B?YXlSSTEwSG5GeTVIc0dNenhlbmlhdm1RQVNsNTd4cC82MzNqOGgxMVBNSzV6?=
 =?utf-8?B?a2FuNmVKQitsLzNsUllEdUllaXR2OGFXdWZWU2R2UmRWbHZrTUVZUkpQeGFT?=
 =?utf-8?B?WE9vK1FiS3p4M1VsRTExK05WZDR6SUNKQXNxOEJWUzN1VGppMnIvR1dkbTJn?=
 =?utf-8?B?bWVNQzVBZW03YzRpRE5UcGIzWXB0VEwvNEdxNnZ4cExVbEZ1TFN2Qko2RllY?=
 =?utf-8?B?UUkyN0I0bGYvWXdJVnlVeThxN21TejRiekc5WmZLUTJ6Yk85MFEzTjZBa3RY?=
 =?utf-8?B?amFjemkwWjJXaEFGYnRpa0NHbFFOSnpadDVCdG1UOXpidi9FZGJkbi9nUWJM?=
 =?utf-8?B?TXpEd0w4ZjhTalZPLy9QdDN0d2VXTERBdS9WR0tKcEsyMVlQVThYOFpKbEFZ?=
 =?utf-8?B?emw0QU9yekdKS3BOMkt2SGxmWkpsVUczejNLRHh0aXg3WU1adVNjVUhQVkQw?=
 =?utf-8?B?V1BtV3p0d3VDVmJ0cHRHYzRLQmdCOEs2Z2t0NmQ2dXhBUFp0aDhDemhSbGVW?=
 =?utf-8?B?VnpiWlFVOFR3ZnpsOVFsaldLOFZyV0xPMTZ2Y3lyWTYyaFY0aG5UV3VzbUpY?=
 =?utf-8?B?Qy9GZXp6RFVRV3ZzOVg2MHhlVXhRY1p5TStDVDhxZHJWc0ZqN21hancwUURL?=
 =?utf-8?B?VEpNZCttdmtVRlVJNTI3elA3WDJLRHQxVmIvZEgwYlBPL2tyOCtmaUNwZU9h?=
 =?utf-8?B?d1FkeTVPSmJ3emdnVFdBeXo2b2YrUEhtSVFsMXIvY21sOU93amlJSDNRMVdy?=
 =?utf-8?B?L3YvR0tWVFk4aHpETGVnaEVmVC9aMjZ3VGphcmFZVTJBMUxxTWZrejdnVXh5?=
 =?utf-8?B?TklRcGRmdGsvQWZJQVZobmxEY3ZJUjZxWUtNTUhuTXREeWdTUHlwcGZCTy9T?=
 =?utf-8?B?UmZ1aFlJR1BzQ2RwOEw1YU5mSUZqQTYzUjZRM1QxRk5VQlRjM2VGL0RvN2Rp?=
 =?utf-8?B?OGNtTjlhVFJweldtZFZaTVpQcmR0YWs0a1E4WkRFUWZ2dTN2Q3kwc3VYV3hH?=
 =?utf-8?B?UTJ0SDZpSnUraDU5S2ZnVEMwNUdEdXFoQXUyVkg2aFhtMEVxNDR4eXY5RHVx?=
 =?utf-8?B?UmFkQ0lWdVMxODdOdkY0N2o1cG9FMk0velBwZWhjR1llK1MzRGJwaWZOakVM?=
 =?utf-8?B?dWhSWVp4STRMVmpKekhyUDFhNlpIeXJtMEdRd1FDWkdrSUF4a3BDemNSMWRM?=
 =?utf-8?B?ZzMwNTI1VlZSb29iUHg4MWMyYXBUVWd3UGcwMGlKZWd4ZVh0dVA2TjRrL3hJ?=
 =?utf-8?B?YTB1b2I3bkowbi93cVVnekJqZW56b2xsOEkzdDQvd0NXV24zZFlsUDdhNjda?=
 =?utf-8?B?SE5kMEFpN0c5OGR0cUxFcGhjZ0RwTnVtRDJmNXFCRFI4UWZDRHE5cHA1M2FF?=
 =?utf-8?B?dDNaRTZ2TlBoaWNWVTNnNTUzczlXYnlLTGZaYWRXZFBPOFFQaStHNUtjaUU3?=
 =?utf-8?B?ZU56MHVMU2xhaVMwV2loQWdHS3BBWXZwSm9sMFBmNFByQlNRUXdiK1ZtZlY1?=
 =?utf-8?B?TkFISEpoYWxkMVYxQlp4clNmY2hlbDJXbmlvL0I1dXFaaENkNHFvT2E4WlQr?=
 =?utf-8?B?QkpMU3UxbFhkRnZaNWhKOWFDdStYell6Zzd4QitmYm1GTzdqWDIxdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1de800-6a56-42cc-c4ec-08de902c5a00
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 20:22:09.8117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cb9T+4uMQfMPCRnlVpTt0L60r9AxYtYpb0P9wOmRfi3cMoI8q8r+lBn4Dwr4OUJX7wNLZWKivGJXSzeFoLRZkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6944

On 4/1/26 2:46 AM, Alice Ryhl wrote:
> On Tue, Mar 31, 2026 at 03:43:18PM -0700, John Hubbard wrote:
>> The SZ_* constants are usize, matching the CPU pointer width. But
>> device address spaces have their own widths (32-bit MMIO windows,
>> 64-bit GPU framebuffers, etc.), so drivers end up casting these
>> constants with SZ_1M as u64 or helper functions. This adds
>> boilerplate with no safety benefit.
>>
>> Add a DeviceSize trait with associated SZ_* constants, implemented
>> for u32, u64, and usize. With the trait in scope, callers write
>> u64::SZ_1M or u32::SZ_4K to get the constant in their device's
>> native width. All SZ_* values fit in a u32, so every implementation
>> is lossless. Each impl has a const assert to catch any future
>> constant that would overflow.
>>
>> A define_sizes! macro generates everything from a single internal
>> list of names. The macro takes the target types as arguments, so
>> adding a new target type requires changing only the call site.
>>
>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
>> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> The name `DeviceSize` seems overly specific to the use-case you had. It

Yes, actually this name has been worrying me from the start. Because
it is not necessary to tie it, conceptually, to devices at all.

> also makes it sound like something you would implement *for* the device
> type rather than for the integer type. Why not name it something more
> generic such as SizeConstants?

Yes, thanks, I do think SizeConstants is more accurate.

I'm inclined to make that change, unless someone else tells me not
to...let's see.


thanks,
-- 
John Hubbard

