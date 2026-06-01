Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D333E2769;
	Mon,  1 Jun 2026 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337398; cv=fail; b=Vxff/nGXIw3YXX9ZiLZDzj8trUwVrbrZlvP8q/CUVjL5sLPQzIgrHBaDA39NnAK2usIIj1hoFeKTc8hN5UPJ8y8kRMvwavGagkNHDo+LAiv80P0tbV6kBElOb1X3CHv7NefnejPG5vLCMyVMJzaLndfVFgMyLAHhOucwHxG3qzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337398; c=relaxed/simple;
	bh=Q3j7baSSfN/2+YT2N0eAWDnTHVS1hVVbQcVESEVB4SY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W0v2jM7aiXbdjV0vl5abUkbGo0rXY4FTlUfn8PSPUWVIeYw5+UiPr33BpPzVCzLDx0T0/8FPY1+bz1u/zBHRX724ZkWFebmBpjg2jbOMYUOE7EOcwKgzktIRFX1Wn5aKrykhgqFxTide8EBBhj/qrHp8l61WnmOzhNzW/X0+DxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j4hZhjrK; arc=fail smtp.client-ip=40.107.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j4hZhjrK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFWkAn2/C7cTGUE0vad+239vm2NvR8IFMV1cYByVeDY5QJ+FY7NwuzfppRhvjWgBOyiKHKIEhO3BgH2IQzRgE+OFyhGLI7hAaWkOdPyR4oAxdWLJfCm7vBy4IfGgPMDMeuWs6UOIivW/uyDKwL9Q1w9VUBe+8GTa7Md9eWgfjkJ95QKIsDrc3jk/P2n5WUJw83RBaXY9PJdzNK/YvzMn1iIpYs+pRf6NFTYIbLXiHRQlwKESo1iuU0m9f7Bz2goZOt8cb7E6H+6T0zXWb7qnFNAemR5XIP/4q9oOyzboz+yvXyOXbpq+/oq5pW7LYIXbiCjwpbKklLS7otiAY0bO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kUGG9zPRmb6TRXk2J+GAkcLrpuXmcT87kzQeca7G7c=;
 b=PS6Lkceyv9Yq/FoC0A6OYjIUKijoMPAh6jy0/JgcVggnCz0TB8eweMZCSQxH5mz79+J+1my4wCO0MjPDaQdF9gEFYjNhUULpbX/8oAmbuhTAkVs7b6eXYB0xq+XsIbjj1eZsd9lvEgdkg+5jPeekcWNOhsC99CXM7eE9Y1nNb2fcekldwtqjFyVNmhzkRNOpiYUSoMt84eMwdD04vGUyj0QqgkbL4ZbA5jAS8235lfUvENjKGeloJ5SnyVp4ldz4R1p2I7XpMTqBdHgdjr0mHwWLqV2HA+LnyEWd9f8JPMPX0s0eMygOM9qwrvpzx1Zh3PMnDGzXobAwGOORuoQfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kUGG9zPRmb6TRXk2J+GAkcLrpuXmcT87kzQeca7G7c=;
 b=j4hZhjrK0/WMiIOf6ZJpSALz49YcpBSKCFHRwjEi6QZ5OKPkQ23Y25BAmdJNyAdX2OIeBsO94a1g8mr1xhjiUYx680QnNqb4wkPPsAsnqCQ5l5SDd131JMrhiTnr7EEcChLESkObRCXM9JWIjzsJ02WS2riS2U80FRzHLwvfXHPKz98xN6MKSBMQiFP8hhbuFdimxSlJciKz8WlqHB0lW+2j/VCW7b752MVatKk8mIMbQsUCnQUutjKobc+EJoyN0hsJsGsD3N0t6w6Xx+oSBplhPiiy+k/pBv9EfQhrXQiPKtEYmEUmujYrmrvBBLDD6RXGLk2ItkkJOQoqZsVvEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW6PR12MB8734.namprd12.prod.outlook.com (2603:10b6:303:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 18:09:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:09:50 +0000
Message-ID: <567c9ede-2c00-4107-bf21-f46bee77f91d@nvidia.com>
Date: Mon, 1 Jun 2026 11:09:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
To: Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-7-jhubbard@nvidia.com>
 <DIXJEO0ILZVH.2BOQ4HKC3396B@nvidia.com>
 <DIXQMLMN7RQO.1OUEPLVALLMXK@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DIXQMLMN7RQO.1OUEPLVALLMXK@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW6PR12MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: d353b9fb-e174-410e-c963-08dec008f8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	yWPIYMh7EM3hRuAMMXoihyQy3yOYvNM5kC8vetjN29WDUX+46Z0k3aXw32azeDFlK8mMiGQgUnTfhp2H4b/v9h0e7xkiYRXyOfXNwI4Uy51MmsPYKfirML276OpX2PXpz0yey+rsphSFk9QJMFKOCcHgMUwFc6b/fD99/N1WzZJvq0wC6l6nh4rz+75jJXMw6zkSjeU5mbmoF3tUapN8aputXSLGb4nX5Fj0DG6Jmu50/GF3goLo1ibCjg4S75H7Rm3LBaBGaL8RDF1jEjPt/jsZh5rcU6+9Ud1XrbTdu7jshTrF0L6xbt9vAiNwdaNZEvtVJlLAmM2tuk74KRnxRdp1aq2UE8+eYQ3MDjSYKQ+9v5IpbBkoTWpemoXu9HySD/nMOunJrS5zLTU4slbHN+/XIUO1iNN9f4cQ7ceIuRJx0HWpSNgx7LS4sdMzVZjWk8XoTK/iLBHs1o4ySZcMo6Zk1AFkvtfyHRWlmY3aa+CeMss77AGkuIoFX1rSBgRZTj0nJ2hcSURbu/cfTDLAcO2zanOC4mWwBe8+xRsmdhbRn5dr+Rdbcp47Hwke1L0+u4lJeduFa2U7GZhaTKgKa6pKf6xedEfbKzf+QGJctlx/XFJIjqJuDnTQsHvZFDuJww0Dp9R0VrlyYEp5oT889RC9iRhApRMLbP3P+GGKo+hVJYhCj89jnZYqsmkPWUSd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJNTkw5T1J1bTVEbUlkK2Ira29RYXBaSCtGUGNqclRCRVJIQUk3T2hSWFpZ?=
 =?utf-8?B?RStyVVZEZlBsYVhJbEN3N01EbVR1ckJWZ0U1MFFBU0grVWZId2dTSzc5Ykcz?=
 =?utf-8?B?cmt0aW53c0tnc1oyOEhadFZZL0ZQOFkzdnRhcHNSZ21vU2JzOURrd3hMMUsw?=
 =?utf-8?B?MFBGdVJWb2N0YllYYlZ6clEwQ1pQbGwwb0xGd0djUTVJZUtrTlFGUkxiRlhN?=
 =?utf-8?B?NFBwOXZBb0ErbjVoWXVNdVRWR21RdzVNakdtaTQrT210ZFpIc3FidEVFT2N1?=
 =?utf-8?B?Q3lNc1dnajNHSldWTUpDNzcrMGJoRDk3a1VCL1ozbWx5R1JmK2ZQMyszbm9t?=
 =?utf-8?B?a0NDL0ErQlJPa2E5Q1l5Tis2T2lpakkxcnNWbE14bzNuMUxYSEJaWHI2RTNN?=
 =?utf-8?B?cFhjWFRQZ09Ublg4QVJIYkdIT3dPSCtNakhWZTduS1dPc0NXTjltL214VVFw?=
 =?utf-8?B?cjQyb0hIL3dhRzY5MlF1NEMzQnlZU3FDdWc4SUF1RnB6clErYjAvaXlna0Fq?=
 =?utf-8?B?dXlMT3JsY0lSSXZqdWV5UkhHZnc2STc0dyt2U3lNWkpLOTdwb0NIY2tZekpl?=
 =?utf-8?B?THlaODkxOVMwNkJlbFpVRVhrcmZKTEZtMnM0Z0NVNkh2Y1padTJBNVZvL3pN?=
 =?utf-8?B?OWk4S0FpczFLVGZJMkdYMXVuVUNlRXNCY0g1Z3g2Zk1McjBJZmVBVnNiNnhJ?=
 =?utf-8?B?OGVnd1ZRZFdhQmlMRFFMc3hNT3JBVjBQOUhqb3RBZmV2WE9JM1pKeWhtSVg1?=
 =?utf-8?B?VXF2dHJCZHRVT0pXZHBWT0ZXMVpXNG4xN2RwcjUvTkhLbjA4cFdsdWQ0ODln?=
 =?utf-8?B?Y1ZsVmY0MzBEUnJqS21KbkpvWW1JOGhDTDBGRUUwZFVLRG5TKzNXbkRjZEly?=
 =?utf-8?B?YW4rM3laeDNtQ1hVcjV4VzVmVlNjanBhS1Nac3pudnZGV2VQRTN2Wm5NMldG?=
 =?utf-8?B?bTJMQ3lHaWNuMlFGeTJ0ZVBDby9ZeU1KWDdjbnU4VjNZUWhNSFpOMlFLMEdY?=
 =?utf-8?B?Mi9TOG5DREFLN0g2ZTY3Y21jdXg5QTFZV29SeEhhRWxDNzkwQVRaa045Z0pL?=
 =?utf-8?B?TUUxSDlablFENjQyMjJ3blo1RjJzcC8va2lmeWZxdFBSYWxCWTlKc0JyVHZv?=
 =?utf-8?B?bXpISHlPNlVRQlFONnVqTnkrc1hWL3dMMjJzcnVMTUJCK3N0YTJQZk53Vk1n?=
 =?utf-8?B?SkcwME5lNWxoZHh1RFMwdDMxZGZDN1pCUDJZVDBSNXQ3eU5lTCtvUUVuYi9G?=
 =?utf-8?B?L1E2eHdBbjhKTVBzdUl1TjJwU1hiSnlLandsQk9oRFdZekpnSzArcWZVdG5U?=
 =?utf-8?B?bjR4bSthdThncDcxOWJEWklSY1dUZ2NyYXpOUmJvL2s0SnZMYjErUHpkclBx?=
 =?utf-8?B?aUs5NUxBZGhhMTZvMVk5SmVIcHJiQ29XdW50NUM1aTJvTDNHY0dDbmg2N1Z1?=
 =?utf-8?B?T1VSalF5Q0ZmZEp5bmpXUEdmb09ScDZQUmhPS2RIWWhQMVNrOVR1MmRhTkw3?=
 =?utf-8?B?VFdpb1Z0ejFLMFVRTVBUZHpsUUJFUW4rd3lJWmVFWWhkeGJTdGM2RGRyOWw5?=
 =?utf-8?B?Z2tzQVlVTmxOZXN6ZnYxWTRVWGw3YmNWblFORUFiK2Y4MUhvcHB4bjkxVi9V?=
 =?utf-8?B?ODNRMlh1N09HR0YvcjYxeGxocmFOaGRId3F6UW80WCtDa0srSndXdnBReUJw?=
 =?utf-8?B?cE5uT1pyUnlCMW5kZUhRdEUxSW5DUlpnQS9pSTc4OGpwZG1kY203bEhEMHpr?=
 =?utf-8?B?a1c2cTM3cVFVQUVDOUxyOTFvaS92Y2VoQnA2VTFBZmkzRWxQSVIvNDA2a3p2?=
 =?utf-8?B?M2gyV1cxOWpxb0FkTjI3NjNEZ2t5aWhaRGxBSjFUOCtHZVJHaVNCaUR4WlM3?=
 =?utf-8?B?c1RPdkF5QUczcTNENEVtTDhiT3JkcFpycWtuc1o2UEtMaEVjVnVOVnFtNGRR?=
 =?utf-8?B?dzl1ckJNZFIzSXh6V3ZpclhFQXI3aGdwRkttRjF6OWh1N3FoU013K1AzcUFp?=
 =?utf-8?B?NHpmQXpsa2tvV0dncVZqWHVvcG56UmowTlI0N0h3eFVHRXBRek5yV1RWc200?=
 =?utf-8?B?UHVkVDBPUFQ0d1JLcURPYjhTR0JDR2VSbFlnazlLdEhFdy9qYkxBOVRQdlpR?=
 =?utf-8?B?T1N2S2ZoR0p5UmlPN0FnekNMT3VUdktlUmE1VTc3VDR5ZWNIaXFIL3A1allL?=
 =?utf-8?B?WHdyMHdzK0JiSXRYK0JpWWFaaGgxaEtUR1BmdzQxM3BRY1Nob01pODhyZnNn?=
 =?utf-8?B?VDNXcWVPY3JuU0FOZjd2ZytpbVFWV0xwbWlKcjVUZ25GQStxTXhMaUVSME9E?=
 =?utf-8?B?WmVkWmJodmdndTA5S2dhUTZDVnViTDB4cDc0TjRKdCtsN0wyZWRHZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d353b9fb-e174-410e-c963-08dec008f8da
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:09:50.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1IPuKv7vF1yQ+h7c7fFxCKgLonzNyb4JXSrUU8pN1eN++70jjqXYyf/nzKWZNvAk3+zOyltgf45hIW23cSlWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8734

On 6/1/26 6:13 AM, Alexandre Courbot wrote:
> On Mon Jun 1, 2026 at 4:33 PM JST, Eliot Courtney wrote:
>> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
...
>>> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008a1d58 {
>>> +        31:0    adr => u32;
>>> +    }
>>> +
>>> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008a1d5c {
>>> +        19:0    adr;
>>> +    }
>>>  }
>>
>> May be nice to move these to the place (HAL) they are used if they
>> aren't used anywhere else (and reduce visibility).
> 
> Indeed, we have a thread on Zulip [1] suggesting to move register
> definitions into subdevice-level `regs.rs` modules. I guess we could
> proactively start doing this with these new registers; on the other
> hand, I'm also fine with keeping the current pattern and doing the move
> later if John prefers to keep things the current way.

I very much want us to focus on making a *serious* attempt at merging
Blackwell support in this kernel cycle.

I emphasize that because moving registers is something that can
*definitely* be done later.


thanks,
-- 
John Hubbard
