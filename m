Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021077.outbound.protection.outlook.com [52.101.95.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADA52E054;
	Wed,  9 Sep 2026 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964584; cv=fail; b=ShMP9aFBSOY874O8SYkGz4HzVbCJUNSKOFpGGTYQKI2Zx23vWzngkDCm9q/m9DSlr1TbStoOArgUO0eEFqwdWahylXJQH8ESmUABFx3SMVFuD4L8Xnnknzd4Rzu4os+bSsEPomGzjGu1MG0/sPskzu/xQpCtqoGKk8BOSCYjQ1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964584; c=relaxed/simple;
	bh=xObNlwGfpYxSIBHiybyxyA8aKG7A+vNbHqZOO9OsCwM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Q/Osjs/JwOYdP0BemyAm3t1Bc5/MK9BZWXgiKOmIq1aCAwqlVWEp3yLqxxZvNnAs1y1qIUfC1qQJ3Mz7ds8BmM5RPyRAz+mg8cJBiP/W+5nYTk181/KUmv3XixS4my0+ounexiZ++nZjb1rWAyPVDTFMTukLTKKdOKiBGNQzxME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fyygb64y; arc=fail smtp.client-ip=52.101.95.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fyygb64y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeQKenEr3FgOnVYMtdg/jUBhKLpQTkLaFCpTpOA3VRL71/Fyp6Suj9WVi1O3sAo2/Nwnvkj7MrlNspuPmDKDyNbLB8p4R1CMlq9srnKSHU8fnDs1/mmmiXRQR4r28OhZh7nJSpILUdcDiHZ39PU3vjJyABbF/r5vwHiNf2Z89klrYp8n8W6lOV8TTzcxu76vkwF3nrLylu3Y4B7VW9TjhESc3ihNQlLxSaX1I5+Ga85s6SIe7znN7XklLX+assqt4v6jhjh7JNntwTW/+4ptdW6qjYm6OS6+fJdY+CTOm7B1An/3Z6Rylg372K1lgEtb50lU5+DXXSxTkbj9Evyq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOLH6zM3c75A0aGKDwxU4Oez/JZWunnybzhzwn3Jh5M=;
 b=CirEuOXX2zUzIHrxt1f1dAsHlvKmSsyeGqXvNBxu0hUSYvju21YT55Dd1MXpA2gD7s+t1qUJCNIZMDTU1bXBzvb0p+zHowa1WExwbPG9gWL/rtQhDpAuJ14ppY6nqiNnDxEZ+GmkM0zeFoQTWaO8dEemEMsCmt79RFCOsfb8uIciEnSb3j30g74z5klNLf2hmj5ZnIRqA8x4DwaEr30Qd5rtFonHRWharDYN9W0esA8ukTRgLWYlcPhVQcn6xhYjUJw78p63Ct2wGrevjFHsj2GvndjkbhORwUnYQ9QTteaOfpHh4r6If4YNl0X4Eo1n+lDLof3RouVt9Yl/RSKt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOLH6zM3c75A0aGKDwxU4Oez/JZWunnybzhzwn3Jh5M=;
 b=fyygb64yG/PwVmjxZGGCUVEu0032UnMUfzOHwMXpzYSG4W2U0kE8XWMYhgYVAZKiTZKUfWj2kIEkdL6xm9V/GmJaZxIKfQbQTqsVfm9THBwyG3cP2aO5OktLLCk4ulbM+cx3IN53o6aGP3QGoxlLNU5NZ8DVfqAi3jjlUFEYGng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6513.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 14:36:17 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 14:36:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 15:36:14 +0100
Message-Id: <DLAV0JX3XOKM.2OI6E3M1DLZMY@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: const_eval: add `#[const_eval_only]`
 attribute
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
 <20260903-cv-v2-1-e93b1613e40c@garyguo.net>
 <DL8YAXFG28GT.11FRAWC7NUBM7@nvidia.com>
In-Reply-To: <DL8YAXFG28GT.11FRAWC7NUBM7@nvidia.com>
X-ClientProxiedBy: GV2PEPF0001A331.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::68c) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc948b5-d6d6-4726-2aa1-08df0e7fb512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|10070799003|376014|7416014|10067099003|6133799003|18002099003|22082099003|56012099006|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	GX00gIiuCo69FUgq3C44IGG0Is1yPrjNYkwYLYIjQuQcXjBxnLqv6AcxbuWH9NRhrtdcIPuxCeUq65foy7dA9WWvgyRnkNjCtYsbKd43HtgSOA71E+JI79XdA/NRIb0Isk7+1Zbnu+yvl4sGyCmSdM0wlCRCaLyefAiKRMc581dXsa7K7x+yuol4+eKo/H99BcpxbEZ8JotI2Ndqzz3pCK+irUdrgNL2PZy2OA6xJVKF2/T2KgV3MH3Mu6GHCTItkkUqj3e7GM/8+ziChgKm6Ti14SCcvwBu4ILGmb/RV1F/4L/wWqv4CvR457bBO2S8xbQUXx83rMAfW+O03EGi5fVqvDQoRxcBEqyPHB5rUPDta05FBnSRqXs9tahKmXtHSLfcP34iGHvzS7TZ7gOE4mEt0kHudzEQanpqguIhZCwr7XP/aDzzqV/pjIpcd0EF0Durhn9DQPqxy/sIComTMwRywaeA+mYXzACzlgHkJhpZU0dHVZZseziXOXZp1AEtgPAVXQEe2KTXenMlbkB/cv39K1PYAij2a//sHK5wfI7yHoA6js8zFO7Qg8Ojh77nthntfSjIcqpKlvuQfEDNXJT1bY0eShEBEtXZ9zsE7ttEKQf5fne26wdTYU2VagEpLADAK9fYYUEtlE8E48u6V6rBVKzaqYHdmeaEZ9/zibg30gy1S+QunwXMkerhpOz1a3BSs/cl5pmHHOdZkvJ+vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(10070799003)(376014)(7416014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3JSZ0dVNzdVM1NTa0hhTjJHc09nSWFkRzkrbUVRK3NObkxuMnlmcDcrUGhK?=
 =?utf-8?B?ZXlrWjZSMnZvVEsyR3FrMjd6ODc1VWluTmxxZTlQL1pDQXJ1V2xqdUZTeUFJ?=
 =?utf-8?B?R2dheVp1ZFhZM0dqZjJGUlA3WTVMWWV5TzdSMGh2eFBSMkM0enc2K21MUXpl?=
 =?utf-8?B?YTF1eTNFUHNlYzdnYWh1aFlBeDFBRkJpRkE1OEtsM3lVZUdCZzVQcFJrUytn?=
 =?utf-8?B?TVI1azZXUzlETzFLUE5Yd1BmRmZSdncrdWx5RURPZFdaeldNZm1FNFd0bzYw?=
 =?utf-8?B?Um1VZVA3NXl6N2g0OXhjcERmRFZSQ0FqcWNBUHNLczR0SmphUnpyUVhYVVNy?=
 =?utf-8?B?b0daaGNGZytWRHhFcSs4aHNWRWk2bWFwbnhiU1hhMndhNkE0QUc4TGVvTkdJ?=
 =?utf-8?B?WUM1MzFrZnNlSlpyZlpEWjNBdWF1VXBhUm1BS2wwd3ArdUZDSk9WVG1tQ1Zi?=
 =?utf-8?B?aGpuRFZBc2RTL05yUGg1U2xBeXczVWN6SFhNQUVYWktxOVdwZEF5dndYTEZ4?=
 =?utf-8?B?UVVZNTBvZHYxNEorQWhVZzVrMDYwNURpYzlQQlZjM3dlbzF0YUFUNExoY0dv?=
 =?utf-8?B?ajdveVo3RGtRSXM3dHNpNTFZMnB2a1ZzQThBckx3VkxvejgwbnFWeHcxSVJU?=
 =?utf-8?B?UldxdUdJSTc4RnYzenJvelBqdXRuM1NYMCsrZGRrMTlkYTBZVWZuaEt4OFY0?=
 =?utf-8?B?N1piWk11T2dHUU9vWEZaL0RtVUZxTnhKK3RTenkxS3JVLys1U3BCcXBIZlJs?=
 =?utf-8?B?ZjJHdkFwUVV5bjBVWExhVGt3dkRHdVhMNExiTzluTXJIOFhkc1Y3K0xTZ0xo?=
 =?utf-8?B?NUt0R3A0eEFNNDBpL2pXdHpRWWRsNDNTZjJqTUlQSi9zMXFNN0NPZmpPNlJK?=
 =?utf-8?B?dGFwcHg5cVdjaTZlLzVKV2tkMTM4ZEUrcWtXYS9uRmNiQS9LYmR3dXlRUng3?=
 =?utf-8?B?aUxla1Jucy95QzVvVi9qV1BQU2syODd3Zkc3SlNUSHoyeDk2eFJ3RUM3UTIv?=
 =?utf-8?B?VEVWbmZTenc0K2VLYnpEbkZpZ0QyQzkyOGdVczdlUTRCUXdZSmgwNVh5OE5Z?=
 =?utf-8?B?Zkdqc28zaFpXc0lOSit0RjJRVFdFLzFIOXRlNUtHd3lqelM2d1ZOanJZZ281?=
 =?utf-8?B?OE5JeVF5SU9UL2ZlQnJIMlo0MUYrNmtncjdjRERENXdmMTZyTXhhYzhpZnlv?=
 =?utf-8?B?aHp4Z1M2UC9rdHlPRFZkY1g3SG9hcXUrVmZSRnNpeFluUFpQRk1kc0VVL1Ux?=
 =?utf-8?B?QVBlUEJFSWY3TjVpYUpnZjdjV3VIdGFqY3hMNHNUd2M4MkZBc1ltbnc0Z3NQ?=
 =?utf-8?B?dnhLcGpJczJ0Q3liTjNSaE52MFpzN1FEWFZXVmFuU20yOXhmRjBBQUwwUlVU?=
 =?utf-8?B?UVVDU1hvMFFLYjR6S282MDRaVjlzWXJFczdqdnJ1WEhNM05MNHdHdnFLOW92?=
 =?utf-8?B?a21iem9CclAwaENPakZWQVA4QVk0T1dmT3hIWTBTYVl6WHNLMVpqWVNWZzVk?=
 =?utf-8?B?Zy9lMlFkYWJ2aHhvLytJVDBJV20vdGhnRWRkTjJDRlpCRHQzSnBRWTRXdEF4?=
 =?utf-8?B?S2ZIWVlSU0lqU0syMERRR1RDcFJQSWFoMHNycWw1U2dtK1dUeE9qbUNkdURo?=
 =?utf-8?B?MG5kdWh3WUt5RDFQZFRqQWhJV2VNcDJLNm50Q0dPRFhNZjF3bmxLL0RrcjBB?=
 =?utf-8?B?NGdORFk5cGlhMkVqSnJpd0VlQlcwVVh5dzVDT3pQNUdrd1JPMDdTNm9yYnVP?=
 =?utf-8?B?a25INUxWbmptRThvOFhFNUpxMjA4UjdpQjlEbmxrVVNVSllJb3NreUs0dkhI?=
 =?utf-8?B?L2YreFVvVmp4YngrK0xQbWJZM0d2dVVWNGhnbnBTbkJ2UEVOWkZDMXZiRy9E?=
 =?utf-8?B?MXRRMmlNYVVrQlVWTFdybi96NXNFSUl1Q2RYOVYxVEY1RmtlbkE3dWwyTnl2?=
 =?utf-8?B?WlN2WVlLUlZiRm9WNndST0Jad0ZWREVQL3BFL2N1cFlVZkR1Y3ltWTRsTHJh?=
 =?utf-8?B?d0pJZFMwbi9nOFgrV2pPVnZmYm5wcU4vRFl1NmFFNDV4ZmJYTnJKakUxZjY4?=
 =?utf-8?B?dFRkUlNnWlQraUs2WUhuVmlid3N0Rml4dEgyeXQzd3BNK1pqZmU5VkpuOXJh?=
 =?utf-8?B?bWxGNmc2NFlWVFpQbHVBMDBqenBJOW4zYWpRWmpzdGxwb1ZPUUZwd2g3TzR2?=
 =?utf-8?B?eG1VVzBMUU5UZUhvcHArbEJWY3luT1B1Q2JVdTQzbmhISldVK1djUjUzaDlU?=
 =?utf-8?B?Z2t4dDdLeElWVXRuMTdsRlNWL1k5MWM2V3ViN1h3RmVDUnpLZVUzemJ5MkpU?=
 =?utf-8?B?UUJnZ2FyZ1FFd0QzN2pxdmNmWGxqOXJzUnV3L0NsNUVYVkk2cHdkQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc948b5-d6d6-4726-2aa1-08df0e7fb512
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:36:17.2291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKE+finsVo5tRkIZZWswohlN657NsAlKR7U8bvQN2v/Elp+JBKQOS/zw6NNfmQqzBq/VhHJ6j3XvEIdczAkGIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6513

On Mon Sep 7, 2026 at 9:45 AM BST, Eliot Courtney wrote:
> On Fri Sep 4, 2026 at 12:21 AM JST, Gary Guo wrote:
>> We have a lot of helper const functions which are intended to be used
>> during const evaluation only and runtime calls should not be generated. =
Add
>> a macro to denote this explicitly. This is similar to C++'s consteval
>> keyword.
>>
>> Convert device_id.rs as an example.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  rust/build_error.rs       |  7 +++++++
>>  rust/kernel/const_eval.rs |  9 +++++++++
>>  rust/kernel/device_id.rs  |  4 ++++
>>  rust/kernel/lib.rs        |  1 +
>>  rust/macros/const_eval.rs | 24 ++++++++++++++++++++++++
>>  rust/macros/lib.rs        | 21 +++++++++++++++++++++
>>  6 files changed, 66 insertions(+)
>>
>> diff --git a/rust/build_error.rs b/rust/build_error.rs
>> index fa24eeef9929..b7ef80596f1f 100644
>> --- a/rust/build_error.rs
>> +++ b/rust/build_error.rs
>> @@ -29,3 +29,10 @@
>>  pub const fn build_error(msg: &'static str) -> ! {
>>      panic!("{}", msg);
>>  }
>> +
>> +/// Assert that the code is in const evaluation.
>> +///
>> +/// Triggers a build error if called at runtime.
>> +#[inline(never)]
>> +#[export_name =3D "rust_const_eval_called_at_runtime"]
>> +pub const fn assert_in_const_eval() {}
>
> IIUC if RUST_BUILD_ASSERT_ALLOW=3Dy then this will not cause a build erro=
r
> anything built-in. I don't expect the call will ever fail to be
> eliminated by link time here, so isn't it better to not use the same
> mechanism affected by RUST_BUILD_ASSERT_ALLOW=3Dy here? Guess you would
> need to make a new file for this.

I could do that, but I also think it's not a big deal to also allow for
RUST_BUILD_ASSERT_ALLOW=3Dy builds just to simplify the build system.

As long as we have people building code with RUST_BUILD_ASSERT_ALLOW=3Dn th=
en the
problematic use will be caught.

Best,
Gary

