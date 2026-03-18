Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021120.outbound.protection.outlook.com [52.101.95.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BF41C6B4;
	Wed, 18 Mar 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837397; cv=fail; b=eX+tmoFdiczZYeEkC6rP6t0RJPBnBQ19Q/pRqBCrf6IL0K5iS5U/fuyGr6dkVsKM95CXiQDr8900CEexTSLUnp1SD2WT4khUenzd8vnnvccbxgxJvE4WyAVjzbD9sKzSX+J0bv/KXe2ipDu5xcOlrbF+eHr3/FpbscWr6b60iFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837397; c=relaxed/simple;
	bh=YTlrU57LpQCkwRT/pUBWgz7VlDnkx1i0pvx1RC6dBXQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VmczP0BXWuGnfaodFOnxmaMJ5ltiVliSARtshz37T5Xc31MdtmY8MqLXbu6pBQQUAyFe8nJoTyZTroJlcKjISSpgNgIbSf5Xmf2V5MVCR/9TVxqPk/MlZNxlMnnBHsU8witdC3b/LfJii+kwsiecOp2k78O1ajNwuqe47t73Ed4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mnvYBss7; arc=fail smtp.client-ip=52.101.95.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mnvYBss7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmm4sjLRSVWJ/mwmQbtc8M/DkcVmCCo6ljGMhBJL+0MDqCxXKk4NG5n27bXYZKhixiNlCR0L9113wnwHit/sG0DFeOZq3Qc65CGa+k/rfyEkZxfRkqoD+On7G/ITPIN9NWauDaCTHPt1g7DR+OFPuCelqIWruZXTI9trb/lo0v7E9Nji4w3mdS0PSQ5w0cOpkfnWmlvjxl3PhS6uWvUtrzOhOGQk1dDFJw9ifl0jYUoXKscBoMSjv6t/2ZFoCEpKgKqZKWIBtlThMV8GHQCegKVT4L+C3uXl8ivI/yOVMcNqhpY7xna2Vj+v6gSMtWiiqRLaBpZCBGz/AIB2IQuyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trh1XEAOy9RXH2P8gq9WwYZ/7ZjyhLmM3rzpWc9f5Ck=;
 b=JCt0CZVzWemEtZkDC85IDhE+02zRm9jnuLy04mCWTyTtCKpCFR2P3esW7R7sqdn304RgpiJYL2b+viBH0fsjUh/cOdI/pvPLgcE41gaFPWwS22AhdvneTNrE7BlkeVtC6mMJ3e1tCIdq4V1UvQqutDorHjoVQ9nsdq0rrhzYfOqnaT4EaV7ngf+bQ4hgqc0KcWB0VIt2WyWvAg+Hxisl19qllgzaFLnng7NkNeGQ2eYrh2xcY0FlaO3du5eSoxO9qH6pk3apBLRtnD0he03+HIAgYV9tCJh4tnlzZO/wQxm5lj0IFHxse5b2VRAdXVf0snPmPnWPjGB81oVEHh8XYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trh1XEAOy9RXH2P8gq9WwYZ/7ZjyhLmM3rzpWc9f5Ck=;
 b=mnvYBss7zP7zcgO5b355BD5lTqkYGoUSThsIYXRKCNPK3AUpwQ+2078f5/bYVOHpo4tMqzyi8UpewjbBDVu1bH4vLlBfAi5x7ODr/AQOmI036VJek+prgl4e5jO0rMwm3fLLviInPSCnil9aV+EOqALUs31Ka3EIyW7QlmGTz60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6633.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 12:36:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 12:36:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 12:36:30 +0000
Message-Id: <DH5WVJLR9I2A.335QA8BGKWDZ1@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
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
Subject: Re: [PATCH v7 18/31] gpu: nova-core: add MCTP/NVDM protocol types
 for firmware communication
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-19-jhubbard@nvidia.com>
 <b6d58cbe-a375-40f4-ae70-a3d7344160e5@nvidia.com>
 <DH5H95R3ZKJK.3SMHG8B4JP051@kernel.org>
In-Reply-To: <DH5H95R3ZKJK.3SMHG8B4JP051@kernel.org>
X-ClientProxiedBy: VI1P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5176ad-76ac-4620-7cb9-08de84eafc4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xCNhREPhKXjR4b6v9dH+W3VV81k5Uvzjn2CdiFrTquAgi3ZG5f9WrQ4SRPO3FHSRB/Lx483LVs0HirNhe8ZS2+NE25kgEykDRrC9FyEQ+tPSbZNkwcJRgKvcUbIG9/d/S58pUtKtsYTFqo6qUSQEnL0WNpOOzr+qQuCcijspAcmVNRgwqz2HsZS6GjkGHamxKDPAA9Z149QK1PwZCZc3Zq8kbuOmW+Dew+TfvqONcfcbSjc2hU666B/K65w8fOtSs0xffE8jLm57ifQhi5V9/jvf2/pfTSChg66iAxN3GsmGB+IfLBBMg3lgp4pUdvbTbKT/hOtO7ZNsWnN3GQ8esOxPsHnjL2ZeCJIMRrr5mxVYj11R4+oZsXsPkfQOTarNbzgu8FkXdfJaOwpHkQGGqtfHMpzoJqd9mtk/mCOZ4jDcXy6bzWYgX4FKOGJCUpVDlYYBkm59dPqEAkiQBnQBl5NI0DuSy4l7OFVbZ+MRRUxkFViwbBNDVwQU24USAT9PdD+LEJ4HhOCkEsXFgPs9hkuwnle+1PQFjlYs9BVczd+oCXs7Mo3lhYlkyMFUIvNjoZV8MNaNs1aDMzEvdXk+0cE+hh3IAVZc/HGW+z0sxcK4Yog6pD9OXkqF2U32Z12eAU3FzIdbSed3iurjL/ClgjcwkwJpXnsjQvAnF7PhKMMEjWZrAoEt0761HhTw2Q1Uf5igoC+RHm/r4OGzZMSR6Yz2WLRv0C43xi9qmRPC1ZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDZRTnBaSmJsYStULzRzL3kvSkhHdXV1Mm9iQzh1S21DcFZkZllkZk1GUHdN?=
 =?utf-8?B?cmFGL2ZCWHVmSXZKNUJCUS9VMGluaEpDNWtVNUlrVHhFK1JDeWdMamczMXVk?=
 =?utf-8?B?V1J2eGdCRTdTVnRPZmN2QzRuSjgzZ3RYV2w5VExONDkrMVJ2TTRCWEo2cEZB?=
 =?utf-8?B?bzZZREp6WVF6SG42cDFaRHdPMWpnakZCUmp1aWlRWHpqWXVPTE5ER2xCVzNu?=
 =?utf-8?B?RkVTbDd6SVFXMmVNNUo5bXROWG54ZHBJNWZRUk9EV3lsVGdSNnJKZGowRlV2?=
 =?utf-8?B?cXVYWDNWVkEwMU5HV3hTNlFYb3BRQVRYb1M5ZGVlemNJL2wrOWhPR1ZYaEph?=
 =?utf-8?B?UzUwS3ZVVW9yYmVRNXNnZGVFS0VXNUtoRENIQnFlYzIyYUxFdjArRUVQUnhu?=
 =?utf-8?B?UkFsYmEyY0tPeUdLZEpETlBnUS8wcktNVTNJZDVHQTdkRzhlZ0puS2s0eGtD?=
 =?utf-8?B?UjV5MEZXVFJxR0ZHTEd1L0YvZDZBVS9Xc1Byb21EU2NQY0M1RmVLMVBua0VY?=
 =?utf-8?B?NGN3a3BPYlRPT0U4RnhFbm12bmZQL3ppa0xaY0pQaWd4bllSSTdWZS9jNy9I?=
 =?utf-8?B?UE5mL3dBbnZEczd5WnlxM1dDdmZ1QmRqaklGS3pTUHZXSnhISzhWOGNDd0hI?=
 =?utf-8?B?L0ZsMEpFOWhsTksydVdLdTA3b1pjR3JFZHpwbHc3V2VlTjFrQjhNWk9YUEJl?=
 =?utf-8?B?MnMrY0sxWjFuakIvc0YyWGJidkM0Q2x3clJNejQzdSsyS2lGemJTTnllY3Nh?=
 =?utf-8?B?c1FSc2Q3V0QzN2VYU01uTlErUG10RTF6ZnNyYVhhL0FVV1VKWjdtK04zMDlo?=
 =?utf-8?B?cHFFdlRJWlh5elhMZW9FOU5BdDRLZWVKQjVwOU1xczhiWkp2aEFxSlFmcW5K?=
 =?utf-8?B?QWJtUUpzcmRNWlZhaEJacTZwYjZYR0pZSnZtVDVUUTE5SE5kdmlERXRiMUZ2?=
 =?utf-8?B?QTBLdGgvUVFwNlJoeWRCUUJlVHFmYm8rTXBlS05WQUo1T2FKTHpBLzJjQmtS?=
 =?utf-8?B?OEdoNjNTWUdrWHpkbzNsMytuSGsxdG1SRzh0NzRnR3JuK1UrVW5EZk82cFpu?=
 =?utf-8?B?UFlYcmxCRWpuZ0lVTnc4THI4SlNHVzhSQlQzUkpLT2xqTHFFcGtTMHdmQWF5?=
 =?utf-8?B?NTNBMlJvNGVVTXNaeWs2bDNJWVhuVGxTVFNRb1J5V3dQMU5YM29obk9aRmNK?=
 =?utf-8?B?bVM2NUc3Q1BqbVNaVU9pcVlEcDJ6VWZpaFhkOWU1b1ROSW1WdHJmMXBBVTBk?=
 =?utf-8?B?UUJtOUQ1aGVEMFg4R0hqU0RLOGNEMDhEQW0zU0I3bFMzekwyMVhvYTNOV1hp?=
 =?utf-8?B?YnkyT1VFaEs3N0lBdzlISVNEODhOQ2JzNk1HREZ3K0o4emZqemlhSlFIaENh?=
 =?utf-8?B?bHl0VjJJVEJLaElVQVdVcnNCVDVBVzd4ZWNSSUxqTG9BZlpCR3krY1h2bXJx?=
 =?utf-8?B?em9Rbjk0endMODh1dG81bVBpNDZrV2ZjdDI5RjZuSUdCUDNWeFNsSFE3SDh5?=
 =?utf-8?B?WjNmZ04ycFExUTRVaDQwY3NLMFBGb2JLVVJxMDViNVBDL1JobzIzd0NJZTZN?=
 =?utf-8?B?SmRNN1J1aXlOYkxaY09HSGZqTTIzR1lOTjRuS2t2U1FRenc1ek1QVVNMNzNF?=
 =?utf-8?B?RU8xZUhtQWJrUEdlZGVENVVhUFNPaXVNd2lIVjNhdFVwTDVuK2U0UDBlM1RS?=
 =?utf-8?B?bGMzQkt4NkhuM3lwZ3pRMEVaVzd6bXA3MTBTajZzU0NmSjR0MXc0bEFPTWxF?=
 =?utf-8?B?T0RwQlp4ODAxZmJBT1dPYmpYdnZ0VjhHQjhUQ0RtN2pOMk9Nd3FUd3JNMUs0?=
 =?utf-8?B?RDZPM1grbUtMTkhxTXVSMmJBbGpRZ2N3WTh3MldIVzBXdnVLYis1ZjM5NnN0?=
 =?utf-8?B?UXN3bGdudjhMVEcvN2EzTnM1dVFvSTVSMnR4elc2dHpKRXZUNVBQbHZqcEVo?=
 =?utf-8?B?cTVEdjR0K0lJT2F1NFpqdjRFSWpjM3lteXNwa1NTQlRCQkFLb0d4cmx3a3lo?=
 =?utf-8?B?SkNBb1hEN0ZuQU1JYjg3ejFneEw0OXdzZDZzVWlUdkJKcVI2SkJsakluU1B4?=
 =?utf-8?B?RTEwcm9sTjJKTDNaQ29SazcyZ2lKeUpiUnhhVGF4MEpkVU0wdEhlMGlCS29X?=
 =?utf-8?B?VkpsVEdaUEVqTTRPOWlXcWhsNkhiQlJNYXhHM0pBY2hDNjJzVlRiLy9hM2ZL?=
 =?utf-8?B?MFJ1RklWYWIyNXAvOElDbVk5ZlYrUldQNkZOdWtRRElLb0cvNEZRV2J6Q2ZD?=
 =?utf-8?B?Ump4dVFiZU5WYS8wY0FheWV6Vzd3aHhIZHJJQjZFSTRCVDFPMXozcGMxRDBG?=
 =?utf-8?Q?How2oqKpHZaQas161i?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5176ad-76ac-4620-7cb9-08de84eafc4f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 12:36:32.4899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ww3KsP9GDwo0I6c9RQGYMjZNJL9L7qnNV4A9gBCQVCJxPJ/FUZe+C7f/DgK7aQCdAl1hriHta1HSXDwltjWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6633

On Wed Mar 18, 2026 at 12:21 AM GMT, Danilo Krummrich wrote:
> On Wed Mar 18, 2026 at 1:01 AM CET, John Hubbard wrote:
>> On 3/17/26 3:53 PM, John Hubbard wrote:
>> ...
>>> +bitfield! {
>>> +    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVID=
IA firmware messages." {
>>> +        31:31 som as bool, "Start-of-message bit.";
>>> +        30:30 eom as bool, "End-of-message bit.";
>>> +        29:28 seq as u8, "Packet sequence number.";
>>> +        23:16 seid as u8, "Source endpoint ID.";
>>
>> hmmm, I seem to remember my very slightly younger self insisting
>> that fields be listed from lowest to highest bits. And now I've
>> violated that in both headers in this patch. arghh
>
> My now slightly older self still thinks that what you have above is actua=
lly the
> way to go. So, I think your current self intuitively did the right thing.=
 :P
>
> It should be either
>
> 	31:16
> 	15:0

This is my preferred form as it closer to what hardware world uses and the =
order
is consistent with most data sheets.

Best,
Gary

>
> or it should be
>
> 	0:15
> 	16:31
>
> with a strong preference for the former, but this
>
> 	15:0
> 	31:16
>
> still looks pretty odd to me.



