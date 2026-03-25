Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B33CF672;
	Wed, 25 Mar 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439128; cv=fail; b=tVZjYxg/FOzZObFsYxdCe1E+K/oXqJV0tCjBadVVTVmP/bkA6jVY78rWid5X6BsjJmNu/IlPd5m2e5BgjOdr/OSpTkO6XJlrsvzKYECaeS7WxU+iDcnnDhoiCxRyZsOi00/LeirjIoGpBZz1aYW57mgeSTgrS5ygcvJUoSsOQZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439128; c=relaxed/simple;
	bh=xBHoXRQbFKO+0KC+pS/KnANkvcqlPUyNDueflQ2yN0s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=EgigHMo5gsye98VRpxSBnNlNA3jmtBqTkZhOXiZTtpV58Y9xxp4ZJ47cbPc9XQIjBFK6hWthgypYoUoxDPZL42KgmcreTS72VakBzD5vu4TXa2SNiDE+Ia+1oXGl2X4frnJWicCtOasUl7ikHBhKfIMHnbEgsYlptfzEAhlOOLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l4asCixn; arc=fail smtp.client-ip=52.101.46.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l4asCixn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZimbGCn+iG/Nw77iomnxAFmsvuvcs12KmdRalieNDQxmQb8jodepvr/xnIczFn6I1QTfka3FBMGCQqKozAuGV1PKK0IdxbMCy1cd5oihc1BbWQnKVm8kyLpZ8mau4QM0VFervoSgdfE7/XUBLGZ5cAvH0A+DqzMX2vZi1o9ONw5ovleGwZMwWFWyAJJ4oEZee88Zs/EXyXGTa7nXEefWif79xQofXrLxVdOwvPxJLIjY6PHWlXXHZM6xr74J9FKPXZybLXfEn6MPnjOdnNpWiB+XZRyaZogKgI00gaJhwYTMUOXcCPFH2UM83PKXQ5CqNQFnBply2jhbBxd+lGzL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBHoXRQbFKO+0KC+pS/KnANkvcqlPUyNDueflQ2yN0s=;
 b=F5yru/F1jZ55mYzYntpYD/U9tc5mtxUS9o1Munlsjh/i/pXa8iRfvuf/M+Qpix6Ytntt/kVxdZbm0ujPgOFk7cHVRUo91H0F60jpn3mYrE4Ggp1NsfSCvQBv8oKt65MOsDx80SzEAJXdMZMoOPlC1ZwJrEzbsj5wIz3YGXYxMfdd08LMCzNJ6P3zwAjlb9YGWoVoXseF96eSkDLdJwRvpaHnDUa+53W4IxD0DE5eHG4fDTpX59kfipe5041U5DTFO4yMg2PIC4JLae5PKKO6yy6VSDupCYEQGYo9+dgGqtuOpqUAz7kBW+O25t7YTtDPl8HncWFX3bQOV3H1VFjWcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBHoXRQbFKO+0KC+pS/KnANkvcqlPUyNDueflQ2yN0s=;
 b=l4asCixn1jYch7FnSOZTQoM9IPgi6snRqz//D5C/nR4kpyAdAabZg6wN5m6gOIv/R9wDaVziK4ohvkLjYKRiUr/epZkF9gjwHon919v34Ua6uyzRL6pgiFp2TXzQGLBv9ITUCqAWO7WXMZvBOOkkgswxeCCKX+2jcVGOkeENCkAeI424whxEEd8xn4XpIw/k+cumSCMgIR0AydIg+CDT0wd51/Jjl1BzKomE2W+ss5Do8EcEmlHAxwPDZzQXs0ljN6IOqUOMM6NdKWseP9Ke669GxjQPo9hOYxGJmlMmtqjpSyVtKgpFUwzp6C+PM4eSqRWP5LJZonJd6XvLQAvTmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:45:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 11:45:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 20:45:17 +0900
Message-Id: <DHBU6553UHPI.1KNLKA6TPN79A@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 05/31] gpu: nova-core: set DMA mask width based on
 GPU architecture
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-6-jhubbard@nvidia.com>
 <DHBTVQ5C8GWH.22YI7TVB7RWN2@kernel.org>
In-Reply-To: <DHBTVQ5C8GWH.22YI7TVB7RWN2@kernel.org>
X-ClientProxiedBy: TYCP301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: fab5b970-a669-4f23-acdb-08de8a63fe60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p8EMaz5cPhTkMgfl6FP3D1bMn26pS8VDVmESCpol9cbheQytyRVQjhYWGVxLr/O8qrQ2FFAsFButQNStlPwcV30CmeUpthRJ1KyNxi2WQ/Ht++AxVSR/u0B9fwYyBDvEO5t7WdLczM07XWOehRG76eT7/dRWDrih9t4n3IsRHLUbOtaFmM/U6FM74PBFbHHn0bgMWpVZ12tYVCW9TT2OoXNEx3AWt9OXygtwBy2rYLQEJrMuxc7yHQVK6o9kO3+37+4E6t4zsnJL3aGoVgBX5uf+NhOJvoMmrl79LoRIqi1yWgOFdJqbqopwukTCY4zJxwDe0TBdbYC0ghkpT3H4OjPE6FCVXkBkOJG79kq/lr9o3BLbc0Rsv8iPtr9ayUdXto8HEcWjIpI0qgMabfoYqqJnLNfzWNEdsXREMArVuGHMZttRAKvdDubC4mRw1AdG5ez8Rk888otqEs+HwCokFSbw3eXpj75QTYW0XKxLBQKTGikczmUZFOuWZ94D4Q3uim1o/O7vYea7GN9lfaPYn/264oinNm30qCyNjYXlA5jfyl7NOvAwFj+cr/g8xVYA6GstN+hP4dd5UI9M5P599tNNvcKGS9X1+doA/o4F8hIozh3h6absYlEccT8EAIUosF6dz3I0s0ZDgt8REth+b9PdAiAJ4dlnYy4K56mfKael/hVAkl9Ve73xjEpB5GSxCFYpKYfma0XZBVVQcyHObJdWDm8Am++q9SgtN4YwRog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0RMakNZZEk2NWo3aHNCWUExY3VTYnl4UFFacE1kU3RVOEZHZWZ5c2dyMXE5?=
 =?utf-8?B?bFQyWmNIbXIrUlFpeTRBU0cza1MvdjFRSnhxVTR0a2hQMllPZGVLUFRvMVRl?=
 =?utf-8?B?cE92U2dOdVArNHlEOXoyZktiT05pMGw3QXAxMURybjN4cWVVMmNBN3NkTVVF?=
 =?utf-8?B?aHBIVDdtcXcwejUrKzRFOXlPZWorTnA1UGQvUFRGZkRyeWZnTGRKc0lzVytp?=
 =?utf-8?B?akkzVXI3YnAwV0RUcExBVnMxQWRpLysxZ3oxTDRQTHRObzUwQjUyUTlwZ2ho?=
 =?utf-8?B?UEdzNWthUjJBNk1wSFMyTHNZWGJxbnNHZDMrbGN4QytJN3dTZlpZUDkyWlFL?=
 =?utf-8?B?Q0FacFd2WXdYMHZLQkN6cVlsZkVaZCtEM25PR3JBTUg0MFVEYVg5MzY3WHhs?=
 =?utf-8?B?dWxxM3lNeFBUMkhqRXFuSWNLQ2ZPbTZ3TlUySEJGenRJaHRKL0xPZjFCOGQy?=
 =?utf-8?B?RDNHWWJYUE55NHlJNnRMcVlkR29zM0JQYXRBVE15YUdDTHFBWUtxOVhQaFpv?=
 =?utf-8?B?SWs5NDNLb01SekxDOE0rOG9ISkJ6YXNveDFaQTgrRm4yM0hrTHhzU3RwQUNx?=
 =?utf-8?B?RGl0MXRPWnllM0dHVUEyeng1QXh1VWdQdkZqdjhUZ2dzaXpIWjJxUmw2WDRW?=
 =?utf-8?B?TExBL2t2MkI1N0VrZFJWcVpMeUVjejJWd3F3M2hCRnkyaDI2NEhQb1M3dnhV?=
 =?utf-8?B?MThFeHlYLytZRVphaThxaUJIOVNDaUhsOVNxMGxRM2VkZlkwdWxkWjY4alZs?=
 =?utf-8?B?d01qa3VJTmc2dDRZdEpwamx6VFBtRFlTMFZ6UUJkTElWOUZheWlIRXZaVVpr?=
 =?utf-8?B?UkVVeDJrek8rdzVzRG1EeXh1dzlBNnUxS0xoVlVWSDJHZ0dQcERTN2M4bjFL?=
 =?utf-8?B?OXVFZTBoU0ZKUnhLZ2dRZ0U3cDhBYkYvWVFhZkJSVytvRGxncXoyaS94MEVy?=
 =?utf-8?B?WGRxQkpSTWZHSzBZM1N6dE1BQTc5MllCWTlYWnBtUHc5NXFwdWRsV0ZINDR0?=
 =?utf-8?B?WFYvdUFscklJVWJCdnBrb2JKV1h4MHhkVnhwdm54WjN1dkpBYUZNTlN2RWo4?=
 =?utf-8?B?dUhRVFo4WWd0N1dYcFYxWEdPblN2YVRYTGliWURmQ0NjK1JVN09FQmhiOWVQ?=
 =?utf-8?B?Rm5vRHI3SFVpeEp0a2pqRWMrRlFvbm1BUW1vNWt5ZWFZcmhCNGNWODVFNFND?=
 =?utf-8?B?UjZYdklwU0htUTJkUmtBSEVPb3JZR0c0UUpOTzFiSS9qWW91bEVqSjI0YTBW?=
 =?utf-8?B?cHBLaWw0UzFhMFhOQTIvWUYrb1VUR1ZFOVFUVzJQWEhlZFZSbzQ1QXZjNG10?=
 =?utf-8?B?dkp0dUdYYklMRTFHd1Y2aGhleXlHVHkvODJDa0J3WnNqMSs1NTdCM0tsQ2tj?=
 =?utf-8?B?WDFyeEErenBpQlIxL1dPeEVwVktYamJkSGgweTFPN1V1SWQvWjBKOVkxeEYr?=
 =?utf-8?B?UGFVb0xESWhUL3dPMm5GS1B2dmFqSUgvTFA0NjlJQ1FTME9kbTN5MkMvK0JT?=
 =?utf-8?B?c2dnR2JlVEg3YU1kWHNXMVVnYW9mZjl3d0tPYzdmRFRNem1vbEt1VEQ5SlFs?=
 =?utf-8?B?N3Z4REtoaG1PWXovQmdTa25qT1Q5THkvZm5BWkFwZTRvTUt4b0M5UWRPc3Vh?=
 =?utf-8?B?R1QzcDNwYXRoMmpvTktKanBoR0JlYTd6enJjUytvMWVGQk5ZQzhYdFBQMHJl?=
 =?utf-8?B?S056ZWlTaUpyQmtHMUJzSEt1SVVlUlhrRi9NR1JVWFlnNkYzZzN3WDBDWERs?=
 =?utf-8?B?TWFBM0p0RHJtT2QxeWRBRE95ZmtncTZBdmhGVWNNMmV5a2VWNGo4dXJLV1Bp?=
 =?utf-8?B?eXpGZmZKR2xYdkhhZ1BIdWlJL1lEc01MWTFhU3ovR21Jdm16TkpUdEhWNGhl?=
 =?utf-8?B?bjRsaDVSV1ZieVMveFJJbWkvcGg5b3k1RjhxOHlkYWkwYVlTZ1RqVEFYSUNT?=
 =?utf-8?B?NCtnK0ZDSXlxQzhITFhzZUVsd3pUNWpkN2xhK1NEeGJQREdmYUt3WWdGS3Uv?=
 =?utf-8?B?MVZDTTRMa0h5WExxMkxQaWtRWVlVSTFzQmdyU2QxUW1CcVo2TlVrUlpibXpn?=
 =?utf-8?B?K1NJT3hNSGJOUWcwZG1RMWVkMlRXaWdPZjZjRWRXcE5RVTFXQ3JLYWNQSXZ3?=
 =?utf-8?B?SkF5TXBxVXgwOEV4cTdVVVZLZE5KWDdydWh5T2JJUy9yN0tIbStsUGpFaEVU?=
 =?utf-8?B?NzNCUGxjK0xrckUxZkdlU0JHdSs2ZFJYV2d1Y3RxSmFKWkhONUVua25tY0dl?=
 =?utf-8?B?dlc4d1NyRlZBRnVKTjc5QytqY0FlK09TRWVuRXVqbnpzd3BvSHNEVno2dEZR?=
 =?utf-8?B?cmNUOExCTlptSmFyU0kydzZHdTJTakdqTDM5WkNQczB1VG51MzlRNmZZQzFr?=
 =?utf-8?Q?4O67WPsZNR7MarSsFPCO3glP+CJgwz5kaPeiJEYsEy3BW?=
X-MS-Exchange-AntiSpam-MessageData-1: GBgEOQrIVS26/Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab5b970-a669-4f23-acdb-08de8a63fe60
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:45:20.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p95o0/RX5Qf4De8dhuxdZ2xNqwi+GMmh3qmbwFn0cbcCTCLEF2PSGV1m/Yd/dgdABDqzSjRmiwscLRVjtMRYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762

On Wed Mar 25, 2026 at 8:31 PM JST, Danilo Krummrich wrote:
> On Wed Mar 25, 2026 at 4:52 AM CET, John Hubbard wrote:
>> Move Spec creation into probe() so the architecture is known before
>> setting the DMA mask, and pass Spec into Gpu::new().
>
> Hm...this is not what we discussed in [1]. You implemented the change in =
v5 and
> v6 and v7 reverted it. Why?
>
> [1] https://lore.kernel.org/all/DGC28K8J39E2.1X173NHT9ZJDI@kernel.org/

That was on my feedback [1].

`Gpu::new` carries no guarantee in itself that no DMA ops have been
performed so far; whereas in `probe` this is much clearer.

[1] https://lore.kernel.org/rust-for-linux/DGYYH7GCIKJ6.2AICU9NFSKY92@nvidi=
a.com/
