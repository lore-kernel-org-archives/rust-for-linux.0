Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013006.outbound.protection.outlook.com [40.93.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0B237E300
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Apr 2026 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776053462; cv=fail; b=MO3EfHXhSEahSG4+b8theWSeMgt7heWm1p+/jWVWPqsbGbfEf8f15+pto0CQ/uks7zPnHI3bQa5bqlNKwNFwQpjOuYzdDKx6t/ZHjXswusEEak9N01cn06xLCfpRbw6DwN4C+zuktRKpHvCNb3kgcCfeWTK0KDD4XzPdoFLUBgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776053462; c=relaxed/simple;
	bh=RDoV6b5Omlu2f4jd0CziSjWgkFCBRov8QpAI9t0DdR4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ign1dlK3HsuowwuOsAeo4DRpIifeei2ccwl5BT/uc9dS3fixdEzkQRK0/w+I8BuuOkf5zQl+ij1l8f99mJEZhoo/xxtTgNJocyjwmY95q1BgFtaOh/6/dWyelLxhz+wFAkqVsRk28Umn4yWHSPTlsVZEvUwCegZ/we4BYWbpIRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HPu7aa1A; arc=fail smtp.client-ip=40.93.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HPu7aa1A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pT9IKAq6iDUoE4jpjMIXeL1q5wmNFhonuPTWQnvuaYbIkJgNH+1aRF4IDVSuGxzUv8CjEot78uk7402UylZeqMLcIqV6NsjpgUYSAYJLs/y0LuH7z1KQ/jTWXmbHR7MX3/oOIENebLU48AuoswUbn4fDgvRBoWj/nbdMptZtnC/xAqPTv9KZSiLhC2H4lFSrFhCPIwbNgfqv/KjXqmbarKaDGJaxeILbGXIDdsThu+P396B9TZxikb3ZmwTlhu9rPjaDNw6uS4zhdz0tLdlLIMMf6vkIiCarUsf+HCPZVRIDSFqbc82l8k7YUMVC8sbxOTRKYIgHs3xlnR2lxiLRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBFWJuJZlmV1KmSXhxKS66eu+edxpFpHbTjDJeV5Mro=;
 b=q1g8KYO/dfSwEGeewEaGvZDryQYMtOaDT8I8VCyd+uGEIbbF7mHWeGFpptBnTCXbGZGS7Qa5VdOw5CXDL7Sd9K4VxtwleW/cksIQc2xv1K41tr4HYG8Yi7CtEGAqq0FvK2kYhixU6t/fOT8gE7Rtr4CTyQ6TXHmj4O1KzaIok3PaTlQpB0SxQwW7nwHFOFM5iQD3b/FTPJb0qzeRpwDJ149z7oVvsrveVckUYA7p3l02AuDRE7zY4mUx6xt0uSfaOtYLGdtTDBDsJ9EDYHE6t9OGwFHzdliOIUf4Z/r2CwuCPRi8+xT4wEXM31egniciR2FaSiifKlYK8weWrP9AZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBFWJuJZlmV1KmSXhxKS66eu+edxpFpHbTjDJeV5Mro=;
 b=HPu7aa1Aa67+OW6DxAVX8haphA68T8j91NK10Kpns24oQyXBXhFzOzJewr86YYdwjU9GJNj+vwNVnDPcLvwlP7VilQrNs9Wi3lvsSG3bb+UUZ4MchTiNzkYLXTtQidDUyhd7jqFocxfnc8KKEES6MIST6OHyIV+7/YNNp6gV3h/aipcS/5lpbs6+2XxcIBtKQQ8e1YVES0zTr+NwmQlWGHIitBsjuCLvthV4Vuky4gRLmtjwSDCyv7n1YCriVA1GAwoaRp8Zs1A8BDEzMGzekfjjchPzQZ+TarabyNK5PJ+3bipwLWXB0AQB/SXffaTLuq8pIIDWYLwAiwYospodPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7868.namprd12.prod.outlook.com (2603:10b6:a03:4cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 04:10:50 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 04:10:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 13:10:46 +0900
Message-Id: <DHRQEHHP92X1.3SS5TJGK243D9@nvidia.com>
Subject: Re: [PATCH 1/6] gpu: nova-core: use correct fwsignature for GA100
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260410203722.1586938-1-ttabi@nvidia.com>
 <20260410203722.1586938-2-ttabi@nvidia.com>
In-Reply-To: <20260410203722.1586938-2-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: f16cd785-2fca-459f-c7d8-08de9912a5dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C8qvKwNvWZANnEUVcbKqtw1CjIeL4U+SyZFtFUacW1x1lPGqLzmxgnLlvekordU19MKiP60dwM4jeS4+AOQ0aAoTDgu9F6CNtImiKZKcWzPsy+a/MxwziB1d7H5e1VA6ZFvoW+FGK00+vVP9uDA+jiV/KdE9hIDcAE+01dwxDJZiQ2kV28TlunOyP3nppzDcEDBo3Xjs3EqiD9BfrNebFKHHVgNHNGW89DYtsespSgWWTdrP5x5nVldvhYqUJ8EkPauUA0mCB8R3IcjdtOhl/ZSyXaOKe75ShfWFxSzvOsCjGoDsomZoYYjITX11+7bl85m/SW/WgdFFySJ3ixf0Ny2hRXkJ1ZSMxVRdt3hCgvYpoW63VUY1/9xNBu0UnZDAmIrsmrlyQqE/uRSIvJytwknwWhdb99wOKw9UilL3uSrsSnY4RJN8DupWUxqOOG9G8/kIS8HQ9/JOOy7X4C+bC+5Y4qudTN06ddd21/pptvcetvp/o/mXVdcPIL6OXOODPLLpchXTNHTLcukxzMWvLldr6o6Kyy4P1/668OJ21ZjrEN8wxmwKR9yLt3eC/NZmrwTiasIyyCgsDf6iuRuwCrg97UiUXDG4xiPk7Jut8Nn+ZExLdqD3YT9oC5X/m6r3roaqHpe4gZkm1D7BXtWVMm+Op8I1oZtq7UlPcDNA4BqNarmiYr7Rk+mgC+AZNYJCZhklIqHyYVsQzulMTjua4qmmZz8nyb6iPCfy7+EWt7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUZrOW9BRUJMdVZhakZMaDNnazZJSVpRb1EvYVBhREVoQ0VnSGRhS2Y0R1JY?=
 =?utf-8?B?elhiUjNNeHZnQURrRTJDVnQ1OURtWGl5YVRJY3BBWHNHT3puYy92Zk5FQzQ0?=
 =?utf-8?B?eVlYalBUN2tUV21jRHFJTEwxWWpqWHJaYThEWWlua2hVNzFkWWpvZUZKaWFJ?=
 =?utf-8?B?dWZJTzZNL1JLUFQwQi9aZERtYjErdnFLQlVaS2dpejRWa3RRd1UzSkUzWGh6?=
 =?utf-8?B?NXBkV2o3ZHM5cm5mdWNSaWZpWkdGYk43WWZIQ0JBM1gvWEdUV3BxTWpJRUlD?=
 =?utf-8?B?VmhvYW5IUVZsdTMyRVVqRmNNbmRFYXFCbVEzUlFiWi9QejJtQ2dPLzVMTTcw?=
 =?utf-8?B?c0dSQ1VxREN6dmFNN3MvWTM5Wjh5TnJkRS9GWmdBb004RDBGTlQvUjZGVUpj?=
 =?utf-8?B?OTlHZ093aVZzUFd3bCtWOVdjMlBYcDQxLzFSN0t0MHlGS2RPY2tjSnozb21V?=
 =?utf-8?B?WDNBNWVmQ2hPRFd1RENKMFhhVVJ0N3Iwajdnb282aE40c3V0M3lIc2hxUlV0?=
 =?utf-8?B?SnRvNFlwend1NFFGb2JjTW1HV2hPcHcyaHZOZlY1LzZEQ0h4RnF1bWNJQjNL?=
 =?utf-8?B?NTBTYVRkQUVOeEpEa2NXNGdFY3VqdEk3Sk8rblhDRk5xZXV2MTlZNE9KTW40?=
 =?utf-8?B?WUx0R2FML3JaLzBmZEhpbDl3QldOSmt4YjRyRlZaYlRZSWtNaHN1dy9jZnhX?=
 =?utf-8?B?Kzc4WHNUVHZ1dXpxTU5Oem8zYzJ4UElTVUtxaGZyekovcUYweTVvSHlBbGxM?=
 =?utf-8?B?SzNoU0pJN0laRWhoQjhqb2hxWnpFZ2lHeHBDYk1xclJBZjF5eUtxeHFHcUJL?=
 =?utf-8?B?YmUvMzc2a1M2cTRoMXZaZyszV2gzZWJDZ3BhTCtaNnlIeEpneHJUbGtZb0dH?=
 =?utf-8?B?SG9VL09zNkVaMSs2MGtrdWt5Mlc0SXBHaGtGd0c5anl4cXYvUXltMVVqa1gv?=
 =?utf-8?B?WU96VVEvSm4vOHU0NFpjQWk4Q2hhOTVnRU9OdU5pNFphbEZCUEFUZUFFUnhx?=
 =?utf-8?B?VlcrUFZKZncwNWFRVG1NSjlIM2txRVdtNy9XdjRaTWJxTUJQeUkvTFJLMmhT?=
 =?utf-8?B?WmFwMk9nazhiaXBqdkhTYjVoTmpEaDQrZ3VqWWtFRzBWbmtkblA5cnRwdU1H?=
 =?utf-8?B?Y2ttWFUwR3ExNE1WaTcwMDVOLzNBcWRBdEp2N3RUeTVVdCtVRFA0Q1AyM1Vy?=
 =?utf-8?B?dXVpd1hjbXFiNnQrclJmSmFSWmREK2I0THEyZEtpUDBtdlljRkJTM0RkVEZv?=
 =?utf-8?B?cEplNEc1VXFWa2JycEZzYXQ3OGc4bWVqbGlRVDMyQmNlRXZPODFJNXBWZkVH?=
 =?utf-8?B?R09uYm1lTXZaSGlid2JhcENRYWcxRS9PN1FhbE92bkEvS3RvMDNMZ1lTaUlJ?=
 =?utf-8?B?T3lSSThDSk1FT281ckt0Z044NXRZOVFZV3M5OEhnMm5OVFBuNTBaVzl4NEJs?=
 =?utf-8?B?NytYeld4d2x5KzY3VlBIOW1DRlJrTmZJWUJWQ1NGenhTdUd5aHlxZkFNaE1O?=
 =?utf-8?B?dUREckRVTThaemFHSk15Z3pBS2I4aXIyQnBlYU1ObDQ1T2hoaGIvUkxoeGJG?=
 =?utf-8?B?YTZNQnY2NnpDclhZU2prMDJMd0FMQ1k3Qnk3bDVVR0RqTThLSDM1dkFYNTBF?=
 =?utf-8?B?dXhMTzIrd1pncXU1OHBoZCtFeHdxWVY2Q3I2bkx1RE5GNmRUMlZOUU01Z09I?=
 =?utf-8?B?RzlVVkVPbVpyWms3U2hreXB6UFJ1M1B0Tm12bEJjTVNpSWVFSGI3VFQ0RDE3?=
 =?utf-8?B?VURzbE9RUWt4WmdZZ3RCM09uelg0a2p5aC9Vb3RtTVA1ci9OaDAybW9Md2Er?=
 =?utf-8?B?MG53MHkrZktZNWR5cEQwa3dRVDlhMEFEQjlMRE1ZQTFQUWx0ZGV4N0Rvc1hz?=
 =?utf-8?B?Z3Z6K1BYanBzMXZBOXhESFZnbWhMK1pRV2pERHVtUDBMSEZIb0pBMElVcnVh?=
 =?utf-8?B?aHh3bVZrQlhjb1FsZW1yclhjbHdGN1BoV0JIdWIzVW0vYW1BUmlSSlBIWkd6?=
 =?utf-8?B?TEtYT1U1RzBka3I0T2JmaTYxM3NJRWV4ajBWOUlFekNYczN5OVlnM1NXL2JE?=
 =?utf-8?B?bGVtcTBueXl6QmszdEV1Ynh4NStsZmVqdHJBMW5oaFM5Z2prSjRuR25Pc3JC?=
 =?utf-8?B?VTZZMzlTRVptRFBlUk4ydHQwalNoZmNGV2dVR2N2azBWejBYUXU5OVpHWFF6?=
 =?utf-8?B?UVRZdHZCQjJ5U3dWdll5RStCTUxEbEh0SEsrOXdYMTRtVGRab2ViNmlhMFdu?=
 =?utf-8?B?TTZqVytDUFd0RlZYaUY4QUZiUXRGM3V0MDdKb1J1dURZTC9rOXlWZUQzalZD?=
 =?utf-8?B?WnpUcnJHWEVpUEJFanI2K1JjMGlaMnFjakRnWEQ2ZHF4eTlRMDFGMUcrOTVq?=
 =?utf-8?Q?d3uJzeRipqpV3Vw2eFXBKtyHZ0yL2H79N61McmRz7PABr?=
X-MS-Exchange-AntiSpam-MessageData-1: luLR+bAuOkyE/g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16cd785-2fca-459f-c7d8-08de9912a5dc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 04:10:50.5898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2K4L1xdhEbXvdWrdTSnN7ox/3Et60SasiE2RZie6D7+RyQsEaN6d9NM6WQ+tu3y3gtvzIdd6g63CjUMwHNGeHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7868

On Sat Apr 11, 2026 at 5:37 AM JST, Timur Tabi wrote:
> Although GA100 uses the same GSP-RM firmware as Turing, it has a differen=
t
> signature specifically for it.
>
> Fixes: 121ea04cd9f2 ("gpu: nova-core: add support for Turing/GA100 fwsign=
ature")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 2fcc255c3bc8..63e464788c0b 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -139,7 +139,7 @@ pub(crate) fn new<'a>(
>                          }
>                          Architecture::Turing =3D> ".fwsignature_tu10x",
>                          // GA100 uses the same firmware as Turing
> -                        Architecture::Ampere if chipset =3D=3D Chipset::=
GA100 =3D> ".fwsignature_tu10x",
> +                        Architecture::Ampere if chipset =3D=3D Chipset::=
GA100 =3D> ".fwsignature_ga100",
>                          Architecture::Ampere =3D> ".fwsignature_ga10x",
>                          Architecture::Ada =3D> ".fwsignature_ad10x",
>                      };

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

