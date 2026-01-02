Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4813D53C
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767340253; cv=fail; b=p6YgsqL6wR3+ImiKu/P3If6spIoBD2UCuJcttMhbSIejp0p3X6kH2Sd74mvwZIoIrbDZZmT6gsJknzyje3Naqatkylv3X3uG0zWcupugL7QYwoMNx9ffMUjR45YyC7n8oLKDLCYiu0P1eOJ+uH7QOUoHzFhcLugIVdUrFTQdLDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767340253; c=relaxed/simple;
	bh=IvBzoRqO83btPJJ+G49yRKLeX0f+YxwDzWcQAyOCGRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YwR+GIBPH2XqCNJt2KA6jUGRjC5u4a4O03aaIaWx6GHGnWYHd2a7FAnmkzWely9th4HjUmDKis30Wk/3vHoUCSBTV4UAoug0/3jmxb1t6OSuB3NRKlqSw+H4Red0x9HsU1V4TZw6Gmgo4pFGSeu94QPzfMGQjGBZ6lyTvwe+dkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=QCmOsAuc; arc=fail smtp.client-ip=52.101.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="QCmOsAuc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLqbjcEO0bz2/w4ZFBcCAyDARdzfOTv4w8kOtDaDii34VxRh9uexNyfFD07Vy1apcknfOrvdFl4tLRG22tLfWv29aYLVJmBdW86WKz26WjP3rJWekF8at/SlOkWmD1q1rnZrytnNsllcDgW62Vdq9FherHha5lZ1GU5sl2gRCfbvsIkQjFunexY/2Du2/rCjzqqd0KDVsWkR82VCukdtVzkn7m8sKDb/4y/HAJ9yz4P3eP2NoDLCw2vMZDxoYW3HOg48MCPYvPklzhWgYdSyqvpvi1OBitbbs9klPZZ1V48m04h5ePiTyDWlbj2hEelf5yHmiIkFbHrdL5s4dJ+Nng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVhpaIj841ghLqkq6Iv5VJblXdvnClYgpV9yFXvYb5s=;
 b=pq+zhPpE2dFVpR36yL/DnXSzc8mvUwynHBC9hwYFOe2QD8Nn1yvmBxYaB1hY8b/F8aENqw1Kt17Sun1701qUn91jivGFsGweAHc9F7dCjy3BX6Bva95fT31ClzLhUW9d05AxjlqoJjl0uZ3tHSXESJY8tybuCFJWSXH042PoXekyequZhJR0LFq1TjQr/CwQ/hrkNzgg2hxNMDUqMbWjJBKu3Nlu1QcqmciD4AsHilVAr4GCoaXmZ/ZzhE6ql98Eh4O/AWpUrZiSmlQg1BZztTpboymEYyaEU+iEgLZUbChudHWu5EL+s1HVv0Kp1u2yMLjTOUY+T4XjU/lfGN7lGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVhpaIj841ghLqkq6Iv5VJblXdvnClYgpV9yFXvYb5s=;
 b=QCmOsAucTFrQTT/MBk5SQW6PMG++AjV8dVZLkxz+9W+2AKEBlamPOYNB1uv+JC5DChiwJ+m1Pi6OKd0jbMvd+yZsVEoAGekZzGEHNnpgjAt+5gKchjY3Z2BM0UzqluTYIb4EL1fn+dWip5ZcqkfcZEjUCyA8uTVMoDrMsLYK2gvxEgrBLmv7MWrZ2YvvE3Kb9V1De1DSASRRb13iKrQYIpcBpzoQWVyQp6791xM/p2L/AB3w2YhvY1C15Q1bk+gxiZKZhdE8UTTQuBQVHPvuYXa1xpu7laxRgS9O61bCWmXtcZ2XRBhDaGBo/eSPzoXyRfAyE6KefXbgNPPa9hHe7Q==
Received: from DUZPR01CA0240.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::8) by GV1PR10MB6148.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:97::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Fri, 2 Jan
 2026 07:49:30 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::70) by DUZPR01CA0240.outlook.office365.com
 (2603:10a6:10:4b5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Fri, 2
 Jan 2026 07:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Fri, 2 Jan 2026 07:49:29 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 2 Jan
 2026 08:49:18 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 2 Jan
 2026 08:49:17 +0100
Message-ID: <681cca30-70a2-440d-afa6-b20aa3c4405b@de.bosch.com>
Date: Fri, 2 Jan 2026 08:49:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v1 1/2] rust: dma: fix broken intra-doc links
To: Danilo Krummrich <dakr@kernel.org>, FUJITA Tomonori
	<fujita.tomonori@gmail.com>
CC: <dirk.behme@gmail.com>, <gregkh@linuxfoundation.org>, <ojeda@kernel.org>,
	<rafael@kernel.org>, <aliceryhl@google.com>, <a.hindborg@kernel.org>,
	<abdiel.janulgue@gmail.com>, <bjorn3_gh@protonmail.com>,
	<boqun.feng@gmail.com>, <daniel.almeida@collabora.com>, <gary@garyguo.net>,
	<lossin@kernel.org>, <robin.murphy@arm.com>, <tmgross@umich.edu>,
	<rust-for-linux@vger.kernel.org>
References: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
 <2ee56a65-c618-43a5-a050-231a3ebaf3be@gmail.com>
 <20251231.180738.11732647006485259.fujita.tomonori@gmail.com>
 <DFCJ9H2RQ63G.1VDGWHYJ4SYVE@kernel.org>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <DFCJ9H2RQ63G.1VDGWHYJ4SYVE@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|GV1PR10MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 721e7e08-10a0-47d5-067c-08de49d37602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVJUWUtDdjZOL2xOT1dCejdIMGpOQXVKM05KczJpREhhN1VoVS9rbG5YY2Iv?=
 =?utf-8?B?dFRBamI5NW45MU5vaGZLOVlaRmdsLzBEa2lvSHBzRXY5RThrOTZ4VThNaEg3?=
 =?utf-8?B?aGJScGs5QzlWejA0dTJTRzZ6cHA1QW1RS2lmdEp5Vzh3YVdGcWhCUXdQMVhO?=
 =?utf-8?B?aklsdG5Gb3B6cWJZd3FUakRLaGorN2xHbVZsSnZlT0kycW1KVlkzNGVLckVh?=
 =?utf-8?B?c0NyV0tZK2hpaTFNY1ZGZGswSUx0OUNoTTRPUnBPSzh6ejE2RENXZzViYmpj?=
 =?utf-8?B?Tk4yVkVhVDJqL3Njb3pKajRYRVRpV3Z3b1dnTENjcGdUUjd2SUVrajVoYVhS?=
 =?utf-8?B?cldGNHdKOWRpVE5yS09aWWY1anRMY3hyQllxMk9mZW1URy82aGg4ck1vZ2I3?=
 =?utf-8?B?YWVVVEVxeFVzbXloKzh5djc4eUNwK2RxR2lOUXd2aDVRT3VOb2I1Smlnb3lh?=
 =?utf-8?B?dXA4VHl0dGRMZ05OUEV3czlxbis4Q3hscTcxNjR5V3ZUdXZCOVVnbzNSWGJW?=
 =?utf-8?B?WXBYWjZ3QUlTdis2ekdUaEpxMUc0SDYrWXdwT1BiWEs0aHlqRmFaMWp3VTNl?=
 =?utf-8?B?ODVTTm5QYUtMR21scFdmUlprdWUyckZxZldhRE5YZUFIZUxoaE5PamwyQUda?=
 =?utf-8?B?c0JFclpRdzFXbXQ5S2hWY2cweTU1YS9jbUY4bzB6SmIwc2kxdGo5b1hPREpv?=
 =?utf-8?B?NUU0Q21NZGRsNjN3VEJFWFFmSXI1ZldtakpkanllYWhNdk5aNENhUmthNElZ?=
 =?utf-8?B?c3BScGM5aFFIRGtDVVNZaElDWElXSWRVMlkzNmZESFhXdXQ5VzU0Uktid3l2?=
 =?utf-8?B?SUhNQUh4b3Vtb1lGS3lkdW1DMWJScDhmV3JyRHFpanYwR0Q3R2grZzV1bXJC?=
 =?utf-8?B?UFE3dDd5SDhYeG82YzJ1bjVOSk9IZG01SHFsRThZQUd2YmNpSFBmUFd0NXFp?=
 =?utf-8?B?dUwzTGtyK0o0S1FlTlovbTFCY1JRcDdRU0xMRmNKZlZWOWZ2eEU4KzFqOTRG?=
 =?utf-8?B?KzdSR2lOSVNWblFFcE50WUN3KzM4YzczMEU0cW5FRXBlYmhINTE3YlgxSzBi?=
 =?utf-8?B?eFpaTnlpeUtCZk5qZnhMSDl5d2dGYXZaOFlwYmVZbGlBSmUxKzBlTFdLaGJ4?=
 =?utf-8?B?L01IV3hEaXBKN0FGS09pMnBEcVBqaTJodFcyRWg4OThiczlmeHhnWVNhanUw?=
 =?utf-8?B?RFJnbVYyS0Jxb2NhY2JraUhrQ2tCQU96b2hFb01Cd0ZtT1YrWS9YN2pEN0xi?=
 =?utf-8?B?Wkx0eHpFNjU3eXkvNXFKZGx4YTc1c25obXJsZGtoN2ZVbytoSU9LTDVaYmZ0?=
 =?utf-8?B?Y2EzTjFtT25kOUg3Ykx4RkVKNmJKcXJhN3NVbUVXTkRpWUpGcXByNTZHM1Jq?=
 =?utf-8?B?M3lxN3BZWUtYcEFqQzRKVHdDWGpRNHMrMzQzZ3dwZzlyQTlobEorcWJIMnZG?=
 =?utf-8?B?WWFUMlg5d0x1OGpzL2ZKVTJXUmZGYnJWZHZjUEdtakpSbW5hVCs2M3piaEU4?=
 =?utf-8?B?QXF2OXh1V3lYRUZyaXFIUEpEUlp6V3psNjVzUFVpWTY1SUlDR3dyRVN2UTJB?=
 =?utf-8?B?L2VFZnlheGFMWnBjV21TVytMS3ZKMFpvNnA4Z2xGcXlDVnpXb2hJUytVd0hM?=
 =?utf-8?B?V0F6VmZNRm5DbUtmWEFQL2RpRTZMQm9aQTZKTnVHWEVJdkNJU1BYdnNEbFdi?=
 =?utf-8?B?WTJYUmxsUi9XRllJT3lVOUQ3YUhQdlVtdlpJVnh0ZjZtNFA4cDFrVElUZnFy?=
 =?utf-8?B?dXNRYmxZVE52MGJJbDR2RDJodzBXMjN0RG1TQTlPekhxbWJhZlZnMms0dVVV?=
 =?utf-8?B?alk1V1hmMGVLTytqKzB1R3hLc2k4ZjlwdnpYN2Z3ZWwrVElKclVYU3ZWN0lP?=
 =?utf-8?B?RjQ5dDVvd3pyOXNQY2JFMDlzeEQvYW1Ma09UYTFNN3JzT3pFWlh2L0EzT04z?=
 =?utf-8?B?WVJkOUhTOVAwKzhHZkN6U0pXWDd5Q3JMTXpBRE9rY0tKakZER1ZOdmRlTHg4?=
 =?utf-8?B?RnNXQW5rTWJIN2k2Q2pFZWxlUVJNaTlNSHNSYjZFQ2dBOGw5NlNRbHZkVEEv?=
 =?utf-8?B?TGRVcC92SWM5Z3JJZW80bVo4dCtNWXh5eVY4NWZndFFIOUF3bkFqQm5HNnhu?=
 =?utf-8?Q?XxMQ=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 07:49:29.8895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 721e7e08-10a0-47d5-067c-08de49d37602
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6148

On 31/12/2025 17:13, Danilo Krummrich wrote:
> On Wed Dec 31, 2025 at 10:07 AM CET, FUJITA Tomonori wrote:
>> Danilo, would you prefer that I send a revised patches or will you fix
>> them when applying?
> 
> I can fix it up when applying the patches, no need to resend for this.

With the typos fixed while applying:

Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>

Same for second patch 2/2.

Thanks!

Dirk
