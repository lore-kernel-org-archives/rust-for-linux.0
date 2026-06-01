Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8236A03F;
	Mon,  1 Jun 2026 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295826; cv=fail; b=U48o44EWTIo7zqj715x9k/wYOuxExUq2FAVG+4MlKDUKEnD6FHv6/rlzVIa/VV6Erx/85Ax2WNZTgkbE8NnSCqRmGIcX/Rjtj5lbxzo8EietUlWVVtCs4tqYtaE+DVYTszXusDqDA6g6oQmSKqhnKjaZA9EE4aeZWZuiifl9k1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295826; c=relaxed/simple;
	bh=JPpP6tyqMKSpYA6rvBmOj0lzFkxUGUPkuzNdnjYD05U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=i0wKpgY/nhO9SpqRWBxS4efiPtX+VDMwMIBP3EZ4Hp8MJo0+vRovZ87BEDv50NR/CXzC7S6kpG+mDsMLQCdJaEZ/X/yjTL5likWLpz+iSNZEIEjMdJkvdCHg+bGnDR2/LNr3zabQ2GEiA1a9SzLAj8IFoSDpycPZ57FAs41Njhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UY8dKvIg; arc=fail smtp.client-ip=52.101.61.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UY8dKvIg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HblMpszKccaWH8N/+0c/Y3zYMvC7X3+KmaSRa5ooGPLZp581MVIuKWc7WZExOIFWdNHJL+BYcoZVsnvNHSq+fz6sjHZAWHpyuSJwlHebV4BDkOX72DOv7YIBZcySOcvRou/5EXxBZQv4KA4hP0XpUoC4L4jsf6ekpIS24s+Jd1AFJgrELEngZTJLDeIWPGRmon+GLv6/kX0gIcckrzegs83kIaNnwwB9BbmeG0JS7JeW5QQcOn0P3P+TjoRkdgQTx3Rp0A/Mxxp5JYUAPUGHlRDsqy6Ioj1kAgP5rS2AuUDI43eDgGm2I2XBzMjNUHHirM3OaHPmX074Kj6iOY8s3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPpP6tyqMKSpYA6rvBmOj0lzFkxUGUPkuzNdnjYD05U=;
 b=eII4KJPhDUuG/Ot1VdOvyvp87aZhRZFz3IdvpgTs062jkyla7JSfbB3TOx42z8I151CuXF7frEbTiH1iS4Hc5coZNUJV6wgKOjLYQ9QDgwOLtuhnNF0neO1c+viD5g5utiQnSS6kJRbX5NWD4xSpysxCKUH8nCZL7cNFEohVAhoRZtwLNfI9/jbBGZ3lhTYSsWrYV3Rw/6xiygaa523a1NahGJLvG6CKnX/b37tM1CG23ODFzb1XEl2SeVnkiYZS94KjNzDuvFtIohUhzedZBh7oAUoNvQmX3RSkKLJo+LPa/cfUPJ7EFdQUX8s6OcJ2vXZn+k6z+wN3EIUCiJfo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPpP6tyqMKSpYA6rvBmOj0lzFkxUGUPkuzNdnjYD05U=;
 b=UY8dKvIgzl8tNQoIM4GXVd9v49bV3u/tgAa0lKzPEUSKgahPCtxYAEEQUsHPN2geOAmaVCnX8vLQWBLbO1poRH2txTpDLUjR6EE/Qa9/hFrw4/Xf8jIgoKZL2YCyBwtCLdsuHRDrAhUZMWqnCmt9g+UOoDwBZAo+J2dOPOpnPCJEhBKcK4eaHLvmgH4OFUueEHxOU+xRGBmvlshJW2I8Q2BhWeTZ4dDVOQElNn9AUlMdR0g9MS8e+IodnTwBB6I3vWHH4kYjYTg6emg/dIu+NgQdOB7hRv+Js7RX47RhJ6mBoIo4Tu5bQ0Z68xaQC46niHB/E6gjdeear0ygm9NjOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 06:37:01 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 06:37:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 15:36:56 +0900
Message-Id: <DIXI73MGXHCT.2WLHI574KVI7D@nvidia.com>
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
Subject: Re: [PATCH v11 07/22] gpu: nova-core: don't assume 64-bit firmware
 images
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-8-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-8-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ee8c06-b088-4fc0-980c-08debfa82f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	tTnVTCrNIkTufNg2dATpovaXjm5ikSVaUGuWauFycwQi87+Yglll9j0SX8BqNSt/cP97xq2wRccoin+3yFnrJfB1VNNgdEPEUUwYYLve6yaQwCTzRAkpORYJ6R3/7NRr/dWrbNNz8zmdT3m+CnCVf+kodJ3WPPnVnCKfgpJ7gPkCmYVHtIO9jCbt60KZAfUj5XcI1jlxMsxkjoRuX6nsm+fSp2+2yurrxDOFpub2CtvcUw94M0DZFtJvq5JMKss2debSO9zFfH7zxXI1RDHcibdBve+sIL+bI849dPNrX97H2CfPuGygISW2O15U/B86YtSmGQWcpvtvwWyUpYB1VX7uU2PZMFHir1D57j2/nI5l19SByDNmN5UEV9XTVK2zv8k5TmlSsH1dIroB0Y2KB0cChs1ApTsa2bp8G88J12reZfKrPXx79U7lF91u7Eymy2FSxEddXq1K4bpFkxuF9Bi4blOS6sbg6+YRah6uk4D1lMwxdUAEKePfyWYXFcwZFIDA7TN65z4AO+hGMGPfaBE+fXSmrYHEDI/fn1qzTmUThpmMzY/rn1bj38el5LPFyhtOHRFlkb2VEL7mRu+36MPGffS9VNfw6K7KK6UhXqYxo46uzumcdF2ABIuSm+7jterz2YxDhUDxpKDNLxZWQJpE9tD4DqzK7+WC+ucAKKNl2jknIU4qzH3QQjecl0vzgnf/wKjK+zd2dYIV3oaKwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzhEN2txaHkyMEV2dk1XWkZwREk1TldBUkFyek1vV3hHTXdjTk5Rd1FuS25H?=
 =?utf-8?B?S3NqUkwrN1I3UWlOMjNQVVg4UE9mQ1Rxek1Bc2NSTFQxb0VyejJoTThtQjNn?=
 =?utf-8?B?TDZQZ0ZldHI0Rlk2aEhCM1BJOGk1MzJYaEZhSEJzSTd1WkhvUlBpVXM3bTI0?=
 =?utf-8?B?eHlzYnhLRHl4QjAwWlpEV0FtTHM5MDZpL2c2dlFCV2E2WFFxeVdwczBmWXor?=
 =?utf-8?B?N0pwM09xTmpxemQ3T0gzYk85M2N0aTVFdmRzbE5hM0RKUDREN3FSL1dTOFYv?=
 =?utf-8?B?ZG4wSXA5dEdmdDM3Y0hCYUZOV3FDY0pWQWxMUER1ZVpZS05OZ1AyOFRxTHV3?=
 =?utf-8?B?cHRDQ3Fub21kM1Z5L2dGczNwTElwT280YVo5WE1MeUNWd2I4ZVdyeFk0UTVu?=
 =?utf-8?B?MTZlazh2QTNNZXdJV0ZxYjdxUTFMSXg5UTFJNCt1QzNIcTZ0WFRRQ3RxbHE0?=
 =?utf-8?B?eHU0djBvWmRNRWZuOGkyR1NpNFhpbmsvTVRBemRXNkowZ2lzMUI2WU5TcG8x?=
 =?utf-8?B?cE00QjlLRHo1VytZVC8wL3ZwaVF6VUh1NG1wNitBay9OVElvUFhnN09jSGRO?=
 =?utf-8?B?K0YvWFZaS1djNWR4S3hqdlMvUXhZVHlyQWJ0ZTd1cXI0SytWVXdPTXRWNmIw?=
 =?utf-8?B?K1lsYk94Y2hOeXBqUkg5VUJVeEgwTU5TU2RhWFEyQ1Q5aDBERzFZSEJpS0Iv?=
 =?utf-8?B?d1AwVEJtbEk0MkM3SEZteHljME93VVJYQW05RTV1LzlLRjRLaXR4K3dIT0Fs?=
 =?utf-8?B?U3RCUWV1dEVZTUNpRVdyTjB4K1pyYnluekZmVVRoVldhbk1qT0NWcGhFVFdi?=
 =?utf-8?B?Y2tkbUN5N3ByZ0x2T1ZuOXVnK25QeklrQTFMb2tCNlc5a24xampWK3RXeVpW?=
 =?utf-8?B?Q0JRMk1kUWhKUSt4b1czQlk4aUNKRHlGQUhlb0dVSDErK2FaQUNrZ0JKaXBN?=
 =?utf-8?B?OC9lOWxMVnZKUHVoVlZsSnFVeWdZYW42L1A3eWUreWU1WkdyUmxFclpkMmla?=
 =?utf-8?B?TktXL1kxelA0UUQ2M2ZSTnVpdG9DeFpaOUZlZzNGUjNETUZZMzJTc05rVThq?=
 =?utf-8?B?eXRhRS9YQXhCNFZ1MWN5d3VadVNHTnNWekdicERZS2lCUUpQVlpmNmZ0eWdi?=
 =?utf-8?B?Nnd2K2g5WUZiNUk4cHJrbTdCWFFyNXpUUzNYRXFSbTlFdjEwbFRIVkxVbVVj?=
 =?utf-8?B?Y0dZQzFoc0hhL3hldnpLMG8vbWFaTUdva0ZWemppckRWZmh6Tm5kV2tPZUlI?=
 =?utf-8?B?VnJ1bkJFUFl5M1RYWXVad0IxSE5ObEhOcFJtZmtoN0tGc3Q5dFVrSG9wTndW?=
 =?utf-8?B?OXgyak93amV4Q3NUOHUyL1RETndUZ2crTHNPM1VrYjJTRkVuS2FOTlBhR2w1?=
 =?utf-8?B?UXhBOFFMT1lwQ1dVR1ZvVkdRdjZhOHhUYzdacUVuaElvbzBmYTdONkJiVUZY?=
 =?utf-8?B?cldIS0RtbG1FUDJaTEtBU1NldGxFcUlFQ3N3SXZHWGRQQVlVRGVhRHFpQTIz?=
 =?utf-8?B?NlA4eTNORHUrc251bFZrY2ZVRDBTMGIzWHh5R3JEbnM1TzNJaUl6RkdHT2VS?=
 =?utf-8?B?WlJyd3licm1NRFV3bDZyeEZIZndhZHR5ZUZqMjlONFZQc3podXExTDhHdFpJ?=
 =?utf-8?B?N09EajBFL3RFNjNGRTJHTDRTZ1ZtUFZZampxaHpBQkhtekFjQ1Y1aEh3ZGs4?=
 =?utf-8?B?MnlaV3kzN012SFF1RDR0N01qL09hekV2NUZndGd6SkZiVWZBVWdzdkZEVGJL?=
 =?utf-8?B?UkFab01yWmoyTmpSZTFSdkdnb05OM1JQcm9Za25ZZktHWm1aSXhla3M2QVpS?=
 =?utf-8?B?UkVPaXlDTTZRWm1UNkowNk1hZUgxVFQxWWh4TzFyRzQvMWROOWpLcm8wRVFp?=
 =?utf-8?B?Snd5MFR3SllybS9pakcvcEM4aXlIL2VSOS9Mb3BiSnE1NkNQZ05SMnJRTkxy?=
 =?utf-8?B?Tko5cDVpRDRZZHdwK1RVYkYraWs0d25LMkR3Qm5LVlViNnEwZXd3YTlkdkg5?=
 =?utf-8?B?RWYzeXppSmYwVUxjemNzUHoybUlpaFpWMUdXZnlLUVZ3b3QxS05vc3V4TmlE?=
 =?utf-8?B?U1kwMVF1ZmNSN3lzTlhtQnJ3OU1xaEVRNHh4TkJlc3RuQlpsQ0xmZlJrZEwx?=
 =?utf-8?B?N0ZQNHNGb0JTMm94a0czci84TnRjTnVEVWNvc3F0MWdKczZYc1RxRDFKd0h2?=
 =?utf-8?B?ZGZpUEZ1RjJVcWdLWDV1ZkVDS2xEVm5wTXRyM1NlZkluSFBGeTgxb2tpT1FQ?=
 =?utf-8?B?SG9oOHdtQi95NkVzSTB4MTBsdExjSlVRTXQ4VzlCWldwK21TUGZNNFVjd3hD?=
 =?utf-8?B?SDh3SkpNUVVTZm5RR0RXNzRQYVVoaDNYaWxtUHllUzhEM0NsTmN2QTNINXo2?=
 =?utf-8?Q?+aUEqEyGh9gkdcbWCobiodDMae1euNJaupwkbxiCprb7d?=
X-MS-Exchange-AntiSpam-MessageData-1: mvXPMutVQN1LZA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ee8c06-b088-4fc0-980c-08debfa82f96
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 06:37:00.8339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfrHkHdsycIPC5FakcfcWz/UhbDxWkEptR+55HjW9GeL4L0g4v2WPL0d4mpPTYz/vS3Y3fHm8wsD1qASyog0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Introduce a single ELF format abstraction that ties each ELF header
> type to its matching section-header type. This keeps the shared
> section parser ready for upcoming ELF32 support and avoids mixing
> 32-bit and 64-bit ELF layouts by mistake.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
