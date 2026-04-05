Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC294C6C;
	Sun,  5 Apr 2026 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389358; cv=fail; b=qHHR+XNxlss/V2wng9g+KQLdYIgHqegPmfiCZQ+VpBz3BJs4vfcmPFOHwU5PpPefbq3pxSf5LwIFLwThtO0+LyjBuFitvpWvqjYomH2ffP8rlaP3eOUXG5oURJnnkJPDtU1BIe3JeEbbZQM61rhroS5Ga+U2If1br5KiybMEzwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389358; c=relaxed/simple;
	bh=uj9hP7bSzJrevidvlRcf7j5+pT8/BdKcwoEsqvhcy/A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=l9u1FtZsGBQlxh5npBQMGu7wt5yANb4qTB1ngijBTQMXLzFq4XnQjhYr1KgQ+RQtwpnwLwlYlIzJbmBD/vxB9z9cDGGdde/i+AAop7wJUgueMFqB/VajCgR9GxntBMcX1qGp7rnWUGONY1oSFGwfhFrbymcNI3RqJEWUMvBhpqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZC3/4+j7; arc=fail smtp.client-ip=52.101.52.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZC3/4+j7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0rfKHUAhtro5JdhV/rft3LS6JxJXXFe4ftu3x4EfwKGOcx5/AGgETSaNy4FOgHpBq1KPMsikBiLqqz81KJRpUYClYGAV85oDRfff/q8OgPOvfOW7KDKkMZYZIkHotsR5QpWrgCg91CpzeU2/9fSOLIqV2dN2bcPalNAQ9mkMyEd1sSb+dCXrVrGPDlxs5yGD1M0Sal0u6wfUA8sQlaikqlhssPxSp3gH6+vnBv0EiBbFc+1RMoDhnzY+rRE8VwedoIVKNmwMnrBOYHnGmIuMpwk2LE/yfDgGV1pxVr+XYxpHpGJliwzEvVzF2it3WquBSm5WYPd0pXYC4foEMmklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj9hP7bSzJrevidvlRcf7j5+pT8/BdKcwoEsqvhcy/A=;
 b=SMn0k3WTHlPkVc0tnDhW/iEV8M+SoyzShNSQbLQqaADos63ELPYYcKhyWiYk2JWRkzAqMKRIhbFqIessjYvtxux7eCOMDj05fuwy6hkFW4nJn1dKn9npWbX06WmnCr41e9aXCo2k4JjJNx6jC6HOBgmJ7QmGIfTTUrAHGESejm1k1h4xpAFU1tLwui0gl3glUJIwWVrWYktb5lz8eJcc7gDOj2rcIVu2uI6mphjmZIBm0kczNgDnH/o16RISVIbWyLvW4GCGq7OLt+EYndugEyppjWUIaq2oQl/DcKBZSuUd4snD16C0zubRyutduKVwqxlw+DGEJLK0fJ6aop0Gog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj9hP7bSzJrevidvlRcf7j5+pT8/BdKcwoEsqvhcy/A=;
 b=ZC3/4+j79batuRO9qIjIQ/eU6ItvtZ5VrxqjvBU9S7370XtUoB/mxEkdpKcMloxW8FyHRUKXkFPYenLXq0h9fnBKNh3rrcVsedTCyqFYG4GJO14wXd7sGr31h4xwe9xLaS8SoqcqGkufoScdaSdRAfgPGJuiL/Zvjr4G+pMC1PlSM/6FTAU2GfYvnbN+nyaW9AiKhIY+XRCM342GBScE/rmMbdnfWWHpgSxzIMPZwc38I3XJwcES1iiyeBoOe81w8v6XcO2Bxu8DxVU9RlyE6Swn+dX05uS/CRt3Cg8RgeKilLyL/Gf8RdaCr9uyyTfpanzriPCqlYgR7LviAdBZrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sun, 5 Apr
 2026 11:42:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Sun, 5 Apr 2026
 11:42:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 20:42:27 +0900
Message-Id: <DHL6ZYVYIHI3.2SXJQ5VWKIU5T@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] gpu: nova-core: fb: fix clippy::precedence
 warning in read_sysmem_flush_page_ga100()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260404212831.78971-1-jhubbard@nvidia.com>
 <20260404212831.78971-3-jhubbard@nvidia.com>
 <33128320-a33c-4020-89cf-9b8313b7d9fc@nvidia.com>
In-Reply-To: <33128320-a33c-4020-89cf-9b8313b7d9fc@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:372::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f623f92-5817-46dd-e44a-08de93086c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4MbcbUOWm0P7oJ97ikT9NDqvWmnZTN27cIL15I8Dv/jttW9VyBcQtqQ6FA6QpH+J60Ny2iArGWysoo656HQ4303yjUiidlezbClnzzcODiEJPG1Ed9mM9ODIsSy159SHE/XQW65HAJUrFn9aEceSm4E0oB/AGSaxIOuCJvyHVul6GN5WFrv4dASWOPByt9WpLDfVgoc2ElFxeFLcjzPO6a/RB27t+XTzn5PqlsXe1k9FdezEciaJPu4+tiin2ul8b/IDHRYUIhhpVigQ2GHbXUlO3Jl8osR5hfhYs/euRGX5dKQZ0jpw9a1uixph5A1YDuIuUCZiZoQ0CTl3eq1tO0Z05MvrYWr/BF/A25p9nG4k0TCqYYgd5EFs1t0ECVI1V+klzeeCoX+w2lS2tJpW9U+7a3pmGHnSNKuMVt2iPNEjy1AJmmcAT+XY7SsVACFmbsnigWSVa54VqMfkHRc/ei9VecIefkEcDuOsb4Dqqsa+T+hNmWrsVYyWTcTEZD6TBgvGD1H0DoTgINd3l6uoMq8P1YnB6IGNP+RVYyHiROKqkgQWxH/I9srPNH4vInm9Gr8k1J8jPWnY7IqGqF/057CIHkFuxyPfnwGTXPDETz5vBccPC1W0E6E6MIkmWeEk2Psof+X8xxohHwntYdQgvt5A5IqufW9ZMNloQQ1z+9fOSWEg03epfB+8N37foB4axcL9ukM2C4C/2PRUeQLOJ6fUoN97G016RpK49W8IHmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEF6UnNiYmxvV2VPeXRCUEFUYW1TSkF0QjRkKzNtQzBTUmZGMkozczZiWUgy?=
 =?utf-8?B?a2NrSVlyNWlGQjYwcEp2WVozTm1BWEVXZmJsSTBYSGxuQ25jOWQzSVhMKzMw?=
 =?utf-8?B?VVVIQ2hWWWNDazlzYklTRUxUZzFkNXU5QVB1MGJuc01xV052OUNSVDNHNEVx?=
 =?utf-8?B?THJ2elJMZFFZeC9WNlB2QmFLcFdnS1pEbWVScldhR3I2ZmFxbGlkZGZyYjlw?=
 =?utf-8?B?VVRSVkhKdjlmU1ZjN1BMNHd0MUpMQlJrMHBMMFJyQUhoSWRvZ2VPN2dkOGh1?=
 =?utf-8?B?Wi80VC9XQklobldkdk1JbnVyMjlqTkUyc3RGUDN3dWtHeGtGQmpHV0tBNjVw?=
 =?utf-8?B?cVJrY0EzMk1jMTB1d2ZnN1RlM1FNM0Y5TXp4cE4yTi91d1BLWFdoMGxoQlpB?=
 =?utf-8?B?NzMyV01iaWZJRWlzNDA4L3pTNjRqSURac0xpOVZNOXE3enZyRE1QeVJYeDRZ?=
 =?utf-8?B?U2tnZit4YUV0QURYUkV3MWkyTEhwd1ZwUVJSVG9wVHMyVVBob2dxbUxSd1dS?=
 =?utf-8?B?Uzl0RzYrV2JkcVoyektaQVRVSlhVS240YmdJeGNORFNCL2tMS3lDZTl0YW1V?=
 =?utf-8?B?YkJUUWNKNlBhK3pBNHcvUGxtMkxHSkdMQUJjeTVoK2Z4RmRyUGpWb0IwTkJ3?=
 =?utf-8?B?eEMvaTNiNTlNZElUU2t5ZGZmTHltV3RkWXk2UmNqeWJEdHIzRDNzZ2F4cE1Q?=
 =?utf-8?B?V01GenZOUEI2NHY5TG5Gb1FlOGdCSzdHQVc5Sk1CSlpSWFdpc1drMWZrNnd4?=
 =?utf-8?B?VjRQTGtYa29yWHAyQkphWGVQaURBNm1maXhpdVh5blU1M0Q1ay96cjZjSmwz?=
 =?utf-8?B?S29EVXRLdi9zY1I5RDNDYmh2V0FROU14VCs2L0Ixc1VNQ2lxZHR3UEdsNi9H?=
 =?utf-8?B?eEpaNisyMFJPNHMvZnpjcDh2K2dzNDBkY2JxbkZpby8zc2lqRTh4aUo5UG5q?=
 =?utf-8?B?Y29hbldaRGZuSlJhTnp2dkljZDJPVkE0ZmhkZWJabDNaRFI2Y3ZoM2dXbU52?=
 =?utf-8?B?WFpHZHIyUXBOaDQrcFYwSUEvcTZuVTRpL202K2FxS3lOamJxRjFHV1FUUmJL?=
 =?utf-8?B?Qk5LelRJQzFFVGJGd2JwaG1IRHArV3FzVFpodU1zTG8wTHNzanFaeXR1UG84?=
 =?utf-8?B?N2g5TjR3REp2SCtaR1FsUzQ5YURCd1YyT2cwcldmL2I3cUVXWXhOdXErMTBJ?=
 =?utf-8?B?eGt4MWkrRmtuYlhzdDlVdnFMZHRmeFlKR1l0VjE4TjZ5MmNhdWxLQ25ldUI3?=
 =?utf-8?B?Mk0yT2ZJUUdOb2R5bnBOWGNJWmcyRHM5NFVqZ0NDQWFxVGEzQXRBbUxTS2NB?=
 =?utf-8?B?b3ZOOHN5SGo4aUtySnJpZGhHeEU5dVZTZ09ia2pBY0hEeGo0SlhqQ29tdThG?=
 =?utf-8?B?SzVVbmx6SHZyRWhFajQ0VU94dnZqQ0M1R25kTEhhZ1FzNVBqSVNTWGpPc1dz?=
 =?utf-8?B?cHF5ZUNVTUVJQkhpNjkyN3NxWitvSzNJdzQ3K21OaFJzVlpFR1lxSm85SDNn?=
 =?utf-8?B?WDIzYndaMmxPRGdEQVczem5yQ3B6UUU3ZXJxYmc3dUJpSHVVMEhMSDltZjBI?=
 =?utf-8?B?MWNlV0ZZTW5OK1RKN0RGVEVYcE41RTZ0bmc1N2c1am5EQk9MSWl6TFVQZXJD?=
 =?utf-8?B?KzMyVUQ5QkJzdGtTNHRSQmw1UHJkdDF0cERLbFdHUGNGd1BFVjhPT3lKdjNM?=
 =?utf-8?B?MTNHQmwydkFnVDYvd2FCUnZFQ1VPcFNUczZMR3Y3djUxV2ovU0Y1VGkxL0Js?=
 =?utf-8?B?SE9ubnFPTUcwckhuR3NYMjE0UUI2bFJiRklpazQrZWZMaVJpMXhxdnlXT0pT?=
 =?utf-8?B?a0orYTNrY1ByQmZ0R0pmU2Vod1RrOWpwT3BEdWl4SGdGM2xXNHZ6a0ZKRlBU?=
 =?utf-8?B?dldYak9lV0NUTDc4U3dLaUdmM1hXMWxwL1RvWHFYRGFzSlFyenY5STd2V3BW?=
 =?utf-8?B?TkkxTlk3RXc4VXNtUTNRUVNSbnpWK3NOcUlFTFNMU1NDMmJPQlozYXVrOWpE?=
 =?utf-8?B?dTdXeFBsVEk0aDI1NEJGVU93dG1DS2VvMzdIVWoxT0xMeURZb0o0ZHBvQUxh?=
 =?utf-8?B?ZmNETkx3YmZhQmx4Y0tIenlvY2FpNU9YNlNrUE1SQ3lEbHBmWnhUWlZzZC8z?=
 =?utf-8?B?VzgyYUZOU3ZhT2hQSndaOExra3NBUUh4Rm9qeGhHQWJDbUlaQWVzT1FDOEJE?=
 =?utf-8?B?dlMvaFg5NmZIaG5HQS9rbGpVZHl3eVM4bEJXNnN3c3VwQXMxV2VVZHVCR3RP?=
 =?utf-8?B?WXNoaU5JcDBtUVp3aW11SjVkaHZlRFZUOVNBckI5eVJHdkkzT3FWb2F1SUNM?=
 =?utf-8?B?dm51KzVlSEg2S3Z1UEp6dW5nVEN4WXBZZjNzczdhNkcwMmFBMU9ZU1F1QWNY?=
 =?utf-8?Q?0PgoS0ycjLJGatxGFLYgA3xQ8IRa4WRfs0b/6DRakA9E7?=
X-MS-Exchange-AntiSpam-MessageData-1: 0uz0+SnZozrYcQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f623f92-5817-46dd-e44a-08de93086c5b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2026 11:42:32.2707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5LO9EjyJpck4rUu7T3b0G8aEmNlGjz31oATjALFbcgMLyTnwefka2Jh6VwUxwAJNfcB1XfYJ56iu03K/IQI9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868

On Sun Apr 5, 2026 at 6:35 AM JST, John Hubbard wrote:
> On 4/4/26 2:28 PM, John Hubbard wrote:
>> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
>> because the relative precedence of << and | is easy to misread.
>>=20
>> Add explicit parentheses to silence the warning.
>
> Please disregard (drop) this patch 2/3, because Miguel is removing
> the associated lint, so we won't need it.=20

I'm tempted to consider it anyway, because it is a readability
improvement. Any objection?
