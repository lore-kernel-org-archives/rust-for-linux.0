Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903D5CDF1;
	Thu, 20 Nov 2025 23:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680599; cv=fail; b=Q/8whz8vp86gz+8PMxe1iNta4kJDKFpF0e47G43l8cxW1B+O7Aa+Wv2/QHGpuOKtGlgO9Xvekk+Yw9xUVETWHv3b/hk8kIcp1jDpWRNO3c6szdqQE1aKJNvl/bGyQ4RMRVrXvpfMFc4y2wMY7FbNnBmfVNIsRkCs/AwdQSIpptA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680599; c=relaxed/simple;
	bh=E+zb0tf/PvMKoTmEGXwEBN9p25fp9k8sipBHepbLoRo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IhP7Hem9bm8/7HDMRqyJp4FXaGrENSDwh+OUWd26M38NSyNpVkXB7ozglLTKddd81QV8+EQJ7GveOBdzOcdIcVt2QItlRy6kJhe2GBP69joOsgh3P2TvLMgxsMO2UkQhq6hFnfLXLjeMzeQqqAbmgi0c47tVxtVnDT5UQIWXD7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sExBk2JQ; arc=fail smtp.client-ip=52.101.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sExBk2JQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBd48VextNhjV94vNtG7pUinHWArEMCpRNVoHjfsMmaXHNd+NWOqH1SjyryvRhh9VkllnNiQJTHdUb5yRhtZ/g23wQw2AFelobNezAQmXi5wyygScGfRkjojCiKqhwfFGJ239aiqF59ctFe9oAgMAuGkT0r+WYey9VbPYtZvZZqQzimUhco+uP2liv5uAJiBo83qz2cyBHj0UfdHfqJrW+TlS2FFsvvEmUt/Mt9up+K0Qp7aonxNj+1EkNEjL4nSdcAmtTs0b1F4FHy6gK04A7eRgNI0Rzqy2K1kxOS9LUQAyWJ9lqDH/QbfePLDP776So44BoBBEhoOgbOMvf8V2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwtRoh38V9TsrVbBdcMB1QFPUrhUwEClHKNwdospWcI=;
 b=vml1S0HFebTRXp64VuJRZqQ5lO7u0jIUwf2zwhXVT0HwVXZuf5FLYNYgn6niD/SOEBAa71gUg2qvWhIEjTp7cG/PBqnuv7yuyMBz6E4np5wRUQXLXR5JA+26z/siFsC2IeTU9S11XnaGiGSwkzEY7z66xamSkibK3ZTVs2m7mync91bEhnWoLtKA1LrkkHSoVdR5egiJ4RMB4t/IZNc/hcYzrZdcwx89P/wh3e2Wu7PFTfHLIEYkbqCynwYk5gC4/zyHaxqY2gjT+QAY+Jfkm86vRVL2nQmQxkR3VDsMYjKXEo9UDAH+M32CVFgNrUAI0ddWdwdm6Z1dxgDVBFEP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwtRoh38V9TsrVbBdcMB1QFPUrhUwEClHKNwdospWcI=;
 b=sExBk2JQJR1RjgOoS+ZbWSIRFD2b6t1jOy+MlHZoqEzn4tPHZK5hvQjPKeZqi0bfWo5sqxQSjxuRCrXU0nFdOGVdGki5cPILfQ6BtklsOYrr+rOUE6MCWtFcLAIRlnjMTT5D8fMghgEQYeDClqQgByRgjSX3WNbWE+ceeTQrlvtCzrDY9Yg7xyUXonhgqEIPLzVGMdxLHYJ05AGbXGj5B0Nix+RwhbrVihtj7CWA8BTTBE0JAnZY6Kh5ngIqH/LW+hby5hfvl+i4ORDePZos161El4ws7E0cbl7h90VSv8sPukpmHcbsMOyrShzNXsDgA5Ztx+rtzuGF0XEKuIG47g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.11; Thu, 20 Nov 2025 23:16:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 23:16:31 +0000
Message-ID: <4b6ae41e-5cda-41ab-ba4e-628bdf23f917@nvidia.com>
Date: Thu, 20 Nov 2025 15:16:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/16] Refcounted interrupts, SpinLockIrq for rust
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
References: <20251120214616.14386-1-lyude@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251120214616.14386-1-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0101.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::42) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 21bedecc-c658-4349-da26-08de288ad736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3hvbEN5d0dWNWU2UHNseUxod0hrMzkyeFhCN1BRcEZqelF3Zy9VU1BmeEpO?=
 =?utf-8?B?UHFHYTNkM3A2UkIzeXVhUjgxSXF3UFRMajlzVzZuUlpieTZJT00xRDAxZVBx?=
 =?utf-8?B?Nm4yUklVMlgzc1NYRUxxWno2R3dhZkVjYllhYlpaMHNxaTI1Ly9zdmZRbmw3?=
 =?utf-8?B?eUNDVkJoeDZ2WVhXdU9KQWJaTFc2TEJQNU9Qa3NqbVVNSCtiNFNTb3Yzb2hZ?=
 =?utf-8?B?cmF2VjkwN0x6K3padzFmVk81RWNlM0hDSHVmNDd6M01pZUI5Snk3WWhuVWkz?=
 =?utf-8?B?bjErS2ZNYlNPYlkzOHVoR0xVbTRJN2lyTlk2U3BXcVNTZ016Z3dsby9FUzl2?=
 =?utf-8?B?Wkc0SzBXOTRYKzJFc0hMb1ovWTBtUnlsVFVkdDBHU2ZlUUZZMDZvSjFBdUVr?=
 =?utf-8?B?dm9TM2tRN3g2a2hyTHpmdTgyTjhaeWtlTGdPOHBWSGRhek9kVDJFRVVLVjJy?=
 =?utf-8?B?K0RtRmZxZ2VWc2M4djNNZW5DRy9iaW1UR1JMY08ya05CakJTRjhMd2RHcTZx?=
 =?utf-8?B?SkF6TkJhZkE4Q2NyRmRMaEhCK2NvdFBoK2JodTdERE9xODYxbkc2amtMYWhU?=
 =?utf-8?B?MDFGNk1IZGFITDZJRW9CcU1ZMktrcHp0MjFwQjZlZ0g3MVNrYkE2SmVxWVRy?=
 =?utf-8?B?THpEUGl4TmZKeFB5OWg4TUNFc1g0d0NJOWs2cndHeDZ5d3RqQkpTR1ZZcnFm?=
 =?utf-8?B?d0NPRFkrc2haLzhRZHJEcnFKalFKUVBmNWZrT1hiZW1QSHlJL2xtelp5bDdM?=
 =?utf-8?B?d1FxWk1OL095VjBibzlsL29zQkVxQ1RVRDdsS0pWWC9HT1o3bjUrNlpPTUJU?=
 =?utf-8?B?TUF3VURMZWZOb2RRMUZoV3ZxazZBRzFxcll1T3RWcFNMa1ZzcVEveXlGemcz?=
 =?utf-8?B?M0JwdGF4dy9aVnBKUVJYNm0rZjJjNjRvYXp4bCtyU0l0M0U1cWFyYW5rM0pr?=
 =?utf-8?B?dUlRZ3hvRnhZZURSM2s3bVdWZUNZN1FoK1pRaktHZ2VYRnhXQjl2Q1FwUWdL?=
 =?utf-8?B?YjVIUWtHdXROMS9DUU9yK2pYNDNGeG5yTUo0TDRTc2VobWttdnBzV3dtTHR4?=
 =?utf-8?B?czRzYXBEL1d1V1NUd1NjOUE2N2NrRlpNNGsvd0Z3dFhHdnl4Zm1EaUpiR2FG?=
 =?utf-8?B?bzFMZzlMWWRwMm5rS0JGUlBVbGx4SnZqZ3BQSTVNMzJXemUxRmFvZTdBVUV5?=
 =?utf-8?B?cnJCWHhJMnhYOCt6WmhLV0M4bnRBZmE5aGZwZFpMdURnVnZwSHRGaThpaGNF?=
 =?utf-8?B?cFZRaThqV1llcGlyWkpFcytkbVhXZlJSdlRuNHVvVksyeXU2R1FFMXM2MUpn?=
 =?utf-8?B?L2JrQzZUaW1wcHM1WFM5MS8wRk0rQktUOEJaMXVhYThldkpGVDk1clNDM3hU?=
 =?utf-8?B?WndTbS9uMTc4dlRBWHUvZGVyYUpZS1kxTHlPMnAvalRhUmx3OUxFUzZLVU8r?=
 =?utf-8?B?UkxQVnVPTVF4bW9kLzNUaXRsdVZ1ZDhkMnJRWUFxRDBtRERBOUJUMGs1V3A3?=
 =?utf-8?B?a1V6aTdrdzNYMTl4RTZUa2RsU2FSTVZmNFVoT3I0NE1jM0dUKzBaaW85TjBq?=
 =?utf-8?B?NUZFY1FMOTJDMGRUWE5XYjdqeExMZ0FqNW5nc0hVTks0Y2lQTG5sWVBPSDBM?=
 =?utf-8?B?ek5OVXFQclNoL0FkOUc2OWdwT3ExY0ZDdlpUbGxieS9ab21yak9hRXBVZVR0?=
 =?utf-8?B?U0JFamxQL3hvUUYxRnlHMmRKOXNJaEdhMmhqODdhMVRya09JNlVXeldMaEVj?=
 =?utf-8?B?SzhHeGF1WXI0NHhIR2ttTCtuS2ZxOW9wY0lzUWZLbm5qZHVra1MxVndQNlNV?=
 =?utf-8?B?Qk9pMkc4WEFFam9FdmJUTzRNZ3ljL3VJc2N3bVRPMFhlK09tZXVqVXEzenli?=
 =?utf-8?B?bWxMblpzdVo0MDExNTRnVlZYSEdUYlFBVW4vdndFS1VnN3lmdDJPVnprRFU2?=
 =?utf-8?B?L3hmKzBPdjg4a1ZuMlpUNFMzWnQySEJmTGxNNEgxOFdMWEh0bTdSUTZBQkR0?=
 =?utf-8?B?cTFMMTRyQWZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDRjTjlkZFRqUmJiclMzSWQzL040TGg2eWt3VnRSdmRsVmF5VjBFSExIWVY0?=
 =?utf-8?B?SG1EOTVDQkVFVythRU5lSVRpblRGdTg4SnIwMnY2eGVoeHRNSmcvUElNRWdN?=
 =?utf-8?B?RnE5VE50MmJoOGNMaWpCTlFBQnpOc1d1R1gyd2l2R2NHY3lSdjJFc3EyNU1G?=
 =?utf-8?B?ZkZoUGpndDlmZVM2cXUxeUdVUnJCUjBIMCs2WERXU09YaG1UN0lRMjRjK0g2?=
 =?utf-8?B?aGp0N3lobFFlZ2Z4aXB6VnlSNDY3S0xZTVY5bjkzbHhCQzBVVWdTejByU3U0?=
 =?utf-8?B?by9hZmR3NENpNWo0NkRVeHJodG1EWmI1enptMFVYU1JhSENMcEpTTVB6Tk1H?=
 =?utf-8?B?OExVSEhPZ3A2RHRUMit3dVM2N0JrRzdTNnorVFFTdEFzQmpJNzZOeVUwN0Iz?=
 =?utf-8?B?T1hZVnBEbEdnVE9vNkhoQW4rVFFIVTY3Tyt0VjBkNXNSTzN3MmFpeEh1aXQ0?=
 =?utf-8?B?aEpjRUlkTjFmMkNEaU5MclVTYUR5SnlObW1WQjB1VDFPcDRVMWt3dVZkcENG?=
 =?utf-8?B?aENSL1ZISytHd0FHdDZvaFdqZ3VHTVFXMGs5dWNidnNKRjV0MFlWeHRVaU5C?=
 =?utf-8?B?QmQrNDQ0Yjl1U1l3V0VCQ2ZpV1U3WXRNRUJpdXp4ZkcvM0k1Wks1c1dVVGlH?=
 =?utf-8?B?aFpEdk5PcERCcWZ0a1JUSndrbkdocm1ES0UyWHljU2QyZ1ZhRjFWeUJHeVRh?=
 =?utf-8?B?UWpiUkFDdld4VWd0ZHVvdGdiUG5ISk8rNUlrRTlRN014bDJnUDk2Zm9oUWNz?=
 =?utf-8?B?L0NodGVlUTFVYTlPaUoxYkZ0bGdzUFR6eFFIWlVDNXNXN2dqQzNPQzFZdkFB?=
 =?utf-8?B?VVpReWNQQVh4eGdFM0dsaURvY2dmZ2lqTmhzVzd6dGVOUnlWZXF1OXRFR2x1?=
 =?utf-8?B?eXBUZkxQNDlheGxJcnJEVlVZSWttTCtRTE5hRkVBTndQNi9xL1ZITHZZOW9l?=
 =?utf-8?B?QTliWFdrWU9TMUFlaWJGMXdlMHMzbkhNR3JKREpkbTlzbGZYcnViT1lSTlhh?=
 =?utf-8?B?enMxRUpGKzN2K2hSS3NrMjNPa3NsSUVoSmZEL1BESlBVYVpJUmlRdm8zOXYr?=
 =?utf-8?B?aDcyRmthOTA5QzNFakpHcExDSk9LL0ZzMW1SVTZoSVVsWjlXYStKeXNSUFBC?=
 =?utf-8?B?UEdZQytpUTNKckJLaDBCR3Q3c0svQ1d3L1BDU01lckxEdytPV0pXT3NVOGww?=
 =?utf-8?B?R1Z1U0lpTEloWnVpVmR3M2s1V05yYkljWGZjdHliU1p1QWQ5YTgreVdvQVpE?=
 =?utf-8?B?U09VM0ZpTUZDM2dLb0pCNjV1RExBNXFHam03T1A4WkZ2VjFYSkhFdTVJOXlm?=
 =?utf-8?B?K3E1WXdQalA5R01hbTd0WXNkMkZobS9XK1RJMEdBTmkzai9rQ05GeWs1UHBC?=
 =?utf-8?B?OFVDOHl2K2R6K0MvMGhDWlFkUUdaK0t2YldTWTJaazZpbGppcjBHWEhNd2xy?=
 =?utf-8?B?RG5teE9zQTNFVHhNQm1CNlFJb2I4OGw5bUsvdDEzbURtVGVBR0Zka0V0WFZM?=
 =?utf-8?B?cnVFU3VDTkhySGV3LzNIWWhJdi9Tajl3ZXlPQ0tvVm1mNzQrNlZHdFlhYXN3?=
 =?utf-8?B?M2ZIUHVHalJiMVYyd2pmeFZ1Sm1wZFJBck53U2JPc0ZwbWNrVDNjRk9jbTA3?=
 =?utf-8?B?UU9zT3UyTm1VL2ZhYWZHbEI1RXBCUW5JcjdWa0Y5L2ZTS1I2ZDRyWTQwUFRT?=
 =?utf-8?B?MHFNRzNheS9sRjRqUzlNWmRhM2l5VGI4Q2xKYkNtaVBRM2J0bW1lUFZKNVA4?=
 =?utf-8?B?Nks1SHFmVHpCRzJqcmZqbExESldubGZRNFlGbzBDZGMybVVyQ01NSjhSMkE1?=
 =?utf-8?B?OTRBN3EwdWlBdG5oQkZwMGN5UzJGMEJwaVJJT2pMWHNXSWs2WStxS3hTZDBu?=
 =?utf-8?B?cFhzY1MwY0VRODRnbmlONGdFUlpzV0RxMk9Nb2hLbkJyRXB5VDFoMDRGWEVv?=
 =?utf-8?B?KzJvQVlVUGsrVjd5Q3IrYUxxMmg3QjEwMzI4TitwanpCQ0hVZUw2aktqN01j?=
 =?utf-8?B?SjI3eGIxbHJhdlp3UW9abVg4Z2thTzFVQWRkeGJ3RXR2QWQyMStCNFpzRWpX?=
 =?utf-8?B?K0RPVVhSTm5CWFl6MnFmYnRlRlFBUmdRU00rVVI4cmdUdVlTTlF5WW5kSzZF?=
 =?utf-8?Q?m+A0pR7kkaZDpYra32vrajBNb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bedecc-c658-4349-da26-08de288ad736
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 23:16:31.6049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQDU17M1mpDCYtXIiY1ZUtWHdmewxjsvxZYtAmSJpQjx8PUH1NRWDbbbq2Rlb9yRhcEFKq/3J4qCx9n8nIGccg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

On 11/20/25 1:45 PM, Lyude Paul wrote:
...
>   this new interface is indeed possible, more on this below.
> * Also thank to Joel, we also now have actual benchmarks for how this
>   affects performance:
>   https://lore.kernel.org/rust-for-linux/20250619175335.2905836-1-joelagnelf@nvidia.com/
> * Also some small changes to the kunit test I added, mainly just making
>   sure I don't forget to include a MODULE_DESCRIPTION or MODULE_LICENSE.

Hi,

The above link says that local_interrupt takes 3.6x as as as local_irq.

This is alarming, but is it the final word? In other words, is the Rust
side of this doomed to slower performance forever, or is there some
hope of reaching performance parity with the C part of the kernel?

Do we have to start telling the Rust for Linux story this way: "our
new Rust-based drivers are slower, but memory-safer"?

I'm not able to deduce the answer from a quick scan through the patches
and the cover letter.

thanks,
-- 
John Hubbard

