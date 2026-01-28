Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021141.outbound.protection.outlook.com [52.101.95.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63AA2F6183;
	Wed, 28 Jan 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615191; cv=fail; b=GG6s/ZRakd9wj9fyq9lXnrmu10LSEHcIWpNqtR551Fjo7ym+vxQbVynftHRRpjSxsMHbgjCCztrBRu1Q5JgtXNeIO9LE7tlzGtOAI4cQIU1hSROWCxqZx+nEdoE+JdJAtyJcvvz2wf6rgfxdE8YaQJOzQ/M+tdKSRdx7diE48fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615191; c=relaxed/simple;
	bh=CtNWYFFqxdIizkKH2o3muPWH2uVvlN0zBLWCOwj6+/8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=XU6XSeMjEc4fKHPXRIUcdvbuiW2nTibpYjc0pcHQgyCte5pinZpx9GR63h4uruue+md6YXrS/dY8k49rg3Z6AIXTXSlALBMg0DaStST0vpGXJKtLr652tU9XLMBd6jAmjUZRDuLHOfdroStuEtytdarc0a8cb0FLlrnnQ8OruZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FiSdjwCe; arc=fail smtp.client-ip=52.101.95.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FiSdjwCe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrO3T5YNIHxJQw25QAbWMI3lnbMG+nR1oM1wXAr4Os0JgRQ0jYCeu7bTJWB2hk3IUfqsQ3/KjnOLN1bCd25MwtYXmlufkcGg1SxaEKKPpE8+r5GFKOWAB+nzUe0pL4trkrBTRcIDrLp+H74JUAWFEYZe9AOuL/NM82tfFdfMeILkbCkle8TL25HBPSyV2o4Pf+EQgfdjr9R5SCUzkfjUpuCG7cLKlADnlhs0gdculqYbXdwZVOOUFkpPizlwJwtd9DYhjvUhrDfTdxXuhz5UbGxQ8Pu3MTZ/Z5ieBhGKtqhQNEYYuDTtlzVBVhcucXCfHFEhh9YNNZd+R+C2IZcdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtNWYFFqxdIizkKH2o3muPWH2uVvlN0zBLWCOwj6+/8=;
 b=g+TbibuIBIRCYXFGLHT2BojyaqAbKfv8M1CILz1aAxcfcyE0MNA2n2Y3OA2FzVg1vf9cmzfaUaujLXq6vUSo5bO/cWtmxaUPSSQKHP6yhGjJQJC2oE5YDH7PDK0WCSp1aCBrKCE99dyg8JJao6zxQ4MUjtYZdfUKr74Sh9kFLDj4XBK+JUHgzdbbGfA45wHPgdPDJrUMIK//KQhIdZ9LNfddGEMsIfUVYVs0ODhjXquxZzSNbzaaLVveEB8XomPMlj0HfEpWwpSXuXv4sbaPrMEW5EF2hMq9UmqSTfXn7eGyZXeEsWUaDvoaX2U4N3upPy9FvTarBHtfCaha+pDTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtNWYFFqxdIizkKH2o3muPWH2uVvlN0zBLWCOwj6+/8=;
 b=FiSdjwCesYx0QnA+DvaFBnxTSy2Mj0KFxMOqTscz1dr4cgMQmH38ShZ/F4lT5u1Zn0HWQ1jiSqn2VDGlWJ637l3vtO8sihSdzBJDObq6cmRG34IvpA/w13tS1+Ji/YZkhXGGOjHRw/AyPOwezIuH0DNuk/lqqSCjYxPco2adSBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB7978.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 15:46:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 15:46:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 15:46:25 +0000
Message-Id: <DG0C89D4BIM4.2ODXV9R5R2E52@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/7] sample: rust: pci: use `register!` macro
X-Mailer: aerc 0.21.0
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-6-aee3a33d9649@nvidia.com>
 <20260128143522.434f75f6.zhiw@nvidia.com>
 <DG099OR58D58.GQL20TH2D7PQ@nvidia.com>
In-Reply-To: <DG099OR58D58.GQL20TH2D7PQ@nvidia.com>
X-ClientProxiedBy: LO4P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 78087d2f-efb2-49ec-a44c-08de5e84653c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWhkRENCMkNIK0FMV2lKa2k2R0htaXkwZ0JzdWxSMW5XNUxNUExwWWZvenVS?=
 =?utf-8?B?QUFRdlU3aXRCRmZ3Y0VVNDltWkdDZUdBWmcxRnJyb080eGpMUHA5a3BWL0k1?=
 =?utf-8?B?eW9OcTZLazdpbkt1N0FCVjc2Nko5NXdsN0M1VUdBTzhNR3JEKzUySzg4SkJl?=
 =?utf-8?B?R3ZJVXhTRFFWM2xiY2lWdEg2VE5uTkVtNTdaYXNzYS9ZTkREdWdUZkxNOVo5?=
 =?utf-8?B?OUwvamRHSTVhOE5aVVZiQWpBWitpa2p6S3o0SVg3VlJYMExWSXp2Z0l3MjNJ?=
 =?utf-8?B?b0RYV1FmZVNGK29DaHJGSFg4d3JuVXlxZWt3YWRuUW5nUFNuTnVmRmN0NU1U?=
 =?utf-8?B?UjdMVUdZS1VpaE9JN3RNcXdaalkxU0l0ODZCNXVyMjM0dlJNenU5b1dtb25h?=
 =?utf-8?B?aVFKcnZrb1preFZXNnlTQlhWSk9tM3hJRFRCekFSbFhiUGUxd2hOV3hhR1NB?=
 =?utf-8?B?bVBnSEdyTUZ6a05sY2tSaGNJWXMybE1EKzJWcG1hRjJUVzJhd0pxdEcwczlV?=
 =?utf-8?B?YTBlRmdTQ042cWEwMzJHUzE5bEEyWjRhNkFXeEVCZk5UcUNJMTMrUDU0YnJh?=
 =?utf-8?B?cHQrMWpKTjBRY0J0TlRjOUdMdmY2WTJmUmQrMW9OTnN4dmpzWjU5R25kNnhY?=
 =?utf-8?B?RFRHTEJqVk5MNEIrU1d6RGdjVDAzUzZaclo3UUJkT1JDNDg5blZJRkl1Zk1S?=
 =?utf-8?B?RGhKZTlVSjVEUnozdGJIRkdrYUdtbDllV25Nc3l3MXpYVHk1N05Dc3ZMZDZ0?=
 =?utf-8?B?alhSUVVHNk1WMnJlanBFS09uSll0V0RKaC96TnordDEzQUM2OFFIbnEySkVB?=
 =?utf-8?B?dDgzWVJOZU5PZkhwRHdnWUkzVXNTUExvZ1dVMWdkbStyU2FOQVV6bmFSeko0?=
 =?utf-8?B?eHg3T3NtWEVpaFZMdkdvZytTMytwWHlzSFRZQ1pySzFLQkw2WjF3ZGZ2WDJ3?=
 =?utf-8?B?aVNrMUV6MXJpTU5yVTJWSTBta0lWOERrNnlmekNTRCtHWjl2UlFLVUtDT3dr?=
 =?utf-8?B?bHhEeUJmMkxxU0pveHo3YTY5RGtmVFRlaUNlbHQyTG04VjBFOEpJRnRNdDlN?=
 =?utf-8?B?dXVGMVRHNHRpYnM2NGpVWWhIN2wyYWpwcVZoNVZaT1Y3dTY2MEdMZFVjY0hQ?=
 =?utf-8?B?bzNBdnEvU0FUd0xld09uUVlQTHlZeHYzRm8zQW5nRGFscittRWlHUUkxYU9o?=
 =?utf-8?B?QnZvZXR1TGo3Q1FORXFtN0VQdlFHL0tudUZHNVB1YnkvRDV5eXBQL01KQXp5?=
 =?utf-8?B?SWIzcVZsTldTNnBqKy9obWczVUV1S2dxdFNJVVlPU0NyYzcydm9KR2V6VldW?=
 =?utf-8?B?R1ovK0hvSkh2cHFocUdva05pSkVLZit4THNweU1wQ01wZW1zZE1vSjU0QXJB?=
 =?utf-8?B?NFdjaEJjTTNGb0RWQUs4Mk5jZjVTb2JQeXc2UHBucWJ5L3dUdHBhanV5YUs2?=
 =?utf-8?B?S3Z6TWMrT0xuYzdrVnFTMHVjOTJXVDlkSGlCckh0WGdwSEhGOG51VnREeE5q?=
 =?utf-8?B?NmtFYllLdjZVaTB1Y2FuNWw5RzRmemwvdXR2VGppVm9uak9WTWlKc1ZiMTV0?=
 =?utf-8?B?MG9QSktHclZ2SE5hMEMwSzd3OFd4V3plSVliS0d6NlAwVm5reE9MVkRqUHZa?=
 =?utf-8?B?Uzh1ckdCejdkTTZNUGJtQkFjR290L0FhNk1HVm5ibVpPVm1EOURjcUlBc21h?=
 =?utf-8?B?MDJ4eFNwYmRTT1FqQlV4ZTlMTnRheE5HRnQ0cEtrT2ZZTkVwdERBMVlJY1Vk?=
 =?utf-8?B?bkJXbTlKdENpQWJVeGcxYWVjWlA0ZHRxVWNlZnN5VVF3dS83M3pabktsZTRu?=
 =?utf-8?B?Q2hIZmRGK3BlRkRYcjVFZWlndXJUMzgxaWJWWmtMbllVVlhyQUlUYWNSSm1N?=
 =?utf-8?B?UXdXYThsUHpGYmtGZDkxTmxhVVc5YVV0WnQ2aW5EV09lWXJKZjZHSkJQQlRB?=
 =?utf-8?B?eGYwZitxbmdjbFVTUW02TW1ROFk4emRMV0I3Z3JqZ1p5eThtTFdXaGViMjkr?=
 =?utf-8?B?c3ZsV3dGYzFFZ21XZURaNDVqanZ6VEZIQVduRXc3MEJ2OEgvQ0RDaE1QY0NF?=
 =?utf-8?B?ekpEYk1hb2lJbkE4Q0wxOUFaOWZ4azhSeHdYVEllS05wa0hsRms4MVovOEZG?=
 =?utf-8?Q?pcjc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmJXU3JpOWtwV0JIWU9TN1FKamN0b09FSWlaSjhMb0JLbDl1MmNzdVpMVGIy?=
 =?utf-8?B?dFhDSk9SNTJYdmtkYXZ4dDFiNmRuZlR3a0oxUk9VY3UyZ0RrVTJZTysxUFFW?=
 =?utf-8?B?MkZGY2xXT0RXUjRpR0tFNW9CaXk5QlpqM3Q3TVg3SUpEeUthN0xLK3U4TUl3?=
 =?utf-8?B?SzJ6anRyZzdSNnM0cDJWczU0eEdUR3d2OW5QaTR1aTNkWmNJcjh0bUlHZHND?=
 =?utf-8?B?eHEyZUJYRERDTEZFV2dMdUlXaEVMS2VYdzFxa0lZYUtmd2k4dmV6UmxSK2hZ?=
 =?utf-8?B?OGhhOU4zTXRzcmFna0lwdlpWc2tKTnZnL2FZNEtZTk5paDBIYTJKUGNEQXg4?=
 =?utf-8?B?aHFOSEw1OEFNTFBja1NmWDNwRGNHWk4wY2tPVzJxT2M2NENxcjR2MzF4VTdL?=
 =?utf-8?B?czlPY0twSjdvZEdZS3NZMHloR0xpbmltMlpvcVRGd001WVM3R21TaWRIU1Zu?=
 =?utf-8?B?dXFwbkNUcnRNSFQ2b2FiSnZLeEd3WGYzWGU1Y3JweGpIQ1BNRGNZTjBzQUw2?=
 =?utf-8?B?UElYNEsvKzdzZTlsL2txdG9uQllqbUhmSWpzMExxLzlSb1Eybi9lQ09nTFE2?=
 =?utf-8?B?RWZSL1hWbXFqcVdrRVBJYXp2K1ptd1NyT0pRcnpJdnBCWFVrYWdDYTIyWkVS?=
 =?utf-8?B?VUtDNnZOdGpwWjZGRHlLRzhYWnZHZTlIQWpxR2NJd3BRb21BMDJvMXVXWTZU?=
 =?utf-8?B?ZWV6R2FaUUdjVmJRVWRwYVZDclBCMmpJbFNHODZoRmdhbWVrblJtYkRjRHhU?=
 =?utf-8?B?SGM0ckVzY2FZeWt4MnRHVEVCdGtNL0xOS1huTVJJWU9qeDRDOStraDlNdG5q?=
 =?utf-8?B?aWN5U3pEdmExeThhQlg2dzhWcmF3M2FhRUk3TzNwZm8velhSREwyWnh5c1ZL?=
 =?utf-8?B?VGI0MUh1S0NhbTRpaTExMkNqRWNyVGFZSGIyWnV5YkQ3ZTJkdG5tS2llUFBZ?=
 =?utf-8?B?eTUvVmtxdXVzV08rUnBrMmthaG1zYkQ1NXhQWEF0K1lNS2YxUjRDbmtMRkFK?=
 =?utf-8?B?Vzhpb09US1ZjNXBXc1JheE1GM1dGckRwdXNEQmZUT1NHNWJxQk9tTU5IcC91?=
 =?utf-8?B?TFBuREtPU3E3b3JGS1ZreXlpZGxFYjRyUXRHZEdheWl2dkhOVENWb214bVR3?=
 =?utf-8?B?MDFlKzRCSlpiQWlqWnhva3FiQkZYQnZIam92MHFCU2dvaDRYckxJYVhvc0da?=
 =?utf-8?B?dmVlY1dGTzVodEVBS2xTWkdHYUYzK213M0VPeHZNOHFhTFRyQmJERWozWjlw?=
 =?utf-8?B?K3BCNnlMa3kyRm1YendFbnd0cStCZ0p1cWtWRUttcVdGTmlzbVZ1RDhSRDEz?=
 =?utf-8?B?Wk9RMXBEUW1tQjMrSlA2WHFKMEtGQ0J3c2hXR2JwamZOQk1vcFNsVWNxQldD?=
 =?utf-8?B?RnJzTlRJZEM1VnU2YkJPRXRHQWcrU1FqY2JJSkt1RlNGTWVpMjQ5MCtJUWlu?=
 =?utf-8?B?ZnVVMHFPeTQyUWVMZituVFRDVk44d2FNcDMzZ1FMNVREeDBybDRBVUh5SU45?=
 =?utf-8?B?emJMa3crQlZpa2NZM1hvYithNklIanNnQTFGenc2YU1oRU91VUpJeFovVFBN?=
 =?utf-8?B?TGpsdmRBNXlMMjhsbWdhMHE1SDZZcUlaN3lYUTMrQms1eEEwTjQrSTNVd2xF?=
 =?utf-8?B?bFloZThsYW1JOStjRjhpekE0VXVyZ1duVVduK29oamt3QmlvU3NrcWoraFY0?=
 =?utf-8?B?U1YxMzQ2b2VwNG8wZGQzb2hQS3hXY0owN1AxWEZ2UXlYSGpPYlFvWHBFeFdW?=
 =?utf-8?B?Ymh0NFZVa3BFWlhYR04zUjhDU0xXNFMvMXh6Y0cxRnBmeFhnVHVLQ0VITk5J?=
 =?utf-8?B?c21Mb3Zka3dQVDZUTU1VWC9XWjhjYlZrbnB6aEtDRDU2NHJSZUEwUlNHTzhW?=
 =?utf-8?B?T3o3RlBTeEZlbTA0R01JWTJnT1ZzUHFYbEs3NWxTT2xpTWpZVkQzaUgzMGx0?=
 =?utf-8?B?bDhEMHRNSmdxZEZ6ZmRJTUpTZmhCQkZJdmhxdXY3ODIyTTJETmc3ZG1XMytJ?=
 =?utf-8?B?bi81eG45SEJxMzBkNEYyV2c3L3l1dFlybzRrZ1M3T3hzRThJVkI0eS9nYUZN?=
 =?utf-8?B?L2RjWkc4SGU4cWZZV2tWMXVqSWdQYnU1aDEyaVFMM2VKaXJ0QVBCVDJNd3FF?=
 =?utf-8?B?ckl6WldkRlRGZlkzLzVjVGpJZXdDTlljODAzVzQ5bmtUQ1U3VlB2SkFraHdv?=
 =?utf-8?B?cldMUDExeGl0elZzV3BmRUJVamtzZ3lzU1BWN1h2YW81QjRrS051YSsrZ3Nz?=
 =?utf-8?B?T1ZRanR4NVhva1hLdnF4Sks2QTZFSjFic21sd3hEd3lQREs4U2I1eXp0dWQ1?=
 =?utf-8?B?dlNvR0tta3JDdWlzRFFmdzFsMW5lWXQveFY1azhMVXFYRThjL2ZRQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 78087d2f-efb2-49ec-a44c-08de5e84653c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:46:26.1118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SY/8Ld/ZzkCF/lTe7vOWUR+9UKph9Z+bqFyD1d5mX8lEYXd3yLUgqCR6NocqZ9fmz1lO2GVuLRCQOxKkdpV5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB7978

On Wed Jan 28, 2026 at 1:27 PM GMT, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 9:35 PM JST, Zhi Wang wrote:
>> On Wed, 28 Jan 2026 11:37:32 +0900
>> Alexandre Courbot <acourbot@nvidia.com> wrote:
>>
>>> Convert the direct IO accesses to properly defined registers.
>>>=20
>>
>> Tested-by: Zhi Wang <zhiw@nvidia.com>
>>
>> I can see the correct value of the registers read by the sample driver
>> from the demesg.=20
>
> Thanks!
>
>>
>> Additionally, Clippy was complaining about unnecssary unsafe blocks and
>> can be fixed by: (I haven't fully gone through the code, just applied th=
is
>> for getting rid of the warnnings.)
>
> This is because `Bounded::__new` has become unsafe in `rust-next` ; this
> is not reflected in `driver-core-next` yet, but won't appear in -rc1.

Any reason that you send the patch based on driver-core-next, instead of
linux-next? You won't have the issue if this is based on linux-next.

Best,
Gary
