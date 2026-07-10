Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7D38228C
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 06:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663828; cv=fail; b=hde4mPgHOl6ecSuTU1XaTt+jdi7UsaPqIcP8vpdxobS7UUC6CjKFiO730M0KKkXAO7dFHeFz42Y37M8j8naqj5HuxIMPTj9aa51JGrzLhzjoSY0lkZfiepYAGQrDAp0sWPGR8L9oKh06KmSI5oEfJTn2j08A7k9H1C7hs9nEjNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663828; c=relaxed/simple;
	bh=ZMjF9nrwCLYA88aR/LRi9zJiwu+HSY458o4544dKZXU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HknZBmS3qn2qqeROqcQKBTQC2G+m6GomIUlhdUHDIgFGbU8Y1uLXcvEFbXxdxEZTq/Ww7XUVZdRQK1EmvCmeMLQx/mSoqagBaRdNKSYgFzWGogyGhH4LseNNUDHrmZ5NEpdwCan+/BeHtaer3Dfpq5fcmjqjCFjMgrmdNhMRh4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p2pUQ+BB; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p2pUQ+BB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYKFfZpZ9KYPL97jlCXWlotu5m4eVXqJH9+vsfUycRs3tq5umUFGFj//aicMWqOLBrPczDqw/j6IN5qUbnU59IL9rbaAI3VF4YVw8c85KQ+SnDrRdQeiKPISeXYKnXaQ4s9QvIdbTiTJZGQETgI/hipIeOFYR+20tySdMpnc267Iug1b+O/w4W0zSWFCOG4pXe7LdYt8Ea/O2IPVUeMDNuHvTc3vcvud9I9l/+20jIMgA4mnrBK/uOW9E42HwPCe1i78Ehzks2Q1zKU6NOHfqzmbDDqEbnCnY7SHB+nm3Tji3TrTKE8QTyAkppRc57h8p+NsT3iugvWALBo/9xwBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJ3rrT/smhD8yCl0Id6GMI5ZNU1ZW64pcEaV6cSEGAM=;
 b=gW7fc40RQfpkBq8zIegcrU/rlCzkwxTLIEybiOmhxGxfbpZWz8FGVgXsQwz0lg7SYzm7HnuNc7XomCVvhtt19zS0+oc+FFeuxqjnEpZsg4QADJssEJnJ741+PMgrU/bLISyZU8xFz6pE4/VVNCGglHPV54qPML/nRvA8Ls2QtI558BMaL7SC0DETvWZlzJUBn0Zm9v7XdRkljbDHsWcYcZe2Ph9xmHqBteo5eq3WfVlUBt1D9t3RYo0Ev85thTGu40G0oUMwKmOn6C12fVCdrB+PrFJu97OMTTr18k0qkYCVGVyq6C6pjDHMo3x6BvnvRec9UgHEhuVK4NQSvNpMhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ3rrT/smhD8yCl0Id6GMI5ZNU1ZW64pcEaV6cSEGAM=;
 b=p2pUQ+BB9ae9hf7ZvR4vN5jLrIn5jwKfV7GiwzcoMh9vRJzzOzbv+xfxUB7qwwwEazFOkLTqRQJHgPXFMsqhT97dZA31sn9wN0AdK0vPxrhQBpU2JmI6PxKTFe+hdl4GYho27BQtHmJi4KZvsqz/3lcyrhIafKv1tcMmX2bGI/svTSVW6gOISBzQvrXubrhnrXrYfx6wdJ3F1PnVbwGSjDEh8OVCPOxOH2aU6dnzdJBhL5GQpkzjAu3vs10V49W9yPcALoiZtp6+8Y7FXCuyFgfcd4KdkfLec+T+16YS/y60apRPu/ICGuACqr6sFV/Pb3bfvzvKp2hP90rF87A46A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 06:10:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 06:10:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 15:10:17 +0900
Message-Id: <DJUO1XXNXECC.2YQ7YFV5TGPNY@nvidia.com>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "Joshua Liebow-Feeser"
 <joshlf@google.com>, "Jack Wrenn" <jswrenn@google.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.54
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <ojeda@kernel.org>
References: <20260709211311.142544-1-ojeda@kernel.org>
In-Reply-To: <20260709211311.142544-1-ojeda@kernel.org>
X-ClientProxiedBy: OS7PR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:604:256::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca87970-f3e4-463a-2e8b-08dede49ec56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|23010399003|1800799024|366016|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4jbFVySILGyZ6r1HP87xSMCdjY63GuLSJTETR6SzQCiaraB2oGju0IYe7ufMBqIU23T2UP8mOZt0kh7yLFbmw1vjsnl0tsM+HMenPUs6LT8K/Agk6qtbklef3VeUE+tRMY146oTi24mFlZJ6KBVjtvpmSRimrKIyMVm6pyYN7c3O/uOBalgrFOzs7BDMk+DC7hc88yQFOc5IigBbXa2NvRlXSy5kjaIV08dx4lAceHa4oP+tvZ/Pamj2INT6q83x748TMeNaI7sTw++SYqjjOf+W442Pj2hhk+h/moq4qX2ZQ6//4vvJjVq/fuuEHSfDz6+SCcazB9aPdMLZ8osJAriP2gAPzgfOAJNPy2tfOi096idawB95J/LOt8fucUN8X3gR85HNRT1JUSxUjBcqxeyYBY6tgClLTJ/gfc+K7b9GpznIW1/9JmlLmxsdvCaaIWMpbPsvIFufC+/ncnhwxCWVyj0Osfz5lF4k1316lF+WaJjXRRK28eSC5YexS4kv9cAbajmCT6gvw8PZQ0ZHxZ4MMBlsOH46hTlvcyi+/lc23ihVL+7j+KxFvbPuLkKUcxMDck/mpDRHibnWMVy2ENqtfwOxpyQk0UP9V2SyV4/8ljKM1M71zQ+z9/55mJ6fB7m9mA0V/nNdpao5axQrTlwamzxo240Dx8KADgRU+6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmlGUFpZeHp1WXBpb0RWcG15OXBpRnMvME1lMitsUWtIVEI1Wm45QjVzUnhL?=
 =?utf-8?B?T3cwckZoOGhVMzdzVFVGMmYvRnBiTS9WaDBaUU9BTFl1QkFsc29PR1FHSUpi?=
 =?utf-8?B?WUZHMVhxUi9RT2NoTGhLdTFZY25Qb1huMGQ3Z2Fpd25qOS80d21LRGFqRGYx?=
 =?utf-8?B?NUY2MHlyRGZKVGR4ZnFKRTVWelNUY2hRMEwwYjZDUHNsc0Z2YkNrSTc1YXRz?=
 =?utf-8?B?bnN2aGRvZVZwcWVQT0VuMlZVTDlnNW1hN2ZXWDNqdzh0SlhlTWNsMHVhQ0Q1?=
 =?utf-8?B?SXpWRnZvUTV4NnpWL3lxbkRheFMrYzd4eGtyNG9Id0F2a1B0R2ppeS8xSTVi?=
 =?utf-8?B?alZNY0ExQXlFc0hEd0JicjAwTGFQYnNxVnNWbVhsVStjYjJ6dmI5OWIvRnNx?=
 =?utf-8?B?UFJOMDJXRlgwYmJiZHpRL1NMN09KT1UxekorVTQ1eEVPWTQvc1doYWR0NTl1?=
 =?utf-8?B?OEFmUngxaXZ2Skt2RU8wWXd0L1NHQlkvZElNcytqdStTRitITDNoRXE4YmxO?=
 =?utf-8?B?REgzR3EvR2ZpOEM3QVBLNWx0Q1V6YTJUUjBBWG1xK1VKWG5PSFBxQXJMS3Yv?=
 =?utf-8?B?c21FUW05OXYvRDBKaCszYlNmRkdBWnF6UGxmQnRTa1BVczFHTFFqZCswZkti?=
 =?utf-8?B?UHVST25paTV4Y3NCZjJneHFqMzV5YThCUjdoSHlHR2gwM1hzeGlDSHY5SS9q?=
 =?utf-8?B?dWQ2MjViT093MERzTFRNc0tnSmg4M3UxbisycW8xOU9PRVhkekpacGxIc1Yy?=
 =?utf-8?B?LzNpL0xmeGRONkF5by9yTEZqeU13N0xhMDVDZTY5Yk1qTG9yR1RvNTZYQ2ll?=
 =?utf-8?B?NTc1SFVrOEFTcGFKTlFYSlFCUkg0cFNaQ29qSk53d2ZsR2traXB2UHMxRmVo?=
 =?utf-8?B?Y1lvcEZmUmxiUitmUWVUZFVMK0RnUXVZWnNRWGRCNHh1NVdGR3VsVU5KZWlp?=
 =?utf-8?B?eTdZdnJTR1pjdnNwTnRWRWYvaU1OdmpncDYvVUFvUytGaCtMaGJBT3JleFFz?=
 =?utf-8?B?ME0xUGpvaHNyWVpNODAyTVEvMEdVZWNLTmdqa2k2ZjJ2b1hhUzM1dTRtTXc4?=
 =?utf-8?B?S0RHZStNTms2UlhhU0tMQVp5R093dUVWaVNiUWZqRDFyQWJhZk1BVWlMWVRB?=
 =?utf-8?B?Q2czd3FSK3MrS3ZCb05iT1hmY2dnOExsTU9LRGtPZWJ5ZEdjTmFqdmptMW81?=
 =?utf-8?B?UUpsbCtpRlBIN3hGT0NWQnBWbjlvbi8wbjdaK2lBWDFuUFJaWU9pRlRtMExI?=
 =?utf-8?B?L250SjBLUEZ6TXlVMTFHQ3lXYkRGK25taG0zQ3FtYmRuUHRBUGFGK0dFN2pl?=
 =?utf-8?B?YzVSaHFmQlF3cG1ScGxwVlRRbDV0VzBsZGpnMzdab2V2OUFzTFl3bmVWYUdS?=
 =?utf-8?B?QW9lNjBDNWhoTXFic1dLK1NXSjdTTTBscCt5N0MreTlpcTBWZyt2ODlKZWwx?=
 =?utf-8?B?MkJiTlJnRk13VEpBVFJOUUh0d2drNWFUQm9BWmJ0eUZDbVA5MUJaQzlOTnBI?=
 =?utf-8?B?ejFyWk5iSDRhM01BQmVEcW4zM1pxWmFGY3NtRVM1dUp6bEZCYTc5WXhzSEtB?=
 =?utf-8?B?ZVRvb0ZIdk9ic1pVNFB6TkRWdWhQUE1ibHA1Y1JkTm1uV0tnd3R4d0xsdFNI?=
 =?utf-8?B?SjYzdVBjbE1ZWWhERk9MSzBFay96eDFnWGYxUHNQZUZ5VnJLeEJqVWczRlVD?=
 =?utf-8?B?UVA0dld3ODV6WFZ3RUtVT2JYekNjVENGdUhaUC9BNGh4NWxTUGZOWGdZOVd0?=
 =?utf-8?B?aFFqTFpqemlxL0dKSFIxQVVrQlVaK3V6YnYzcUhlWTgyMnV4alhqSlM2WnBs?=
 =?utf-8?B?Tys1eTAzb2d5d0ExSFg3Ly9XODErZ3BjR2Fvb1ZXNGFFQ0pDaDNqdjNzQ1Ur?=
 =?utf-8?B?QXlJSitjOXlWVWF3dGJnd2dnQ1EwL0ozclBoVnZkcUNLZHp4UkQvUUNhM2Jr?=
 =?utf-8?B?YUtsMXBQbVhEVG9qbU1WR1NtMHVtSk1uck0zU0J2ZjRQRENQV3FIQmt0Uncz?=
 =?utf-8?B?b0J1T2VlcmFoVml6VXhZaWVSRHBnaTJKbjNiM2NuQi9yTkFiYXZmdlZMZHAv?=
 =?utf-8?B?Zkc5TzJSY0VLdVlER3FyTE9QOWxqaVc5SmIzdnFZNHh0MnpQK0J6a05qejZZ?=
 =?utf-8?B?V3c5eGdtbUFqd2tCaFZpaktKZFZ2RzVnYm9HM2pxNVJrdy9MOXNQdEg0emUv?=
 =?utf-8?B?OUExZER2VEEvVHdnNFpJSllBb1l6ZjBJaFlENVM1VTdwdWcxR0dBYm8wdit6?=
 =?utf-8?B?eWEzRWFUVXkzRmo3dDhqVVRkL0dvUW8zQm85TkpIOHZtbUVwTHFNK1hueVRa?=
 =?utf-8?B?MVBUT0h5eWUxZ2Y3c3hVcS9XTGNRS2Fyc3AvWWdLY2V0RHlvdWk2dEt2N0VS?=
 =?utf-8?Q?qhhg1HbUTVnbjx/WsdtCNBCg1P0A+SUFXj/wDYBNj+y6E?=
X-MS-Exchange-AntiSpam-MessageData-1: WIu/M8X/puk2pw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca87970-f3e4-463a-2e8b-08dede49ec56
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 06:10:21.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0093XvFeuXrmrX8B+U8MHamPBZ/zv8gY56qNprzwywslLEmL1Oo1GW3seWMrVoglpdIIrego0EvCEZunncf5Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073

On Fri Jul 10, 2026 at 6:13 AM JST, Miguel Ojeda wrote:
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.54=
.
>
> It is a very small delta from v0.8.52, and most importantly it resolves
> the unexpected lack of inlining [1] which triggered a modpost error
> under `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` reported by Alexandre using Gary'=
s
> suggestion [2]:
>
>     ERROR: modpost: "_RNvMNtCs5wX7wwEUCR9_8zerocopy6layoutNtB2_8SizeInfo2=
4try_to_nonzero_elem_size" [drivers/gpu/nova-core.ko] undefined!
>     ERROR: modpost: "_RNvNtCs5wX7wwEUCR9_8zerocopy4util18padding_needed_f=
or" [drivers/gpu/nova-core.ko] undefined!
>
> It also resolves `most_traits` being unexpectedly documented [3] that I
> reported and adds a missing SPDX license identifier [4] that I requested
> to match the kernel version.
>
> The following script may be used to check for the remaining differences:
>
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name READ=
ME.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/zeroc=
opy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
>
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md);=
 do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/$path=
 |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
>
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Reported-by: Alexandre Courbot <acourbot@nvidia.com>
> Link: https://lore.kernel.org/rust-for-linux/20260708-zerocopy-export-v1-=
1-2bfc355853c6@nvidia.com/ [1]
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DJT6235B3DOV.222XR5O6VHG4M@g=
aryguo.net/ [2]
> Link: https://github.com/google/zerocopy/issues/3466 [3]
> Link: https://github.com/google/zerocopy/issues/3457 [4]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
