Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3532264D3;
	Mon,  1 Jun 2026 04:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288882; cv=fail; b=iM1sKWF8AXbYqhQ+kn/exz4ncg8yfDqbpO/ouAEsxAC6s4EC2kk2aSbfCOPEoyuXusoTndM2vpcgjfct2ubFe5GdPmUSitzUzQDCv0sMfjMF2K/Yih1KwX0VQcGPnsIE/kfdULKuy08Xd8xL9fEd1vArJF+cx+755aGfLhTodjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288882; c=relaxed/simple;
	bh=xRiUaG5+1dZofSs1JbLtBBzZVUPk54c369DeiWyyL24=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SuP/7+xhWXipKTOK531D8ugoe3rIrVcTaZhDbnmEMgqsbUKpIN4ANYM1F0t9FLho0W7y6+RprL3ChGI5LzRO079t0HCbVp/kEIcZdrbvKAIqI8F+wusS4MPupqx99+t3fIlTnJ8vHhOfeRBYrXKJOK5xgAvU41Tv/Jvm23WcWY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c+KbmQ55; arc=fail smtp.client-ip=40.107.209.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c+KbmQ55"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqTQ8hfd+f2V2M8ponBeHBHyRzqQb2pIFt1VcUbysS9m4sW5/cjYp/qfpJCQXTVB935zCK4s5EKqVhsm0SYwpVsgasJOtDqU3JVtxYWVy4vRp7U/GG4AGs1QA7eanFZKAyghJXWJRxKm/k4gOQ/X6RiLFxyldDITe/Nikdbd4qQLWA1F4Na4D5WpukkdiW+gnhJaRXRfhjsa5rGzrODIskcjn1UHoDE9lD0KY1eXLSuvNixY7b6jSULjP1Z+rMTYlVRoBgu7Cfqk+LyZ5qeKpDlqXzBwM1cX9K/1t3OSCzfu3C62YpHXmCdWEerCbKO0MO8jCzhqeEukz4D67b3wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRiUaG5+1dZofSs1JbLtBBzZVUPk54c369DeiWyyL24=;
 b=S9ff4MOf5h4Umytcmbi39pkXp2E3RIj7lm1OrAL8aKH8TYyw4z9hOxsUaJSnJBfu9m6zn/Gf6ScMHJ4zAyrG3E2B9Cm9hC1Dhm688Ye5/Zhym6NV9lX2mBIzRfuqqx8w+W0ZCJVryfFGvOiBrn/siqfaLOhM/0ND2zExYONGx4N3efMlZVrLIbQcUVQc+Va9ca4UD7ae0gYbSFEmZBRTrYV64UkYl7+LdcqfVD6c9JL8xSRqmuz8FsnxJaUFWmn20Yfer6MZxJTcE7jJnETTeqvj9G+K8/cUqZjG94Bnt4yGQnw6bjhL1knoFieyM8M4VpyepGloI7GAgBVAer4HIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRiUaG5+1dZofSs1JbLtBBzZVUPk54c369DeiWyyL24=;
 b=c+KbmQ553DCPNQk7znqESPsxRtK48ub5n1e1UY97iAvzYc9C7P6N/9WteYAN0rO11Hd4LKLurqkz7Oo7PeDUpboKR58IyH+nLXfzK+hxSlIPpuh44XfC+PDBl+zGHeIt7a7kvF7avvF1BsNSk+SOUocdx0ro6yb4XINSdPt192/1JzZI9BrD1tPqZhaEBr3zV/wk/pycFe+o76zoDKa5r+W93lPJAyDVZF8e10gT/kE2/zHVHsT+DsFv59nAKDSug9ruDAmUL0FLWFSfRkNaJk25H17ABnH4KArhuAHASqdHQDvt8AVts4ZHc+f7oiVqvqT+wDBLi5/ZwDkebw4s1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 1 Jun 2026
 04:41:16 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 04:41:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 13:41:12 +0900
Message-Id: <DIXFQHG9E5NZ.3W3VWMLESRAGJ@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 03/22] gpu: nova-core: Blackwell: compute
 PMU-reserved framebuffer size
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-4-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4317:EE_
X-MS-Office365-Filtering-Correlation-Id: 0818f9a5-72f7-477a-c558-08debf980472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|1800799024|366016|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VVnciIHMPL1aOfZlzMYB4s5Zhwq5/vm2rO7/EFD2uNrPKWT7y9OdiKd0ilkjc4X5MZ6tlc5j4OchhL4rF/2rnwPV6VJwisN9VWF8dWnI+rCEETKl/PW/9+PE/O5dN0FqgFfZRw+D7J0y4HFYgbQyRMuJkX/vv2AzykNNM/dy+G67I4fmMbTPiVYYzH2Nu1Kktcl/9tx3sPv1qUT426VVIMxBArWHzQwHdBfp0DBQPjsqI+p46em1x18w9GMzJ1f2cMF+FT3WxKMPMl4ZfrilES8UDTDl/wOzHifSjONbwfS/WacfJN/ga6axohM/LfV3SO7GSN5bFmLWMHHC6ehjRmrbiQhzMV1cjUDzLcPc4gLbOWz6gjuej5JYPG3h39fKHRCBDD4B0DMCZdDQbYooQAq3Op7B+imWvTOBNE9oC2mDpx0ma6IXfocW5mueXfjzpBmAeqSvv+UGbthk31D+Hns9imOHcwMdv4M32R7yKL0JRWCJhxnzLFEWSwZs/17d5msXvLcl8ZvcznVWaVdM1w/zUlXsSCD7YV1UzXkiTPxvVQU+njwhwIf/3nduEOXmFUs9MFAiZFEUFMYi7HbYi4G9RPSn6iwRonjTbL1Zag8fk0zL03Dt9zWSpg50W0iEvpTJMRgtL8o3Dji/Jz/Oag1Z0qRT96r8voIOwcC1tvAjXucxUuazmMgyxUaqI1HR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXZod1l5cTdWZHNSTVIyTm42Ti9tRDgyVzUxeDR6MzF3SjQ1dUhzNEFzRzM1?=
 =?utf-8?B?SnFVc3FpQ2pjRmJHSmFIbmtocElvWW9rV05mUUJPeTl5YWJ4ZVh2V1RWQk81?=
 =?utf-8?B?UzI3MXlvTlpjSmlPZ1RYa1k0THQxTCtGb2RIdi9MTTA4N2lDTlM4Sm95aUJC?=
 =?utf-8?B?bk9qYUJFa1BZeGhvOW80VWh4L2JRdHhpTjN2NDhMdnBOUUlHVEIrc1JDSlRB?=
 =?utf-8?B?YTFOamVwd1hJUUt4OC9xeWhjQy9CRnJOYUdsSkdrMy90dEpTYXZVWkFWcVM3?=
 =?utf-8?B?STJQdkxWblEyZStIbTFRekd4dUdRVzZSRWd3TTJrZVV0N05NckQ0RlJpMnhK?=
 =?utf-8?B?K3hiUEFnaXZGdi9ZTzZtYmN0SVhRMTZWS255ZFNaNkJGKytYUEt4aGExNmNq?=
 =?utf-8?B?Z25rejUramFhTExVaUdNOWxhNURRYm9ZdzQ5bGxuWS9MU2hPMGlvNFc4cEli?=
 =?utf-8?B?QzlKUWN1Mkx2b1lJOWc3TWx6OVVPU2dBbHUrbTBlMEIxL0VxL1ZKQU9GM01Z?=
 =?utf-8?B?TW00NCtycmZMUVFTUjJlYUJ6SkJhYytLREppZ2RNemlmMXlBQ285S0tJaDEw?=
 =?utf-8?B?NlRoMlZrWmt4anIzT1VqeElZRFBpdks4cHV1RnBvNks0R1RpOEZ0MlNjRFRC?=
 =?utf-8?B?WE1aR00wemRKakVVZHE4YUVCY3N3UW9IV3prMnFVdzV6NFN0TEtXT29rK3kx?=
 =?utf-8?B?YlFMVlRLWUhRZGlobllIbVNtdDZ5VU0zZ1NMdU9lNjdlS3Y2Vy9hTW5ZbkdC?=
 =?utf-8?B?L215eUQwZFdTVnc3b0hJSXgvU2s2UWxVbUdYT2NUbStESllqdGl2dHdDOVV1?=
 =?utf-8?B?TTFiN29OcGcrWng3VE5mYTVQTys0b2NZdnFvUTI5bUR6NEZBQWRid0pJQmx4?=
 =?utf-8?B?WjZnRUdiWjBlSktMRGVOSEI4VGl5NkxvT2dJK0hObFZFMTJYNG9nUHp0bVBx?=
 =?utf-8?B?RjhnbW9oUDhIRjVyaDlCTnRwdGQ4STlRQmt0SGV5NCt3TFVubFgwSUpveXdZ?=
 =?utf-8?B?cTRlcFRjdUIrSzVsRmYweEJrVXRqNmxBUUNzZ1NPMEFicVhydWJhTkxISDFU?=
 =?utf-8?B?U29OcUJKNG1qRWxmRGxjamVENEY4MzEyaFhYalp4by9ZMDYzQm82UzRzbzlX?=
 =?utf-8?B?Um5OTjI4T2duZk5reGE4MHU4NUxqVHJtS0tvVUdDTTBnQVp6US9FL0o0Tmp5?=
 =?utf-8?B?SjcwSXNPS0t6ZUVIUGduZGlkcUt0Y1VoTmtSa2s4WGVab1VDYnNsQTU0cTBu?=
 =?utf-8?B?aTROa29Dc3JGVkdMbDJnM2h1cmsrbGd4aUYwcG9WanNndjI3RXFxbkdkYWw4?=
 =?utf-8?B?M1E4NE0vc3hnMFhsdlBVVWxTczJGSUYySlowajZ5ZmxQbWxaVTN4NEhnM0I0?=
 =?utf-8?B?K0wrU2ttZGdWd3luMFZyTzRiS3RadnlZZFkwSjY1WWtmNU1ZMGFHdXNQS1dx?=
 =?utf-8?B?UDg3ZWlCQVVzU3V3UjVITEFVY0UrUTRNMnRHZUgrUyt5cHBJRzBObGZ1bTd1?=
 =?utf-8?B?VjMxK2h0N0lpVVlYU1orbUVzUDZZQnExRjNSUUNnVi8vODhDNi9iaG5LWkRO?=
 =?utf-8?B?dGZYa2tYbElUanB2Mmo3WUJTdU9tdzhDVVJxbnF2emNSa09WT1FSMGhHa09w?=
 =?utf-8?B?d1M0dGg0MXJQamZLL3RqcytoZFhzUEtnek5Nc090bENQbCtHM3dVd2xCVyt5?=
 =?utf-8?B?QTNteVZXZkNsTll5NXNBczh0dElkRlRSY1JrQVdzWXlBSjNFdDNMWGprQVhr?=
 =?utf-8?B?R3A4cys4ZlloQW9oZkdMWlRrNmFxSUc5b0MzVmNObm1JK2NaMHMxcXBxcEhp?=
 =?utf-8?B?WGdtRXM2NmNPcmRtTkZJMmtISWlSN0xHWUt4VjMzMlhpTE8rRHJKaGFWSTZB?=
 =?utf-8?B?WU9mVmRmUzBUVXhic3NFYWRVZit2ZXBwdFlrMGZ6bkdSdjVmcWNYaFVsRXRH?=
 =?utf-8?B?dkl6N0FoV2dqQ0k1VFdxMnJQaG4zTWlrS3ExQmJBSTlwZmptOWFqNFBXR2VT?=
 =?utf-8?B?bjdhSmpBdk9oWXRxSkRjRHdpUVo1aHZaSUQrb2RJd2JKZFRaSVcxVmZVeDFi?=
 =?utf-8?B?a253WU42c3lRODVJY0MrazdDWS9QbU9WdFF5YjJQSFhhd29XWEFJM2xWdFg3?=
 =?utf-8?B?S3E5R0tYZzJwMGxtVTNBRXNldlhRUzU1RzRHYnQzay9ZYWNVUzlXY3dDRm12?=
 =?utf-8?B?NmgrY1Q3eURyWFcxYm9UZ2d2YVJaelZhVk5VSVRnS2NZZUJ6SFFrUktlTGxS?=
 =?utf-8?B?cWJodVVNek4zTW5BbmNTRkdBenFNN0lvckU5T0daOUU2ZHhOQ1ZQYWhoREFX?=
 =?utf-8?B?dzU4L1NYYS9TYldjRTBUNjF0ZEQwM2htN1JscmFRd1RLTFVDRlZVUnZXdWhR?=
 =?utf-8?Q?Lzy9R7XkZnIBeGqOs+/L/EQ+ECA09VcsBgmvooIXj8zdw?=
X-MS-Exchange-AntiSpam-MessageData-1: qUQ7x2LibxYkKA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0818f9a5-72f7-477a-c558-08debf980472
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 04:41:16.6993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fd36QoIZtDOQR8YTFz15PcD07AWKin+SStJx+NoMla/7Yv64aQ5mvJcfvKB/H3ypsEpULh5OpcoK62IYrP4RRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> GSP boot needs to know how much framebuffer memory is reserved for
> the PMU. Compute it per architecture: Blackwell dGPUs reserve a
> non-zero amount, earlier architectures leave it at zero, matching
> Open RM behavior.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

Moving the Gh100 HAL to a later patch where it is first needed as Alex
suggests sounds reasonable to me.
