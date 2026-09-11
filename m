Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58431A6813;
	Fri, 11 Sep 2026 05:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103958; cv=fail; b=W7U+J56WHKmSA4lbm5hzqq/jqAcos4DpW1gdeNplOxtpfSqVXcnfamHb2Ue6s40xpnPDyoDZU+BQxEI/DeCi3+9qDPe+UwNhor8e1jKcgtkhleHoAxZ8w+Akko1c94O7IcVTNKjHlOQ0TyQ8z10mXzRDXRkvr/0kut6fzOvPOKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103958; c=relaxed/simple;
	bh=SphyVDkvVJuMdoquoEHJQuhByIcn9/jmNTyTZs20O4U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AMn4q4oGK7OyQKCZSTfOD27JoZb1Dz7F0DXM2OyCo/4c4fZd5W5qTBQPLM7xJYLpe0jdzeV828nTCb0NQW3KV13rh+RIKa3bmwHlcxYMCZ2hmidEz2QXq/nJTzn2mgYHgbXIH2vy/7kFyJbo4sX3xIjSW7Cd8QnXdoEEjWB6mV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JobLjwMo; arc=fail smtp.client-ip=52.101.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JobLjwMo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StxotzDBgFu475q5mI0DiQhAKF3IeY35KvBV/geAQw7UPTMqQlCTFBTi786vvVfaqf0r2gQyrd97f2aaNpveHB5+m7ODGzuElV3qRcKvqBGD0lh+7HrxchphXuPVbB71XhLXoD3WCkQjkY0PzCieQW8SYYk5nja2aGvdieLFaAzjh/WiG/PXM5U4JjDQL835o8SKAfsFZtrzI9OG0a+dRb8AyGon2+MQx7sNxVKBVehXYP9yg/oAeZzYomhmq+GjTWp4pQ/L0J96FC3bXBu5bxBhlMv1qYJqEMCppOYXEUoU0+d9v0gotl1FFBAxxRwnMScyQxKX16qhceNh07FhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SphyVDkvVJuMdoquoEHJQuhByIcn9/jmNTyTZs20O4U=;
 b=LOauWXBKKvHfLxjIYJhVjvEQRkDDS3kOUsW2o7Pi2cDQlaSMZPc1KsRhJgO2mSPU6w6Y8Od045arQ3tskD0suHqmG4M7lHJwyAYtKDm24j0dzH87aC8fC1SYJCoFga6fEP6KA+KYJYH1Bu0qzYZCRxUYLYHyCYOJ2YRI943sbvqEZsDxrP1eIcgQF5OJIwBgp56KaQcvOZC6stvnxrSIUKdT5LH/mzJvLxz/Yg1DuJ1qkvUZgOh2rpwr3wbAMOaYYLKq3SNJF6egY8B9AsYMDJdPAHHzGa1/S+q753opF7JK/IWsCalrFqCFCqwM+Djv3ailLTLZuTT9XHmavR3SYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SphyVDkvVJuMdoquoEHJQuhByIcn9/jmNTyTZs20O4U=;
 b=JobLjwMonKiPMyYZFtR5Ld+T6TJX74bvin2B78kXbATosbkgysNjPXriL0QDDme4ag0CZ5XBDeZIc0mAXRh/iR1vNFgccYoy6XXYCDVCCooy5tBQCOeEvS2UAQtBnzwDHwOLos581z5flfxiYH++hNBHnpC6nUKsVrKWuecgsUgcG3jnAj/mUVPw6UdP5KGBDeqIT0znujfDkWtRdWab8b7ugdkobbDL1EgOLow0DW58L3ukbDfU4tGt0Qs3tP3AYP/mwU5RllrW9El3XHTUMx5QpWeWXrYZ9625ncek+DcTMZaOkxHIaiyrSepD3WbFEItZCUD8UMCkxQUdc7rLFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Fri, 11 Sep 2026 05:19:11 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 05:19:11 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 14:19:08 +0900
Message-Id: <DLC8F3FQW27Y.ZTNLIP1PU3LI@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Yury Norov" <yury.norov@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: bitfield: remove unnecessary `#[allow]`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260910170542.92010-1-gary@kernel.org>
In-Reply-To: <20260910170542.92010-1-gary@kernel.org>
X-ClientProxiedBy: TY4P286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d8b00c-3ab1-4218-9299-08df0fc4367f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|23010399003|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gKnjHDSbSab6olg9oAdryCxDvfyQ17MwzmTFkH2A4glYmMwSVmpoNUidQq6xTthWPu+055KNJVwUFPJ0N/ikuhsrrO6xL1w7xjmcFd/jOg6Cah+/3cpwN8Y43zi/Hv5cl5lKh1AP4IMG9CMCwJXbeD5qwU2zumQHXpaEBUuRltTOP1ndniDxDK+Wk+U7+Jbszdnu+BY46auptS8u4QVhv3Oj5phYO43qlQof19EmRYMxpefBK5rg1maSZ/+Z17msAHXQNazuRzm5qgWZ8xEhHchkb84gGZEKOsInCV/XGaRkRIo5br+sRHuEv6gu6LTj/GkBAdVsZowDEpKt+vxXvQx2rKSsdAqcBmoiMdSZ6qFMq+nODhAF2Z281odQ8CsUKNJNx11IItKENZ7kXga4e9ARMPPw1klIkFo1p1p2kNiinVro0TWM5DlBFUDWUVmMrljKnu63BiDO96hvVzIkthhG6noyuMFvRKH8jhndhBI52Y8bO+bynsJTNq68RkFXCGsY+f2oxQ2a7DjR3KTWKWbhBvimwd4rQxLYZCq1VZbilFKYlWC9LCzALegZeMRdKF6cUttYikskXFs7KG2LQZW5YErArhIDgY1oP8V+txNzrtNRMScGELsmANc7CI+qATWRPEODxf2IhGNM0s71eHKl09QkROWhhch9vmWvzIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWJnNmYzWTdjd0pVREJpTlpMRUY1NWs2OTRnWi9DUDluTktuQ3dPS05nUGEy?=
 =?utf-8?B?TUVDVmFzMmtVdXpVWFBraDVDK0ZlblNzU05HTlBQc3V4YkhBdmNNZUFQb0Nm?=
 =?utf-8?B?Nng5eTZuNEtHamR4Mk5DRGlWNTEzS2lHZXMwVVNzZHY4cFk4Q1dROGFQZGpD?=
 =?utf-8?B?bk11VkhaZlFFZjhkbmlSRWRBQWdqRGNTcTE3WHNuUFlyMmRYblJSNlZGWXVk?=
 =?utf-8?B?NDVNTHhrbm5xaDFtVk9kWnk3eDFjTmJYODl2aWt0YkVPa2wvMUlSZXBVZVZV?=
 =?utf-8?B?WlV2bFM5WUNORDJWT1VzU1cwQkZwVmc0enp5cVkzUFZYd0hwZE1SUjNjOG5n?=
 =?utf-8?B?T3N0NnlEZUhNNXpOK2I5ZlJxMmhRd2tIbU5MbHBLa3JJYUxBeTk0TDNZQ1RS?=
 =?utf-8?B?MTF6VmxFakRCUTQwNjdxMjNWUU5HNkNkbWIvR1h0VFM1QjFuZ0pXTk8vUURR?=
 =?utf-8?B?eHhnMTlJdHNPSlhQSlAraXRPdFpHamRzSWdtZm1pYmpwYml0YVYvSkxzZWFl?=
 =?utf-8?B?TTlXM3VkbWg3UTB4cGoxQ2Q4azY5QmYyNml2T1J4dktNN1NnbEpyWXdnUGlR?=
 =?utf-8?B?dEFiN1RuVjlEYVREVysrajBGQ3hZNWVKQUhrN2VrNUhKTlBqMkloSERIZW5r?=
 =?utf-8?B?S3Y1S3NOejY4RzFNN21qb1hYeEtDejdMTnY1bE02OE9GcXJDWmNYSEtMZDNh?=
 =?utf-8?B?UEVqaW1jcE5PMXlkaVFMOWd5dEFQZXJzMUdkWk1JUnd0OHY1WDFFcm5oQVgr?=
 =?utf-8?B?WXRmMGdOVVlYdDdJZHBCODRhQVdqUzE1NE9ZaElkK3RvUTNQRzB4aDFqWG4x?=
 =?utf-8?B?VW9ickx1dCs4R3RUTnd6UUplWnJSUlFmemViU2owODYwYjFwU2JMVzAzYXZD?=
 =?utf-8?B?TUw4NVZObEpLL2NUUzIwcVdFa082UGZVV3N5OHdFNkpMRUlQejV3Y2tZYmdw?=
 =?utf-8?B?ZU1yWkhsQ0ExeGoxSmM2VFVJZ1dMZkVOSGRqOGJrTUIwZENJWVdvaDQxMlY3?=
 =?utf-8?B?VEJFMzBuZW14Rm9lZFdIaXB0bmFwZ0U0ODVmeXNWZVpsSHRpRGFVMFJaNEow?=
 =?utf-8?B?L3lNNEJvRzd4U3hrZDJ1czJXV2FXMmdLRkdpSE5VSUNBNVJ0Tk5uODV0Z1NW?=
 =?utf-8?B?Myt4cjhzV3U4TVB0TmdwUms0dTRDT1NlSzlMZWd0bTQySU1sd3BrZzVrTUdi?=
 =?utf-8?B?VVhBdDRuVUY0SEZ5SVhOOTFRU0trYXRTcndQL0ZwcUZhVmk0ZjFSZGJSMkwy?=
 =?utf-8?B?TnpraDhvQTZDTDBzd0Q1ZXBZdU9IM1FpQklLTGwyY3dJT3ZOMkg1WmlxUXBs?=
 =?utf-8?B?NVNHM0pWZk9IZGR4WUhhQ2s0Qnd5eXRsVHRHOTJKdjVTSnprT3NDMHRyZ3VX?=
 =?utf-8?B?b05vSmRwQ3lmUWRQZlQvbVJwcEFGMFFzR2w0S0lnaitJazdHQ2tsTTBkRXdm?=
 =?utf-8?B?MzBVaUdLQVNPSXNIV3UrOHQwSG91RHIwdWkxOU1iVHVMR2dCaDRkcGR6ZDg5?=
 =?utf-8?B?b0lDeG82S0w0dTBzSkR0ZFdxN0VoRnUvTzA4TVlFRkpISjVBUFJwOFQ4eEho?=
 =?utf-8?B?Y28yYXM4TmNRSE9xOG9sSmNCdjMwZEpaM25NODkwS1ZFVWRqRFZmWjAwTTB0?=
 =?utf-8?B?cm8xS2Z5ZnJtWXZqN1pYWjA1VGpaWTZhOXpwNlE4VGlYYzl3eDBiRGFuTjEv?=
 =?utf-8?B?QU1mOUdoODJTVWptcmFMcEsrRDk5ZlJIRzdxRzU5aGY0cGJwZ3B0ZmhFLzk5?=
 =?utf-8?B?cDQwT3RRNjBYTlRscHN6ZHhVZC9GYy9XRVpGcU41bmtPK3RGak1VRGVtalF3?=
 =?utf-8?B?bXA1NnpsMVpkSmI0elFEV1hldTVFVmMrZVdKa2x6eWRabWFNc2g2T2hraTRi?=
 =?utf-8?B?NjExK0RuOWZDUkFjaXN4RDlJc2xUK0Vkb1M1OU91SDVVNDZSOHl4QkdFMk1E?=
 =?utf-8?B?cEhVYitXblZRc0NuSVcvckJGQ1hPWTM2Wjg3TDhYSlFUazQrbFVLL1hhVytT?=
 =?utf-8?B?RysvMTI2Ris2YWJpREJBQXZLbnFmUCtPZGtQRlVxMmVKamVqaUdyTUpKMVhC?=
 =?utf-8?B?NTFrQ1dmT2UyRU80VTRON3RhRDIvRDBJTkJ2TjRIbUdFOXVUb1hSWGRxdWR0?=
 =?utf-8?B?eFYva2Y3c2RpcGRlYzBJTmdFdm50emQxMDNNYTFJRlZ2c0NpOXFFSjIvR1Fy?=
 =?utf-8?B?TU40YlpFVERDazZXV1h6ZTJTaGhJTThlQldwcUVuOUNkVUZNc1BwRzB1Q0Jk?=
 =?utf-8?B?V25ZSmZXSG5BcXQ2cGJxM2c2K08vZVdmaXN2Ym01eDlLRUFEbzRLbjBLSStR?=
 =?utf-8?B?UE0zNFUzc3pCUElud01nd2d4b2lrVkxkT1V4bDFEWlBCeW5EUitwblVqblYv?=
 =?utf-8?Q?zbOrOnov+oYDdU5d5yn59A5J4Hd9SUMid2gOx9vhN+JDv?=
X-MS-Exchange-AntiSpam-MessageData-1: GI9VUnwI8SBgYw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d8b00c-3ab1-4218-9299-08df0fc4367f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 05:19:11.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ukpLfzFY6jl8h/a7//yMcQmY81eAcL2pVG48EaBCQ/5Y5cuLw2Yj1B483FV6kI2lDD7j5jjcrnUpmYam5piQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814

On Fri Sep 11, 2026 at 2:05 AM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> The `#[allow(non_camel_case_types)]` was there because register names can
> be commonly SCREAMING_CASE and thus not CamelCase. However, when a bitfie=
ld
> type is created by itself, this justification does not apply. Thus, remov=
e
> it.
>
> Users that want to use non-standard styles can add the `#[allow]`
> themselves. For example, the invocation of `bitfield!` inside `register!`
> macro carry this annotation.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Thanks!

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
