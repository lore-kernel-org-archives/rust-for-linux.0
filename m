Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021141.outbound.protection.outlook.com [52.101.100.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3BA40DFD6
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272336; cv=fail; b=mAu0D7Gh86yt07PotUwRYe/p7dNDBgsqnH576Xq2uZw76I/kFWHY6pKTRQJO+qBEEsRxtSAL01CTAnmxStQa66R5JYGaTYK1ygaTNUaFzOQFIIEc1vnP/bqOOYwHHY9Q2UpBhdHXK4jg2P0Mh8jV6KLdBiYe/A9LnX7Qfwb8/G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272336; c=relaxed/simple;
	bh=VmiHfLL9q40z5/JQn5Tyy+9FE9RmSbGem8OGzur5aT0=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LAlO+8U33KL4PLG5f9a/CDKuPlEeCOqEFMEPuWD3csGqZkDOKZ8fkOXws9C1Q7zd+C5aIiI86d9Dj2PSLR05i/CRPmmTQTsfnfPkwED8VAEsKJJbbTCJIWrYi0yoIwbJ1a+M7n4k/CzuGj2TkpBX301wZDhWLwcwZM7msD6mR34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=z1xVz0eL; arc=fail smtp.client-ip=52.101.100.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="z1xVz0eL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+/DAu7D8hWwQWBu3IDvHjyHoXU+rSlBWNvgC4P+6r10ntfhq8M+4nyW1EB+v9zodDvI4oKmSVuCilEN1do0MgItWjiU6L1A2IDqQirxr+UYacFcdL8QBxtbDgzZPUZUQcc2OnvMjFCJMVUmq+KQefIdfPnmlfmqMh/Xbk9y0rHErzfxJVRvQGoUSEvxlR/wCXjcI5P6WC/2eJ7x3N5rKC2yxzFcWjiy55skOPjlqb5DfK74U+sTqUVfeJ1q1FEh96rtfbJW4xB8pr57Vy6FVI97sTGOJesMAlSfQJf3vMCI7jDjdrNfEna245GxgW284lH19ftRdE6Y7PuSUI1f3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rTITqAh2Tty97ry0obsCOss0wyf6Xz8ax1e1tFDuLU=;
 b=HSwNBPTAp5fxZ7jgKRKlZmQSsEdUUIWZHBzkH/ZF0md4sGINlPjNDGQz3hHO+ApdR6mke8n4PrpyXeXenqD11vrE+AMh2xqUYsv72C63kmXDSB+UYWoi8gNTOJYCEEZ+jaFqSdUcR9uB1SYX2+OcfvNwNRwpzBKB7YzPB3d8CkF/2OY6ht5/FFdTwWjvwNLiDQNifwie3ufDSo6PJQb1r6SUILa+8fY+WjhbB5tfsbPbXqgUQtNQBPAzj/jiPXX8haPAeEjPo61JnIyJD3oW3l2TlAgXUyr//CAtT3LFt2p1GCggC9WWw0apzIbMdaOm2DboXKg7fT/F3q/c4IIfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rTITqAh2Tty97ry0obsCOss0wyf6Xz8ax1e1tFDuLU=;
 b=z1xVz0eLT+TWkzG+ZgnBq0ZlOQtmrJGkgN+B2kSWquXR0d8gQrstSiypxdunIvpr3rtsk8GrGTxDBOtKP35kD/ofKk+yzC3WdxYHyYzXmChvyIqXJBtgPbkJDK+evEtFs8yU/feQP/C1QaKuoFOjrT3mRQmdoFYccOyzJPqzRX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7222.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:332::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 16:58:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 16:58:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 17:58:50 +0100
Message-Id: <DHTVZNMKLJ9Y.1WSQK2H2JC6I1@garyguo.net>
Subject: Re: [PATCH v2 6/6] gpu: nova-core: enable GA100
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-7-ttabi@nvidia.com>
 <DHTRZVKNN3TP.1NALV3Q9B6GPY@garyguo.net>
 <ec32b84b55ddaa91e347d8152b10f9fcd53a46b2.camel@nvidia.com>
In-Reply-To: <ec32b84b55ddaa91e347d8152b10f9fcd53a46b2.camel@nvidia.com>
X-ClientProxiedBy: LO2P265CA0410.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: 72825d63-450c-4d33-0e4f-08de9b1044ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gOQ8UiREwGMsy2lPEt/EJZZNRd3+FOHTzMQSo2ifRR8Cz1XJM/pg8R7899/eGR8u1r2AQqQFHKAuqxZqtTG8Y80N0Bs4zEeNbOVBDEIjDD48EIU+IuglaIEdTJnFj/ghqABsI/Zb/UeX81TnUkcspXBYzWap4RS19LgaEZO7VFaDk6hcnvISRIUbuaR1r31+1KNP8860cK2b+5wBSagdJLSpdooyM0ggl8DvpjexKwtLi5AobvYLbo19y1YTVCdTQcndvf3hYbtpQkf1DSP1kAr4YUtt4GugVAMw53rLt7pHU/ghokVRtt813UzYlregG8ATpyonvbHi9N+VK/eirj9rIsGsQo9dMpNkbfE20RWeEC87wLhVsJd7UHIeKuGpaSlUWJ6wzPxrgxU8s2Mq6dClbXNDrNXUqPu5EiQrlJKd31ubzsY5VcYq1Lg4qPjvgcsJWlQMqwMBphJ3QgKgiy2BmQj46SA2GJAPYQHjbMtVwWuMCfj5sVs44PZSk1dcnLnJSso0wO6mcJt9GLQ7hTLD7X0NPuzd11frPS+3GtrwHPCKwpW9c+lcZgzRkNHoJQT6G7mUJNRkCYYf2VCv+HL9d/gJKjHpup+C+HNMdZXV5NZkwtbYHyW4TfxPn4i1AGwf+o+NWlfTqfvF+MjjNBWIkFl2LvtXeB/p6+yWWz/XQEHqWEvV4xLENAWE5+7Wm1T81LlmG07qanTZ0WirR0fKzFqh0yHwOqVFYGFrBzQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0FXcVl4dFc2bTl1TWtuUEROQUVmNml6NjVMbXBLZkxRKzhZNnFEbGROd3dS?=
 =?utf-8?B?UnExQlIrYVFiczNNckJkWEtHWlhIM2xjMklXRWp4VWxuYU5xQVFSamRKVk5M?=
 =?utf-8?B?SEphbCtuWWxDQW5pVXNWM1pHVG5uQlR5bmcvOGM2amxQWTdsTWN5Z0JmNzBp?=
 =?utf-8?B?SUFIdks2NXFzeWF3anVCbUkweUE3aWtEaE1kanZtS1JKZE9sSHJqcWN4OUhy?=
 =?utf-8?B?cnEwbzlFVm5YdUlGWFF2NmN5ek9OSkFsT1lhNitGaW5iczFDUmN4MzlBdjlt?=
 =?utf-8?B?QjBjNUNRRnppOU1nTVRxQzR5d3NNNTEycVhZemhDbzN2WkJzNFlYTHBWYnN5?=
 =?utf-8?B?S29NNEFhMG1jUHA1UTdkbHNiVW5idkdDNEZXem5aakZDek9Dc0RGV2E5L1k5?=
 =?utf-8?B?dStIUm5GM21rZzcwQ1dCWVIyTHVyRC91b3Y0b1JjRGdmUE4wais3K0UxWkZy?=
 =?utf-8?B?OGRSVTBuMWNHNzhOZW15L25hOFcvUncwaVhEa0hwWHQzakR3aUovVWUvOUVx?=
 =?utf-8?B?YXc1allFWWhURW96SmZDbFJ6VkRmMitMSFpPMUM5QWJNT0dDRzJLekxqVTlT?=
 =?utf-8?B?RGFWY0tEMERNTlFxaVdWZG9hMld0cnJVM1hVN3lDRkpqWmpEcFJqYkhaTENj?=
 =?utf-8?B?YlZCWC84Ylh2NGxxWHNoeTA0dzMrM1czZlBWRmpsNjB3WnFmZjNqUTdnK3hW?=
 =?utf-8?B?bjMrOWY5TExrb3hWWnowTmpYcXFXQnRyYlIyb2dwZnlKaVJNZCs4MTZSbnBE?=
 =?utf-8?B?Sm52QTFQTDdvQTBQcGRXMDBHd0szMTZxakcxWndmMG5wWEJMaENnc1BzcGVE?=
 =?utf-8?B?WkRmMjI5TGx5RHNvSTVMazk2eEw5WTJFVEdsNytlcTV3ZUxBOTJwNDJmUlV4?=
 =?utf-8?B?TG4xem1BTVBDbzM1RDBWbFpTUTZ1QVhOL0t6dzF4NWRCMWJDUEdReFM0TW55?=
 =?utf-8?B?YUtSMzFOdHBMaTJKcS9XSVovTXdQN0dPS1U0OEViWUxCb3MyQ00wdXBJYUdv?=
 =?utf-8?B?NHc3Yi9QbWJETTkvN25sbW14a1l2RG1rYnhrM0x3M3p2Rm1UZXhyUlZBWnZi?=
 =?utf-8?B?aEZ5ZHVMMkhha0FPNW5weXpBMk9Xc3JOUGMwME9KV0RkTTJJazdXY2Q2WEE0?=
 =?utf-8?B?SzhrY2pwc0tqUGp0RTlIRVcxUWZ4cDZOeGpSK0tIMDZHMFJEZlhZTGlDZ0pk?=
 =?utf-8?B?RHhSMVhRM0pwYzF4TGJtZ0I3cXJCdW03WkNteUhId2s4MUNuVDR3eml5OXFY?=
 =?utf-8?B?SlJOQXVCdGFPdFZPSnB2NStXYXFlZlY4SjBwckRTdGhITUFSWkR1VWVMOVJa?=
 =?utf-8?B?VytLVDRKQ25OMUFZTHQzdmlpdm1QTGtZbnUrdWgvcDRjNDBtd0JhWEE2KzBD?=
 =?utf-8?B?NUp1WnV3LzBzbWNuRGdTd0sxNDJNVzFneEhzUXZscmtUUERxL2ZNNHVEZlo0?=
 =?utf-8?B?VEY5dXRqcVRmVEJ2OVhNa3RHS3oxUjZuMkUvalR6ZnhtYWNFbjd1RWZNR0ph?=
 =?utf-8?B?SVBQUDg1NURoeEdRY1F4ZVVxaE5jU1JBa2xiZ0ppSEN0VkRjL0xDNkIxZ1BF?=
 =?utf-8?B?cjRoQ3lwYzJCb0dJSVlnaEFSajl3YWZGaTNORzdNalZ6VzQ1a091WDVINFJB?=
 =?utf-8?B?OFBDRzNkaGpCdllXeXFVa0NrSjlKTE1CUm9nekg5aHdmOC9BOENUaktqOHFP?=
 =?utf-8?B?cThUNzBKWFFUUGJ5T1RTVlpQditmdW5uU2R5a0RCVnFvdzNvdjFsL1RmZllr?=
 =?utf-8?B?K3FFT1hZOGUzaWt2UGZieW1xaG5HQlluSXpIalJ3RTRERHZOSHN5SkZOWjN4?=
 =?utf-8?B?S2F1Zi85Y1R6L0Mybjd3OEhFRTZieTNvc0srQmZySjB6Ni9HYmprWmFTVHpE?=
 =?utf-8?B?c2M2czlQc0lIY3RKQUJlMk1vOFZiOVVlNzlQdCtZQ25lUHhlS0lGSVJVeHdB?=
 =?utf-8?B?ZHNjNzFvNFJkbjZkMzBZS3FDTmpFV3NVYlphaklJYWJMVWtHMDdnUnU4emE0?=
 =?utf-8?B?K1hTeVV3N09CL3BKZWtHa21LNUR4clJpeTZMMTFzUE44YlVzNGtISXluaUFB?=
 =?utf-8?B?VWtZT2hmV2FRdnJYVzQxK1JRY3YrTm5DNkRncERubWt5bGF5cTRYNWdrYWJz?=
 =?utf-8?B?ZkFYeEhaVHJZV3BhTkdYMGI0L0xrMUpkcy9yQ0FCSzU4N0pJVmtNMkwyZ0E0?=
 =?utf-8?B?em5qTGtDQUR2aFg5R0N5cFpJSmZmR2lzdFN6L1FnaC9PWU0rSWhSbWxHU3Nh?=
 =?utf-8?B?dVErZHVXOCs3WSt3aDZYUUFJMWZiQXJJR25OS0VPUVJRWnBrWExnYTY0Vzdl?=
 =?utf-8?B?QjdqZTJ3aVZSaWk5aE94eXpORUcyZEpIRGFVbm9SY0ZDdnpzRjNlUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 72825d63-450c-4d33-0e4f-08de9b1044ff
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:58:51.3281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9GF203XGhRq1T8EWdtjDedVnF5wv/IX9yqulTPTRLJWxWJM919iiNx3SHoA6ouqMkM7mh2LL19MDyv04QRibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7222

On Wed Apr 15, 2026 at 5:43 PM BST, Timur Tabi wrote:
> On Wed, 2026-04-15 at 14:51 +0100, Gary Guo wrote:
>> > GA100 is a compute-only variant of GA102 that boots GSP-RM like a
>> > Turing, although it also has its own unique requirements.
>> >=20
>> > Now that all the pieces are in place, we can enable GA100 support.
>> > Although architecturally like an Ampere, GA100 uses the same GSP-RM
>> > firmware files as Turing, and therefore must boot it like Turing does.
>> > However, as a compute-only part, GA100 has no display engine.
>>=20
>> This should go into the code as a comment.
>
> We don't describe any other GPU in the code.  Where exactly do you think =
this comment should go?

Something like

    GA100 | // GA100 boots like Turing so use Turing HAL
    TU102 | TU104 | TU106 | TU116 | TU117 =3D> {

? Otherwise it just looks like broken code for those unaware of the details=
,
given it goes and use TU HAL despite being GA.

Best,
Gary
