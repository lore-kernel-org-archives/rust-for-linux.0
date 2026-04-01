Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED7316192;
	Wed,  1 Apr 2026 07:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026890; cv=fail; b=iVy6KJmkPzDkb7Bfvp45icPSc9meyi4Ue+Anb6Qzddppd+x9ZOpR3xmNIT1pMhDuWj/Ykkgyt6IwzbZGYbY5Mhg5MYUJwzppF38EUoQ2BwQ0j9jecxBVvACNCSTB8mjFNfci6Qp53rtwW+YWcT58uT2v8mthVV243L21gnv5NUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026890; c=relaxed/simple;
	bh=wEsNJygc4bK1Elf688xv5xSPOycA0Qsr7dlxppSFOGg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VkkL9Kkku/T9oRR2+T56xBMBfShmieUx/QhUi+/EUygZxQ+Mh7nlPu1jr+iYbvBdrlywIYuHiqNfYkBv4yMJhFsd+eJvScNmhEG80nbsKfwFASjqzriBNXOPkqqgkmRZt+55zkccPTeW3Jmd3/vmAVMT5OjbVqIxKRuI2NlMDOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LInbHtoY; arc=fail smtp.client-ip=52.101.56.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LInbHtoY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXgyyMRDwW3hY6JI7zAlLK/NgbKEvdLXaSGwjKEK25EECYb0JVpAkfAMiRTpCMIrlRYBjzBf54DR08gX+0eS0rYF8zCeIiwX/LJINVwYyrTl+dCQb4cFjpxfb+aYCfU11hNBOpt1fSu3gQGhL4WO5IY6q/PdySlMlvj2D9kbFhn0Z1fKm+2nXMwJ3iD4FVe8AwmsKuVyhV8aapnnD8dmgPjbonrw2Sl1zdxHaE0zBhj4flkOZTOOWzyKWmr6co8IIDKo0LshwBm1E6LhgHSSnjP+DiSSMTAhyteKucnjn8ugl9sFoTTwIYGgwmnZQI3G0iUWpItMBLr3bjyR5P0n3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMxToTGI7IL6oFzeTIkksBStoiARqIWVmM8WPb2Bzno=;
 b=yGF/QN88Nem8fsoexWC5b6kYxtNlIfNtphv2SBs0oF3zSiWUcpXDDiJHreK2V2ZZxMNHTZVfzlPGBMNFJwINxSuCvLzSzEs7PGkeP9Sl2oB3K2UBTnV3fGCuJ0Rnu01Dj+UF5o5dWcBhxq3UzLU8CDCXCMWn7KG+AaIP0S6UyLQNAF0OR9tqU07+WbQkvDgrZjMoHzIQT00bwM1OUgFfjnIgj1FwReiZIOU1ffMV8yyJ/OlahMm2T7qOWemLxBfZtL4mTAgmGj4ouGR9c0rYgYo3mrpuyw6sRZJw7KjePmfbYsX3mjoDGGy5clssmA23az4Art+Irt6sJK7dKhE02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMxToTGI7IL6oFzeTIkksBStoiARqIWVmM8WPb2Bzno=;
 b=LInbHtoYjqhHDq7a4MXcAac6+v5w0Q76dsQpDfURtJRA2vXyWe5hI+xuNygZPdtXPdrMn0dpwkNYAQOSZPRxBMT/zlmT7tk4S1ZfhCmiwuYgL0IDdqoVjdW3GlYAynHK8lnc9RD+KdHiUPSB1BtwF4xYJqGASByrug+BvSdRd6TsOa59OHpqpRY0E4UvF5kyzdFyUidME2YBdZv5sI5xnU6YhQk7BxDggOXcCZeOkQATPTgYyc6SpPZm3Zt2JJ+uXDw6t9T7x6EYT6/MsnEFzPbHacPOvBMnhrvK29qnz6NexERLsa/4h5FcEovXKwSermi8ayU/oBf0PXEPVLgTQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 1 Apr
 2026 07:01:23 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 07:01:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:01:17 +0900
Message-Id: <DHHMII9OBE1R.3DFDGQW58X9DJ@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
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
Subject: Re: [PATCH v3 0/2] rust, nova-core: add DeviceSize trait for SZ_*
 constants
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331224319.107082-1-jhubbard@nvidia.com>
In-Reply-To: <20260331224319.107082-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0e360e-9934-4d0b-f071-08de8fbc7b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3k6Ok7YeW6X55lc9/3rmatLtoR8SX56iRt/PO/x/A2xLi4fM66tx/mvzXt1ocm/MBStrAyvgCHTbT47kPA6yKDuVmO7BWHPGx/G63gCbtny0kYHtl/RnOrP4/C+mRIpGAzcAiJrGgyXn1rCsbzR3+0c/lorpFACsieoJbzftjxnZkPNyJbmoOOMsYHboqABO65HyVNUmBYqfr48GAdhWUUNOq+3/FLXaap3nm3nVAwcErtVDXrxutNG70Onb3Y/UPKYiXzceu8NCPfwPDEDu97hjDKyyB0sxs8jcFAYHQZBb9fQOQkQ04eRWDx9hDjXH5oSoPMaAoUyquv8CzKxJ/i8apSQtTZPorchS+NLLFazYk1byXS5muVF7Z6uJo7npMkBy2ORbXcmZKtvMvH1Kx5qx0qR5BsobQAnxtRutT7P/5Y10VAfIpZOaD4b3IUIyqMlhg4aL/Mmkg6CgG345UZXWMOPbS40apNQ4Pai2PiYsGBCsBStVw61QmYRjIu912DxXbrHfkeV8grloq6pVgIo1S5qINBsgyyQaVgJVPdAJSux0dbXtxEZR0FAqpkgHTQ7KjRJ+NIqoU7GP3+TDbxGH+qjZSdx3UO4mCV5XumBjyaETzZzHdpH1ORtVbRC3D9zcOGGh8JRsaD9CrxvMSO78Xp/ALdx4nSUdqLi1UcCz2nbRuEZa0uQ1RQz5GKelRlpFLicFVWfijA4YFSndacT3fVLu0W1PJ3L7zQZ02SY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDlpTzVaVm1YcC9kdExNRHhBTytWN1dEeGgxMXFuYzVmN3pKN1FFcm0yOFpr?=
 =?utf-8?B?QkRDRHpQSTY4VU9LeEZXOEwrL1E3RFlqNU8yeGRiMDk4MHFEVG5ucnVwQnhj?=
 =?utf-8?B?MUR6dDcwSHowWnZ1ODdXREQ0ZEVsTzI1M2FMaVczZUFDRWRNaXFEcXZONUVT?=
 =?utf-8?B?ZDhIWWN5dmVaT3E4VFpxazBxSUlNMURUdWlNeDR2alZvbWthUkJEM0NXclBL?=
 =?utf-8?B?QUh6bEx0Y3ZrMGxaYlBQNExEak01WVRwL2ErcFVxUGw2aUpOV2ZZN1BPbEJ5?=
 =?utf-8?B?b0cvcE5OY3JzN0NlMlZLdTdwS24zQ21lbkNqM2VZSDhEbWN4TU9GdmZONnVw?=
 =?utf-8?B?cDl6bGN0UElVSVcvRjNvckRyZkl6K2twdmV6QjFEWVZjYjlNOXdqMUZDL2Vu?=
 =?utf-8?B?eXlRTk5rVVcvUXlVbFk5emN3UTAxLzFYTlNiSVpmcE1PTm1CaGJIUWlSdVgv?=
 =?utf-8?B?R3R5TkR4bEJvbU9jdTZ4eWRwWHVUVEtnbk5XRFR1djRLZVJtSHU2aTE1SFVZ?=
 =?utf-8?B?dk9rdWwvTlNEbTVqUC83V2lBR3lQMXZqOERHZTdFOFZ4eFMvakw1MDdkeFEz?=
 =?utf-8?B?bHdJNm15UXkxQnFubzlibUlQeGFnaG5mOHZaVU9oR1FZcFgxSGhucmNzcXlP?=
 =?utf-8?B?MXJ5WWpQamt4RGNuejlpMkY1NUxVbGtaRGFzczVKKzhvdHJEODZWdk1zV3V2?=
 =?utf-8?B?OXQ1YmxyZWp1TDFGMWRRN1ZtSnpVdmdjbkRyZmpTT1VEMWViTERhL2xQTGRC?=
 =?utf-8?B?bGVMN0JHN0FWYisvVmRDWm1iMUhOaTNCWEVBYjN5MklGR2xKWGpKWWpMUklr?=
 =?utf-8?B?QU0wRy8wb1hmZnV1QzNLS3M4a20yU3l2YjRYY1dIWHExQ2duZjk5TXVRVDBm?=
 =?utf-8?B?OENwbitUSW8vZGFPS0E5Vll4bSt6dWt6WXRQQ3IxMUxPNGdaeFN4aU5rZ0tB?=
 =?utf-8?B?SXZvVzBvYXZNNFl4bmJEMXFLdFREY20zNXA2d2V2UW5PTjQwY2NHeGMrS29V?=
 =?utf-8?B?Q3BOUUR0UEhTc28rSkE0Nk1yaURDckxjdHVsbVUya3k5ME9ucm5WVUNYZU1Z?=
 =?utf-8?B?QTc1UWxMMDRzMm1Gc0VlTG1lcmlyQTFHSGJWdEtxdVJPQ2ZzWTMzNllLUEtF?=
 =?utf-8?B?UmZCS1RpTE14OU5ycjVnYW9aWVZwOGRWNWJsOUc5c2hYKzJGaHZ5bTQvNDhS?=
 =?utf-8?B?bkF1RTIzL2RXa1dZWVFJcjg2blUzbnhBVHcvbUNPbkkxNnRSK1NoaG9Hbllo?=
 =?utf-8?B?TE55QmFoVVlpSmV5Y1FCNUZURGhURUppa2huOW1wSFZkODV4WStRQW91VUxD?=
 =?utf-8?B?emlNMjA4Q2w0cHRDVzcxQ3V4V3kxMS9TMnliM1I0QWI5cENhVUVmQThsdTlw?=
 =?utf-8?B?blJPeUNDYjYyb1RKVFREeWh3Zi9kQWpYZkt1b1AyVURiKzc1N3VDeGR1R1NF?=
 =?utf-8?B?emlCMmNvZGZVY1V2NDFnV1dKRUREYktveEV4OEFjYS9lRGU1RnNDQnBjK2NB?=
 =?utf-8?B?UU9LWnl1d2RjYytvSGl3MG9sREZWYmxoc0M1OHlTOUgwR0FLcTlzYy9XdXpW?=
 =?utf-8?B?ZG01YWUxRnFJOEd0cWxuVk1RUDA3cUZMbFI0WmM1OHp2VUtFb2MybmxEb3dL?=
 =?utf-8?B?eTVXMHdhbzJTNVdmbldDV1VDQmorQ0JnRXBEc0lHbkQzNEd6YXhhcklTVERL?=
 =?utf-8?B?MkVMTUZFZm90MkhUcGdKRUQwVEZoaEpZaEQvVW00ZFl5NXZtQ0UrUi8yTWNz?=
 =?utf-8?B?ZEZxanA1dHNsTlAydDFaeGZkaFduVitZaXExREcwQk1wcmV4L1djVHlZelZm?=
 =?utf-8?B?TEhYOVVSblRvSFNUQXJhZDl3RzBrU0h5MWpZdnJkYkJCTG1TZXVtc1B1TGJj?=
 =?utf-8?B?UHVGL2ZaWlVydTNNYzdVTlpOeE16NHBsOVZFOW5USE9rL2tXd0hiSVVhcktW?=
 =?utf-8?B?QW93eTRhN21yLzROYjB1TDh1NnhGTm9jZ2g5dEZYQVYxTTVkRHFPWm5Cd1pL?=
 =?utf-8?B?c0N5L1Z0WFUxWkxZZURBU2NOSUVrQmt3NVFhc0xtV0xhU0ZOdHB5R3pxVlpJ?=
 =?utf-8?B?OWNUeW84S0RVSXh4dUljRUNxRCtHc0lSWmFuWEh0ZGViaWFYUzFmL3diZEZp?=
 =?utf-8?B?MDlsaU84c0VsZng4clBWWC9ZVll6cENIWU9IWHF1cTV5QlBWTDFXeGt4L2Fo?=
 =?utf-8?B?aUhiMVlWMzU2MnJnbTRmajJuT1hoVk9CVCsrbjJKakQvZno2ZFZ5T3YwYzl3?=
 =?utf-8?B?b2xQbkFRQmN5cU1aV3dpS01yQ2JEdlJScWNiU05wakJXVnliajl5RHVucTFV?=
 =?utf-8?B?UHdIR01sM0lRdGovUEExMnptQStQYjVNUXZiRjNWZ2paSjBrWFNHSndndzYz?=
 =?utf-8?Q?KV5YB/JTc+xzwrwAuD7DnYl6p0ZPOMqO4bp452EacFUZs?=
X-MS-Exchange-AntiSpam-MessageData-1: bVrq8LmsdzRCPw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0e360e-9934-4d0b-f071-08de8fbc7b04
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 07:01:21.5716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2r4SJIzP4qcVxdg1KuHw4kUoMCZtfl1GXdpxbDBXVf/ZD6ROjS9mtuBiyzGPA6t4P/6hhOsuiPkM1eBvAWk6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024

On Wed Apr 1, 2026 at 7:43 AM JST, John Hubbard wrote:
> Changes in v3:
>   * Dropped the Alignment::from_u64() patch.
>
>   * Reworked define_sizes! macro to accept target types as arguments
>     (define_sizes!(u32, u64, usize)) using recursive macro arms,
>     instead of hardcoding impls for u32 and u64. Overflow checking
>     uses u128 casts so the same assert works for any ("reasonable")
>     target type.
>
>   * Added usize to the DeviceSize implementations, so the trait
>     covers u32, u64, and usize.
>
>   * Hex values for each constant are now proper doc-comments
>     (forwarded via macro meta), instead of inline comments.
>
>   * Rebased onto latest drm-rust-next.
>
> Changes in v2:
>   * Replaced flat SZ_*_U64 constants with a DeviceSize trait that
>     provides SZ_* as associated constants on u32 and u64.
>
>   * A define_sizes! macro generates everything from one list of names.
>
>   * Added Alignment::from_u64() so alignment values can be constructed
>     from DeviceSize constants without falling back to usize variants.
>
>   * Rebased onto drm-rust-next. No longer depends on the Blackwell
>     patchset.
>
> v1 is here:
>     https://lore.kernel.org/20260310023145.120037-1-jhubbard@nvidia.com
>
> John Hubbard (2):
>   rust: sizes: add DeviceSize trait for device address space constants
>   gpu: nova-core: use DeviceSize trait for u64 size constants
>
>  drivers/gpu/nova-core/fb.rs     |  21 ++--
>  drivers/gpu/nova-core/gsp/fw.rs |  15 ++-
>  drivers/gpu/nova-core/regs.rs   |   7 +-
>  rust/kernel/sizes.rs            | 166 +++++++++++++++++++++++---------
>  4 files changed, 141 insertions(+), 68 deletions(-)
>
>
> base-commit: 7c50d748b4a635bc39802ea3f6b120e66b1b9067

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

