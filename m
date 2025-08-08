Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F2DDAD
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 03:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754624583; cv=fail; b=BgAEo1UVbRb8um3dRu+duyAu+AaW2clhUt8pWDnOHx67BFsuKEoaAJ36RFQ0frVealqBaQ76YpLmgnBSKLi2jP0xNOrV1mvjCDCY1MXzWwsRyfWUH2acA6cLjvz20yaMbyPVEqIsfHDx7jJkZ52AUTPDQeYfHYgkI+PGM78cuJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754624583; c=relaxed/simple;
	bh=Wyp65xbqR2RfGd3pcH2jjqmPY9KT4mrtYEwVJl56XLo=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=l0BlHYk/9IyN/hNZXRzfZ9fQnZdzQkr9qZnm6BbHgl9TxvXhJkWdRLBtO1g8kFWoGV9qRi6NpwF+1+/KmmXuHIJ5JmIyNmwrXHr2I2zwsxORFDfxMklsazN5DQ2PceLby239xpX7icWKQlul0zTOWojOvXu51LRD6+jcfw2Lgys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WZA0ahMl; arc=fail smtp.client-ip=40.107.92.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WZA0ahMl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9owhzkNfHo6UaEYe0R5ni21cME88XwwXhQLUDDiXJVs6gqrSgWhwSb4xFi0Hk5o5/0oKLbOWkmNrSweKM2oL6BWzgxSoJBYmgvh7CP9GawO4AyYHkVvIJA/8EwavXxqi8+tmaaAp2X58sXsXs9EMCT2p0afPZ8hIi+P63OsuWx0tl/0VjHU0/FqZZVTNaGqqmMv0SMs5ZNzqisGGsIbqGiMWkRGsBIiEtq2akWZ9LkO7TW1h/xm8li4sxyZW8UxPZlgzF2MjEnfsOKOggdptp7bI1zsiu/BiSGiO/z8ExgXyS6hqTkEYkfLauxTliqvXhmGrUY19ODNGqOatnPH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex+Wgdb9xpiNk8CnR7U3r0v9sh13sQvXy5jRSMqVSaA=;
 b=qEd4zAbNhBpPitAUnziDTxDJ5sx8kyplFJATtuXbs3wUBkg2XrABpM3AXVYhfJwBykGFf9z2B79wf7aY0fLIG1bIMGiVsA+cojFTKKiYhNzZdSDJkRv+mo5SxU5u1WWyf+pOY1kg8E1vqf+wuPyBbN0UBxb0p/UKwUYNVnMwWC+ea/woVcD4EhbOJQs4dlQX2TQY83M/RMOOv6JZ1suT35TnJAVXvhLaLqb8uDshG4tuya1XQS/1mj4pn7qQFM9KmQCZXc5PViBUIx/BeGeUdM6avRxAs9J5CrKHtmaLPZXLF9nfU+7pWQGCJ7xtIZgYz8Iaec3hq4D2RwBzylnq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex+Wgdb9xpiNk8CnR7U3r0v9sh13sQvXy5jRSMqVSaA=;
 b=WZA0ahMlYPNK7URGAvlf0EU2+9XIFJWl7kr5G0J5iF5OetLVjr8SxjO4d+f249eWDX8cUxWYRqtJky5wEa6TxobpKLIEDA4BabHTHDmD7wqI2ybzwDoRWGrces4nis9tIrS8q7PNDMVtjv4JEFnlKiKFxRIxyIZCpTue6BefzZAcDD7tRne0g7GPSmvVSH16secmu6tAoD3wJVzOGcmWk5mXMSWJEoyFbxZfYAQJhPSzRGsH0XKZzZpI8LJYQnZ7xkHV1LtmIqwPwLu28vKa8SSPs741SIRNTi/zaanzHYxeCh13JXx592BJHbarYMyF+33O7EwhiO+m9TJL60jgwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9279.namprd12.prod.outlook.com (2603:10b6:930:d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Fri, 8 Aug
 2025 03:42:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 03:42:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 12:42:55 +0900
Message-Id: <DBWQI1Z9LNNB.SB1ZE6ZXF6MV@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] rust: alloc: layout: implement
 ArrayLayout::size()
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-5-dakr@kernel.org>
In-Reply-To: <20250806205044.85085-5-dakr@kernel.org>
X-ClientProxiedBy: TYAPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f68c3f2-9f7a-40aa-e4d6-08ddd62daac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUtJU1BTSHhpNmo2QWdHVEV0bzdINDVkOHNkVTgrazlNYkMrRGZCN2FZZUtB?=
 =?utf-8?B?elg1SHc2c1U3NEh0Um5aMm9VRS92WHBPbDNZeGhwOFdGWTVLcmxJNitLOFIv?=
 =?utf-8?B?OXpOdXpDaUVqRUtheGd6Zm5RbTRhRC91cTd4THJKazR0SHprUlFVTkRKZzZQ?=
 =?utf-8?B?K0VLYWVnK1Rnbk0rcXRlVkkzM2ZCNTNzTmt0V3pqa3I3bGdyZk41SCtIWCt6?=
 =?utf-8?B?bWh6djNvUGxXK0ZmTUFSTzZWRGgxRjQydWt5MUNkU3A2cHB0WlF5NnovTVBJ?=
 =?utf-8?B?N2JycWVGeVhmNitWaFp0d040ZVJ6Z3pEK2lVRUMrR0dPVW5YQjJ2bjkrYzlo?=
 =?utf-8?B?QUJqNEF0bmd6VWhjNkRGL0VzSXcwalpsU05RS3VycVd4dlhNT2FVUXV2cTVv?=
 =?utf-8?B?QzBSeXJlZDV1WkpSemcvSWhoZmxWSFp2TnpQREdTMnBtY1dwRmRKRjN2TFJT?=
 =?utf-8?B?eTlFbWREeHZLSDRaTVJEZ2VNQU9CWGJYZnJPaFoxcDAvR1V5TStiV2VadTVO?=
 =?utf-8?B?aXdsWGhtUWNVS0EyNUN6Zys1UWRvNzdPaUxWcWdTbTEwd3pUYjFHRGovcHkx?=
 =?utf-8?B?eGx0Q2Z4UTNuOUROZUo2QkFIV25Ic2hHK2pqdlNMd3piMDRwaGtWKzMxcG0x?=
 =?utf-8?B?V2t1U3NreTAwN2ZlcXpqWHFUSTNIeFZZSWkwOG5BVmRBZkdSSm1pS0VTT09P?=
 =?utf-8?B?QjBNYkdQNEJ2QzF0MzFaWXVLYXp5ZFZsN21BZE82TEJscThSekpOeEcyOWJn?=
 =?utf-8?B?MHE4MWFxSnZWTHo1ZnlkYUtLcEVCVXNBY2grUDkzZnZtNlNvaUMzT3A2akRC?=
 =?utf-8?B?U2YvWGpDdmlMa3hKNGVRZDYzTm1uWnVMektQV1IxQ3QrUHNMckMwc1BiWjRh?=
 =?utf-8?B?VW5aNWVMNktJaWhZUmcvNHBVcE5wYWlua0pZakh5dlQ2Nk1UbGw4OU9lVWRB?=
 =?utf-8?B?SWNQVUhDbWp4NHowSk1ObksrNnF1Q205Y0g0NEcxZ1JjSGFpUktJTnNZMHcv?=
 =?utf-8?B?QUROL2Y2Q1JYQ0duTEVxeE5zT1p4RXBDRThSUkR2UGpmWHlUZlJJTG50aUlI?=
 =?utf-8?B?V0xHMllYOTZFSFgzK041L0dKT3VLYVJEcklZcmYyVHVkamEvdWlubkYzWm9n?=
 =?utf-8?B?SmhjYkRTdVhQRHVSWVo5Rzg1UVJWeTlMQTdIOXhNL0FuejI0ZXFKc1RYWFBM?=
 =?utf-8?B?c2Z0d2x2Z1BlemxrMXhpdzQ3SnNqT0pSM0JOQWg5eHF0aWRDbHhnY2RnYjNq?=
 =?utf-8?B?TmtiZWR5RDQzMW9qQmVuRE1JOVVxMytMQ3grYmJFOCtkelhoV0ZqRnZGTGF2?=
 =?utf-8?B?ZFFpRWZhL1M5R09tUlNrblVPYmovZXFUbEFrQzZTVHJrVnJlT1BPYUhPYU0r?=
 =?utf-8?B?OFdNYmJTbEUzSGo1RkEvcy94VDNESW1VSEhKaGNDOWloREV3bVhRTnNSUXJl?=
 =?utf-8?B?bVpJK3VWYzdvR3RJOUJIT3l6ODBnU05MR1dkY0pQMzhrbmFGcmhwV0pqOG52?=
 =?utf-8?B?TzVkMTNxdlpyc242UUY3NzZQcVh5ZDhybXhyRENBeWdDV0ZWdFY5NjdTQjI3?=
 =?utf-8?B?LzJ2QWRzUzBUVGZEcjEwNVhmSEtKbjZUb1FucS90TktOeU9YSnJ3ZFVTeWVn?=
 =?utf-8?B?cGpKNkV5emhYbWdRTk15Y3B4OUxGQWpKUll2aEx4WGpqcVRKcTlVdUExY3Uv?=
 =?utf-8?B?NXNGeUhndHFjVWdiMkdKV3FVU1RBZ0JtOEVRWUZ6R1lQSUlYTlVvcmgvaGNq?=
 =?utf-8?B?R1BNNVJFUkxSZ0wvNnpBTzVsSzFsNE5NYnRiMVVjOVA0dmQ1VHhoTy9JZHkv?=
 =?utf-8?B?MVg3ZjZpa21yVmFHNUowMHZaTFJUbkJwTkxGZkxCR2l2ZzhCK2NjdEJXMFRC?=
 =?utf-8?B?UnFaUTlhSVU0Z0VVSHF2eHZ4d21UbGFMWXZrZDdGaU4vNm5VejM2R1BuQTFL?=
 =?utf-8?B?WFkyWWd6Ny9xbmhKRFowVGsyYkNxR3dJRXNjSjk4SHdtUUJ4ZGxsNmRxYWhJ?=
 =?utf-8?B?UlpYTm96NVZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDl3a3RKZjk0aW1ZNkRUa2RuKzhidmpsRGM3NTRxa1ArdHBzeGZaY0dEMU9m?=
 =?utf-8?B?TzM4WFRkbi9pY2RCSTNZbVhFN0hnYmJqT1BENmdHTkxSb0Y2QVVSWWgyTnl0?=
 =?utf-8?B?VzVRblFrZ3I2ZVVFM3FMd0U5T3dTMjk4TTc4Rmo0cDZXVm5RV1dpa3lWREE5?=
 =?utf-8?B?cnEwNE8rY0VkeFVDaXdlUWcwUWY1S2RDM2IxT0FxMkQ2dEw2bUplaSswblZY?=
 =?utf-8?B?dWRGb1puaTdmbW1yeFBjMzBTQ1ViL3NKYXIwdTI4TU9OY05Eem9iZzh0Z3dy?=
 =?utf-8?B?eUIrMldveTVNd0dYMWhUc2ZuK3pmRzhoNy9VNEtyd2FFZ3Jaam1WOUxHeTVN?=
 =?utf-8?B?cFVNSUN4SnVURFA2R0NyalVBc2t5eXlqR3VwWW9lcFQ2OFZ3U0dSM3FUVUhi?=
 =?utf-8?B?bEJON0xnYWJHTkd2U2RmS2JIeEFBaThUSW1EdzZvVjBUUFIyUjFRcnU4U2t5?=
 =?utf-8?B?WXh1bFBuazIvTU1kY2pHcGV3MHhyeU9oRDluNmEvVU9qYy9UN0RIMDNEU01h?=
 =?utf-8?B?dHhxYUhXRGp6RTlWa1J3cVVxcjBwS3g0RUNFZ1RYbkRqdTNCek52VHBCTStl?=
 =?utf-8?B?RUk0eFgzMyt6VVNjS1M4eTRETkk5czc5NmQ0NkoxTGdQSENzb2l5b2R0TGdm?=
 =?utf-8?B?L3loS0llZ2s5OVVLczJ2Slk0UzNOcXdiR2RYZ0RCVU42emw4dFZyRkg1R1VB?=
 =?utf-8?B?OGdVWXpTVUJIUWdBWmZRMEowMUUrUjlsWm1XbjF4aEhsaW16OUNiRTc5Mmlz?=
 =?utf-8?B?VXRTb3l4eEFEQVRnV3lSb25lc04wbGZGTTRla1pUUDIwQ2ErNk9WT2hrVExr?=
 =?utf-8?B?QnZBSmtlUW9obm9MbVJzeWhvL3hicXRyYVZoMkxYY3VmdjJRYnlLK2NGMXRr?=
 =?utf-8?B?Qkx3a0tCZFZhTlVrVE1hOUcvb0JXdW03dGp2RjM5LzVtb3FpSWxTb1dMbVJL?=
 =?utf-8?B?aFZ4UGVTOUhpYWR3ZEJaT1pGZ0pwV2NPWC9IN29jREdCSlZYaDlHSjdIQnBM?=
 =?utf-8?B?VkxkOWtHT0p5TlpSQ1MvdVZNaEVtTEF1cjcyWE1vUTIrdGpiV3FXZXZuNzVs?=
 =?utf-8?B?alRXWGNsUCtCMmpNRmZBWXUxNG44WGpYSlA3NFZzM1NBdVNWK05rU2VFZmwy?=
 =?utf-8?B?aHhKc1hzNW4rOUtwUTd2VEJhQWZYNFRhQnZ6SDZSQUx1VnNDR25GVTArOXdE?=
 =?utf-8?B?YktoVUs1NnlJNzdCaUJ6ZDZaYTJTSUlCRnVjNnZ3Sjd4NTczVEVUbGVtRTd2?=
 =?utf-8?B?K0VkQ2Nlek0rRW15dFB5eCswN2NCclR3bE1jUjd3dUdZa2tQaEJtVUZ0eVBE?=
 =?utf-8?B?RTM2THlXVHdtTzRYcEZKR3BwbnFvazlzWE5vUzFxd0h1cXZzZGZqVWxLZzQy?=
 =?utf-8?B?aGpTVG9uTkpVbzQ4WENUYllvYUZCNk5Ga2hEZm0yQXZBR1F6L1VMa2pibWlO?=
 =?utf-8?B?Ti9FYU8yOHJ6ZHJSS2VIcndmWERzMUVDT2o1ZnJrdTFPUlI0bVlQM1JRSm1U?=
 =?utf-8?B?ZituUnFON0FHZUdnTkV5RSsyWmhScTVaaFV5eUhqMHAxVnBTZENKYTNNMjB1?=
 =?utf-8?B?R3VNdDJGUStwV1hrYVRPbTFSSktPY0kxOEkyQ0preXJuMCtTR2pGYklNR0cx?=
 =?utf-8?B?NlFWRkQ5b3F5K3B1c3hkVHV3cHRkSlg1a2tjN1dkVURiNytWWWkxWmhJR0hH?=
 =?utf-8?B?MWx4UThLbTBQREdvV1NUbTkwQjZtczhPSVVpcXdWRDhDQmt2ZGFTS29EWFdH?=
 =?utf-8?B?V0dUY00vNXBkTUlWWFlYcUhpNFNUVGZvSnkyWi95ZmFEcytQTVozSFdtWXdZ?=
 =?utf-8?B?NEk3ekpsb0JqMWY5Z0ZDSnBDTUxkVkVpMHcwaE5qWjliTzB3RE13ZHEvSzAw?=
 =?utf-8?B?cm1WbW16MWRuQ3dJVGNYclk3U0Z5ODNMV0NFc3FNNmtHbmxBWEVzYVZNd25q?=
 =?utf-8?B?RWRaTVFSL0VaTDcwb0VzRVlESXpYZ0xHOFROb3o1NThFNFF0S05lbm1ZNVBY?=
 =?utf-8?B?MGx1MUVIbm52bzcxZlM2bmorQ0Z5MEFLRnZ6elk1cE1PQmUvZUtUZGhESDJF?=
 =?utf-8?B?bjRTb2Z4WnB1OUpGc3Q1S05Lek1xZEMwQno5NG9tNXJTeVorMXdESXUwSEgw?=
 =?utf-8?B?eitrY3IwSExBQ1oxb0RWM0NXMUxBZjBreGR0OU9ablZsQnFLVGdFL3U2Mkhz?=
 =?utf-8?Q?95T54u6lyobg6TEcbXCBUf6h9n5ZlEvgOJEwvkNLj48A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f68c3f2-9f7a-40aa-e4d6-08ddd62daac4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 03:42:58.6407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB5FdxPL20CygfiH+2Ow9HkAOAqD+bcC4TgHq1rampS2BNKNJS4FAqoW7UBussGXJ+y5aTkL/DI6KOXTlHnMIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9279

On Thu Aug 7, 2025 at 5:50 AM JST, Danilo Krummrich wrote:
> Provide a convenience method for ArrayLayout to calculate the size of
> the ArrayLayout in bytes.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

One question below for my own education.

> ---
>  rust/kernel/alloc/layout.rs | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
> index 93ed514f7cc7..666accb7859c 100644
> --- a/rust/kernel/alloc/layout.rs
> +++ b/rust/kernel/alloc/layout.rs
> @@ -98,6 +98,11 @@ pub const fn len(&self) -> usize {
>      pub const fn is_empty(&self) -> bool {
>          self.len =3D=3D 0
>      }
> +
> +    /// Returns the size of the [`ArrayLayout`] in bytes.
> +    pub const fn size(&self) -> usize {
> +        self.len() * core::mem::size_of::<T>()
> +    }

The type invariant stipulates that `len * size_of::<T>() <=3D isize::MAX`,
should we mention it here to highlight that this method cannot panic,
and/or use `wrapping_mul` to potentially simplify the generated code?

