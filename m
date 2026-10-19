Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA2B56CE29;
	Mon, 19 Oct 2026 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419964; cv=fail; b=S8DdOcEEbM75n4cXfJlmZNMBSzOIcha/nX3VW7kYuKmT0MYVeyVi8X+K5skRTg7KNXevcraIhAEIvUjRzbq6u+PHNnfTTtYT8OHT/RwniFWjxVb+izr0TzyOBMGOXtMhPEpL7X8/9E6uAfp27HpuJ8vFw19xobZXOTlRsyPuFCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419964; c=relaxed/simple;
	bh=I5HqUxP69AawWfw1RymqV6BlXxGV4gg/QqZva8X/7rA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=o/NVHdbaO0gChICLBQmvo2Wv9a9vdj62x7o3pQfJIXPsqQTzbz4CZSHk5jt7binH+5O6wRzCnFBgOqrjmQ3PLDcTlfV5Y+o1KY56iC6517DwVqggWzZfEFM/QO9YCx17Mpi2Hg1jVenux0eUBZsLecgdrvy210sTAoO867BqsVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nfvo7O9u; arc=fail smtp.client-ip=52.101.52.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nfvo7O9u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmRdm9jM1U4XGBYufkfyeITOqZpRPDTOyNZyBIFU7ODch0/LOJPJC/BE5ph644YPmCO3vL/ywWtvIjDQDkTjTG9Q7crzW4AmvtnFfrngdyeWYW0q4XuR97VFux1Gfrpa/vupTTr8guYYrh2Oj0cV2Znle+9yMfgGtlOyuj9g77p5AQzWIyxl2WT0GvV7wKK/MrOnNfRZsVn5YT6f8EiKqUha5gj3550FAu6gm5LQUTRLwCbb/FkQSLHlJWY3VLcX1iKMgW0svo2qKzwmm9XYBgyb2oKc7vsmiU9jX5RVSYVr9ZVbZf914QhS1dQIIu/gADlVRxnAAJSKHcuxYdxy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5HqUxP69AawWfw1RymqV6BlXxGV4gg/QqZva8X/7rA=;
 b=aT6TkMGqbSZdvA4DacFoH9PD0Rb642Fm4Lh6sXJfpwipXg2Ew4Nw3JdVqHybSb8glE7bm1lMHpohEzA9aGi4etx9jvY6ryGF0LDcewLd63kzcItAQ5qnW/ZED82buT+kCmEeT5xpTQmmtdVXXsDibPrJsfNT2qxGFnNGtDqoq6sOAdCDGJ21f1ttyqk1pz36R+/jykWTMH66GnhXFY/V1mbDns/xirfBrpX06r9XOnPs3CBx0LsBq1zlADDVKXWTP9zKSQiV19uZ0MNfA4yfQjWXHczDedyPT5YTJQGsksNCoVr8k4Mz/i5AwsNaNC3PyZDGO6Euxz+Irn5z57mX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5HqUxP69AawWfw1RymqV6BlXxGV4gg/QqZva8X/7rA=;
 b=Nfvo7O9u/i1o+U4IjwpLtbFuPGUPRUan0QR/2OOqE6raN4v6SV2JprBhrG4M2RtS27USYs0mjpMgX66cSzgcspVVGARXhHfJ99zNBRiZkL+aXK9qYCqzZjeRTKHg/54bLYJh5crz8GhxGUWZTSsh+KiltTG/rbuJb9BIwJWtV1/4sy+2j2a1iZnpNkfcnDiT6kl8hRV2s6xHMCx2dyv/Lp6WE7In+x5WruQcyRUzKZxB0xq6pqIr7boZo9AMItPhxsbziaXDRVml5CIExvI/DiWls4Z305pcY8UjQe5p/rZvpzY3xOUBLKQ+lkdSxt7N8Erm8FWPtgzTFrPkTD2s9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Mon, 19 Oct
 2026 14:25:58 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 14:25:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 23:25:55 +0900
Message-Id: <DM8VUFVLLGD4.XATN7MYP5N9D@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, <rust-for-linux@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: num: Add inline annotation to Bounded methods
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Link Mauve" <linkmauve@linkmauve.fr>
References: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
In-Reply-To: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fac8d2-2e02-442c-e42d-08df2dece4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|10070799003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	r4fbvzZ5nPa8U4oV9NwG0Sl+0pVMhTVG31VYAd6aUJ+kLKMJduUrKHiejB0s2e0TzBbTTALf2GvVvhRtfCiHZ7AjOnGrG2YhQ9RgptglHMG2Ap0gzTfTO1yoMspxBlxhCswEiNkPeUNySnfiGJvGMEetccFbcll3qOo4O9rzrfVhqqeVvG+2xpTsQj/oD33wrfLxHcm7e7PG4IZ0DTjOkV6cm5CXocs6CH6KzftuLGm6CMqe722Hj7FxLfBHRSGUGBfqB330wus4ZgFawN2YKEmSYReOstdL//dAaEdRBV3qqj3MC9wb4UvILeWP8xXUE0Q6fy2yl9rYWA2VmbWSv/irinHIJ9WGuQjezQXiWCN63rh2aV3cu97DrJP00j0TBP91aR6tfCI5lVtqFIDzSI46wYfEa2GI/oePfFstKq004CVPzLFD677upTyQgwM8rbMTPPf+Agg109aBPACeNokKD6KXcsQrTqjnoEHWkgpaJD9A8QG+qqH2+eRBSTfnun073dHI1RC9NeMRArUosyhIWfUD/pejQHz0ZRWIwxI5YRF1KD55LP2eeUFy6N5Fo/QrsSk6p3tIYwIbNhavWfK4DAX94kxY7sHIbysBwdxFZjIsiUVfR7oiHDc1AUg1+Y4yRhUFnwHr/3CyvJQXg145wmWg1L91RmzhN++2M/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(10070799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THdtdldETVFkNXAwNENGUFgvMlNOeDNpMXd0eGFtWFBtNGJ5b1lHbjg5NVlK?=
 =?utf-8?B?cUNQVTZGU096ejVOT2piaGdKdnRGczUrc3VTMllCWitNT09kYnYzVUdFbTJa?=
 =?utf-8?B?NVhjOWplbkU1WTZQMG95b3J4dms1UkVxVytQUWcvTlB2cHJPVkpxZWZEQS9w?=
 =?utf-8?B?c1pCSmpZUHNSWHNTdUtYYkRVYitZVmhyWjRkN0dwSEZIM0QrM1poZS9EcUpo?=
 =?utf-8?B?SnAzWnp2VmpISnFnbWtLcHpFODUxMzkvWWZ3djdjMnJhNXpLVzhtK0VnVnla?=
 =?utf-8?B?dm1LQnU4V1Rzek5pYk5YbWhwcWNiS21qTVNuTGVFaVI0WERPOFJaS1BvaWEw?=
 =?utf-8?B?OWFGL29ZSXNXWFpZdk0xOFpOaitPcndIVGxyc0lpdzRtS0grcVRzNzBnSXZM?=
 =?utf-8?B?YXJzU013VGlEaTBDWDFNY0o5cDNhSVplSjIrOVVlUmJaemtwemVGZ0NQUk9y?=
 =?utf-8?B?Y3pkbjB3MDBNT3h4YjMzTDRKNHZqQ09XZEcxSDRETjA4YUtBYy9YemZuTnB0?=
 =?utf-8?B?VzJZR0Vsclo3Yyt5WGh3N1Y0YXdNTkliRzN2Y2RGSXdrYjdLUDhEWktPNmpJ?=
 =?utf-8?B?bmR4RFNlOVVvTitQemIxK1YyTmlSRUlYcXFFd0pKSEk1aDJ3TmxTc0NUdjVz?=
 =?utf-8?B?VnEyVXhObTVDUDh4VTVRcEFwZFFLbjN4a1VzVGtMMFlnbklLTDI4QzhlbVAx?=
 =?utf-8?B?dlJZb1hMZWZWV0d3cWx5NkpIaEd6dzNJR1ZoM3ZRVG5sRm51cnBHaFVEdnY3?=
 =?utf-8?B?KzkxQ29vYWJwZmlQeFNmbVFleVB2OGFaQnB0ak1Ua1N0ZkZPemVXZ21Pc21u?=
 =?utf-8?B?RjdnbHRYUHAxbnBHYnlBL1ZDUjNiN2ZGTjFSMFhCeVl1a2szWTVzV0pKdTBJ?=
 =?utf-8?B?M3dWL1ovZllKamE2S1o1U09lQzNHeXNpUXUwL094Q0lyaUl2UkNIYVVSR2g2?=
 =?utf-8?B?WU5HZGNIQjlzV3VzQTJTQzlGN2cwVUVhaGZzKzJDMlFJNWxLSkY3N0NyZVBO?=
 =?utf-8?B?UGFYajdzeFg4UzcraXZ5azV1Mm9TcnQ3THl0T0tTYW9OZUtDdVVXQXZiNzNj?=
 =?utf-8?B?ZG1kUXkzcTFYWFhrS3NMbWxGSk9QemFNZUdDTVpON0RUSVZ1QkNDY1NSWDg5?=
 =?utf-8?B?RnFQdzFxeW5DRjhua3pNVlNabnIvWjI1c0JiTGhwMW96OVNqVzk1VllCaHZD?=
 =?utf-8?B?eVdrcjVXZHpxNnFqWVgyclpMT2djRjVuaDZwR0hSdWN2dDc4YUpMekpMWFov?=
 =?utf-8?B?SHM0ZkFjNWk4YWtaYk9lY3pwMThpbmZRZXpaeStBSFBYMmVhZS9kcFpMWXM1?=
 =?utf-8?B?aC9Rb0QyemNXYmh0WXZZQzl4dVB2WVpBcWZOUWp6YTV0Wk1wYytLUTNFY0Z1?=
 =?utf-8?B?RmFKQnFOREd6cUwzMFZWa3h3NDlMR0paYWxCMUd1dE1HVnRRS1Jabk5aL2pY?=
 =?utf-8?B?Z2IyMGdWRS9vZGJkdXhsN05MZ2QwMjZsM0VzSXhPUlBJdEtrRThIUzNhc1J1?=
 =?utf-8?B?ek9TTXJ2UkJIUGpWbExMem1kKzNRSlVUZGt6WkxvbklOT2dOYjlNSGM5R2l1?=
 =?utf-8?B?cVhidzNpTk8xbTI0d3dsZk5BSVBKMGM3YmlaUlVHYmhKZTdiM0xWSkJsbjFj?=
 =?utf-8?B?RkZrU3pnM21NL1VwUmFsY1hVT1dmSWlldUR2Y1c0L3B1aVAwcm1BTGNWaGlD?=
 =?utf-8?B?MXZyQTRBYXRKeDVaOGZJaHp4UjNhc0llMmMwOVVaUGFZQi9MRXM1TWF3UzVD?=
 =?utf-8?B?eFNneVg5OHQrWkhJbXpvT0drWTJycmpzcmIrbFBWaFAvb2hJREdLdUU4SGFU?=
 =?utf-8?B?a1NZSzZidll3N3B2Y1Y4cGUxcHZJaVg1QzNpUCtQcS9USjdhdGxtaTZmckhR?=
 =?utf-8?B?bGwvOGIzV3FZMjBIUDBidTdaSDhwbjlWK3RQaFZQcFZYRDdOcUU2U3RUTG9E?=
 =?utf-8?B?ZGxWQThHVVVJRDNNWUNjSWJod2xWVllpVHc5ZkxoVXVwQ3pSY1NQNEU1REpX?=
 =?utf-8?B?NWdObEx5a09IdXRpbkJTQlc0LzlocytVcTY2bHZDQjJNcmljUnBWUTdFd0Za?=
 =?utf-8?B?eVBUOHdVY01DeTNuSWh2OXplL0JMSExQWUJzMklyN09lQlQyVEgyT3h6MW5J?=
 =?utf-8?B?RnB2WjBXdFl1cDFxai9wRGoyTDJyRjdRWHN6ditGTllhMEZjeFI2Uk1hcDc5?=
 =?utf-8?B?MlV5QytJdk9Bajh5VnlGUVJoSHFwRGg2VkhWaks0RGxmV1k3Rm5IbnkrTlFp?=
 =?utf-8?B?WStNa2FUbXQ3UE03Ym4zWkUrWW9RSjlhUE5LcXIwS0RtbDArQkJFeUpSSkR2?=
 =?utf-8?B?R0QySzBreEZ0ZFlKeGZSMGgwZ1h4YkJqelN5NnJlNDY0bSs0aWphZG9TWHFI?=
 =?utf-8?Q?UrVxQ8VeG3oZSFzQZ5X03GxqetCJYAqqV3YRbhw/IFGKO?=
X-MS-Exchange-AntiSpam-MessageData-1: hnmxywdGBGab/Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fac8d2-2e02-442c-e42d-08df2dece4b2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:25:58.3622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YC3pRD3bPI82GrtYDZN6VY5SzAFE5sb59g/PKMrdsyNVoDoUoaOzQg62GBffzmnRSF8FZIot/RjcJsexlBzSUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346

On Mon Oct 19, 2026 at 7:57 PM JST, Link Mauve wrote:
> It was previously generating a ton of very short functions, such as
> <<kernel::num::bounded::Bounded<u32, 32>>::shr::<17, 15>> or
> <<kernel::num::bounded::Bounded<u16, 16>>::new::<16384>> on use.
>
> These are obviously better inlined, although I wasn=E2=80=99t completely =
sure
> between #[inline] and #[inline(always)], but the former worked fine in
> my setup so I went for it, we can always adjust it later.
>
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

As Alice pointed out, `#[inline]` is the correct one here. Thanks for
fixing this!

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
