Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021129.outbound.protection.outlook.com [52.101.100.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4D0329C6D;
	Mon, 20 Apr 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701303; cv=fail; b=ptgR9YNnJTxTZ44VzzfWJHmb4ZDuGhU0STcoJXOPyQZSo9XkYAOBII7QqSXFgCXlJNfWe+CgYV4WrET5E6fNxQbbUVlKPrwDLJGul/0fmR4sW8HcZ1dqIESKH6kaHbM8JaBsM7gO6AHVfREMIzTxvll0NVOBUgSbazLG0OxW9OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701303; c=relaxed/simple;
	bh=PbEKVUkNRwJvnZywYbzUnxUBcMouhLKaFpE0Fv+9gJk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=G/QGJwpNuo+q/FliuhyySoN3CMCiR6NsFWRZO0/42ng2LYVIeDuNWIXRxkFBqCjXMXrn7Ov9eSbA0xa/vZtcRFXlUhBVsD4zIcWaUS+ErPR+OCo2TiajedD7O2Npg0CXGSMsk1/AqT7cSMZlDk7utVT1RM8RA54MgMjVoEKbKeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YoXlLDQa; arc=fail smtp.client-ip=52.101.100.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YoXlLDQa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCVxkPYvU3IDjz2lT/rOwYtuWJ02aMMOfCLfE0pMNt6kEfJhiMUhitpcJ1LjD+gtzeHPRb+3myYKnbiGX/Ry0+cKZqdznDf82Jae92Kab+W90RqyiCp0oRhdkjnUT20f4b2cvFKQ4Sdv7VPBQJqbkvbwKd8+mXzUTrbJTIirMJJE/wgy5+TiuodL7wXQEDPisgygFagffQ5HMxTDiX7Inu8MT/I+wvj7cYsVkUfCZQB091+QT3BOhvwu0BSTtU5CYuW9S4qgIj8ovzHUHlgtMsDisPzuSrlEByOsOXAdIwPTmLtrr2uIiKk7JHba1+a9fuXiw4OVMdfrhHMfzzvKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lHbNQJiKSOmzJxWtJUv1UNI8+yBc1nvu9Dp5DxPv+w=;
 b=IybKFT55myJDeo6VLFlglx4ivV7GR1sMR9AsxLTFVYAl8iwtVhDuEv8xysKW0iCVcv1VlRKFIfhjTpQo27n/+f36jkbt331J64jdAn5KwHmQxAK18qnAHsNlFm8Y+My0dK+uSy3gNEyMZjzQdaFBHiniMOE6qBXRPqtDm9+Df+PI3RgLbySAaIEtBplCbxb6xzig659nUBjuVxrX7lYd/3lYJZ9Vdfn0vS2YJSNxsbI0VA/ny2X3l+QiwPG7rSxcY5tVKR0TXaBsgH5K2eAcWECP8Fpt4usQbTSG1DkoFdppcgiEJKcgngcmojKtTPCUhO7CwjAzp+f6p7tzOk/kAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lHbNQJiKSOmzJxWtJUv1UNI8+yBc1nvu9Dp5DxPv+w=;
 b=YoXlLDQafMOJ+WUO8pjDvcmBH9VDyHldBZ6RIW3PJgo5fImW0lQc4EupLUE78SLyCFbHq/8b1hMFplqaHUE/AE3MbY6S7kRAzzXmnJkcAE5EEC41IvqDYtXPGPxSfcIIrxEHOsAfXGll4sQ6Gfe6HqtBT5S5XLMKrzuSnNoTu0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7407.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:21b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 16:08:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 16:08:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:08:15 +0100
Message-Id: <DHY41NBAD6G5.2WKLWM8C91YX1@garyguo.net>
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
Subject: Re: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-4-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-4-jhubbard@nvidia.com>
X-ClientProxiedBy: LO0P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c94c71-215f-4cbb-fb3b-08de9ef707e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dVFDintIW9xO+H1YSdQ2Kj5uK1T5ka2RqT+tYxYP3v+dH4lXEaiLUpT3D2TCDDp7pCzEXLEMDoot18BcDw2jcvDDL/rR322yg12IMFqRBCrNNoVFj6ItfQBiudhWY9j0Wpo9BY1OVj8sh8Jn9Nw9Px+n+lSN9d7F4JTfE85nZBHF9YCigVZiRVoQUXV2o/CQtmLuDnOfWkxU07AGDly9j+yBp+bXSTeSpPXFaiE5T53+jtgTVQe6G8burvG9mcheO3NpM0OHz1Pgxk505+MyzDIzWaABQ4088slZnfyVoHmBFG0QByKKBJgUWvFF43MK4ZrIk6ME5T1ddGPPFLtJEpkZXXqpuBnOUUNT6GpOeVCunjmABTr3mwcclxMuRwcS8X7qyHAD1ZO5BHP0oIW8pQSBL8InSH1KJGBgeGZ5aJZ/0KHeEyEOjdIR4FIBUMaTjXkRaJDCqy+F6MnE7MWBgHPhZfqaVfO8ABQCAIvWnYiDdLJVdOOJn8onqMCsTzzX3vu8suPrNSyW7uhgFmGUJh4DgQL+REK04Z0isaNYu7L20a92S12O2jELsYJKLb+6KqTKAkeNxIpnxZOP4gTdic+BGsy40x3HubBBOJOZm7GyV5R+PPMzd8eJzRUrxIHNpHdO6+uPleMzuC5jvyBGmynkgDGQIeMmWBf9STEDl+N+SjW18hTxV8Pxymn5IKZDaIvuje5zhtspwdCFArWDjEH4QwbD1L/zC+n5IlgH7e0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkRTVVpHZ1lTRGJOVmh2dEMzdkZBcVo3T05HWWJRTHl0TzRMczlrOGlQdFow?=
 =?utf-8?B?a3NJSE1iZEIzNDVGNk5tNGI4R1VMVTgyY2s1UHVheklYYWFQSHZYZWJsbk03?=
 =?utf-8?B?YUxydkNtSTBOam9JMUtNUktkVmhJM3Z1T25GbU5oK2kweTBKU0szUlUvYlpw?=
 =?utf-8?B?TzFBZTFNSlpnbXMwZ3A0dTZWRWtrZ09BQTBJU0UvaDg2bFJUU3BjMzB0eTdC?=
 =?utf-8?B?b2ZJeTBnMGlKWlV2RXNiV1N3MzRobjExcTBVc05pT0l1S2YrdjRVemVUVDdW?=
 =?utf-8?B?WGZTWmZ0ZDNFWmtUQ3JxNXQ0aXJSMWoyWEtPbUhGZURpTFFpU05KWTJmV1FU?=
 =?utf-8?B?eTZhQStrWjVNajRjc09uOUpTM2lZdTJ1OTk4bDlKTGdzeG5UOEEyb2J4NXdz?=
 =?utf-8?B?Vm52ay9Pckw3VFZCOENoN1YvcDg0dXVQbm53QmlHeE5tZ0FFYkRqQWR2U0tL?=
 =?utf-8?B?OXFTdXRDUFVlZGNKSTBPcEtWcmtNVWh3bmVKL0Q1V0h4VnFyMHRxejhtckRx?=
 =?utf-8?B?bWtaMkVCUTAvUnlnN2trRHhGMG9hTlBSVnNqQ1gyaTJ4U2hYdktRQmdBaEtS?=
 =?utf-8?B?bjdsYitvYWRWcXdtTUthTW5LcDJqYy9vMXVxMVRBb09qdEdadzl5NDNhNWxl?=
 =?utf-8?B?OThuKzlUSmxyR1drM3ZXTDBYVE80amFETzlYVUllcWNuTU1SdW1lSE5XTVN6?=
 =?utf-8?B?REdGVitNYTkwdElOZzh4Z2xKTmtwRlU0R1NCL0tPQmZqdm54dStkSUVhNHdV?=
 =?utf-8?B?dzJmbDUxVnZYa0JUUEhNL0FtMEVZdUpZZUlFWmxncm9BQ1hzM2F4bi81T2lr?=
 =?utf-8?B?Q3pxVHNsM25JV3pubUcrQVROdW1LRy84dnpDanJoenc4Q1B2TzhkUHdhaUFO?=
 =?utf-8?B?bDV5aVpBbTc0OUJQTkNRRDNvYjF0OUJKRFUvTzNNenZOemVJMzA1Y0RocWtR?=
 =?utf-8?B?ZERLUis3SHZ4c25MZDdtUnM3ZktOVmRJZTJVNXUxQ0lrTlJrYTMrNm15S0E1?=
 =?utf-8?B?aEhaQXo2dGd2eEdVbmtGZGlqQUs1YXlTRDNPSVE1UTgxZWZ2YnNBYW5ESFA3?=
 =?utf-8?B?Z0szaHJ1UHAyeStBQ25MSDJXa3RwZ1RqOEJ3OGphQTlyWlpxZDdlSjU2ZFF4?=
 =?utf-8?B?aGZHUThCQUowMUdvR1FiUXdoWXdWNjRXcHpqaGFPbGVpOWxqYkNSalQ0ZVA3?=
 =?utf-8?B?T1Y2Tk9hRHNVNit3UzJsdG5nZ0VnaXgxaGRWQzBnQTAxTmFiRkhncjA0U1BJ?=
 =?utf-8?B?SkFYVEUwZm9id0hJb0RRRUthajRNUGRBOExwdTI2emNVWnpkcVFrZFVwVDBv?=
 =?utf-8?B?V3p6SFd3Sm9BdXFxRy9ocklWVTFnZnFXZTJYOFdTQU43MTlYYTlvUEZGcUZ1?=
 =?utf-8?B?TWhqb1ZLUkd5bG11YmxhbE5sSDQ4K1FyYnVCa0dQNGlYUjBHZGhlMUhzYUhw?=
 =?utf-8?B?TXlsOG40SCtuVithK0ExUTVUMEYvRFR3RFpJenJDMlkwZks0VllzT1kvQlhm?=
 =?utf-8?B?VityMERQVW1HY0w1amhSZmwvTEk0ZTk4THM2ak5iOHBRSFJ2N21XMUVuK1V3?=
 =?utf-8?B?RzNNMkNwRllFNmNHYjRteGkyVVhUSXJjNDk1SXJmN3A3aGZZdEtqVEtvbytP?=
 =?utf-8?B?eVBHdGpVd1IxcWw4K0ovZnlWM0VFeWVTVFEzd3dOVDJpKzBBV1EvYkVMSGpI?=
 =?utf-8?B?NmRBMTVqY3cyaU5BN05jMGNlbm1tWEJIQjRzNWpyMnRMeFc4ZURzNzJHMk8v?=
 =?utf-8?B?QkNwZkJaTkkwSHkwazZkS3d4SnZsa012cXZzYlZ2cVpsc29RSFJ6dFhSdGFT?=
 =?utf-8?B?QU5jNnlSQkxjOXNCUWpyV2NLTmdnS1kxcXJ0eWYzRlRON1JBcGZqMEVzTEVy?=
 =?utf-8?B?ZkVJN1FnYzdZcm5nQS9vU2RJRXlVanFrM3FVQzArUW12cEl0dHNrVnpSOFVX?=
 =?utf-8?B?T3NTTitybTB4WmtpVVZMZS9ndmJabU9VNUNXeWFtL2d2RmZMdFZNcm51akJZ?=
 =?utf-8?B?VmYxS0U3UUI5WEkvUHljSE5xR05ZK25CK0M3MkNXTXp0andMbUIzbzhwRWtm?=
 =?utf-8?B?SW8vY3QvYlV4UVFwVXN0a25lc1BqZ2N6K0p4WFFrQzkyV0RaazdUYkQ3UHNv?=
 =?utf-8?B?MWxZTUU4b0p3UXFVV2RmOHE1dW9WK3hJOFFJWWU1cHMyV3pZQWlrem1sRk8x?=
 =?utf-8?B?TURsR1N6anN2K3M2eFdqdE9kWmQ2MG9lbUVyYnZLeTFFczdxSlQ5ekREMmds?=
 =?utf-8?B?ZndCZnhrRXZoTzE2SGd5dDd0VUpOWjJNYnJjTHpDN1ArRHV2WXZNUUxyYm4r?=
 =?utf-8?B?Z0tvR3BEZ1pwVGQzTWVxNndsejNTNFNiU25lYXJEeXowenBTcngyUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c94c71-215f-4cbb-fb3b-08de9ef707e1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 16:08:16.0384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPNf8VE7/asABr4Ku7EgQlaqgea2sVLYgOi7LTfB6rfNfzmKd6Pxu/ErBusJmRPlwPnVGEnaBXDCMJjjxycDvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7407

On Sat Apr 11, 2026 at 3:49 AM BST, John Hubbard wrote:
> Hopper (GH100) and Blackwell identification, including ELF
> .fwsignature_* items.
>=20
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/falcon/hal.rs   |  6 +++++-
>  drivers/gpu/nova-core/fb/hal.rs       |  5 ++++-
>  drivers/gpu/nova-core/firmware/gsp.rs |  3 +++
>  drivers/gpu/nova-core/gpu.rs          | 18 ++++++++++++++++++
>  4 files changed, 30 insertions(+), 2 deletions(-)

