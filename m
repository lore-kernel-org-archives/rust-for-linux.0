Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010010.outbound.protection.outlook.com [52.101.61.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14415288C22;
	Sun, 28 Dec 2025 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766908214; cv=fail; b=l4ez8F+KQ/yp/wsU+ScXwUY10nAgQlCBFBSWQ+pb2YQhAe2mgYDo1upLs3D9csreXYwFdsegPjnMqMiJi4goaQiLchIYrszWk7CUrgm9YriTP4nuNYbWV01DzsFzVtKOq/K8gnUgVRSe4dvMT9JO9ALe2gTH746Of7h+6Pm8eBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766908214; c=relaxed/simple;
	bh=tIdjSPoJRMEc/M4qLrbKg1Yqih4hO1WZfvnh4aNcZqs=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=m0U0z00Cm8a64iacNud1q/myHmq74ffeNL4zO/uzeZQARwJhhFUoeZ75qjeEfApOwlb34TOwh4gDDZu/CwGF/DRFTGwoqmjwvs8YTlq5DTbsYW9StfTBHFkUurv9n3ULWsK3D5Ghb69ywckOnvR9Y3s1L360r2TGOeleYaXwAl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RQYf2LQd; arc=fail smtp.client-ip=52.101.61.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RQYf2LQd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReClr2Ql3+jyIKw4BMKwemRulq2h0JgQh17jmDJx0kwdl5+aCWxLfMH1Qm17IG0I3iUD+amXcKL80AvrQWnWkeq2pGXZNg9wVhMBHI6Ri1PirVN6jfEvbMKr58VfvHPFNurgW/Iq33nbmtBIUGr6QHL91lTwLvmHb2TYtRDW9Dl4ivbHBzrY9GVwKoRFE9V7QL142joPO/IjvcuX4gbck3Jol6E5mTODsTvqCzjAYc3GbWzA+/zxpHtCqcMhhUk7HO08frI0acD92AlHByfjWxcex7pK7ZA7G7+utK1A1L0Sx8yP7uqAM1TrzQPTFEtZ0nT0fk03yJe4E/4o0zq5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxH4e5UMmL6C0KDa//AV/pbrTdRo/VZPhz7iNVJ+2+s=;
 b=CIIeRBA5ZoEweGpYCULMNQCcdiyXMC/g1z9V2UpiUW3Q0K/GZi/MHJdBIDbqDCuBgvFY3WEmr21Vicx4zTVPWQs3Xf2FqrpOtiZQjnP34SOYdUkPUjk4bddojjSkvmDIOo21C0R3ADAui5CQRXgaYf46V2vixpPHQvCklrATSy4l4ZLRplw8mniq0wBKv0sazg6jQ1y/URDr6jr8Sf40EcH78c55+RtX53RvMwApSFiT+UvWP0a2L6ErtOscFQ9itCllhqMClqHbvhWdzE4Y0RsJ5KlC2kgVM3i9/4O9KyomXGjrKMJO5UgI9JHQLCywX3a8c66kjEu2cxBQl5RVEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxH4e5UMmL6C0KDa//AV/pbrTdRo/VZPhz7iNVJ+2+s=;
 b=RQYf2LQdWJ52JxFtoz8m4IaxTaScF8jMkfQnv5GMUu5rNXGPNPXDk49kEMTqE0QKH/v9/uNEddHvr+A5ewbuZFSpJ12Y9/BuUFEgp8+nMtfuVTZJGeS7NE/AhpQeqtnXyxXOYEdP0z57XQ4d6Q4ng1eiZCU1H/u21x9Rd3ZspGzlXxbFk/WJersZzVh0ZX+2snLtRiQcMJL5Y8vwUuz0T8TuIQwk42lNSS0KGCbQm0UWQJGI35JTIX+e44XdsKT8alvCm6AbIAHQaJyuecVbcmF1MH9plwNlWV1G2pT5Tl+PAtnY07TvkbX4EQhpF5Mbob4QrgcaJyYQt42LGA1ySA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Sun, 28 Dec
 2025 07:50:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9456.008; Sun, 28 Dec 2025
 07:50:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Dec 2025 16:50:07 +0900
Message-Id: <DF9OOOWQXWK3.2KELKD6VLJP1R@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: Add support for feeding entropy to randomness
 pool
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
In-Reply-To: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
X-ClientProxiedBy: PR3P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: a0df328d-b0a8-42ce-e1e0-08de45e5b808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmNRN256ZkU2SHJPNUFadG9halorU1J6bHpQM2FnMTFMNk5YSmdWY1Y4QzJ6?=
 =?utf-8?B?bVZNU3Fkc2tkQXVLVWxFSkQrTWtCUzE0Q1hiTFBBVVJLdXlLQnV2MWtSUWN4?=
 =?utf-8?B?WVhyanlkZWJ2Q2RaeUxHeHJVNEhVdlpYVTlqcTNqN1AvTjd4R0tJZkZzVWo1?=
 =?utf-8?B?ejZta1FwR3BvenlVUWJDSGFjKzlRa2ZFZHkwelZQK2JzZlJHTnBjNWphb0Z5?=
 =?utf-8?B?SXl5KzhuNjB2dWpwY2ljVVlYUmptK2F0MnUxaHhxcy9pN09kOUl6bHFwUkNL?=
 =?utf-8?B?Y3VmMkJKaWUycVZOU05aKzNxOGMraW52VlI2ZWEwSHpmVTBXSjJ0Yi9vVGdv?=
 =?utf-8?B?cmc2ZDdSczh5eGhoMjJMQjlQeUF4Smpla0RtNW1ya1RKQXBIMVgyaGMyT2Ix?=
 =?utf-8?B?V1dmalg1T0pIU0J3bTJDcDBFbGJBRFVBMkgxQUVrYlZaN3NHRmRrd3hjcWI0?=
 =?utf-8?B?YzV1THRjU3hsNWZxWWdMUm1SV253Rk16eTNlZzF4TitVOWdsbmRpNXNHQk9o?=
 =?utf-8?B?RFNZL3ZLOXBnaDJlZlFDUTZHdDkwNFZjSHRnL3FhNTIrRXBrWTcrVnkySlg2?=
 =?utf-8?B?SDBTYWVsRjlab2dZb3M2NEFlalRZMnJyTDkwZ1NaVW1qbFN0VGdkbzFrc1dl?=
 =?utf-8?B?RnF5dERJR0hSNVlvajR5VjQzM0Z6TXFTNGtaNlNzZnV0NThxNXFtd1hESHBM?=
 =?utf-8?B?YlZBcy8wSkRnQ1ZzaEsyOUZXdXJkTGJ2cVV4MVEzdjV1S2NzME9jRGsyaUQ0?=
 =?utf-8?B?QnhYMFZocjhEakUxZmdSTVlINVFPeEhpQWZza1dZbml3dnBRaldnY1ZvVTRW?=
 =?utf-8?B?MXZXMzkrWjNuQjdiZUVwK0U2bm1MS3pvc2VZeVZNMXJSQVhwTTcwRDJ4YmF4?=
 =?utf-8?B?UXF0SzZDSThQRU9FMVJJc1dtVyswSzU1QXJQOXlxN3JsRGF4Yy9zbFhiVnJh?=
 =?utf-8?B?dlpFenlhamh4a2FxeXhFZS9lb0xVSjN5OHVabkZGbWFTK3M5anpYMnRScHhF?=
 =?utf-8?B?TVNnNUxyTFBKaEN1d3hxT3ZnOWhLVWRKWlNmaUhMZStQbVdHeHpOb1lvRzE3?=
 =?utf-8?B?L2hnYk1xdk1KSUtka3l0UU42MlpxaGxLbVdJdU0zOVpYQ0J0dktOUkY4eXB6?=
 =?utf-8?B?ZWJGMzEveERPb3lFS3ExekExUEFnQ0tOaGRveFV2Vk5pb2FqZGZFUUVBbGg3?=
 =?utf-8?B?YVFaSnVDL2F2aWlqN3ZTZkJNSzhBUEsyei9nNU55cUtVNkFXdE41Q09ITzNJ?=
 =?utf-8?B?a0p3d1JHaVF6dkhJemU1M1B6RDdoOUFmVU81NWxnRy9yQUdvMU9rVG9Tdkxw?=
 =?utf-8?B?dC9XeW9OdkVsOXpUbUtLd0VSTG03aTBNc0owd0F1VGlzZmFYYWJCbkJQMVRZ?=
 =?utf-8?B?dDl5VGd5QXFHcmw3ZktXU3VqK0c1Y2RMUElZVFJPMjB4dUxNVm9XZ3F1UE50?=
 =?utf-8?B?Y3VwR3NkSDJmWFB0VmpOcUhNVEZKenE2dHdJVCs2YWdkcU9FaFo1b015cUJQ?=
 =?utf-8?B?c2NCRzl3aFhoVWRCKzY3RU9idlc4a1Z1ZEdWUVcvNmk4MDNZYnZCTExWRC84?=
 =?utf-8?B?U1lzSTRjSW1YaTk5RFpwNlgrYmdBV2xiMzFCMTVwTFl3NjFDM0daYno0TDhF?=
 =?utf-8?B?eFpwOE83QTRGcFAwaEhKR2l0d3Bab2lPcjFsVmVOcVE1TnNGYjk1VzV1b0Jy?=
 =?utf-8?B?cmpoYkVJTVJkdVE0UG5lTzlqQ3R6OGEzbEZBNXpNeTRFUkdkWmdBMG16eFM4?=
 =?utf-8?B?ZHRBRTNSeDA1YnVzMGd6eFNKWVk1YmhTaWFpNmZRUlhjZnE5Y3ExaHY4cFNn?=
 =?utf-8?B?NnVGZ0pzVUdCY09Xajhzc3oydFdEK1lPU1k1UTVhUG1BR1FJVm0ydC9KYngw?=
 =?utf-8?B?cEdlUkd1VGNoSEF6Q0UweUpmYXVDZEhsTDdiNElab3V3QXU4cTRUcWkxQTFi?=
 =?utf-8?B?SjhDeXBxWGhtaVlkNTlreWQvY0MxTEhlNWVZSWxSMFZONFAvd0dKNFVuMWJq?=
 =?utf-8?B?OUdLSFFYNTFDRWxzTG9zNkwzZWhLWGsvUzEvK3NocjJldVNpZXQ5TDVPZlBR?=
 =?utf-8?Q?xmjPLb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzhwSXNVZHBJMlBudHlSRGF0b21GTDBhbHFrWC95TDdMc2FJVkx3TkhTSUg1?=
 =?utf-8?B?U05kL1ZvSzJ3Y0orYzRBOVJUc3BLYVhHaHdZT2tGTlY5VXhUSzNCcEdZZHMz?=
 =?utf-8?B?Wi9RUUVxTVpWRXpMeVFyZ3UzWTNpUlZMbHdlUXZxbjE4Y2pmWTg5c2FZK3pk?=
 =?utf-8?B?SUZFQW1nM0lVdk9OYlhWMDBoSzZpazkwSjE3bzl1WlorSEQwaWRUZHp0Y1NC?=
 =?utf-8?B?NWpmL1kxRzg3NkFiVEQrRVcyZXdVL09ONjlQMUVkTFV5Wmx0empnMkF6a3kw?=
 =?utf-8?B?UzBjNzlWQ0RBZ1dwYkJSTktWRlJBd0E2NkdEWWprWnRnOWxJK0w2bVRUOU04?=
 =?utf-8?B?bU54eVpVRnNYODlYRFRDOHhhS2dmbDc4YzkzdmdhVXg0MHp6QkJpQXRXM0U3?=
 =?utf-8?B?TVZJL1NvcXB3YW8yQ3pUcjZyNld5WlNpWDQ0K2VPYmI3aExiZEExWWpHV1kv?=
 =?utf-8?B?NnE5NGpYdjBCZmtEeHllQWlOSGY0WW5DVWJWYU9YWWtSeEdPaGhzeUJLVk41?=
 =?utf-8?B?dFBwRnRwdExyeDVCeW5QeWorT1pDTTExREZnVE9ZcEs0N0daUkY2QkM2R3pi?=
 =?utf-8?B?RzVwTW5iZDhKdDViM1pMazUvYVhRV25LUGQ4eVNyb0IvWGJXVU5OOXNlVkRi?=
 =?utf-8?B?STRGVlM5K3Vnd1FqcnpMQU56S2NpOTh1bTljTzhYMVgxTVVYdklId25EdUJY?=
 =?utf-8?B?QSthQ2xBNUNVUy9lYzJCSEI5c1pPNEpmTForMVZBVEt5SWJMVllJQVArSnpW?=
 =?utf-8?B?STZLSXpHK0hZODZzRUtKNllGeUx4RW1UaTUybG1qVDZxVnB1YkNWUlJwQjdX?=
 =?utf-8?B?R0NCS2k4OGdJSHV6Rlc0TUpSQlRqSGZVQjYrMjQydGlkY21qZDdidUdlQ3Jx?=
 =?utf-8?B?ZWc4cGs4WCs1SEhqMjdVbkhDWk9ia1ZKRFRoYW1INUEzWW5qYytVcS9jZ2Jo?=
 =?utf-8?B?dWNJSXczRkhZU3l2SWErQnovd1dCdWx0NGs4cWNJMkRaMTUrZEF2Snl0T0Ft?=
 =?utf-8?B?QVUwazhVVFExckJOdjgreERPZHFrVVZjWDMwaElaN0o0SWFla0RjWEJ3MmZB?=
 =?utf-8?B?aktzcDRDRU9lVWkwNE9STjRIZlA1NHFrejBmcVQ2UXJnbER5Z2Z5bWpLYTEv?=
 =?utf-8?B?ejNSb1A5MUhCek1xTkw0UlBqVjdCTFVObFV3K2JOejBvcDhPUXg5cmt1T3hR?=
 =?utf-8?B?eU1VUUU4bmNSeDVpNkVrUlp4bE5ZeHVqVE5zTXJHMTlZMUkwejFUd21KdGVD?=
 =?utf-8?B?UXk3QlNCdGhxcnQyZEVDK1lBbWdoZ2JpTG9mSndNQnN6UEtldENaL2ZNNmps?=
 =?utf-8?B?NWdya0cyNWtHQWJQQ0JDa3crVWRaQ1ZXQ0F1RkRjNmxncmNtTnYvd1A3WGtq?=
 =?utf-8?B?Y0N6ZCtScHRiZGhEQXRVVlZicURMY0EyMnJFUFdwZ2xTN1lkdUZ4QmJDbUti?=
 =?utf-8?B?RVlvSmpaVk9VRTdaRGFQTjczQWhCb1FmN1lSZEhWa05WeFlRNjBjZzZnNnE1?=
 =?utf-8?B?VzNDTU93SXI2UjBEdGU2b3pDdEN3dHozem1qdUNGVGdTR00ra3pKbFFGV2VU?=
 =?utf-8?B?T3cxNktZMk96ekRmbkgxZVpwUS9kRUw3akh2WnQvN2dmU3dXdVZ4a3Z2QVQ5?=
 =?utf-8?B?NGZzV2toSWhyZnRBR2NtYVZhdjBTcDRvYTNQU2FjWkI2ZVh6NCsyeXpoYy92?=
 =?utf-8?B?MVlEcWYxM2prK1VVMnBwK1pPNzVkSU5JZTJ5T0VzTnoyc0M0Tkh5ZnJHaWxV?=
 =?utf-8?B?Um5UUTltSnV1UGZXVnRZNVg4T29UekRGaUUxNFpNYTEzcXR1U290Wlc3bW9D?=
 =?utf-8?B?VnhMZXlYR00wZ2VROW55czN5cnk3aHJ1ajJ3K2JqM2ZlUkFmcFAxNkJmckNx?=
 =?utf-8?B?aTBpTFZ0SFZ1ZlAxR1V5SkpMdTZUSS9IZXRuM3d1SndmdmZuQ1dZSTN5R3pr?=
 =?utf-8?B?YlY4NHRQTzU0bzFRZ3ZjZ2hOSEVCS0R2OW5JRkZ4WWxHdzd2cWs3Ynd2VHRJ?=
 =?utf-8?B?TFkySit4dFA5ZXQwOGlYSTgwY2pPb1hFVGkwc3VQMmxGaUU3WU5xZDVUdFdl?=
 =?utf-8?B?UVR5LzBYc3kvNnMzZlArQU9QUjk3eXd5eVA0V3Q3RGxpdVU1Q1ZKTldKb3hC?=
 =?utf-8?B?Sk1zOGJJNlQ4bXdTYnRIblRuVTI4VHBDd0RPZThuL2V1eUdPenZVbEJva1JW?=
 =?utf-8?B?Vmk3NitkOVJXam9NUnZOcWgwTi9jQjhCMTk0QXIrNlZoY2wzN3JLaEpvWWpD?=
 =?utf-8?B?V2JlalpOVFF4RlBac2xzY1pFSytOVS9Vd1ZWbjl2b01UOTNlNFhjU1A2dE9z?=
 =?utf-8?B?a0pzRTdIbHdsRDhXclZCT3V6N1B4M2ZTeEQrQXU3TXlvcXBUa3ZwQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0df328d-b0a8-42ce-e1e0-08de45e5b808
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2025 07:50:07.4643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgupdRCtKe6aCoqBtGdWGOk49W7X8wXbm2YM/XuKlSxIbkSQyacsWer16/xsBCsac7ag+SM0Gkpv3sorz6FgeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782

On Sat Dec 27, 2025 at 4:15 AM JST, Matthew Maurer wrote:
> Adds just enough support to allow device drivers to feed entropy to the
> central pool.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> Changes in v3:
> - Fixed doclink to be srctree-based instead of relative.
> - Switched to prelude import instead of fine-grained imports.
> - Link to v2: https://lore.kernel.org/r/20251216-add-entropy-v2-1-4d866f2=
51474@google.com
>
> Changes in v2:
> - Added more details in the docs about the API, specifically about it
>   not crediting entropy and when it ought to be used.
> - Link to v1: https://lore.kernel.org/r/20251212-add-entropy-v1-1-e70ad1b=
c9c65@google.com
> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/rand.rs | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf12004286962985a068665443dc22c389a2..bf64752d276b0bdea06ac0de8=
a5e219190129377 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -130,6 +130,7 @@
>  pub mod ptr;
>  #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
>  pub mod pwm;
> +pub mod rand;
>  pub mod rbtree;
>  pub mod regulator;
>  pub mod revocable;
> diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..3e0aef2f53af122f510b34c47=
43a20452aaad9ad
> --- /dev/null
> +++ b/rust/kernel/rand.rs
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Randomness.

Let's promote this comment to a sentence at least. :)

> +//!
> +//! C header: [`include/linux/random.h`](srctree/include/linux/random.h)
> +
> +use crate::prelude::*;
> +
> +/// Adds the given buffer to the entropy pool, but does not credit any e=
ntropy.
> +///
> +/// This is intended for use mixing in data that is likely to differ bet=
ween devices or boots, but

Not a native speaker, but "use mixing" sounds a bit off?

With this, and fwiw,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
