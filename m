Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162142048;
	Wed,  1 Apr 2026 04:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775017945; cv=fail; b=KhD4ZWjN6t4uI1O3lTVL46lumozZP1McVEcwVIslE9cOtat01SESJ9WDHzMuocZArrl5R+8nGO2Su4qnZr9ysb8zuu9ivT6i3ZiiSETMF1KNxre5WIK2hgkgLQr9Roq/jZwc5NUMTBWGFJcvJroXIItOtVcdPTAURpxwRKBshAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775017945; c=relaxed/simple;
	bh=fdTXrLtdThV4Jt2OTzenzGYy5Eui3JmQSDugEVi9UqQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hmtRIB/uWVLLmZlODeoZgvQkeY6bxLLWYZU+/fuamw94bhczxdr2gpTY5TiN7dKOYThCapxyCDfBZRovizyCmMR0G2V6sVh8XEFcuyjJ03/LtkPL4aZLUzZkQxoT/G68MD5VDr4Tf8MHuZvOTNL0OcC3Ba+75KVH7VJxiIuiNIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OcYgwBrP; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OcYgwBrP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8J5cGKpPvDrBv3TSqcxI0NE91mr1nLMOZs6iS4tpyalYoWlgXCgfyPlzYkMCGgwzHa7naHMJyXO23Ur9au2SQoSW90B/pzGyeh+J/LNt9dIYU9LeU62ff5JUaqNeJpiSSwLgrcHiPSMfKyVZdMazZZWx0zVu4LrfZUHVO9z8fLw+4En2T5i6ir6yhU5jup6T+cfjFJqjWfAvedmEjJ+AEIWBSn4wqsyLX3zN3l5C2lrHhIrC4Ffo//qabuu7/kc6QI3KJ+woanzKd92Tkcszuj8ivpohLQMf9r0h5wDVyRXiCdjrSOvhyM1V6lvc/ujMVa5l4fEAb3rqvBqUU6lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laQoKeJ1uiRoqzUMOX/qq8DoQ0m7WefCMSPPDqmm83c=;
 b=lXIUxxxuGLYs1mgNUr8Fa1ov0iDBG6im4gYY5ZLqLllgL+EGcRVgPiW4Xwq796XvWNMGx/RdvulTQqJ3FNl6S9hckEa5yRbyJIIpuGQpxQ6tZViMDADa/plhkPL5BGqRzMnebmn6xjS0z7ErfXrpSLNkoFK4jJsTIqhK4APlRAn3bEQwtMenEtezRFwOb4Uqqdf+1AlUHMsGdQDXQsXKEULPvaLcgdp4EEg10tP5VnAzNbt2pmip0Q0utVUoZJdxs/f+LJdEYEopyiqSVo23PEuf7Fqusq+S8ibQeZWp+X8cXqRjXyYRXT28fHBBR7L/VkRc1qZyLjuJu49pjgaapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laQoKeJ1uiRoqzUMOX/qq8DoQ0m7WefCMSPPDqmm83c=;
 b=OcYgwBrPoJmS52y+jY9oyWch578sfij/mPKtS8z5OHZbPEa1c/UFs7SblT7HJ378Pq08LI3Ri6xtrKgSGgKqnLcYZYDnt07L8I/EPgZ0VWN1dU6y6LCx+Du3I7+/JD3TrqH+0VI1n/NbVlbvgdk5wL54v5hdhk9S694tyTN+SWj/hq/rDyd4PLl85j/cWxKGDMfqoUfopZbSA8vXwevoQP42W45dq/fwT0ERyKPlMBE51imrO156JPEePMlXsuuQCoZ5sZm4T2pGxE5D8VY0SSSabR3L5w3YmUXhNt703cWjylQUbKP8ulmskcQxcbnLcF2ufSn8S4SsLPJqV1U2gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPFDF5E260D0.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 04:32:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 04:32:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 13:32:15 +0900
Message-Id: <DHHJCEG8BC47.2VC6GLDRRZH1B@nvidia.com>
Cc: "Jesung Yang via B4 Relay" <devnull+y.j3ms.n.gmail.com@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
 <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
In-Reply-To: <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
X-ClientProxiedBy: TY4P286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPFDF5E260D0:EE_
X-MS-Office365-Filtering-Correlation-Id: 46624fd4-50c2-4c95-1bb2-08de8fa7a8e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nwTGeGeIr2Qg61ZGpPdZw6rUEMSyjy0Rv29hfkRWJp5s7rt/YrbDInYylErTlNHMboLd+1Hs20cXVoO4tuv2HcMwmSFIWVX6lO9MiWc3bwbSP+5tAvfWhG01YGXJQKSZryT1EnOPcHYMd5t0r4s4PRhemjgqbgOAqzwrgqsD3JFYFlfw/+Ia8+ldoYrXC9tgY9uB2WruqvzjnEnxlZycLCFQAjaYkQpPW49zZU/JEPM+jdB3m7q208TBkSCdUru0LzIKCOcEXaqwCLqOWohgYkr1r0IuPFAW8qGvZ2eJ21VfOL7bk0DYWHPwKbnLT4dpfOdI+gpPIt05XED6P0p/cxs3rTYnfOLyLwvPBVNoNUut0s9JM8KXjKGQ2lhL6ZUdrcZjKEv/IpTMhEufURcEFZo3ai8A6KEnUkiBwNtXnxBphRXavXjIixR8jy9aCIhpS/PBDLQGJMulj6J6DwcEKJQPnbUBLpw7j8pqH95kL9vLUQFvXQGxK5cPm0i53ywBFEMnZkmwV0C6RxtG5C4at3VLfTv7RwrV1kC5XBa3WSJnGoASFTkyY3q9/91nH+5Cu7jYboxC8qnA61mpYlG7v8/6VbjV6GUVtBb4sRhGsvR5lWYA1IO3dzRr/tqrNg25s1BihW9alDAY0LBh3U562j9oBBbj4QVlk5oaSNL5Zu/09IZfNxDi51uWvNvIkEPPjRTkzFcmx17xdMwXV2RRG0bD3dksiKIDZ4hqLlQ6ST0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmgrU095VnBRaUt0SUFZWWdMTzFaZXo4Znp3V0NOOElxZC80TldoS200QklJ?=
 =?utf-8?B?aXhmMmw0SDBXS0xhNndaSVZPWDBjaDN1K1J4V25zZ05hakNTNXowOExYYXNz?=
 =?utf-8?B?VFl5SEJlZEZzQ1FsK2NYM3d3dlNzczhCUDV0YithUHpjZXdhS2dJd0hmN25l?=
 =?utf-8?B?cU9RWFdwUGV2RERaeStMOGtSNmdLMjNaQWs3dng4NFBuTUVxS0g1YUUrZ3or?=
 =?utf-8?B?eTdxM1FLLzBQWXRuc3V4SEwzZU5GY1Q1SGtEUFJrNjBrcGlSNHp5dkVLUkls?=
 =?utf-8?B?dFJCbE1UQ2RWM2kxMitYaUoycnk0NDUxWUNxRTVIMzRCSHMvTzhrdjc1dVJM?=
 =?utf-8?B?MmltUGZsNkRuaFFnTTJkcWVVOXpIdUQvUWhsM2Y1K2laeXN2TjlMV0FkdFFl?=
 =?utf-8?B?NFpNdU9IcHlQcFRPUG8xL3lzRkdRVWswcnZDa2NkRmFHMm1jaXZ2UHZhVGwz?=
 =?utf-8?B?cWhjYmxtUVh1b3ZPZmtSb0VQczNzdklkQTBFVTg4K3k2RGFSL2dBZXVmdmkr?=
 =?utf-8?B?cWhrbzhjNkRHQTNZTzg2NDFUcWg2NUNvTTdEZlhIZHNaQzBBVFZUM3F5aU4y?=
 =?utf-8?B?WnZHYXE4K2V0OVZUMkpMcFRiVmliNGNrbVZGNFIxMld6NEQ3Z0dlN1hTbThq?=
 =?utf-8?B?dW56bFZpdlFVNWkyV3U0WUlRSGs0SmpvVUM0Qm1wM0JISkRtR3ZlZjF3MFB4?=
 =?utf-8?B?TEQrSGFkYWc1SG5SWXQ5RnV6U1ZaVitCdzJTbERyVmNRQmlNRjZsbklmY2E0?=
 =?utf-8?B?Y1BFQTd2c2FSQnhoSnF2UFFQSGNIOTBFYXYwVUdpOWcrQnpRRWhnbmdCdDZj?=
 =?utf-8?B?RFBVOFZ3OTZkZ2lseFZuUTlHZUF0VnFieDdLZ2w1dldBMGhLYUtDRitnQ0NS?=
 =?utf-8?B?ZlhPWDgzT2dYM20vQ0lDVUdGS0MxY0MxQjlPd3Z6OGI1WkphYzlTYmpVUzRk?=
 =?utf-8?B?ZWRkNkZvWUxFQXcwbkhXbHFCTWZLc2NFY1JqRVNvUDhGN1QyRlU2TkpqR29R?=
 =?utf-8?B?cldnM3hweTFtYW42a3J4V01hVHdRMmtEVE1sL3paR3JoK2ZLc1FUTXJqVUth?=
 =?utf-8?B?UXNFOTl5K3d3WnFHK01sc2lsZ01haHRWY2h1ZzRvN0tSMVpjaEFoU0Nvb3gw?=
 =?utf-8?B?eCtNNHFYN3pmV2I5b3FXR3lYRlJLNS9BSmJqQ21PZXY3M0lKMk9FMXBIbTc3?=
 =?utf-8?B?MGJFU2JmalVkdnlGZHBrT2QzdVp1WVR3S2NVaU9MNUJ4NS9ncHR2ckhTWXNl?=
 =?utf-8?B?MjRQSTJUYmFJTWs2K2YxcXFuM1FlT1Nub3lvZ1d0ZUh0RHNFekhFR2k2Wkp3?=
 =?utf-8?B?aU5GSWk3Y08wZ3NPbGNJbGZvTHdSRng0UDZwTEZPa1FiZmVmQTdVeGJVYlFi?=
 =?utf-8?B?eGV6M3N5TFhaRU44SUljUTRoNHpFcWI4M3ZweXdYc2poSjA0SDdYK0NpcEQ4?=
 =?utf-8?B?d0RXdGczdFhPaTgzQU9DSityeXo2bUNQekhYNlhZNnVPeXJkQzVlemZHYUFV?=
 =?utf-8?B?bTBONU1aNGd0aTI0Y0hPSXcyakoyS2Z5S2k4OWE3bWNaTy9VVENjOWdXV05m?=
 =?utf-8?B?QllYMUN1SkJKNUV1L3Q3TEp2OHdNUDBTRGJ0T3hFdmpqMzBrSEZ3V1kwLytZ?=
 =?utf-8?B?bTlhWUh5cTNjOHZBZUtjVlFVbTA4dDRWTTc4Nms3WGN4U1NNL045WDRWVVJZ?=
 =?utf-8?B?R2pLaGNxVjVqQk1ENEVFcFlHb1RDbW1vbUorV3NLcHFVdHdFRlFSQjhJVW5Y?=
 =?utf-8?B?VUpTREJNL0hwUjMzVk5za2t1eG5CY1FSK2hmNFRYTXRZWkFJUzd4UFJydEhR?=
 =?utf-8?B?L1pYOGdIb3VINnFHSlNSb3dPRk5GaW14dXJCRXhhOExoakZuQS9TVEJqbzVq?=
 =?utf-8?B?bzdQQ2dPQ0ttTlJ3NjZkanpIYmhkdDNTbzErSGlQRTBKOUNRdXIzSXQ2NE5n?=
 =?utf-8?B?cTQ4SkNiM3I0dS9MU1NCaktmaDY4ampGZEZ6MVhMM3p0TFRaRWR6eXhMS0Fw?=
 =?utf-8?B?RjRUQ0MrVWg1WTJ3bld1cW9Ec3hjdlRyZVI0c1ZJNklwNXhxMlJ6c3VyOVpi?=
 =?utf-8?B?UE80cUhaVlJvTkh4UGFFdlVuUHJVMmRjamt2N0hPQnVMcHJIUW5Fd2xqQUJO?=
 =?utf-8?B?UlIveC91cS9mYTFyQkt5d3o1MkxLSGxBb0dqc3c4UkM4VUxJVW41MFFnT0F3?=
 =?utf-8?B?YmpWWk1qandiMEJhSVhkUGFOZGM5SjlkZjdQNTZjYkNBZHJNVHY0OW54VFk3?=
 =?utf-8?B?ZUp2SDAzMnU3TXl5R1dtNENUU0taS2pZLzl6M1dWa3lRV1RMMFcwVDhVWFp0?=
 =?utf-8?B?bTBNVzZLQWpkY0NqNWtyTkxMYWoyRXJRYXlHUlIrVW1CZFdCbUN4TGZycUNL?=
 =?utf-8?Q?+HYHKYn+vUMePdoZqfEXc/qMUfc48/oPvA7E1KuimXf9p?=
X-MS-Exchange-AntiSpam-MessageData-1: dSyupyL69mjX0Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46624fd4-50c2-4c95-1bb2-08de8fa7a8e5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 04:32:19.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBu2UhsNntj2wM6P6HIvRrfUqgMeH4UjW24fUXeRKMxh8UItIliFI0Ufk+jnCeeZLvnKgCpxZRCUMEinGG8Jag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDF5E260D0

Hi Jesung,

On Fri Mar 20, 2026 at 7:04 PM JST, Jesung Yang wrote:
> Apologies for the delay.

Same. :)

>
> On Sat Feb 28, 2026 at 2:31 PM KST, Alexandre Courbot wrote:
> [...]
>> FWIW I have converted nova-core to use this, and this results in -200LoC
>> delta. Obviously I like this very much. :)
>>
>> A few pieces of feedback for things I noticed while doing the
>> conversion:
>>
>> - Very often we need to convert a type from and into the same primitive.
>>   Not having to repeat the same thing in `#[try_from(foo)]` and
>>   `#[into(foo)]` for these cases would be nice.
>
> I think I can add a common attribute that works for both `TryFrom` and
> `Into`, e.g. `#[convert(foo)]`.
>
>> - In some rare cases, we want to convert an enum with 4 variants into
>>   e.g. a `Bounded<u8, 2>`. This can be done using a `From`
>>   implementation, and that's what the register macro expects. These
>>   cases are not covered by the current macro (they are few however).
>
> I think you can just do the following?:
>
>     #[derive(Into)]
>     #[into(Bounded<u8, 2>)]
>     enum Enum {
>         A,
>         B,
>         C,
>         D,
>     }
>
>     let a =3D Bounded::<u8, 2>::from(Enum::A);
>     // or let a: Bounded<u8, 2> =3D Enum::A.into();
>
> This works because `Into` actually generates the `From<Enum>`
> implementation for `Bounded<u8, 2>`.

Sorry, I said the opposite of what I meant - we want to convert a
`Bounded<u8, 2>` into an enum with 4 variants using a `From`
implementation.

