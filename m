Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6797F349AF5;
	Tue, 10 Mar 2026 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141708; cv=fail; b=D6WD8xa/BCZCtOIpmUR6+/BNoRfThHHs1fQv8MqsLc4YbHpEqUcefaKeWblThUaMCr3ow65vK77CpZk07CXfXrCIL7hOxg635pVpKsc6WZgi0MkgbczTzd9SK8b5A2VS1czMrLOFFes1McGBV1ZrQyZ2/YwP0LljBm+6XM2dY5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141708; c=relaxed/simple;
	bh=nOzQsFiZPZab/XpJfWRrNN2TqoxCiA8ouKFuPGhKW0M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Hj6iuCEVTaSvZlPngFjrQsLOpl5YxYIiAm8YAgTc8LnDFSbyeabyYRSg7Y4izkFgFfA0Qb+Eqqqz19+aC+iiBmY6Mzj5f9VXVtTDARsC1M1lfqvo/Shr//4ajXStDTbPWLZJSrlm3gRx1nI1Mu4i67QJKw4b0Lm7E0cQ57piJto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T6UmN0Z/; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T6UmN0Z/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTu6GM5sE2DPhl3Fsj5gXIOGdf/ZTBjf9ZGuLlC8YJjHwNUaURs8Ntto2KZN20IWFa72cTZIOARiS+ym1Pwm44C/wHFx8ucN8ZMB84PBytWa8D8yX/K5SEjHyVS4tKeva27v2e5DedPI7bON4E+FDkp8j4vxgewIRlhTQ4caBQ339j8uL/lVwJnUk5XMME+p5KjNwsZbEtC2UyQTFQi7qn31K/PjGJ5l0xICfAl0DfIu9IoV4RiAwR4PT16btLUZcQX5T2jo0ZOTBZg5AHOeCJXpTI/UsrEHUpw0R8dER9D+5AEIJiy4i6pFs4JYUF07Z9cuwx9VFZNNXSYvvOFLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFu1q7q+JJMGhY2x7chXYhZaFsuusPsHbKBANHzBYxY=;
 b=NGyOzRf39FmvsGKc698E+yN5uMvMQdYU/bvcg06YvioLHDwK8RNcf8vvNb8FoZLOPYLPUNO08mShUs0hVvb+bUEUT0zYo1dgYVgVWGomSh/MbyVsI2BJOLcR2i1sCJKc11OSO24MVA7q6yASc8+7tdLfCxmxq5tpHvUQyOyiX0zirGBjNJS+QrtSdnVF3pflmgfHySN2XcDOtPvoaiZFtJfIFYj0HfhKUnapIUGv9yA6Mbz9SpBNG97LqD74o/trAhRKw9Sp6xQF1hyG9hKph+8dNJB5FjhvMpp62XvmbjBcGjBWIiAqwYgpcdtRwxE/o97+l63BEFoXP3RBer04+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFu1q7q+JJMGhY2x7chXYhZaFsuusPsHbKBANHzBYxY=;
 b=T6UmN0Z/LexMK3giup43KE5O+7XKhm/YNoiAAbrqgTph5jD7xybIsDat+MlAZ3yyoC5WwaxmXKkbIzDxIHez1r6Zqck+OIsz+C0Pc04g9KyNzLISVzvTVFcVSGpEnIGdfqtB083YJaIhsC2l6Zg9sFGZUfk5cwyfnjBSnH+SfsrEuDvhqxxTOEZzhrjipXiFMET9JhCs14b5Cqw6gSvf5PvwGJXAz4nlrOSQYcZEYijznD7tE4GXQOVntQqZ37ZLcfoi60WVUdhng5gMKwB/3k5fHf0MpH2kQ80V/W5eaU982p9R4W9q5SjJrS1v9GkoAIN6zVZILCsJkpFBxG+G+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 11:21:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 11:21:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 20:21:40 +0900
Message-Id: <DGZ29W62U8TL.2UTVY3Z9DU024@nvidia.com>
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
Subject: Re: [PATCH v6 01/34] gpu: nova-core: print FB sizes, along with
 ranges
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-2-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0367.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bf320a-a1dd-4231-4555-08de7e9735eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	VpOXMS6deuP3Xety2PUhFLEM61ch9GNKAYg5Cz/WwmvgbH8+i3kh9urbOZDfEyHfDMxgfvy7fRiXQkTSQXaXrBa6HCvEYWL1p3pmCZdlSiNrETY0sBQ+Mp1X4W2c4La6tynjJqO3igE5RNMCS/oIhUVQCLZ8mGx//NbMKad6vBZb3jJjQuNYa2cSKdoaDgn9jK5shvvHh9nNJ8vzk3iCPcg4sznUJ0muKpDiFUbHR8l2nl73xi6M9D8lYTqYcG4sfnf5Xkfy7qtcQXnK3RIEYK5ickl0sWQDKOJ2EMtkhT+asOFck3lxp1CclddNaKE782oL5yfRVecNBM3nM/TLTpcnrUFXojcWbpYpR5vJxfvgkEm6goewkYPlchU6m1CAaUOXPx+XzYw3eAqHLP9Tykbr6UNMIeBtx3SLf9Cjd0Fiyf+7z3kHUACtTDN7jQ6tdp+gDDUqB1rDUY9f7EsbN4+q3osiKyLJVYY3YkGIo81RfNtcPi5Vj+DHZBY4+IqgyLwIW8POY+iysX2IbzhxyPm3LuiLROMZrZ9wA2cLXj+1gJtAk1oV3Jw111R2xGw+yYYwZtjagafGz95t4GRzKbKf4Gdd7srzxwM45CFEHO2da8YzAFxVDelERx3P0fQikSxLaQ2KpVtI66nmSCxMW4fKmidP6b8fOS5IMrZjTd/SPMoJv26jHnfmPUMcTb6DYhUNnzEUBUhcoUVUh4yMoNnfIteiwQ5ZZKzd5IvFW5c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzhnRXM4S3k1SjBCR2tFM1ZGS29rY2NNNldOYmczcmk2RFBUcVFldFJVbFFm?=
 =?utf-8?B?YktPMnFUSWpKYW0vcVVjdEsvRXZINHRFSzU3UG53TnFJVzlQbUNzbzY4Szg0?=
 =?utf-8?B?NUZQcS9ZMDdqMGs3dHZnQVpyYkRYVmFRYUdIb0N0WXpkc3BDZ0F6c1lGamxP?=
 =?utf-8?B?Tmppdm51Q0lVSmcwR01TRjN3bmlIamRwd0dLdk53R1BSdVNPUHBnaWRyY0V6?=
 =?utf-8?B?dWtLRFFCZEYrQlFaT0Q5MkEySFFkVXg4Y0tHOWt6RE50VEdmVDRzRlNqdkIx?=
 =?utf-8?B?akgzdm9kdEhhZnhobU9xT2Fib0p3UlVJZHVTS3FjUW8ySTJxV011d0ozbnhO?=
 =?utf-8?B?eHAwdTdBSVBlREpLRjNOVEozSWp1cytSN3UrNmVQNnNSRXRXd0U4NURHc1E3?=
 =?utf-8?B?cDEzTXlrU1B3TWgyVFZIVU10UXpvcWtNR3UxK3V4SFVxbGUyQjk1ZDkyNjhx?=
 =?utf-8?B?RHdHbjNzdFgvSUpsZ29FOFJpUGVtbDZXWnVSVVlJWjdYYlNCMCsvUjY2bnFW?=
 =?utf-8?B?NTFnb3JiMmNrZDNtSnZkMjVwVmszSnFSSHhwOThGaXJ2Yks0UDlRa0JsaGYv?=
 =?utf-8?B?RXFXejV6cVB1bkZJT2hCNVBCeTBqaCt6ZnA5MzlWT2ZjSHhzOElXZDhrT1E0?=
 =?utf-8?B?YXBKaUpuYVFMWGROalNJMUE3Wk9Jd25hOVFJc2FYQ3A4SUlHNEphZ080dGVY?=
 =?utf-8?B?RWFSU2p5YmJTa1pCUVhjazJ3bzdQMWtFOFY4MkJDWE5obStQeHRpaExZSkNE?=
 =?utf-8?B?Ry96YXZibzNqU1JWTjRYMkc5U0dyVWlQaEpQYmFTQ3FqdElOcUltV2dhZ3Z6?=
 =?utf-8?B?WWtLeFdCaS9hMzFUQkM1c2FnUEdMT09ETWdnS21jVlhkbGk1a3g0RmVieGlU?=
 =?utf-8?B?cmd1Qy9kbVI4b2NUUGJNKy9HcFl2ZXpQRGc4UkM4SWs4WXVpYmhiWjZoenUv?=
 =?utf-8?B?d2RZZkc3eWxBQ1B2ZG9GVG5zbGtqL3JUeHU3eC9hL1hDVjMzbWhDS2tVSjls?=
 =?utf-8?B?eThBRGJtYVBUbzhrT0dKTG1tcWNLZVhRUUgySUs3TUw3d1FhTWNlMEs5aUdN?=
 =?utf-8?B?TlNOUDVzQ0hKczFuVVJ3ZU1wYTRWZUZJMzNYSEJaUURBVURJZlArWkowcTJI?=
 =?utf-8?B?QncxeER0UHVlTDNGYnlyOFlJWlJUNEhKT2dkYkVvTUQzdE5GYmp3VWpJeFNE?=
 =?utf-8?B?cmsyL0hGZnhLWENub1BFd1VZZ0E4MHBVejRWcFduVzFFcjVqbnZJMDl4OXBK?=
 =?utf-8?B?U1g2UzRTLzRlY1dwRFpweStiUXVhMjhjSzJiUmY4T1dWZFhZQzYvRUdUVFZ2?=
 =?utf-8?B?aWZmQXlYTnBoQWd6UmlIRHBnRlVxYkJBV3VDMkRvcERvV3A5ZlBVbGViMFgz?=
 =?utf-8?B?Yk05WFdtRVNQV0VleDVGR1dkOHBDbG9icnBOT0h2QUxIVFVtNzVvenNON2RC?=
 =?utf-8?B?NS9NN2ZpODA0RGgvQUJGditEaWJjN0hPRVl2NzdFNjg3blFNSE1ncWRWMWVG?=
 =?utf-8?B?VHAyU2M2QzZpdTFLY29jbk1tT0kvNTZJWWlYbEVYaU1rODhSSktEMXhxazA5?=
 =?utf-8?B?SFRzeGE3SXRLU1RxenJSK0N4Mk4zWGk2d0U4QlBOcDNFM2JXeFpzOXU2Q2dW?=
 =?utf-8?B?MVdDYythMFRjQklxZzFGM0lvUExoSE05U0NyaS9wdjZqWXJQNDJmV1VKSitS?=
 =?utf-8?B?dHhkUVp0TDNlcXhiaGRSaXVvQUJBNjlOOVNQWERPTkpFaU1MdVg3TktUNFZO?=
 =?utf-8?B?NEhYQjJXWWJlVVR1WnBOQ3ljWFYvc29KSkRRWGxwai9HRnJjYktMMXJkcjQy?=
 =?utf-8?B?WTU2MEExY1VWcWFVUEVzbHpmTlFzUnByL1RmcFpJRnJLaGhjS3hFMzdJR1ZX?=
 =?utf-8?B?UHREUlNIb2ROZHp2aG5YbENuMEZWN0hyazZoaStBSmtJdFVEYllwNjBUb05F?=
 =?utf-8?B?MzdpblFQUHlnMWI2V1NUK0g2c3N6QW1YZ1JqZWdZQmZjMGRPSThUWlN6cm11?=
 =?utf-8?B?WHdkcG42ZlI0cStrMWFnc0RDZjNRTGZkRmh1TXhjVVRBdncxbUwzVVpHUHo2?=
 =?utf-8?B?eVRxMkJQVjZsUksxZ0dQRDZmMGgxSGlzeEU0cllMWldpMm15UVFvbzgrYzJB?=
 =?utf-8?B?dTZvVFRzdzJGWk5FQkcybjlOcWIrR2VxcXhMQXFHR2t2VzN2VU1pMFA3TnFu?=
 =?utf-8?B?VHhVb1F5bmJyenZGeFZoVVZ5eVNCS29iVktNNGhXU3RpdGJId2dDTEdXU0pH?=
 =?utf-8?B?bmJCRWRpK09RWjNnUW5VMTlHYzJ0L0sxZURKak9PNzY5QWFYTjFzTitBU3FT?=
 =?utf-8?B?RTlzWEhpWU1LWXI1TDk2WTJGcm0rU1VMM3lXVGxKaGg0c0U3K0NwQmkrUG5m?=
 =?utf-8?Q?mtuGqrbSWTS2gi/ITxz3fmLrrDXcOTumq2+A4Qb+PQBkN?=
X-MS-Exchange-AntiSpam-MessageData-1: px9gLQrzX6+RKA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bf320a-a1dd-4231-4555-08de7e9735eb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:21:44.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GEW/TjmtEQFV+rzKZdYEo3mGW5ImhhUxpXzc/PS7JK2k1MBh970XYIU8BxGZDCtakP0qVpsKv5DE2wlu9S7QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143

On Tue Mar 10, 2026 at 11:10 AM JST, John Hubbard wrote:
> For convenience of the reader: now you can directly see the sizes of
> each range. It is surprising just how much this helps.
>
> Sample output (using an Ampere GA104):
>
> NovaCore 0000:e1:00.0: FbLayout {
>     fb: 0x0..0x3ff800000 (16376 MiB),
>     vga_workspace: 0x3ff700000..0x3ff800000 (1 MiB),
>     frts: 0x3ff600000..0x3ff700000 (1 MiB),
>     boot: 0x3ff5fa000..0x3ff600000 (24 KiB),
>     elf: 0x3fb960000..0x3ff5f9000 (60 MiB),
>     wpr2_heap: 0x3f3900000..0x3fb900000 (128 MiB),
>     wpr2: 0x3f3800000..0x3ff700000 (191 MiB),
>     heap: 0x3f3700000..0x3f3800000 (1 MiB),
>     vf_partition_count: 0x0,
> }
>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

This one has been around for a while. Applied to drm-rust-next.
