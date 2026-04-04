Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1C72EC08C;
	Sat,  4 Apr 2026 04:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775276413; cv=fail; b=mOT1AV5Y1o3kd7ZZTNZjx3jjSNnyZfCC+lgMBgSiU0j8Wyc6Qd9RTbe2oslzYFlfLII8q7pnGH08ytoOEbHLDJHD+W8oIqEUZ7viLl2wtBRUZ6dIXNFDbHO+uX+VhlbFTtzObrONMzOS3dbdbf6G5tofEnVnWCynk/AN1xdfD2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775276413; c=relaxed/simple;
	bh=ok8qYnACHnsJT4848vP1WoJlmBbCaR3ELvWBF7LIdGA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SvWC0dNu7Fayhtj/ri1OlUH6UkNhgwyZZfmkwuI57gFAhgyOwTfjY6DwlDricEbdIWYO1EPgSlYdwhv8Ap+nLgrS9VVB2wsu3Ye/12ru1suZAHmNKotFvfqpuQVnimglm+i+AZ0ML91vOvLO+H/OpKsd2DwSrg7WUcy749DM7Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IDJwP+PW; arc=fail smtp.client-ip=52.101.56.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IDJwP+PW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ6EtaF+2xKHsDhBCfYjpFchjFb8zG3Ua/J28twPQF0mOmsiqtNlyH0iA3GnqoUsPdvC4azABY4nRs3ZXgZo8tm+VAip127nxqPC96+0DTO6Yvw3B1vvfMt5Tlg2QozvGaGCA8dVdkgyycGV0pesKxeVgafmHejcCVY4Zfuh4QnBno/G30kO9x9akTRoUb0muDeCy5rre4xcridhtHcmuG3IE2zod16HfOdSw3kLG1GieCcDCZ3CKUn7Rxx0KXfMLBHXfj67scqyBKxC7Xv6s06oEfB+XnOMsdFIn3M5NFYHCEwFGDMkktUx7OvAbRzEGfptuArekTcm3saq+40+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ok8qYnACHnsJT4848vP1WoJlmBbCaR3ELvWBF7LIdGA=;
 b=p7un9XQYdYZQL3TTxBsMH64U6aT+4S22Tlu7IFMaXEaSO6l39KSiXVE2CkiXfd7PeWw4AQsmA3a5loIgDs/Ew2+G49ar5QoEj3p/Pfd8ItNjPnPMx88B65pb42CFLTpP/Uu3l3RhnSju0kB4vdvW4xsQDgg2aXeRBMKEr+K/+d4wwqpFJk9hs0nK/D4k3H8ZWyNMsOUG1SSSUuJdIgrAZcBLe+0OAeAfRvk7BCwov9AQmnVawogaoh/lCSLFRioTEvU+LUkP5sulNR77DT0KxP1wtbiifM8O5RueEVb9UEtFZysCNYmZhZXJ32kaX2dtxZtjBjR2MkLoGZqhTR+l3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ok8qYnACHnsJT4848vP1WoJlmBbCaR3ELvWBF7LIdGA=;
 b=IDJwP+PWkxxcr4K5FPto2R7yPDf6s9xcPfsYUvWeSB2hualxdevs2IfD+vtrwEzKQVdEQUiMsQY6nMQKX2A3+EOM0mOoVDi5tgQB5Y/S7w9G+ShctsQu2+czgz2J4XlMf4XpXNEeSYTuy8Mgn2XqX55FGEX/H6SP87dT6BGti6kPwLQ7YTQ07JPtroq7QaK7rXqzxkrQcMkGXzLjRXsXE2cpdSiT8Af2ScA/qjQKOCaCmQ488cAL1vUvzUv/rqP67Dik+KzkBPsN28feVoawpKt2QK6gjph7GBA1qR6mI4CltUJvf0EF+5Sp/2wFWh2G5k2vh9e7oDUqL3D2lZDngA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Sat, 4 Apr
 2026 04:20:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Sat, 4 Apr 2026
 04:20:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 13:20:03 +0900
Message-Id: <DHK2YP573HOD.1VTIFP6GC6A8U@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] rust: sizes: add SizeConstants trait for device
 address space constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20260404021204.339779-1-jhubbard@nvidia.com>
 <20260404021204.339779-2-jhubbard@nvidia.com>
 <CANiq72mEdq_n-8pdiNiKdyBYH2yuAHaLBCQ9hfETupnGmyyi9g@mail.gmail.com>
In-Reply-To: <CANiq72mEdq_n-8pdiNiKdyBYH2yuAHaLBCQ9hfETupnGmyyi9g@mail.gmail.com>
X-ClientProxiedBy: TY4P301CA0118.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0e6b8d-7f9d-4b45-bcc3-08de920173f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	mtkpv8qH1MWoKpZpJGzLNxlEfYcgk/uDie5VwdzxDNZUp6CslzCAOYND3e9CGEOMRQBVVRxn57vEwweyuKYHbNscEkntLiiPRlmMw45Wk5QtphoQxWJPS74oB3qwPltgWUoMCN5+zfQqOsW94qiiztlQOJGblhu5OuPhy76BBY3L/m55MsL82MujJM1phOlSQqfeUEf23afKFUB3nPAYmmDN4aGXpCSkZzxXX7gP9+60EYDQ5gi+ZzogLM2EQKAui5JkqK1bsVIwFdnpqjLCbBpz2IcowZQnfbuFSmCYfrvvikjeGO7RZZI+fULMKjIASDiAGXIWcPZ/2Nb1RTt0omH1mCanqtobk8cVc9549Yl9P35sYvqbMiwqo55aFkcZz64iYyUxu3jXtXjXOPyYh0zts6FN9FovD15/RXbX5f7d9CQaKbKfMzdmBE9P82ATYfa5aL9vaKilIAaH85BrCjquMAYqpeXeqeW4O/Muu9xPZpYY0kNPusniXrS8CVB/dIg2Zu9iKR1NdHCa7qikAOPcHl4SO6uw3Y/upltoxgst4EWefLhoMAkM60L0PLPphQRv4bjp+KBjgR9ynJ8kTtJ+YsyzQMK5Lezll6vYez72BFT39wPH4PGeVcOeVt7f7fnAQj6v7Rd7cblW6pdswkMrhyB9d7z/zBpdmqKeYV1Z5Lbl7WhpesXvjb1WomBLTnkgkrpz1lCJGASqHB0ubXxmy8IRG9gukp/Q3rewtLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1TbmNnZHgzT1Z5S2w5b0x4NUlKTy9uVDQvNkdHaDJIZlhzc3JKU2lMbVFm?=
 =?utf-8?B?dzZCSWg4TUFPemJWdG1BU01DWUlmOHhqRzd4R2RYaDlTUVFGWFNiS2hKaG90?=
 =?utf-8?B?OUZka2sxenV6RnkyeWJ4MmpRNFM0SFUxTkQrWmw5WmZtZUhvaGNFU1VKNEE5?=
 =?utf-8?B?dms0YVlqUGhlK1NaUmVrVkpNMERETWFFNzMyeDAyZ0pJREs2RXdqNGtseVds?=
 =?utf-8?B?T3pnYytkN2dSWVc4ekZiZzFMaEIxakltd0ExbGJLR2Vxc2RqaXhMdmNGYmhQ?=
 =?utf-8?B?Rzlwbjd4L1BPWTY2KzNOVUlITHNyYzZrRlBmK1k2bmNpVDluU3YzaEJvZVdi?=
 =?utf-8?B?cllNK2Vnclg3bjJMc1pwWVpqcStlNm1yU2s5dm1zQU5tT1FmaWZldytpbFZx?=
 =?utf-8?B?UjJ0UnVyTjMzUHJXMnNqTnVmVUoxUklxT1hNUzIrM3JXWklOWExYdGdNQ3U1?=
 =?utf-8?B?RDFDNFRuakVNL3QwMHI3YWNPZ2ZEVXF3NlJoV0J1VWpDa3hSY2JaL3Z0TEJM?=
 =?utf-8?B?ZkxNckxldEtrQ1ROV045TEd3WXFET1RPVnozUmxlL2pUeUpnajNqWUpGWFg2?=
 =?utf-8?B?cVd2a0pha0VxTmRhUnQzbzk2UkhjT3pzK1FKaElDNEFlTEppNnZYV2pTK0ZF?=
 =?utf-8?B?eHc4Ky9HRXA4QWg5OVUwSGxEVGI3TUV5aTJuU3EvaXYwQ3hreFlPQ0xPcGU0?=
 =?utf-8?B?R0Z3b1QzVlB3dU9GZlFVVTAxZlNZcnpBUUF1d2ZFdnN4amNBcHhOYVRVNy93?=
 =?utf-8?B?dmtpTHZWS2lzak9DTExjZmdXenNOZTgxU0swUDFaY1h6TGlOcWkyTGJjV3RI?=
 =?utf-8?B?Z3EySis3NVlUalJvSFBaZjhjKzE5THZWUVNZelA1dVJ6ellOTng4bW1PN3dx?=
 =?utf-8?B?ckFtME5yL0NTcTZWdUZCQnQvODlPZzJSSVVnZjJhRzh0SXRKS0R0YmJKVjZZ?=
 =?utf-8?B?K3ZzR0tLSnpnU1FTQ2ZETHRpZGkraStOUVBnTTd5ZkhEUjlIQThEVTV0Qkk3?=
 =?utf-8?B?RlFlZVlFcExsM3FuaFVDenJCT2pqbEJLSy9pYjcyRktoTVdJVXZpY2tGeDNv?=
 =?utf-8?B?RDNPZkZNSy9OZ2xMb29vcUpqYkEvRGplQnJEVWYvWFkwRTJPUjdIYjI2ZXdx?=
 =?utf-8?B?TGV4Ry9DdFhqSnErMi9yK1RVandhL1U1b3pubSs4cXIzTzJSZTI4dlQ1NGlS?=
 =?utf-8?B?cEdYUytOVWlsem5pb1c4dmoxb0plYXlmZE1pTmFDMDhOcTZoSEYwMGNKa05J?=
 =?utf-8?B?N1RsbmtDWGpycHp1czUxRXZaZExaNnFzdzRrc3Rqd0x6S0tFOEZmNVlZMHlO?=
 =?utf-8?B?UldaTUNWWHFMdnVUUUJDMXBMV1dKWmlnVkQyTTNMT1FYcFo0K2wzc3IyZzNY?=
 =?utf-8?B?d0JRVVZwalNOclZBMXliSXN1QnA5bjNtWDJ4dC80YmdIR2JmMFVWSHp6KzRI?=
 =?utf-8?B?d3h5UTdXNy9GUEtXUXdjOUVBQ2dBY1M0a3BGYVp6U3p0L01WTGgyL1RMTXY4?=
 =?utf-8?B?eGtTOXduOEVPSnIyQVdwNVlPQkYrTnF1Z2F0dFpuMGZ4aEFtUm0rNzhJcW00?=
 =?utf-8?B?N3l2b0RUZTNBRGd2VFJ6L1QzUm9GYkxDSWtNaUVLVlVTRXBWMVN5WXRGZFpT?=
 =?utf-8?B?MThDWFBMUTZrcTh3V3Q3NjlLQUtZS3J4WmExeHE2RGpteUYzREJIcEdFQm9n?=
 =?utf-8?B?OUFOQ29qR3dFYVZNYzJYLzVqaTZYYkxid0Zta2M2eWhkSENCT2tVZ21PWkFD?=
 =?utf-8?B?WnZmZi9seDc2aHJ6Nzh5ay9rQVpXd1BXTzJ5T3E3MFRZaWRvQnZjQ2JqSkVo?=
 =?utf-8?B?T0VvQlczbzM2eUROM2t4WlpxN3oyU2l6YnNqaUxDc0Y4eDFqTjMrVlJMUUZI?=
 =?utf-8?B?a29rWEg1SnJSc2pFOFVLUTFMamt6MGQwOW8xZE4zV2tndzdrM3IrSFRjeDQ0?=
 =?utf-8?B?OWpEQnBsS2ZjMnNGcWZZY0pETEpVZ0Yybk55eHJNblI3Mm1UM05VbmFIREpr?=
 =?utf-8?B?L0NTcHNhdUFWc1RQT3VkSkZMSmNDQ3E0OEFDZEhHQ3RWcS9ETzg5L3hLSE1p?=
 =?utf-8?B?dy92SlMxWndZdzY5OHJPUFViNER3djRoUHg5V2o1ai92Sk9qSWl5V3A5K0Ry?=
 =?utf-8?B?UWhveXlTZmxXKzcwRUJ0OWszQnFnZlh0TG9IbHVtWDJ3NGEwWVNleDhPSlpQ?=
 =?utf-8?B?dlNQSStiR2h3YnUwZkZNNG96aFpheTQwRXFFblVFSjBJNE5kbFdkYk84SlQr?=
 =?utf-8?B?eUgvTWlCUi8yZ3Vadk02dTZFcUZGNWMrdmFmeDExamhXanpEdStvQnlKV1Qw?=
 =?utf-8?B?eDlTWHdBZGJxdmp3N2VTM3BreVpJZDYvNWNvNTdFb3ZvQlBKQW0wbmxOa0N0?=
 =?utf-8?Q?KgoughZb5pPSd8IB6lNtgdkfHEJ0ZYz0jKqeQQNI8LPKq?=
X-MS-Exchange-AntiSpam-MessageData-1: yuS9nya/34FcpQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0e6b8d-7f9d-4b45-bcc3-08de920173f2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 04:20:07.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9oqtY3+vfdD3ERb7iVxcmQZLeK6dk3hFm0lnrUhrhWmdd4QIzfYNZPPkQ0jebtMo4R3w96ycrERnm6UecNASw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959

On Sat Apr 4, 2026 at 11:33 AM JST, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 4:12=E2=80=AFAM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>>
>> The SZ_* constants are usize, matching the CPU pointer width. But
>> device address spaces have their own widths (32-bit MMIO windows,
>> 64-bit GPU framebuffers, etc.), so drivers end up casting these
>> constants with SZ_1M as u64 or helper functions. This adds
>> boilerplate with no safety benefit.
>>
>> Add a SizeConstants trait with associated SZ_* constants, implemented
>> for u32, u64, and usize. With the trait in scope, callers write
>> u64::SZ_1M or u32::SZ_4K to get the constant in their device's
>> native width. All SZ_* values fit in a u32, so every implementation
>> is lossless. Each impl has a const assert to catch any future
>> constant that would overflow.
>>
>> A define_sizes! macro generates everything from a single internal
>> list of names. The macro takes the target types as arguments, so
>> adding a new target type requires changing only the call site.
>>
>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
>> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Acked-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> If there are no concerns, then I will pick this one up.

No concern from me, the user code in Nova will be scheduled for the 7.2
merge window anyway.
