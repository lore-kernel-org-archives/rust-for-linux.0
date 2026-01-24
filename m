Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012071.outbound.protection.outlook.com [40.93.195.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B0B41C63;
	Sat, 24 Jan 2026 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769217041; cv=fail; b=ujPqfTSk7bPEJAcxshQfeWHuyCKVaMdQUlGN7hrbSEV+jKpVDJnSyyLhltUGpuOr5k9VMqHw1N32vkXiOxWySwIU7oEVEtBj2/cdAwov7haM6BenZBN5xlknHw7E+qX9eZzBjY9Jps5ByzHS8zXAXrftIvjgITzCx/0IS8FHX7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769217041; c=relaxed/simple;
	bh=nqyGnTV2JDHEwZHZ/fmhyJhoCmYu63OVezeiXtDKWFo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OViddP7mfyjraO95TNSx8GrEQWm4n0hqI8q0ZkTMz0KjtwL1nYVgg+N6H1vHeC8H1dGV9btV+5FfVzzmu3DLeQ5X292fpmhsGs0pCkH6QY3WdPAnYh59pHoO0wjiFY97Yf04mzWMHStNu7iIk8MursJLnii2XsVh8anxeGllMdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KzFn0Go0; arc=fail smtp.client-ip=40.93.195.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KzFn0Go0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGuRNUftVll0DKVdZhMzkBbg/ufzTU1uiLZdiQHhPq4LGlS7bm/GWhHjaYrmDqgC1cshgL2bv6PgB/1IPm6ya1jJciwnBMW73B946RB3X/l42hWe4JxGVIrT7rH5BxA5+e89MYqVXtZbOxCuHS426lkGVgTqo53ai79aR3IYTmGnY52qqzvEiJ0YQrUUvXjoupH4n/Qzn9/zgWYww/YtQpHOZvdKnXeN2/fvgW3D5bf+70SLPYUUnpaJEhV6FlJT+5wJwA/hozO/r3R2Qs4i2xxpfx0efKJZco+8JsQ6i4z3CJZZWUWRWqGoxlxjflNqZ9ZF4ccs+CKL0sg5zCIAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7npyZ8WIe/1thn5EOb4TiEqgcyLJYRrbZ7hkF3CfHGA=;
 b=RHuUF5MDa6+eQGkna4Wu2s5DdlS1lv5hkJ+jrfAipGLCqTuuJ9Hy0V5uBhNXcMqXVwBTqt8PDUWIHWahtmVlWtW8DTN+h27mGpRHaaRT+8PrJBX5wimu/SGQICXGU5LGxW2xVMLRAfNUnu/xwXy1qHp86AYj9sqFFKNcUQCIvca0pDle5m7HMSdnnk6VqG3gorNfDOXyJcmquB2RZq2V3g6Ji63aHvlHCv7W6pe5eM0o8CXpYHIp0JFPqI6z5tlqPO39kY3Ks/BLxlHV0vpeUdgEXsTE9H+Gg+oaijOW2X99Me9ZWzYqp5KItnpjrbJ83Mee3neBa9CZzm9SJV/yaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7npyZ8WIe/1thn5EOb4TiEqgcyLJYRrbZ7hkF3CfHGA=;
 b=KzFn0Go0Q134ni2VrmqsCvxwXi+jkR4diae2lIUJU6Pek+r0Y+qHQGbsjcwKIu3LebGmEciUwi5B4s80qlIAoru+9TEGs9YIjucEDmEllA5nPnfYG1reVi6LrM5sLu40crUbSzJDSoERcIr9nPORgyNfmxcltV9s8Yp3rZ7MPexIbn71i4C7vBHKbBnQ5WDwK9uSP8ii++GOLhY1JjG9eK+8dncy4NNFv8dxMs92V5x26MwmZvIaLL7GlsFSgebQiLU9CyKeHgFUhX9yLas4uIFm2I1uO8iZuQKqNPSfAM6WvOarqALm7HG+REfJwDCiVFdXHGYyKTApy9d8jDopDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Sat, 24 Jan 2026 01:10:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 01:10:36 +0000
Message-ID: <4c5ca917-1ee5-4e2f-816a-25e77e842af8@nvidia.com>
Date: Fri, 23 Jan 2026 17:10:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown
 release polling
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-29-jhubbard@nvidia.com>
 <DFUEKCHQISZL.GIHM3SA9PAZN@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFUEKCHQISZL.GIHM3SA9PAZN@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: cad42267-026c-40ef-ea8d-08de5ae561af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVA4SjR2ZVcrTWhXMDhmUnprVmgwTStYOUZ3WnRTTkRWQStyZlFwbmUzV3kv?=
 =?utf-8?B?ZGRFYk5oWmQ4QUpqU1pkeFh4ZVoyQXdjNURJaWhXdnpWemkxUXp1RTRRdFp1?=
 =?utf-8?B?Z1hvc1hiS1A0QzhHOHJNbFVkMjhvMGhoams5UjBvSlFjSnIrcVNhS2M0NHlT?=
 =?utf-8?B?cVdlOG5HbndPMUlQcW9TVVpiMC9LZmpSbEphbHJIbGZhejJmMzdlakUvNkJ4?=
 =?utf-8?B?N1hhdU0xMzY4bzFIdHhBbnRJb082RURpVENuMGdydjllYmZOSUxIQVRIaVRX?=
 =?utf-8?B?KzhBN3pYOERoRStLNG0zWTJ0YlB1M1RPd1hMc1BFeHBsVUdjbUVDK09lVXVj?=
 =?utf-8?B?cVEvMjEzMTBXVUszMWdkakNhVkxlUy85RVkyZmh0dmNMNTJzZTdpZWFYSXRa?=
 =?utf-8?B?U3M1Zm1nUGl1U0dKSkd1Nk5LenVLUmFEcWNOL2xubG9NaTJZK29yNW9EVEFn?=
 =?utf-8?B?dlNJSUVjTjBNWU93dmJidHlESmxWKytqdGJSbUJPWVEvbjBZQ3dSTDhZa3Fo?=
 =?utf-8?B?dm43bVpvMXlGbEh6QkdjM1dzUnAxTmY1RUd5azBhcytuUnlrNWE4K0Y4Rno2?=
 =?utf-8?B?Y1hnNzVHbWo0SldJd1hYVXJKMHZFZ2wxUDlLZmR0bW85TVY4YytWT0NtUm4w?=
 =?utf-8?B?N1o0Y3RtZDhoYTdrRStGeklZYnFRanFUTFhyN0FMVzl1eVRZeW5NL0JuM016?=
 =?utf-8?B?OHhKbkoxTVJVcU4ycFBBblltQlBjYUlBSGhjK1BKRTgwYXBzaTEyd1lPSHJ6?=
 =?utf-8?B?UEptc2syOEVPTzVFWS9NazRmYTJZTTJLQUsveDlmQWx3U1FvY0NjU3JZRWV6?=
 =?utf-8?B?YjBPVGRhbkpZTThRNmwwcmRXeGphY01CdzNNaDNFQ3RyMUVVT2pYZllsNXJS?=
 =?utf-8?B?SGlpWWt5REVVZ285L1J2VjFlai9Vb2FkKzgwWTA1Q3dBOXZ2a3lsWHF5WEdn?=
 =?utf-8?B?bWpTMUJ4Q2xLYStPRVdHQmpFR1MwTVZwUTJmSjB6cjEvR3pRdlBIVXhuUE8z?=
 =?utf-8?B?WkFFdHloNE9DWWsyOTBDZU9vTUVZbnl4cWVNRWkwU2ZkRWFGZVliNkloeVEv?=
 =?utf-8?B?Tk9WRXdvWjh3NGtrNmh4ME5HQU5CTUNFSmN2RFdkSnAyZ05TVVcxcHBSNDZt?=
 =?utf-8?B?Nkw2MTBPV09Rcy9tUXlZeGpwKzlTV0JhSjY0cXpPOTQvZzM0a2pTNjhnNjd5?=
 =?utf-8?B?ZEMyZ04zQmN2dUFwUDFsQ1lOZW9Nd1ZTS1J4UXhmalppMEt0ZmlVKzlic2p4?=
 =?utf-8?B?anRZank1ZlB5VHlEd3RXWS9EK2tMUjMvNjF4UFdTbDlIS2FvWWlQMVY2NXN4?=
 =?utf-8?B?SlhwWXlOVjExOWxrZy9vcHhwN0M3b2Y2TDBjUHVXem1xeFhkY200aXlXT1Vj?=
 =?utf-8?B?QzQ3OHlmSDg1c3hHb1IvTzBKdk5xcU5yUXVoemE0QjM3VVc2REkxS2ZZUG5K?=
 =?utf-8?B?emlvYTJ4V3BnaU1FRWxlVmx2OXZZQjhnaWJvblFiWWtwMHpNTXVXUHpyaEJo?=
 =?utf-8?B?eGZTdm9MNko2RnU5K0NQK25XRmZBYTZSRVp6YmlXM2FqUHdCZ01Sd0VBWHVO?=
 =?utf-8?B?ZDd3T3NOanFGQVBnY01WMTRMemJFcjByai8vTDlUdTZ1SFgyTEhPSnUzelIx?=
 =?utf-8?B?N1h6cWsxZlpDOHBiOVlMYk5Bem81dXEwcHhpNXFPaW1xRVczanFpc3h5UzFQ?=
 =?utf-8?B?d3Fwd2J2d3VUbDJhZnNCTVZEb09VTnJmRlM3Z09nVzV5b3hzTWZsVVM3QnZk?=
 =?utf-8?B?QllOaDcvNm80dXVUN1ZMbkxjaGdMZGh3Q1lFSjBHU3Yyc2EvcTVkblpOOGoy?=
 =?utf-8?B?VlRZZ1VWbDlnZ21pek83UTBJYUlWSmJzNDZ1d2RBVjNhT3ZxNjFJTU5tdDJz?=
 =?utf-8?B?Vll6cDU2RkIyT0hkZzVlOTFybWpwcVlvWjZpVG01UU40dmp4Ym5NcjEwVXB2?=
 =?utf-8?B?RDByRU9IdzNWU1l0VGJLL3I3dE9hOU9tWkQ2YTh6TkhReER4S25nYTZnQWR2?=
 =?utf-8?B?NVBiSVY0Ny9qUDJpalFuOWJ6RHhJc00zT1AwUlNIL2xCYVdpZE50anM2UTFM?=
 =?utf-8?B?TXRST3ZIdFk0YmxNTk1oOW5ERWhHUkRkTDNySW96dFo5bFZFMmRVRWszSVdJ?=
 =?utf-8?Q?ql5A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGM3bGd6L0dyclJhYklKQWJBOVhObWtzcjUvNEsrcVJiMFdJNkd2ZzVWMnV2?=
 =?utf-8?B?enc1Sk14Mkx6Z1lpZUtiTEovL3FyTE8vYVNzdVg5Z3NXTjh6cmpKQVVHRWZa?=
 =?utf-8?B?Vnc4WEtyYXFLdDFEOXpWQk9QbEdzSHh0SmNTdURiWXdHNkgrTnZ2OEhtR3FO?=
 =?utf-8?B?MEtLaG95N0dTcWVnc2Vlb1hVS1YxdDdNRE4xc0R6UlpPVk9GTTFBWS80NE4x?=
 =?utf-8?B?R0h4MzVOcDNRWkt6OFErR0dCZmRsQTZIUEhSQm02VUVQL1Q3Y2tQdXNOdGYz?=
 =?utf-8?B?bGN6blJac3dyWUpHRnRjYVVwNDlKS0MwZ0tDb2c1elBFL0hjTFhDM2R3Qi95?=
 =?utf-8?B?eDJqY1FaRExCZTZ5NXgxS0pxMm8zZU5yNDdlMkw3RERTamlTc2VVUkgwKy84?=
 =?utf-8?B?d2xoNzlvbkVweGRHdnB6eXUrdU9Pa1FzN3lMYjFlcFBVM3pGVzJXVkxRYWYw?=
 =?utf-8?B?MXkzVWxscG5nRk5BdjZ1cStmdzQ5M0t4bzgzR0NHdHBJOStOemxDQStseUNx?=
 =?utf-8?B?c3MrOXlxakY0RHhra1pNRThMT29xdHc0UCtmblhZZWVKMUZNVWNlWjR1dFlx?=
 =?utf-8?B?eVhhK3lJeG9ackVRUHl2bWxRbUQzbmNEdWpVQUhDZ280OW1QTFpreldPc2pS?=
 =?utf-8?B?MmJ0eW1GK29zSnJRbWRaRFBLZ2dCWENZTjd4cnVDV2RIcGtuc3huYXZrU29S?=
 =?utf-8?B?WGlQSjYyMC9mNVgyVmxiczhybVZBa3diektJQzBtYkVhQkVLMnJ5VlFzQTU4?=
 =?utf-8?B?VU14OFNMWXFobFk2MXo1eEZDbEpzc3o0UTNxWXNzV3c1R3JMSTF4Y1ZVcTk1?=
 =?utf-8?B?MWtQV2FjNDhBc2hrZWZHT0NXbk1qMi9iWk5yS3AwQThNNk1DRHlSb2NFWXZT?=
 =?utf-8?B?VjhrbFBheEdCaFkxb05ZN3Z4WUNQam9vSERwSEpGYmNoeWpYTXY4ek4rMHgy?=
 =?utf-8?B?QlRRZXp6b1VlOEludGZYOTBYN0VvbEhreDI3RnZNV1o0dGhSdkRiaVZMN0Ex?=
 =?utf-8?B?aUYxTW5IaC9RV0pWN2hKakJGODVHQ0EyNVRXcXZUeE9Wc0NrUEM4akVnNHdB?=
 =?utf-8?B?ZjFJYXc3K0ZKU1BGZ09KWTNhQmhPNFl1U3dtWlMzeVY0emk2cml3dUM3RjJ3?=
 =?utf-8?B?UC9qbnBmaFJNam0rT1JuZk5mRkhHTkRzVzlBM1VSQ3FhdU9TL0EzZVJWdWln?=
 =?utf-8?B?bjljR3lXREJnemtQUUVDa3dzMXV4Z1RCa0h6RG5YNndUY3ZzQjdFU2QwWklQ?=
 =?utf-8?B?L3dnUmt6OUJUMUpmT0tvemJxWWs0eGdzczhKY0V5eUowMzNQMTRINlkrR2x5?=
 =?utf-8?B?RHAxa2grUUpzUkRaTUw2MVNkMEVhY0tBbjRYYTVwTlhJN09CTjZaR0oyUHlU?=
 =?utf-8?B?ZWdqaVVvMlZJSWRsbnVBd0lWb29NYXhPV20yaTJQdHU3cmpSdkJVSWRENUVt?=
 =?utf-8?B?Z2tmcmtrZFFmWDd6TUJjSmlocHprNGNGRDNTSzJNNi9FV2orVC9uR2pDVHlu?=
 =?utf-8?B?K2FoMGJhQ3hFbnZYRUdxalpQSEVNNHBpcS9td1U3ZjVjSTNzaUcrSHpscE1F?=
 =?utf-8?B?eW53V1F3SzRYUkREaWNVaHFEV1Y2UDlQckUxbU5nWE8rUzZTcUMrSnJHNjBG?=
 =?utf-8?B?dnJ3S0diQmN3WUdwNVdkZHpBUmZhTWUzQ1JVdDdNbStlc0o1UjNwUkk3QUwx?=
 =?utf-8?B?cEM5MExLeDl6WVVoWm55RnpGV3NqcGQvaVJlMjVIbjQ3RkYrZCtMd2tjKzNF?=
 =?utf-8?B?bnp3OW9CN2dtREx5S0pLcUdBV1V4M0ZyL2ZTVU4rZEVoU2pONFp0NHZkdWZM?=
 =?utf-8?B?TVNVcTIrTG5tK2phZHk4ZktTVGh1RFBPTGhadGI3Rk5HUDBmZ25Ld0RhOWNr?=
 =?utf-8?B?aWlRanpEeitTQWVSa0R0c0NCT0hBWU1VYW93bzI1b3lBSkJjY0hzN1B3SnB6?=
 =?utf-8?B?dWRXMDZFZE5FTW5WemEzN3ZUeENCTmh5VHBod0xmMFB1YWMzVlkyTEV4VFJK?=
 =?utf-8?B?OU9YY0JqRnFyeGFSczR1U05YNmFRUUkzd09ySUlSYUltYXdLRkNFai9nVDY1?=
 =?utf-8?B?emd4YnlBeWJYNjkzQ3FITjd0clhKRTAvejQxL2VXNEpzbUFTWFhETUwrWFNM?=
 =?utf-8?B?Ui9RRXpZeDFFK1ZUOHI0RXJnMU80T05GN3dIUzZjSUFLV3VqOEVzOUNMTXox?=
 =?utf-8?B?c29CZUxCL3pzSXdoS0MvejRtTmttSzRUU0xpMlhFUmdrL1ZyVTJ6UEwxYUNq?=
 =?utf-8?B?TXFaS2k5ZVRyTUVmY01UdjVNbHV2Z05zOGRwTEdQYTFDdlZyUjl5dXJJcFhE?=
 =?utf-8?B?NWFkVnRreGVzTVdOTWFLUVowYVB1S0QxUUlPQlZtYVdUb3dtcXk0UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad42267-026c-40ef-ea8d-08de5ae561af
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 01:10:36.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYIKetQZptcmDur5nMbIpzrMWnERmeUUcsdT1tHQb3S9tLBUtDn6Rt9RRJF37MrMDvnmurv+ld3XqkH4aWftzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349

On 1/21/26 8:20 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
...
>> +        read_poll_timeout(
>> +            || {
>> +                let released = Self::gsp_lockdown_released(
>> +                    dev,
>> +                    gsp_falcon,
>> +                    bar,
>> +                    fmc_boot_params_addr,
>> +                    &mut mbox0,
>> +                );
>> +
>> +                Ok((released, mbox0))
>> +            },
>> +            |(released, _)| *released,
>> +            Delta::ZERO,
>> +            Delta::from_millis(4000),
>> +        )
>> +        .inspect_err(|_| {
>> +            dev_err!(dev, "GSP lockdown release timeout\n");
>> +        })
> 
> Once you're done with the error, please just return early with `?` and not keep
> chaining.

Done.

thanks,
-- 
John Hubbard

