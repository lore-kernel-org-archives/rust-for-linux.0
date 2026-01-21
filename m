Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020103.outbound.protection.outlook.com [52.101.195.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0670B36215D;
	Wed, 21 Jan 2026 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012424; cv=fail; b=b2MEw8NusxmC4FjANQqaqaPcOC2VW9xGtuyqADFzsNtBh9iBADZE29XKJTvV22jKjDfTYYCtoqJrH5iixdD9vL35ztcJn1tWB6h244WMF5qV6oDHGru0HoUipkkfZFIA4PrgjM+7iJkAhq8EqgyHC+kbQA4loEkukyq1PpNiZNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012424; c=relaxed/simple;
	bh=8sdydRfWyg9fCwS2yKS/O30ZdhWPXNQmB80020mkVpI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=eaxKd+VSPEOBRUIQIzjGRYmwXfbXvbjqf7riIz8gD9pF7jSs24qwbYyKQGty0T4WPdyqG9jm9n017QDbTOS+jdfBo39PuzgPpmZgd4dt9MHg/sGH6N/SgV3c57v16xiH4MJXPk4unfGZOBqJsHsN+1aPB+VpvHEduyv4kOm/0I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=p7gyhWBB; arc=fail smtp.client-ip=52.101.195.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="p7gyhWBB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8VlbjBNseCN93jR7e6fTiLwqLsD6gLJ0YLY96kuG6nzsXtW+ssLOwT5fXEktAe5EOKl42RsMiEyuUGn7eMe5mIRtZarHPamsl9u7EWOxe9teUkR3t9TzBJkZD8XMVxBiayWdh5+N2X3ZVQVVLXQKA8K9/Hk2ZIZ5/MDj3skjvxMw4VYcuIkWPjgpksit2FT9TdVmJYbFZFCJ5F3PuOZ1795Peg2hy1kZsKeV0Eu/l/mn34kByO0kM1clddeO4lH2JqXM4fC9iELkG8prIAdfLiPpjLHiC/74RK1rzLTPjLeQG6aUT5Zl0t9K/jDNCvNzNWCggIfk4Clu7eqzZcJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es4/jPzWfzYoAA+P1H4aTaGabaJZsEjSjvNvmFxb6ow=;
 b=JUOAuy+8IKZfE0BzWilhUV+Rt5jHFhnB3Y5o/jfzkv58rU/hxE/nA0szHtcPAIfAYaTIDX6BC7e7tJ2X2yoybydsGNAWodpUB4O3Bb164BrK+HA54KWlGMh8y+Qyo8M0zygb3Q2j9zMFACHhxYGfaV1JBm0gYE2XXTxnSZrutfHJDFY8fWUiktYViYBposVsStt+9VSnKDWhK7tQ2pI6Qdt89dJLh0sXUWIixJ3PCWIf/Pj5/RRGSwpZyj49MJwn15G9J/K3AsccWlCfH4vH7pMcRDKwpdH3K/SXLaqXsXBlrqBjs2a0KbtM+VNTw0Ti2xeO5QyRTTGu8bE6L21UMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=es4/jPzWfzYoAA+P1H4aTaGabaJZsEjSjvNvmFxb6ow=;
 b=p7gyhWBB4mAOi5IL/rBakZ35uFBvSvYqa22w3PEnEMObltCwnkmNbavinCWvZZwZF2aW2oihy7byF/uYMGaLQV7AE5uzwSypSiav0Gtz9n9orPPVDRhtXUkjzzAu8HVPlf6oup2jDBOo4vYZB6bc/OJ9E6onNsDg8SE62bOJzRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2913.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 16:20:15 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 16:20:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 16:20:15 +0000
Message-Id: <DFUEKCHQISZL.GIHM3SA9PAZN@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 28/31] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-29-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-29-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2913:EE_
X-MS-Office365-Filtering-Correlation-Id: cc932042-4175-4b84-6eeb-08de5908f639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmFUQ1pKMkNEWjNBTFVGWDNOd0h0RUZIdnpkVjVueUZHYjBLN3Q1QlNCdU9I?=
 =?utf-8?B?NzZKSVlxcEMzM3JOd3Y3eExWa0EzTzd4cERXOXdCSE9UL0IwYUh4K3AvYThi?=
 =?utf-8?B?MVVJMGxDQndMU3R6dHpYczNvenJCSGR0b2xPRmZpSXpqZzh5ZXhIc2VzUTlV?=
 =?utf-8?B?ODdVSUgwWFRpMnNCb2Fkb3RuZ3JQUFBMWVRRYnVqN0F4U0RiR1RuT2F3NlVX?=
 =?utf-8?B?TVYzM2VrMkQ4d1BsRTFKZW1CTXFBQzlybzgxQ0xSTzl6c25zZ2thR0RyZU9G?=
 =?utf-8?B?Z1kxVktsTW0wVkVsT3R1bDdNRGdOMHNicVB6TTlMZkdaUzdBblc2MlhTcDd6?=
 =?utf-8?B?YS9wS2hhbE9vZmp2NlgxVXJSRmpZdlN5Z2Vwd3JFWkg0Y3ZuQkdoTFB6YXlV?=
 =?utf-8?B?SUp5U1Jpemh2a3MwalJialowWmJLRG1JNFVIL040QTF3dFQ1K0QwM0FyZ3ZZ?=
 =?utf-8?B?V1R3dldiSExacDJvYjREbnUyREY2UWVQaFV4VlkvZlJKN1M2ejdlR3RQNVRP?=
 =?utf-8?B?UURLUmpEZnF4NUpTbVRIOEZSRmVySGFud0dVdUdsSnNBZXI2U3lzQUtqcWsr?=
 =?utf-8?B?YzNtdjFBTlA5ZHF3dkhPaU1HWGZVNFNYRlJ0a1BtMXNSZHlHSmRpMFBYU2Vx?=
 =?utf-8?B?VkpqTEYyTFhuMytzYVUwK1VFOForSWQ2bHAxZWptQ21rMzN6RWEyT3NHem5R?=
 =?utf-8?B?YW9JV0tSejhlaldIUFhMd3ZHZVR0R242cXpMN2Q3ZmcvOXBzdG1kQjJDVGhU?=
 =?utf-8?B?eE1Pd000eVFDNWFINmk4RGVTYy9DLzlaMktka0UyMENVQXEwbnQvSFM0aEhp?=
 =?utf-8?B?ZitYUEEwWk9PN09TT1BjTHIzekJVUCtVSUFqN3lNTktSUzF0VG00UFRhU2Iw?=
 =?utf-8?B?ZkpxUkI2VVVodlQ5MThPV29SN1E3M3lhWnhxR0J2ZkVaQWp5dUwxSEloUHBR?=
 =?utf-8?B?VkFpTDBxeHVmeW5ycGNxY3FGVWpmamprSXgzbzRQNnFEcy9yUExyK1l2T215?=
 =?utf-8?B?blhOYldFTHVDZVEzelNBUEYyTGhDek5kQjBlR2tQQlhzd2YxWTkxcktzSmpq?=
 =?utf-8?B?NjEwaGViLyswOTl2WGN0MHdiQ2VUSUpHQXZ3bmJwS0FrVlZyc3EzbUVaSDJP?=
 =?utf-8?B?bUFEN2ZoZXBxL1dpVmcxQTFwSjMzaGVXQkxrbHhwUjhFODdRVWFmUWpYSTVG?=
 =?utf-8?B?RE1GbG1VYm9aL29JU21oZi9XTWRubDFIT21HVnJQUlM2ZlFyYWJTSytHOGsx?=
 =?utf-8?B?ejAxeFBtaE1PZFZzSDNPV0YvRGZpQVozQ2UvcmwwTUZIaEp5dGhGN3dBS2Vz?=
 =?utf-8?B?WU5yK3VXcUR6b1VqVFlxeGRCQlZKK1BDSlZKOUVPeU9TazZXMElSK1dyNzRo?=
 =?utf-8?B?UWZEQnVyaUd5TExPcG1JUmlPQWxJOXRwTk8xQ2JadmhBajlTTzl3RFB2bklV?=
 =?utf-8?B?N21qZ01US3NqUGlDNktCV21CRTI2Tk9UUlMzVmN2a1dwdWtCVHVSWmFYcTdy?=
 =?utf-8?B?aGlNd1YwK1o3QjVKNVR1MTIyTDJDN00zNnlHZTRjNU9NL0hpbWgwd0E5ejVE?=
 =?utf-8?B?T2V0eHFIUDArU1BGQTl4b0VVeE1mSUpzcm5vZXdqSCswaTRUWklUL0x5VW9Z?=
 =?utf-8?B?L2pzRlVsbEtUUjJnbEttckZ2Rmtmc1FXZ1lrRXpLSmpQSC92UzlPUHcyTEIz?=
 =?utf-8?B?Y2VpMkE3cU1aRzBnRk9SYUNqS0Zna29EdUdVYjl6ZDN3SjQ2WUtvSWtieUdW?=
 =?utf-8?B?TWpkTkhPbW1CcStxa0hjeWVLUDlGMnA1SVFFSkZ0eWsvaCs5d2JRbXUzckk1?=
 =?utf-8?B?WXdHdUtYUnZWSHUyaWR1RzUxVENCSitnVVE0RVc4aWpreEw1TlVIVTFRREFn?=
 =?utf-8?B?c2hBdFNDaTJuSUgrd3hzRzdjNW9WYzJNakVpR05zZUwzWHhCU25XOUxERm9L?=
 =?utf-8?B?ekxVSGViY0lYSDZoNjRNc0JUdWs5eGVqQnVvWjNyeTVQc09Zbmd4c21QSFdl?=
 =?utf-8?B?WitzMWFhUng0Z1NzRGl2eHhWUFRFRmtSRDQ4NjhCend4SnkvMUpUTkUwdDRy?=
 =?utf-8?B?RTJhaG54RHdGbjJCK0dsd2Y3SXVvaHk2aXc0eEs1RmkvdGgxZWt6UnNKTkV1?=
 =?utf-8?Q?vGxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlN6N2N6cFQ0dDlNSkd3NEd2RU5kd1k0a1BRNzlJeDFqaFdPR3k4QkpWb3Jn?=
 =?utf-8?B?WHdqaXJVT1lrN09YRDhuRlZiUFBGMGlhRmE3YWwvWlR6cXVDUjAwa01DZjda?=
 =?utf-8?B?d3VnQnRsSjhlMWtPc21HOU1EQmlubzJtZk5hUURRM204MStEaGF1UjVkQjdW?=
 =?utf-8?B?dGZxUU5FcXczckovV2lpWEdSNnBLVEFteUd5bFRvL1l6R3h0UVkwM2hBL0Fq?=
 =?utf-8?B?WGxYTUxRVm05Ylp6M3ZzQ3RrODloZ21kdW1lS3I4djV0Nm9HdlUzb01vUllI?=
 =?utf-8?B?QmhWSFdLVTRXRFJweFNhY2Z4aWZ0bWtnRnZIV0xlNzhmZWZIL2RyVU13c0lE?=
 =?utf-8?B?SkpzamN0dlcxWW51WFU1VGR1MDNXNlBQeTFKb1IzMGJkd1dLcHpMelNIVWRl?=
 =?utf-8?B?djd3aHJKUVdwdExQdTFVR1NaTW1CSDkyNExoSWN1NkM5aTg1U21XUXQ5Qk5n?=
 =?utf-8?B?UndtZC8zOWVIQitGWkhRMTdJUkxkYmxmUTZkcEJDekI1WDRMSG5wc3hLbzY3?=
 =?utf-8?B?YW4xdVNxU3ErcktteWJmZ3JuV1BzNGs0Z1lpZkJ3Z0tHam9SdnJCY2l1N0V0?=
 =?utf-8?B?TlFCNHVBWnJkSXBEKy9jMzRJTUpuYmFOYlJhNDFxN2ZFSytMRy9ZeFhPVEFy?=
 =?utf-8?B?R1FMRmNiQmsrck90SFQxVDZNTFZuQVN1NXQxb2hqLy84bi9pTG1YamI2OGtD?=
 =?utf-8?B?UldwS2xWYUNPV1pzTlMzK3VNVjVyNE9GS1UvVkZXT1FSSkdlc1VqMS9QMDZ3?=
 =?utf-8?B?NERldFhuMlVnM2lNWkhPMUwxQ3ZMTUpkQkxsV2FKZjBMY2hTUWtWdjV0OFlD?=
 =?utf-8?B?blBEdXdqZDNQbzNWcDJhV0ZYTHVjVWdPZm1JdXd6QWp3ZFZ0YmVXZzBZUWFH?=
 =?utf-8?B?eFRGZ2xkaG8wRENVTWFwRmdnSmFBWVduSWNxaDltamEzcVBNYU9yaXJKeEFT?=
 =?utf-8?B?bjVyRVU5NHlzb1o2LzNnVkJrdVhiUUcxYW9VRW1WWW1iLzIwdmZXM1c5R2wx?=
 =?utf-8?B?amJrNUpqUjB0T20veFliYjJxaVF1VmNmYzhaWHhMTmRFbmg2N21TVmZ1VW12?=
 =?utf-8?B?SW9EOC9rT3ljS3J5dEQwRStxTmM0RlRKMzdrSlhQZWFJS0ZzdkZEL1BSeVpG?=
 =?utf-8?B?UzJKbVcwVjNrK0ZoazE0ZzN4dWhtL3BsbmJWa1lZZ1ozTjh6TFgxWjlySGpD?=
 =?utf-8?B?MzlKTjZtanRzclJsN0ZKT29oYUIwRERsYnNtU1ZOQlo4dGNyN1hDMkc1Qm1G?=
 =?utf-8?B?MHE0YlNpTTNmanZVODZhdlpFSlIzamdac0R4elFUK1ZLR1liM0pVTDZLcEZB?=
 =?utf-8?B?OGdLdi9VSWkvckpITC90NGxnL0ZRdnlpU0FkYUZJTjZKMUR2N1NXTGtOT2Z2?=
 =?utf-8?B?WWd6YkFMbmhYNVVZa2NrbmkxbHN4Z3NPY1ovODRlNVBvYXpxSWl0MnRZYTVt?=
 =?utf-8?B?cldvNlpacVltVjdueEduMmoxTHNRWlJ6TWV4L1dpcjVYMExJdE9oZ1JGNXdu?=
 =?utf-8?B?S2NDZDBoM1MvSmU0eXFrSnpDRW1qUEJQVGZ4UzFHYytrd1IreTdWR0xJQUVo?=
 =?utf-8?B?TDFaUG5EWU9JQnd6K3h3aWVUZCs1Vit6RVEvWnIyS29Sb3VTNTZheUgxY1dX?=
 =?utf-8?B?cFNOZytrZThiNERUT1dxeDl4cC9YYU1ORVRBMXRFNVFOdTMrY0tOdTFmaVh5?=
 =?utf-8?B?UjhQQWExMUhwb0ZCNExXaVBkNGhxaGxWNlhIN2VPQ1VwcTZHdnRxZnREYTJo?=
 =?utf-8?B?RXVPMzVXUXdkL0RpUGlkaU5JTkhwWStSTkk4djhweTNLVndOa2lQQmFNakpw?=
 =?utf-8?B?b0FjY3E1Tkx5aktDVEprL01qaU5ybmY1eHVodDhOZ1lvWDZQZytTeUNDSmd2?=
 =?utf-8?B?VGRMTW8yL2FiRXRkeG5iMS9zTnJCL0tSV1lvWUJUT3JqT3BWcjZCZnhTUEVr?=
 =?utf-8?B?bU0zaXJlcGlkWkloU0lxeFB1eWM3QkpXaXdiaTRkTERlamlidXFGQjdQSE5R?=
 =?utf-8?B?WkFQcFlzOUFsRnpoQkhrNFArV3B6dFJaekw2clplNytTUkR6Y0xCdzllRHE1?=
 =?utf-8?B?cHBKd3RXZmxGc3lNL21LK1NEYW01UTFDQm11bkZGSmJwQ2xhYWllb0VDdFBj?=
 =?utf-8?B?YndJM0RMMndCZTZXeVZ4RWljaHJaaXFtNHRGeEs5K2hBcGlXTmhEcEhqMWI1?=
 =?utf-8?B?cjVXTWxKckpCMTFVWlV6OVdTMVVFKzU1ZUxLZFoxaVF3eGFDeTJIRm42NHFC?=
 =?utf-8?B?R3N5NE1uak5UeGNwTmFxbVhvdlhuemhEOUxFMURrcWtlOTlNTGxNc2c3bHla?=
 =?utf-8?B?azFFTkEraWlkVHpMcXpOenMvZnVRc0pRcjVjUmpXSE5oUWZkWGdRZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cc932042-4175-4b84-6eeb-08de5908f639
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 16:20:15.9466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zy05NfZzIMCTety14CpYOsm3OC0Z/QxMpGilUUEU3Lo8d9i+BTrn6qJsraYU6u1pdLOzTkgAmp9Zj1fkdQIsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2913

On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
> After FSP Chain of Trust completes, the driver must poll for lockdown
> release before proceeding with GSP initialization. Add the register
> bit and helper functions needed for this polling.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 86 ++++++++++++++++++++++++++++++-
>  drivers/gpu/nova-core/regs.rs     |  1 +
>  2 files changed, 86 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 315f84907b11..4d04135a700e 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -15,7 +15,8 @@
>      falcon::{
>          gsp::Gsp,
>          sec2::Sec2,
> -        Falcon, //
> +        Falcon,
> +        FalconEngine, //
>      },
>      fb::FbLayout,
>      firmware::{
> @@ -154,6 +155,89 @@ fn run_booter(
>          Ok(())
>      }
> =20
> +    /// Check if GSP lockdown has been released after FSP Chain of Trust
> +    fn gsp_lockdown_released(
> +        dev: &device::Device,
> +        gsp_falcon: &Falcon<Gsp>,
> +        bar: &Bar0,
> +        fmc_boot_params_addr: u64,
> +        mbox0: &mut u32,
> +    ) -> bool {
> +        // Read GSP falcon mailbox0
> +        *mbox0 =3D gsp_falcon.read_mailbox0(bar);
> +
> +        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked=
 down
> +        if *mbox0 !=3D 0 && (*mbox0 & 0xffffff00) =3D=3D 0xbadf4100 {
> +            return false;
> +        }
> +
> +        // Check 2: If mbox0 has a value, check if it's an error
> +        if *mbox0 !=3D 0 {
> +            let mbox1 =3D gsp_falcon.read_mailbox1(bar);
> +
> +            let combined_addr =3D (u64::from(mbox1) << 32) | u64::from(*=
mbox0);
> +            if combined_addr !=3D fmc_boot_params_addr {
> +                // Address doesn't match - GSP wrote an error code
> +                // Return TRUE (lockdown released) with error
> +                dev_dbg!(dev,
> +                    "GSP lockdown released with error: mbox0=3D{:#x}, co=
mbined_addr=3D{:#x}, expected=3D{:#x}",
> +                    *mbox0, combined_addr, fmc_boot_params_addr);
> +                return true;
> +            }
> +        }
> +
> +        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
> +        let hwcfg2 =3D regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate:=
:falcon::gsp::Gsp::ID);
> +        !hwcfg2.riscv_br_priv_lockdown()
> +    }
> +
> +    /// Wait for GSP lockdown to be released after FSP Chain of Trust
> +    #[expect(dead_code)]
> +    fn wait_for_gsp_lockdown_release(
> +        dev: &device::Device,
> +        bar: &Bar0,
> +        gsp_falcon: &Falcon<Gsp>,
> +        fmc_boot_params_addr: u64,
> +    ) -> Result<u32> {
> +        dev_dbg!(dev, "Waiting for GSP lockdown release\n");
> +
> +        let mut mbox0: u32 =3D 0;
> +
> +        read_poll_timeout(
> +            || {
> +                let released =3D Self::gsp_lockdown_released(
> +                    dev,
> +                    gsp_falcon,
> +                    bar,
> +                    fmc_boot_params_addr,
> +                    &mut mbox0,
> +                );
> +
> +                Ok((released, mbox0))
> +            },
> +            |(released, _)| *released,
> +            Delta::ZERO,
> +            Delta::from_millis(4000),
> +        )
> +        .inspect_err(|_| {
> +            dev_err!(dev, "GSP lockdown release timeout\n");
> +        })

Once you're done with the error, please just return early with `?` and not =
keep
chaining.

Best,
Gary

> +        .map(|(_, mbox0)| mbox0)
> +        .and_then(|mbox0| {
> +            // Check mbox0 for error after wait completion
> +            if mbox0 !=3D 0 {
> +                dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbo=
x0);
> +                Err(EIO)
> +            } else {
> +                dev_dbg!(
> +                    dev,
> +                    "GSP hardware lockdown fully released, proceeding wi=
th initialization\n"
> +                );
> +                Ok(mbox0)
> +            }
> +        })
> +    }
> +
>      /// Attempt to boot the GSP.
>      ///
>      /// This is a GPU-dependent and complex procedure that involves load=
ing firmware files from
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 0d5c13f19073..a41d31449c65 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -277,6 +277,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64>=
 {
> =20
>  register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
>      10:10   riscv as bool;
> +    11:11   riscv_br_priv_lockdown as bool, "RISC-V branch privilege loc=
kdown bit";
>      12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is c=
ompleted";
>      31:31   reset_ready as bool, "Signal indicating that reset is comple=
ted (GA102+)";
>  });

