Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B5817ADE0;
	Mon, 16 Feb 2026 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771234599; cv=fail; b=RbmaH8AMrMjqvD/Qm+c0deHjBZm4jM+RcEbS96e8jYHAL3KrflAkIM275v41PYQkaRForGJmN/xDfRzZMknk3+kUbr3BAQ2jGQj0zqCC5EGoJdc6/ZTU8Iep9i7tbVjJRpzhzXZa1qlf8cj6p8scONvbSIGTYkALPe2OLWhv6h4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771234599; c=relaxed/simple;
	bh=hHjqgO+R1JRtRYwGK+iUvUf1vDILgI7OM3xjl3UMxH8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PZev8EWAZTXXzuWR9eNxu7GFpDw/xkWvIDi9tHdTuCMVFt0fdMvZa6VncuPrESTPU1ApkjYWLh0fIof98S4ZK5zddI74FipwawceG3VYqNS0Bj3N50c7CBn+N9zmBUqlG1ePKNKaw7Am+KilvzV47Lan+EXk3HPGUIL45NPjTJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bhr/yx6q; arc=fail smtp.client-ip=40.93.194.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bhr/yx6q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL1dY+3jlfLCyAQrV3iV5cG7iQmYMh+bgwmg04WeaJNIueMFVjNW/8rE6IhVR6ooYuerSEwOJKZ4YiNAovhPsxZZdLCNn1Hvu6DARZnlBOHasSOYCw+uOFAdJrFOeNN7f/TgB0SoOaTbT2btbAnQWa8GaPWC3kJJuQRHSIWKloYLPcr7pTw/LITnsJZHh+GoRy1pRYmX9B4A/cNSeyGNcUr5bqZDkIUC66aJdsw4oO5Gu48KlEzxlElst6jO65zXcyIsJ9IPfknRB33E+C3sc7LqY09qzZM1OaA+K6GbP9AqGF7L0JQCEq8hfEX7h8bYx8oTd1SifBKu+EnwZnm2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GIH4TTO1X+CO6uG7AjBYFSMqsgYSwJ2YM4SkR6Wxqk=;
 b=gD8t1ugorVF2xBsoZL5QEb2lNSRWm9t9DwQtBeUyP0VNA32nhqVgeEinzBhsXjANDKdeskJbpeti/THKu1KEAAFy14qLLDCMYa5OmCQcGfVDP2hpNZOhorkrPAFLlOz2S84J9Zj+AnMwJlw57zrEsR18R2gJ/PnfVO8a1omVQbsxEbY9EIo66WtEZsuSHxkGf44B+4ebP7560aj9AFTbv9M6NLx98mIorzwqQaadCeJjaQF3ek1iv0vDK9Tc60F+VRxPi0cS8wNvgMLagb5IlPG5VpQMzXR535K+bI3BXD/KeRN/oTByChU0tGTcRzOlt0m1u9WnLbSaWqFX/HZNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GIH4TTO1X+CO6uG7AjBYFSMqsgYSwJ2YM4SkR6Wxqk=;
 b=Bhr/yx6qUuXdkrLxuSuV6R9/i+DOm0wsMwzWj5X0q41EXS13wtveJ3jagBsxzJ5fTrHc1Jjo407x6qyJfu7uqfaoVshMXFKF4ZnNez3dyWzWv36CBgh9ibS+RkCTSaekLsF6ReOVIlYplM9xsas6QoyVCI+/BIHDcYQg54bw6S+u5v2cmSiyF+/TKlGSMk8SJfQrPCOf90IO4NlUFFEbvFkpLfzeNb1+ygEhEI3/VkwZTDZzynwkz9uM5fwvskpDOd6nbwGz/HsjVrgFd/AYjjiICUHl6LNdYlb5jDNkkx/3h4faqIjZ8YSBwpKFOnHDBra5CGm4qQNlHclmlBiKvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB999079.namprd12.prod.outlook.com (2603:10b6:8:302::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:36:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 09:36:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 18:36:29 +0900
Message-Id: <DGGA9D0N19KQ.4LBXRAEGNMLX@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <20260216-register-v6-5-eec9a4de9e9e@nvidia.com>
 <aZLc0YMHd8C0bVD2@google.com>
In-Reply-To: <aZLc0YMHd8C0bVD2@google.com>
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB999079:EE_
X-MS-Office365-Filtering-Correlation-Id: 117a8014-7108-4a2e-7f16-08de6d3edef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXN6ZnkydHd3QWJCVWREOE1YNTZEQkJDT3N6NjFET2l2UVBhZVFwcmc2c0tI?=
 =?utf-8?B?Tmd5S3B6ZkxoL1pHV0xJUUlDZUtqdGcyRUxQQStucWplelpFNU9HNml3RG4y?=
 =?utf-8?B?SHZsUjRUUlF5N1hNK0tFV1VkeTJPVGQrYXhPSU9FMTgrTk4zb1RXVk1XSnd0?=
 =?utf-8?B?ell5V29rQVJtMmtqaHVRano1dnovc1dIVWdyRWFTQWxUZFRpR2ZVUXNlS1Vz?=
 =?utf-8?B?OHNVWmYxMmw0aHdYb0xxZHJudTdUb3V6ejhtKzRPZm0wSnBTQjU1M1JNY2pT?=
 =?utf-8?B?SXVrWlB6Rld0UU05ZmVlOHFkMUVKOWptUmN5SFZ2c2NVLzNKZlFlNVJuS3VL?=
 =?utf-8?B?bjdHeXVmalR2b3BWYysraWtqYWhHK1d6dDRuZWlvQzBPUnVvMi9Hd2xVWXoz?=
 =?utf-8?B?R01obmRTeUNVaEFBNHRPQ1U4dVRrT2RBYU1oTTd2Zm15WC92eUdwSWMwVEpE?=
 =?utf-8?B?NS92UjB3Nkp3cXpYdE5SZVF2YXRtbmd0TWVHVFMwWUZoZVlCVHYybTZOZ3ZC?=
 =?utf-8?B?anIwdjlSSFdIMDNZRVBpWVdhU3haNHRQRGtCNjJodnlZaUIvbFpxSXFYM1RE?=
 =?utf-8?B?Q1M3RVJNMW8xT3JiR2MxT05ONmk0V1M3QWc2T25xbk03MVZydjlpNVVWMm5l?=
 =?utf-8?B?aHAyNlFkdFV6enJONU9oczBOc25iL3BKWkdnZWRjYmJ3SWhlZGFLVEhteDl4?=
 =?utf-8?B?MktXVm1KQkk1UWtJaWkyemtjZkxQdEh3NGtTcVVYNUdaMk55L29LRTJhNWdW?=
 =?utf-8?B?YktMWkZSZ0dHRTg1a1pwMnhkbDU3ZUpGdWlnbmJ3dVdoK0Z4SG9MM0tLRE1N?=
 =?utf-8?B?Qk5rZGtuTUd4NEkzTzBRQjVZZnpRUnByTHFCWnMzVlRYL0w3Y0ZLS2VOYmk1?=
 =?utf-8?B?aVVXU2tqMDJmeWFVZkFYSmJ4U3pORXBoMVZFcHNRQ3RyMFNwMnZKUmZZTWY5?=
 =?utf-8?B?bjRVTjB1elliejdISG5XUDgyVjVKRFdoRnVLeHE2QjMvMUhHMmJhYXUrYnl2?=
 =?utf-8?B?R3hQelJhYWNrdVdkcFl3MWFMZU1MU3dCaTdyL1FKRy9PTzBBQlBrYjB1QldX?=
 =?utf-8?B?WW56dWpTRExqVFkyemNhUnJuY2NjOVlISjJTcjdwYTB3QUxQZHF2c1ZPbXNs?=
 =?utf-8?B?NnduL2JVUzJ4a0huUklub2drUlZnYldJbjhEL3ZtM1FzK3NsV3llRE9qMkdt?=
 =?utf-8?B?d1IremlyeEoza1IwbDNvdzZQMHovUXR0aCtBbG5OUzZ4WkRnNUM2VHphWnE2?=
 =?utf-8?B?RGE1T0wyR3NhRm13TExXQ25yc3VyWTRmWFR4SDJyMHhTNE1KM2JvRFFHcmFK?=
 =?utf-8?B?dnQ3UVJ5T2dFcjR6QTZWVDBvOWdhSWlpczgya21oUlp5L2dVdkRvaDZ0c2VZ?=
 =?utf-8?B?RlIvRlljVDVwTlQ5WXQwTVdhKzJsekZPT0hyNDl4VkdCdVNxNHVNYk44VVRM?=
 =?utf-8?B?OE1yVmpLb3l3bFV4TmluUXBWcEpJVjF0eDRSOFJyU0FLTlU3NGt2UzhLN0s2?=
 =?utf-8?B?Z2hMVTh6ZUFTV1FFaEpxdDN1ZndwbTJpMkdMWG5taUhuVW0wMEVPMTlDUWtX?=
 =?utf-8?B?WmlBOURWaFZSYjRLSk9nVWFnWmY0dWh2ckFpU1dVZDdCQUJmT29YTGUwc0M4?=
 =?utf-8?B?WFJoTkdvSW5Id1BVZWVBdWNBZjg5TXhjaUpua0ZPMXVZc0Q0ZmhBR1NjZ1Nx?=
 =?utf-8?B?Y0M1aEw2K1FkY0pRbzRYNitFTmFiQWlmVzRxMHAraHc2dnpITDF5cEhjdTY5?=
 =?utf-8?B?MXE0N2YwalIvUkowQ1dIZkdvbEg2eFZiMzIwS2xOYTJPdWg0eHZGdE1sc1NN?=
 =?utf-8?B?a0doT2ZtVFMvUmdCeVJ5OUdOTVE4YVYwVjNQUlNCQk1xTGFuVDM2VTZ1b1N1?=
 =?utf-8?B?RmU5dmcyaUxzVTBkc2JyRHBtQ2xXbkVKVUxQTGUxRDR4QW9TNUJxQUNVSlhm?=
 =?utf-8?B?aHUxTGlwUG12eXFDZ3VPY0VRa01ZRzZ6dCtmYks4THV2N3hZR3p3WmhNOEJl?=
 =?utf-8?B?NmtWTXRnTGtLVWMyWlNRc3NQbmM0cXZYRHQ2Q2pyRitTRU9ZNlMvTEh5a01C?=
 =?utf-8?B?cTVVQlp0Y3o1YUdrYlpZYlY2YlppWkVvSzQzNDUyWDB0NHBjYVp1M2VaSmxk?=
 =?utf-8?Q?oEPg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3FwRlI4dGszSkdwNmt5enNpQXdmOFZMeElYTGd6T3FuVEV6cWRnVkdCL3B4?=
 =?utf-8?B?VC9oQmlLUlNRZGNMVWxjek8rOWNLYWJLTmN1eE5QeERVeVRxazY0TENQajNU?=
 =?utf-8?B?aC84TjdyamNCVjhjVW1ERTg3WTRDU215MmpESVprUnZJRFRiWjBDc0V4Zk0x?=
 =?utf-8?B?NVV4K01JRk83NEthZVRhRUZxamJMbnozYzBoRFFML25pQVRGK0hHa0tjQlVH?=
 =?utf-8?B?Skc5VVk3VTNsQzdsNUdXdU5sQlVrTDN2RkxlM25RKzVjc3VNTGt5clRoWXBy?=
 =?utf-8?B?WHdPSEhzb1J5dzNnY1QyYk42TWxaN0JLL1J6T0RDZDN1ZmZwZ2FFK2VEM2dM?=
 =?utf-8?B?MER3UzIrNXpXKzJrY1dIZ0lGSEFBM0hQRjBkeDhWamdHZGpYV3NEQVF1S0pV?=
 =?utf-8?B?bVdYZGRvcXp5V3lBb1c5UDlpVkFjS0hyck81K0tDTlZkTmNLZkhlaW0xZ0ZH?=
 =?utf-8?B?WUlEUUZ4Zml4Uk12VmRMVVh4V05hQjgyRDRYY00zblVGVEVveGtmYTU5V04x?=
 =?utf-8?B?QTVkaDJ4dnROODd0TjUrTVltOEdhMTl4RWd6cDB2THhzQWo3Wlp5ZUJ0TjlW?=
 =?utf-8?B?aUs1YXhCdFpzbDBjUCtqQXJ3clVmMVF3WEpTOHlLWXdpSi96ZDVQOElTSHhn?=
 =?utf-8?B?VlJNMkpPbXJhSzdsSmFNNmN4YkcvTy9yZVNFNm5nT1NmbG5jUXV0aVNFcFZI?=
 =?utf-8?B?N1p4cklPbWhKNnNMZkRkSUFaVlNpNlVYdWxNVWlNZjRTTkpKQVN1encvRlBB?=
 =?utf-8?B?RXRSZTJET0VNUTdKT0phZ2dyMmtsTUY3dzJ5WjFjTkZ1MW1Zb2R6OTNjcXVB?=
 =?utf-8?B?QjdmcWg4K1J2T2tZejBsMVh2ak1nWXNLaElQR0wrSzZucHpRSXRySGtqdUtl?=
 =?utf-8?B?cjB2U1k0eTZ2aHZPbmJLLzFsbE5hamVDclhUZ2U5ajdCZmMrNVFieHV6aXBB?=
 =?utf-8?B?Y2F6ZlBQQ0FDUStrSE1LWkJJbi9sejRzZkNSVWNXam1kMGIwVUtBZmZ2SGQv?=
 =?utf-8?B?VmJqczMyNE5KVzJ0cjJYYnRwSk1pbXpoWEpPWXpGZllRRWRac3ZNdy9sL0hk?=
 =?utf-8?B?VEtlNWR6WXRyemhOdTRKakc5ZXdLMno3K1hiYzM2WmxEUm13SEFOMS85TkdY?=
 =?utf-8?B?NDd4cFhhS1RYYWZDczN0Y2tUalFuU05kNkJoQzU4dHVXMk9MQTBlcU1oSGJu?=
 =?utf-8?B?em5rUldDbzRRSnc3Smh4TUpkSGZja1BCL2hsYm5Sbk9oaEhBTy9lSWNCdDF6?=
 =?utf-8?B?YkR5SDdlTmp3bmJWblV5ZFY0YnZTL0dwNXQvZlJxR3phWjI0REc5NW0yZllO?=
 =?utf-8?B?aEtQL3ByVXhQa1FwYTJJVS84VDN5NGQrZXBpajZ0azJaaTlBMDRyRnRleERh?=
 =?utf-8?B?dGhTU09kZ0NjNDVodG1sbFFYaXBNQ0d2dmlCT3F0WXZLTUhTZkFHWEgzWEpy?=
 =?utf-8?B?L2tKMGsraVZvcXROZUt1K1JqNmpjcC8vaVZNV1AyYkFEZEMrWU5SVmxydXNZ?=
 =?utf-8?B?cEJMS2ZTcFNjaldFM2p6RTBONURoM0xWejlRbXdoRWpVQ01hZE5zMVIwSlpN?=
 =?utf-8?B?NmJVK0I5bys0OE1Zd0locWxlbnVjclJVeS9mN1dnZXd4MGdpemVhWkF3NjJu?=
 =?utf-8?B?bmJnWkRhdFNyZjF3dzN1WS81VUozbnd4eFJ0VWN0dEg3OUROVDgwTVUwOHVw?=
 =?utf-8?B?c0hmTVlHZjMvV0k0RTZZaXBjTXhXaXVhQ0ZHM09uL1dXc1BNbzlOSHlnbXFP?=
 =?utf-8?B?L3ZldFpjdEs0RTlVQ2NVUWcrQ1ZNVGs5MzM1eDRtcGVsV2xOTHVxdTFvaVRx?=
 =?utf-8?B?QnB6MVVjMW5ZN0phWFBGK1BEc3ozRjJhbTZIK3JKK0R6YmNkeTdKcDJ4emZm?=
 =?utf-8?B?UW1PR21MWjRDRjRQRjFwLytmYXVPOUVlQlpGaHdxZTZaOExTbksrVG1NZC9l?=
 =?utf-8?B?eVRBZFFJSExPMWJMcG53bFpSSmhZTGFEQWlDMllpVmNZQXlYYmRqRU9jK3NF?=
 =?utf-8?B?ejBua1JBZmxsREo0QzdOM2c4bS81TENFS2ZvS2RId2prdTVnNGdyYWhUbnpE?=
 =?utf-8?B?aGMxbklnbTIza0I4SXdMVTlsZ1BKcTRWaXlyVWltNFpBYlA4d1dKL2FtT1I0?=
 =?utf-8?B?QU0xUlROV2VZaVB0T1FmTExNbTB5SW41bElBQmFiTHFoeEY1YmdsMVh3OW44?=
 =?utf-8?B?MjRvbWNDblVXUlZwMSt5Z28rNnFKV2lkMzJpMGpoM0plZ1I3dG1yY3RLbmo2?=
 =?utf-8?B?cGljeFQ3TUl3VDlLaWZDaWpFQWxnMUJhVnJBTEE3MGc4N3MzVXFtS0dOQ3dV?=
 =?utf-8?B?NWRWcDB4UjNVd1FFUGE5UDNJWjYraW5YcDJGMWpHeHdzaldZV0k2V0pYWENn?=
 =?utf-8?Q?65X3KgcXHYC1V9sMIrTSJfBA+6ElQ2YXa9j0cmm7LmBxz?=
X-MS-Exchange-AntiSpam-MessageData-1: ZOxDmeobRQgz8w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117a8014-7108-4a2e-7f16-08de6d3edef1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:36:33.2010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvmnZkwWJ3KHGNNiSTxRgXm/nPM4Ek1nP43KVtfvrqGK8JVz9ZTjLDCYtys0z7x8vPts5wooI+0n24XdAvAEiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999079

On Mon Feb 16, 2026 at 6:01 PM JST, Alice Ryhl wrote:
> On Mon, Feb 16, 2026 at 05:04:41PM +0900, Alexandre Courbot wrote:
>> I/O accesses are defined by the following properties:
>>=20
>> - For reads, a start address, a width, and a type to interpret the read
>>   value as,
>> - For writes, the same as above, and a value to write.
>>=20
>> Introduce the `IoRef` trait, which allows implementing types to specify
>> the address a type expects to be accessed at, as well as the width of
>> the access, and the user-facing type used to perform the access.
>>=20
>> This allows read operations to be made generic with the `read` method
>> over an `IoRef` argument.
>>=20
>> Write operations need a value to write on top of the `IoRef`: fulfill
>> that purpose with the `IoWrite`, which is the combination of an `IoRef`
>> and a value of the type it expects. This allows write operations to be
>> made generic with the `write` method over a single `IoWrite` argument.
>>=20
>> The main purpose of these new entities is to allow register types to be
>> written using these generic `read` and `write` methods of `Io`.
>>=20
>> Co-developed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/io.rs | 243 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 243 insertions(+)
>>=20
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index b150743ffa4f..6da8593f7858 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -173,6 +173,160 @@ pub trait IoCapable<T> {
>>      unsafe fn io_write(&self, value: T, address: usize);
>>  }
>> =20
>> +/// Reference to an I/O location, describing the offset, width, and ret=
urn type of an access.
>
> In the next patch you implement this for usize, but here you say it's a
> reference to an I/O location. I'm pretty sure usize is not a reference
> to an I/O location.

Methods like `read_u8` use a `usize` to reference the location we want
to read, so aren't they in that context?
