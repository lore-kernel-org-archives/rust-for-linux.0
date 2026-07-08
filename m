Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020102.outbound.protection.outlook.com [52.101.196.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D418B390C85;
	Wed,  8 Jul 2026 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510480; cv=fail; b=KnrNet3r5rNWg/g55IoEbih7BmlbsTwVRzHThmaoQflm+lzq7eB5ieGvUMZQFJWG7fZVcfpKU4KtEWoua+KrA5L5bIJ5RRnWXooFsiyjYrXFrOKRZudLtHxBGTd6Srx5JyBzoyhZzEG4LhksKDv0elBU70qmawp0GtV97VKNfRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510480; c=relaxed/simple;
	bh=VQptE0+gDW/3e5f0iGNHawrALlpBTDVm2Y2UHPm7EIg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=sHibwLfogdI/wlMVtFf00Y1xxWHQ7mp9rBaTlWLGbJ2ua38ZiJOPMVtAgSK4rxENFC3haqfk704NamflDbOn+sm2L9vUAQOUFMzb9SQNt4V9xqel78ZQOWx4zew7CrIZcu0tj/ceRPplb7ThHM/Va5wzVTsnk93DFqMdzpkw+0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=PNsRvIJP; arc=fail smtp.client-ip=52.101.196.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="PNsRvIJP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGEwprP457iyG3bg05mvt0SI45diKDot9URBLTmkMdtna8O6wHspO08aX8K10F69lsEZaftSTc480ScknDDtVaUA/OhwD9RzizLhPbMh9Lej7Z62ZJo0MVefyK9OwxePX5TkiLdgt3+/gdlrCY98kbJGieRKb0IMXsy4BbZiTJoeeAUxYAti1xSvV7K9AWiVzuFfbH2RsIC5tqBO7bo9GT3BXXp9T0AS+u0XpDUhR5QnvLMo25tIqxUj8YNOZrlodfymeywiSDb+eFGZSfhzlkCIHNcJuvdX1OdijbtLhAUBatktSy00OrmJ4hstKT/Fv8ZrSuRuUGMw0oORHuTxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxpHm2TBJE27N6MrmDLbIzzuXGVJbbx4i31hwXO55oQ=;
 b=e2A8co+nXxSmXcZa12Svf2H999jN3pJAhw9XrTQ1IwFd0zCbKZ9yUD7vaEB7WEKPQ36SXQ/Jbp2Qz4ls370lcH0nJzBZ0LqHoTPHxf1TgwoHSnYZab+EqimcDmb/jXJN2crQmzv1qCR16LQRw90AikBiE1iArDGq+ZEwpMHf5a9Wk8uT+yJv1mJAEk/Thy9dPVyPuROso8UoYfI0dEH381UPPplG/BNKS01iuYz3IENnOmlHnSxWYIkNelvKJHB0vYsJM/5G0lo5H8uxtDDjqXS2kOU5+5SnvRWqGjbwcw8yu4LArttF4VyUsrWehWk6GE+q8OErFl8S6vCMmkmXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxpHm2TBJE27N6MrmDLbIzzuXGVJbbx4i31hwXO55oQ=;
 b=PNsRvIJPmBFxxal/SoFq7vlIEmDY349WDh00RNnDOeWmDhJv81jx5w1vkHZOgwoiHrdKug6ASE3+6t3PIgbpMuAmqYKpamwwduhDv4Lcx6DgFUz34oPB8LcFi6SkCogGm1FV1A9CyxXBerZ59N1FqFDAtPr7gbxy+YR5yeGEV1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB9177.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:34:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 11:34:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 12:34:32 +0100
Message-Id: <DJT5P43GJ9MT.2527G7CFCEW46@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: export zerocopy symbols to modules
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com>
In-Reply-To: <20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com>
X-ClientProxiedBy: LO6P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d4f70f-8fee-4caa-7bd5-08dedce4e1e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|10070799003|376014|366016|6133799003|921020|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ttUQFSg3hGAHcHPa7qcS/KgD0YiCQ5xrXYUtLP1zu8BG0NrzVZul/ZyPhmhJ6IQffhSopm8AzRwgUiHng0tTGUg8uXA5MUcGKryBPpcKieujurQJUIA9ILnkCz8KTSnfh5c93qI+RDg6U96m5xJzQuMr2kZD7rfuTnqHksLP/xDhkdwT9B0k08sdhPibOPVrOZBq8ETMpcsxefqdwVo18CDzqkskELHaQo+QZiRDTfyuPN2Xewnj+5o5RKBTLxpeM+1B62ZlLgfOmrqt2gafl4bhqUTBCZY1m1E1ROg8f3CNudPqLv0UaNdb5wTFSYaSx3CHajs2HV0MNodjrRbPX91FLUg9vk5wULmCv7cTftmfEoqgQNNvkgvVmqQ2Ujr2Ju1tDndSGaHMceqY9+RTiVaAYRR6f1lyqFwU+WHMreVhNnZzxjwtEOHyshiI6KFnHesq1g+ES2uwHlQSOyk9HMv7vvT3sdhKp5Yn9E9CES5giaDjLN7j7CHbmIbXmuHFi8PDRVXPGYMqK9ZhRTaNMLMO/TCuLtYmicvCek0eAx1PYegsRHqqRvjzwVmK4gr8aQ71gJruCBHgVOKxiY4YoijDO61G/0dJy92Od52+UZO6Tn9LEFVyZFiYGtjzzQ9q9OhtJ8UgMbEhvCQKvAzNKuNpdm2HIqVTx5GZQnv57H24ZkjS2yHOmEmO/aZh96mjUCIh8fcL1Z08jrCSxXg77A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(10070799003)(376014)(366016)(6133799003)(921020)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RElteWNxK0oza1Jzb05ydTN4ckw1dkJnMzRlU251Rkx0UStlR01lYXFsbFlT?=
 =?utf-8?B?UGgwcTQyT1plNi84UVExbHo5ZFMvZlZDN1VOU05NWjZHWXlVL0c3dDdUVHJy?=
 =?utf-8?B?OG1wM3Vhbm5hcmR5Q0tvZ2lEeXRrS0tyOFQ1cVNIZnhaT3p6NFptRnhkNzdB?=
 =?utf-8?B?RzFBaTlkTnJxcFVGTENpR2JaQU9YRG1YSS91VjU4RDdvdlIyanRqQlVSRkdz?=
 =?utf-8?B?ckFvc05oWEd6R1VpNHIzMW9tSnB4N1BGZ29zSU5WenV4cCtDdXBxeEs4K2kw?=
 =?utf-8?B?cXhueXp3N0hEcmRNK1Mwb0RnUlc2YkMxdUJnUVVmRVlzOUtnS3Y0L2dBUjdC?=
 =?utf-8?B?VUV2dERDZ1dUNmNCSWs1L2VLc2didnZURkFPWXNBL1Z4bGVFdTNpYlNRMFVo?=
 =?utf-8?B?TVlnZHZvYzFWZnIvS25ER01KaGdkRCtBSHozN05Rb01LaHQySS9FeTdvVUVw?=
 =?utf-8?B?NVZ0YmFLN1ZudEdRd3lwQncrQzBwenlvcFpoYnA2RU9IZkpTV3hHNmtHdjdm?=
 =?utf-8?B?WnhoWm96TUVkR2lxeWtxenQzeDFScXFCSERjN3hYc2tWa3lPYzVTTWZKd3B0?=
 =?utf-8?B?YUJ2ZDNQQXRBQmlkdHJIK3Jsb1RBdEpJVE8yeVlOM2UrWnRWVWNiUjh6NzJ6?=
 =?utf-8?B?WnJIOE8yL0duQ3hPWU5BdW83R2VjaVNrR2NNMkw1dW5kNjJiOG54bko4VWxP?=
 =?utf-8?B?SUlLT3JFRlMyUUJhazBjN2dQQ1RLMGVjNWZSUlljYlJLYVU3am5Ra0xzQlJl?=
 =?utf-8?B?d1NJUlRnd3N1Qms5Z0NOVUdsK1loWDZ3ME9iZlJ6RVp6Yk12S2RIenVKOVNi?=
 =?utf-8?B?Tmp6ZldiN1c4bzg0MG9WVDBDVXdpNlpsMUs5TXBXcFpteDFicndDNUI5cGQ1?=
 =?utf-8?B?VFNGdHlmc0Fod0kyejYwZlQrN2tPWFZJQlh3YjQ5N1l0UmdwZHhkR2dpVyt2?=
 =?utf-8?B?STZjbW9sT2trcktFRlR4bmZ2eGRnOUM3amVaNXVQSmxuZk1RdHJ0MCttYmNY?=
 =?utf-8?B?dWNNSkVsUEJML213dCtUbmhUc1Zic01lTmd3blAxSnhRaG5nN1RGbzRRZ05h?=
 =?utf-8?B?d2dMTEJUcVZkRGEyOTQrcGt4bGRIWG1DbTNmU3ljTGVTN3NhYjlIOEFKdGZI?=
 =?utf-8?B?Y2J0NXd4RUJTMFFCMHBXYURHakN0RWVEaDhYVHF5ckdNQVB4OXJwR00weW1l?=
 =?utf-8?B?ZDl1K3ZiRlo5eUZaTGc2UVJidzhTSGthL0drWnU3eHpJUGRZV0lPTEdUVENl?=
 =?utf-8?B?Z3VDdWxQY25WZEhzTmt6a1d6NEtXd2lhY0JPQ1ZNODh1NlNCTktKK0JUUkt6?=
 =?utf-8?B?dE00UEUyaVpMSkJEeWYySitRWEN0WWVmdzlnRWNSdGhPSk1sdUs5dE12UmM1?=
 =?utf-8?B?ZHA2VG9LNHA1S2doRTQzdldIaGlHQTh6YjN6ME9KaFdzRmtUNk10eStlR0VM?=
 =?utf-8?B?MnNDcFN5MmtpeGNlNFI4cXVVSFNDMk51MUs2c2hNMGNkc1FYSGtNRVUxdDkw?=
 =?utf-8?B?aEQxcktseU9SUEJGRXRiOUx0NEcyRENzYlErRWlUU0FtMXlweUY3eXRMOHJN?=
 =?utf-8?B?Zk5mY0xhZVlXcDAvZDNzNHgrbHlPdkJsVmR3KzRZaC80NzVJTzFKNVRrTFcz?=
 =?utf-8?B?eUt2YVJQeFN4VXdZZ1BsOHNnTENLNzNLeHZPWCtpa0NZTWN6eitNbFpGQ2V3?=
 =?utf-8?B?a1pJWnp6bkJHcUJpVjhWY3EyOHJrNDBJY053M0pqdUx0UkdQRUZkeDhxc2xG?=
 =?utf-8?B?WDYwQlZJdkZUYkhIWlN4TnFRWXYxdVQxY3ZKYU4xUHZ3Z0RiQyt3elQ3YTFk?=
 =?utf-8?B?Zm9za0ZRQS9pVFY0REJyZkVZcFpNaXp2VE16U2F2bk9rM21CNlRVVTFBa3ZW?=
 =?utf-8?B?Nm80NzJwODhSbHluVFZBMTA2bnYvSmJlYm1BRHdBUXZqSm12L1lrUEFoV3p5?=
 =?utf-8?B?b1dvSU9tRGhWZkVoUDZsZkZSc2VpbXVBYjFiMDRyVGNiczM3R2FSU01EcHZR?=
 =?utf-8?B?ei8xN2haSVFFTkhLOXZGTzM4eituNVpOYW8zYnltRDlsaFk1aVRZWTQ4SU1T?=
 =?utf-8?B?V2x5MDdMQWE2cFNLYUdwOE4xMEFZZDlTR3A4S3Rvd1hIQzB3b2thL3RlWUdw?=
 =?utf-8?B?bWRuNy9iSlhuMExVOUQxYW5xRlhzOUlDSHFSVm5xTzBxa0d4Zk1OZFNucHgx?=
 =?utf-8?B?elVtQ0gxR0V0LytuSFZoeitmV21iVTd3TmtEb09OdUJCd2hRSWlQcmd5TzNE?=
 =?utf-8?B?NHJLS0lyekdMMlB5QzBwWS9LOHdyTG84ckNuOWFrNzN1bUozdWNnN1JjU1ZY?=
 =?utf-8?B?Nno3UDNQWXRXYXBIaVhYclhxQmJBMGRhN2ZvU0hzUjBMQXRmOWVNQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d4f70f-8fee-4caa-7bd5-08dedce4e1e0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:34:33.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4ytqMGd5pMEheJWrRGOCTzCntWrS0eMce+/ixS5IUxpYF1p9Qbxynmjp20v3h6F6r5DMg8RgaWzZQq5c7ngYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9177

On Wed Jul 8, 2026 at 11:37 AM BST, Alexandre Courbot wrote:
> Non-generic, non-inlined functions of the `zerocopy` crate are only
> codegen'd into `zerocopy.o`, with their symbols currently not exported,
> making them unavailable to loadable modules.
>
> This can break e.g. nova-core built as a module when
> `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy`:
>
>     ERROR: modpost: "_RNvMNtCs5wX7wwEUCR9_8zerocopy6layoutNtB2_8SizeInfo2=
4try_to_nonzero_elem_size" [drivers/gpu/nova-core.ko] undefined!
>     ERROR: modpost: "_RNvNtCs5wX7wwEUCR9_8zerocopy4util18padding_needed_f=
or" [drivers/gpu/nova-core.ko] undefined!

It looks to me that this should be done by fixing zerocopy.

Both these functions should be marked as `#[inline]`. I would expect zeroco=
py.o
to be having no .text.

Instead of exporting this, I would vouch for going to another extreme --
completely leave zerocopy.o unlinked, so we catch cases where code is actua=
lly
generated.

Best,
Gary


>
> Fix this by generating and including exports for `zerocopy.o`, similarly
> to what is already done for `kernel.o`. All defined symbols (~12 in
> total) are exported since the compiler gives no guarantee as to which
> functions are codegen'd.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> My `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` config is uncovering the most
> interesting bugs. :) This one was revealed after applying [1].
>
> I am not a build system expert at all, so be aware that the patch is
> mostly mimicking what I am seeing for the kernel crate and there might
> be a better way.
>
> [1] https://lore.kernel.org/20260702120324.40388-4-niyudi.honda@gmail.com
> ---
>  rust/Makefile  | 4 ++++
>  rust/exports.c | 1 +
>  2 files changed, 5 insertions(+)

