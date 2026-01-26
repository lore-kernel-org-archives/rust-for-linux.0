Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022076.outbound.protection.outlook.com [52.101.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695720CCE4
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438164; cv=fail; b=DPk+Z+lG18QWAH1S0oXwg1fR+DgmS0CFfm9Ep6pa2aQz9btquWiihQ1UaTKZCBA5hCk1LII39tAQKcpZfHuRSfHDWPMOSdEOAh563F6Rfn06L+J4dmj35/hDr4Nl6BGcF2ue9vC161tpjHk1EfI8Op6zcH2lJCPQsK4YJ2Hgbuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438164; c=relaxed/simple;
	bh=9kit58RPPg38QUZDnN5T9Gg35feqiWhzARY3Bf2uKdk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=QK2b0gKFOY2YvhxGS4qnwzB6LFe0aQC8kzQbkT7vQ1m+Mep6ABTU8Dfbs4E5AWCArYQbQ6arKOZ1ud7hzo4Eiy65hwIH2t1ap2UgSa0ODCBFl7w7ZmWhUgdnQqOPICa7CE9IMojejHikxAgmq8aHv96rZ8b7vxDtrfujy4HFJaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UizwnI2A; arc=fail smtp.client-ip=52.101.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UizwnI2A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGXW9Cx8NDnpfAMeVX/UYNooQ/n4h2GUCyVTskFCpnlqL1oWqaMBEsDpn4Zz6ZoIiKCkQPeyxvAl5ha1fb+NR649QDxxtWPh8h8mcX1IjY415BX5Ib7W5DMwkPPJLA1TJKjEqHG6TooGAx5RTd22lsPwUQ61lFb7tPVUG3957l++jA84G+howLGqJa9TqQvjHXkxs+FcgV6YGWbB5fN7mTBPEZgp0VLWXq2FE8GptNXEM12n7ZwVvcw9UyRgolhnc8RD6DyMSCtaOARBl7Ns1R4qri9gxGV5jpXyDC0XfiJvImyx+tD4q+uRiUaubFly3iH4T/BGEc7tPbf9jhLBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lq1q5SbQzB9Goex0X8oCRdZnQhr11HAIC7W1ntyMxTk=;
 b=Yl7yoPHGXKDiS/ue2FoqqIpvGxIes4DZDAzHe5W/JUT5TvKVmiZU0HCMajPmgTfdIhHHxvB16i3m9N92P5GKrrkaUsSha1jNnkwRq7tlZxNJ0ujf2UJkgB3FMXF8hKdR8V4Sf5AScEbkITfn0MM/H5z5mKRrTK4CEHdsHub6VdCDC9h0208VBGVmPeW03ib4zh48QKqYebcm4E9+i4HlCWPelbKrwns0NiENHoFOeXRZUazOOe1icjasohuIfgBbiNY4l/hrfyqmYXFug1fy9vTxKxt9syiy2rBnnjDbByLvQ+BaM4I/IBybx/tvV6H+3WP7rgpf3a7kMROBQi+q5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lq1q5SbQzB9Goex0X8oCRdZnQhr11HAIC7W1ntyMxTk=;
 b=UizwnI2A/2KWZGla1cq4MIuGKaMmFfeHc/Nnh1SRHRUL7RlDBlYRs9b+aEKG63BCfuSpnuLctb2gyicx4acKYEcIeS8d8j6TMN+GI6BDq7QnTY8UmaadLAxz7+Po0K/Xhmrw3NjKH+MXcUlEVyXag4nbOZkNKpmVgRAfsZBN4dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8849.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:48f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 14:35:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 14:35:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 14:35:58 +0000
Message-Id: <DFYLH8C2A10L.1OS9OS32FLUD7@garyguo.net>
Cc: <fujita.tomonori@gmail.com>, <boqun.feng@gmail.com>, <ojeda@kernel.org>,
 <peterz@infradead.org>, <will@kernel.org>, <aliceryhl@google.com>,
 <a.hindborg@kernel.org>, <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] rust: add AtomicFlag::get_mut
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260126081013.3616346-1-fujita.tomonori@gmail.com>
 <DFYHRY9IB2ZP.2Z70E6XMBMEL3@garyguo.net>
 <20260126.231305.17475057092261789.tomo@aliasing.net>
In-Reply-To: <20260126.231305.17475057092261789.tomo@aliasing.net>
X-ClientProxiedBy: LO2P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: ba120618-c19a-494f-d1e4-08de5ce838fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjhaVUdPYjlTWHl6Qld2OU9RbHJRN0l5ZFFxRHVHcG50KzJrT1dDaDNMVHdx?=
 =?utf-8?B?SngyZGtnOFlHUVlZdGZ5Z0hTcU5XSG5SbVVpOWxiWjB3TXZqMGtrSzJEL2gv?=
 =?utf-8?B?ZjBwSGlTNG15TGxFY1N2UU9DWUdrRGpiQ0dVNWZtT3VPVlNZSXltU0dwRURv?=
 =?utf-8?B?MXNRSzdPaFR4WlBEUW5FaTl3bkZ0NEdzTEtrRlNZRGlxU2lESm04Nm9OYTlo?=
 =?utf-8?B?Nm9zZTJlcE50U1VTZ0J5YUZnbzF1aWowck9QNE1QQzdxTE43WFZ5TEF4azJi?=
 =?utf-8?B?d1pSNGV4bU1OWnUzbXpmc2phOFI1eWp5Rk5xSmFZdnFGclJpeTlyOUttZTNZ?=
 =?utf-8?B?M3p0TFpETGpGMWExSlBJOTdUSUJLK3MzbjJISzBHdGoyNGFubEh3M2gvRVVr?=
 =?utf-8?B?bitkOExzTlIvSmVFTURMaEhVK1lvMjQ3WkE1T2pOdld5U0Q1aTJpWDk0M3Ju?=
 =?utf-8?B?Y3h5dm9PZ0RBWWlzTVZ1UFkybjMrTThBQjg1Mk1jNVZGZjhmQ1F4V203R0RY?=
 =?utf-8?B?MTVHRFY3ZEhUVnV2VE5kTkRjNE4rOERCbldpanhkQkV4TDZQR3dHVXh4Nk5m?=
 =?utf-8?B?eGRTTCs3Vzd3RUw4OENpVERXeTZKMjdYaVdOTXZyR1hjNHhpV1VpOXIxMUUx?=
 =?utf-8?B?dkVUZ25MUTJoOE5Xc3MwUUl0eXRZRTNrSlk0QW9ZendNcVdSdC9TYkVrSnBn?=
 =?utf-8?B?NncwVzVhQkVBZDgralpKdnIxZ2V5QlFOdGpwekwyTkFNUVFpWlBMeFY1dkFT?=
 =?utf-8?B?ZmlRU21rQ0RlOW9oWG9mV2Q5SUFRUmJLV3V3K1dmdFd5L1ZORE5Pd0hWZEQw?=
 =?utf-8?B?eVJvN2wrZ2FmWDFFQ29kZnlDUUZ0bGFMT0NWY044YTlIWjdON21kZUFxaExB?=
 =?utf-8?B?SzUza2tLMTN6NUZEUUg5L2VVY2tvUnFwMjJGS1dJd00vcGZWRDZVZ0Z1UzFt?=
 =?utf-8?B?SVlJNGh5RklROFRDeWVob2ltRUYrM2gzSy9HUnUwTGJnVytPcTBjYllJT1dm?=
 =?utf-8?B?eXVNR0U4R0x1K1JyamdmWVVtd2s5QSswOWZlVnhEQ05qQTRjbTBISC9tUm5G?=
 =?utf-8?B?YmRISGNydmFRaHFxTlNnb1hlTjQzUWlCTFdPRWRKZlZlQVJGWjUwdStsNlBm?=
 =?utf-8?B?aGhZdVg4REdHeFNkS2ZHN1Z1RTdYOWpycS9nYSt0U3pvS0FwNGNWKzdBME9U?=
 =?utf-8?B?T2NTMC85blhrKzhmM3RpOG00UElvdkdHSmczcXlLR0l4T281RXpNdDJzQWpp?=
 =?utf-8?B?L2UwZm9Ba2N2ZUNkR2g2dnJkanlBUGtkVENob2p5a1FJcDcwQWUwQmN4YUhT?=
 =?utf-8?B?QTdGeEVXU0o4V0lQaGQwSlF1bGYxaHNVWkEwa1JsKzRDWERNTTY2a3RveUhI?=
 =?utf-8?B?b1BTWEVJR01iV1JXK2svdXhwOTJzOUY3RW9VczNsaFdMU3JjM3dSS2xmYWQ0?=
 =?utf-8?B?M2NzRnA0bG56REZlL0kySFVvYlQ2dzJWS1o4bTRKdk9JcEFMSktnQ1l6MW8x?=
 =?utf-8?B?bHFPdHFTazRLWXZBdyt5M28vdHl2L2dTMFpjR1R5STFuSVFud1l3SytMNWpO?=
 =?utf-8?B?cmY0YkJzMmFiZzNkcThGRUEwenZYSU41STQwWDRjRXAzdVhJaG9ROXFkS3Jl?=
 =?utf-8?B?dktrZHpBdXlPVEZlUjFyRGJoTk5GOHEvcDlycDZwcWQ2TjRaRnVSRk9jZGw2?=
 =?utf-8?B?ZlFHSlduN2xFT1M1OWJmVWoxQXhDZmpYaCtFSjBvUmZ6VzlpNGZmNlE3UjQz?=
 =?utf-8?B?b0kwZ2JxeVlhZ21uNU5HOEpwZHBmYTRWVzZkVDVCN0VVMVFHdGlWSldpYXZx?=
 =?utf-8?B?Wm81dDVwUC9DY2N4NG9VWUhjdXVMaXNKaEpWZlpDaysya0dvbEw1UXZJSVM3?=
 =?utf-8?B?ZVozbk1jZlJtT2xjNzVoVTVDTjByeEpiZlZTb05UbnhKMjNCVlRmelM4ZTls?=
 =?utf-8?B?dXZDTENuOUIvNkM5cWx2RCtZMXN6MXY2S3AxQnR5ajc1RHIwRDltTGM5Y25Z?=
 =?utf-8?B?WDF3WUs4Um41S3FjWGFKUWt4VGFLc2I1NmNLVlJCWGVldUNURWZiTVRVa3o2?=
 =?utf-8?B?NWNiU1htS0lMeWZtUUdVeGJqMnpLUGhtMmxzcmtEaEM4cURVNVhyenRVcFZl?=
 =?utf-8?Q?xwN8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGE0dE5IczltY0haMmlINWl3NlBwVWZzMW5ZTFZiNCs2ak9lSlI3d1pGZE5j?=
 =?utf-8?B?bFZQeFdhMldUb2FQNFF5bEtvV1dxRE15Y2w2WWtCQ2hnaktkNmRqem96VXN5?=
 =?utf-8?B?WmtQQ01JVXpjTmdlYUVyOGNNRStWV3hsQ1dUS0dqUDkrNzd4TDlueEtWSXgz?=
 =?utf-8?B?bE10cXhNY2w2TXpVSmdidXUxakI3SVhiOVVNSDVvSndiT0FwS1BjaGpQWTUy?=
 =?utf-8?B?UWQ1Zll6dzNkb0hnRkNtNkg0ZElwbmtqL1FkYUFOMVhVQVExeGxlb3R4eFAy?=
 =?utf-8?B?cFFsYXM2MFZNeXlwRXdWZ2lHVnZXNWJHbnhYcWppS3lMNzAwNDh0U09xaith?=
 =?utf-8?B?WkVaZThmbkxwWUJISFJxZEltR0xmWWI1UlYwSXpuRGVRcmRUWTdRMm9haXZI?=
 =?utf-8?B?SFNvNjY2S0lWSU00bDRlcmNJR1BrL2hqaGZIYnlmK1pMMVB2bVFyVytrK3p1?=
 =?utf-8?B?Z3NtT3liMmlnMnpUZ0RvME1YTkNFdjRHZUo4Qy9UTW5zeHNyemN1YjQ5WDl3?=
 =?utf-8?B?TWFtY2lLTU42WXVnaGxLR1ZXL2d6RnBzWiszcm9sQTBJVkVqRC9iZWhTNjBv?=
 =?utf-8?B?MElHYTBGM21nS2s3eVpvelMweW0vMzk1MjJwTHVUSlVGZWJ1UXF3a3dBbjla?=
 =?utf-8?B?S3lQUGtHd21IdDIzaW9BYlcxa2IycGxhbE5rKy9ZcTJkVlM4bUZEaXlxMFhS?=
 =?utf-8?B?NVNqTitvVFh6ZFg0Q3pTc3lJUFFZQmhDTmFDamdvYXBLK1Q3TjgzbHNyRy9q?=
 =?utf-8?B?Vlpuak1LTEpjUU9PTDllcG11cjljQkNhRDVjekZKbm5lQ3h0QlhGd1c2YnFr?=
 =?utf-8?B?bDB0TUthSE1qTDZIdC8rcWozOFl5VFZqcjBOQkFGU01zbXErNkJtRXIzMkpN?=
 =?utf-8?B?UENLeFkvT2hiWSsrVTBucmMwTHhPTm9JY3p6elJZRlVxejNTREREUDNxbnV5?=
 =?utf-8?B?dzdCekNJV3FGaWw4QzQ0NmpKRnZuYWVPL2xobmZpNkNXYWlnRjEwMEpFVVdr?=
 =?utf-8?B?Uk9mZDJ2ZjNwbmRSQTJwV3NGYUtWT3VqSnVvR05yRTF3eFJKTFNZcVRoVURS?=
 =?utf-8?B?NGQydHpnOGJIb0NmNWpyLzI1RDhScE5vSTVia3FaQW1aYWJjanl0RWFsdTdh?=
 =?utf-8?B?ekVydmwzdnNOZGZObTk3SlUyT3NsNzBmeDNTbmkrZ2ZsTUNpZjRpaEgxUUJ4?=
 =?utf-8?B?Wm0wTXFzVVk4bkkya0Y5Vkw3UE80V1ZhaytwalBmTU1BWkJYNmNIbUhHVlRB?=
 =?utf-8?B?K1NNbHZJbUhEcVlGMGxHTzRkM1hsZ2pDaVV5d3V0cjlWbVNuWHJSTTBFK3Fp?=
 =?utf-8?B?US9pMldjeUtnYkthRGxoWDZlOEdUb3MwdVpSRnc2QkhmT0ZHTXBlU2Y3dnV6?=
 =?utf-8?B?bkxUcFNWQlRvT2s5dEoyR2wyOXB3bmxQSjluVmlTMVUvRzNsbzYxY2liV3RV?=
 =?utf-8?B?aC8vZ1NybkxiNGY0NE1nYURBbXFEOWhYekE3Y0Npc1h6SGlHNHRhMGhTSkhS?=
 =?utf-8?B?NmtwbjdhcmhxYlRXUThrS3Jha1JFMi8wNnJFK3Z2Z081TjFnK2djQi9IbGRw?=
 =?utf-8?B?WXpGbGhTUmJsRjhVRzd1akVrejM0WHFuT0lqcDdOaVIvc0pWRHNGb0ZMVjNo?=
 =?utf-8?B?dStUb3JvLzJFaldKK05laUJIcjRQMVd0VkJiZzRCZVBqRkNWdTg5MmEzWW5v?=
 =?utf-8?B?R2F6Ky93RkJKaWtrMm96RmdMYjdrY2VRMWZHYmtSQ3Zxanh0UnpVRm9MVEhi?=
 =?utf-8?B?UTdPZmZxVWJrMlp3eHh0S1Z0R1JDTG1pcFZtZjU1NnNxREgyaGlURXlVZTBh?=
 =?utf-8?B?NDRuYUR4cTJwYnRUYmlEWTdSUzZXUEtIRlc5SEgxdWFldE5seXo5Q1ZvUHBB?=
 =?utf-8?B?bjdoU084Y21FNjBDN3BPcnBtNDhqUkxIeDNib2M0Ui95OE5vdU93SjZoTHpY?=
 =?utf-8?B?cE1NVFpYcWxPRDQzeFFaWFFCK1hmTERwOHozTG0yRStqaDJxWGluaHZVTFlZ?=
 =?utf-8?B?aFJhY21INE0wWU1wdjJhV1BzY2lZdm5sb0x6enRwYmhsdUdGM2lIQURaS2ZF?=
 =?utf-8?B?WlBNaWxBdUlqbVdGaVZ6U2tVZTA1ckxlU1l6QjB4L3AzMGJJWGRjM1Vab2Rs?=
 =?utf-8?B?U05mdTBtYTI4dVJETTJSL0MvUjgrUEdnR0JpTUdna1JwbmxvZzFPaXNwWlpw?=
 =?utf-8?B?TlFHTEg0SzZVWjVzVHRYU3hRVFBVZkNHaEl5em1ueW1HTk1DMlhxWlpCdjk0?=
 =?utf-8?B?TXpubThrdnJoUXhSRTVxUUw1SytKRkZtRnhBM3ZhZEVxUnE0NE9PVWF5L3c5?=
 =?utf-8?B?Yzl4eFdiL0xadm4xRkJiYXB2TkVydm1vTlNqekswemk5Y0VZVjVaUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ba120618-c19a-494f-d1e4-08de5ce838fe
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 14:35:59.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To1X/KzHRWTGdKj/2QUYtbLJ47030PePtdmCaNxk2fsg6mUGFaq6OJ3/IG9vga5WwLtc5oy13YltQfErEFwblA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8849

On Mon Jan 26, 2026 at 2:13 PM GMT, FUJITA Tomonori wrote:
> On Mon, 26 Jan 2026 11:41:54 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
>> On Mon Jan 26, 2026 at 8:10 AM GMT, FUJITA Tomonori wrote:
>>> This series adds AtomicFlag::get_mut to expose a bool API under exclusi=
ve
>>> access, and switches the list atomic tracker to use AtomicFlag.
>>>
>>> v2:
>>> - Add AtomicFlag::get_mut()
>>> - Make AtomicTracker use get_mut()
>>> v1: https://lore.kernel.org/rust-for-linux/20260119231757.3460885-1-fuj=
ita.tomonori@gmail.com/
>>>
>>> FUJITA Tomonori (2):
>>>   rust: sync: atomic: Add AtomicFlag::get_mut
>>>   rust: list: Use AtomicFlag in AtomicTracker
>>=20
>> Hi Fujita,
>>=20
>> I've not had the first patch in my inbox. It appears not to land in
>> lore.kernel.org either.
>
> Thanks. Recently, sending from my Gmail address to vger.kernel.org
> hasn't been working as expected (e.g., long delays). If it still
> hasn't reached lore.kernel.org by tomorrow, I'll try sending it from a
> different address.

Hmm, Igor reported something similar too. What's strange is I am addressed
directly but also haven't received the email (my email is hosted by Microso=
ft
Exchange Online), in addition to vger.kernel.org.

Could be an issue on the Gmail SMTP side?

Best,
Gary
