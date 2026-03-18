Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013000.outbound.protection.outlook.com [40.93.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E779BE5E;
	Wed, 18 Mar 2026 00:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773792097; cv=fail; b=F4E8Lbfz87yvjMK+y7MgtqVsQgy21Ml+kuIFD6jgiBg8oSMBe1n5rrSX+VmdYNig7a/cH8tm4cpQwYKLH0h+lGBTi4WRA/Yrq7kSl3b1W2knMHFAa4/IUvim4IIfdVQx9Lg3gzVrgMGAX9zjBBBsOPqth2FxD8iKaDGV+CK1AeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773792097; c=relaxed/simple;
	bh=hgqrq24l9Dobfazc8Tj3PK/uSARZlV2/5pxUpFGMxfs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mBjIygWE4RqaAxzewlhDubXkpXdAG6mtIOHiMzX+5GIvtN/cuzaoVsyo025j/x4y6h3J38KtKs8RH6cVO31smd7w3A7btm12VlbJQIV+kUPxC/PSsMiuJJAQhDFiUywrVtQhaJHHhZhLT3U4jFJlHyjvhedb6ZDlFImv3t75KUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uGBaeOA9; arc=fail smtp.client-ip=40.93.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uGBaeOA9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJZaRF/SLUE19OCi1i3rkv6Ii2uTks7VwMiITSoEJRJPnlR4O777GATY0EwZsKW7DWvv2kogdqsA6J3k37YaLqQbVZ05BnOMlwqcWt8JkLgbTOzv09NZwAjvQkZXX9pK4Zs0PG90+5rLSd+KcJ0ipUGhoB9quA8y44+3HHzWePz2b8CymXSkZrV0oJS+7DjmD0RQAK6kmqYD5JyedaQKV8lkbYFY00qbrN2UBZe3P0+sk1orQH76l4+eGohOEKhrWPr6uQLxRc0/vm5bwH7DXNkqzcItQD/tGwSB3BF3hdvqa/vBnsIyIkjnEGLV7xjKyzvBWuP7bsHD6yOGDVd5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26S2YUGC+rfKH26uXCUUMyCthj2Dbd97T8i2VoTxt0I=;
 b=rVTu0M/1L5SYKFCpUb4Rr34XFWkh8HSiK1zuIfZC2RftCIbKBROK1eNybMT7/epUuX/ZYZCOI+3aYUikyhGxM2zXJk7j0N4Fd+UGp51Qk+YiHPWOa0BW+Cybc+aG9xJqiTQywFTvKv3dnZFVIwaZz8Q3VdTud39BRrnu5VlAuY79ffmPnfA/g+K3QRwmUVpIJI4QiEP1NqcSvXCsn2HX1hYqyubwbBjxBMjZcdImUhvoyGznymx2/xLBC05WaxB6yCCEQm0dYoAKiNQbeFbumj2My/vj05/47w9XYaU+O4vRmA0hmbelG/7pStNVNTXhyV9iDILQDcL4J42Dh3QlzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26S2YUGC+rfKH26uXCUUMyCthj2Dbd97T8i2VoTxt0I=;
 b=uGBaeOA9w+OOzXJL1/QvIAJdpy7hZqPXgTCAtZH+5EfYjVopRuPRN1R/nf3fICU7JqQw1XF+yF+dlF2F31mQoqxzpIzo2RfG2egBm+XbL75L6A22ZQ8xNnlOPPBdZCFACbrLOPIlJaD/ctCTg32MfgP6mMJ5cSeRjCyAiVhX52lHFZuZO7PLlzWFhLcErJbcOlc1w5knA4A5sGIqZUdpf1v/uSlFkg60j553MNLnOXdq6hrutzIXaaylrhrO/z4OHlsyOH/hAcF0wgjg3ba1IrxJ8roAeVVTAhGhJDdADUyJjYz45AFphHeusckaFUnulTZR34BnlDInX+WiIDqeQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9085.namprd12.prod.outlook.com (2603:10b6:a03:564::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Wed, 18 Mar
 2026 00:01:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 00:01:31 +0000
Message-ID: <b6d58cbe-a375-40f4-ae70-a3d7344160e5@nvidia.com>
Date: Tue, 17 Mar 2026 17:01:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/31] gpu: nova-core: add MCTP/NVDM protocol types for
 firmware communication
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-19-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260317225355.549853-19-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: 13aa151d-c440-4cd2-77ce-08de848182c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ad+v9xJk8j22QgjrILFp3i33pv81hBOxx57v9DZCmI2nLID1RQ9T2+RGgucK3Q4rezZ/ncHxKJt/Fi2gDGbZinNsLYIJsEb6svtNN4UhBDf+IGsR7u/XrTgJj4EywWw7g1L4qyiW3Sb+JT1M9WHW+/NwoyV94XgdSfXu2fjMXKgcm3kJOz0nA/3a1URNoXKuLO44bCLDJTXWOku0UK0P+9QsKex2Du8gXJWIVdlB0tUwqmv24E/q+PhdBoAqp5/ZUMugx/7W2hbX3Tfbhr/x11X+8LVS+sb73LacsxfQggr6Ag8LyUTKui5HnhFXB4iJf3IKLCdYiLSo0qn5QJQku0n3IqXB1CO0SlAQtNWp1qltOBjs8w8tTDlKzcyipSYl8BT17DPRv+bgmEFF5wkTeGuWR4Gp06g6MLV+uIxIxEMy/auTYP9mbAMvRcrnB2RwBmwF4L1n5uOuVd8aeSX1WWcEm09LFS6VwaGFSQvo2+gNvzofNNvRnv4jq5VzXj9LYTGLD9JlfWjyxBPOrqAR1FQKqoJNK9jiuC484WSzpdXH2OQSh74PTLKy0542Jd5A0IkoPPzw0ClXltQ73ly8rhinA7yXElS2/KEXcqjgQAkiD8Ytq4fBVlVdG5RDs0ia7N80nrn5oi5U7qgR1wRxe5VaAGxrgMjYfACZEF+vQ4N/1/eR21VDyaLESVxjjhghz0w854Xlm2LMmpJxU1A5yBpr7d82Kbt1VYYPAMalRUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2sxN2NmbkMxOXZyV3gyWDk5US9VUW9FZzU0Y2V0dTMwVitZODFyWFlDOEZn?=
 =?utf-8?B?dHF6RDR6S0l4OTdBeWRtVUtTNlc3RGpUYk9UbHYvR0N2TGFENzVVVUZBUmwr?=
 =?utf-8?B?ZXVJaEVpcDFRT2VJdjBJVVkydU11L1RuYVVZRWhPME1xWU5YSEZya2ZWWHRF?=
 =?utf-8?B?bHV0UjVZdStwclVNU1BQanpoNTRWNjZ0UE1zb0pBR2ZDa2hYQkhCL1dZYXJE?=
 =?utf-8?B?anYvK1dSTWZzdlllM29SdDM0RVMycWcyeEdWT1krZ21tb3JEUnpudm9IQ0hM?=
 =?utf-8?B?d1hjNFpiVnA0RWxydTEzenM3YjE0UkM4WUZWVkNRd0tvY3ZNdWlqN0E0akRC?=
 =?utf-8?B?YmdSMHRkUzRNaUF5TUpsQVN5MzBDOEQ3WE1qNUZydW9MZTk2clJoWWg5Ymgz?=
 =?utf-8?B?RzJkNDR3RWNYVWRwOVdYdHU2V0RjQlNya2JESklMcmNieTRndVlQRzBPb2tK?=
 =?utf-8?B?UGRLN24zVzYzYmtxNEhOb3Y2RzFFc2RTWm1aaXc5eWxJT0QvODFvbTdyNnRz?=
 =?utf-8?B?ZG8rZjhUUDlQZVZ5UTVmd2pZT21lUE42TXl0S0FwZnNqMTBWMnZXSnNiTHJR?=
 =?utf-8?B?dWVTSXUrSmFxa2xCRitvVmRRaC83T2QvYlVOblp3RzJpSUxxb2hCVS9DcUd1?=
 =?utf-8?B?ck1Vb2h4Q1picEt2NzNxL1FsaGZYaSt3QnYzSXU2U1R5VUNDZzZ1a2FUUWtD?=
 =?utf-8?B?Tmh2akVHQU45M0M5OXdSVzJ5NjhkRDAvbUpIL054aFNsSWxjbzhvY3gxd2Nl?=
 =?utf-8?B?Zjd3bS9BdWRTeHZMcGV2OXk3YktPSG5vRDdmV3dtWlJFbWFmUklNUS92Wmxs?=
 =?utf-8?B?M2hYbDhmbWVkc1l6RzJ1VngrVVVYdjdSY2d0QWRhREpGSlJUQnpoU0syU3pN?=
 =?utf-8?B?K3JleGgxWDYyOVBheUFXc0o5VkxiOGpCUGxlOG5DejA0Zi8yZ0Q5bVovRDlI?=
 =?utf-8?B?WXU5SFJXMDBBOWFVSlBRRElaaXpkVm5JdmdqemhPUHEzOEQ1N283OUpnVGI5?=
 =?utf-8?B?dE9qU1ZNeHZicWtWT2ppRWVSQ282djIybElXNDJySHF0dlg0bDY2cVpaRjQx?=
 =?utf-8?B?d3EzcndERHlOa20rTWdubFY0YWdTVzNmV3NDNlRJQjY1NzUwZy9NWURVOVdU?=
 =?utf-8?B?c0hEcUp1Z1RXbStQV05LRS9yYVp3T00yK1pFcnlyL3cwZSs4ejNoOFRUZW9y?=
 =?utf-8?B?M3dvdTRvcVJSQW5Gc3REakZJbGsydzJKYTRjRnRHQTVuWXVxRnNaMXk1OCs5?=
 =?utf-8?B?SWlxVlVGMkxReTVPWVBMWHdXbXNLdW5ZT2JONjV1MThtYW1wVW5vU3Z3SmpF?=
 =?utf-8?B?VS94Q0V0VUc5dmR3S1J1Q29keWIzbzByaUdYOGNSZE5LZ0dSdGhXeTlySGdT?=
 =?utf-8?B?UW9TcXRoWDdoU1ZjRWlpSmpoS0RCeGowWHkrb28vbE5HNk5JT3JncEh1MVVC?=
 =?utf-8?B?aHFTR1N3UlZJaldrTTJNdzN2d1k5S2NsQkoxYnJsNWFtMHJYM0IzNXZ0a2g0?=
 =?utf-8?B?ZFBLaGRnblA0dU5PUGNtWWJoVm52RWtjTlIwdlBOc2xLalhidHdhMXBzTy9L?=
 =?utf-8?B?R2lmazdtSnN1aEVUT0FiNTlVWXFKOGJYWVVEeFQzL0U3QzcrSDAzK1BNem9l?=
 =?utf-8?B?YnM2YW1sZHJSQUY5N0U0TnV2QjF3YjgwUmpwbzNIVSt6L1NvU1d6NGpKWE5s?=
 =?utf-8?B?QkJpQmRPYzJoR2tEaWJaMVFMajVmc1RtSXl1TnpVL0NCT1VCV1FhTVpUTlVB?=
 =?utf-8?B?dnBHTFdHYm1qRW5RLzExSHN2MXl1SmhDekdFQVhiUmIrQjJzakF2L3M1aVBw?=
 =?utf-8?B?SW5VdG5ORWlJNFZMUmFPZzFNNUNKK2loT2dkZ0xHaGxCbnFuTHRqQTIyMHN5?=
 =?utf-8?B?SkoreGR3R2RlcGY5d0h3dngzZjMxQ0VBbE5SenVPUktMVTVpZWNoUGJwandh?=
 =?utf-8?B?YlFBdGJnblVaVmlxNW5ySms2K0FOTW1oWHE0RlhCUmRjMWpPNEFHR2ZhWXdl?=
 =?utf-8?B?ci8rOHB1SHdlS3hiODM3WVV1Sm15V0IyS09qaXZiSkNmZ1hNdHpVK1MvQ0U5?=
 =?utf-8?B?M0M2ZkVRNkYxZEQ3VVpSQm1GRksyMEdKYzNzSkYwd0Iza010ZXhlYmxVcHFy?=
 =?utf-8?B?R1FtcGZ0R0JhY2lhUVBUL3RZSFBMZ1QwVVpyU2p2eHRsN2FtQnd6SVlVRWI1?=
 =?utf-8?B?eHB0dnZnb2JreXkzL2xNVEQ5d0RPZ2tqaXdMWnA0c2tIVDJVY2pIRnZqNC9z?=
 =?utf-8?B?MTdTUDJkK2hqbURsK01na0dhSDBrR3FWT1RWaVZBVEEvM2IrVHVzM25sNFkz?=
 =?utf-8?B?SU9FYmIyY2x3a3hBRzRmTmVqS0paaGxkenJXWE9hR1NGeGRkWnVBUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13aa151d-c440-4cd2-77ce-08de848182c4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 00:01:31.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpobCdNGevGtmesWe3G1Go0bnjr9VIMlHUPkRZaHyxioxBa62ZCuR1ahk5J/FYuN1xhaKMzDUYoyYZD9jVvKwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9085

On 3/17/26 3:53 PM, John Hubbard wrote:
...
> +bitfield! {
> +    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVIDIA firmware messages." {
> +        31:31 som as bool, "Start-of-message bit.";
> +        30:30 eom as bool, "End-of-message bit.";
> +        29:28 seq as u8, "Packet sequence number.";
> +        23:16 seid as u8, "Source endpoint ID.";

hmmm, I seem to remember my very slightly younger self insisting
that fields be listed from lowest to highest bits. And now I've
violated that in both headers in this patch. arghh

I'll fix it if there is a v8 required.

thanks,
-- 
John Hubbard
