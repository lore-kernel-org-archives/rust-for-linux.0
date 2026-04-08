Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAED35E959;
	Wed,  8 Apr 2026 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775613138; cv=fail; b=Qnb1LArbGRCk7ACRgPCdQhDLMSF5V5loXTGwa6+kJQgfL1ufynM68I9BsOb0SnuYWCWFSmxIuln9KtfQ09QFSk1r2K45BjKGNpB/Iq3IZNEAUlgn1KOBDdbs/IbBdSO6lRxcm2Wv/RR4hAfNB5HCZX1YzxNVy4oQitEZgajCuNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775613138; c=relaxed/simple;
	bh=2BzbDmQ2gPHDY5YDC/6DHbFHgjIiP6jO7AFhCoEu9jU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rBpqI1ca/U+mNubNRUjk0ca69Pss2Jdc89iQA3VOUcVYpldK/S1Fv7FLz9Vb4T4Qb1wG5k3SG3fNJeYxhNxL7zkjNV+LSdJnf2395B0/06LBY4IKBcz5hjn6N4WkEk9XbSxN50UXon1RrTKusYEmquHE3tE+OF/VzeOQ3dQFF3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oqTAxn2M; arc=fail smtp.client-ip=52.101.48.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oqTAxn2M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DE2nKkfbbmxVcvAsz23RHsZWuXCS4N8w352IxT4L7OGieitAvlkrqd8skQjYTW5kare3101xfrmLTuZuxK+xu7C8fFI5fKDPN8Q2ezFWvbB7gR1txEXwIhZRMgiBO99SZbnqGzk2X9QalwPE1f3Cn4sFyK9zdsL97oWqr/8smxql66qYW21bwW1qYgaBrqjpCsYUBfRJWr0lXKVoXpObxxjtQYfqn8lF0f/cSdvb+tBbv759fQE9RFXjW/TZ5b4+gNrwkwu0SvBjS7k5ENHoO0xj1LAjmUkCvHbYjToos8PXk6lAENOPJd4vXw27IgOyj3GX1PdrpW8NU+DNKN5TdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mn+CLNXNOWOcDKUCekUVjstyrDBEYJfdXK+KOjOBVVI=;
 b=CNt+CHMNUBvjLtZDrr+/b2dIdFbJ7hcGUhTCmrecc6IA+1MzX0iJPcKYKFT0Wd99hTMKYeNCLJpegVq2UcW+jx25sVKe9BTnivZj2RF+U5ioSmz+5HFjAsjXvzjTjF8b9s1hk6ABU0qgR+qhkKuh4jYXMC9kxvDGwT2EXR5Hsjh/m8kZsXXZ4P1c36NW0AzQ3g82waSBX504uam77b8c+OjMt7NwqzzeF7l0FU1gNx/EGrqYPAVqXzRnwp2oe38iQ1CmWva4X/ERg/l93M2A0v79ndIKaQA3K+OrWEmrFJNl08UeqZoO119jChgQlR0u9hUrymJgvnjjiexLEQC+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn+CLNXNOWOcDKUCekUVjstyrDBEYJfdXK+KOjOBVVI=;
 b=oqTAxn2MqxZDAhm2Lj4gCHlSGBKmYLO6oLg1tm4l0Z/qKie4ARnNUtMnvr/bQ18qwd+EyXD1zc2pYDdYl2yfcmAQ4PoS9V6jICTc6wKgT3sALVYCtsyW9y+t49+h9oPqtQo+I81xjjzHFh1tNHVVjgnle/3TbV7M725UEpXwI5yxQn/HQ93svt/vBwb8bcjqtdAGxEg03cYPppyjX7G+QAxUomKIe1ZPYqgKQ/C9O0UvB+zbaxXNj4klOL0LjguHqtJJRscG0+rCk/eqkkUYiW6GBeB29mf9r3y46xXxXhRQnxIip2j6CjHH2aDMzDsTgX1ZKBx8wEaVknLqiekogQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 01:52:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 01:52:10 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 10:52:06 +0900
Message-Id: <DHNEBLL5OFJ5.1VYQN7NLHUS9H@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
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
Subject: Re: [PATCH v9 17/31] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-18-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-18-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e45f1d-b7fe-437b-87aa-08de9511729e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Myrqvk4NiqQa53HpQvMRjnzh8kKkK0XHwG+0FL1+MU9MuhWKZvIb5P7poR6XmX5hYvyi/R9Snx+haNvCp85qR354esH0cgI1OPDk01WWHxDthlEubXMzMWM9sRoD55i4Ldx1qBubvBceDb7j6JkO9BAlUjC3gTnn+2KV9YJL/RGp1pBFKi/Dp2IS/ArZhbjxruAisBr326N/X+UjKATKHhqu6gSrWQOtpN8eSqT5PEW+xsFrpsbTi5agfkFw8qcHb9gPI6MvFA2m5v/ghx0LmIIIdGZmKUFTBHKef/lzs4WHcX27D9o07kIDUgQF7e9rcqCHwPPDVn2z7ht2kbUm8/e+xz+SgKLRrO4UHh6N6pJGPIRcvN0YirVEWNiiZPFaxX4+l0dyj7mNgp/ZGVHlJPkX5cOCxvGGGPAsQG788ozmHKbaF3dSjqFs4snreUk+7f7r3nsyzngKTmxpqQo/5QcehH7g2dROJw46Yeb7JKOb4CtU+VrH5pcjnU+D1cyf1QXJHo6kE9LqxmHvfMKIjrPZt1qFKw9sq+6lSRPvghRCV9HG8SiBZVAO/k/5JtszxT8cqgziFhFyKfY2TMzupADF0OJCpq/okak0dRFwtCUb4p6Gmts0Da6dRRDq/BvxgL0KvcLgFgDtNwj9dVkr4j0U8d8X8CdlLpbq03ROQO8r+qM7DRPv2N+/ykw+UkqAVDD5eThMO5cWYZwUZngNFnj3RpHpdgWEkcYaJkASW4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1VNYTVvMW5oY0dTdWordlh6TGgxWmhDYVJ2M21oUEdwUVVKRDl6aUdLVGRr?=
 =?utf-8?B?SUxrMWlrLzhDTzAwdG13a1A5cXo5K3pJcDk2YnBkNUUwUFFwVW03NkhSNTdR?=
 =?utf-8?B?U0N4WkIzMmZKWFFycHptWW9PZHkyYmY4U0hGSFpObmE0NXQ3RFpIMnBUNmk3?=
 =?utf-8?B?Z3Z1TkRGMnFpT0w5S1dwbGZGTk9LMFhmWVQ1UjlnOE80RWpaSUlDa0ZIOXNY?=
 =?utf-8?B?Y1NtdG5GdWVrUkpoaGNaV3R5ejN5TWpVQ1Bmcy91K0tLQlphbXZEVDc0Zk9j?=
 =?utf-8?B?a3BrZmtFUnhEaEF0M21pUEduQUNFa1MvSjVyMDM2K3JMajBKZUgzVTdEUkVP?=
 =?utf-8?B?UGx1TXlweDZ4THNjbmNJWVp4c2QxOFJrZ0lOMFZWcHJTMklLY3gra1BzQ3Rh?=
 =?utf-8?B?VTdnZkR2bzdyYVFvZE5najZaenNHa29sZ2lFU0krZGZLNWVFZm13VUhzZ2pK?=
 =?utf-8?B?Z1ZLN0hjY3FBNEhOUVJ0R2NOdmQ0RjJxb3p2VWJ2UmV5QVRuUmxEMUdUZk1Z?=
 =?utf-8?B?a3REQ0grelY2QytWSXRya3cxZnFyTTR4a2t3d1UvYzVjUWVpOWgwMmNIQWV3?=
 =?utf-8?B?a1F0TlpvTmoxL2tJemp3MCtGbFpSWlRXWXVWTzJjNTJCK2FZUDJkcWMrYmtl?=
 =?utf-8?B?b3U2KzVGTFR2RkhlaHhZc2FkcUxYZXVoTFdDWmlKb1QxTWJ2WFRzWHZveUxM?=
 =?utf-8?B?bE1OYzYxQ21wVlZkeERlQmpXOUpjL1B0YVRVSkNaY3luSjE1a2VNNGc2dWUy?=
 =?utf-8?B?ZkpuTGhkM0w1M2VqdjFCUjE3ZFUwYm9EanJ1ZWluUXlFdHp0T3NvN0pYeXYy?=
 =?utf-8?B?ZlJ2RHhIV0tFdDZCMVFiVUZGd2paMVlPbzg3VGMyTTh3ZDc3UkFVbnZFSzZ2?=
 =?utf-8?B?dytaV3NJeFNJUnJxMXJQcDk1RHFPbkhVNzFTbDVZcGdzMWxHQ1ZDVjRsYWJV?=
 =?utf-8?B?akxVb295TndTZzFROGgyN2JublNRV0dJTytTT1d5U3JpR1dUTlN6WHBvcXNF?=
 =?utf-8?B?MHVrNTZld2lYei9rUUJQT2Q4eGJIVGtXajVqN1JLR1ljTXBUSzFsOU41UzBr?=
 =?utf-8?B?UGc3TE83Uk04RHJWbnZiWUE2V0EzWUxZUW9wSkZWbVBVcUlkcFdHT2VoTk5m?=
 =?utf-8?B?QWorb3ArNWh1eXlUb1dqdUFQQVJEK3VTeWlhWVdhWVZHa0g5VmxmbXppMnY1?=
 =?utf-8?B?OGdYSU9QeXd4dG1HYit2K01Kc0Noc2dRMWZ0WHVuRjJJNjFVem5mK0YrQTAy?=
 =?utf-8?B?K1lSWXYxT3Fva3A4MUtINlRsQkx0TmVxaUMvUHZMSnE2NGRycnVCSGFMWTE2?=
 =?utf-8?B?clJ0Vm1mbTIrTkFuTjg5bzFtZlRJVklkUkxOemw3MkNISTZjNXZNUEZtaHl2?=
 =?utf-8?B?Y3JoUzkwVkVEQmdGenBRTVFteklXWTVINVdHKys5YklNZ2o3WmV5dGpLTDBD?=
 =?utf-8?B?TXFhT1FiVkdoS0R5aFZFeHlETjdLN05XTURkcVozazUrTWMwSWo4bFNEaHBZ?=
 =?utf-8?B?dkJXNGR5NGxkMnFlYTU0eHFjTDMyT0Q3bFRIR0kxTG1scm9sZWVvaElNSVUx?=
 =?utf-8?B?OVdrY0VhY3N5OEszYjUvb3BxZzdYSER1UWdhVUNXUUQ4clZXQ2pla0l3Z2pZ?=
 =?utf-8?B?bFFuamxKUkRtRFFyV2JjQjVCY2wwVFIrN2ZhQ0NsTkMrdW9BdndBK0JLckJD?=
 =?utf-8?B?OGh1VzVPaHlzRDN6eU5uNXZWUk9jRE53WUs3enJJUXArRDlVZHBwM245ZWsv?=
 =?utf-8?B?ajcxZTNHT3VrK2RPcjlaeVhCNHQ4YWprRmxGSjBOczRCN0pITTVsNS9mcHFU?=
 =?utf-8?B?NDFHRGtMak5xY2c4L0gwbFBxWTRIeGNpL1dITGxWOWwwQUQyTU1DQU9KRGh6?=
 =?utf-8?B?M0FFWW5icWw0aHVYcXZIKytKdUhPTndVbklIcm1TZFZWa0N6ZFplMVBsUTJP?=
 =?utf-8?B?OWZpZWswN1NrZUcrekJETmJlcXZidHhreUtwVU5pajFOMFBiTldFcFMra0lR?=
 =?utf-8?B?aVNHQWQraGJEQ2kvWXo0cFJ3ZzlhUjJTam90V25mN3d6M0RxdDE5Ym5IcE03?=
 =?utf-8?B?MmtvYjNTMDVrQzA2MWNkN1lVSHBkekVUbW1qWjFCNnlIM2x4NHJZbk0rOVhV?=
 =?utf-8?B?dVphc1R1cWowYmlyd1pRTFR0SG9aaHR1RHB3ZTBWK0xDY213bTNCeGM5aUFk?=
 =?utf-8?B?ck1udjNrTmJSV1hkMWJ2QWpoVjJCN1NJMGc2R000L2RnL2k5SlJNZWQxa2o3?=
 =?utf-8?B?elA1V2liUU1BK0E5ZlBITkJKMStqYWdyd3JoQ1pNMmtIRDQydTNHdnhoM1lZ?=
 =?utf-8?B?NSszZTBrLzlkTEVrUHN5OEJMam90UmpUYTM5QVNLbHlKMThxRFdPRmFrb1dZ?=
 =?utf-8?Q?2lzOFJi+HStkHICANRqYZjt2mA4UMZL/OYSJc07wvCEDZ?=
X-MS-Exchange-AntiSpam-MessageData-1: cnxDVUCKL9clXA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e45f1d-b7fe-437b-87aa-08de9511729e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 01:52:10.7630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ua26EzcRnRNWZvBP6ZG2e5lhSjYjnqMYjbW857B1ZlLMbYllPJX3d6eRN/Inx0Eqnyx+wiqlaUtbHjpXEvJfXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
> Various "reserved" areas of FB (frame buffer: vidmem) have to be
> calculated, because the GSP booting process needs this information.
>
> PMU_RESERVED_SIZE is computed at compile time using const_align_up().
> The total reserved size is computed at runtime using Alignable::align_up
> because it depends on the heap layout.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Is this Blackwell-specific? Because it seems to be done unconditionally,
contrary to what the title says.

> ---
>  drivers/gpu/nova-core/fb.rs     | 8 ++++++++
>  drivers/gpu/nova-core/gsp/fw.rs | 6 +++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 6536d0035cb1..ffb996b918f8 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -10,6 +10,7 @@
>      fmt,
>      prelude::*,
>      ptr::{
> +        const_align_up,
>          Alignable,
>          Alignment, //
>      },
> @@ -270,3 +271,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_=
fw: &GspFirmware) -> Result<
>          })
>      }
>  }
> +
> +/// PMU reserved size, aligned to 128KB.
> +pub(crate) const PMU_RESERVED_SIZE: u32 =3D
> +    match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128=
K>()) {
> +        Some(v) =3D> v as u32,
> +        None =3D> panic!("PMU_RESERVED_SIZE: alignment overflow"),
> +    };

I had hoped we could use `unwrap()`, but it is only stable in a const
block from 1.83. Maybe we can revisit once is MSRV is bumped.

Meanwhile, we can replace  the `as u32` with `usize_into_u32` from
Nova's `num` module.
