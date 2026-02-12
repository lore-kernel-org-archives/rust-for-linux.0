Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7331DF256;
	Thu, 12 Feb 2026 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860984; cv=fail; b=KVBJ88CUwyY+JwGXZJxp1TpkVILMAsD1OEnUboD2I3UZ28rgyd7Ee+YgXlHs2iZe+hUz9lz4zGeJgw61+UeRiGtBBm14A9i4qK8zCkyxHLwTtgw6zF8B9NI4+AhPjO5EBKXM1vt3xKzujz7xQsbCS3SPVYhLwNVFShOkrac6py4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860984; c=relaxed/simple;
	bh=AOhz/ILHy4opQYWLhC8Uu7lEH+tNKtG0PgiI1ng0H4M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hYeKzRuGWcssd6xSPPMuitcSekgsWXEkkdbI4ph4YVAy8huGYabvPT9e73A5skwltwmxXtG9lnZbMLCrKedau0QZ8yv+KhiS6oYgqy1Mw6lRCnwfLkwKsNwEPzl3sE2aO6qdXlOxmpIyOt9cyjx/J7KgbEA/uM3QX2tpLp1Nk08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FKgYiH8Y; arc=fail smtp.client-ip=52.101.62.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FKgYiH8Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4uYx5+uPoJCyLSkQ0xGjdIJJTUKy8CEbIy+3DqVcXOKNC/fvkGX2hBkHbKx7vAVqFkMICDhlqkHYW16kRfAJb8BKVKce2ohyvQkxwbkOjG78U570+lqHzal7lsPPcZ6skEXMuApyVFfsZdP+7g7bDXYdXTpOxbgPzSaiyHyyzm9P09Xc5xqeTcmZEXrpgiOUnlWWNJ3plYfIxk1D3pgcZCxR0SwaZcIv+mlHoiwJpddBPujuaQUdieI0Q8SRIp3hKFHz3eh7tf3RFQPnDzHttswxYWA2rHC+8qIFccdg6zEf58L6NpDk+GOzq2DcssCFslgdEgs6wGIxte6RzgRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RT8DYWBhypkkiUrKXLCkxshY3lpB0b0AGqq6ZxAQ6UU=;
 b=rKVaJN+72fwpA5X202TXKIWWh+H0X6ZguiOdCT5hUDbDsmTOX2cTfJHjp2MVpUBl0coH5kfoHSpXvtgRq9n9X9vErNvws8rWAKyrCtWUefHNA86KlP7pWsrn4KVdR9zFtdv9uJVt0mIsrhF4i88acRPoM0rCGHxkq1xfOxfFjWjl6rEzzYGmSebE4XtjyypVVxeMe2Yu4qBX6/qL+5hBA0VSOLKH5j5IuG3J3eFHkL/dludgBETq5II/y/2RPYGnfC5Uhck2RY0gwMoUol5gQAIePBHAsOZagbcdFhfbxoMzj5DqD8CCu+9S7KarRtHUhNz+jv47WcudJtZbDaf8mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT8DYWBhypkkiUrKXLCkxshY3lpB0b0AGqq6ZxAQ6UU=;
 b=FKgYiH8Yke0J6qf3t0CPj9xdQltcstIb0MZi1e6U23yrg8Yt4h0pTDX/pWZrvYdMhFy51Ce9sw30o2QS5YSoPEXpszxQgSw0wIJXmVU6XbGFYKp85ikzpsC+PRHMySXeBCLUQ1gqA2iiO4OZer8mp+keaTIANbYug+F1eFRZeLnHpAhEhZFcJb0Mv/Qu2qfZH65Y0fxVYu6l4UCsoVlS401g1F1YPR78BxiTgIYlSk/DrW9BU8lZmd+xdSS6Isuf1ZXL+5b/rvkDKJ82A2ZpYqI4jh2UwSTRDFpHVvo0yQiGizuu+SDeOilVqfdK/BsM25uE+bBuU3nLhHFVXl5cEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7966.namprd12.prod.outlook.com (2603:10b6:510:274::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 12 Feb
 2026 01:49:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 01:49:37 +0000
Message-ID: <c9f01b6e-8421-4e0f-9b3e-aabf3a097bc4@nvidia.com>
Date: Wed, 11 Feb 2026 17:49:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/33] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-10-jhubbard@nvidia.com>
 <DGC1TY0BINGC.3THSKW6E6OJLQ@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGC1TY0BINGC.3THSKW6E6OJLQ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0fe055-d0f4-418c-bdbe-08de69d8facc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEI4bEZqVjFmWmd4NjdoL29haXdtbGpLazJuRC93YTJmcCsxZ1dITHRhd2gz?=
 =?utf-8?B?SlpRMDIzT0hxWHVkT0REWGZyaUdWR21SaTZHWnpLb2FYTXpSK2JIODlqRzZ1?=
 =?utf-8?B?MlRmbkZmSy9jMWEzRmRkS2V6T1paSk9ERkhoY00rVlYzeDRzSjU3UUtqSnE5?=
 =?utf-8?B?MVJHVHlwajdiKzhjSFNNUS9uSWwwSysvc2tLaTZZSGhFMnNzMng2QkFYVzlo?=
 =?utf-8?B?c3BqNUR2TFpvMFdOS1diQ0ZLLzMzL0VvZjVUWEpLTjRLc3Z4ZUFzbEJVS2RE?=
 =?utf-8?B?ZERsK1NmbHN4czJGYlNaemQzUE5FdDZzclVudEh3UFplZDJ0WUJFa3dXV0th?=
 =?utf-8?B?cnVDSnBrMDNkSzVrTjIrOWVtT0RhZ2oyVW5CZFJBcGxVTi8rVzlyd3lKQVBu?=
 =?utf-8?B?NVNhUkpyNG9ZTTBZRW0ydlZROEI3dFZyMXFaSm9MK09EL0JLanQ1OXdpZDJ4?=
 =?utf-8?B?b3UrYlE5YnFtRlVWM1BBK1hULzJlek94d3hya0FNaG42NnhDRWtTZVJabTJr?=
 =?utf-8?B?Yml2dEVOSk1mV3RTUTdYdGR5ZUJENmVqQjVrQlBaN2VjbnVmQ2lBNUJLcDdn?=
 =?utf-8?B?VDgrWllLWGZnTFRQdUlQRllIUU1FbWZsUE1JL0dSclpnQlZGSEluVlZlMDh4?=
 =?utf-8?B?Z1RjbDczcnNYRFdjWlAwYkFLeUNzNEU1Vi91K2JEZnl0bmxUaFJEYUFQQUky?=
 =?utf-8?B?RlJNYU5KRkV0T1VvWjA3c29ocEFZeEJqQTExVUpyYU9nOEhjY3YzNkFqQ0NX?=
 =?utf-8?B?VUFlVUF0dFNYSWc2SHdqbEFEZ1R4SHgzVTIwNFpNT2RIMjU0RWJJQVgxZzkv?=
 =?utf-8?B?VzJDQ2JRV0dndTYwOUhlTDJrcWxHTHR2eGtKNURZYlNLeUphRjdTeXlPQnUr?=
 =?utf-8?B?SnlndVRyTjdaekdFUlBVUHk0c2Y5TURBaktFSlNJYTUvb3RFT2xFQkxWc0hn?=
 =?utf-8?B?aGlSNENKOW1CZGRvMlJQRGo2OFhEbUVvcGtsR1ZZMnlLUk42MWZzelpaeWU3?=
 =?utf-8?B?V0tLMVkrelhTS2sxTnNqMmR0QmVuNjJvNFR1VmY1THhQd1c4dWw4eTA3TkVI?=
 =?utf-8?B?aFoxdURERDVaT2loWGtvRDA1K0lHZTcvWERyU2xtS1B1d283R01VaTUvanph?=
 =?utf-8?B?K2Q2dDY3a2pqZVN1bEdoYk9OSGlkYTIyQmVYcUNBUEdSWVMyYkt4NDIvSkpT?=
 =?utf-8?B?M3lPeXM0K0hJeGUxanpZSnh4U3IxUUpvdW53U0dnVjBsT09ualRsd1BGQ2Vk?=
 =?utf-8?B?UEdUVEZTc2ZnMUF2SE5zMlVacFRDLzEvMVZyWXk4YXUxZHVKSko4YVhycERy?=
 =?utf-8?B?UDhjblZvSGM2NkJYTWdrT0NZSlFOdHRwbUZLdUUxeFQ2eGFzbmJxYVVXTnBi?=
 =?utf-8?B?Qlkrc3EyRTljTC9hZndnRG96bWIwV0sxTXhZNUlyZXVBUEJMQy9GV215aTd3?=
 =?utf-8?B?OW5INUNMMCsyNDJIMWJCUGwrNStzVnRYeGNNaGJJRWQ0NDd1WGlQTmRVS21n?=
 =?utf-8?B?NlBSQlpSU0U2REEyMkw0V2JiWHA0SlI1WTJiVGluL2F6N0xVZUtxZk5XQWJv?=
 =?utf-8?B?c1UrTXFXMEhuRm9STkJ0NXBRV2NDaHlKZTFuNVQxU2h3MWJqVUhQekN4UDVB?=
 =?utf-8?B?amlHa3ZqTitjT2NSZVhRSVdEOVUwb3A3ajF4U2l2U2k3UVljZGJhazU2cnUx?=
 =?utf-8?B?QVpIUEdlOS9ObkIrNUhVK095dTR0Z3g3Y2tQZW9wUlZDTy9jNHFyWG9NV1dk?=
 =?utf-8?B?SFdBN3BVZFU1RlRwUjdVQ05YdVVkODNaZ1BDMDFHWUVEN29ZQm1IOVR2VnB4?=
 =?utf-8?B?Yi9CWFdYNVA1elRIUDNxR3hwdzdBemFTR1h5OGtpNDd1dUNvS3FReE1Jem80?=
 =?utf-8?B?K3J6b1RKOGFKTmcydzdDVm0zQ0k5WmxTcTRqV2ZyNko0M0cwSWo2QVdtVzZE?=
 =?utf-8?B?UUNCQlVvUmdSN0FRWnQrNElhcnFpOGRBZVdnNXgrbUlHdWJpRE9PZHAycGZZ?=
 =?utf-8?B?aTVNbGFwemw4Q3ZBYkZyUFUzQ3BVYTZWL2I2RFpBOTZIeDZuQzV3cmd3N2Y3?=
 =?utf-8?B?bm1WS0gxeEJKaXhwaHJnTVhEQ3JzSHJhWitzNnhLV0t2VjFKS3BYcTd5RGxp?=
 =?utf-8?Q?pEnc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm9lVEhJNTRUZFpLbThUbmZMQTJBclUyaG9CeEQrYkVianhVdVpoaGwyNU1w?=
 =?utf-8?B?WXhXdjhUL0gyM290Wnh4UmFGWi9CdGFrT01USE16Y2w0S1Bxc3FPWGxmYWpx?=
 =?utf-8?B?OWxoNnlsVk9CMytYck9yUWZEMFplNzJxMHRNTlNxeUU1RzZROGhqOWp6MnpY?=
 =?utf-8?B?aGt2eDIxQVFjNExPRWF0RTB0VlhjcnBWemlEVmVYc1UrTllOUm9OTDdwVWgv?=
 =?utf-8?B?OUd1ZVF3Qkc4YllRWURvRTNPUWVEZ2hWK2E4a1FsSSttdy9LbTZmcXduQlVP?=
 =?utf-8?B?Qk81SEcrcGhvcXM5RUZRSUcyVTlOZkwyaE1FeXJlbTVoMTg1YitCMWhEWVUr?=
 =?utf-8?B?MVV6YW5yY3RUL2xidUpCdTljWW5YYXkzTStUQ09mU2lMME1JZXViem52OThN?=
 =?utf-8?B?ejltUFJUZS8vT1BBb3VSUXNaa01RRjRNZ0RCRkUvZWZpK0J1OS81cy9jTjUw?=
 =?utf-8?B?S3BJTHpDSHJ0R2ZpR0thTkJMdDVUVm85dmQ0M2xMS3ZzV1RsUGJOK3Z1aXcv?=
 =?utf-8?B?L1FLR1QwNlZxK1E5czN4MmFiemJ2Y0orRnpKUWZwRUFOTlZIT1BKbjJ4OE52?=
 =?utf-8?B?bjJjQ2lpMHdxcXJ0Z2JpTG1MZGNoNnBkODU0U2JmbUVwTjZSRUdsMjBVTUcy?=
 =?utf-8?B?M3VQeloxOVVic1lJUmNYOUlCZ2ZvWWIwWVk4NDl4bFkyWlZiYVFpTm56ellX?=
 =?utf-8?B?MndUVXVXS3ZxVVFLZE9MaW95cWdOVmVaYjRCL3hjOXAwQ3o5UXR3SHNtbFBF?=
 =?utf-8?B?OGFJVTRDMmxOREJRcm93MU5ib3hMaEkydjl3bzRRYmVnK3dpVEVaNzIxT1dv?=
 =?utf-8?B?eU11UVlSMFdGeXVTVUgyejNXWHpZczExcEl1QXFJVzZhZ3pBTjVOWWRsV3Rl?=
 =?utf-8?B?ZXNhZzg0NnM5UnFTZ3Q5U0Jha0pvVld6SEVWMDRSM3ZQZFNiWll2SU9IRnJp?=
 =?utf-8?B?U1AwMVYyS1BJUlFDdktIR3JvS2VvSFJ6Q3lVWXY1OG44bWQwTnljdnZoNUw0?=
 =?utf-8?B?dFpIbmplRk9hTko4L3JYUFZTVnJXWUc0R1BmMzlZcXErNDBZbHJuelN3OUl1?=
 =?utf-8?B?b01FVE1WaWxHK0lEWFNRS1VZcEdkcVhRbUVWbzUxZW51NU05dHJSck0zNDg1?=
 =?utf-8?B?K3MvOFpyYzQ1MzRkKzNXaHZyc1pUdjJMTC9kN1JHc3daazVkOXRFYzlPVE1Q?=
 =?utf-8?B?aklGK05wd1o2L1BJc3preUVWNGF2M3RVSnI0T0tKWWs0YmMydGY1N2xOK3dI?=
 =?utf-8?B?TkVXU1RSelpyeC9PbUV5dHFWYlNnY0NiNEs0bTBHaEZ3Ry9KVVRmUW52a2xE?=
 =?utf-8?B?am9aOWs2VXVXRk4vNE5lRG9EVnF6TjNBT1dVcE0zTDZGaVRYdGVpZ25YRlJi?=
 =?utf-8?B?S3dmNUI3b1hYWTVkTVd1T2puZk9PZ0lsak0vT3l2b0p5bjd5UE9waFZSYVZy?=
 =?utf-8?B?R1Flem5EcVFNaHFLWVJGNGoraU9uS1JsdmJXcXI5L0c1emEwYysrOUI1b09v?=
 =?utf-8?B?VUNDZFBiNW5QcE1IZGNQM01uVU8xY3lHWkgraTB6Z3NSNXJHL0tobHdSTXZ5?=
 =?utf-8?B?YzBuckRETzhFQkVDdzBVTjhCN0ZiSDNsZVU0SG5QSEQyaVM3ZXZJZmkvSlEy?=
 =?utf-8?B?YkRkL0NSUG5hbkd4blRURDlaWnJJL2tZaTlHYW5jWDM1Y0dTc2gxZHlBUER6?=
 =?utf-8?B?dzdsaFRpeTc3cittankxVlZJazhwZExsTU5sdmoxNHRoc242Vno5U3MyenBS?=
 =?utf-8?B?NFFZMUU3SGNKNFNVTG5OaWVGRkVPb2xOUlVtYnRlQ1M3djBDS0JUandJcCtD?=
 =?utf-8?B?RWVQOFpxbFdwUzZXdXdneWhtTmYxNm8vczhaWTBlUUFmU0VBcmhMOTJ6Y3pM?=
 =?utf-8?B?M0xVaHVLUmVpNE15TUxYcXMrRUREYzlhcVBFQmgxRXpzczVaV0l4a1FWTDht?=
 =?utf-8?B?bUh3Smw2ZjJwNkJkNmQvUmxnM1kyZ29tbWVnY09IYzB0UFpIR3NmTG5rVDRJ?=
 =?utf-8?B?VUVtY1hJVENJU0dPamg2cTd4YWN2bUdUSU5KZHg4NStydTg4YmdiNkZtdW9Y?=
 =?utf-8?B?K1FBTGpnSU9WdGVGVFp5cmhOYVpqRlVDUC9CQzV2bFpRVUo5ZVJGeUNqYndu?=
 =?utf-8?B?b3J5QjR6WjVlcnBZZzVKeWNITzBVdHZEYzdqQUhUcTFwYzJHTzJoNTFBOEdz?=
 =?utf-8?B?ZUg2TWNXdldLSlc2cm4yQTY2MGJrVEhrMFFvUFpRUFg0MGRmaXo0aCsydHZW?=
 =?utf-8?B?TjczdjhYa1NRbys1ejYzWVFWcm1VTFR2V0JHdlN5N3FYanFXbG9yMk9kS1ps?=
 =?utf-8?B?NkIvQzhSOGhneWJxUllMTzF5RmhyZTZRaFBIN251YkZGNGVObXMvZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0fe055-d0f4-418c-bdbe-08de69d8facc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 01:49:37.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KODNVDI7DV+u0Ed+A6+S8Q0UPf6xEdktGNTXowkjmDC8GplRjrux5Wk2b6431ja4rsTD7WhdTSpxAqgH1sRmhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7966

On 2/11/26 2:09 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
...
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 24feb0e8723e..f04e2a795e90 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -304,10 +304,19 @@ pub(crate) fn new<'a>(
>>          let chipset = spec.chipset();
>>  
>>          try_pin_init!(Self {
>> -            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
>> +            // Turing, Ampere, Ada: we must wait for GFW_BOOT completion before doing any
>> +            // significant setup on the GPU.
>> +            //
>> +            // Hopper/Blackwell: skip GFW_BOOT completion waiting entirely, and use the simpler FSP
>> +            // Chain of Trust boot path (elsewhere) instead.
>>              _: {
>> -                gfw::wait_gfw_boot_completion(bar)
>> -                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>> +                if matches!(
>> +                    chipset.arch(),
>> +                    Architecture::Turing | Architecture::Ampere | Architecture::Ada
> 
> I assume Blackwell is not an exception and we expect this to be the case for
> future architectures as well? I.e. checking for "!Architecture::Blackwell" makes
> no sense?

You are correct. I've applied this locally, so that future GPUs
continue to skip GFW_BOOT (which I'm thinking of renaming now, but
in a future patchset):

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f04e2a795e90..2034c05c04de 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -167,6 +167,18 @@ pub(crate) const fn dma_mask(&self) -> DmaMask {
             Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
         }
     }
+
+    /// Returns whether the GPU uses GFW_BOOT for firmware loading.
+    ///
+    /// Pre-Hopper architectures (Turing, Ampere, Ada) require waiting for GFW_BOOT completion
+    /// before any significant GPU setup. Hopper and later use the FSP Chain of Trust boot path
+    /// instead.
+    pub(crate) const fn needs_gfw_boot(&self) -> bool {
+        match self {
+            Self::Turing | Self::Ampere | Self::Ada => true,
+            _ => false,
+        }
+    }
 }
 
 impl TryFrom<u8> for Architecture {
@@ -304,16 +316,8 @@ pub(crate) fn new<'a>(
         let chipset = spec.chipset();
 
         try_pin_init!(Self {
-            // Turing, Ampere, Ada: we must wait for GFW_BOOT completion before doing any
-            // significant setup on the GPU.
-            //
-            // Hopper/Blackwell: skip GFW_BOOT completion waiting entirely, and use the simpler FSP
-            // Chain of Trust boot path (elsewhere) instead.
             _: {
-                if matches!(
-                    chipset.arch(),
-                    Architecture::Turing | Architecture::Ampere | Architecture::Ada
-                ) {
+                if chipset.arch().needs_gfw_boot() {
                     gfw::wait_gfw_boot_completion(bar)
                         .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
                 }


> 
>> +                ) {
>> +                    gfw::wait_gfw_boot_completion(bar)
>> +                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>> +                }
>>              },

thanks,
-- 
John Hubbard

