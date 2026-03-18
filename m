Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC72352F9B;
	Wed, 18 Mar 2026 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773856817; cv=fail; b=IHQ7axpFRs49HB3kKdEIoI+QCGZ+caDUgWW/S7VAfInIocKIubYN4CNGkguGKbG6DBbwAR9PPnOFcURNImLG6eX+24hUVhFuDrKkMZV8sbSpZeoPpm5VUdPZiJeeYXdbF6e8LD5VsQ2LErO6+JnY5OCQw8T04tk/Jz5itihBfUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773856817; c=relaxed/simple;
	bh=g9CFBNrD6j5F8IjtPzB0PCgPlMy0RLtHbuBgzk7F2fU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fosaSS7CN4aglbA1hWg66j3/v6qQ/+MiZs4cQCtiS9sLHkfpnP4Fnr7Fu/p5E2e6ZM22vOmzLASD2CE3MLwnMQ1A8XQckFzya5p4yRnTCcKdYVKlJ6ZpleTiUlLzWrnCGxHJDop7TV9giM9tMO+2JhFkF1yXfMb4uc61s934EmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WdHxKezt; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WdHxKezt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIwD2Jvuoco6BXkbLTQCfVcpqEIBoEFrOiHW1c8Vcqfibh02XQx7nKF1W57ScoyCFQJIXdk2ppcc0Pi1/fJABOf7kW99wjiOcFUnOZQX2fzTZP5Mqo2okCL3xEi7Sj5fcrZzjFJOh7UMJHu3HaMseU85zgf1JLgMBNZWE2MK985wX9N1GXan+0Aq1gyqZ+VGRnrlEEd/C5v8vq2BhElOZ+D93CEtqpZZ5HcXDF2W1lJJ8hKEQX2SAJW2oQtl9v7Yv2efvxWppMeAmSUvXxtbwV+i8p6ML72Lfjfd1F5SdMjNOHPfrzUeZZcVGTIWNMA4fXEUBZFGb3zPp8CIi6ifKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIJu5NzBkSVDcA46p5dJmWOhnS6BH359qcrMcHKSm2U=;
 b=JaEpdsg6u2l1tP2/EAm2hZaDnHAvBR88Q0bgKXoX2Hc7XD6yeaInOoQK7kBsWyh/hJAIt7VPpgG6OFxn4CYZXv2Swrw7cxouB1zyaMxWsVWZqdJ0/8hSGw465I/g7BXigSoRMQSK0tnzHljF7LxtoQcAyihHB3Cr+vFI3QZnbEuSaWrIRjGwS4D63rLBaKhEwEsPCqzTlxbzAeQy0pIuQCb+SeQ6lF4QHGGCSvywfMkY9UfBRhIlh2CWAaaClRwFGJ86ZU7mmTPVx4dBfxlngFVr//sQY/enyjdg6szoh+b1X96Z0Ahl/pFHdoumvaiO/9BriP1blpgYM+4kvPVk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIJu5NzBkSVDcA46p5dJmWOhnS6BH359qcrMcHKSm2U=;
 b=WdHxKeztTVNgTb3z37u9Umh/+8daKiG9ZMu4MC02bm1PlPjYx8CTfWPwoUNSZ40nn0Op302OdIWEzfs4Hg8k30eCOqkhsVWzhNWmAfHYanWW5w2ZAX9rj2v1LUvNyjsB6mlX3cD3SjA83ZS9w0T9W5BL46Blema0ZVjQ4O4u0prG1lPk8zPzyTWI3OHaQAeEdZrJeubrF2TIiZdeBQ3pe5PbcL+vWs4YcUvE2FAKpO5M3HU6pO6Res0RMVpJM431c6XOVkBlIj1WBBOm8FYzBuck3/m9EJ2zKxG4w3ZHOx/EhpJCLGtZbijgIJaUEH9nLzOFEQf2iYhF0aljNJdizg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB7775.namprd12.prod.outlook.com (2603:10b6:208:431::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 18:00:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 18:00:00 +0000
Message-ID: <ae8eac04-000b-4760-937a-5e3121a4cfcb@nvidia.com>
Date: Wed, 18 Mar 2026 10:59:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 31/31] gpu: nova-core: Hopper/Blackwell: integrate FSP
 boot path into boot()
To: kernel test robot <lkp@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260317225355.549853-32-jhubbard@nvidia.com>
 <202603181705.C57qvOSk-lkp@intel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <202603181705.C57qvOSk-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0147.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: d789a99d-292b-4bf0-e533-08de85182c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lF87r6pG+zvfHB8eTtuxB5xl2r67ATXgNoJvtDquext/cPwnhwvIfyTwLyJn1sXkJgaRIqQT4bY5dK/A7Dp7zxjCTrNGHLrJWbk0NUxDXeldGHINpzq6zzBxW0Kl8LCtCaNJ0Vk8i2RqPwVAqrZ19d4GbqpFA8WVAMwfJdf4HENmWywfYJ/gE5tyGCjBTPuhs3iVePkdNs5Bv2bzxd0Qjjxv5RTXD0qgtBkvO2gMhqQ+tXVINoI6YCwZuc9Prz/SN4s4Fj25PDOLa3BI2MuKwGaX31oPg1WUg/qV3Jp8dmMdD6W1IyTotslK8nDqF3I+RqWbGHN0Oyr+aQBOkEwTeUrUbFGPZKO96UVsiZfNYdB5kpn4CJ7OGowNgk13VpdbXgqtNbOn6ZpymYYuTz2DKDvIs3P42zi9y7H31BDoFCuTWZHqvvArhLdEpBb0a4RyyLBBgFl02tWqcIvGPQ7e/He0vojcy8wYXLTr2vvBl7U/vn9jZKmvSmRly5HH+hTeJm/2pGyD87Ls4U4/iJMWlnQHsEvXQ9wz+d6dAwUHMetSPUWyAwf7H+iidkeX4ABPmtgQB/2yknjrNr1d5aaFi4Ls6E3hDx3dhQMrELOhVplyEMsxHb+qo0f948W0goJw1W6DSoDe/2HtX7+fHtlD0X5nlDobUAYUaLk/3TOPeaAtsyChPIqhf8koZgbdledNU1kCx1VvsdVIZQvo8ZlVDl/HgYniEErunsZ42kEfDWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUxQcUZlRjBPTjE0R3hvVXhIQi9ldEVsNER3RmJvMUV3WlNmZlUyMzNnbTlM?=
 =?utf-8?B?cnQ1NGtPeHkrUnBYSzZaU3JXakFxcTlaOXBRTFZiOUxldTRmWTZXSWlSY2VE?=
 =?utf-8?B?NUZtU3BLZ2tJcUI4ZWh0WGMwNXIreVRnVVFBNmczeG9IYzRTQXFJd0FTZEQr?=
 =?utf-8?B?em1KVE5aendZRHhHWmFNcUtNR1pwS0lncWxyUnRNNFZGYXczdmJIblQxYmsw?=
 =?utf-8?B?bmdQOEFiTnEwZUhmR1RqVTZzNDBqSnNtdm1LZ1MvTmVTQ1M2T2hwaXo4bnFq?=
 =?utf-8?B?T2hlRlpTTjNIMlRHdGFYOWFuSUFQbmUySExORk5rSEVOSC9oTERpeExXWS9Y?=
 =?utf-8?B?eHlvR0E5Wi9yQkkzRHo2QUpYajRPdTRvVWlRREVxaXpqNXN4Y2QvVDU5Mk90?=
 =?utf-8?B?eGFFQi9iMm5zcWhrNWY4RUg3cXpSckhyWVVEMHpjSHBqN1BBeEtZcWp0SFpD?=
 =?utf-8?B?dk9RNytJemhoM2VkbUlGWDgvby9DSU9wY0hFbUNrRUtkWXNBU0N2K1VyZUt0?=
 =?utf-8?B?VUNnazI4N2xPR0EzaWNRL1puYkdNUzlObDl0aEJEK1NWWHF3QVY1ZzhqdUVi?=
 =?utf-8?B?WUlvZzJtNzlnbDgzL0M2bmh3bGJGYTY4UHhaUDE5ZXZYeWszdFgvUEo1a29u?=
 =?utf-8?B?dWxJbXpQWCtTc2Q1L3Z6RHIrRnBSUWtVVjRRTGd3djFNcm1TUjJSUE9BSDNr?=
 =?utf-8?B?UUN6elQ0RFFwb0RxR0lwNHhGZjlPQlgySTFKbTRGbkExRFZWWnNUTStGNzdu?=
 =?utf-8?B?L2FmTnZNR3dTT2xJR3pCaVNJdlF4TzRQMXNMQ0lVU25hS21PbWxEUVNPZWZj?=
 =?utf-8?B?VmJVOG5ibkx0M0ZHbXlpbTAyVzJsMzNjM1JlNHFTVnQyRGhCMzVvWFc4bVcr?=
 =?utf-8?B?aENLU1liU2o0a1AyazJieW5QQ3FkMVZCOUNRQVg0NUZyWlRaWDZaekdQb2sv?=
 =?utf-8?B?OGdaVHg4R282bDc0RGUzL3hwQlhzc0xlWFM5NkMrRTZLOW9PSWlUWUp4clJF?=
 =?utf-8?B?NUY1UFdVK2JlMlYrQ0hyQTZxSUx4L3d5dDBLb3NaKzZjZjY4aWZvUEhwTFlz?=
 =?utf-8?B?VXU2ZzRtVUlsQ2lrTHJ6RWtFdXIrbmVqT3QwMFAxVE02NVRPQWNlUVZiaDBV?=
 =?utf-8?B?Mmsxcjc3ZXo4RExEanJWOEVXdDhVK2NGTlNLK2tlRm1ETHZEQkZrL3BINnFY?=
 =?utf-8?B?N2lOejZuV2dTcDZBdWhhbVRVRnN0YTUvRlNOUU9tVys5a3Qzc0FSc1NuQlJT?=
 =?utf-8?B?MkpRMklpVzR5cEgvRlBhckJsbVJFeXZDQmRZTmkvcW9IOWJsajlxa1FmY3U2?=
 =?utf-8?B?c0xwN1VCU0Jzcm5OZHVLUjF5QVZvNHVyOWdkS2VZSmJIZUJrU0NmSXhpdWR1?=
 =?utf-8?B?VnVKR2NZVGJ3VGRYZE5mc1RKdFFvd3BGZXNRSkM0ZXlodUNwblphcDg2RVFn?=
 =?utf-8?B?dTdlbWFla1g1V2dYdnhuRTU4bzJrc0dKYmtnczJiREpqcFU0YkRTS3ZBYVo3?=
 =?utf-8?B?ZHA4NFZhdnRhVmRRbVNZdFlZaU5BUi8xdDdyUU1uekU5V2xWL2tpTXR1bUls?=
 =?utf-8?B?SDlFZE15VVJ4NnNncmhpNFEyWWtRM2xYMWJ2YVRIT1lhSWhKQlFJVFRxQ0U3?=
 =?utf-8?B?UFM4bEhqbHFGcmFyUnQ1ODRSRUZYaVNLQmkxYmZSQW9KVVdiNElCb2o0M2pD?=
 =?utf-8?B?ZUYvQjR1MTNIK1Bud2NsK0JTeEx3Rk1TZGYzOFZSdG9RQlp1ZGNJeWxIMjMw?=
 =?utf-8?B?VDVLMHBVcmhkTGNVamN6TEh4OTdITHNtZG1IRWhmdS9ZT1ZHN2tsNGhadHU2?=
 =?utf-8?B?SjZFZC9kNFFubzFXTXhiNG9iOEJXS3JUQkJ6b2tQLy80aEx3dWN0c0xFVG1M?=
 =?utf-8?B?MWlYSmhrMWIyeFVyZjR5a2lMVk9waVd0Q3BZU0pzME43U09LVGxKc1lIWjRB?=
 =?utf-8?B?b09YbVBpVDRYT1YzbUJVQjhEUWo0MGZjUE9mUnczMUVoMGVHVzRHbmZQcGlm?=
 =?utf-8?B?TW1aWXA4L0NyODRGL0N5YnVzYXYyZ0NHS0ZXbUxrYVNVYlg1c3ZWWDJVOVpN?=
 =?utf-8?B?U05XZGYrem1XeGNEaE1yL1U2UzlCWEFxV09yQUJUQkh1aDhsMVFKbDFiZzNL?=
 =?utf-8?B?S3I1VitxVkh2SmpwL1J4bUpzU0Y3NzNKV05kd1drd0lwbjYwSnk1ZlN4TW5T?=
 =?utf-8?B?NVBvTndHTGI0M3FhM1pIeHdJRSsxcFhUT0h1Z2pLQVkwNGQzL3c4YlMva05P?=
 =?utf-8?B?Q0xHQjBtNGJtVk95bHlYM2Fya3E0M3ozRTNmTS9PVUljYUlCQnY2VG01WUhn?=
 =?utf-8?B?cU5QaDRoWUc3ME4za0pGUm9NOCtTU1MxcXBXb2FLKzdzSExRRkJpZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d789a99d-292b-4bf0-e533-08de85182c52
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 18:00:00.4196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PToP4vrpwaYJnu2hLhJNWiZZgjki5fpRqpu/l45zb7mQxgbb6ml6LElcvPWGp9C/6q5oTpU5uULhyy29Z/HEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7775

On 3/18/26 10:02 AM, kernel test robot wrote:
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603181705.C57qvOSk-lkp@intel.com/
> 

Fixed in v8, along with the gsp/fw.rs issue reported against patch
27/31.

thanks,
-- 
John Hubbard

