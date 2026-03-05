Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF6330ACFB;
	Thu,  5 Mar 2026 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707111; cv=fail; b=almYEHtR3hIsz/Y6QLI5h+bVE9SaBFsGjo1JsIm7UsXjvHfxz6TKciaEY4S/4pgoStHshVaLSIWW1pywJYg2z5tgShgkDpsSZse7rjHU9VbjXD1gIhUxJ8xjDjiDIDF/U6vBEOOL9fiHAlVmGmLjFo6vtEM1DLWm7v2ykj6oCq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707111; c=relaxed/simple;
	bh=BjZOmDEuhyObs4IeOmFxX21fOIetPaOenyYmk2JMHYY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=eUOkWt05Po6Xrs5A/hKDZ0KUqmysOKXngQtD8TAq4ZxJlbdER5scApDEjdtp414hxSgdNmkwmOLzEPrTpr/pfvFtfKjRr2v9Kk1PVNZT8cI7XJO1hTrqw/EjF8NgEpRoouXcwaj8O28OkWid3PKI9EdlINPINmV9hIl9VzqFmeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b3gySlEX; arc=fail smtp.client-ip=52.101.85.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b3gySlEX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGl98+kFS2Vgc5FHpzu+yLmHBpS3dt0p4KhoP+HZpWpxWI/Z/drJflQiY2mRgPifAokM/d5USlx4e3w2wPU4VJ+NBowrMHw5qifoFtForo15LOe34OcwXtaBojgyYEhiY4oXkkbQNl4uBMx65DN/envvfytxmlGzUM7/BLKG0UOwT+L9gY2SCX3XUMrV50m8496CblDfweNOGxwwFfyzRHBPD61H2DKKNc1/RdsrAFR1X9JEgZkh7lrUb3OmRmFL/YgZVA3ddmu/dyg0JViBjJ4rBcToyVCCL3Qq4Bc6L03eaeRpxiTmbORWNlgjZH/W9EaBIBk3C+G65p8D3X1MqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PPQgpSO7wVbMb2mbzS5a3X2Xrrr6yBqzgEBGji5K6A=;
 b=KN8VaCCcpsxbDuduKI8SX25MvJTqLip58+Y3EnWVIqq/mP72Gi6knWBVy9pTS2wha+7nsfmCv5loH8+eSVewui3Y23iAQMW8jOE+7SzBHEeR8noEfjk4TbkmbPUr74oQFic9tC9e1AWkrGWbje7Jvl3/XFOTSXQ9FJ2Cn4xMU0lBw0MkY63VKlJwhNHdnybGOlEUYbmfy8ZZ49+JtrmGblEfWyAnOHFizhgsbI/y4WGVPLLrVn2ogz+OdqxFymBbHV6MWPiEg43TmIjmhG8szMjjeUZNVs4g0VhovAV+Zr3ZrZL77jWm2vo9w5dvb5rvCK5NcMnQRY71+/fwZMXilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PPQgpSO7wVbMb2mbzS5a3X2Xrrr6yBqzgEBGji5K6A=;
 b=b3gySlEXnHO0w27cJsdvWhTIr16NUWa30T3D8tukITQ9Uuk4LIxpUZmFyHzc6/JXcEK8r3Ei1M9q0TdODlmC4p3MAuzkimsfKH6sNQR4/AWIyrXF01slPe8QUW6UmHTGPEzRfy1K+Lhktv9V9EXdKCFEs9XrkGRi6skQJz90nSjjBQ+i3Ee0CD+0ablODmv4qDxzt9C4G3A3ptN4x6KHg13BOW3ZQ1gN5cE7+5p7U9wnX/p3QRQ3AGgBpcKX4hf0T6xMVvrzg9uSaQo3OmyoSXZFfmQICVO5ySDKAIhrNinRmcsAsiJYhouCd4C+fkh14aZZzrWzNLMz9am/8IAYZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:38:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 10:38:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 19:38:15 +0900
Message-Id: <DGUS7X4TOQL4.OALQTJ9S5B8G@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
In-Reply-To: <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
X-ClientProxiedBy: TYCP286CA0248.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 409a0dbb-705b-4c2f-ac49-08de7aa350ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	5Pc/0bIIABLqs9u3rugjzM7/VOpUDH4bRldt+s4pkXYwi8NW4T/FaTukpjkeAMYDtd5MxFX48CJO7zBDlqYaWKOnCHAUQOEaqL6QyOOTwfVVVPGlSb3VfqlAi+Hmx8URJau10mZ+sVGULtgcJ/5C+8llksAr+vst3ZC9+AFXlr3nqDAj/xZKRbFwW4wJSCwBCfE6TmL8r7SFC94c00pwDfrtLDbNEGADv0Mt+jpc3hbQtE9AmIpE9TkUtGPHci8U0o/4NMw27/RQdX8cmK/RNSshGk1aZeafOeJFWDJ5A7Vj26wIyZIGcjNl7jTgW2WqYNfVW+xsGGFyvQP49JdodKp8XCveD0J9ScCwcc/uA9e+PGTrN6bNu2bYlOmO8UZc8qiqhGM0aGUHCIJW1bmIiiOxRTc6KkaNAX2xMlNVniDEM5REN0e6cO8/55cSICGLJtXJpTL7BX+6tf0dWnIToDR5EJrEQlir//Plm3LaPCnS0lyUfC9/j26I5SDnnixCqproHqAfxZaydlhc5RDz+PRJNoNEczqF5XffwTQZMUtyb0X3OkDMTVktlCBfBvxdexHvNGgC4eRZhYLEdcTPixF3Fo8qNe2Lg/AmvyjujCgOzKRMi1WVQmWsLQ4V8o+bH9oX22AbCESyB0cdrYMIqaG/zG0deNcBOQwaI+YOb7D3OicqrncTa3fMcX5lOgmgNtgfmeEzxI+J4MEROsu8bVg/F7yf68a+++gNzd6uid4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xmNGcwSkxkdDlXbTNicTdNallLUkxCM0k4MXNGaTlMdzQvSmlxRHBmWTNh?=
 =?utf-8?B?cFlkRmxTMjJiWlMzRC9xY3BVbFpnMDU0VWo4a3N1U2ZhUkkyTStqZGh5Um1L?=
 =?utf-8?B?VmI4dW5XUzdsUTd3TW1CRFNVVmZvT3lvcHVFcHVOU2xmbTNPTHI0ZGxleEhS?=
 =?utf-8?B?RlNjZEM3Y3FTcXk0TzZoa2IxMXJGUVFqdmlyY0UwN0ptcy9HZU5jNG5hQzlT?=
 =?utf-8?B?MG9BY2hZb1JBcWVSSGZnVDBRRGpuR1ozSXFIUGF2WldkQVFnT01ZTWlkMS81?=
 =?utf-8?B?c2YwQ3BFSEdTNFp0WWcxa2tqVGFqTTVTZjFNa0UxT3lHT1cyclJ4RDFsVmdR?=
 =?utf-8?B?MHZvdDFKTmJWUGhqZXF5RmJ1OVQ5ZHI2L2hQa0ZKbW5KLzU4OG1scmlCRlBS?=
 =?utf-8?B?WXNtcllvaVhEWHA3bVI5U2UreXFvK0wyZXRuNDJHYW9KZFk3bGEvRzdYZU1J?=
 =?utf-8?B?VmhIaUdIT2IxZVpObHo1NWZpNGthbm5uaXZieTcyZ1dLZXI0UXlObEFvekgv?=
 =?utf-8?B?RjdKa05lemdHOG1NRTRTYzVFeFJFQnl6bkRvNDFHdDVyUWVMUGpQSDRON1pj?=
 =?utf-8?B?YkN4azNGb3Y5QWRvZ1FIdllRd0lieDBjdmQvZENjcW1YTW5XV204VGlqdktn?=
 =?utf-8?B?RzhreS85U2diTFZSbHdSMnVmNG5WSG9vSmx2WUk5SkdaTFdEdlB4QkZRTk5U?=
 =?utf-8?B?bDVnYnhwWUtCbVhaSFN1Y2lJTHlJUk9jbnVxbVhNK2t3Zlc5OUpXOExKQXdo?=
 =?utf-8?B?Z2NySzlYNldLQjBnK1NrWllZWWRKTGNKUzZDcHVLL3ZUa3ozQmVTZ2c3N1hp?=
 =?utf-8?B?LzIwUVhKWFZadnBYcytwYTdpa2ZEd2tjb2VmUGRsNGNmSEM3S2NUbjMwZHRF?=
 =?utf-8?B?Z3o5cW01MnM3RzByWm5VZXd1TWRoenNidnF5M2dJUDlpOUNoZThsc2RzbnRD?=
 =?utf-8?B?dVlxTmRYd1ZKOXBuYTJFbkl3SHZxYmdKOFluQStKeXhkVk1HWGRSKzdiMlJj?=
 =?utf-8?B?NjRoY3I2L1V6T0JiblV2NVlsVFB2SlEwd1NhNjJnS3JKQ2RXZzN4c1VOMzJu?=
 =?utf-8?B?R01xdFkwWlZOZnBGUWY3ZTk2d0E4TE82SDIrZE5MWi8xT20xQ01EUmdiU1g2?=
 =?utf-8?B?cVBpVlBkQU0yMDRPSkVUTS9PampUSllUM3ZZUGg5QzVXNU1QQmt2VktiSWJl?=
 =?utf-8?B?QTNYODBLcVhVK0YyZ1d2dGNPOTVab1IwK05kS2M2WGRNZ2g3d2xCQVF3aCtE?=
 =?utf-8?B?eXV2clRRMnh5L1JWaXFDR2FSV3FabEFCbjZ3Y2kzS1hBNjdpRHBvcitIVUVU?=
 =?utf-8?B?UHlPZm0wUTQzcHZQZGJ6ZEhqL0xnWGJ0Z1FTdWdOamxDSzZVOTRTb25FT2FT?=
 =?utf-8?B?bWFjenZCME9tNkJDWEhnM0l4VWJ2ODcvOTJMNEFzaDQxSEdnalhIRThyb0VW?=
 =?utf-8?B?L2VEME9nQTJ1OUtPQWR2dkxlTmlDcUVMQXdkbFhjdzhZTldkSVNiZXd5L2hS?=
 =?utf-8?B?WVlmeVFjbXV1MVZjL2N6dEpud1BwWFc1MGZROHVWUmZ3ZVpJNVUyRlNGdk1a?=
 =?utf-8?B?aUM4cHdHVnVLaEZDTVFQTm11TCt2SFRQY2UyTE05OVRTMUVsVkRxK0hlNXlr?=
 =?utf-8?B?WWIzSnljdXpJQzdlZzlzSXUybCtXeE9SZU1WYnU4eGZBL0IweWlIckJ0YjVi?=
 =?utf-8?B?VFI2K2FOVEF3T3Bmc2JYdnhTTHR5SkJwWWc5QWFjUW1OYTFmQTVJOHFmYlZ2?=
 =?utf-8?B?UHc5V0lxT2c2bFRxVHNlNFV3NUhTQk42b0E2M0VjZGVRWUw2UEtwNDVNb1No?=
 =?utf-8?B?ZUpDdXZmZWc1QVJCb0EwUzdJRm9FZXE3bythT0pDcG4xcDVGZ2hKSUhtQUZE?=
 =?utf-8?B?cDdFYzIzbnpNZktOZWx2NUpEanlTVjBLbzQvdHRIS0tEcE9YUUhuQW1saVMx?=
 =?utf-8?B?aGNGV3JUSW1WMmNhQzk3VGFiWU5objlGVFNmSlpIemRhZ3c2dXk2aFVxdEw0?=
 =?utf-8?B?NWtSLys3ZFROMWRyMXZvMThST3JKT3M2d25qZlhIS0tGWXdVcDdFbFNhSlhF?=
 =?utf-8?B?ZVpyNjFMVEFtaWRxZFpkSTd2b2I4OGV0VENIS09MNGxWN1lFZnVxWDhnRURG?=
 =?utf-8?B?TkU3cmZmcWh2M3pQWVloSFhsYmZteUY1MklRTEdtSGVlS0NxdFpjSXdOcGRj?=
 =?utf-8?B?MzAvZ0lCWXhyR08rZ3d5SHl1a0hPRURVNU5scGhtOWg5Z1EyN0ZlSjRJWlZq?=
 =?utf-8?B?aU1vUWV5RjJGTmxjdTRKMkFXSW54N1VENHZOMjdPYjV6eEtFMmFlL2Q4MkFI?=
 =?utf-8?B?VEZxTDJJdXpUR1FXOTF6TlRjMlJROUtiTm5WaHhlUDFEZ3NnNmxJZU1acVJk?=
 =?utf-8?Q?FWiGh9p7HV5rIBxwr8SvP2J/8fPkq6fhOZZcvAzyzLMrJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 1FfO1TYOX6rt9Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409a0dbb-705b-4c2f-ac49-08de7aa350ed
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:38:19.1588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q0PXPC3QHl1dv2xxqEzXXwaZ9O7780lcupJgTwjlHxuT8Nf81PteP4zBIWSn1+W101zRmNmNKpv9IqNMDnTZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849

On Thu Mar 5, 2026 at 4:37 PM JST, Eliot Courtney wrote:
> On Wed Mar 4, 2026 at 8:39 PM JST, Danilo Krummrich wrote:
>> On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
>>> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Res=
ult<GspCommand<'_>> {
>>> +        read_poll_timeout(
>>> +            || Ok(self.driver_write_area_size()),
>>> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgEl=
ement>() + size,
>>> +            Delta::ZERO,
>>
>> Isn't this either creating unneccessary thrashing of the memory controll=
er or
>> unnecessary contention at the cache-coherency level?
>>
>> I think we should probably add at least a small delay of something aroun=
d 1us.
>
> This is what nouveau does (specifically `usleep_range(1, 2)`). OTOH,
> openrm just does a busy wait, which is what I replicated here for now.
> GSP command queue not having space IIUC is meant to be very exceptional.
> I am not sure which is best, maybe Alex has an opinion, but also happy
> to change it because that reasoning makes sense to me and I don't know
> enough about the distribution of how often it would actually need
> to wait to know if 0 delay is justified.

We tend to align on OpenRM generally speaking, but since waiting should
be exceptional anyway it shouldn't really matter if we add a very short
delay between poll. Agree that it looks better than a brute busy-loop.
