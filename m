Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2053.outbound.protection.outlook.com [40.107.247.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782E55894
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 06:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723615737; cv=fail; b=IXwZO40778ZaJXTAhDwwqPSMzG7+srmyrNeN1ifDpSp2YabOnx+SLxP9PLTtnum7snNCeI4ibVDknJjqFl7PheiJBUV77iHpY/KYRa+ld8kHluDqH29cZvkleOc0M//d1B6LAxtWMUjtYKaIqGQwulQeaE7PLL4OfGNohjYeaac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723615737; c=relaxed/simple;
	bh=bAWyqYjjdQCFHRAbAhkNvzkoIKrShucFoG7mfMIu7vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aH6jHwWxsa6RMx2GHv5xnDnh4fqMCZjXHXCYEww6q5hGuvjxlADIsM3FQ2nQCmpPQyJXzeGSsZ/XEGsOxNv+d0KcZe7oUPrVR0ZFkzDsyLDZfxdt35a6bVdI8U+g2jgXJwAXaLYcSGNcCc1EcvtRVqEo2nTurQRj4iG3W4CSBjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=a1mfEejq; arc=fail smtp.client-ip=40.107.247.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="a1mfEejq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ym1WDmMABPW5LoTsvbcajFSWQ5gibghwBeHeypPyoJI2K7MwamoPMBYbgJcnX4sl2FWxUnbW6w7DjX8nRYBGE1I6AmY71RCYtTAeF/BiKl5mFpTr9CX3aVL3Qflv3clUqZfc8izR8Z7+n+3A5rwWywXhYAvKUdTBuB90tRJMdkwSHdIWieLIgb2K9BCD2kHS3hVzRMnuY8+siyRFHnJsK/vh6pGCDlp5qs7HxVSxJc1QTtVLAkY9l5RjNfphqMLo2rjSld72qvjaGt1mZ5ubneGTXNlHcqbfvYcOdo7N6hyptGZ5+LRfooIOFTfRPkaiKTUjuxCngAe7UQth1Ug3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUu+6wzBNmXJURCV7x20TZw/q8uUzmGHXyansuqvInM=;
 b=pSuPGpQrbmtmYpoqPCTE8ncsXeGFdUzRnmpfO6sCn/eo1HPF90EdDJWGtlsmv6b4nI92o1G0Vx3nYU2U2x/hE7OiKzbRq3aDFUfxzU8C6mcde79WX4NbqZyvJfqQsgIe9N/EuWiaOE5ouRQBphw9Jp1lU2w2NjyeUVfOuiCG/xwf60HwuPc/QnWe5o/UlSUXtP15NZXH96pGyVEXBGgbd9m9oJyZ8LV0IVd4PAWskAYbo+dUQZA+sXJ9KBMDFf7lCknQx7/UIlmCRlJQ3bIUBLJkVvLYwteKF8XPMpgdfOKXWbqf+WlegljZKPJna58QVK1tMU6aUb6em/Ik44gH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUu+6wzBNmXJURCV7x20TZw/q8uUzmGHXyansuqvInM=;
 b=a1mfEejqJOsMkzKqIlTTuXZHVa3zjrPbbJ77vvV9qvplc3z1bmJA7u59ybJlJd4Uj6PavqSN2OfgaA8+3HuxH0sZf5csExsq7YMRRP+/7JmNQ/s/uJ9vakX9mZB2ls9bwhy5l+Yqmi4Nd6G1xKrScMsVBx4gZeqS2bqAbsVooy9ZwMCIm1k7d+F6M7wX26urNHxXyzbjysmFzYNSHSH4aK8JBLuRqdovtqQLCwYAVxnSlCOOkMipOI1WfcKvFVZFOXExoVnrKfHAmUZEmLV4EGHmwCl/EJ1bv3J9te/2i121IEQoUtkl7/6H6Wn55qWq1w3KoRpUYmYQRTaHi6VGGg==
Received: from DUZPR01CA0201.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::12) by AS8PR10MB7828.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:63e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 06:08:45 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::80) by DUZPR01CA0201.outlook.office365.com
 (2603:10a6:10:4b6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Wed, 14 Aug 2024 06:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 06:08:45 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 14 Aug
 2024 08:08:36 +0200
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 08:08:36 +0200
Message-ID: <8248a26b-21a6-4b2c-ae7a-cea74830f958@de.bosch.com>
Date: Wed, 14 Aug 2024 08:08:30 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Additional patches for rust-fixes? (was: Re: [PATCH] rust: macros:
 fix indentation in `module!`'s doc comment)
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
	"Martin Rodriguez Reboredo" <yakoyoku@gmail.com>, Aswin Unnikrishnan
	<aswinunni01@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>, Yutaro Ohno
	<yutaro.ono.418@gmail.com>
References: <ZrtbEErNnBNNH0uF@ohnotp>
 <CANiq72=Psp2vyQEf=MQfN61Xqe4UXT08Y=YeOgV_0LLEzTGfRA@mail.gmail.com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CANiq72=Psp2vyQEf=MQfN61Xqe4UXT08Y=YeOgV_0LLEzTGfRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|AS8PR10MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fde546-8966-4471-26b8-08dcbc278e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UENUVFBOSHhpU1MvU2ZGWXJOVXVvRTBzcG1Xb1RoQzZBNnd6bUcwTWtab3o1?=
 =?utf-8?B?My9QTlI4T3ozUlhydGFQaXIwaG5qRlJ1T2ozOE5HMlF3MExRaWc1bTNXYTBQ?=
 =?utf-8?B?UHlBVVVCYmU2SkFDZFZlbm9RTTJ5blNpTHpzdE5vUTFCSHlxZnRrWks3Sm95?=
 =?utf-8?B?RURZd3ZlQjcxcGdYTWFtbXdOSHpDVnZoOHZlY2ZlWitWemQ0aWdiNFh4dlJj?=
 =?utf-8?B?T3VmUmxrL1dqUWp0dTA4K0FKUFJZdlBSemhLYUdZSEI1QkVKZmlqdnNPVm5I?=
 =?utf-8?B?KzhLaEhCeldxWFZwbWZ1YzZMVGVYbTVqWGM4TFVJWUVQbkNreENtVEZjWGgr?=
 =?utf-8?B?cTAzY2NhOWg3d1ZaL2d6UWJSdFMxdmdjT1NjcVVJcHYzVkdvTTJjNmtXVmZq?=
 =?utf-8?B?WHpmY2l1ZUw2ODJzTlRraFZ4TlpMaHhjTGl0U3FwempJMWV3ODVGN01TclRF?=
 =?utf-8?B?VkwzeUxwamJTS3RSeFN2SDgzK3BHOUVVTmVJQXl0Z3NjWWlaakxBNVdTSnR5?=
 =?utf-8?B?TG5xSXV2ME01ZUlGVHM0bnlWeFRRVXJ0ZnBFaXNpSGQrb0pXM3BDbXNEVkhJ?=
 =?utf-8?B?ayttZmYvU0tKYVBBemt4ejJ5SWE0R0d4STR5WFExeDVDR3ZmV3lrTmxlclVj?=
 =?utf-8?B?MFZ1WDFtVmtFcEUvYzNvQnFvL0VsaFNPSWJUYklkVDV5d2VYdzFZMGJ6YnFG?=
 =?utf-8?B?WHlNTzV0RXNoNTN6OGllTzJ0QVNLci9GZEg5Ykt6K2wvbUZVSld4a2ZLR2VV?=
 =?utf-8?B?VHh6UXBPRlpLZWU1Y2x3V2RUNDNCVlIyN3ZSNVFpSWViZTMvUittWjI4RFNK?=
 =?utf-8?B?ZGRoZis3T1A1b2dQdDA5RzVRcm5EWFl0WEVJRE1hREszOFkwb25HTTM4eUEy?=
 =?utf-8?B?cDhEdzhsSVpWT3JxVkxBQ3Z2VGNNRkRhVVhGeWs5Ynl2ZVhRVFFuMjY2Q3VH?=
 =?utf-8?B?ekg1NHBXL0ozS1A2UzF1cU84V3pyQ1FSNFhqMkV1WlJpUkdXUWVDZk1ZQitN?=
 =?utf-8?B?NzVONTJhMmdIdTR5dHlEME5XRnNaS3NJekdEZXJVQStnYitaU1ZFb3Fxa0Ft?=
 =?utf-8?B?V0FjYkUzRWp4dllCT3Y3SDlyT0VXQzJLM0dwdWUyc2kwSnphdjlzMlgvdTBV?=
 =?utf-8?B?MEVNblJJYTNjUEIyM0czZVlLcUdWOXZZMk9nZnY3UkdnZEM4MGVuSmttSE9w?=
 =?utf-8?B?Q1F0bjZHNkE1MXdJa2hIdDJ0cVhmcDMxYUZMN1lHK3Z5RFpCUmVCeUxFMmNK?=
 =?utf-8?B?RVVvMlRhOFVsNDd1T0VhMFlBUWRTNFJFNHhsQmFTVjQyU2xWV3hrVmVqMkY0?=
 =?utf-8?B?NWNYU3QwNmdTaHFpNE8zTGc4YkZZbjg1WDZpUUxsQ3dxVjZ2QzRYS25aSWFt?=
 =?utf-8?B?WGFSUWZEZE5KVUZtK0VPVVpBR01SMGF2QjQ0azdNNXZLL3VkSnZkOGRhTUtx?=
 =?utf-8?B?SUUrMWhqV1g3dGtPSkNJbnRrQWZKK052M1dhazNySVQrcG9hWDdGU05BN2gw?=
 =?utf-8?B?MXJKQWFQMVdjS2Y1d3hleXhFeGJEZHhvTi9BSUVOTGpFSk1mRkMxcU1DU0lx?=
 =?utf-8?B?Q2JZZWdFamo4eTJYeVFXK0JVS0g0VDVnVXRJQTZ0L1JNL3FRQWF0UGRPeTg4?=
 =?utf-8?B?akk2enE1ZTRnbTY2c2kxVy9vUU5QVlRLTDMvSDFNU3h3Ry9YUjRTdkk1TEM0?=
 =?utf-8?B?aE1YL3Y5bDRQRWZIeWFZc0xaUmFET0l3bW1lNHc3MUZlZjc0VXNZMzNOSDRz?=
 =?utf-8?B?UkV5WVZpRytWUDM0OWEzZ0pnMGRJWVYyamxKMHBNMVo1dGRESWhIOXZlSXFp?=
 =?utf-8?B?blc4eUdyZFViUFhiL3Z4UjdPajcydllqbUNBd1QzVWhsUlZEeVUrc3Z6N3pz?=
 =?utf-8?Q?N0/Hw2AOhNvK3?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 06:08:45.7676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fde546-8966-4471-26b8-08dcbc278e69
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7828


On 13.08.2024 15:14, Miguel Ojeda wrote:
...
> the `rust-fixes` branch,
> which is going to Linus soon.

Sorry for being off-topic ;)

But would it make sense to try to get the (not existing yet) fixes for 
the bss symbols export and the lockdep key registration topics identified in

https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/6.2E11.2E0-rc1.3A.20rust.2Fkernel.2Fblock.2Fmq.2Ers.3A.20doctest.20lock.20warning/near/460073942

into this -rc cycle, still?

Best regards

Dirk



