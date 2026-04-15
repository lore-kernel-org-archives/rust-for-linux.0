Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8EA1E5207
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 04:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776227772; cv=fail; b=jaq5fVPrV1VBdl0rkVNaGpLD/srLJo9b9lwxaJ40jzG70vMfKP+xxYEdeHP2z4BULUtjRllAW1MT/HMymnJpZAbsjw1ZrVfpalXsciiu8yT/VmxviK06UFJVIlLsl5aB0hBgcpAXXTf2Swg/5quLHZDOZEGYYJf80KWmwnrPfBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776227772; c=relaxed/simple;
	bh=qm2/dmM/Mdb314tTkGaRHhQf/jme1WhZnDuOlWVn/fw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MglGtQ4hHMmE49eURWk9+bXfGs8x2Dr50lY6naEzgAd8VEkbR641o28QEQsXLadqkTuFB7as1bhQKFISJU5jyvswpL/PsNARPB5RMAi/De85SwPrGjlvUc6CF/Ko6UMJiisjeH7Hqt3V0v+bCikQpd6Fd5uWin8e+mBA4MoAJpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gN4KWv6h; arc=fail smtp.client-ip=52.101.48.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gN4KWv6h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxQ6rKKT2CEovj39sy4leLFbX0VfdslqXEYu4BUcU9hY4hJdmYa7S27L4wS82nNV+YItw9g8gmW8u871IGL12lvgIcaWRI5rA3i8c2AuuEgxp5C3qT01VEqf7CDPqn60s9cQRv/rc3TKMgiKyVcauzZ8GtJyDzC+RZdqtPIKc70vemiEaB6kysZ9ptNxm1dj7kJS2RqD68DHaCelXyEqbZupDgXzsRfU2Lxim+PDOmIKNj0s/k2lLuh2gj0fCe5IySM4IyrLeMS5xSjKWoW6RpPkt/gVur0Gy5nUjHt1uvYWxyjiw1uWGAy6gO/uZBG3iZ9U9lv1EAwg5Q7J8gRy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+ZsaT4ZE7+uQ+WQHNXj4npwgxJDdpPyHgfEVLEemGU=;
 b=J+s94SughsSZPZPTnJ3bJ1hDmAEUw97yzh5eArmAHtkb5pooqop28/F0TvcVeFesJ1BBYKRh59zqxqh7EoOJ+i4pbxfTRw57fqHepnFLQYft4WJ2Z4z2N4OwI/UU0Zsu9iTFsOVcYswpKgl05Wafs0eANGLk8p6Xgi2e2k8AmMPEPD2drun4mToDf7tafM9ulT27y/51r3EoOVWdc9BD1ovEi2xknEXuh2FnJBIyhvJ5rJPANklNIXR6hfpjlXOsGdnwbO8z+uhawhn4ZorV4zoaip+u4hpay3hdVVQohPAczZ7KzNyiXkuvRPV2JkoRcBU7gP2/sndUI6uZ9klulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+ZsaT4ZE7+uQ+WQHNXj4npwgxJDdpPyHgfEVLEemGU=;
 b=gN4KWv6haq2fq/yf5kowpieJAlnz74Llm3ghIJND6+pj5X9g304csPqJSETLWCodwv6y6qcYffgbf3mkBfCgIoJU30f4RUlpQG9JKBVSbCmCNhsB04VaOh5mL7+5/76dG0kdcsoI+4hrCKy/Cf0SA2RiAwMvYac7BndXD0KQbgUxRm0SkwNi5MPIFJAJgTIRLdOklkoY1+Owxvns2uouaHcwI2dz/2H5XjYrPYo2R3FavqZd20tBgtDlnWQoWkbFsCX8lrhY/s5bpMPrPMsKtVHtjT/9l6AJZtedzd2cxaj7SEG5KTKUScoRoMDrWZPNY9OyfNkncI27D6JSe6EwLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 04:36:08 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 04:36:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 13:36:05 +0900
Message-Id: <DHTG6YFQGIR5.3MRF3SUVZ2USR@nvidia.com>
Subject: Re: [PATCH v2 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-5-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA0PR12MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c417e9-2502-4c93-84db-08de9aa883ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0/efZC9qpQaeQPvx+uaJcTUBd/c3x1D2YTveKRYNEe4jfjJHrGWC/2fhUgLp7D0fiO40sa12/400jqYYLO1JtId4+Fs74SceN8S9s5BYEeCgtfy3SoNX6YOy5nJ+j/XSbWuVhPa2M1hCQlPncjvVMZBVncOXnl+VJbTtSRB9AHeO8rMCzX/PWmnpFGsBIX9UliuQK1ZMdVnJozYXIV/YAopzFsa0AbF6HvwSnBF5x7jakrWvIc54AvEtHMC6mtxoUg2zCfjFhfUPfKkq1LucMYX/P+mnDmAQTJKTvj0Q+dyUV55wjBnUgv7WLMS33XIgLSd+M0Wg8rbpJFBxPF7JdRqnS5NDnIZv/8Qw6BLSjnZB0iYQna4qoEQ913Vj2BYroZK9oQGwgJBVof1F9yWx3kRr+Io2hUB4/FlybjxPhdV+UUfbi8xDXUo7Mm+v0EHRXYi2ZUCVBGQzDGWKUW+J/k23AwXx7kkFFxUXNdgMn2nErKac0//YJwCI9rjznvYFpdNu9KJoCRKuTvJMzM8p4vIkkr0vhdubCVo/3VXrktj6ZDgQDuJjxH2tHintgyby8IwjrA5uR0GKFjeQ4G/nqmpUXZa7YQZE6PX3stnHGDdZpbRI70BU+ja4EgvG48CyJX5Ko1QnZCd5b3cNVnehN2rU43wlhslwIpkpE09xycf4fl0WqEAZbqMhwjR+1xFeH14weqayjv1fGubUQv9aldFjNXDRF/txxDKbmWDQD18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGJncXpqQXBsVjNqQnh3aXRlVXdQcnVoOEJuSjFXY3JCWFNWa1Mxb2ZiVkk3?=
 =?utf-8?B?WFE3a1d1SU5TTzdCK0F6Vzl4UEJxNkJhamFuMU9zK0ZpdjZkUW5xTnFhRjBZ?=
 =?utf-8?B?MTZWYjhnUG9ISCtyeG5xMjNnTmtmenJZQ084UU9VM2xQbTZLRFo2bHJzY2c5?=
 =?utf-8?B?VllibHpiek9tU3B4Y01DaUtZMmZDakkzbUZEN0pxNndsb1c4V1B1cUtrR1g0?=
 =?utf-8?B?aDBUVVNTd1lKZDRocGRhMTM2ZUg4TE44VkJncE9hVzdTRFNXNll6NjRFaHlG?=
 =?utf-8?B?UTNUVHFIeFZmRXdlNHdsQnhYSjVGVy9lVzE2MVNteEkwUUNGMFlrRWFQaEY0?=
 =?utf-8?B?Vmc2UlBveW9TZDV1Unl3MkovbXovbFYvaWNBaGpnbk9ieTRpY3JiVkFCRDds?=
 =?utf-8?B?dUUyRHFLcFkzaWIvSGJkTlU0ai9INGNaRlBvanhwL000eHVWcDMvS1RXNnoy?=
 =?utf-8?B?YlhUYVV3Q3F6dUdWZWZVZDk3d3hBRkxrTVFIYmlsdkhtRXZVTFkyQWhUazMw?=
 =?utf-8?B?SHgzK0JVMXpuYStmVTRFSjB3NHJpSENEOXphNWdKczR1VkVhblo3RFc4MkRI?=
 =?utf-8?B?RzJ3cGhzZ1ZuVUt1Y3h6VlJBcExPUU9CR21LM2xsTnVVVjBNa0NidW1BbFo0?=
 =?utf-8?B?bHFaVUJuWDRpK0x6R1RjT0NiNGRFdTBseGxhMGVGQlhtcnR6OGs2eHVUb0Rv?=
 =?utf-8?B?S1ArNzB6bnRXSjN1T2YrYTIyWTR3N0ZvRU9yazBIQWpaM3hETGsyclRoMk9G?=
 =?utf-8?B?cG1iYTloQ0cxcFhwQWdTeHlsdCtpMnJCd1UyNXN5QldUb2pRRTY3YkhOOWNW?=
 =?utf-8?B?T1dlcWNOY0s1K24vZHo1M0hwaUZ1NENpeDlTNml0QVcwMHdGYUVjYWVydVJ2?=
 =?utf-8?B?WEpBSUVob0NSdjVuZU1qQmhDaUhTUFExenduNW1BMzJlL3puaWNHVzNZT0RO?=
 =?utf-8?B?WXVQU0JDUHFtdE8zT0lxRThIQ2hVczRweHo5YVc3eFZnVmFDWDVrQThHbkN0?=
 =?utf-8?B?OVRMTW9XMlNNTWR1VUtKaDNPc1lPRUZPbkR5Ly9QRWpwWjU0OVJYdXNleGRp?=
 =?utf-8?B?MFdDQzJBNXB4d2lqcXZPMS8rNGx3a3M2L1BCS2tocWFaYmRPTklhWUFCL3JY?=
 =?utf-8?B?bG00cG00bmx2UksrdG9uNVQrZG55VWVhdWZ1bVlySVNuM2d0YjVqdkRiR3hO?=
 =?utf-8?B?TW9rb09CV05YNkpXRFJjQW5OTVY4WFJWQVQzTzJnak52eEt4aXdTR2pHWFY2?=
 =?utf-8?B?UWpXTCt2M0d5eVFHSkNEbkpjdXZvemZqY1VVS0xNMWNyT3pibzRxSmdDS01X?=
 =?utf-8?B?NjRFaEV3WllMVStmdTRtZW9vU21UckxBUkdrQzJnWGo1MWZSMlZ4TVRPQlZY?=
 =?utf-8?B?ZzYyT2k0RDBnY0V6T0dTcDA2OWdONWdNdGtDL1NpVXdBZ1NvbUcvK2ozT003?=
 =?utf-8?B?eFhJS2xKR0JVL2xDY29oaURYTEhjc1Q1YkxLRzdObndUbUtiL21NYWtNSXdY?=
 =?utf-8?B?UVAvRU5hQUZYU29rbnJXanlmQk84d0lEVlZNWS9NSFpMenpGVTB0QUZ2N2dw?=
 =?utf-8?B?VS9ENzEwVzQ0QnJHeHhiU2ZMeG51YVBxdWhEMDV5WUJ2ZnM3WnhPMGcxYkk5?=
 =?utf-8?B?NmhUN3RjNVkzWmZPNHFWckNSN1dkYnNQMmtnWER5dVJySTRoWWw5T0kvNkVV?=
 =?utf-8?B?WG8vYUUxZ05pM1d5WDhyNStmY1hucEl2NjRqOHFjalZvaE1Jc3pSSnRYclg1?=
 =?utf-8?B?UTNMZTBsVTNxTjFybzBLclpsZkVUa2h3NUJSWkRqOFZ2bHFUdmJZcnVQMXE0?=
 =?utf-8?B?dW4wdm93dGFoVmtLMmNYVUp2elpqNTBHTUtJN2Fwa3pEbm1ZUDVRbVI3b0hL?=
 =?utf-8?B?THVTQTFwbGYyWmZaamRXQ29NNVRUL3BvNXNvSlhTMVlFWkNQL3pyZ2UxMHRI?=
 =?utf-8?B?aVVuMzlHa1hkQVZkeHdzZ2dMaUJGUVZ4b3NkSHZKNTJkWVVSQmI2aC9SaEJo?=
 =?utf-8?B?VlhwVy9NTzQzWG5jdThFZzVpeXJpZGNscFpDYjI5VUk3NEMwajM5Y3N4TlJq?=
 =?utf-8?B?c2VWaXZvdWE4VWJqdS8wdWdma2VWenFuaGlQU0hvME5RRTZ5WWZXOGVXTUZ2?=
 =?utf-8?B?L3I3UTJzRks2UE1laHRyV3BmWk5oRUpqb0RIdG9vdGRvN0xSWHhubS82TGJr?=
 =?utf-8?B?V0pHQjF5cWhaYmpZeG1TTEJQMEt5RFhFZGNNN0FucU5aVnZsdExZVFNwQ1Fl?=
 =?utf-8?B?anhwbFBFU2VkN21TV1d1OVRiZTJORllsYXVTM0h5dUF4bkZTbTJQdGYwQnU1?=
 =?utf-8?B?aDkxdG55Z0o4a2hDTHFtWHZZS0RRQ08wTWU2c0xOcWZ1SWI2V29LbTVBbU51?=
 =?utf-8?Q?TOedI/9YyOuISdsUjKSEcl7m31w324ym4wkselrRT8s+A?=
X-MS-Exchange-AntiSpam-MessageData-1: Wk7g4xx8cfyyPg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c417e9-2502-4c93-84db-08de9aa883ab
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 04:36:08.8883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wD8/bZpcer3F4G98t/hgR2BCZDJBrqYhGhuRJmIEvP0MIIOLLDDX8B2N4xLr04NV+M13s4Xkz3QkkFAxqbilIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301

On Wed Apr 15, 2026 at 8:50 AM JST, Timur Tabi wrote:
> Introduce FbHal method frts_size() to return the size of the FRTS
> window.  GA100 is a special case in that there is no FRTS, and so
> the size must be set to 0.
>
> Note that we cannot use supports_display() to determine the FRTS
> size because there are other GPUs (e.g. GA102GL) that have display
> disabled (and so supports_display() returns False), but the FRTS
> window size still needs to be 1MB.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
