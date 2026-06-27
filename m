Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42C17D6;
	Sat, 27 Jun 2026 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782548720; cv=fail; b=qqbifzVy6R/9V/V4FCfGG+DfPVoVwOAfsZXBfiH5QAyL4VcSDhtYKjZ6aGQQqmC+jJS5dMhyo3+JyqE4s+blRIuz1N2I85JMwhtmMbPfgU4XiDZBhXQ/Oympp1/VNifFblp1A5stz+4Of5VjisID1bqSl+Q/FUsABpIXjHxB4vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782548720; c=relaxed/simple;
	bh=dhwJ69csyHcF0vRh0hz76XNOa7wezsGaBkYzFY0DuKA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lZDGm67kGuR2wDz6LOqV0drz98oTQom4ZGCEvlvW1oHQ/hOYWJPK7wdoczon3tIOFphIEtGVZ16xMsRMNER7PGlwSco1fyKQiltqt+5cgOC7HX1Kh+C0+lUI++qRk8ZRFHMlhWWweq7eCL4WFzDnYPofBVy8qJ7VGsiuKVN8ycQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mKt2LFlc; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mKt2LFlc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4I54e2X2EdNER48mM3zfjRt1Y3c5gNNBMcY1W8DXbutqXnRYMqk93lDU9fNylJAy7EQdoj4LW2j5r2W7oaltYAd61EUMAJoy7xeuIPSBwwizBw7JEEpRx2kTqA/TOMmMupGSGgR1USoicxqUuzO5gtVGNX7L17fZik0dHmzLHx+bJZACyuN7M3lm/O9MCa6khJ42Y1iUiKJ+prK5FAETgPDJ4yaY/FMPvEVrqXxATut69qOURjbyjW+Bh/jgImR4xdy7YqLLVRIHaxcLtoB6vWUzOPLp361enim8428egSnJD+nHg7hcxtpfHjtIQ6ltBMjSf6HfEubI/e3hPL1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhwJ69csyHcF0vRh0hz76XNOa7wezsGaBkYzFY0DuKA=;
 b=VUqSOeUC1SpVvsgGhcitwBoPYNmnU8QNn4zvyQa5C3ZscVgSAIQU17UhJ5agH1iFOEebObuOW8tiZ6rPHG5Ryk0uQlYDc9nIjt8YNK8z0IsOCbnG7zweFGeIiVGbTvFPvUYEJFIuXUrUoxxfthaz9+DUmmmNzEjv3xvncdcTAEePrDjopE5t5J/CD8e3obn+Oo/QBojT/JYqunFkeoF/3OzEWCSKDmbR9RKs66oorSFKzH7f0Esh3dlBo94+QjCC65F7UOsD6HInmk4sFHPHOzLAhOBYPJw05RP3lh/DEe7duKBovcFG4FuywKDT8uTokyQvVwKKdCUte/lrrAbTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhwJ69csyHcF0vRh0hz76XNOa7wezsGaBkYzFY0DuKA=;
 b=mKt2LFlcqURzSuudxn+KTSWtd7F2PTRZnHjQhA0L80yXH/rzW0cLJ6jg06XwSmGQlZ25wW8LxuIPz3PBEG+1mq5hF+mO9I+cHwU7+B2yjbfJI7MRR20LyWYewHpqYtQMCrdPm2ZwpwX6URwdtKPyPcWTSdUtl55EGy+uFSlj1Aae0NQirFm2PCs/AmmAAdmiU737h3NM53+oA+M6vpzh7Om1jHASoejM7CQ9IFLQXyZHeabYchtsMfQO2ncqGIVqTX04gl/20PXAguEeD2jfc4OOSfhJmIk8BtHMh2rHvYiEXmaJKF6aGX3kUmOOzMx4fn5ul8EobgJK0h2w+1drNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Sat, 27 Jun
 2026 08:25:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.016; Sat, 27 Jun 2026
 08:25:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 17:25:11 +0900
Message-Id: <DJJOS525HN6Q.3LNJ2EPYWH2YV@nvidia.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Benno Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations
 initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260626214404.852685-1-nico.antinori.7@gmail.com>
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c04cf7-7fd8-4344-542f-08ded4259d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|23010399003|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	66pabIPffO3PphIxyUlIhzsev2NitcbcFWSVyjG5wz9tAt+N5tkCIdKRmwyI2KJV0/8+TOcaIhoI5VnxQHSOUDJBcAsa2B7x77JQdRZIkJX3X2bQG2/gFjuKO81QUpjyFB2bE30Sezsq7hWdWizcwp1RbCiXx5XtrauAjT5RtCh4YzBikbywaZuGaBgJP4nItoFcEI6avoGHCw+SaqyGQKG8kp0kx7ENq5HA0gDj9S1FPIeU8sFLpFmOgOzxr+P3N54Xpt36QFMyZvPW6zkYVq42nlIqYjVCpT6rj49eD3W3ByjO3unIhadDsarzzLjXUDKiG9vh5pl3usjH6MY68PFoC7ST88dD3mQHZ35wHgDvfkLg5n36iHL1E3C41NKVizrKNMNZV7FQGNp8DqKSLjQ9AFHTDXn7moE/9ivRDPz3g8AWKloo0RabEm78AFb5btgK7urs+lG45dVkOKjBnoZQ1ShdAAgPZRaeBhjlKh3sl3ZT+BsPB3Rc9Oi+3M5dvIeRLLCKz2U03yu+Hx2T3UGdYiscDoIYADvwalFK3hfTB5SyZm9s1TsHjvDa3rbAc1x6Tlg0R7P9AomxRz/mEoxONg9Y3L+mSUlfwbXeln/FdQaoAkIVh7AD5lYE5xHBb1c80bF0+/xJdJJQ0euOzMFKm9hHzi02zWWqtKkOumQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDI4RjE4WlZNTk9JQXF6Q01WMitWV05xWE8xNXRUYlc5KzVObEp1ZjhYbGxn?=
 =?utf-8?B?cXRnYy8xSVVxRmQ5ekJRaUsxU1RsZzdPZ09VMHgzN1N1WXVxbzkyWlJJdHJl?=
 =?utf-8?B?ZTl2Y3ZSNzluc0xKL0x2WGFzUUpEd1dXM1BVemVWRTVZUXk3YnZndTE1cmRD?=
 =?utf-8?B?Rm9kczBXRTNYc2E2UmpQbjFub3dsKytucGowRHEraGRzNzNwajNxYTQvM21L?=
 =?utf-8?B?UnhzcXdNMGQ3NldqTms5OFljVkx2VFJnMUxOWm9JcXRVZ2pnbVRWZmdSUWtl?=
 =?utf-8?B?V1FlWllDRENNV2xHUWlLNFRxK0wwd0hSS3Z2SVBXc2I2blpVL0N4OUlCMGh0?=
 =?utf-8?B?TlNrbkpvNEZFTmlJaVp3V2dKejhWSE0wclcyMHJ4NUZJc1pEcE51TVpVU0h6?=
 =?utf-8?B?MTJQbk4rdGlQdFJuQTNFT1U4enMvM2VoSTJyaTBhcDN1a2VsaVNmWjBnVWhQ?=
 =?utf-8?B?b3hVejdRdnIyWStocnRXN1RJazJueDgzUHUwYmp2bHR5U3RUMDRWUXhIaHRs?=
 =?utf-8?B?V20xN2Z2TzMrbHlaS2YyQ1gxYUlqYVZRYkdHQm85QjJZREhYN0JObmdDVnFj?=
 =?utf-8?B?U0hpcm9hbVUvNnRrVXdPdm5JZHJFVWErUm9MZmtjdlVndXpnOHpsNzRvdmVU?=
 =?utf-8?B?U2xsQmJiNWhBOEVVN2MvcU1lLzBVOG9ISFZMRVFpV3M4N0hoOXhZUnFqZ3U1?=
 =?utf-8?B?ak9XK3I4Y1hSSWxzYldVcEtEVS9DMmhnT1JMbk8rdzBrRjU2OUVpNHZqS0cy?=
 =?utf-8?B?ZzdKWlNzRHhhQVgzeTVuNm5tZEhraVVzblJXTC9zVEhxbnpNby9VWDU2NGVU?=
 =?utf-8?B?ZjVMUkFBaUNRMjdrcjgyWXljK3FkbEtQU01kTnIwWXFWdm5xVlo0aXRiUnI2?=
 =?utf-8?B?Mi80c1JOMSt0UU0wai9KZ1pBUE5ISE42UDIxeFF6K0IzOW5mV3Z5blE4OWV0?=
 =?utf-8?B?M2R0QnU1V1k4ckNKZVhjOHJ1MFNJcDd2MkUzTXEwQkNNUmw3TGw4UEp0Y0JM?=
 =?utf-8?B?NjNxdm9UbmhvMG1VZGZhR0gxZmlrblRxQUNHWUM1eXJsazgzRzh4OWVCc2Jo?=
 =?utf-8?B?MlZVcDdrdGZLbmZPR1FMQzhsSlBtZXo1TkdUZTJSazVsRktwb2RNRER5dDBT?=
 =?utf-8?B?bkg3N0N6c3lVYU1mcUhlR1ZHcHhXZVNtdWVLbkU0Q3JHbFlRSDk0cGRSVUpm?=
 =?utf-8?B?UjNUTVp6VGtpREdaTUExS3kxRmRLUkZsdUREK002MHVjeHE4TWs4dTRNU2Zt?=
 =?utf-8?B?WXRLZGFPVEVaU1pxWFRocStCOXRkQVcybEJHU3dsd3VFR2NWbFBoRDdCNkxz?=
 =?utf-8?B?T3lRVzZ2bEt2eFhWWFFraXlra2FrUUZOZWc5YlN4bzJMT2RqSVBra0dPMFNz?=
 =?utf-8?B?eVcyVFgvMHRhUG9OSFdBd09Qai9IN3B3V1p6Y2ZJbGN1WFdkb0p3bUlzdVh5?=
 =?utf-8?B?dGRFM2ZoWUpQblBQbklWTjZhSEZQTFlZaTd6MGJic3FucU5tVkFxMHYzNWVu?=
 =?utf-8?B?dVowU2JkM1AxeUUveURkMUsyckJwUUVOSm1FZXk1MXN6SFFQRkRvcVZVZ2Fa?=
 =?utf-8?B?ejA1SG9RaFdXNlVuZmlPdmo5VzZ5YWZBUkk4UWtpeFR1SElMTy8xZXJxODRn?=
 =?utf-8?B?TGhIOUVkN2pmMEZ5dmg1U2FDWUtYS2ptNjJDeklOUU5nZ1BycUpabDhDUVdi?=
 =?utf-8?B?T0NJNGhPNUNRL3ptSDNIUk5zL2NLalkyTUR1TldNVTFIT1BINjlWQVhXbVZp?=
 =?utf-8?B?M01tU0FVOU5EaHZSOEZFRkVMRUVXbzJqeTBUU2tTYmRiQThXKzFtL25uRlls?=
 =?utf-8?B?T1lENWRlRlFwbkxEMWFPdzNuWW50dTZjWGFzZkdNb0ZVYlFWWkZMVGN4aUJT?=
 =?utf-8?B?T2xhL0M5NWN5Zm9HYU80di9BK1JRRGNBd0JJR3hDK2VHdXJ0cHFqTDlsTmls?=
 =?utf-8?B?L1NtZFliNkVUMlpMWlRSOS90anRaM29LT2RtWFVTcTVJQ001RlJxQ21JaUZN?=
 =?utf-8?B?dXlnVzhpYnU3UjNXdzJKNE9vVlBlZ01yT2Y4eXRVS25TN0RSdERGaEFGSFVv?=
 =?utf-8?B?UmEyYUJsSnJFMWd0NVl1eVlzbUNacGNaQjRydVNsZXI3YVdpR3Z2NVY5WDZz?=
 =?utf-8?B?WU1OQ2tBMEljNVV1eGdldDFEQmJ5WXNvR3Nja2lXUzNiRHVYVWc2ejRUU05W?=
 =?utf-8?B?K3dEcmMzMUdrMnFWWG5OR0dlMVFHYTRseFpsZG4rM1ZPdlpuY1VTTWsxQVk0?=
 =?utf-8?B?QTJTTURTak5tdGZ4M1NoQmNzNERSdmorTFNMSkh6dU1GY3pnK1dZNzBLY0V6?=
 =?utf-8?B?WUtZRFgrZlNXeGttZHlXSjJ1MUtPc2g3U0NDb0oxdXZkeDA5Nkc5TEpyMHNy?=
 =?utf-8?Q?XOF01CNDMt31fhl2wUzL3zB9OTmLkbo5A2mX6Q33eZi6c?=
X-MS-Exchange-AntiSpam-MessageData-1: MwV28ZB+7+6fWw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c04cf7-7fd8-4344-542f-08ded4259d0c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2026 08:25:15.0081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URha8vZP+3D4fqSuKtqxmh+fPIWmI847CU0WZQPOdBQDrccMTLwnmHtm41kNs3pg2YapBLdDQChZnlJ+OjVyHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103

On Sat Jun 27, 2026 at 6:44 AM JST, Nicol=C3=A1s Antinori wrote:
> All types in `bindings` implement `Zeroable` if they can. This enables
> using `pin_init::zeroed()` for `file_operations` initialization instead
> of relying on `unsafe { core::mem::MaybeUninit::zeroed().assume_init() }`=
.
>
> This change improves readability and removes an unnecessary unsafe
> block.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
