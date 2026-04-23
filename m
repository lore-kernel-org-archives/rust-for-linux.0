Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8A3A2549;
	Thu, 23 Apr 2026 03:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913245; cv=fail; b=G/QqEsTZIjGvqkIhkZWOAL/i93Zn6mb+JzcfqFmmJrUO1euk+FzAxPcFgcDZv9D7gSWk+PzlkwdYwo5mTle4/GBhCKL6V4HQhFMRKG4Z8jiZgHiDwtGIxSS2pqQLqcEbJfh5pwpV04b7PnkyK+t/ooq6HhCuRbGgtgX73I5IM0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913245; c=relaxed/simple;
	bh=ZzqNAIVJnyBqq3gCWj+pli3w6d3jJjJhalYlpYqR0ak=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=GpZIJ9FjEnsfs+6nRwco64KCV/msMfr6TYrRlIiyzyrv+8kvqMFr9KfrW2T1i3wjBW3c830HF2jn3lR44CX1S/d1k55C+egewQu/3pLrYrTbozOfyG7y9RqnpLriR8mNL79n7eWEx6ueKTW6cUoMKjI1UqzSSo/SI5Qu0Hwewc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bWYrcgqv; arc=fail smtp.client-ip=52.101.62.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bWYrcgqv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqJfX8slkp+a5gWS6cxMfOAgooqQ5zvRGl69LAHO9w+Bm4HccStmJ+dSyMv+NaKoZmn8eEx+z2j2TmfSb6v9Ng0EaMU+kfM0HK4PZxwN2vdi1og3xbLPh+VwocinXEJoWot6aId28NFz/V5N8AhSCdaUG0apioJHhrI3GtS4uj4FPh6+T9ZDzFRjOEg/a/vn4q7juFpqg6zbtFhP+Z0fCrDbuKwVCKuR3ABVEljX1peGVejppk1uj0iw9GmHp2aF9iAfYJJccKxDKOBuwu9oZQ6ucBCpsGOA/hxpOu63SSZQHsBVOSUA8GXMx6B+Lil3HopS7hitiUDpYgpRlAGD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzqNAIVJnyBqq3gCWj+pli3w6d3jJjJhalYlpYqR0ak=;
 b=jXhTOYXe9sr73AR2qrXwkUuytM7aVel6RwPPGAZbcb4wxjpZOUkkNgVOaqZEDrwtj+aF3travQ7flSLcFN8CfNBObfnDhN4+umHNqDAcvGe/mSa3yucOj9KT3i2DZlmiMRqasgBHIrOYl+DTwEK39IXULK2avyCBbLVd8CxD3f96dHjSN6D1joKR9Hrc85eVLKEokedQKtL5kFFiMFLQJ8hCUhvxmTmpAYD+3YcUSKqmFBH92rusQfcotaF1iOnqUTY1ScC37M7zwWAvP6mBn/9kJ2d20OIbLcoG8Cr3bwoH5ie6yvEzwLyM5wBiNwqQcZsfcOoN2TGQNXlBB0nGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzqNAIVJnyBqq3gCWj+pli3w6d3jJjJhalYlpYqR0ak=;
 b=bWYrcgqvoCQ9FXOu1hvZ/RECnwF/YL4DlgwceI7sc+/NcEs5QANytez4DQ38XRTKBsFAroiNYAY2x/mzzg81fmmwUgDTBMrMdQtB4iThc9TPo3JScTz36n/0A8GhZ+/02kaLmk9vVWL7VghbCQg0Xs74mlHAHxxKTwdishSZfcHF2MpzHYFvkZwepZvOrpCL8TOP+LPqkDP1MZE60yUJjkrZWJ4hPJFrG4n9LsOTp7lTv/AaqTT0xfanvNkGC/mauPXE+4u+02vEc3eVa7oF60tCyhOwx9GAlgcWmIy5zU0EhqAwuSjvUEsgwLMWNXnrvi5GT4GSiiq8u8g/oznwTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB7869.namprd12.prod.outlook.com (2603:10b6:510:27e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 03:00:39 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 03:00:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 12:00:35 +0900
Message-Id: <DI076717QSXT.1XSCYXSUPFKFA@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command upon unloading
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260422-nova-unload-v3-0-1d2c81bd3ced@nvidia.com>
 <20260422-nova-unload-v3-5-1d2c81bd3ced@nvidia.com>
In-Reply-To: <20260422-nova-unload-v3-5-1d2c81bd3ced@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 480cbd33-a995-4f51-a98e-08dea0e47fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qsOBWSWslz/Cn//6YZwVeKjRpO4hm2XGLSyi9DBxCJaAwZg+Qs77GGa1wo4aUh79zQkdTwBVS/2jHNCAAdLLD4opT6yF26J2TAWhY+sODqn6ZODIMYjxAoye6jzNLCH1tStMh3PnBEJB0iUBTVCQLJxAO/x7xkSw7wKV5d9TAC5BfGy0TLn5IbdSxJuUIsXvXM31I9ClV1JyxMn1UBIxAMsXdYCLAmKw+sdkC62bdu9uweIasnP2PXLWZgxdcmvhAnAqO6+gAiK5EdwgST350Wxb7rQLqkf6C0AmsdOH3EAvlWjzx/hZs+msXrXr7W3qCtDNssd00XXj/p17ChtVNJMVDtwzQraHnllxUgtX12EaFG4uLFzRrC66A+4TtYHDUDAaqtyXMSrkXehv86kZ3x/7OfWGUaokPhtfUfpgN3FUVGAjQcdFqB2PCbitnOM/8xvPsJJoa9lTyQEiqlJY0MiNjxTY5vpUYnAeihngSZjae62IX/wvFQU1Ca8nDjYJGS7NTWnsSSPabFtxCcXJZxKxeoRNnKMei4gr7W8PCq/LFYnZlnmXZn0S+Ls2hpb39edNpn67+FDNirm6p2NyhA8puY/ncDjZWiUDTIZo8+Kli7VeT5gl6epuympaYyFlF486xLXgJnOZV11EY7zemJtGYNY2FFcK6Z78FMCDoW5ii0b7g+fBn5uSQmkSZlTL6cR6/loiWD3EWYqdOULi4E83vNE8kwuVjvjeOqO7/sigST5z/oBP8+3upRAa74lc2I2FPHQ8i3+JnUD+I6RQhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDY4Z2lSMnFzZGRwOFRiaWNiQzN0NWNWcFRBR1RxWHA4bTJ6Mmk5Zk5JT3JR?=
 =?utf-8?B?NlNlYURzZ0NSZDhmQld6TG9WU2Fma1JMMUxKS3M1OHp1NjM1TWdOUlZ1S3V0?=
 =?utf-8?B?WDNkUnpLOVdEbEQ2RVRYME0xbTZHQ1F5U29iWjNuYzlzRlBvaU9lTUhsdGFZ?=
 =?utf-8?B?NTdENFpuY3VHU05waC9kYTNyazEyVmNQNVVhMlpaS0kzOEQyaExvQURZRjZF?=
 =?utf-8?B?dkg1ZlJTSER4eFd3YUZBZ0dSTEU5VEJMWWNGdzVjdlRHOXhoZy9OVXVEVm1I?=
 =?utf-8?B?V1RrSk12Um1LSUhTZWdjWFliOWRGQUZkTi9PU2pUaW05bmYrN3JhSXV6cjJq?=
 =?utf-8?B?Z1dtdTNOZVNlZXI2RFVxMnRoWVgxdmFGT3c4S2RtVlREdllMQzQ4cGVXWHg5?=
 =?utf-8?B?TDRVOXlQLzhwN081WVNTN3p4WkY3Mm5jTVNIWXdVN1d5VjFFd3Q0KzV3dEIv?=
 =?utf-8?B?R1ZXOHN4bFFmVFo4eXNJWkFpYjRVSGY2bW4ya1pEZ3R2U1Yyc1gwUlVYSHhW?=
 =?utf-8?B?TmgrNm9TeUgzeGdVK0RPZ2VvQytLK2U0WWhoR3ZVaFZiNWg4aHcyRTVRQ2Z5?=
 =?utf-8?B?djdLMkpnN0Y4QUxkVVVFcFhtZVQyNDU0Nk5vMCt1NmFqM2J3YkJVMWIvRjhx?=
 =?utf-8?B?dnhtNUl4a3NMcHErSTNxMVdMVkFjL0dZNHlBSWpqYVg3NUQ5aGJhVEJpUWRO?=
 =?utf-8?B?YktwVDRmTE9pKzRWUnpaaWxnb2o3MlkzSWJscGhxODRPckN5MStmc3pCdzU2?=
 =?utf-8?B?bWt0ZEJ0UFVsd242bWdTUnZPM0dPd0xWK0tabDVZUktFRzlKdXd0QUNweWhw?=
 =?utf-8?B?NGo5YWtMSzVuSDU0VFFWNlF1VE1pMXN1UFMvQjVqd0FRUUhTZHNNRVNYRHBU?=
 =?utf-8?B?RTVDSWMwZFoxbmlleDF3ZUkyU0Z5QmhJSjVsS0dPK3M1T2xHKzQwdEx2WmhR?=
 =?utf-8?B?TFNLdmZrbkpDclVERkR0akZPRlRuNjM0V1I2b0RaUFhaU24rNTlzMGxLdEZm?=
 =?utf-8?B?MXZZZVNUbVc3bHp2Mk8vb0ZNeS9OUm5qcTFPM3JBU0hvSGRuaFRZWThqaGEr?=
 =?utf-8?B?bkc2Yi9BOUhkOHlkZlZJdzlLTStRdkRaSjhxMGVObW5IYklzMHA2eWpiekVt?=
 =?utf-8?B?cnpmWkJYQlZpZnhRUTR2bFlaeE8vemhwMGwzSjlpVmdmZkZxbXZQRkkyVUZy?=
 =?utf-8?B?TWJYQkJpY2xpdVByb0R5dWF2R1ZjeXZuWW51ZWtEcnlwQ085eWZobUZ0R2R1?=
 =?utf-8?B?dGdldHR3WmtOUDdPZWw1SnN2dndJZ0ZkV2J1RFNIVWRocFE1RVZMMDBESGdq?=
 =?utf-8?B?V09PSlRhbXB2UmRwbmtRNnQzdzR0ai92akk1bEZ2bmY0b0hZelVMNXBvNnpU?=
 =?utf-8?B?SFFYY2NRUE9jMFNZU0MycmpkeStUaEh6U2tGUWFtaklkSC9MYms3S04rTExK?=
 =?utf-8?B?M2o0YTBDeGF1LzRURXJNTXdOQVVLTSsyN3Z4MTk3dmt6QzBSQS9aUzJXTWZU?=
 =?utf-8?B?c0M3RSthR3F6d3lmU1c3c2Y0a2NkY3g4VStNeE84Q2F1QmVCN1NmUEhCM1Ja?=
 =?utf-8?B?SnZWUjZWT0hCYlhpU2hCYnc5ckVLVlNLQjVuaXFDVXVLTy9VdHREM2RxRzQx?=
 =?utf-8?B?SDd0TEx0bFhpSjBxbm9YMWtMeDFMZ2N5TVoreldPQThnQ29oc3pUZkFJeEdJ?=
 =?utf-8?B?MkNaQ3BPUHMwVFJCUGxjYy95NzZWRUJ2a2g3cnFBcWFBU0RDeVl4cER2b0lh?=
 =?utf-8?B?WXh2YzAzSDhPNEw0S2tNYlo1dUltZEtWQ3Z5MkxTemxpeFd5T1lkbHZ1SWVU?=
 =?utf-8?B?NVd4WjJOOFVYbVVqdVRIMkpSL01UR1RGRzhTY2VxOWtUZ0pTcEk4aHQ3R1gy?=
 =?utf-8?B?Z0hQUVhpaEkyQXVGdVZQWUFkQ1hZaEVia0p3Y2xDSkVxSUl0UmxlWU1HMVZr?=
 =?utf-8?B?TGhUVmtnYkF4M1J0Z29sRnZES3g5OHQweGlYOGJuM0dHWGVOSTVMUnIwcEI1?=
 =?utf-8?B?RmtjWis1RlE4NFo4eEU0NG8wUFZSNlRLVjFhV29PUlhGVEpvTGgxWlFyaHhT?=
 =?utf-8?B?aUxiMFpIOTJJM3BQUGNoRmJTR0FveWhMUSttZm8yeW5JbER3VCs0d2xWQ0J0?=
 =?utf-8?B?ZFdzdktNODBtZkxRdlNQUEo3ZjEva2lpQjFPdHpxQWFpOXFBZE80YjA4NlQ2?=
 =?utf-8?B?MUxWN0lSSW5TZjRjT3ZnNko0dmFrK0liZ3FEeTZTMFg0NUVWWVovbWZSWkd4?=
 =?utf-8?B?K001Q3BaenJOTWRBWkdPTjdTZ1AvWmlVUU0zSllkdTRUU0ZXN2k5L0VTN0xr?=
 =?utf-8?B?bWFZdXUxTnVFVHJtT05xcHh5aGI3dGtmTFdxdC9Hdnd1cVVtU0JVc0xZeUlN?=
 =?utf-8?Q?9WwybUryApLS5Epyem4PIYJIsWN4rpeydcfCxEZEoK0A5?=
X-MS-Exchange-AntiSpam-MessageData-1: UXzvk4hMyWGCGw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480cbd33-a995-4f51-a98e-08dea0e47fd5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 03:00:39.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dd+3BLYrasqb+58o6YZpE8kHgk8GnJ0Q/joI8xdGMDbmOqCw1iaJmIqVtGXGFvc9JuzRBzkdyYrtjltlXC66iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7869

On Wed Apr 22, 2026 at 10:40 PM JST, Alexandre Courbot wrote:
> Currently, the GSP is left running after the driver is unbound. This is
> not great for several reasons, notably that it can still access shared
> memory areas that the kernel will now reclaim (especially problematic on
> setups without an IOMMU).
>
> Fix this by sending the `UNLOADING_GUEST_DRIVER` GSP command when
> unbinding. This stops the GSP and lets us proceed with the rest of the
> unbind sequence in the next patch.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
