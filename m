Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012056.outbound.protection.outlook.com [40.107.200.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71C3803E4
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Apr 2026 04:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776054027; cv=fail; b=V3hrbfI7Huwmvuv0gL8IwjAsv1Jnt0OWEM0oW//URHDgof//nI1nU/DcryZHZzmp0xtoooOFBT2vebqVTydaT5+dVQ4yZ6scUu3nk6FTlC2ukgFFMtI9fvbioxVjVHeBuHStEq9Mz6GWoG051nO5IHOyuyyKRpADFfYDrZhxZ8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776054027; c=relaxed/simple;
	bh=1XO6h1yt8ZqkvruIUpnC2wOVv1WIx7mqI5JBkhuPGqA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MsCU8hSe/FTsTcRbwr82QUY+DFH7yFNIh2vglFxIZGYhoKjtrTUmSqjwoyPKc2x2QCoEPZI+opl2O68ZI1+3NmcN0yQh5F8mPZgDeLlqeXs/RQUXQaHwzWrk3mFHTc2RRcRLAs+CeDHGn1jtRg2MsCavZJZpy934sWwrV6z3BKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PMPbxxAo; arc=fail smtp.client-ip=40.107.200.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PMPbxxAo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFTme6pCiESZnRXieHW5iGz3rtqi4OwqhT8Ckt5beIIn8hBxQNN/L2Ft4JSJYDw7aZIgXKt2WSu8hJWKAV9jlr5u8OZH9O9AINIawT8+VkS9K9P3h9F1Zf9nyG+ClmYEETeFJuOyoXj9RaFvOLE7t1ocAT9zfLCp9/GSQCITwmSSPd7mqoHXoaa8KwIbPAReq2wU4a3N8tONoG7tMPRJrgLd2iqK0V3oBG2W9Ha1D7i7pmDpLTB1rHYO50lqNFGAkx66CXqiisEGM03Tf2C+k5h7fxl+WuJkwbr4Kq56KP3Fe1+ezw7F5v0B6Adn+95WHcnAYcKJFPoStL/dQp+Xqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH1XGpOxZBoBERRu1XwIpJHHoWT7SD/Tjk9XrU167fE=;
 b=ynvGs45mdYHEMNBsa1FKZk6ooc5ZVpgnu9N5VGBTfCJAJyYV6SrFxIG2NQ7dJZj/5yTwbftZoQjbzqh1mqE9NXVIl5U+4X88QUoSTy6DEmrwLFqWkvfoVDXRmK7/UanX3rGx7pMDNXukykOM921BG9oUhZvwteU93Id6Z0OeDraHzTnphsru7dq31nfqdInJQMhNmgRGD12s+xSzgPedGgmaTA7CV+c99per6bhjOA725GRiqKVwbXhMHuMLr4jU5woReYJoJPsHYAGzC6gtPvwiB4vTdg6Y9Vj0R86NogOj3Z+3FoP36eNUwyTV8jrbAEbYNxB1hrQF21QUMq6VaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH1XGpOxZBoBERRu1XwIpJHHoWT7SD/Tjk9XrU167fE=;
 b=PMPbxxAoWdL5259xHHHFj543TiQm1xOuqNiXStG78s2UoG6XL5xhLYv4NW/pmKhjmwk/aiOtMDip0RRRpvadFce5h59OGMyENhsI87OGKJ01uoUiUU2fmOs536LVj9P5VPiWtvqUshvF1l4juCj19GLV8XN7LP8IJIUXYlcWLHkiIXfIN2uC6kLZ2eleMZ6xRocpyCYow1hKxtpLt/x7YeUHMpXL/3GQ3YIj2jIPkT6geZ8qj0CCzggXys11wh5o8e0pD4xlwj+p3K4ioDxDXjbnE147JNCpyPfPr13GM2OvQG49RQx7hucpEc1lbHTBWj++XaCSMSkLbn+5t6jIxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Mon, 13 Apr
 2026 04:20:17 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 04:20:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 13:20:13 +0900
Message-Id: <DHRQLPYHWWX8.310NXJ9OULQWE@nvidia.com>
Subject: Re: [PATCH 6/6] gpu: nova-core: enable GA100
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260410203722.1586938-1-ttabi@nvidia.com>
 <20260410203722.1586938-7-ttabi@nvidia.com>
In-Reply-To: <20260410203722.1586938-7-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: adfd750f-a6f2-4557-f6e7-08de9913f783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i1JBFi5Z3l0RcqnSHNRB05RxOh90Vqr9q2L2vwgJpm5PkfJxmYZ2bYxMF/93go6nwIcGgD2iZtRxGXFF5KNZ3q8tuAqFIV785Wv7jKhhsDX9XRI+2TkMBHyb/RsGTrPwajPuYNJK6+x/YkyfMA37V8W6jfHyNa9zJga5MLS63H7OTNH7G9K4xmdg5BOG5s8Jfm8goxsFtUgYB6VWFMi7XpM+AT5n6hvwgEjDy5tph7bA2OVXz9+KI2fBJY2fBRfZsnhZN4cN8GVMgMjtaa3TPXS+RVKQo5T27lp85uA5GUWF91BiE3D1fh7rY4LQXPoIwEs4TPCX6hUlLqhzJo+AH9uuUsacVZNxvQeIYT8kVI0vjyy7xH1cyh60np4bftLGILeBeYsAIca9wf05xwJHRWZ1jCGnwXHIXZo2UTV6WA6vH6wMUJojnXwLDuSGEFpbkwHZE7NKH0IoJI+fktYGprlg2PQmq8BjYnLQooR0D+vHN81FuZ4ONuNv3qjiDsSE2Cubz6I8TAy/qAf8QTxpkOQ/P8+35FgSrpINDkKeIEad5TCIJPR5sisLhLEi5FS52VDl4e4JbskVhk9vU17g7Zd4tF/Mn3MJ7h9MgTo5e+8CUMgaguCr5Qwn0n3oBC8e6SxNq1VEx8T+lsnLids56BQIrrOhkTNsuTXurwDbLJogIKaNKcEP5TpqlqBMZTwvk7dTer+NV3pZSOfq9SHRtXnSytJmqgHoj9vqn/nGG4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG5WREZMZVlKbGFPUm1kTkR3RnRGUTE4ZXFpK2huTHUyUnI1ZHd2OXQ2ZlBx?=
 =?utf-8?B?TGVkRHlaT0V4WTRVVXVDcERTLzBHK1lQMWVHMlYwMCtFMW8rRzZXN2I5N1FJ?=
 =?utf-8?B?U3kzaHBxUm1LUTFvN1dBZ3J3U2FneVpsamJseEZ5L04zN2NjU3VkVnNCN0d3?=
 =?utf-8?B?MXdLYzhjL3VDbEthSHdyTUdoeEFDLzBPcGRVb2lEMXFVamc3cDNhY3RFeE9w?=
 =?utf-8?B?MGZ5QUV2anZ0YloyU2NGbVRTMG5UNDV2Y3hzZDNha2F2Rkg2NzN6eDNqdjZ4?=
 =?utf-8?B?UTNSZ2VkWmtwTW1BeDd3QnN4L0FmbWxrdjYrMWFnQVpWTTJmc01GTHFxcWR0?=
 =?utf-8?B?Qzc4QTBxaE90bEFXRE5BZ0lIZS9KK1p2czlEWUZTMmZXRlM1em56eFRoKzAv?=
 =?utf-8?B?RmJNblBhWFVaSHZLeWdzaWZ3Z0xTUW1jYmY1QW9lMllscTJhWGxrclBpM1dG?=
 =?utf-8?B?TCtHbzZ4UDJSOFZUYlZHNjlkWWgzMmJUalFPUnd0L1RmTTdqQlhHRWwrNnZZ?=
 =?utf-8?B?bWxuaXlBeS80ejlnMTFUSUQyVEx1WTlPU1c0ZnRIV2RROFRzSjhycWZHL3pN?=
 =?utf-8?B?cENRVy9TR3hpSk5rYUorMGZFT05iVVgyTUtKMWNHR1U4QnEvNFpET2IvRUV3?=
 =?utf-8?B?aGtRaUE1eXV4bWpNL1J5Tm5aaFE4V3cwMW1RVEp6VUswZ1o0VUlGRmkrWXQ5?=
 =?utf-8?B?NzYybzhib1daeTRFVHJidHc1UmVjeXNJM3hrYWNqVVB5emh4d3dpM3RiY2sz?=
 =?utf-8?B?NVB4eGdabzJZTHg2NHhqT1NXU2NkNzFxRUwxUDV4S1BNUUlJUGVxeFBxb1Nt?=
 =?utf-8?B?dVdXYUNWL0xxZENRbUJ2a0haanpMUmkrVnNwbDhLOEVJRW1Hc3V2VkltT0l6?=
 =?utf-8?B?SURxYWRuYStSUEtkeUd3MDVtR2Z5dnpxellJcm80a3NIKzFwTlZnWXl0NkVj?=
 =?utf-8?B?Rys0MnJ5amNIYXpTaUk1ZGtORmVhNDhTbXRsSnh0WnlVU3FSQmNJRWhBNjNz?=
 =?utf-8?B?Ui9DRFcyRVBTbXpIYmVPRE4wczJVNGZPRS9Lc2ppRnZxK0dySXhtMUVmRmU2?=
 =?utf-8?B?RWFGVlJmWUlKWDhabVNNTjRXR0tsY0lQR1BDcHNLT2M4V011Z0lzYTR5MkRh?=
 =?utf-8?B?U2hmQVVwNllFbmV1WXc5SWFKNWNLQ1FmNVR2V3puSDgwZm1VYzlFcmV2bEVJ?=
 =?utf-8?B?ZjN1WmM3L1c3QVhFNEFNSmVrSzJUd010VEttcVJzS01qTFNscUYxVmlpWXBr?=
 =?utf-8?B?SmV5cUcyV3J0MjBzeE9ZeER3bE1LNlR0MHBPclhMOXRyWkxDaFZNZEtySjVV?=
 =?utf-8?B?TGdoblRMOGI2WStUV1BOeE1YOThaSWlEKzV1NEpVUG1DK2oxdWdOWndkR0g5?=
 =?utf-8?B?cXBMOC8zZnNXdGVOeit0YndPRVc2aHJQaXBlL1pvZ0h0YlJTcWhsRXRtKzRR?=
 =?utf-8?B?ZTJBMHlKM3JRQnJhWTFlVFl0U2IvR2ptY1pjK0R6TnN0Z01sK1hrRWYrNHc4?=
 =?utf-8?B?UlZiUXF1T3FKcGIxaXkrREVVcHdKNUVtT214ZjhCMVJ2NU9QL0JMZzEzYWtB?=
 =?utf-8?B?VmlhMi8xZTJpWVA4UXpiV21pM0NocUhZRTVzWitUb0owSVYvODFac0VGUWwv?=
 =?utf-8?B?eTR6N2VJMWU1anFWaXNDc1g3eUJkWW54cHZYSVNaN1dFUFJYK1JFRmgxWHFF?=
 =?utf-8?B?QzVrOUpjOXhPdDhZTGU1c1MvZHRBMUQ4TGhxeWNJc2tMWFdVbTBteFJKMTJ5?=
 =?utf-8?B?VVNGWFgrQVkxR0krZlU2K2QyR1ZKdGtLWnFqQVN3M0hFbmM3SmR3UUcvNmxs?=
 =?utf-8?B?ZWU0RUp1anhhL0VZSE1zUTdTVjNLY0JKSDJYR08xK3g4VXd6YUJVTnl2SzVY?=
 =?utf-8?B?cGNMS1ZpMTBlYjIrYnd6emR0aVZPUElTNjU2MjJMekM1N0s0VFp1QThOOUVL?=
 =?utf-8?B?YUR3aVJmTFhnWCtOMjdsQkhBTkQrN0xuQjFjNUhmdm0xYVR3Yjg3VC9maVVH?=
 =?utf-8?B?UW1jcEZhRTNGQStqNmJvMWNlc3I1NWRPWC96WGVQZktQOUlJNXFDY1R5b05j?=
 =?utf-8?B?NFBGcHZpVXVzbCs3dDFnQnBJZlovSWl2ZkRyT1FxSEZ6NUVEV0xKN2FCNUFW?=
 =?utf-8?B?a21hc2c0d2FQVDlVVkswRUdaNVBRbllUcnVSS3dWbkQ0NjNsWWdRZXVlQXFW?=
 =?utf-8?B?SzBYTHJpWFg5MEFkdjYvVUx0M3A1eWFkRHd0ZlBpWDNaNTFQMHJjN2RBcTRQ?=
 =?utf-8?B?VkNHYlYzbzgrNXpjVElsRStnS1FwRmFBRFJCRTlzYlFyOFRuMTI4MlV5VUFD?=
 =?utf-8?B?QlplSG1aakR1Q0h3SU9ZUEdCdU9EbzBoTUhmYlZ3cFFSWDNhN3ZWaS9sait1?=
 =?utf-8?Q?vSBd3LpNzGYUzBhv5P1s2okdW3yciEMhqHojKQ+P1w/qo?=
X-MS-Exchange-AntiSpam-MessageData-1: 6mq9nir8mo4QfQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adfd750f-a6f2-4557-f6e7-08de9913f783
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 04:20:17.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7i/7EzsV/vEuHUneCnbl/NZFR70hTQYfLURoHP0Huf0RtGKlJdfOqGkHbuRDdeoA1wQVayqsDiKOzinClPEBJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035

On Sat Apr 11, 2026 at 5:37 AM JST, Timur Tabi wrote:
> GA100 is a compute-only variant of GA102 that boots GSP-RM like a
> Turing, although it also has its own unique requirements.
>
> Now that all the pieces are in place, we can enable GA100 support.
> Although architecturally like an Ampere, GA100 uses the same GSP-RM
> firmware files as Turing, and therefore must boot it like Turing does.
> However, as a compute-only part, GA100 has no display engine.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/hal.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index a7e5ea8d0272..5c2f92629eec 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -77,13 +77,12 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
>      use Chipset::*;
> =20
>      let hal =3D match chipset {
> -        TU102 | TU104 | TU106 | TU116 | TU117 =3D> {
> +        TU102 | TU104 | TU106 | TU116 | TU117 | GA100 =3D> {
>              KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn=
 FalconHal<E>>
>          }
>          GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | =
AD106 | AD107 =3D> {
>              KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn=
 FalconHal<E>>
>          }
> -        _ =3D> return Err(ENOTSUPP),
>      };
> =20
>      Ok(hal)

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
