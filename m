Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D221C860A;
	Mon, 16 Feb 2026 08:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230232; cv=fail; b=qwEPYTxWyzLM5sIq+nVcoHhEDfGW3ESf+Nuy3d53N9x4yP1xjHftdrSM76psG78/lyWOtH8BZYdy51UzhJRnUeHxst5vHXNd4xNrhlD/UuCXq58yq6NSD/VxECnpN/+TwcXNmx2yL4wUyxuqfVaJ+Y/Uw5sLYBoPSPWxC6QBRrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230232; c=relaxed/simple;
	bh=i+n6o4DvpNqK0DDIgM+jYK322xDQpfj52ZrVn6z9gTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=niTLmaY2JxVRYFf2BZuBJsrMP+7kCn5uBeNTO7sFcaWcas6yUO3kceN/Nu372WLG0Wh+PLcH41B8HvKFvXCkfJOfPTSb9bAQV0zCED8NUesZ4/MX/oAWbxN88g8kfWipbSqSQuOZgqj8YpftFtTmLthlIZw5GqkI/PiPef0Napc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=vMj3gnq5; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="vMj3gnq5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIWAENPlHxRNahTWpOEFGv6cmixH2KYsd17G477npGsQA4f6/O3/uYpOBsmzEdC2KmNeKHArNpaIMzR0WGqzwfdERBNIpXiQXevKB5Jl7vALddr+bujQCmjpuiOfmPoStwE15+hVIoGxAGjJGh1d3KOdo8h2N43qshmEbgscAw5WrnxXurp3fwvd/YY5SwuuRpU/h5Cbi+hGvFO7ad/ippwhyUGi7IQGzgyxlVMkHLKacy+uvoRtYdQnB8F1af15cNgYZmOfMepMJXwEASPA1HgEUjwLYkWvQnAanY4kJrpDYM/zub3AxKAX6KbUmMYr1Kn82LvPFwkdUnP+jy9TYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qA6rFUQIQOtXrdTDq4wq67gs4XpnivPcWAbZT0Rssk=;
 b=Lnr30WVUtS/f+FWaLEls8FhKBd+Iopb8XIUGD0hzT6JyCWtbW62USQ7syPmyn1RRwvu7u6St0nXkV4l1HTEd9q44P8OGnOrHpEFkXSz1EiREOifUWgPj93rarIRn2vEe6vZofTK6z0nqvfSxRMIf7kuiu7w15cmwkNNelwuUwMfaddFyUhVZC/c1mWZGUbYBUGlXgIOlJcfhX9aTM2Nt4/TbY/9r0tGZpIA1owBPerMqBhvyhLLMVKK8hlOw4s2/qzhXPXQfKis+svYoZGdCsCa0q7bcp5sk6QkVFnOEmtU/uspgmyr2GBeK7JUWLZlhH+DrxYw0ClLNCBbmR4QY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qA6rFUQIQOtXrdTDq4wq67gs4XpnivPcWAbZT0Rssk=;
 b=vMj3gnq5y9Cp8e+dWeP8vFPAxmqTi73Fzox8AdxS4hcK5IywrHNy9PtVoIcZXIKet1S+Nn2Q5lPtdhA5Dpct7eny+rZoZmmtQfO1tWnp2eGuA1O8NLSGB0BQyYEgvol7bs4g7FMKYSqHUDkFRJ06zVD7LGz62AN2/kOOdUmSneOMaePuEnkUnkAXEGmIBcU213oB1FoRz+ezzmyabHTaPuJXG+MlHB9weiMIwjJDynNOZ4AZRFoF+9pg2k5hKOeOnxw24SkYyEQjq0GGi8xtfV83IB/7EVK94lK7gI+eUWmfynBpBfBzKocnU/+cztN5rhTwOscpWzVoqeTlpzBhiA==
Received: from DUZPR01CA0211.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::24) by GV1PR10MB6683.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:85::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 08:23:45 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::13) by DUZPR01CA0211.outlook.office365.com
 (2603:10a6:10:4b4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 08:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 08:23:45 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 16 Feb
 2026 09:23:33 +0100
Received: from [10.34.216.22] (10.34.216.22) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 16 Feb
 2026 09:23:33 +0100
Message-ID: <7a4279df-8f48-42fe-bd96-12c978430b09@de.bosch.com>
Date: Mon, 16 Feb 2026 09:23:23 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: add a wrapper for the `num_possible_cpus` C
 function
To: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
	<tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
 <20260215-cpu-helpers-v1-1-fab13d817a5e@kernel.org>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260215-cpu-helpers-v1-1-fab13d817a5e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|GV1PR10MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: 118b82f0-f555-4773-2658-08de6d34b394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnJSUXQwcjBoWUlvbGlkTklsZUVzM3RJYUt5Z1cwSlRGZkFvZzIzS002Tllx?=
 =?utf-8?B?MU9nSjl6ZG9yY1cySmo3bHBvRU9Gb1dZaXBhbWxYNUNSc3J0U0ZKazhxOTRn?=
 =?utf-8?B?NVZSbldKWDY4azFPZjI3c3owYkRhQ2N4OWFkZWhKa0tDUVBNSEtaN050cU1k?=
 =?utf-8?B?dnhCV29LSzlGSmxmTDU0Rzh0eXB2bmczcW13bXFiOUVYTVd1RHJqU005cHBB?=
 =?utf-8?B?dzAwcjcxVVp3UEkzdTJLY2JydHhVOTVsVWFic0dwdGV1MW9YeFBUTlFZTk56?=
 =?utf-8?B?LzUrMnFEcTdrZ2kzM01QZ2MwZ29FVE0yaW5ia011TXpqTUJJNUVXSDBDSncr?=
 =?utf-8?B?SnhMbkM2TjhMandRN2VESnBJdnVZRm5TK0gvbUljUVpZaFpmcUFBWjBOdmZN?=
 =?utf-8?B?blF6Zm4xRldXbU1yRjY4bElJSWRFNXQ0RFlRMU5RWndHV0VLV3hqcHdZZUUr?=
 =?utf-8?B?aEYzdVFGUmlVRk0zck5FQ0J3NW9sR3ROVFpTbFpPVWl2UUphYUNVMTBSZEpG?=
 =?utf-8?B?ZVg3RHRUNEEwaEY2UG92S1hVYnU0dVBTRER6YXdHNGR4YWhrODdRR2tPMDND?=
 =?utf-8?B?aEowTmxJK3VwU3h5cHIzUWRSU3FMbThLTkMyM0hFRXBENm5RTGhJeWtpd0tE?=
 =?utf-8?B?clRrY3RvVFEyVitWcjVNRjl1QmtaclVrRDFJWXU5THpCKzZGbGxPNHFTalp6?=
 =?utf-8?B?Y1NPM3Y3dCtCOGZRYmRPaTRJU2N2dE9DN2RNLzJWaW5wY3pyTTJ3VVpzSm9B?=
 =?utf-8?B?Mm51ZXZORldvbVc2VkZYVGN5eFJuVUxPbWlpVG16eGV1a1ZBV0ZIQUhiQkZq?=
 =?utf-8?B?cGZPY0ZTb2t4UXhIbW1rb3hkaUMwUUNmMmlzQmNJVTZEaXcycVpQNU90Q3Ur?=
 =?utf-8?B?Y1VnaitQb3hxeG5mRk1nRkxRQ2FqRnAvOERTb25aOGRTK0lmQlREM1Q1ajZW?=
 =?utf-8?B?bUlxdUc2TTBHOWNNb0F0SWtOd2VSY1lKV284blJHUXVuOVBTbHNKZEszaTl2?=
 =?utf-8?B?RmJHclBLZnBCS3NSZVBmVUdzTGdSK1pLTy9JUm9OTnJlUTFQT3gwUDZleXRk?=
 =?utf-8?B?MlJrZm1FVUIwL0c2UXRodExwdHNKUXNlWkhIcG5QSGsweWpUN2orOHdPN0ov?=
 =?utf-8?B?RTZrcmdDekxWVERvamVpM0NlM3lFbVIvVGxqajFlbWNaZW02L2tNUmlWMVBH?=
 =?utf-8?B?ZVBZMlRSc2lyVUo3SGxGNUo4TFp0UHRRb3hUa2NtbVNmNEhSTU4vRnFxTXFF?=
 =?utf-8?B?WStvUUVaak41R0MydFh4TUZLWWtka3JsUTlpMll2dm5VejVMaGQ4cnNGakZz?=
 =?utf-8?B?K2FYdnZHZ0JqUUhraGptRWdVMnB2OVdSMFVhKzcvKzUyY3ptaW9UbzlzN1Bn?=
 =?utf-8?B?S2pOVUE0SHVERlBKajRQK1RVZEkwSk5Gc1Urdy9KZ0o0dzJ3TnBXVTc3NTVP?=
 =?utf-8?B?ZWFmV1dQYkRPeGQ5aGFnOXVKUjBKY28ybVhwb1NDNnNWclJWT3M2U1NkUGx4?=
 =?utf-8?B?MW42emRYcUJscWR4SWJMam5wcEl2MG9qV0c4ajJoWXNWODJMZTJJYWMrVDAz?=
 =?utf-8?B?a2xjNGxQK1BZeTBqcjZkRVc0eVVqUGRuUVR5N0VWWFBaWEhHR0FRcHlic2px?=
 =?utf-8?B?TGtXaENCRk5WK3VrdmVMOTkwZkErV3UyVy8wbW9vem15U2JMcFgwNnNlTWx6?=
 =?utf-8?B?U1R2WUFhUXhNTkF2dXVNY1hOdVc1N2xTU0FsNWl2NHd3WjBGNEpBT0p4bFY1?=
 =?utf-8?B?VGlEQzBYOS9Sa1U2alpidzlnaGhsSERpcVlmK05hWG5TNkhrT1RtRGNROG9B?=
 =?utf-8?B?QyttSnkwNlF0YVRybDRDQVNqbk43MDVqN0ZiRUp5MElsekFTT1NFeXRRdjlH?=
 =?utf-8?B?Mk12N2JWSkxuS3FKVDdkVmZZUlRJcWF5bXNPSzRhdkZBa3h4ZmFOQStpeGZN?=
 =?utf-8?B?L201UVM1cDhEQXpmMHZMVjl3c2VacWdKT0dpZlB2ODJqaHQ0Y3JIZGtzVExi?=
 =?utf-8?B?R256Q1A1WDNLTWhua1RzdUFGc0pjWkMxZllxTnJ5MktBclB3bFdEZEFlRGp5?=
 =?utf-8?B?S28wRDl0QWdpRjdrdDlEVG5MMFQyZk1abTQyYnVWU3VaZW5qM0JHdlEvQ1pF?=
 =?utf-8?B?L25DRXAxTUFRRE4yV1hYYTQwM1JoemdTbkFkQkprOTY3VldxUDM1QUFOR3Jo?=
 =?utf-8?B?YzZuUGFza0I2Nlp3NXdpQXlzYkltZ0NwWks3REF6MTNwVEdwSFJ0OTFqYmU4?=
 =?utf-8?B?aU5XNmtKcFJldks4aStkY3hlS25RPT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iNKsO0MSzQ0rc2N6V9mgGJ91hEY4Av9fuAbA8v0ZYnXinF7XwpiGfDxHfd33kIXn6CHFnej9lGG4XmGLiwPJvIaV6WPybnL+L99jmWi5rispgKsK+nONQq6zn1DEpdyruXZXSjnTp1TBhDvlhKMjbzLLp5JDxqrH1Up8Bbnz0vodELqKi5FTCZwazJCR5C992YlQJrPn9aALG0RDfVsXLUq4kyqUP5q04HW9HSfEHcppxEpaPXkB8CUKze3+z7xvfQvipcDfurlME+D53lCXtcxmQiSc0HDHlf6jN2OvUo8rhpbKvx1wLvjlmHKjq3HP6XfSR6Xx1Wpu1o6FN9HjO41EHvj6G0A36LPbLfzYoyynlvz/twGnx0Hup03e+KKyKKgwUBCmlUhw6R2G6K3KXJ2QTazppHgbAbm7D+tM76Q57eNjPLbvgqX8toVNooEV
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:23:45.0663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 118b82f0-f555-4773-2658-08de6d34b394
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6683

On 15.02.2026 21:10, Andreas Hindborg wrote:
> This function returns the max number of CPUs that can be online.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>   rust/helpers/helpers.c  | 1 +
>   rust/helpers/num_cpus.c | 8 ++++++++
>   rust/kernel/lib.rs      | 6 ++++++
>   3 files changed, 15 insertions(+)
> 
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c4..a19d6562fcb3a 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -35,6 +35,7 @@
>   #include "maple_tree.c"
>   #include "mm.c"
>   #include "mutex.c"
> +#include "num_cpus.c"
>   #include "of.c"
>   #include "page.c"
>   #include "pci.c"
> diff --git a/rust/helpers/num_cpus.c b/rust/helpers/num_cpus.c
> new file mode 100644
> index 0000000000000..daddacb0418d8
> --- /dev/null
> +++ b/rust/helpers/num_cpus.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/cpumask.h>
> +
> +unsigned int rust_helper_num_possible_cpus(void)

Should we add `__rust_helper` here?

Thanks

Dirk
