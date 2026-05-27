Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022088.outbound.protection.outlook.com [52.101.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E0377ECF;
	Wed, 27 May 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879692; cv=fail; b=oA7nIWDVAz/cfUaXezUoHIfUtSro7RKvDpFRREPsN898FDEnOAe3tP5/3I2PsQjs00utq1iLdumtqzYgj78HIoSBflRhRRtmf5BOZ+83pYhdbRLedOQ8EWCjaX0n0v/qCh6ABYUwbTKAcMnhyrkX4tycRLey1UEj/v0PJ9fjWJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879692; c=relaxed/simple;
	bh=zd+xlnLglNsDZo3omvyI1+hIXoO9kc0IKYFLf+D8TYk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=e1SrAR6nnLuY1NiNW87loQsD6QolHjSqi+OOy76B2zh0D7y5s9R1B0QjhUQzMllVF+wnS2PpRxQQbvTGQ2f38F/lKGGQi9M2b4kaASJ+s9LL3x3gtzbm5qzkEP+tDV9eAvCqR/ocmv3FBAABmrO3/TLJkXg+QJfzulcTuqAiq4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NYPctnMI; arc=fail smtp.client-ip=52.101.96.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NYPctnMI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NENaa4hRaMViJoMvO69qYJGXaL9wINNrr04T5D4310J5nstBtuX/goF57tegxbs94WK7EaG2jnDKvBuOXhggbrL/8RkjJVU63XF/0nV7VCfzuMjXtxEOApys1q9PTZ/NAcu9VWylGpWWFFaMHx4RdId8SReUiVYXQiZbBDZ11lu5dQDFu1fbDsD843/X5W5lui2mguQOGHkbHJWMdNpcEA+OIX61s9XPHMn0JmoclcBL8NEH/VXNmgyONF1L5T5hjYX+0pi+FYwdduW6xNIx4d8IKipMSNPgl2406Akoq13HMb7W6WpycX63ZyNQO7FRL6taBoLJdvGkfpJ94ilzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvsQbepFsBFB7o2j01K4yoFrsOGSHHWqqViHaDqPNT8=;
 b=xvohXUNmsDKplQ3iScxYuDEw4KnHfcmmZHidsI1r12HMFbG6/1HRstfZ5oMViQYtqAuFwsdfXlm9yaYvJXket9OIU81/IKW2yobTVHuWt6DqmnE9/O7IIFGPWmpzsh3qg6s41aiECQVANmOepCo1Oo30psqR77B143cJZ8pOsZ+UYWnahnSCGOYO78/yX47Ity0AvEMgmX7b+zMcxlOZLdKQHXDiQy2YMOIFwC4SOdRdO7XR14O60I0cXoT+jwi6uB7c0sNR9UtmFC5fIVdydGWg63m+NkSi9L2HqlKl2YjY3nptDfeeMQ1PZhJu3G08gQgATCS2W/4eWkgaGxikmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvsQbepFsBFB7o2j01K4yoFrsOGSHHWqqViHaDqPNT8=;
 b=NYPctnMIBJMAzP1FLe7kWRcJURLmFM7Lauzoe3uwGMBfUtfahuVsR6rFhfMNkswNm6B/UwEECVEnLeb+QFk/4mgVyuIyM+YpCOF3/o1GavbfLQXTKw0EXNveFBO2+qQdEP4HuWeMZ0S2TCd5VCBrK1pKlonlznX/I/OCuESqZEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7894.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 11:01:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 11:01:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 12:01:25 +0100
Message-Id: <DITEOVJASZCH.21TYX8VM4I64@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: devres: use compile-time type_name for debug info
From: "Gary Guo" <gary@garyguo.net>
To: "Aary Milind Kinge" <kingeaary@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260526094329.533943-1-kingeaary@gmail.com>
In-Reply-To: <20260526094329.533943-1-kingeaary@gmail.com>
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b353126-b795-457c-ba2f-08debbdf4be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TQoiX2b/OmcLnKHvcyu0vTHtArPdGW10+osyukYfG4tN+Y6w1RaMYq9HfgoMZne5C6d2ayQsOY5cos/KiiVxiUwXZk3k68RQams1Vu6noZOzqPybW0y7i4FIcWSggkLb2KPWPVYeMw9OEEMPeMtwuNVbdOuH7kUMNtI3KKMEyd9zP1/SvquPZNRIM+omTRjUf3CkPLVcf9mS3Srk0MiQVm9LODUhnPuAVXosWjl8DoYCbqwrHG/8dleysNDTV12QzlKkLHKMQqmEu7Zh4qaecVTR/d2/+hxPQezYdoXqxjMVRoiC7MBY2B0Zp7CoNpjip3jK/PguMq1Edg6L2Iv3KYEoltGHoTakooA5d+vUCuN/ZOi/uNsIAmz5v78H9H6ATuZ3VK3qFAEht08GyttPQHQBFyq5FO36yilolbUmn8WBUCqIr9Kxadj1BE3cnj8SXZOiVzLYJVUIjRpC2gmVBHViuQuR9J79So1E11WIAHlQkL69CJuCICOqR7JaDgmM6WfwGGUbfSBt1GyO76HFQ/F2HIj/94V/TcDgw9Jsp46tOGn50FI1QTTBDeE6S9qlo6I2CJM6C+jaGnfLbHxmZW+/qoJSFKRQjLpuJMkHwcY+yq5uyrd8xNUdaARDRHrMwwy15iUPPK4PW4X8PhO+juh7di7r6qZPTPBTAj1CXIeKcIK95qkujp2Vd9N7zvMu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHRMcGw4VVpHZWpwbVNrQmRFd2MrdUcrSGRJSzBUbGxZU1ZOSTZ2dDlDRkpI?=
 =?utf-8?B?d1lobU1HZW9KNVVHbVdLd2tZZHArT2poNDlnMXpzdFpMRU1tWTJjWEtvOGpJ?=
 =?utf-8?B?WkR0dEJOYmIyM3J4OGVyNHplL3ZtTlI2Y1JTTkdqeTRLSm5KQUhURi9MRVdY?=
 =?utf-8?B?alMzSE9SUVVmSVJ4VzhicHdCdkNvLzhUUTBZeWowUHgycXQwRG90Zk1xVURD?=
 =?utf-8?B?empYaUtiRVRmenQzd05ydzhPaEl2bXg1VVE1N015K21iYXRjT3U2RC92Q3M1?=
 =?utf-8?B?dVltRU43eWFIbVNOUS90QnZtTGtYSDhGK3ZRSm5QRXg1b0JOZTFMZDRRMWlK?=
 =?utf-8?B?bHR3V1hSRm4vQlJuNitSazRxRXBZTklwNFhoeDJKUTZQbGZMcThGMTlkajYr?=
 =?utf-8?B?U2hlRkw0clJiYWdFUlBjZmlzWVRmSkFiSGdFU1h5Ly93ejhzNE8zbXN6SzBJ?=
 =?utf-8?B?L3dmZjZuNjVoOUtpaDlBcVlQYlZiUWROTGFUUlNLUjlnamszZlBMZjZueDdr?=
 =?utf-8?B?SjJQQ0s0bmNYcndkL3FPRlp5MnY0dThVb1VTRjNpeHZBdUx3VGJpZnpqTGh3?=
 =?utf-8?B?QTQrQnFSVE5iM3I0eERYUHNFbnVCOVZ1aDMzRTVmUFp1cnRycmRUVm5EL2Rn?=
 =?utf-8?B?TTdCRmRXZnRSZzhHTUttMkFwNTQzZ3A3Z0FTaEFCK2xZNEYxTGhQd3EwNzZv?=
 =?utf-8?B?VWNBNEVrbmlKa0hkbGl0T2syTE1UbS95ck8xZ1hkdWo5Sk80bVp2MFgrSEwv?=
 =?utf-8?B?UkdMQ0NaTUF2Njc4UjF4YkthSUdBTjg5dUxCSjg3dDRrNS85VVhLTjZXMGZ1?=
 =?utf-8?B?TXdySWxDbFV1T2JxVTNwZU05Q01MeEs0ZXpIYWNFeW1GbjVHTTlMTzdKQnFJ?=
 =?utf-8?B?WEFiRHk5LzNPMTJLRC8xNlJBeFZSaU0ra05iaEhlT1NrUlQ2UExhci9ObHpr?=
 =?utf-8?B?SFJ6Y2pHZjV4UHhTSkhIdTlSeE1WcDlFakNhRm1DamJ2MVV4YzZwK1JLZG5p?=
 =?utf-8?B?bnM4SGI5c2R1OG5jZWUzZWZMQjNzaG00b2xlbzJ4K3hVMFBwcDRSb0pQVHJQ?=
 =?utf-8?B?Ujg4T1dPT3FEaWVqSXNYbzQ1ckZ1VE0rQVBqWmFPdzFwWW9VN3pqa0ZpU3h4?=
 =?utf-8?B?UTZzeW9Bb1JwblF0bEpJUHpVRmNCSzlFb2VrRXVYQ0hlSEhhMXNLOHdNZWRP?=
 =?utf-8?B?OEtUSkxZNktHS3gyRlRTcHF6OExIR3d4ZmpYZ05CWGdaRVRseU04OEVrSkNQ?=
 =?utf-8?B?MTZ4eHUzUUdmcEU4SmplRXJqYU1TL1NaOHRDVEZERmhjbXc2MzhNVG1PZ1BD?=
 =?utf-8?B?aytwc0ZyLytOYlFqeitxNXVWY08zc1BUYjYwanFaVnA3SWxROGNBWUVjdTFL?=
 =?utf-8?B?eTlqR3RKVVVDeGNSVytLVHBvUXhjekd0YmZWQmtpc3pwTlFDRW5McVo3a003?=
 =?utf-8?B?eVk3Z2psb2VrMFBzaGxNdHVTNWh1VjZKN3plZzdrWVRNeEZJMzE5ZGIvUnJY?=
 =?utf-8?B?MmZHYWtNeVh6RU5SdWFEVjJSSmhydFptaDZCVlZBck9wc3FlbUpsTkdsZU9n?=
 =?utf-8?B?ODNkaEVaODk1Ky9kblhNY2hONEp2ZnArUEFqZzBHQWk0cU9IaFFFVGlBZEpu?=
 =?utf-8?B?WUJJU283ZnhURTBndDU0K3IzdTlEd1VhQ0pIcGdvNEJiSUszd2k3bStkYVND?=
 =?utf-8?B?dVFsRFRYY0czWldSMXNPdHdVMC9sOWR4bExwdTlFWHB4WlhWc1YyOG5ScGJp?=
 =?utf-8?B?b0RXczBsaTRIQ0l1KzhtVEVRazN5ZkZhRmVna3FrTDBRV012YWZkQ2VTMFd1?=
 =?utf-8?B?clYzL0VOMTd0YnhjU1M3R0FrMlEvRTc1OUt0NnRRc2REeEo3YjJqTUdKYmhm?=
 =?utf-8?B?KzJOZ05rajQ4OGdoZy8ra1RjdEpjNy9rVlpxWGVRRklBL1ZDVk05TEJWWVZj?=
 =?utf-8?B?VmpNWVRsVkpHcXo5RmthZjRJUE9oMklGb1FTdkNXT3pWQUxCZTVHTlZyem5u?=
 =?utf-8?B?TXlwZStQQllJaU5aV21HSzZpb3JBUFVOUDFGbmpUZmo5ZUxOa2lMVXRjMDlp?=
 =?utf-8?B?K25wRHoydTlqd0VUY1k4QmltRU1XTjFlbDRVamIxeC9sait4UGs0d09RYXlC?=
 =?utf-8?B?N3p1OXhjcGlvQ0U4K1RCakFoczBBNW95ZEI0UFdPVFZEanl4THVoM3hUV3JE?=
 =?utf-8?B?UHFlZkNRNEkvMVRsbE54V3BTMmF3Nkh0OTNwSWNhNGRnRmtmb2ZOKzFWZTlK?=
 =?utf-8?B?bmFRVVN5NE10aCs5RXczejIxOVpPdSthbElyRHBSV3JsYndkcTREdmJQSm1H?=
 =?utf-8?B?VjdRZ2lXdzd3UW5lTEJXdlRrU21wR2JkeTBvbFZKdnR3cnRuNWdwZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b353126-b795-457c-ba2f-08debbdf4be3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:01:26.0844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1ZG66CExl+HHLuFfOcZWZEUShBN8Q9pEFOk14xnL38+87ikwXqTeXhL+s4bMLIbxsGpXPEqOP1xlP+1jI2lDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7894

On Tue May 26, 2026 at 10:43 AM BST, Aary Milind Kinge wrote:
> From: Not-Buddy <kingeaary@gmail.com>
>
> The devres_set_node_dbginfo function previously used a hardcoded
> c"Devres<T>" string for all device resource nodes because
> core::any::type_name was not stabilized as a const fn. This made
> debugging device resources difficult as all nodes shared the same name.
>
> Enable the `const_type_name` unstable feature in the `kernel` crate
> and replace the hardcoded placeholder with the actual generic type
> name at compile time.

NACK. The feature is not stable on latest rustc and is unclear that it is
planned to be stabilised, so we cannot just enable and use it.

If you want to enable this feature for kernel, you should first try to help
moving the stabilization forward on the Rust side.

Thanks,
Gary

>
> To satisfy the C-API's requirement for a null-terminated string, the
> bytes are copied into a locally evaluated const array buffer, appended
> with a null byte, and promoted to static read-only memory by reference
> before being passed to devres_set_node_dbginfo.
>
> Signed-off-by: Aary Milind Kinge <kingeaary@gmail.com>
> ---
>  rust/kernel/devres.rs | 41 ++++++++++++++++++++++++++++++++++++++---
>  rust/kernel/lib.rs    |  1 +
>  2 files changed, 39 insertions(+), 3 deletions(-)
