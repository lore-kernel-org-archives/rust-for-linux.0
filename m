Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010029.outbound.protection.outlook.com [52.101.56.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957E335AC00
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 03:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776397978; cv=fail; b=r5ufrD1tdW52CDvW4YlJ0Em2FfuHUj/ah05Gp02PY7qWS4JkeHe/fDndVWyQ/h79sGzM4WqxgBRyL6/hcevDdcC4OoJdNk6wLiCeOYk7RTF/5WLcpX3xgZVPYfVUyWUqO01ROBEAYjZIvhBsdGm2aSnd90onJtWlpKsOG0qEJQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776397978; c=relaxed/simple;
	bh=qOy7ZlNYvM4Es788k2UaB+3e2PgtQlPUWVCHZsf0iHA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=UNhDae1ZX4PJNnprB82NGP88Xv+bRmqrXjecfcjxjERtRCa0J3v6N8/NnFNkGSKrhseiATjTeklrgicU3ZiLXtX5ohRu66shrP5ws2arqX4SFaVU4lAj7DIoYg+NQfEIW1XNgJa4/XcjHMS30fP3HXVElF5QiN2LX+zMjIphtpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KbX0M9zC; arc=fail smtp.client-ip=52.101.56.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KbX0M9zC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qrse0EzxL/++igW3u/ozTywoxSd3oPXGmPkTYF9N1V0tXaoZsOhrcAJyhgqzEk4pcPnRhWoToSGbuhkREu2ZL05g2tICOiJI/NVNxp4c7BpmECyalEQ+QNZSkJbYSV5Frx08e/J12dUToFCdaqESNBvZ85IW7QLEG4RlisU2Pi7KY0vgTkEExlbW711jqWyDLVtRsfc1IO1vA72Svmr3YGzzsLXcrr4CW1E8C5jkSoJFh0xRSJJLkj/O81VOqEcb+7UWYMCnxyI3QVCjsB96sGlZNCCkFK90RFpUSctSoKXN5+NImUW8QGo4LGOLkJi3lfD9anhc9e/j2vVHqNU4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIQCkJH7c3BTOw5spVsK0bkrg53xlopSQyW5tpPcPKw=;
 b=yk+rubT+3rDPmIIohvwEoDWUPThAXciBJypSxVaqzpearmu2qCmnakhTetZH+6o7GZ8C3wkxYNzRZb0un5iS4Me834FIo7JHs7HURvx3NLaNxfyPq41XhnzHIoBGxITM8GE/0dl/iCzM5HPi5luvjvL9nwdRYtuP0c8UlrCrEWbRDESlVB/rJNQ8c+JMk2CjtRGZo2AaID2haXC8K2R7PgAdgFVriCv1wGtTWKb2yMIinLjtiSgIRZz0Mb0ZbLk3w6/HBR6VRE3wMxnnnBQmufwZ3kAEAaUAEBuJnzWeYfl3f1fo5AwSMtpHywDyi5a2LdhYPkrRy+uRORtEFSWGhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIQCkJH7c3BTOw5spVsK0bkrg53xlopSQyW5tpPcPKw=;
 b=KbX0M9zCEKK3j7Iddfu6+7IDFjh9WuRj5KmejLqj9E8/8Y3ojJ0SLAxB7gkKfwQ+lOjnv0xkazJ3eamrpZNfu5WkdRLG54i4WR0e2ANi37PI4FpjxoKu8/KdX9sHnGwmDcjl4WFdePuoSRu9eUcSUhtwZjmwfdcJotynp+pkuC9qJ+qFxRVP/mlqs20zfXDRkvTusm1GhhUoVTvNFt8kZRJL7jfPCcRe+ESs/EuRPgwOuqTSYAwupWfqmafYdDKtSxs7ah7sjIhrwVGqJCbYOnf1EmnI8zXTHL5Ez0Wp99PPlmWmxM4BlOx2Fdbi6XftRtkleziIBk7sc0MLx5zh2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 03:52:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 03:52:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 12:52:47 +0900
Message-Id: <DHV4IW8AJXX6.2MC07G4QO0TCK@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 5/6] gpu: nova-core: skip the IFR header if present
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260416233117.1057427-1-ttabi@nvidia.com>
 <20260416233117.1057427-6-ttabi@nvidia.com>
In-Reply-To: <20260416233117.1057427-6-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ea1e93-9281-486b-839d-08de9c34cc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/bI8ClYeKvFjFeKcN5AbloUhJlL+H5FDpE6jx9eWhBD17gf2BDhCvevSYRDRfIJe8nBA1XKN5wKDskGD7YLnGvOSrKZzX5xel8jX71UAaVSmy7GhdejOVDiUAAREZ0qqzP14yTR7h3BdoL86tOIp+/QObuDs3ZQmx3x3/MeNicmXyIywZiHxfVB7BNfeupLddlKcnjYg4HAPZvDFiOW0uLVXvSGkJP9mXu0lPIwlNUumKLmO39cEkVoDbHBf/XDdbwAjZlG7lGKeFIC7hYC3Qv4BQ9/qkWM6rZstsAfgbc6clfcEouc/IwhrTspyrMxigz1E6e6fQVBINo8NfrzbN2omK9aEETy/UT3iWpThBaYaZkzHPmveRhWEijrr81Uirr/ZxX/xX/Ltq17DhxlmAqJtTSV0yzIZ60AH88rZXJ/zeGjuD/G2c+LrKnXv59cwbHhbwe1Z+gBhJPRBJcH9UJWMqH2wuV/McH1981fyssH0oolh6O5HBVj7pbfLPQzI7mr9pahv2MsMRMpeJqsuxJiahaNAkCiHXvPFHOGFBg71a8MvfSKSig65TJLF/LynEQ1+3sJKkloX8okwjX2pm+Hn3Ou/LdbR+nUUMbvB5a+WY0d0jDQXBuZ/kzWYG3rSsNXI3gd//9hTnM08ToKmwzb+Ob29DhgMXSrJp8woWecg6h6rcx7FpOdFabmaGlwEX4ERmNHH1IKJcJQjDqED0qMsS7nxhbsQbcUK7zgVTEk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlBlaXdKVjB4U3gxeWtKVHA5MFRvT1NtVzFTVjdRVWdKNU9lOEtIZmZ1bWJI?=
 =?utf-8?B?Rkp0bUFCS2hQRlNpRGF2a3Vzb1ZUdVErdm9qaHhNYk5YSmZKd1FzeXVGZExr?=
 =?utf-8?B?SkNqTjdQTTcyYkF6Q1orRlhiUjFGZS80K2JkdnV4djJQWGpySUdNODRiZis3?=
 =?utf-8?B?K0xkdk5EUWtkckM2Y1FwdW9VOHBMamZiaGRTaVpQaE56NXhIL0tBZFVrRWwv?=
 =?utf-8?B?T3R2bk5Ram1zbjN5b3o4aUoxbEVUTkVjQk1SMHd0Yk5wTkxwNFkwTEF2M25K?=
 =?utf-8?B?d01kbjFGK3FIOXZwQ29aWGtBL2Y5ZjVqSnNLSTBtZVBwMlZyWXhHRGdKdmxE?=
 =?utf-8?B?d2Jjd3hLSy9JVFgyNnRxSzV5T1AwNXpWQzQxK28zbEsyT21Hbnl1MnFkclVB?=
 =?utf-8?B?MVlVZ3VYWktPSnptSmk1bmY0U3RZMDV3dTdnTVNLcXJlQk95OWxRTHRwSkJF?=
 =?utf-8?B?ZEFNMy9ScC9TT0ZhZVlxMWJZanQ1VmcyRkJvUXR6TWw4azRTc1RiMGpLa3FY?=
 =?utf-8?B?MkFBZXJTbWV6TjRNY0E3ajJUSmhlZklXTU5adXlTOFJUcHhERWhQVkU5dW1V?=
 =?utf-8?B?OEs5dnNNTlZqb2V1eGJVRUl6cHR4OXpLajVYQjVKZkFGWE9XQktKUHE1c2Er?=
 =?utf-8?B?WWpiNnVWamxnbW05TTh5cWhVWGEzMjdib3NkVlBScTltdG9WcktDN00vb2VJ?=
 =?utf-8?B?cG15SkFHa0JNd2VqQUhlTkJjRi8zakpDNHZHNitmbU5PczRDeWJWNWJvVmto?=
 =?utf-8?B?Wmc5WU8wbG1Dam5kUUpnZUx0N0NTU1QxOU1CbVRPYzNkc1dLMGY2N2xjays0?=
 =?utf-8?B?TjQzbmJBU2lZcmIvaUx4UUtTZkd2MHd2eGlUTHI1V2c5VUthNDJ2T0dscEFm?=
 =?utf-8?B?VGx6YjVuc0lDbHJZR01VOWtWdFNTQUxCVFE0VHJ0NFNwZ01WZXFrQUFVVnBJ?=
 =?utf-8?B?VWkrM3UzUGVsRDVCYjNibDcycUJCRnltTVNVWU5IWVJldXJCVkZsNXltd2xS?=
 =?utf-8?B?YUlVd3YwZG9jY05PQmdkL081VFdRLzZSdkVzS2RSSTJWQ0ttWnJtNHYvK2Vq?=
 =?utf-8?B?MUpNS0JVa2Q1Y0dpcXEzQitKQ2lpVWdDODVucWQ1dS9nVlJGRE1mKy9CRkRR?=
 =?utf-8?B?czlpYUxFdUVoaXNZbnpNMHI4WFg4NTQ2WE4xK3V0Sjl6UWg1Ym5Xd1dqSXNv?=
 =?utf-8?B?eDI4ZGRad0g4MFBYL3VNcFl5MFcwT0VXVEpvcjNwZTJqREtSa0lQTjZ4R1pv?=
 =?utf-8?B?WHZLeTA0NUxwbHE2NGh5RVRWcU1kdkxpSTlpc0ZjY2d1U0JFK1dieUEySzUx?=
 =?utf-8?B?VmJER2FBc05IbndLVWJYdGVzSlgxd1BPb2JWTHRNUytsbWh4RUFJaGJrSWZw?=
 =?utf-8?B?V1BRa2pMdWZpQmo4a1h6R0NCaFFQWHZINGJTSG9mcjdBaExudDBZTnFyTDFY?=
 =?utf-8?B?QjIvRTMzN0JlT2RmTVo1QmRXenBtTURZUzFycHozbm9Zc3pqeDBNaWIzN21R?=
 =?utf-8?B?SmJxOXVpQ1MzN2FFN2tXRzZHTWJYZ1YxaWpTYmN1TncrQmFFUHBFRmVJNkhq?=
 =?utf-8?B?YmE1Q0xKdzhtTHAxdnN3bmZqRmdjV2E4TUlRL201TVNvWmRnTGJHT2pHVEtk?=
 =?utf-8?B?clFCYTAyVm02UU84WUVMM0Q0aW5pcEFOWkdlVXd5N1ljV1VONzdXdUFPNldE?=
 =?utf-8?B?SnBPNXNILzhHR3JCck90eWR1SitiTHdTS0k1UnBYUXhFZWdVbkFYSFZJU1VZ?=
 =?utf-8?B?NGllY1FBTjBlY1dCekZxOEFPWDdmNjN5S1FHRm43Y1VkUmNOZjRSYVkvRHZv?=
 =?utf-8?B?ay9CYjArNGFwdjhOa2hJMDNCRXNmWUViMkNjSFp0cXRaNERmSCs4ZGhyazlp?=
 =?utf-8?B?cXhWdGdHN21EYjBPQmhOTFBmWlFCK2xiZ1VEMlgyeDNSTTJ4NmpGYkd6TGRj?=
 =?utf-8?B?eHhTQzJvU2lYcE1Bc1BueVN4cXFya1NJYk43VUZ2NG53dHNYcHV4VDlzdFY1?=
 =?utf-8?B?bVhSaUFNczdSRWFBRkppUkc3OFNEVWpWYWxaQU8zNFQ0c1g5ZnBtQytPbW5L?=
 =?utf-8?B?ckdUblJXSFYvSEZZS0gvRUxxK3NKbmMvV1VWdWxaZ0FyV0ZrSEl0b3Bnbk1M?=
 =?utf-8?B?MnpiaE5uL1laWDZpV1orWHNqcE5UZDRYNTFvelNIQk5FZC9BV015Wm1iRGUy?=
 =?utf-8?B?Rm5RM1Z1SVdHKzFhNnJTTkRCV2NvWS9PWUM0cGFqanUxaDA3SDVsaU1mU0xP?=
 =?utf-8?B?Z1dXdWFCTHIrMVg2bVpEdUo0V1FUejlmVnE2a1RhTVMrMmQ2UXN6N0JLcXpo?=
 =?utf-8?B?WHJKamVSMThJcnZvaS9Na3pTaEFqOHZ2SnlKcktEUFF6SE5BVThaUnh2VXh0?=
 =?utf-8?Q?4DF+qqGWLAvy83iBDywG1uvJgeH7CQZZj/PIUJPvGAMoB?=
X-MS-Exchange-AntiSpam-MessageData-1: rcSb8YQmiSwu5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ea1e93-9281-486b-839d-08de9c34cc00
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:52:51.0864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O59qZKkJbA39bLv5DRLnE3YeDHV9SMjbqC25d33V9IcfZKoQtYZC2igdEY8aiw8JUfAom6uENOj2np5pF44nEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844

On Fri Apr 17, 2026 at 8:31 AM JST, Timur Tabi wrote:
> The GPU's ROM may begin with an Init-from-ROM (IFR) header that precedes
> the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
> method must parse this header to determine the offset where the PCI ROM
> images actually begin, and adjust all subsequent reads accordingly.
>
> On most GPUs this is not needed because the IFR microcode has already
> applied the ROM offset so that PROM reads transparently skip the header.
> On GA100, for whatever reason, the IFR offset is not applied to PROM
> reads.  Therefore, the search for the PCI expansion must skip the IFR
> header, if found.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/regs.rs  | 21 ++++++++++++
>  drivers/gpu/nova-core/vbios.rs | 60 +++++++++++++++++++++++++++++++++-
>  2 files changed, 80 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 2f171a4ff9ba..0880d52e4527 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs

Can you add the definitions in `vbios.rs`? They are not used outside of
that module, and are not exactly registers like the other definitions of
`regs.rs`.

Placing them under the `ga100` module also sounds like they are
exclusive to GA100, which is not the case as the vbios code reads them
unconditionally.

> @@ -537,4 +537,25 @@ pub(crate) mod ga100 {
>              0:0     display_disabled =3D> bool;
>          }
>      }
> +
> +    // IFR Header in VBIOS
> +
> +    register! {
> +        pub(crate) NV_PBUS_IFR_FMT_FIXED0(u32) @ 0x300000 {
> +            31:0    signature;
> +        }
> +    }
> +
> +    register! {
> +        pub(crate) NV_PBUS_IFR_FMT_FIXED1(u32) @ 0x300004 {
> +            30:16   fixed_data_size;
> +            15:8    version =3D> u8;
> +        }
> +    }
> +
> +    register! {
> +        pub(crate) NV_PBUS_IFR_FMT_FIXED2(u32) @ 0x300008 {
> +            19:0 total_data_size;
> +        }
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index e726594eb130..7ebe58020533 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -25,6 +25,7 @@
>          FalconUCodeDescV3, //
>      },
>      num::FromSafeCast,
> +    regs::ga100, //
>  };
> =20
>  /// The offset of the VBIOS ROM in the BAR0 space.
> @@ -89,13 +90,70 @@ struct VbiosIterator<'a> {
>      last_found: bool,
>  }
> =20
> +/// IFR signature: ASCII "NVGI" as a little-endian u32.
> +const NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE: u32 =3D 0x4947564E;

You can use=20

    const NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE: u32 =3D u32::from_le_byte=
s(*b"NVGI");

To make the signature explicit in the code (and simplify the doccomment
a bit).

> +/// ROM directory signature: ASCII "RFRD" as a little-endian u32.
> +const NV_ROM_DIRECTORY_IDENTIFIER: u32 =3D 0x44524652;

Same here.

> +/// Offset of the NV_PMGR_ROM_ADDR_OFFSET register in IFR Extended secti=
on
> +const IFR_SW_EXT_ROM_ADDR_OFFSET: usize =3D 4;
> +/// Size of Redundant Firmware Flash Status section
> +const RFW_FLASH_STATUS_SIZE: usize =3D 4096;

`SZ_4K`?

Also can you move these constants into the `current_offset` method, as
they are not used outside of it?

> +
> +/// Return the byte offset where the PCI Expansion ROM images begin in t=
he GPU's ROM.
> +///
> +/// The GPU's ROM may begin with an Init-from-ROM (IFR) header that prec=
edes
> +/// the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
> +/// method must parse this header to determine the offset where the PCI =
ROM
> +/// images actually begin, and adjust all subsequent reads accordingly.
> +///
> +/// On most GPUs this is not needed because the IFR microcode has alread=
y
> +/// applied the ROM offset so that PROM reads transparently skip the hea=
der.
> +/// On GA100, for whatever reason, the IFR offset is not applied to PROM
> +/// reads.  Therefore, the search for the PCI expansion must skip the IF=
R
> +/// header, if found.
> +fn current_offset(dev: &device::Device, bar0: &Bar0) -> Result<usize> {

The doccomment is very informative. The function name... not so much. :)
Something like `vbios_rom_offset` maybe?

Also style nit: s/whatever/some

> +    let signature =3D bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED0).signature=
();
> +
> +    if signature =3D=3D NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE {
> +        let fixed1 =3D bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED1);
> +
> +        match fixed1.version() {
> +            1 | 2 =3D> {
> +                let fixed_data_size =3D usize::from(fixed1.fixed_data_si=
ze());
> +                let pmgr_rom_addr_offset =3D fixed_data_size + IFR_SW_EX=
T_ROM_ADDR_OFFSET;
> +                bar0.try_read32(ROM_OFFSET + pmgr_rom_addr_offset)
> +                    .map(|v| v as usize)

.map(usize::from_safe_cast)

Each `as` should normally come with its own justifying comment, so
better use the infallible converters we introduced.

> +            }
> +            3 =3D> {
> +                let fixed2 =3D bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED2);
> +                let total_data_size =3D usize::from(fixed2.total_data_si=
ze());
> +                let dir_offset =3D
> +                    bar0.try_read32(ROM_OFFSET + total_data_size)? as us=
ize + RFW_FLASH_STATUS_SIZE;

usize::from_safe_cast(bar0.try_read32(ROM_OFFSET + total_data_size)?) + RFW=
_FLASH_STATUS_SIZE;

(or feel free to use an intermediate value if that doesn't read well)

> +                let dir_sig =3D bar0.try_read32(ROM_OFFSET + dir_offset)=
?;
> +                if dir_sig !=3D NV_ROM_DIRECTORY_IDENTIFIER {
> +                    dev_err!(dev, "could not find IFR ROM directory\n");
> +                    return Err(EINVAL);
> +                }
> +                bar0.try_read32(ROM_OFFSET + dir_offset + 8)

Where does this `8` come from? This should be a constant at the very least.

> +                    .map(|v| v as usize)

.map(usize::from_safe_cast)

With these fixed I expect v5 to be in a mergeable state.
