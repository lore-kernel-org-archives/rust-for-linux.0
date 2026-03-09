Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010044.outbound.protection.outlook.com [52.101.85.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177A2C0303;
	Mon,  9 Mar 2026 21:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092707; cv=fail; b=Ly03ngmFLfk+01sbwQG9cTzXt4W7QNRh4v1pk0zyOpkfk8emqujNRFXwbgLf+oeNZ+7q/kGJuSGzVnGMWKQyb9qHNulT1HnzbsHVcpogv6g/NaG+qBz7tpJzdCrcPlXBASZe3FSZu/uqMqsITlwReayXh//YSFZtS8mcy+fIZ8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092707; c=relaxed/simple;
	bh=ftxDTXchhQ8Y8hk/a2KOzHuMX7OBSMqSbl+zxq2Ll48=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t/7fIHTMzvaOI9WVKFfF7bQ+JqlSkGfi5uvJUcpo1QTZSI+17T8QMn/Wk7GefzmZpwbPWxQ9FIezwD8RHpuR9ouCLyMWyTAek3ZYVpW0iC1UCMsfrARNSF0vUKsA2pYpdwaWPbvzhyQ0DrVIUyLVi3nfEphNNk9V5K3hIvjIZzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HSNfIg7F; arc=fail smtp.client-ip=52.101.85.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HSNfIg7F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHsoUDY3nvu4n/uGTBAKecS+kIcw77So+57ViAfXX87sljBH1oJ4Rr//RHkekowhOvjgsOaGcb/nJiK368IWk383R2fXqQ7znxhVLD7PUQciV+z2cyRSTRPgjwUNRXPkTtI8xEiSz5ppzaJQQDlJ02qltVJTATJrfIbkF2Eb4jnoXuwaf/wwVRrbQKUbIe21b6t2B2wc5Zt3EAZi4K76oxsUeQygSu6ax16avXhtUCtyiqLIwhlRnNEaVSCcoQWlfeVpz64Pj9D+HPx3WkmycdkUiunnYrscJSzqfWGYDvgDoOA0+Pi1rixPOkWw/85xmfjcYs2G22CIPtKuIO7dnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJS+YN+9gFli2tMrxN1N5lEcrVbQbvTt2CAyAzWKXp8=;
 b=GMtLFl58EcYh0PnlTXubUJ+k+vwFRPB7V0A4psjHHP4WKpruymqwsY/A5y6u7iFhQgJrvhONnrRurrsHo6pgCP7TwPoJFoHZBDZA1/Ak3Dw5C8ABeAuUQQFYF/UZcH+piLzj4WbY+YvWQ+x/Z6+p+xqM7X1dPsXT00i4xBNyJ9/1asDYBByQ6X8iI4CbiMR/wj6TaXWAz1NCidiTIZYiHJDHEqe9/wzm8QtNyeVmYlvxuBXoCrg3/xDYx8uBQfcOz0zLqb6QEzpH/jinK4MOo/a97Vy9YekOxcylFbm9I5dU7z8F6ubQ7ftiyYF2eTZ+uhPvn3Vau3IWjGMvPjt8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJS+YN+9gFli2tMrxN1N5lEcrVbQbvTt2CAyAzWKXp8=;
 b=HSNfIg7F41JmXJZWYkbM9ZsIXaZT29a2hxfPblbFuJfpftpamjICdyKaYPLDqLFtxiv9hUT4jhji2Xju/81AyD4c5yMGe1dneKIYlCV+rSSYdocDUpR9poIhQcnlJjywhbUsfKcOlVKkMHwxTPPnCKW49xOpSW0o4mFkAoarAr+yU+pnU99jd0qZBXwiPtUK+88Pw/q8bCNAOLeyRstgSJkgtX/UZtI4E5xIQHOyfySjDYIq4SPK4bk92PJLs/+gSv9tVzqDRUAoaPPPJCQPZhFEM/a2S1IKfsoptxNh0P7mhI8HlTjtRo4HKL5tDCLMrJOjbLmNXSkbODc5UeoqCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6692.namprd12.prod.outlook.com (2603:10b6:806:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 21:45:03 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 21:45:03 +0000
Message-ID: <0bdb9aa3-976a-45ec-91cc-0f5396a69fe3@nvidia.com>
Date: Mon, 9 Mar 2026 17:45:00 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH 5/9] gpu: nova-core: gsp: add types for RM control RPCs
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-5-86648e4869f9@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260227-rmcontrol-v1-5-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a4ae0b-f3cf-45fd-105b-08de7e251ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	i9KrS9HUYNJCGdEmG4w8cptG7cNgxQvdqg+oEyOGLqoM3nPbBKeVGTANP1lCGmlVu6GzE5LBE++ne5oP78EmDdKr1bzzFOAr7BzZdYaO1Zi/qnhal7b58f+KtTxxzmbipAMGFihGdu6qHj/QjK+qnJi7rfpMpTFEoZwakLJMFKf2x4RpUlQEZsrxtMZIQeVk8l29+sQmvn2WQhC6ZwwE3A9GpNSFzRsxjm9jLnL7CQUYIfEUUyb/IPmEMWptHLdYxVd1wybDDlN+iOq72eVLDNWAzxAaaJvmvHFQ3P+isZTvxRCsLrtyhk3Mit5wvtwlst+USGcj1ZUA9OuMJAMmSSbsARbrCr5Je4ij2XLqD8xnCV5a74shF32XXSrqC5S2+8A9WvNtGHcK8tEN38fsCQ3khns5b6/YbkuQqNB5Zvsbl7/ReOQWrslUlG4u4CHPnFgn6h7ZDyGqyGFyyc07lAa90oIfi76czwJDhZRqzw6Id5IIqiVeuXTR2TUrJtz90tI8L4VY+KKFgJ2WoKqOR8Y9UEfo+uz6/0UUnSirdeWpl7gK5s0VnraiZp35BxX/QeNKdq8BCki1/4p5s1DGZ3gzmGXO+zoI90nD/I3ed0CBYks6C2cYuK6g8UL/7uLiFIqYwNK4jPtCjPZYvh/C0GkhqaJ01cakf936K86mU6F8K/7PYaOFPvO0ZILswmPPHFI6bl77ZKWYrWkK4+cBXkA/0JdbSHzc7CQ9ObqFmtA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emR0QjVYLyt3VjBMMGVhaS8yUDRQZnhGM3RCV01FbjRsY01uWW9MdkVrY1oz?=
 =?utf-8?B?WGhoMUdsZWl3UkwyZEVjMDdGK0w0blVrTGM4bUYxZnVvTHRNRGp4SzNoUVEr?=
 =?utf-8?B?MjlTaHFPNVMrWnBCQi85L3NvbUhvbkpRb1BQWXQ1aEdsQ3N6a3FTRUJTcEth?=
 =?utf-8?B?YUJJOE50Y09udDFOS2RSWUhOYldPWXVVZzF1cFF1VDJrYjl5RURBRHlWVEw4?=
 =?utf-8?B?clIwSjhmN0oxV2ZmbDNkSEtKSUFuWUZJTzFDR21TNUdON2kzRlNNTXR4d1Ba?=
 =?utf-8?B?Ym9YbVF4Sk1WZW5UZjNTVnQ2L010L3k2NWtwOG1nQjd3ckpEZmViMU1pVitO?=
 =?utf-8?B?bEZMb09sZXNNWVRRWWlLTEcrK2d2YjRNOU1VOEc2Qm4xcFR3S29URThXS1lF?=
 =?utf-8?B?SG03WEovU3FoSDlnMFFEK2pOVytya1BlcEpJOUcyT1NQUm9IRFBydzVlN1Uz?=
 =?utf-8?B?cGsxd1kxL3lDZUlySThUUmMraXhRNkVqTG5nR3pRMkJJaDFFRDJjRk1QRmxw?=
 =?utf-8?B?UXlDNjB4MUdmbisyQ2lndzZ3NGNsUkUyTHc3c0hUOVk2UUNhWnl2S0NxbzQw?=
 =?utf-8?B?cWJQNWY4eVZGLzJLbGRIY2pDNnhDeU91djVEb1g4dCtRT2h1eUxsaXhqZWtW?=
 =?utf-8?B?dzJmTCtuK0JERDFUUmFXSEllSWE5cWpCb1NyZ3Y0N1Z3d1NxaDBNMXZnbndp?=
 =?utf-8?B?NmU5dXFPWDREOENlZjRCam1VTXlNL2VCeWUrS2hhYzU4blppdHc0dmJMVXpF?=
 =?utf-8?B?Y3RUL3BiMTNKMDRSRXFUVWoreEczU2gybVFUL0syVUs2NU5Oc1dybnNqYmtV?=
 =?utf-8?B?bml5SHdLNHcvYTJSelJSTFExVXVkc0NudjVERHZ2dkJXaXNtLzFMMXRTa1BE?=
 =?utf-8?B?ZUFHSC8rU3BlVWF1T2Q2dE43MHNPWjcrTXBCSTNqTmFFVi9lSmQzZnlyZHVY?=
 =?utf-8?B?K0hyS2xBV3NwUThBQ0I0d2hmMlNzOVJlV0Z2TDZtb1o4aVplMWc4WENYc0h3?=
 =?utf-8?B?VXg2MTNtMG00cDJkcXJxWnpwa2NLb0R3TXNnc0J0VDY2SUt0dS9jcUIxam9v?=
 =?utf-8?B?UDlSMklVU2xOVlZCMSsrVVQ0dUU2WmxHZmp2NlFXTnhKeVl1dzg5dTBXdnNN?=
 =?utf-8?B?alhrS3o3aTR2S1JjN3pjVTJoczVmcklvZFZTOEdUendzYkQ1cnZNVkpDSU9I?=
 =?utf-8?B?ZllTeWZMTk9ZZWVHdE5pRk9qZzhVQzVOeDhsUkU0ZE5wbzBBaWdJWWZJbVpU?=
 =?utf-8?B?dTlrMjVqOHNYSXNUSmJmSUZFQzMveWxyTS9NcFBGY0Y2dXhtSU80NnZaUkZU?=
 =?utf-8?B?UEFRTUUycWlza0pHK2Fma2FUUWtaNVhqa29nejVselovVHZicC9ISDV1WlFp?=
 =?utf-8?B?czNaUEZCV0d0akJ0T1pWRitrKzc0MFdrMVNGbFhGRmNrYlZmMVpPSERyOG5O?=
 =?utf-8?B?dWZxVnlsNnZXV2o5d0pWRmxGNHJUemlDSlhCcmZ2bjZhdjBmN0xSWkh2RFNm?=
 =?utf-8?B?aFA0RllMeUtDQkl0TnFtL3B2SUk1S3Y1aUZMVFBZVDVDV2JyRTY4VFVjWldY?=
 =?utf-8?B?VmNuWEh1ZUd4dEVIdVQyaVNsZDU4OW9VcjNUaTd6NDFyeUtIb2NvU3pMOSto?=
 =?utf-8?B?MFJvY1ZKL1RkeCt6VnhzZUtQNW03bkxNTEwvdk94UVdBVTEwOERGZ2hDa09h?=
 =?utf-8?B?U2Q3WmI3VTJXcUNEU2tCQkxUZllRQ2RmaS9JcGR0UXZUZ2xhQjEyc1AxcHhz?=
 =?utf-8?B?b2F2cWJXbThIS21vUWZnOC9sN3JtMjF4bWJobnFmdnhRSkJhUWFraVRsL3BV?=
 =?utf-8?B?eXA0S2tJeXlneGQyNW9KOHNuUkVjZ01GZ3ZFMGhvSVFQMlNRandveEFVa0o0?=
 =?utf-8?B?VEdEQzZ6U3BHMjFRa1BRdXNTY3hqcjRkUnlyNW9mZUZoVHNkS1NRZjBsbm1j?=
 =?utf-8?B?Z1ZITTVqUlNRMEtqSitsdFplaVdQOVMrRlJUcmtBS3pBY1dLcFFHeUkwbnFS?=
 =?utf-8?B?QW1hMWZXOXk3M1R2MkxLdENCMzBteHZaV1VuRWdMNFBtZkJVZWQxanN5elY2?=
 =?utf-8?B?eEh3czArbGsrbU56ZmQyUnkwV3FZQjQ1amhMYXI4SGJhSlN5amljTE9DMm5u?=
 =?utf-8?B?ZVVtSjR3cVdLbXY3K2hLVDkzY01Hck9IZjJXYzBQVkpLY3h4ckphR0hPZTZx?=
 =?utf-8?B?OXFzckZWYjEyUXdRZkg4ODI2SWlaWDlWbUVjSDd1QXpMVnorNGVMMERLNFYx?=
 =?utf-8?B?WmJpRDhsWC8xSEhBY3d3RFVBaTRaa2swaDlNZ3lTZUwxWHlFL0VkZlBNMEUr?=
 =?utf-8?B?R1J2SnZaMXFJdkJEVnRrdTlQdnFDWTEyNXcwUE1CRm0rVzN4Y2xBQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a4ae0b-f3cf-45fd-105b-08de7e251ef4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 21:45:03.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7RoV4SJtmFrFB5Q0XoLZWKbIY3ROwDbH0PRFtUiX5XG0rjqmmhisuUfciypJetcKtGD9AfOxpeQKz+FxSXgzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6692

On Fri, 27 Feb 2026, Eliot Courtney wrote:
[..]
> +/// Command code for RM control RPCs sent using [`MsgFunction::GspRmControl`].
> +#[derive(Copy, Clone, Debug, PartialEq)]
> +#[repr(u32)]
> +pub(crate) enum RmControlMsgFunction {
> +    /// Get the CE fault method buffer size.
> +    CeGetFaultMethodBufferSize = bindings::NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE,
> +}
> +
> +impl TryFrom<u32> for RmControlMsgFunction {
> +    type Error = kernel::error::Error;
> +
> +    fn try_from(value: u32) -> Result<Self> {

Other similar impls in the driver carry a TODO[FPRI] comment. Please add one
above this impl:

// TODO[FPRI]: replace with `FromPrimitive`.

> +        match value {
> +            bindings::NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE => {
> +                Ok(Self::CeGetFaultMethodBufferSize)
> +            }
> +            _ => Err(EINVAL),
> +        }
> +    }
> +}

Nit: the braces around the single-expression match arm are unnecessary:

    match value {
        bindings::NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE =>
            Ok(Self::CeGetFaultMethodBufferSize),
        _ => Err(EINVAL),
    }

thanks,

-- 
Joel Fernandes
