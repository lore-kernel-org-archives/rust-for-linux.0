Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D2135AC31
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 23:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419694; cv=fail; b=akzRFJbmrT1A7JeqQgWcmrAhQUgy+7COVyKEj2I9fg6HpLOEYaB+b+pgJcy1Fqc31/5GyIFgR6Na8aInB4gFJxua1KWldWqsU4HTp/tbJ8y7h45e5HVMweTf6zlv6wdy0I28sM22BWsP59a4UVu/7htGVnUmxfgz2B7gsJhdJQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419694; c=relaxed/simple;
	bh=qqN1f+9yF7HObUIwIjBLCXSeeQGyHU3OZ/lkfYi7BqU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=H0A/z6rhxuXk2OABa/r0BQJ3Rd+1AcwafkvjeBjm7tMvTra60NlJoxhT3AoOvE+KDmvRXFoYdsMqMyAa+MJHIh2s64cuYuJkIqyr3cnlgOpP1d8Bu3gXYPZ1Wm4sv85mKgv6AictjVNQeLh6XXkef/pif5ORSlV1OJilHeuG70M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fe37k0t1; arc=fail smtp.client-ip=52.101.53.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fe37k0t1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fc7Y67h0fuCXadzuPW+m9ieSGHPMa0m5NvqkUwcZ5m/5OZhM3St5Z2GborytbY44EE6jvkqnYfHa5Azj/t+x+T8DWp4ey/IV2xW1A/nKkFlgxg/EkRN/RYNj/THEnF+wABvEc50azsUIMjHcch0KVEc6N6H41ePO0ckyZ1GypAfMtxyaB/4BUTsan8Xqx/0p2MQaW18ZIIOiuIEScswJnJdY4BaozzHIbT7TrLWHwz5922woK93we1mGxiuFpgjtLcKXgXdrZtATuQRidaFo7wCZXG3OqLMI20/BlAu6ueiN+Qfgdd7PeB8/3tVkhQ9bWVp9yFw/GbXwufdAZmpdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgomsN2a9vejmU31mgPe81gsmJmNI2VNl6b/Q1ujMKA=;
 b=EVzbkAyU1kX02nKEERhUp01cPJD7IzruqtNbVcxH30zAYpdnTcecXGWitBdSneIzCznAK8oOqk/A8v5Kke+TSJKRsqfmT79zgc/6/Zl3/IqOflmQAfH/FmaX1rbZSJw64F9wACE8m9m9PTl81W07JXS4kFcHBNs+UiilKB7v1hxUQKP3DZ6EipCz0mkFnT7qCGnUffLqu83ealOndvLRH7JD5Ht0qs0padXGuORbHQ6MF3CMQdaXoELHQNTC2ISLRy/IDMw8GkhwS7kWBGbLtj8SakKO2Au6ga1j3nlxT+8ND3tGK7lZujirkKeP96qx44MwPQhV3ZlKRcZqKx7ODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgomsN2a9vejmU31mgPe81gsmJmNI2VNl6b/Q1ujMKA=;
 b=Fe37k0t1kgKLmqSk1JNgGxZ90GFSuL9OiB4imOH17p5iCSRMWREc1t3ve1jyPzO8Z5IwplidmZdyhCCyEeAnr7wB9f3+VNzdbLwTpfmEbxP2ArqbEIITRhRVMeKZDVAedzms2obWQU3yyMLjue3KzHjWhBNO6/TQEXnZXIaE2cWNhXGao83YxpnWqY2B2Fk8T0Cb2bhI/OYkFCaz+5HqYZM0oJvrlTO+t+PLRI2eBSZ3nBPmPGC4wcnsDh7k5F92eJPsKpQtA7lR/ShekgseaAVZXrnNDAGKd3Bh5xnVnL3K1HIwlwwu1E+/TS4SRv8pnRQEIrkyHy/ShgHniWKtFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 23:41:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 23:41:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 08:41:25 +0900
Message-Id: <DI56OZ7SO4DK.3FE12WRM0KZ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 0/6] gpu: nova-core: add GA100 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260417191359.1307434-1-ttabi@nvidia.com>
In-Reply-To: <20260417191359.1307434-1-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0096.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a8931b-a3c3-472e-d25c-08dea57fabca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IhUvkQ8IZl2liHJday2F2V2Wx0SN7Q6GtXA9O1l0I+JvEq5WTcFMw3uEwAeSA7R0efnB+E1K0d1SuNwRNLTBv+4i7PvbwoLwAUPtwHrZs5UNr5Lp1id08dr6xVxsWMKCsH8xaJUq7B1aQJXo+DipbysLAOGLKghs4BarsECQhTfMIysUtEccuoTtzBTbnawy3RQN0MfVkEBEB9mcM+JAbmIfbGYpqCq+nnnaIBugmHQljglc9EXv1/56DjiaMq+IAdHQAfKF0faHJ2xehzRW2tdhvMYhWBnsQ6Mb2v67Va/rica17OS21LLthbYhe6FIqBNEsqEXLn7Sel16hRMGHhNOD3fKPE7mOBQxp1fMQqlwoCL8Whn+/StAr1EhkuFgSJzxQqpDCJPTS7tveEgNh/uSzy0k7Z+4/3xhDurvW79n+fENpr9w5q7LzlsGTFuWKoZWZ1Bf+pYeAbeZJNOU38++KSHEv/B/8gOlzbrJCe/l6VXzbdIKQLHviAaSpk3Azqyu9oGnLChE7HJ8eFrlbg9wZHJgQFSW5bJJlZzAiEvbghrHdYztQR++N8LF8bA7Jp+coMbgobkMIqOdMIsOrGleFReiNndNBTZMQpcX3KmPjFptBc0p4MT8DwUFo49B6PQLuVn7dRnCotb0Zy3X3faF1sD1SLVGrO9RV+c6t5Xtwc6ShZTSBMP6GQVovRkqcwORV3KBgWHAiric5uGh/6MkDdcfLf6pJgxFSCB3dIU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzlYVk9jbkZBZFpYUUpkd2lZWFZPR2Vtay9Xb20rbFFJNHpGaEdFeHJBaENi?=
 =?utf-8?B?ZlczOXZBOXMxZUdoZ0pwM3UzVlJHMGFQL2QyUFc1d2lGOVVTeWYwSlNXMDZZ?=
 =?utf-8?B?dk9QN1U0eDhjWUJpWWNHbXhDbzBIT1dwUlNkdHpPeXB3OEVYWDhCMnZpdFFH?=
 =?utf-8?B?TVFabGNna3pSU09ZQldGVWhTU2tXcFdEUmc0WXl2cFNXaXBVSUZUQ1R0VlIx?=
 =?utf-8?B?RGRaUjBOV28ybHQ0Qy9BT0N2SHhPc3FneklTSVhyMTUvVUtzT2hnNlVieVg5?=
 =?utf-8?B?VVE1MnNNV1NoM2c3QkM2d3ZQZXFWRmVTaXA2Q0R6SU5XMlcyTm5DNXVwZVlu?=
 =?utf-8?B?T252aHlBdEQ2dlVDcm43VFZsbzBvOENEbWJNcmZhK2NXa2s0MVhvckowNFE4?=
 =?utf-8?B?OXpMZlVIM1M3aU9xV2RBbUs5SnljRkIxTmpSdnZxUW00RzdyZ0Z0em9kZXRh?=
 =?utf-8?B?MkVsK1Q4NlFsUnhSa0dqeFV6K28zTU9QbERyRVVFaURDUkl4K1oxNGlmZGdw?=
 =?utf-8?B?Y2dnUHp5MGFQalZYYUJKRlBRZmtWY3JqUHRuWjdDamw3ZzQ2Y3RKMXhTMFZR?=
 =?utf-8?B?UnZNVTVsRDQzMW9aQnlkSVUxb0lITzF4TERxa3lHSUNkOTlhZ3k0cURKWHBM?=
 =?utf-8?B?Ull2d05EajdlRmY5VWVxZ1NIa1p1RytOaVR5Z3RKYnlkZXhPWExEZy9XUW5K?=
 =?utf-8?B?Rm1sdE94dlFqeHhuUHhpaUEzQzFHcjhPVERpSU4yTCsydXB4c2praGFsNjVw?=
 =?utf-8?B?VlpTMVZ1OGpzYTh3OFI1Ylc5U0F3cUJrM2NaYkRwUldVQ1BQdDhJZTJkRFdS?=
 =?utf-8?B?WlQwVVZxdVVEZ3AvdTJkQlorbXVJQW9GaWl5ZU1seXpzNmxHT2hhK0FybWs2?=
 =?utf-8?B?SlNGTkphdHl1TmN6TFNFSXc2QVB5elp4bk0rYUE1NUl1YnA2aU1kSHFQdUVG?=
 =?utf-8?B?R2Z5alE5ajc4MWY4cnpXeVdRcjBIVDErZ2diSWJRdzJ4cytQSGhHNmtKdDRO?=
 =?utf-8?B?QVdqdTdRQmFZRU9qcHF3bS9TT1h2ZVJ0OWVlQ0ZFY2VIZkQ2OHJib3FHd3BM?=
 =?utf-8?B?VHc1aVVJSmxoZWF5NlZIYnI0WlpzUHNJZHcrYlFjdU54Uzc3WGNSamV1Ly9r?=
 =?utf-8?B?T3h1NnZmeUplSlAvVm50SGJHUDEvUCtRL0ViN29RMzlBR29KTjlvQnJyWHUz?=
 =?utf-8?B?cUQ4bDBVZzAzQnJ6TUF3dUpVQm10d0R6ZUxMTlpoMVpjTmxPckVDL2YwZXdm?=
 =?utf-8?B?NGVBNkZEYko2NXlvV2FxMGxCd0tsUk9EblpOQ0NuM3BUdEVIeUxFd1BRMERU?=
 =?utf-8?B?dWM2emtjeEJoVGE5RjM3UzFWVHhCUGh0bEU4dFYwb2dhU3lWSDM1UlU2MHg1?=
 =?utf-8?B?T1pkOHYybjJJdDFhcmVhUVRrSjJnVXQxRU9lY2dTb0xwbEhVTWp4REwwbTVn?=
 =?utf-8?B?UlI4QXdzZC9uWnNvWGVSQ3JkSzNLVjRlT3R5dWJkakhqL1JNSTRaRFFOT3Y0?=
 =?utf-8?B?MC9MMWtYNis0UHhuU2pZZHVXaThFQlBSYWI1Zi9ZYWdYS0RydHlOTFJzL3J2?=
 =?utf-8?B?eWlYQ0dhdSs3OENOL0kxQklTYkVEclJnS29OYkxBWE1BZkNnUStYOXpEMmZt?=
 =?utf-8?B?MDlhTWVmdUNpczJGQk5rTk44TUp5SU5nOHdNRnFUcHNyQm5odDBsOGoyZHZw?=
 =?utf-8?B?aDdEOFFWRWtsRy9pb05ka2JDRHBUbDdidEtyaUZYTzVScjQzU05pY3BVeFdM?=
 =?utf-8?B?OTNIcXMzQWoxTE8vZHVxVTUycnNpREF2empsMjhrQ0owaXBYSkY3dmdzQmNu?=
 =?utf-8?B?RTg1dnJ6V2c4VUxaOUNPSUFwZ2xKQmFRb1Avd2xWcUFXVXlEdStSK0k1ZXZj?=
 =?utf-8?B?SWJqNk1GN2Nhd0IrVUt0dHFRakhtbk0xMnFmeDRnUjRNS2F6LzVVbFMvd3Vh?=
 =?utf-8?B?b05MZzdBYUpJa2NEM1lXeTNkN3BLckFBWUh4UVNZRXI4dG41U0E2bDdQZVdV?=
 =?utf-8?B?Tmg2Ky9OVDdpaTlRWDNZNmVKbHBLOEhYKzJ6M0hqdFBya3JyY3NwRnVoZkw1?=
 =?utf-8?B?Y1BkVXJMOVV3bGVodUxwaW50RkJqdzFBN2I1TmdkZ1JhbUdOOVI0QWhxVHoy?=
 =?utf-8?B?MnJ1MXNGbFR6SGFZM01DQkxOTjBIamYyenpIcHd4QkszdEMxVUVKd0RNZDhJ?=
 =?utf-8?B?RWJOOUlNdjVQMjVGMjJ6a29QZWtlTmc5ZldHSFFxYVlJY25wOEdremdYbXdX?=
 =?utf-8?B?UVcvQ2dWdWVseDZFZWU1ZnhWN0RqL0tnOTUwbWxsSkxZWHZWZW05ZmtXbStr?=
 =?utf-8?B?WjF0aXF6S2wrSU9xZFZ2bVRpU1NvSW85Wk1RMnJxY2NZNXRSdXNxTmhUdXdr?=
 =?utf-8?Q?SeA4ZxR3Dp3tE7uIA0D45RA/KKEp2WY9k/hd1oUyylbkU?=
X-MS-Exchange-AntiSpam-MessageData-1: sp0TrORka9nD8Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a8931b-a3c3-472e-d25c-08dea57fabca
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 23:41:29.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pihe670Eng4N4WD43Fa9b9EFmOq20Z6qiCbQ1uKe/+hhAvdf76RUkOncN5wLosq2KsqUR06nx+60B1Xca3gN1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

On Sat Apr 18, 2026 at 4:13 AM JST, Timur Tabi wrote:
> GA100 is an odd GPU.  Architecturally, it's an Ampere.  However, it
> uses the same GSP-RM boot process as a Turing.  Its VBIOS, for whatever
> reason, has an IFR header that precedes the PCI ROM header and must
> be skipped.  In addition, the FRTS window size must be set to 0 just
> because it's a GA100.
>
> So add all the missing code that GA100 needs to be supported.  There was
> some infrastructure already for GA100 (e.g. the FbHal), but it was
> incomplete.

Pushed to `drm-rust-next`, thanks!
