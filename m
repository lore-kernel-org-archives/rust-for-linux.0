Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020129.outbound.protection.outlook.com [52.101.195.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CBE18DB37;
	Mon, 20 Apr 2026 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701852; cv=fail; b=QsX8KFkeaBUpwYwGLFvb/KmFEFMshJHlnwPCP344bJ6OKkycAN3jRGkWu/4yiCdRykqMV8+UcYOcU49I0f9aak51pGlWR0qyR+QP4NkjzGv2m9QPjPPzgegHp9pfKW0h93fo+ttlWQXcH7Hs7AwxfoGIkEsQWoewNOgc6ecg4Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701852; c=relaxed/simple;
	bh=lxzDjilAVxKZ+VOTOEDvusl6d6W8Cly7AP2XRSnMeC0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TAEorA7qkNe4/EK9oihJC8rk2t3T2um9XtE1IGmV7nqyiRG0KOWrzP83pD9nTkGLDMbEXBMGI497aVWF3ZG14KVP/1ArtpGp4pC5bBdzyAXQhuQBmnGGbDa3TyDgHuvCipozhJTqLiwUeM+aTQ6MmJ+/TUklLaf+GID5MsxMGHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YavQ+jmo; arc=fail smtp.client-ip=52.101.195.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YavQ+jmo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtnDR/tptzN1hNw8tQj0Lv+OQ3SyXjPr+svVV7E/Ib+ihRgLc0v5yYE2bIoVFdtNz7FcRIZoMGOBz25f98RBTr8V04kWbIv+XHZkOYmMxK6hUgzSNlfTRS8UCYjvhQdwv793pLgSJtib3hRb5ZM6+YNHI+VkkgL9Xq2OypP31mLcYUuaGRYIsNeNYHapnrZd9OY6/ZYqphXjC/+i6AZhyLG3I4VCUTaq+CtZml4aeagPcA4UopMBIivRC62r7sHfNIRSJa9zZhOTSTirHyZuiqAZP/xFwMRnj1PcBZCH2NikfFtjxKrPgXf28l6vVY++W94xuPqlLvBtiHGykD73wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXdvkC64plYa+7slyZtMHMAWFthi5mFwRHUBdU0oOxc=;
 b=GiJ9GF3tP/TZkngN5D3jHN9BNHoeXqP5V+VcpSy5W0FGOCjhB782Ghm2xvKpbTOyLz0SGZXLrCSWH8Nt/jo4bsZe6x+Pw++AWqQAK85RrcR6/OHeh9cU2F3jrZxTPa+qP81thU++BmpDu9CzLt62tiQEiLAnMu+8xeGkVhBVIVb2iD47Ehn/N90ur1QFBFAPc1zVMzk14ZrFYXQ+E5cbGw+qmUE0B3AaDfX4YMxl1Wdi+vvb85VuDyNfYhsr0ZrsR/kfPSWgHD1gKkB25NX7umHgkJ0ir+/53DhXCKvS0iqXkr67l+qv6zqXm+QHT1RMSU5/LxDhII3HjlGIblORnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXdvkC64plYa+7slyZtMHMAWFthi5mFwRHUBdU0oOxc=;
 b=YavQ+jmo0MK2oyYbPZobS8jcXtfr2QPVejl67/fD1sqDmXVNZVe4A7n/Z9l6Y85uFMjSInx/zN8PTWYCRFX47hQ51y+nbpzEu8Xx/AKZNejXo9N8AjUbk4HYRKfYZ0O3Hw1BktVpjgGCNqM+jDOoiGrzVHsxvEwWjtow+lbkins=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2196.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:68::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Mon, 20 Apr
 2026 16:17:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 16:17:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:17:26 +0100
Message-Id: <DHY48OA6NTDV.21BY86D36KUEB@garyguo.net>
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
Subject: Re: [PATCH v10 05/28] gpu: nova-core: set DMA mask width based on
 GPU architecture
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-6-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-6-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2196:EE_
X-MS-Office365-Filtering-Correlation-Id: a9715af7-1415-4e17-716e-08de9ef8501b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6uD9Jt+mopKmSK/H/Y+VELVR90rjGrVFiNbbFVjlIzDPlTo9Gg7sV1hphfHPCQO0IOTyPH6RIlazRuaIAl1r2my2lapvr6MCqKkRILUJLShX7RLfq0qmooiseeFGZB3CVIO/C2RulRi+e1zrYZpwOFRC1tUqz6OjK0mmyUfVB/18jtArIWGDYMa0RFxCq4XHALR5at/aMKftlzTHIFJFgj6Od9qqb7bvQVVFibA2SGSRRfdUSA6xZ+GTi2ydPGv1sneUtEWsTiFm2GOqzzCc/OtTnbk1o0mK9B+MN03O0HarvgOqVkmiEbz0VkyWe4TWnXa2bbOgq7RF3CCzPTYzaTLcBKuX8vXuILtUOUeI6hSnLhUN+b2/B51sZTf8Y9ThDh8/LAUsy0J1bxRRF52Vor0P9wwph8dN/XW2X0hPoo7L1kDP/JpeFiG/YNiNEH2H5JU9OTgE5uW/PgznCbt6HEdmLrnWlsBg93EFSbf24DEzQW7cNGvWFwYSkvQrMLVjmBRkm36GcfBk+qIf0XxT/TxyaaOZV8RbVduVzvLSZF5DxrniiDUPKWANUHRK91hywRTYSbtqfB9G3Du8ajQwyb1Hix2eCZpPQCDV4seWPhj5reK51HueodsBAn5EqJuEMMETgvvhH5gcEhtIG+GpigoWt0EbZ3v7vHXnCTrp/e9zzxuBSs5IMfzamZboz/thtee97vR+WkJYsFXg313i2XKSJvp00CfEUf6s1qu086I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWJFTGdxdk9tMHgwTEVPczRJd05xa3pJbDhkTmlKc2RnOXZ6SndydmlYcklI?=
 =?utf-8?B?WHd6NE8wNGdPYWtTdjM4ZUVUVWtmNzVzTVM5R2RsK2hLQVdDM1Y5Skc5Y010?=
 =?utf-8?B?Um04a2FXdGs0aDdZOWRBQzd2L2dZZm5xZDFtM21UQUJ5cmUwb1h3UlRpVTFO?=
 =?utf-8?B?UkJBaFk1bEFzTWFJa1M5YlhkRVFFbk9LL1g3NUNneTVBcndTejUvRW5vOEp2?=
 =?utf-8?B?SWlaZ0RTdzY3ajBmOWpYM0R6OU5aaTFXSlNKb0NZOFNnaHI2T0ZkMDMreDRy?=
 =?utf-8?B?Z0lSZFQ3Z2FHUytOM0ZvZzQ5WGJvSzNGeUFhM1FhQ2Jnd0pJeTVJV0pGYjdp?=
 =?utf-8?B?UkcwMWRmYXJnNE5LZDkvclpPa0Fzc2NUUmkzWS9XZ29hMlB5T081UTFpN2lZ?=
 =?utf-8?B?b3Z2aUtVWWp3cWxnZXZZMndmMmdGV0RkQ1piNGNDSW5WYmhuYnd3bkZWVWor?=
 =?utf-8?B?WW82RjZrODd0K1ZyQ2Q5VTJYZzlvb2tGb2JCWkxKVEFqZk95czFWbzg3Nzd0?=
 =?utf-8?B?UFhYd1NGdGRob1lWdEM4RGVaMmhjeG1qM1N1Rm9iT0JmeUhKYTBra3NCdWRx?=
 =?utf-8?B?N0k3WEtPZXMxdHpxS3d5b1loTE1sZUh2NVZuaE5ma3lEQ3FCZUFoQ0RORHpr?=
 =?utf-8?B?U3BQWmNqQzF1RGNFUHVuWFlZelVjK00ydy9UL1RXTmoxQ0R0REtoOFZNWjhr?=
 =?utf-8?B?alBaS0EraUdrUTZUVEt5MTM1QW9ndy9MZ1dKeXAvaWJMZnVmUUZGYjJBN3Az?=
 =?utf-8?B?QWpwdmlEYzJnU3k0U1F3cUxlSjEvc25TWHN6bzNZYlVlZEhYa0F3MFNUdlk5?=
 =?utf-8?B?RTFkdEplVzhCSVp6Z2hHZUVXVlJIYmpyc0NxL0orK2VTMko3ZHV2cmNBd0I5?=
 =?utf-8?B?NXZVeUVZZSsxakIvUEZwMUdOTGxpSTdPSldOSnJUa2d3WHZyN3JpUUo3K01C?=
 =?utf-8?B?R3ZxYXU5VEJiNllMbStWQytrWTBBM0E1TjN0WnVEOFBkc01PQm15TG9hSm9X?=
 =?utf-8?B?TElVWC9DMVdUL0dVMVpsV05LT2NycG1RM2lNSGpvQ0x3MUF5MlZhU3ZSQlpH?=
 =?utf-8?B?ckhIWnpHd2FvS2ozZElkaEk4Q1REZWFyTjJGTURZSUdtaWthOG5GQm9lQ00x?=
 =?utf-8?B?bzNaeXd1YmxIT2ZHYmFXbWxPNmtBUFhJOFd1ZTZOZDFLaVk0dUQvODFWU0NE?=
 =?utf-8?B?NnQrSTU2Nkd4MzMvZytnRkRPSXVNZXNyK3BXQlQyR3QxekNibU1aTzg3SWlL?=
 =?utf-8?B?MG1jMStxZnNnMldPeDVjTEcwUzBBSEhZRFlwa0NES1JZNERYTGZ1WmJ1VU4v?=
 =?utf-8?B?SGxWZ3h5UnQzVTFNNkdORTdieDhLVmZnMlFITHcrN2c2MkZyeHZaMDJueGRY?=
 =?utf-8?B?Y0JReW1JRVNLOGxIZmFEa0g4QklSdVY3TUE0Y2dRVXBLOXVOZTYzeWw0eWc4?=
 =?utf-8?B?TXF1ZkUxR1FqeHFHakJaTXlRWTBkZlF1bG5tU2JIUk11ejFLd0VNcFI2YUpP?=
 =?utf-8?B?VGd0K1dCMFdBZVRlZm0rRkEyekpCZys1VVl0NDAxYjdwMzFhWUJZajZYdHhx?=
 =?utf-8?B?RmJrdzNDSk52dDgzRCt4TXB5T25DekRQaDV3RkphaXBJRWRKaDZFaWN2Ym1C?=
 =?utf-8?B?eHNKR1BsSEs4WUpCZlFPSGp4ZFRUdEJpejhsbzJTUGhqT3dEUy9RL1k0YlhD?=
 =?utf-8?B?NFlzV0xicXQrOFp3R3hyNGsrOUVXRktpMjRscm8ybEZXWVMyK1lPSy8wQXVa?=
 =?utf-8?B?YUdQZllaT3o2VFdZSmVId3NOazA2QnJjWkQwNU5mYUYydVNhS1g4Ri8yb25r?=
 =?utf-8?B?eTJWV2graE1zRXZoUXRZVzU1Q3hGekxoVWZpNnp6SXdNZnVabTBWL0IzZnhF?=
 =?utf-8?B?RkhTT2FCM2xRaTBqZHB6d3A3MFpuYjZBekE0Q2FVS09GS3I4VlNacnFkUHly?=
 =?utf-8?B?cGFQM0VML3RrT3E1ck15SlZEdm43bWtOOVpIMGhCUGlrNlc5bmhYeGU0aVlW?=
 =?utf-8?B?b3NXZTg5ZFFtKzNkaTlKczhFYVFtZHh5ZnJmVytYZFozOEZTa2hSQWhqTXhy?=
 =?utf-8?B?Y2dueEpaRGs5WHViTTd2R3ZrbStBRnFqVEZlOXhsUXV1Y0pFYTVkTGk1czRC?=
 =?utf-8?B?SHVoSHMzWnZCWVdGbldJeWxtZmdjNlRHMHYrWGM1Wk45Z2JqOE9ZSGQ1MGV4?=
 =?utf-8?B?RmV1NDIvVEpUUmtSbWg4QzZDZVlUd0krV0NRSzQ0aWp2NkVBYnhNNHk3TjNk?=
 =?utf-8?B?YVcvbWlNczAweVJhTGdkUVJNOGxwZmFVaGk0M2lYNmdlMnlGTTFvV2pqbXZr?=
 =?utf-8?B?V21LeXN4QjFyMHo1TmQ0N3Z6Q3hRQUVQS0dRRFpYSWgzR2luMkpIUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a9715af7-1415-4e17-716e-08de9ef8501b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 16:17:26.7330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTUV5vhSshRvBmamlTCkv9G5KWQqj3pseTupjSXeuM/WrFcDn+Gxm+GorJATvfzEOTgBhRiq0XirfbrRltfphg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2196

On Sat Apr 11, 2026 at 3:49 AM BST, John Hubbard wrote:
> Replace the hardcoded 47-bit DMA mask with per-architecture values.
> Add Architecture::dma_mask() with an exhaustive match, so new
> architectures get a compile-time reminder to specify their width.
>=20
> Set the DMA mask in Gpu::new(). Gpu owns all DMA allocations for
> the device, so no concurrent allocations can exist while the
> constructor is still running.
>=20
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/driver.rs | 16 ----------------
>  drivers/gpu/nova-core/gpu.rs    | 22 ++++++++++++++++++++--
>  2 files changed, 20 insertions(+), 18 deletions(-)

