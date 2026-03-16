Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020085.outbound.protection.outlook.com [52.101.195.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89FD30C63B
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678499; cv=fail; b=SDj1bb8QIqDtddAflYajwxnJ1PdLzaRzDrIonai0Qv/zTQ/C4HUHMth2N0dCePhKe1VhGLwuGmweY9/DaDv3actx877SWfGMLHsTL4SMTA/j9VcvohE97XGR8P2jVF4xmsQLV9zW4PZ+n5yP2W9lGCwLoNna0X2OTNT5x2j2LPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678499; c=relaxed/simple;
	bh=p5PeNkWS/2UZt/NQQuNkrjwktnhF1TEeBI70jAhviGs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=uAcPRMEiLwe8UZnyfYHWMQz6Iam6bVUcWxCZUsH3Ho2isWZh04caYGg2rm1GJyZX0mpfGMKpOCj99paDowAsSfOvWIzV5qgRbY30QhE+0lSSNgzpoX5rEQIYmBXp6BG66kgLcKSo4jD9duw8Cyrs39thgU5hiHsKDR80d6ZjNXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vr5w5b70; arc=fail smtp.client-ip=52.101.195.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vr5w5b70"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBjvqpQe5yVWufXUrltGBkdqy2/DAu4398WDI/iHRD556hq1Sv6qL/MkB3CxLrwJlFShyqcNy3UiB6lAGwA3Nfkuzx2gSZjK78mlhO+9nhM+8LIfu1vly1zUPRF9/QbP1xPcHjLOy8JpyQBe1rINaCxDJnTXdwT09PiYuXhDJkwigWjjZQ4tGsvmLsM2F0VQQj0kt6rqzDj/DG+unzL04drotYLbuak5eJe2IkIK/vckcpgnfQi3MbCRs8iEU7FaVJBqe/ZpmfNl6iE/eAdAlWN1TZwB61r4tekjDZR08fdgzFSiLP9+DpsTnDs1f3onaQPQYCuGz/Ub1JsdXKrNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2TH0ul89yUkxOvCSKWNSdWWyBGhqIOjWjZv8L9MfSI=;
 b=fyMwhgaLci+k18hzWpTqY80/zMTamCi/jBueV2O+kfQq0sgazZgCn0A7ur+HL76KLHDpWutlChY82sBhMHqXqtd7jl7q0hHtKBK86W5DdS5ONhl5gGwUWYTk9ncEdBm7/MZ+nOv/bzl9ngDv3XGTL2IJQ5xVC+b1rZtw0DB3t5PKbMyk91xB6ZKYlWobY7Nj1ImmCZ3tFiSCytrD3qOIAkF4kxnsShQX4Xo5I9pOiTJsvzAXnE7srPUqqS6Yq8mgJaLQjj41y/humgN6VMEVWJ3PUFAb+Gc4SriUejh5BxdqKl0DjGvEn/o9bBDwfIYvXh+HWNf597U/474bQQf2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2TH0ul89yUkxOvCSKWNSdWWyBGhqIOjWjZv8L9MfSI=;
 b=vr5w5b70M9QkoJ6NSc0EeQde43lbO/f0dN+69SmBX8LL1SVaOBHLEKH6sAWyXyMtffpvuX3UnDeO103zCVVJBRuDh7QSlB3lGxrr0o2/gasyka3o9361FYrrkRQDLlGSPJjg7z2w2RSx10fYWMhyPNng19TBmnLHiAVoao18Vc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6415.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 16:28:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 16:28:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 16:28:11 +0000
Message-Id: <DH4CJU87Y6O0.3DGXLMZ4RCH5W@garyguo.net>
Subject: Re: [PATCH v9 4/6] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Gary Guo" <gary@garyguo.net>, <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-5-ttabi@nvidia.com>
In-Reply-To: <20260316055736.1690546-5-ttabi@nvidia.com>
X-ClientProxiedBy: LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 0746a5ab-a81d-4d7f-6358-08de8379042d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|56012099003|22082099003|18002099003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	BkH8h2xHQ/hQtWQbTgF+PzqcvyEj05O7IDPedMKfEKIc6tZEYSapso4a6ltIJRa6gzKLbkDlqfWlZuBiZOlLg3bg+OFTb4HBcsbdO9kvTgiWcPDiQBLXSzamtvUXe60JbeTYzYpJ/LCmw2GrxBbZ3pZp0mgCJGqOHGCTIVvDyOp09JARmBRneTF440SvzACfvONLWgkv6vxncoPAtlRMl9qopa5N8ado0LguX4F7bDtW9ORPVRlDvByspfR07LYeZWy6mnMxPvr6UHsZ294ZHRI65OfV5STTmr5wwjoc1ZNGsqcPr5DoFYJv2XSw6Vlt2ktQAhEgjHJzPyMHrQq6kd3m04+fQsyF9uZ5zBhUt0L8oAo14noPocC32V/iCBlB8Yx5KfldllXuX132uEwv3rpEf/EuA8EtOPtLuIQRtLoEvk8QU6yrtx0wMbtZXLCiLvUO5GcO604Jo0yl9B+DnlAG7T+dnDsK0Tk4n5wZkiyxKV+nwL15mMerI3ZkEI5zaHTEW1s0hq18jr6z/0MZwGld1UQK/U/H55af1VFMCODexohxwN4JTKTIBoq/tqmFvuj0iMQEVZNJOKmj9f3z8pnFRZUjAzGlIFEACzrl1iTcKQCuyfLsd91FEz8nkSKQTe0DbPwF4XSfj1BBGCDZBAazWM100+QErvwGAX7fvYILHxzliwLynVNnxLf4wo31mcbJVwopqvot8Pu0h8SuemRQR+zN1mltt4O0/MrmYkhv10ZCAUXIJLS6hDKK0MjnzJ3nMOUPqTptVrq7r+1fqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0k4b1Q0SG92N3gzQzhkdFlsYjBFbVdNdjFzWVU0RHhDT2RXcmE2TWxuNWt2?=
 =?utf-8?B?RWVPVVFPU0RlU0plWGcxREd3bWdqSjM1RmRscTZFay82KzBOZUxqOGo2MXE3?=
 =?utf-8?B?ZG5vaTZLeDlEbDFVdUFBbzNRRE40UHhkYmJ2V3k2NXlXNC94N0JVcEFYY0F2?=
 =?utf-8?B?UjczdGRhZExQMm15aytDQ0dYYTV6WGdoZ1JZTDQvVThERkpnZFdQWTJ6VVI4?=
 =?utf-8?B?aEtjaHNMUlVVNXJhelV4QjUvL0hjU2JFK0lFR1BXWHZJK3VRM2VQQ25paWk0?=
 =?utf-8?B?cjJEUTRtQ0N0cmdETHZKYVdLRC96azhpYlkybzYyS3Rpa0VaVld6Ujk5YkJu?=
 =?utf-8?B?aDdFS08yYXd5K3p5TGo5eVJxenBodnhOa3dUK1YrNGZoK1RQZXBYeW9FU0dl?=
 =?utf-8?B?ZjBOOU4zeGVMekE3NmtsZHJvdzJpOHdjbG5Fbm9wR2trTnNkc24vaXFrMTc3?=
 =?utf-8?B?ZWhadE5FbDk5MmRSOVhsdnFEbVhxMk44SjFHbi9sd2gyeWFmWWtnUi9HamxT?=
 =?utf-8?B?M25sQ0VrUWdwWEZEUDQ4eTVWaWVJbkRQdlBiTFE1dHNaay9CTGpsSEVuc1k3?=
 =?utf-8?B?bXRMdkNVdDczVU4rOTk2YTNIVjN0R0RvdjZnakhsb28wbTdQSkdDdXQ4Q2lJ?=
 =?utf-8?B?eWQxcG5wVjdrb28zbkpjZk9NTUU5OTYyaDRpL0xaTThvVnlQMGwvL2JEQXR5?=
 =?utf-8?B?N2ZuUUVhTGNXalo0U09UUkg3NDVMWE54VzVRaS8wV2REWC8vZXBOZDlMcjls?=
 =?utf-8?B?YUJ5cEJUYVJSTHNHNFZNWG5xYWloRGowdnpIZUlrVnErNFpNdXIxWUkyREFW?=
 =?utf-8?B?bVRremxLSG5UaUVFa2FrNUk1NU9FRFp3WXRPcDJBaWRxWXJKczI2K1MvMnFo?=
 =?utf-8?B?QVFyZnNvYm9kdU5LWnNHWEk0bmVoeFliL0J1MldKWUVhalJQR3VIUGw2U2FN?=
 =?utf-8?B?VHRVWmxCcCtuVzJzRWxVMk4yOFVDc3BoN2FBY0UwVEdxcnhzLzBiaDVOc1hw?=
 =?utf-8?B?SWlGYWU0cXo3UXZhakFJTGN4OEptbENHWnV2N0VicG41c2NFTUhsRkNscUVU?=
 =?utf-8?B?WGdJa0VaZTdOYzlhMjg0dGdqbC9rcFQ0bE1rZFRNT01ybFlSVUpjV2Y4V1lp?=
 =?utf-8?B?Ky9XTDJIVVN6OFlTa1hYempYNXMwV3RYeXZwVCswcytYVGN3TkhaTkh6U1Bm?=
 =?utf-8?B?RmNheGtWQ2xuNjIrSTBKM0RBQTZ5ZEZtL21jNDJrOXcxcjNKRkk2WUt1QUti?=
 =?utf-8?B?T2lrcnFsWUM5bzNGQjhPYUJCS0t6ME9RQ2txd0QyK1h4Rm5yZk5vRjJaZlpi?=
 =?utf-8?B?eC9rZWtTSTJrR214Z3UwUjlaT3l5ME9OeXdrSzNxWmNyR3UvVkVhUVpZaVN2?=
 =?utf-8?B?ODhwRWlVTklSQVRxeXRiTEgxUUZHdDNHb01sUVRNV2RNZWpPS3loL1h4WlA5?=
 =?utf-8?B?TUgrT0psdkdtcm80eDdGVG1vQXJ4RnBwVzNQWFdSbCtlMnc5UzN1bXYwcS80?=
 =?utf-8?B?S0xsZGc2VDdCdnZCQ1E5OEFjOUJBdi9rMDJSeHNPaitBWWQxVk1HaGFQREI3?=
 =?utf-8?B?UTRTWHZub2l2S1poQmNWdmtXQ1VScU4yZG1tYWc3VEFUNUY3ZzF6Tnoydzlm?=
 =?utf-8?B?K2VSRmkzU2p0VkowNkRCcy9TSU5mVTYxZVV1K29RNWZ1TklxZktDVllsZVdY?=
 =?utf-8?B?cW50SUlpMUhVeHRKcnQ1ZHBhdFVFa1VIMVIvU3pYVzlqclJNc0pYQnExSDZu?=
 =?utf-8?B?VmtJT0Z4WVdUSkJyV0JMTWVmYURaNkU4ck1SaDgyZFZnQ1VMQlFDK2piWFJY?=
 =?utf-8?B?NmVYZ1FJRUpRVFV2NG9LM3ZKWmtjR0Q1K0hvdmp6Q3FzcEdMNjhZT2J0UlZv?=
 =?utf-8?B?UTZxa1d1UURhakRVUWNVZVMySmVFK2hJVk1wdVRGNDNxWGxodk9SSnltbys0?=
 =?utf-8?B?aWJHK3RWbExoVmZjMmxIQ3NFOW1KMjBaMEtjUDJXdjQwWFc4bElqS0lYQU1a?=
 =?utf-8?B?bjdITC96ekx2NEFYOE1uN2NacUJqU1VyOUdlVXdnS2t2MEp3Wm8vNW5HQ2hC?=
 =?utf-8?B?Umw3alNPdEgyKy9BRlJweXQ0ZE9KMkJ1NGE4b2dudkpueDRsMDNnN09JNEtP?=
 =?utf-8?B?RWF5L1hLakRpWTNIZkJpaUtJeUdYbFZmY1ZJc2tpTTYxcHNtTXE5RVNsM3pJ?=
 =?utf-8?B?OHdBZC9DMDJBQjRhbHkxT0laWUs4L0pOT0k1MDdtdkRLZUJJRUFRYzQ3VmJu?=
 =?utf-8?B?bDZ3QnFrWmJtM2toWnp4QjFiL3Z0djlpaTVSc3RtaWc5LzFKRjZOdzIxayti?=
 =?utf-8?B?aEpOeWlsVGxNY1dpTnNZSXJmekNjTWdyMmRrSFdnT0p6Y0FMUHZLQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0746a5ab-a81d-4d7f-6358-08de8379042d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:28:11.8574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYt6JuKPNPBoVa+tct+DMbWie9GxYvBEGvGdZJVUS33P+DeKJdX75euMeCHstF7BcDfJ1IMW5fLuP8BIHZOmYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6415

On Mon Mar 16, 2026 at 5:57 AM GMT, Timur Tabi wrote:
> Replace the module_pci_driver! macro with an explicit module
> initialization using the standard module! macro and InPlaceModule
> trait implementation.  No functional change intended, with the
> exception that the driver now prints a message when loaded.
>=20
> This change is necessary so that we can create a top-level "nova_core"
> debugfs entry when the driver is loaded.
>=20
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)

