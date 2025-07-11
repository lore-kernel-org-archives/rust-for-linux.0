Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37A2192E3
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236295; cv=fail; b=KQnZcxaHr/VIC022/WyjEhn8H8ykR20eC4L4AWcZ6yhi5B4s2N1u34W12nOczU+CCgIzvC3ms1hHU89LR7qNEJ3IPOFqbCRPeEtkgQjjNa3SjEu/oKmuQTKL7KhD5FYhJfbR99jqxMGBwi+mY+fitZYJCQM2ThtqEyo2JCWGDRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236295; c=relaxed/simple;
	bh=rEYRuAaX8Z14m3QjnaljTOYog6Y8ZsXYYXVEy2POh6c=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ihfvztCnVvi7094VUdUs0S5SvKSsEn/mJsloRCHo9SllyAFevdAJrdHPGFGCvk13PdMidEoR4k+h/hQRvb5fX04K/DJbnTw6FgB1btrzmKw7dMnkYiIedBL5IN8SBj3xF1Oh+DiIRuombo+QJvbI9mDz27Cxht0f2SX/8DAPyz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c5oEdje0; arc=fail smtp.client-ip=40.107.237.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c5oEdje0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTRJ2ikbSZuJAqJR7wfLpsUeR6B/kvJ6/HFMJQZhZ4orSatelp0nxOBK6/uZObpg4Xte5o7P0QpmH7yeP4e5aoMr+to7mvf2cUpzAWmAY00kV4iSjUbPsYr4zT9rIIj9vA/A5FYNirpFLbhrGaBsefEHkbYs8QLmsOP3/04V7i7dUx4HEwcW5b+uVBg7zzkY9zRzoCbPs9grDnnPSVsVWMX6oGnN1AKUg3HPFtc6/3mYMpJLknwi7ZLG+W4m9L+qkjSP77pwdxLUIW3eHvvlO/wz9AWfJbwRCem5T4WAY+A22D3nzEoP4pJ3CjrX6/e36JuC1cZPlvSK/jx46u7P0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rjcQ8pbIoaai+SjvF6G+fF5BkaQSApfACC+dBxgGsI=;
 b=FOdNVX6paXxd72YRjldwaGFvWW348Q1wgVqgebU8l8w/yTRWKQWOpufUCISlLvLFlYhNT2PaxG7Ux6GA9CHk9ss6vaoIPQ7bGjoUpup3n8nbDarZdK/FVIGiFS8wblNRZhkJdD314J4KvtMvCquqbNCPFJDXOehIJDOvp3YaCaY7F5e5ZCdjTsSZakVp+T66vpf0gxGwYr0VtSSfVNI92FtyHNpe0ZBk2P92ivA+9UJIuyodPKQJSTrOr3RcH80y2GzcdGQgnhxda+RQxSDZZPReQ83Iu7wcsXlhZyD6RuHMdIgjznXMXx0sTuB74sh060xDp/Uw46sC9kk0c7eKEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rjcQ8pbIoaai+SjvF6G+fF5BkaQSApfACC+dBxgGsI=;
 b=c5oEdje0dLrfrtgDGZx4wtrYkuuI+/d5WmhuHLI4Zz/fmNsFaX65WAEx0ga8kviQ5xHOcum/7iIjQdtLiSqjVATYNbmf6GAd0oySOm5Xr1prPNEi3HDBoB3B6oBb9oOxUFlkr0clwpWHrZXaxVL3hEenNMp6rWbEx3aXGK8XOU7D3trAqJvoFWXtOdNlTG/lbkoQrhuJLGsxOH4gPDHxw6fKSL+SMbcmDgqnFLo80bEhz6XrPJURC4OZZTBY0fVayteUPX0AoVgcUcq4fB7cbGY46rkGsXdhJhUXL4ybmNvGqR4XCR7TkAs+3PRut2ct910Zo+qCSseewA2SiL/Myw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY3PR12MB9605.namprd12.prod.outlook.com (2603:10b6:930:103::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 12:18:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Fri, 11 Jul 2025
 12:18:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 21:18:04 +0900
Message-Id: <DB97X8JAJFI4.3G1I8ZPC1MWLS@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: define named constants for magic
 numbers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Quaternions" <krakow20@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250711113327.39201-1-krakow20@gmail.com>
 <20250711113327.39201-2-krakow20@gmail.com>
In-Reply-To: <20250711113327.39201-2-krakow20@gmail.com>
X-ClientProxiedBy: TYAPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::32) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY3PR12MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d4aa78-d0a8-49d7-2a59-08ddc074fec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1VSL1NuUHFLbEwvcVFhOFZCNk1Eakg0RWJyL1EyNU42T25CQ2Ryc0I0VkVB?=
 =?utf-8?B?OFcxN3hvalR0c3ZHK2dZanh1SGlTK0swaVNXVXBPUUgzeDNWeVZoQ0NTUjUw?=
 =?utf-8?B?ZWpaSzk5amI4YUk2ODZlZWVUd09XOHF2dklNRmVjekVGdGJFSVVIYk80dk1I?=
 =?utf-8?B?VnRLSG0vMjlGUnBkcGpGbHVVTEJFNmpaUEdiYlZnaGx6Yi9UV0NJeVJDWE9p?=
 =?utf-8?B?cU4yZndobmtEK2lrMXdQdWhWbXQzWGgyTVcvKytjUE0vcGR5M2kwU2hQZDFP?=
 =?utf-8?B?akJuUDhKL1BUd1NDUEMvcUJrcXd1a2Z6bnBDZEgrWGgrM0FiZEdFWlBCdDYz?=
 =?utf-8?B?S3poMHRldnFyT0VwSXE2SGpFM1FtU24vVVNyN21JZFNBOURwaTBEbjRxTE5y?=
 =?utf-8?B?QU1RbWcybjZDSkM3OFJxK0J4d05xZW0rLy9ManFndkltcnBtTXlvSHZ3aWgw?=
 =?utf-8?B?eXpLdy90Wjg1S25peFFnRm9raDUvN1B4T2xEQVhvUjhVanVYUTlLTjNsMWxw?=
 =?utf-8?B?MWR4NWJLczhDRzRKazNyNmM2dy9MSVJGUDBzS0xQZDIvS0hONklha1hUM2Z5?=
 =?utf-8?B?VWRFUFF4cHltMjBmR3F4UWp1NW5MckhrU0w1VzBuakVPZUNaQUlDMWc3NlJp?=
 =?utf-8?B?WW5tL0pIVXFXU1RpRGY5Y3NuQ2FoS21jeUVrK0FWd1Rscndjb0ZjblZya2w0?=
 =?utf-8?B?dDRSYVBtcDZGUEYwMDNOSitDaVN3cThaRGlUUlJsbktGeDdxM3hXSHpHU2pi?=
 =?utf-8?B?SmNSZWlQbEZOMmVPcGNMN1BGbStxdjMvNzdjSm9pSjZYc2Q2eW4vRDJ1YmRW?=
 =?utf-8?B?WHZhVlVWN1NDQU9UTTEzMHlNcVBTbENWb2dWNE42eHM2d0YyUzBnMFY1TXJl?=
 =?utf-8?B?MFNNdk1zUHdheEZOZDFjNGFLWnViaG1hM1B3TkN0NGJyU0gvZnRpdEdoYU1t?=
 =?utf-8?B?eFhwWHVOb0ExV0JSNGpEcUpVVGVrcGtwNTJFWWQ4S1lhZVM2VlBxTHJ6bUlL?=
 =?utf-8?B?bDd3ZUJEUFpxUTRyRXlIZkdqbGJPNGJWMWsrUjNqNXptbjY0SUxPM1pWZkpI?=
 =?utf-8?B?T09oWkFnemxaaTlMVzg1VkdBdjJXbENHM21MVDg2MVJ4RVZmZXE2Q0dnTVhK?=
 =?utf-8?B?WjJiTERYenpHTlZITGJadG1SUGFjLzZ5TkhLT2o3ZUJMbkdMNmRWQWVmWUhw?=
 =?utf-8?B?VDdjeWF4V1o4VzQ2NDlTdzNXNnZXV0g5OXYzZFVqeTR4T0FXTEVuYmhrdkZC?=
 =?utf-8?B?NXg5M3JDbmw0RlcwdlJHelNFS2R2RnEwN1ZQU1pvcEFvVUV6Y1VzZ01lSHNp?=
 =?utf-8?B?VThyUi9leHNXNjBHQkp1TDhKZmYxcXkrL1F1Y3lUcmY1UkludTRuQk13ODVX?=
 =?utf-8?B?eFFjSGpqaytSaVIxeERXamd0bmJUbXNacVN5SU95b3AydlhtYU0rbDYrdlNK?=
 =?utf-8?B?OXh1NVY3SmlqeEkrTmozWEo5VzNCOVJySE9NWkhhUVlGUEt3K2RjTXdxRlJl?=
 =?utf-8?B?bFQzSzJzM0s3U0NGMnpsbU5Ibkw1R1EzT3Z2b2VWR3BRQ1YwYmdwRGllNUpv?=
 =?utf-8?B?NmY2Q1VoSFdRbGkvZFovdDJDcHUrMzhrK1dJcEdmWWozNVFkTkJnZlF5T2M3?=
 =?utf-8?B?cCtxemI3SDVCL3VPWVI0L1ZLYnRxVzl2a2I5UW5hT28wWUl1Umg0VjhYajZk?=
 =?utf-8?B?WDdicWFFR1A1QWcyUWhNUFpRZlp3ZWFBbThEU09KWXZNblU4TEYzdGxQT2Zi?=
 =?utf-8?B?ZEFDNEh3eE1Yd0Myclc1ZEJtNXdjcXU1Z3daSjRzcXZGemR2a2lTWnVobUhi?=
 =?utf-8?B?R0MvaVlFd2pQZ3RhbE9YSkg5ejgyN2o3cVJJSFRzd1RvbUpVWVVpczBJZG56?=
 =?utf-8?B?d3IrWGhORnRjSk1CK2h0di95UFJoOGdkRG9RaURSeVRCSEVFQm1mMG5tZVZj?=
 =?utf-8?Q?/Wqbz/DVI0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1JnQklWVXl2V3daMnAvOGVjUEhQdFNwVTl1dDdPWXh1elFaOUZyRTFiNXpJ?=
 =?utf-8?B?U2RFZ3Z5ZmpRVWZFWGpRRE55SHZPankxWkNiK3NxQzEwTHd2N1RuL1c1TGsz?=
 =?utf-8?B?RWt5MUx6OHNGM0FCWS9mZ3dHMEJuMnYwU3VVR2Q1aHFHOVRQZWRDVENpeE1H?=
 =?utf-8?B?OUJBNjY0M2pNdGtMMFl4Yi92aFhXWkhoN0FOSkYxa2lMMVMvdHVaUElidWlm?=
 =?utf-8?B?S2pmMEEzT1dRNmVsbWtzVkU2UVJkK3k5V0Nnb1VzRkFvNW41dCthUzh4eURi?=
 =?utf-8?B?RElyaWNrNmxKTUMxUUZpUjZtdTUxdHdPQWFzREdDNWpodkZNalhWZjA4UHNY?=
 =?utf-8?B?YkNaS2JvMSs1OXZJYTl3V2FGWjVhdHRIWnMyUWVVYllmT2ZkajhkTUpzRFQv?=
 =?utf-8?B?RFFXY0VIdGNpMVlNMklsYWdPR2xHNVBDc0crS2hIbDdlV1JpbkY3dzcva0FV?=
 =?utf-8?B?Qm9yK2R3WXJsU1oyRVpjcDJ4YnhMWGxvYldRbWZSNU1FNVBJTVVyRXZqSTRV?=
 =?utf-8?B?cjh3QUk3NTRYakpLcktPc1Z2aVZlL1RUZGxJRHk1MlpKeXZsNlVzS1VyN1Az?=
 =?utf-8?B?NkJhVE91SlF1TVZxbWt2Q3VBTmdkczVYZkdkYW82SWQ1bVJFUTJGNk9vYks0?=
 =?utf-8?B?eGRkbXhNT01uYmFVRDRROHlXdWE4WE9YM0FUbU1URzJPTjNERk1kVWhIYmJv?=
 =?utf-8?B?QXR2N2xuTkNRM0lkMGxzOFdoTndYRDR6ZGtuRllaYVZhdDZxZ1ZaakZ6U0hs?=
 =?utf-8?B?ODhNc1lwdDY4RHBKWjVza01QMm4yd2hPZkJ5Q2ltM3E2ZTNRMGVxdkd6dzBR?=
 =?utf-8?B?WnhLZmpLVDV6OXUrV2ZlSm5pbXV1Wk45RVdvMjJ4UVZVeHM5VmpKeDZvUFJR?=
 =?utf-8?B?VFJlKzM3cVRCMnRUajZibW9mY1p0d21oUkdTY1Y5T2hHV09zd2hRbnNVcUt3?=
 =?utf-8?B?V3Q2TGRZbmpEbnhibS8yY3ZZWnRZUnJDWVlrU052RGNYNklhWmwyeEN1N0dT?=
 =?utf-8?B?RFdEM2xmckJTWkptWGJab20zelhOZmk1RFZZczhPL0JJQmlvOC9LejhIUzVo?=
 =?utf-8?B?SXgvTVV1Szczcjk2cndhbUx4Zk13ZnA5TWpiRlJBN3VCS1ZxVE5VbjZkYy96?=
 =?utf-8?B?WlR2UXRFdnpBV3Y3UHd3SW50TzkzV2JnZjBEYlQzVGU3VVA1N0N5Tkl1K1JQ?=
 =?utf-8?B?TmtYQzBURDlkOC9pRTgxNTl6N0paYnUzRUpneWV3TWpSYWNiTE1VM2FOWHM5?=
 =?utf-8?B?Z2FyTlhJUGk2R0srSm1BN3VpeFBLZDRzNnlEdUFxNnhqYnkzWFBaRWxxV1Zy?=
 =?utf-8?B?c25OdlRMNnlPS0krWGNvSGozMktaTXFuUWFxMXpEb2ZENnJBYVo3Nk9adlor?=
 =?utf-8?B?MVJvem1rbmlvNzFCbUYrNU9QTFhMVFlqazRzNGh2Si9YdW8vMGJJM2s3bDJz?=
 =?utf-8?B?ZjRSUGFRd0pxRnQ4UllGMlJ2emJtVkViWEVwVjhndlIvWTZKS3JaNHo1QWJx?=
 =?utf-8?B?aC9XcnlPTEVlUmsxN0FvL1RrbmtPdDBxblN5bU5IUk13NkNUUkNkc2xmeW51?=
 =?utf-8?B?a2N5N3BCdlc5UHE5STlXQms0Vm0yTnA5bFc1OHJWNmN1ZGkycDlUdFU3OHF5?=
 =?utf-8?B?cDFoYjRJWTNxVjd0TVBydnJwMElGMnk2ald5YnpUY3h0ZjdpbDVTLzVMalR1?=
 =?utf-8?B?dllNejBjWG4vcVJucURBUDduRUdyYXlGdHVzTEhUTkZrOWFXbUt1a1JDaTVj?=
 =?utf-8?B?U3FUcVVtYW4wNFRJdFJqbWgzNVlyVThIMnp5Wkh2ZGRtS2ZqK0czVnF6QkJh?=
 =?utf-8?B?KzBPSTVtN2NScC9rNkw1L2h1VEx0dmppNVJtM1dJaDdmRFRSUnhvcWxiTEM0?=
 =?utf-8?B?QXdCbzdwWTlLZ3RoRmk4ZFV6dngwOE1XQWdnbFVHMHg3MWdzWm4zMG5YMFZT?=
 =?utf-8?B?a3VQRmR2cUxLWnJBcjJ5dzJqUjVPYnpEWXRFYU1xUWs3V0ZCQUprNElTcFVY?=
 =?utf-8?B?ZXRQMVdxS2duZEdsanVUWVFyUW9ESlVCSEZVL3hnOW5PdHZPTW9ldmZ1YUF3?=
 =?utf-8?B?ekJFUDJEQVRYWStPKzhTM2oxMk1kSjJ6Zkk3WlRtNXdoY2RobGxHZXk1dDd6?=
 =?utf-8?B?YzRjQnZmMHBObllmank2YjZnd2dzVzhxbVkzWUU0eEhRTGs0blNzK2lsdk1H?=
 =?utf-8?Q?Q4Nw2H3l3YXD9g14pX0iFSGyoJLRYFOyaRL0cQfTepp4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d4aa78-d0a8-49d7-2a59-08ddc074fec2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 12:18:08.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsF8m2tDbWDMs18VE8sZ9Hv/ZUChwG6KHXqRd8b7pb7Zo6GqpQyeRNC2ZyXpAXUNyiEyMX34S01SkMO3urN4iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9605

On Fri Jul 11, 2025 at 8:33 PM JST, Quaternions wrote:
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index 5b5d9f38cbb3..d456c494374d 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -364,8 +364,9 @@ struct BitHeader {
>  }
>
>  impl BitHeader {
> +    const MIN_LEN: usize =3D 12;
>      fn new(data: &[u8]) -> Result<Self> {
> -        if data.len() < 12 {
> +        if data.len() < Self::MIN_LEN {
>              return Err(EINVAL);
>          }

Mmm looking at the these functions makes me think that maybe we should
rather:

- Make `BitHeader` (and the other structs affected by this patch)
  `#[repr(C)]`,
- Wait until the `FromBytes` patchset lands [1],
- ... and simply implement `FromBytes` on these structures to replace
  this code, which is basically a little-endian deserializer. Since Nova
  has no plan to run on big-endian targets at the moment, this should
  work fine, and removes the need to define constants for the sizes of
  these types and use indices that are always error-prone.

Or at the very least, we make these structs `#[repr(C)]` and change the
implementation to be done in terms of `size_of` and `offset_of`, which,
while more verbose, also promises better correctness.

[1] https://lore.kernel.org/rust-for-linux/20250624042802.105623-1-christia=
nsantoslima21@gmail.com/
