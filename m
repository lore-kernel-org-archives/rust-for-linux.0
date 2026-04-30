Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4181B4F09;
	Thu, 30 Apr 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777537509; cv=fail; b=J/yXHgNYGBau1viLqDCvVplsvOoCmeD98OH8XbzNCS/uUq6Xj2nXtZTW6aYPdjIum3cr3H/mNUSnu4USWvLM2pUjCQUfXgZgMPxhz13HrkF1amFPJ8jUMDocKMDCEu1HdIhK8lkyLyJv5RXR/a8istIHtpPos9Ev5ZW4v6tamY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777537509; c=relaxed/simple;
	bh=l9YIDU/OI8gsvPGey23LwYenegBgcMDctdBuMQLW1j0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ZgaNN7WxNS1wup7Dzdmy0LzVvqXnl0oennCBtCV9j3GNK+2JkhWXX1ynyrTRyZRgye6AgIokTXyFMB7z6awp8lkecPGTHwsEqFK9Pj+kyTbIfP3H2TZNsRoYSpFXvnTFMggjBOpTWSam5Md04HsqFL/xrgCPqxzMmSgq2dvuJHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=upv6U1MD; arc=fail smtp.client-ip=40.93.198.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="upv6U1MD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wb/8aDtujcPu3+hdTJaMH6iAmKMIId7AejRbB6S4KH9tj5/YD4ManLBSFzTKQbLb4Ns+vzzm1VdcER3xCDR6ZPiRMxj3qeKnhDbpMuj7lAiy5fp5DHs3I0MMGgEJ6+ZjxvoSZeWiH3phrbgkBFqAud5AhDogaPgXMkTigxZlhkqCXtGi0pQ9s3zU1fGtV6U9TN8YNDn8UaZKSxJGF03yZqugQuSn3TCCOiaQvG0H7/zPLHOo0Ic6iKE6beaLqGJIXOFYeJstagySGAlibeMv6XQ2Mazvr9SkzA9Z9Nb8xIkFY9WMWyOE3mCpR1bGZmXYDkNEya5ZFAOZ1r/kJ9QLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9YIDU/OI8gsvPGey23LwYenegBgcMDctdBuMQLW1j0=;
 b=vkyghmpbwmuZ4zX5wLJuCgeRDa2du0aTOidybm6D33v1X6878JAXFc3muzGAkO2SoJHsBIAW6aBdQg/1TBaYQzMpue180KQV6gMQs9RJMvJ6FdbsdlPZLHpCq4u0KsLROcEXTbw5Ep6zxqcEnQz0uvRHzi4suXiC52aMM4faIXhmohK8n3ljqJrh5s/ipTZGk5nVn3kaytDb3NULNBFdiUFDpz5eG0p2X4TIvkdZWNGo2osvwNhe0AOQX9sDWNBymMpZXgEOQt2REs2TYah2o4KteyhBkGirgwMzlopRCbluuLMBN3BDgThwhUv8peE9NsqgHOEuhIjcCbCnwqdgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9YIDU/OI8gsvPGey23LwYenegBgcMDctdBuMQLW1j0=;
 b=upv6U1MDWOV7p9xKy5TaanVw8mOsYXLbzv2xuscnqU9Lzn0Y10zFVVPCIpz1qYXnD0gJfiEF+jBwRjC/nIBE7/bLUBnmRVOdOp52LRn08HpCgsWH0CDF/huNGUc8CObKozsuuZ81Srhe4S9bwjEUzJCejBEqsqM57mnmlfRL0zGSuEPfS72INyC+aFABIjz/n4a7JDWkYOgFnBJslTC/rC0D6/9UFY/ryDWL4uvwD2fIsxnQ3MSy5H+pGMgO/0U97pC9WfUztGTYLOhD+8hb8bYKKd1kEriuYjV1Olwm+ZATUkleuRTIRrjEz3702ZGDX9hDareK0hsUEpp+o0lDow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7427.namprd12.prod.outlook.com (2603:10b6:510:202::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 08:25:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 08:25:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 17:24:56 +0900
Message-Id: <DI6CGCUKYJQ2.1Q5G3Y1KW3Z16@nvidia.com>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>
Subject: Re: [PATCH v3 0/4] Support more safe `AsBytes`/`FromBytes` usage
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20251226-transmute-v3-0-c69a81bf8621@google.com>
 <DI62AHDXLAWA.2ZM8JKWQALKAU@nvidia.com>
 <CAGSQo01-EjhXTc+jcer_5FJMwQ4cpBtyHDoCyYR7dOdXKfUFHw@mail.gmail.com>
 <CANiq72nf1ngNzLEvZ2gzeO7b8mCELV9A-4f_9jA0c7cvB_LDfw@mail.gmail.com>
In-Reply-To: <CANiq72nf1ngNzLEvZ2gzeO7b8mCELV9A-4f_9jA0c7cvB_LDfw@mail.gmail.com>
X-ClientProxiedBy: TY4P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef71154-c415-43f4-dd26-08dea691f845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SHCb2ZhAtJRmYtURHa3R1qI1zp0Don4LRtiGV+oOcCTFFplwreAq2twHMx3OAHjg8rqyQEYJCiASs+jUYb5gyXmBszUvx2pBOXlsG2Js9i3ZgXaAjwEOzTzliKtW7Lb7EArRtlJLbnUrol9J8Vv3usNf1fKozMaQSpRdCjBUgnirg0lnq2FPny4iL7wG3lDUMjuTUmdJXDBvKaIhheYsFDRh9AsbkypH74aMeY6OpBUTUw6/p2L6logqWt5brWGh3GEgHHcLcQHixFwwmHtTNh4bxwS0g2S8Zhxh6sPxaUJ+R6C0zPiEtkNaHbLwVFXUmeyKXd0qXoEoXSW7yXfc+RP3H2ZG5pMRlcLIdFzL33Pyr+5qj0ipEQBxlctwIlIj7el7paMplgnXmoATvkdUki4rM8U10YJYuc578Sr0UvMl4onuz4Bl8aWrqy2GBTT6Ie5ofoggTQjEK9+Pvdx6Kg5NZQDzqwVYKdCrPBXZ5PJxMpi1/G8I9JVPZJtKgLJY6B2bPbnQykQp0DorkBWO2yAaJkCG5UjJXPcAkW7H8V3irBUMUmuglV73/D+SnxC/WKuqgIsENLkGbosD+e2ijp6o6Chdd6OMxuAC5VrDzVfVQ+osswiBbZrsGaSjk/5Auk6fSsAwrlXYmG90lMmFdZTALGOyX3ucUx0SDwjSVH33y4DEtxPhPxz5xCiFuVMc0W1WiHQ1oqhlZ8eF4HXjuDKhhjhBW8260Ryzc6ZDTgY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0tlUm16R3B6L2NLSWNwUVkxZ2hTSThoNU5iZklqaHdRL1R6bG4rbEl0OHVp?=
 =?utf-8?B?YkFlL0ZjWmxXVCtQa2tpMXE5OVh1OVcwRFpQQS9HSm1VV0hCUWxNZlF3Y3Y5?=
 =?utf-8?B?dWNXWFpLbHRtVWpaSE9KZUVOTk1NVVNaZHdTUFREdnJBTTlCZE1paXY4UEdC?=
 =?utf-8?B?YmpybklicnlOcm96YUhnL2MrQUZnRldVR0h5ZWtHS0hZOWYwUXluaVJRNzBz?=
 =?utf-8?B?dXA3T2NDeU9DdVlOTE9SeGFQUGZlV2xtS1Bwa1lNSEJmLzZLQis5UmdmRjA3?=
 =?utf-8?B?eFluK1JJWCtEYXRRaXd0QkRTSnlmdW1WMUdWTThRNnpYV2NGam80b0kxNjJo?=
 =?utf-8?B?MTZHZDYrdk5lNnl4UFVBSUp2Mm9QN29tS013d0hNcnhONEl5d25WQ0Rjbis2?=
 =?utf-8?B?U3hOY3VmeUdHOTdOcEJsSnV6UEVrOTZhMWtCd2g5VjM2V3BQZW9XZDQ2RnBj?=
 =?utf-8?B?QW9NdjZTSkNvb0RXQ0RXS3VMdE5qdTIrWGYzdHpLeVlFRWZGbkgrK2I5eHdT?=
 =?utf-8?B?YlhERUZwRE1qamVNRUVZbGxWZTl5SWQrcThJMFRwOG8wMm1PbVlYdW9ESE1H?=
 =?utf-8?B?SVZZNEwybEdrWGszcSt1OFczeDZJZ013UUE3L0pKaW9UWk5CcnJ2V3pEcGpH?=
 =?utf-8?B?enFkdWw1YUFsTkdXT2xaKzZ1YXB3Y285c2htM0gvQm9NQXZ5bHlHbUV6VXYw?=
 =?utf-8?B?NFBDRnZGTVo1Q2FVaXBJL3Vzd0RYT0o3QUIxbGhybUlBMGNNMFlxU00reHFm?=
 =?utf-8?B?N2g2ZzZlYzlxTC9MT0EzVyswamVzYVBpZkozTkpvbTBKL09BdWI0ZUNMa1Av?=
 =?utf-8?B?RlJPNnlZVTZjd1NGeXBWTzNwbjVwRmdFYXpzaGorZ01YSGUraEtWZWxSQ1Bv?=
 =?utf-8?B?cWh4OFZrT2Q5TnBNL0daTm03aVpFRjFsWTg2SWI3ZW0wZE5NemN1RjN2S3Fr?=
 =?utf-8?B?N2lwd3FVSlVLSGlIMXRXclNEK2NNd3dkZllMd3VJTUI2NS9LMlVBTk9MV3Bm?=
 =?utf-8?B?Sm5rZkNpOUxaUW1TU2djdkNGZlJKRnNRMW9UaHRYZHhMc0tFeVJCS1RWY0k0?=
 =?utf-8?B?R2RXK0p4dFhCYnQ5K3B3eW5PMnB5S244WTFrdnU5OGl1Z2pDSUp3Y0dTKzZw?=
 =?utf-8?B?QXIvVE1uTk9Kb05lcXcxdkpFcmZzMkhJNEtZL3YxeVA1QWRmY3FFUkZaZ1NJ?=
 =?utf-8?B?UXp3OTlSaFE1bnVPSmZ4S2tEU0RtMzJLY2xIQVlzTUdRUklFMEVKdzNQeThD?=
 =?utf-8?B?aVVaYjVMbGNCUUpiOHFDWGVCeTZWVXNKTnhNaXpseFB1eUFpTnhEQ0tUb3gv?=
 =?utf-8?B?Nzdma3RMa2RkNWxTU3hYcEF0SVczVkpiNjlyNkdncGp2ck42YXdMaUNWU0N3?=
 =?utf-8?B?R1EvSmxqMEhveEl6Zm80cHY2dVI2OXd6Ym43eEhxME51bjAyQ2c1eHRHYjVJ?=
 =?utf-8?B?V2tEdk9kU3lyM1NuM1gxK0dLVC85M3c3R0VPdXJ4dVNMNXVwaG9qRWpDUmdG?=
 =?utf-8?B?LzdFTzFOUDZFVVg3ajVzbmxCV09IOE5XR2FDcWY0eWhLcG5Eb0FmZS9DQkhO?=
 =?utf-8?B?K2hhNDkzdHZFNWMwWnhVOWhvWEphSmd6dDFiUUpSb21oVFJvRC9zUCtkY0c0?=
 =?utf-8?B?cnUvb0xod0ZnUlM1cGVBQkFnT1JjL2dtN1ArOGFTSkZYMzEzSlBIVTFrWlVS?=
 =?utf-8?B?aFo3VGErVkNjd0dwd3hOcGNQTHBrcW0wL2pNZFFnTjhPVWxNTUJrL1A5bWNu?=
 =?utf-8?B?VVk2Q2pEN2I1VTBubmFOMElhMERlQ1lZMTR4WEFkU28wcHpqZzg2dVc4cjI0?=
 =?utf-8?B?RkpwVHhaTS8veFhHTytLUEVxVTQ5Z0JUNWxQMHBRTm1uRTRPdjdmOGQ1Ujhy?=
 =?utf-8?B?Tzg1Qk5SZWp6M2E0S0NDbWgxd3pOcFNYNzZYVElCTkgxRk9ZbEFLSzZmUGQ0?=
 =?utf-8?B?WlVrMEUwKzRIakIyRVp5WnhDdmR3WHhJZXp0TElzOXJzd2h6cnJJODI1eUFN?=
 =?utf-8?B?Z2VHckdDTHJyUytZdlp5VUgwSE0reGRHekF4TjBUaW5lejZuYld4WVQ3RmJX?=
 =?utf-8?B?SENGOWZFOFVnUldmS2lKYk4yeGVURTI1UmxSWm9Ib0MreDlyamMxcDZWS2xa?=
 =?utf-8?B?WnJzRisrZ0FnWE9TLzMvZ0VCek5VcW5ucXB4WXROVXJnYmxwTDN4c0prMTRh?=
 =?utf-8?B?RmNhQmJNaG9CZUF3QjR5OTBxL0kzUUxzT09tbnc4U0FvbXkwWGhHdXh6STV2?=
 =?utf-8?B?d2xQM3RzcjMvVXVOdXdSMXZzQnNGT0xJWnZMNkZ1SWNDL2RrWnFZY2VrVU81?=
 =?utf-8?B?enJJQkx4N3JlS0lHWnk2bW52OWxXRjErRjZad3dlbEsrdjBpQ3pFblRFY1Bh?=
 =?utf-8?Q?P8Uz7s0ylyA16lP3UywM62H7Qvos7xZMGqrvNMYs7Gi34?=
X-MS-Exchange-AntiSpam-MessageData-1: H9Buq488lk6gNA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef71154-c415-43f4-dd26-08dea691f845
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 08:25:00.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vFjM5SclKyiRanYnUUjJfX7amSUwdO2k0hoU6G+QOYpecX/I5b6D7bwrdjTQgadoKUIpZa1QUTsFgxL9wMgag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7427

On Thu Apr 30, 2026 at 5:09 PM JST, Miguel Ojeda wrote:
> On Thu, Apr 30, 2026 at 5:22=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
>>
>> 2. I heard there was work going on to introduce `zerocopy` as an
>> additional vendored crate.
>
> Yeah, that is my plan for this cycle.

Great news - holding on then.
