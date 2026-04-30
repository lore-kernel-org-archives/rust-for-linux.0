Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1E914884C;
	Thu, 30 Apr 2026 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777508836; cv=fail; b=tM+PJl6dsgIe8Vg5W/JaHGgrLMkLgLxETTt8qF+dudAsLV504L4giAh8ZsaY7vF2Nu0LunKwVP1E21/BY6GsC7X/Y1XI34lhQzxznbWJytfuYwI2bsVlg6bjYOJYQVm0J4TJvU2DsavzNSAsWvdKOVzSo3utUhwObWTASMzQPi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777508836; c=relaxed/simple;
	bh=CF5eTewljMg8EACo8iyEqB9TC5pxOOL0Wr5mQOclzoo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TiSKWSJ/9aUB1gnuqjwOiTXnsjnMzVKRtfDiLn+yBNiM9xbyn5mN+mjptrqD6fvkRRGpYb5loCa/+rANNV4WwRoJcQgUx2BXByBdbGP08dCblaOrNTSXVRsqHiPP824a/ZoGvmcrmF2S0Z0s9K83qDhiFBueywY59Brvb06aGXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uo24wr1B; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uo24wr1B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFNZoFMnBT4foXxGZWy9L7ae6FOnztIaY9S4B53oD0flwSFbXcIAiNNwej95Zp1iUYGF9CIr05/hi7NDEzVuiCjhriOAgGHrkzp6psPu10APW3ltA5tpzPb/2kHsOgPoXKyih+L8ZH0XjxluOgGU2FFh+SMLZtq+l5FupO1Iz/IfBLWWajZjL5+wApxCH+fGfkA1yID47RwuYwjXMXLMsdsoiMyBhiChy8Bs+CzXcstUwHHfoWlPdTDwg6sAQN3nUE43awdpAjjbjmFytZ5tBFtcamtmLgbQjjrYoYgFgiedVM+lYL1A29o66WjTHulRzNnCHeNLlElRAJJFqJB1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6PTdzmKReGyN8GWVqhCoH1K49YgQCik/9Mi4RPX8xU=;
 b=jYVVPghY+nQj84HYMdPleOSA0Mhx2vYMV9J1GgYRMEMvFi9Jrx1SV4NPJOYt6O6kGlfNBFB0CR3KQwKvvzklDa3zrgGM3A9Jk19t9YGNGuT9prAfBPl4Ek3X60+TVDjoFYVXGFe0iczpn2qNCmIPCzSP9x7b8Nc4NWueDDVpFKlwNwIPWKHld88mfwtLL4HtI55rQOZHkD2uCFjcTAdsiAOfvOQrVA/LpBmlGF5gk9my0crHa9/4OHksypCt1itvKatWTPUd0oWVBCnFb+FU11mUK2fEjn7uohiP+ytraTwB19kG+7ehRm5GJupYXV0k8Qtf+aTrCnLN0v4gVvU2fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6PTdzmKReGyN8GWVqhCoH1K49YgQCik/9Mi4RPX8xU=;
 b=Uo24wr1BQOxIBcAS6ei/7nZqkrtxJ9ur2BOCGoU21TP5PEX9ym1JUd37lvohssJiy19m/Xl3t+RcsR+/aEkMMsKR5z7x6d605wYLzUBg/2YNPfFwh+kg2UOI70JhbdXivwZHIJeqmjuSAgujd8lAqLOVu49AKguy9X49CmFW2F7PZCHYtVm9sD1TrSsXJ4lVAF1EYBm0fE7esX6ZHyPm6WJ+rh2oos64YbVKi4Xqye2OBbOxydDocrYbBrqLRKLS8nErx8BVlU5yY/PkBW1EFrqq2Jc4GGOunzm6qljeY60HVAmTLuXMPa+jCM6fsaBcVbiT0rdXUqikjeE13CKS+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 00:27:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 00:27:10 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 09:27:05 +0900
Message-Id: <DI62AHDXLAWA.2ZM8JKWQALKAU@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>
Subject: Re: [PATCH v3 0/4] Support more safe `AsBytes`/`FromBytes` usage
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>
Content-Transfer-Encoding: quoted-printable
References: <20251226-transmute-v3-0-c69a81bf8621@google.com>
In-Reply-To: <20251226-transmute-v3-0-c69a81bf8621@google.com>
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb7458b-2594-4df4-b4f2-08dea64f3784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9QhuHMdeZFPbtNkF/s/nQEIA5QP6m6w97tSnDDI+IScI2w0NXqyxMaJoRae7dOc0NQ6birQoWwO6a+DJMr7Z3c+IG59UQ1X5liqrYoetcrX6e4v9LtnA7U2wry9voJ4t9esdge0BPfVE2o9Jt50tJQ+tqBXCcpvz5J3ya893TmidvAT1ePSjUHVXMoTLssEZ3/zXrmf+deFRW4CQTdI6dIbmKQdpaHIX6LMYJx29RjiLxlNl3DO1CKQ/fxwbEXgGyI6sE/y83v7vomPt6TWirlzPXAJPc9b3cWopZ7VeYw4vZ8bAAuu/YjcHIeZwhiF9Vvmv4KvcGefatEu8Z/1KeNlN91Sxgny/zNw8Wtiw+V2rwLYMM4+JtVeypt6OpDHxWUJrav2eo0nxFzGB01q1P53Yit6viKPwTCsm+ho+n6FVTiTMpdJWF8JZFUuKHDBN1uwJoUZKS1BdLcz2ORVApjVceVlEI9QVnKNeetDX7bvWp+/rib2dY+GXYEprHhZj8TCK2tRJ7LcCiTSN96UrzLSfX1xU8YYNSkCyKolv/4Xsyb+HS4AA2/crE1mi8AMARC0CIf0nkHoHU8psSTNzfyYH48mhVeGmtgQzvUOdIIRygGxeo5dZkTv+agQU3wWh6DjfbRdMR2esls3SzRQogR0NL+o0jDsaWmtgcjRWMMhg9+8Z1LwI40YVmFKTQEMCXeOv9FA3cNVbU6o4BkLYz2M4GeNt/68s2kNPnKx0Tmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkhqVW90UkJzYW91VTg4bDNPTklJNzlBeEZQSnBaTG02blhoSHhiV2xVbXRP?=
 =?utf-8?B?cFhRL1NyVU40WWlYTUFqY095SUVBQjFrS3hpaWtSSjN6cWNUd1N2WWZ1enB2?=
 =?utf-8?B?U2E4S2pJVkdDSU93YzY3Q3ZIa3Yxb3RobHlZYUc5d2J0TUFqZ1Fta3NvZEha?=
 =?utf-8?B?cTNXZU45WllrWXQxWk5lc0NuWnRnazNwVEhzMVUwdE1Id2d4ZFZ2S1lPTTV3?=
 =?utf-8?B?Z0xzTHZCVHU1QmRlSVdWTUpqdmE4dFcrVFJ5aDhaendKdVNYanNoU1hhUVFB?=
 =?utf-8?B?OHZOUGlTRkVDSDNNajlVVVQvbmI2dW5zWWt4cWUzc3BwSUZtQWdZaTA2QTNP?=
 =?utf-8?B?SWpqRTVra3VCcjdCSTc5Zng1clBFNFd0V2JhVFRzNVdVTWRqbDdLRWUzcXgx?=
 =?utf-8?B?dFloSXlubUpkZGhjUjdNbEJzWi9OckRyREFpRGk2amRXUmk2NzBNanRmcUdX?=
 =?utf-8?B?MTJVTU1DaWpiU2FUVVhJUGc2NCtmbUVNY1FTb1U4c3pxL3BXUEx4N2RmaFBj?=
 =?utf-8?B?MzNnUWVoMFYxa29tVEx2K2V4TXBhZCt0N2t1QisyYWhhQ0xrOWhpVFplMGc0?=
 =?utf-8?B?a0N1VlNzcUNhTFFRVkZhUTJIRDJkWWxnMEFTWmUxZkVTWDRjU0NtVzRTVFJ2?=
 =?utf-8?B?a2dYd2RtWTdhamVmU0lDTlA5QU1xYjQySGppSE1CUDhMUGVjUFc2NkdUWERM?=
 =?utf-8?B?QnhIU2xNZ09lOFVudS82SU9oNGwwSEhxTDZMYndIeGoxbXFLQ3UxUkpjcmpw?=
 =?utf-8?B?MW4yTWhsVDVpRHBHUWN6Z2dzbWdtQUZ3dTQ0VVVvbitVSDVVaU0xcW9mMFhp?=
 =?utf-8?B?dGl6azRoQkRILzBqNHNFVndQNjBHTEZValVoK1YyQzNJYmZMa09LRWhxRjJP?=
 =?utf-8?B?TEJHNVJkYWM2WUtCS1JFTjQvTHNGWnNOeUZzQ1BNeTVJeFhkbE0weFhOaHdQ?=
 =?utf-8?B?UVBRN2x5OUk1MHlkRmxWajcvaXNEZVdLV25aZExReGhHYUs2VFZJVkZvSGUy?=
 =?utf-8?B?RHA5MEYrTjBjUmFaUzEvSTZSRDZLMWYzckIxSXZZQ2Y3MFZ6MmQ2bE5EUEdO?=
 =?utf-8?B?cjRDUUZsd1QzQ3ZBRHFJd1Z5SUJLdUN4L0hXNVFCMnR4emxtRW1VNGozcThM?=
 =?utf-8?B?a2o1b3MwUWFkZXdTaE9NTStlcjR2ZW8rU1RXZk4rdHc4YnRlR0sxekhOK1E2?=
 =?utf-8?B?Rm9FbHpHMHgxSlVraDc0a2IyQi85bVpoeUd0SnVqT3gycVVWRWpWempUL2wr?=
 =?utf-8?B?cTVkclJhL1VlczBqaCs3dFFpbG9ROWdBMVRlcXVvdFJaZGI5dkptdEY5UkYx?=
 =?utf-8?B?elhTaTBWZkpSMUpMWkdWZUZIZzFwUEFoaEVlbFhRNmQ4b3dmNDloQXc2S3I5?=
 =?utf-8?B?azF3WGMyNzVqWTQ1enlOYk15cWtpT3NGbURRY3VEU1lYOXc0d1UwelNvdDYw?=
 =?utf-8?B?U3RDZjFuYStyUERXNUVpdkZHQmpBY1FXMzZQWkR0eDVCeWlRS0RHL040dW11?=
 =?utf-8?B?UE9aUFhHRXJZZnNSYlhteXU2emx1T09MNDNOSk1wdURmTTdoNmZ5ZkM3Z09k?=
 =?utf-8?B?ME1ZeUpNbytIclNjd08wd1VvQnZDT2xsOVJTQ0FXaUd3ek01T2Z3UjB6Nk5R?=
 =?utf-8?B?NU9vSU40d2xCdjY4VWc0RCtuaTJyaElvNmV5Z1NMblk1WllBTmdPUXBTR1NK?=
 =?utf-8?B?SU96NlhpaTN3RjN2aUEyVEpkT3hzWG5CcVJDU0VhOWFWS3hLRVhiZXE2dTlY?=
 =?utf-8?B?MFk4SWZlZ1RaTFZzYllzUW0wdVpESUQxSU9FTG55Mms1cGE2SWdvcHVhL2NK?=
 =?utf-8?B?WUxpM0ZuUlFoeDNHWndGTU9WQXY4Z1pISHQxNXpNWERkeGU5RlFPRlc2TW05?=
 =?utf-8?B?SjRnSHk2KzcrNUhLNWphbXByT0NMZUZPSW42VjR3VG9zMkQ3SXlTUWtsaExU?=
 =?utf-8?B?cC9sL1ZSUDlVKy9tbHh6WXVoSW5zekVSbnpoL2I3WnZLU0pqM0pHTlZmdGNu?=
 =?utf-8?B?NHdSbGtNMGhQK1ZsZjR5UE9UNkdrMlJ5UmlBeVo0bmtYeWRRZWRnY3k5UFZG?=
 =?utf-8?B?WFgySm85ak04NEJwVytxdUtVNHBQNlV2cFNpajFpU2s5bFJ6WHJNYXhueXk1?=
 =?utf-8?B?QTFHUDl4aVZ1bDZmb0hIMEZheTBaR2pEZ0xnMkwrRGZ2MTZQTmpXdkZ6R3VF?=
 =?utf-8?B?WUsvZWNBcjE2TG5FMkl1Z1JCaSt6WFUzejBFV1FUcFE1M3IzdUJ1cTlvZ3VE?=
 =?utf-8?B?QnlNdmNhS3ZLTjA2dkUwSTRkMFc3N2VqalVieWtXaXY4Y0QvQ1BpdlR5c2lk?=
 =?utf-8?B?bGRtcHVIVlN4dmN3cVlUYTlhN0NXTzFrbVNqMUpNK2RQaU1Vb1FOSFBYb0tB?=
 =?utf-8?Q?434JU98ScUDbaFt+a9SnoxA7ZhqMr+t82YbaE7fx+pJZA?=
X-MS-Exchange-AntiSpam-MessageData-1: bHDHrFlty+wqQg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb7458b-2594-4df4-b4f2-08dea64f3784
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 00:27:10.0209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecefaMUGA7ZYjs0XSTlbW0Noab456qTEoYN3P/Y105IWfxW6xzJzwh/tkhE+wjFiwQohN+AhqQDtSGgxGuvsGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689

Hi Matthew,

On Sat Dec 27, 2025 at 6:08 AM JST, Matthew Maurer wrote:
> Currently:
> * Slices of `AsBytes`/`FromBytes` types cannot be synthesized from
>   bytes slices (without unsafe).
> * Users must use `unsafe impl` to assert that structs are `AsBytes` or
>   `FromBytes` and write appropriate justifications.
> * Bindgen-generated types cannot implement `AsBytes` or `FromBytes`,
>   meaning that casting them to or from bytes involves assumptions in the
>   `unsafe impl` that could easily go out of sync if the underlying
>   header is edited or an assumption is invalid on a platform the author
>   did not consider.
>
> This series seeks to address all there of these by:
> 1. Adding slice cast functions to `FromBytes`
> 2. Adding a derive for `AsBytes` and `FromBytes`, for now restricted to
>    the simple case of structs.
> 3. Refactoring the crate structure to move `AsBytes` and `FromBytes` to
>    `ffi` to allow `bindings` and `uapi` to reference them.
> 4. Enabling bindgen derivation in `bindings`/`uapi` through `AsBytesFfi`
>    and `FromBytesFfi`.
>
> 1+2 can be landed separately if needed, 3 has no purpose without 4, and
> 3+4 need 1+2.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Do you have plans to carry this series on? If not I would be willing to
try and drive it until it can be merged, as it would be very handy to
use in nova-core.
