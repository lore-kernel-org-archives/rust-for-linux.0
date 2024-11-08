Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C51E47C0
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731068531; cv=fail; b=YfIqh3Uw+F4tN3v3Fc0OtWPj279KP+D/whRaogp/i47bPQzJGh4j9WysglU09iXHUOR6/5JtaAYMBzJYHQRADG2rFp1QilgJBc4K6fLfrxIlRm0NbjhZi0xtAs04KWqVJGte5aTQMpru8Mflm6OTFz3dmq3E04buy9TzVrL+jF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731068531; c=relaxed/simple;
	bh=SGP90pp7LD/x2jH/ZEPAAHdRuHBot+sdpyS1BAlUP4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tSiyIVzxw1cELvNbQFPTgSBOY8j7lfsCP1AmNZOOabqB1gKTSBKbLlbP3zprybP395i8/kXEzc1W7UGfbd9KlR5WYFaCwXgZS4ya7FBWCAReNTWPobohQODUNhZDDFyDAaxknRELyxe4Z201W2L2rUka8IbCjDtXGwLxTnU0RaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=ey8Qtlui; arc=fail smtp.client-ip=40.107.22.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="ey8Qtlui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgUhzDd5hgoiHeIlkMVhDwhV43zOLvhEwNr3iSeAzKdM1TbBBluZIivDUtak/YB9gxfxYsSIuUcI3fv6JyBOEZFhwtdMJ8azMtwVKwt1eFf5/8uS6j8zCNCUnNKGiyz/OysINuxcdR3kh++B4kt7KAVkixH3D2iZB4S6CIiVTXXYq5HO8Kb4iCalVGArrMHHV13EAuex0WXHcbO8YjA58UJdcIorcnguLsKt1fIqzFWJdxEHThxphHNMN1hOg12ka9j6tScx6sZmQSgW1At6aKDThN2Y2cjsns57ypNEpyZ+vobecJ6C5IPvYRJXkb25i7s3JikN8Jkl+CU4MK+e0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPtkBv1iEVIS3veUi8tV/oAteu3DDmYg5ePESWv5kPc=;
 b=Za4GIwSQRoqzWYKFHvvC4lK0iSVk1Zq/58d8EhhDR1FRaauwvsDefnXL+Q9DIqJFOFRnNUkIqP1zWk4jI0C6caa7Zxw54DwKOeL1lYxJiUWcJkocXerSm8QdZ0gAo3sfA3Hsl46Wwq2fDDkiquIesaIK2yGPXKRwK9mq64mVJ1cnM/jvvd2ArIrenCpFCRHNXzGklRvk4ajdfgrBOaWUY/WEqU4YTyYtYza57GSHEsyQKgFT3Ka77Kpr58vN4+wIaZTSTvQPyLDlBjnCI0sUSW5Bu3UpZFDK4z3uAXBJhjjXuA6H5UOI6SXtNOGqktKRwnJ/2RBaRPp/yE0lKUSlrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=tuta.io smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPtkBv1iEVIS3veUi8tV/oAteu3DDmYg5ePESWv5kPc=;
 b=ey8QtluijAACUovPlcJcOfTucbxCaNNPAACf5Y0L/OlxeYOaP21ggldb6oG7q7GGpTbboQ1VazEJfitRGVyIN85A9Ic/W6unTDKyugAWdx/PjXTqhYtd7QSnTG3cXySD1YmlA6dMtb6fjOwbDTlwqt0fbEzcgir1sesFH4E6fEPX9zbvev0hTZn1bY8m+T8bMzOyBcAR/RTmUtPk2bHEFH8XWCk72q3yYvtDIYatpCvEBVW7PBC89u2iCDu0UdvwWhz7O5xlaiUxmjxFQF4EoTfSi2kdY3V9zZrk8zjsVGcD4mWk6UVHkKhZaWspC5QD5SYqmlpWjwI2El7/cU/BkQ==
Received: from DB8PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:10:100::43)
 by AS8PR10MB6890.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 12:22:02 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::f3) by DB8PR06CA0030.outlook.office365.com
 (2603:10a6:10:100::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Fri, 8 Nov 2024 12:22:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 12:22:01 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 8 Nov
 2024 13:21:44 +0100
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 8 Nov
 2024 13:21:43 +0100
Message-ID: <460e6810-6617-4567-92df-075d9f8b4209@de.bosch.com>
Date: Fri, 8 Nov 2024 13:21:37 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rust: print: Add pr_*_once macros
To: <jens.korinth@tuta.io>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>
CC: <rust-for-linux@vger.kernel.org>, FUJITA Tomonori
	<fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
References: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io>
 <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|AS8PR10MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c0dfed-3b8c-4ec6-6fb7-08dcffeff2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzYreURiZWNDWG1uajFGUjFNZWJsMzl0WnhCd000UytYTll1SUQvZUVtYTYy?=
 =?utf-8?B?ZTdYWStJQUdkaFlROWkydm5BeHZXVEhPNDh1Q0h2VldKYTk5ZGlvZUtyQjRt?=
 =?utf-8?B?clVTT3pnV2dlSk1oMWVxcktHNGM1TG5xTmRHWWE5VTE1Vk1HeFR0MjRCMFlj?=
 =?utf-8?B?ZkdPS3hzMXRiWjlOOTJTUFFOdWpOUnJZMG54QjdIc0ppMEVsQ1FDK2diY3NJ?=
 =?utf-8?B?a0NBQk9NZnB1clltTjk5NlVUaGNWUHhIb0E2aEgyZTNDS3FCNUtvMllDY1hL?=
 =?utf-8?B?VHA3ejhHT0pZZkhiMXJ2dXc2aWtzbHJRSVJDZDFHRUQ2OXdCOHU5eHJGWXNO?=
 =?utf-8?B?Wk14SWZhWGJhZ2t0KzBZSzdMZmpDZXdTYXdLeG5zUlplSEpST1dvUCtVbVZU?=
 =?utf-8?B?Y2NydVRUaDNQQ1d0YmczRStGTVJQeVdaazduWHFrZ2JscFp5WHV0YzdUWlBW?=
 =?utf-8?B?RUZjaWFRVk9yZEZnbThOL05mZWVFZmYrVDVuQ2FGWms4L3RQdkJWYjZjMnY1?=
 =?utf-8?B?d1VRanlzOGVUdFI0YkFHSUJ4enNpUWlYUkhPb1JGZFZDL3QyaGZPaFBZM1pZ?=
 =?utf-8?B?T3gwdktOUmVTNXBjRFJJaFdaZWtrZG1nSW1NT25zRU9MYnJmNGtiM3AwbzZo?=
 =?utf-8?B?dmlmSnc0d0pEZWEwenNlc0V2bmlHTFgra294SzFsQVIwbjRJN2sra0t5ZGV6?=
 =?utf-8?B?bndmN1RkaDgvOG83aXZ0dEd0WWxodXpCdSs3YWNYVE92YWp2WlhRcW41QVJH?=
 =?utf-8?B?dUxqalZkTm9IWHExWlE0WHNTdTgxYXY0cXBRZ1VuREdsTkpXRVJPcW9MTVZG?=
 =?utf-8?B?MVUxU3ArSzRjd3o4Vnh0alFuamsrZjgrS05JQjJPTFUvV1Y0V2tubzY2L0ZE?=
 =?utf-8?B?R3REZkZXQkJZa1ZNNzZzWENjYmloT29TczgvQUNNRmF6LzgwM09CcjNwQm1C?=
 =?utf-8?B?bWpSNmFWRHoxT0x2OWZOemR6UStHRmFIVGdTbjFQOWozTm93emxJVWljQjJh?=
 =?utf-8?B?U1pBeXJIN1dpbUI5bG5HcERqMnM5akUyRFlkb213SXovZEtUMk5JZFdIeGRW?=
 =?utf-8?B?SGI2UysyVTZ6SzYrMDl3ZGVUb09QRTJsb1Z5UUl0dGg2K0dGOThmSUFWQy9u?=
 =?utf-8?B?UFI3eUxPVWJ4d0VNMStOUnJ3ZEFCSGNUZmdaV00rS3IrNzNuM2NreCtzajFl?=
 =?utf-8?B?ayt5T09VU2FmVUsvYm16V1Vpbmk2UFA4Qm1hRVM1Zm5ac1FDc004ckZPRUxB?=
 =?utf-8?B?M0NuKzJ3K0N4UEhEeXhnOE1MaXZOMlRZb205MmJ0anBnQjY4RUNjQ0lBR1lC?=
 =?utf-8?B?RXpNd25ySjl2alZZMS9yekNBaFNheGd1U0pxUXgzSWNMVWM3OVBZMk5XUnRK?=
 =?utf-8?B?RStxZGZLTHRwK0hIWERtRkE0V1ZHQzhKMXNoUS93ZGtvV0pVMWhGczV4T1Vu?=
 =?utf-8?B?RU1kNTRkOHdEazg5WlEyQVJHRGkyMndMMGx6UnI2MXFOVVNUTWl5NlpGRlEw?=
 =?utf-8?B?YUM4K2tWNzdMUk8xSnBmQ2JNR1JwTXRTaDBMdEJPS3NGUDVUcTVjVHNKTHJ3?=
 =?utf-8?B?enUzZllXdFVKTDFRWnNrRVJNeTRjQkJtRDN0VjZLa0RXWVdmZGE5Mjc2cUZU?=
 =?utf-8?B?QldOTDZrQmZ0QkZ5SGJ2L1Iva3loMFRRQU14RVAwdjNOS0lRSUgrNnF5Q0R2?=
 =?utf-8?B?clcvaUZBdVBIZ1grNXZqNHZPcXVKT29aS293aDBPdnRLanZ5N3NoR05nZVNY?=
 =?utf-8?B?UFBPakNPNFV4VU4rWWFGSHBvV25NS2tTNzRoQ09vN21pckFRQlRpTnJyQ2JC?=
 =?utf-8?B?Q2NHL1ZMend0eGExYWc5dWF4czc2WlhjNDhvYjhkSm56ejdxT1RjR3B6VURi?=
 =?utf-8?B?Z0xBOWhDNmxhUUFPc0tnd3JZTi85Ulg1SG1DMG1pVFRSZEhGaEl5OWlZMStt?=
 =?utf-8?Q?0K4HT46ALIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 12:22:01.6390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c0dfed-3b8c-4ec6-6fb7-08dcffeff2ea
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6890

On 07.11.2024 00:28, Jens Korinth via B4 Relay wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
> functions, which print a message only once.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>   rust/kernel/print.rs | 109 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 109 insertions(+)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 9c7434b221984ad325138e5dc90ab4340cd0be2e..3c7414f99934359112b39d01392029feda8802e8 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -448,3 +448,112 @@ macro_rules! do_once_lite (
>           }
>       );
>   );
> +
> +/// Prints an emergency-level message (level 0) only once.
> +///
> +/// Equivalent to the kernel's [`pr_emerg_once`] macro.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::pr_emerg_once!("hello {}\n", "there");
> +/// ```
> +#[macro_export]
> +macro_rules! pr_emerg_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite!($crate::pr_emerg!($($arg)*))
> +    )
> +);
> +
> +/// Prints an alert-level message (level 1) only once.
> +///
> +/// Equivalent to the kernel's [`pr_alert_once`] macro.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::pr_alert_once!("hello {}\n", "there");
> +/// ```
> +#[macro_export]
> +macro_rules! pr_alert_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite!($crate::pr_alert!($($arg)*))
> +    )
> +);
> +
> +/// Prints a critical-level message (level 2) only once.
> +///
> +/// Equivalent to the kernel's [`pr_crit_once`] macro.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::pr_crit_once!("hello {}\n", "there");
> +/// ```
> +#[macro_export]
> +macro_rules! pr_crit_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite!($crate::pr_crit!($($arg)*))
> +    )
> +);
> +
> +/// Prints an error-level message (level 3) only once.
> +///
> +/// Equivalent to the kernel's [`pr_err_once`] macro.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// pr_err_once!("hello {}\n", "there");
> +/// ```

'kernel::' is missing here:

error: cannot find macro `pr_err_once` in this scope
     --> rust/doctests_kernel_generated.rs:4482:1
      |
4482 | pr_err_once!("hello {}\n", "there");
      | ^^^^^^^^^^^

Best regards

Dirk




