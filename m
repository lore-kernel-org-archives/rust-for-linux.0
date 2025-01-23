Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB27136E3B
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737611620; cv=fail; b=AEotWVGmCiuwGwA7nO7ymslWxGpOhlKdvzi8u4/t9qGmh9StjStdZGtiR7OwZJxd8jNC9doyRp4pNG4RVUyNyJWFaD+HmU6oH4zVzuJpFysBNEkk/Pa+iBNy3kkqXi8a7ZfmoVphCAetrmSaDCcpCNvHXCpN/Iy9LCpV9CGw8S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737611620; c=relaxed/simple;
	bh=e4Fw3BoyH3bN9oIE0wFnX5IkMq0fjMPI6tqd4kyX5rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HHtslWs3YiFCBgX1K4DLU5VOvgGPxrDnp8f8G+EklGmnWVoniF04ZX2m8pIQJ+fTexm0jQmTDV62tRREwLjnQrkbUzw9t9wPl3rgDabpRexL/n52ukiiOs4hDjztOYpvil/LWUgcbirtviMTDfgyOTr7ZoqTF7G8xux5aK1MifE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=KTxrkKRk; arc=fail smtp.client-ip=40.107.22.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="KTxrkKRk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkNQaS6d1pEN1BRRWwI97xNUrUwwrEJ8cMTWoAYJ/MTLdiwjtBay6vGg/EtKEGcgYyflgjf+8uMzgVzQZmvaydbohnzk7+V9Zckr782bhuck+aEZuwpeeE/lvkwWQppsgeryxokareqrBoLRSfFLSc58+HqpklFfWOq2LXHtF/EiJR5tRk6fHJfmOT0NoQ0SL4fD+Fi/WUZeQ1MZvEyq7Z4yqvXPFc1aBR7c9X+2aTziOohUI+MVgE68+E4ov1YWdDI9mPydnPnoEt6LJm+zO91GAnUQLzomUjtxLxdTvJWUNKcujKBtUSH0wcHflfzHXS7J4mUjNaNE1grm6oLIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtVuK/f73cq+WkDsH7mrgxfDKUbOKSQABxyVCaQNq+U=;
 b=VVKi8NXKzvuq4REpdqGK2GjKZpd589WRCI8XgpFUJVVM6ohpivbOuJkv275zkVHDzdvl81Z9jA1tYdnavzOQfrDPR6Yda5Wxsc+QU0jYQ80WOvJEZQnqSLwqMgFermwApw+B6HnizM5pB1iix0EHQCRtqYaXpu3v1rogNu9mCZWZNJRZtV561fRdPqR4v2e3FRzktmEOnbnwmr6xndpLTah6vEHfGhsmn/8/OSZc3gug5vbD6PZrogzC4fR56+a4GgzvUzG+/ZFb26fenvPetUbU4Ds4oHOUdXMuoSgB2DJyM1LaRTRHF+9ndkw8YRg1zI9CR9DeQBh1FwQwSTHFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=google.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtVuK/f73cq+WkDsH7mrgxfDKUbOKSQABxyVCaQNq+U=;
 b=KTxrkKRkgt2h6XsikVdf7EywetZpB4ixJuiMFECvm5sy6Tw1XGOcBQ3pgLdfXEzVYEm6YERu075uhg/0g7r9LrYnORv6BMRRHy5UkdG4gkLqZASJCsYRYeQ3Q9JAdK8IkrGCEef1ee3UjGh8k+/L4OZllKq/X2lsU66YgC7Jb61A6Ds1rt+/6GWF8GYsXjDg77OW2SjC/3sq6uqlXBDDqfXRX9ifgDPtRjDK27Yb27h4wCWmjvhidb2nqCR4BNed5HAi60GNaZHWfdUhM4Eq+cbXsM0T1oEcrE367qMrjR2HVGFr0BVuMDBM8trlk2rjVFsW2o69oUqodQmIoJRaIw==
Received: from AM6P192CA0096.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::37)
 by VI1PR10MB8061.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.11; Thu, 23 Jan
 2025 05:53:30 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:209:8d:cafe::e2) by AM6P192CA0096.outlook.office365.com
 (2603:10a6:209:8d::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.17 via Frontend Transport; Thu,
 23 Jan 2025 05:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 05:53:30 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 23 Jan
 2025 06:53:30 +0100
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Thu, 23 Jan
 2025 06:53:29 +0100
Message-ID: <17ceb0bc-af4c-49dd-ae8f-9b7361e54d33@de.bosch.com>
Date: Thu, 23 Jan 2025 06:53:29 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4] rust: error: Extend the Result documentation
To: Alice Ryhl <aliceryhl@google.com>
CC: <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>, <daniel@sedlak.dev>
References: <20250122054719.595878-1-dirk.behme@de.bosch.com>
 <CAH5fLggwj6oazuXRFP6by39U-7EhQ3kQnfmAMksV-dbma_UbQA@mail.gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CAH5fLggwj6oazuXRFP6by39U-7EhQ3kQnfmAMksV-dbma_UbQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|VI1PR10MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 27503698-38ba-4d03-f891-08dd3b7243a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0cyYVk5RVhCR1Z0d0RiT1JvQkdtTE9tYUdhV2krQ0Q1ZExKRkptUUNpd0ZR?=
 =?utf-8?B?S2VjWUhSWCtjV0xhdkZlZDZIQ1pLLytuVjVZZUlKdldqRzlEd1NhL2dXVWVQ?=
 =?utf-8?B?bVN3anhWUkc0MXhYUk5SZlVrTkFTYVVoRnJXRmRRNkJnY2tkVkh6b1hyRktV?=
 =?utf-8?B?bkx2Sm4vVDJrSHhaTDYva2FjRjY5TmdHRVVYekhhcG5pdkVEOXVTc2R5Ty9G?=
 =?utf-8?B?Q3dNblJTeHA0MmJUMzdhVlBmMnRJNzRNbFhMbjVYb0dSakVLcWRXRG90Y2w0?=
 =?utf-8?B?bktZcktPNnI1b1NrSVJINWdKeUNIdnA5aERZdGRJUjFMYlB5MkF1bjgrY1pO?=
 =?utf-8?B?NDlvdklvY1grMCtnZWZyTTg1ZENDdjZCeGhhdjYwL3hqQ0dzQnE5Y3BWUGZN?=
 =?utf-8?B?OTRPZU5YZXRkdGk5U3h1NlVBaHRpT2V5R0QxRkszSWhpeHJiMXNreXNvZFFr?=
 =?utf-8?B?R2lVd2kwbkp5ZWl3ZUR6enFCa1A3ZU4vMzFQeHJwSGRUeXcrcCtQR2VJWWtm?=
 =?utf-8?B?Y3YzWTIrTkJnMGFSamxFKzY4N1NpVjgzYjhtQzEzWlNtM3BlcXJSNmpKaWpO?=
 =?utf-8?B?TThkdU9WVG5sNmh4cnlnd1JiZWV0NEdrcXZnQkRsaGNEcENtdXpON2ZtYkxL?=
 =?utf-8?B?NWNDR29DYzF0blloSWZYc09HUm5CUFZ6UHpqRXgrVk9uUXpueU9qVm5uelJs?=
 =?utf-8?B?Vkc4dlViUElLVElheUNnZEVJZjNkNFh2SzA1ZjAwWHVEZ0o5bHhrbm1kTTVW?=
 =?utf-8?B?Z1A5eU1LeU5EakhTNXgvenYrZEZLTis1R2tKQ2xBR1RZMDJCaFFPMXZ3cGwz?=
 =?utf-8?B?dTFUWnYwWXl4d0RkNCs2ZFFCbCt4SFRvcVVpQ3BWa3o2czB6WkxxZlRsT25H?=
 =?utf-8?B?bUJ0YnRxaHp5TURmZFc1WWYzSWVwVk1iZ2tnUUI2U1RQd0tZT1MxTEdyTks1?=
 =?utf-8?B?Zll2bjRENlYyNmpDRkJ3ZlY2MGQ4MEUvZVJ0U0lBK1k1RVhsNHNwdkxzaFk4?=
 =?utf-8?B?YnVmZmY3cksvQWc2Q0lmazdtNUY2N05UMHJWTDhlTlVaM2JyVzhYcmd1UEc5?=
 =?utf-8?B?dC9LVDYxeFVQbTR4N2tnRTA1THRUc3hCQVdhS0tVblJ2eVFvVEQyMW5xVTU1?=
 =?utf-8?B?RUFPVHVGeW5sTEFISndVbUtGV3BGNUtTS3JZb3hxOEJjVVJId2Nmc2dDc0ZL?=
 =?utf-8?B?TlFxd0FHYmFnVnRMTHVCZm1XY2NyNWZvb0VIQUMxam5OZ2xBbUdDNS91KzZF?=
 =?utf-8?B?aDhpZDhRY0ppY2ZRWUt5alEvYjRwYitWeTVzQnMxYVAzQ2lxWGhRUlNEV0RS?=
 =?utf-8?B?alZKVkJQem5RdlA4dVVKSkpYOE5FU0tFYUNyMDlUc1d0bjBJWHpFNVhnOGJZ?=
 =?utf-8?B?NWFTVmpDdHV4L1ZQbmwzaTc1bHN4TTN4M3lZUFpjUjkxcTBpM0Q5dWx6c3Nx?=
 =?utf-8?B?Q2ZBQkhnbnA2ai8xRE1EbG0yZkI0ZnkwQW1Vb09heWQrRTREQ2p4akVUUll5?=
 =?utf-8?B?enlqTHN6Ni9Yc2dHLzNXYk1mZmZvRDJCS2tCS1M5WVcyTVNWNS9JMThCTk4y?=
 =?utf-8?B?YnlhRDNFV0xET2tKamtLQ3dyaWo0VG55QUdTSUZ1R0FNcGgwUm9GNEF0Sysx?=
 =?utf-8?B?MkFLQWhZM1dBM09wbVA4NVFvTzIyTVRCVHFmcy9Qb3EzZzlTNmZJTEdMQUdY?=
 =?utf-8?B?MGgwOUthc1FVM3pWMWZQcndCY2xJaEplOW5XN1J4dC9GWmJSNkZmcHJvSkpH?=
 =?utf-8?B?OTd6elZiZHY5SFVBdGl0emkwUEVyOWhUZTJMVjE2OFRpMWg0aElIbGNhaDB0?=
 =?utf-8?B?UWVXZC94UXVsZmVKaHlab3pEdWJFVHZ5SEMxcmhyQ1VSNHFWcnlybS8xSkNt?=
 =?utf-8?B?OGpvRk4rakVhSmxLckVaS2ROUlk5TXRneW5pQWJKWG9GWlZ3dmpDc0lBS3lq?=
 =?utf-8?B?VFFvblc2YUZER0taTG42cFF5eXJ5Y1ZsZjhjNmhsQnNQK0pTSFhLOG83RVUz?=
 =?utf-8?Q?AvqFHJXVK4KWsnaQlEPbCi1+km61Q0=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 05:53:30.3023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27503698-38ba-4d03-f891-08dd3b7243a6
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8061

On 22/01/2025 10:17, Alice Ryhl wrote:
> On Wed, Jan 22, 2025 at 6:47 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>
>> Extend the Result documentation by some guidelines and examples how
>> to handle Result error cases gracefully. And how to not handle them.
>>
>> While at it fix one missing `Result` link in the existing documentation.
>>
>> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> ---
>>
>> Changes in v4:
>>  * Drop the expect() example and put the slightly rephrased
>>    unwrap()/expect() description below the ?-operator example
>>    (Alice & Miguel)
>>
>> Changes in v3:
>>  * Slight rephrase regarding panic() vs BUG(), whitespace and
>>    newline fixes, use srctree/ syntax, add Rust reference link
>>    for Result(), evaluate the result of the examples etc. (Miguel)
>>
>> Changes in v2:
>>  * Improve the linkage (Daniel & Alice)
>>  * Reformat the examples, add if let, drop "automatically",
>>    call the example(), improve the formatting, etc (Miguel)
>>
>>  rust/kernel/error.rs | 113 ++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 112 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
>> index 0b01975c2286c..b4e59feb17a7f 100644
>> --- a/rust/kernel/error.rs
>> +++ b/rust/kernel/error.rs
>> @@ -254,8 +254,119 @@ fn from(e: core::convert::Infallible) -> Error {
>>  /// [`Error`] as its error type.
>>  ///
>>  /// Note that even if a function does not return anything when it succeeds,
>> -/// it should still be modeled as returning a `Result` rather than
>> +/// it should still be modeled as returning a [`Result`] rather than
>>  /// just an [`Error`].
>> +///
>> +/// Calling a function that returns [`Result`] needs the caller to handle
>> +/// the returned [`Result`].
>> +///
>> +/// This can be done "manually" by using [`match`]. Using [`match`] to decode
>> +/// the [`Result`] is similar to C where all the return value decoding and the
>> +/// error handling is done explicitly by writing handling code for each
>> +/// error to cover. Using [`match`] the error and success handling can be
>> +/// implemented in all detail as required. For example (inspired by
>> +/// [samples/rust/rust_minimal.rs]):
>> +///
>> +/// ```
>> +/// fn example() -> Result {
>> +///     let mut numbers = KVec::new();
>> +///
>> +///     match numbers.push(72, GFP_KERNEL) {
>> +///         Err(e) => {
>> +///             pr_err!("Error pushing 72: {e:?}");
>> +///             return Err(e.into());
>> +///         }
>> +///         // Do nothing, continue.
>> +///         Ok(()) => (),
>> +///     }
>> +///
>> +///     match numbers.push(108, GFP_KERNEL) {
>> +///         Err(e) => {
>> +///             pr_err!("Error pushing 108: {e:?}");
>> +///             return Err(e.into());
>> +///         }
>> +///         // Do nothing, continue.
>> +///         Ok(()) => (),
>> +///     }
>> +///
>> +///     match numbers.push(200, GFP_KERNEL) {
>> +///         Err(e) => {
>> +///             pr_err!("Error pushing 200: {e:?}");
>> +///             return Err(e.into());
>> +///         }
>> +///         // Do nothing, continue.
>> +///         Ok(()) => (),
>> +///     }
>> +///
>> +///     Ok(())
>> +/// }
>> +/// # example()?;
>> +/// # Ok::<(), Error>(())
>> +/// ```
>> +///
>> +/// An alternative to be more concise is the [`if let`] syntax:
>> +///
>> +/// ```
>> +/// fn example() -> Result {
>> +///     let mut numbers = KVec::new();
>> +///
>> +///     if let Err(e) = numbers.push(72, GFP_KERNEL) {
>> +///         pr_err!("Error pushing 72: {e:?}");
>> +///         return Err(e.into());
>> +///     }
>> +///
>> +///     if let Err(e) = numbers.push(108, GFP_KERNEL) {
>> +///         pr_err!("Error pushing 108: {e:?}");
>> +///         return Err(e.into());
>> +///     }
>> +///
>> +///     if let Err(e) = numbers.push(200, GFP_KERNEL) {
>> +///         pr_err!("Error pushing 200: {e:?}");
>> +///         return Err(e.into());
>> +///     }
>> +///
>> +///     Ok(())
>> +/// }
>> +/// # example()?;
>> +/// # Ok::<(), Error>(())
>> +/// ```
>> +///
>> +/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator can
>> +/// be used to handle the [`Result`]. Using the [`?`]-operator is often
>> +/// the best choice to handle [`Result`] in a non-verbose way as done in
>> +/// [samples/rust/rust_minimal.rs]:
>> +///
>> +/// ```
>> +/// fn example() -> Result {
>> +///     let mut numbers = KVec::new();
>> +///     numbers.push(72, GFP_KERNEL)?;
>> +///     numbers.push(108, GFP_KERNEL)?;
>> +///     numbers.push(200, GFP_KERNEL)?;
>> +///     Ok(())
>> +/// }
>> +/// # example()?;
>> +/// # Ok::<(), Error>(())
>> +/// ```
>> +/// Another possibility is to call [`unwrap()`](Result::unwrap) or
>> +/// [`expect()`](Result::expect). However, use of these functions is
>> +/// *heavily discouraged* in the kernel because they trigger a Rust
>> +/// [`panic`] if an error happens, which may destabilize the system or
>> +/// entirely break it as a result -- just like the C [`BUG()`] macro.
>> +/// Please see the documentation for the C macro [`BUG()`] for guidance
>> +/// on when to use these functions. Alternatively, depending on the use
>> +/// case, using [`unwrap_or()`](Result::unwrap_or),
>> +/// [`unwrap_or_else()`](Result::unwrap_or_else),
>> +/// [`unwrap_or_default()`](Result::unwrap_or_default) or
>> +/// [`unwrap_unchecked()`](Result::unwrap_unchecked) might be an option, as well.
> 
> This sounds like unwrap_or() and friends are just as bad as unwrap(),
> but in reality they aren't since they don't panic. Maybe a paragraph
> break could be nice?

Yes, makes sense. Ack.

Let's see if a version 5 is required. If not, maybe Miguel could add
that paragraph break before "Alternatively, depending ..." while applying?

> Otherwise looks good!
Thanks!

Dirk
