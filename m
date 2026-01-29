Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A5D3793C2;
	Thu, 29 Jan 2026 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769687959; cv=fail; b=Ks+FXlUKT158sZt/Pcww9IxyFOIk4jXDKr+Z7A7L/qyomtBrvRcMLCMTlHtVwAkpvSukXd+zf4izgteCCRlqpiyUx5PZRXPqWUI6Ze7jMA03MlCG3K2GC1cdEhNFBF/xhIEjXYJqRHLXg7PJAvat29PCE9251N0gkaWPB4v0IsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769687959; c=relaxed/simple;
	bh=12x3oW6WjQ8Bz3TT7vPuqeWpF51XaOyEtp7UElaSj1w=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=P3oKhWbDXhUVYKTGuhPKjzDFTRZFj+zgDYbhsNHiGNh9udI9CY0nKJmgGVyK67LkrdkPmJaHXb5DqrARybTEwaXNlor00++rwiUGJVnvJYfDD46nXlmVil7mklbKzHlYMVRAPNlmskOKASN1Z6BDb8KAlH9baHsbRMZnXB9xOh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YUEj4QWW; arc=fail smtp.client-ip=52.101.46.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YUEj4QWW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAxQ+KQf52+MgJ2eAJCeNDznf4rlfFS93hN+3EMXwIZL1jNcLz3N6dGvittqr6ZaRXULl1FIYx5RRUQEa5mhMtVnM7hPG8Zqr1MKrp1SPYRGAtdJJGJqDnYDC0qPRfHY5ET53arw4KjT9KGakVf11iDrzAJgJ9/+KKuRPFpYzEqnu/aU6ioIuC43fdR1KkqBXrDmsGfFG+u876+hx1dYpyCkr/CrjvtrsCHvBlXN3KFGzjl8DtO/ESHLOYpkfzbo8uzABzfqmGLBrXtSbyNfNZtCD+VLqkSAEflI79XYMzjUAgK8bsM9gisWCvp3LhMxV197eZiGUX2i/oJUfNOtLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpdKSWb46Mbuw84ehh0iSQHhIk8umf7I4HR5oTAHQ+o=;
 b=US9pMrx69RE7DnHozjwFlBflW8CNrwjn+ZdIQFe4/x6LA8d5bIujDMWnXHSj4pjqEA06qwtcMEW1JUK2rD6RZFpm1KkNtmwnBtqCI8PzND8GDWrv050lNjfVVmnEt+PlEheCA7Rz8zJKUD6XlHwvrRuEUvvWYFEam2ec+LMgvJ/bC9qyhy9VKmK0cn2rjq3auZ8tUjUqtSWjvQdnK0b+UPGES9wR66mNRUSuxO6pu14r7Q59en9LqipsJgnkyNWb5ZJG8enU8qIIYsgY7qfSVMtRBl9ZAnBNL2UBfchAHeX3YS04Of5yVKifXYlAxWo8rGGn6wnNWsl26GaIZAwIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpdKSWb46Mbuw84ehh0iSQHhIk8umf7I4HR5oTAHQ+o=;
 b=YUEj4QWW1Qgszmw4TXsrpDHxqWaXVDvHJrg2d6beKrOKPaNO8y6jz6FMMaKjGlSoXud+Gap8Se9kD/J37qMKdzRIro8Y+sBmb7/WvIU/v9Beqx9xhiSTFf3xGNp+l4PlR9V+7y44nWVVS4Dxq2N5tdNKw15LgIkL/SOBMevfnGg+qcQntluaqFOlDiL0Dk6Duj4tUHNrK5utYkLD4IIyz+bRwKwBU/GEU+FToi7RzxfGHjGYnPu0VioldIdu3Y/+TfdNmte5XFl/ZBdvUBuAcTqvewctQRcjAVHi0T7YU/jTguUSAMLN4xgPcbCdsWE85U3Q0k9OPhOfhwKoQgxLxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 29 Jan
 2026 11:59:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 11:59:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 20:59:04 +0900
Message-Id: <DG120QJCVQDS.1E3ZZ4IVVU8Q2@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <DG01XSMD0VL7.2LN9LJPH57FFW@nvidia.com>
 <20260128175605.GA2175960@joelbox2>
In-Reply-To: <20260128175605.GA2175960@joelbox2>
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7d1560-0b55-485b-2f48-08de5f2dcf3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ykc0N0pPYXVtWkhhZVdCVnQ3QXNJQmFDdm5lN0lVTm0zR2t2T0NUMzRSZ3Rl?=
 =?utf-8?B?dEFwM09pQzJKa3I5cEJWWGNHRmZwQmxvR3Bic1RWc2gzOTRuNmtBdmc3Z1ZB?=
 =?utf-8?B?dVNqcy84QWRxVzJHVXdLODRRbjN2OGY0MnowUGcwT0lISTkyRTM3azJOSlRl?=
 =?utf-8?B?TlRjdTFDaFpHeTVUamVnejZuNDFPNmN2b1dYWjBkYmdQNk1xUDQxcUM1YVRX?=
 =?utf-8?B?ZWpaN1ZmM3FrSHZSc3ZlLzA4NS9Ub2tTckIvQWFZVzZSdEtZTTNwNkVqc0Jt?=
 =?utf-8?B?SktMeTdPU29MdW55dHgyVGcwMmFETGd0dDc2NHBMMzFrWFZGYm9NbnBCdkFU?=
 =?utf-8?B?UmtYQjAyenRZODFmNzFtM2VDWnM5a2xjR0hXeUxHR3Vxb0hYMCt1dkNUdlZD?=
 =?utf-8?B?UG5VMUdHVlRTNmIzSDRtOTd6by85Qjl5Y2Fmd2RGNG0vUVdDVDEzcmJDdHg1?=
 =?utf-8?B?cXdpTGUvYi9MUlJXdFgzb2xPMDlkM2hlNGZ6eStWQ21GQ2MxRmFPbGtkczRs?=
 =?utf-8?B?bWROdHdEbkQrTE4yVnVoNVlCVUJEOUJ5VEpFdjUydVNEWDZIY2J5WHIySEFm?=
 =?utf-8?B?aFlac0M2MDFXMFpVS3owa1FCRmp5dTJPbk1FbWNrL0ZnR0l3UHdsWnRPT0lM?=
 =?utf-8?B?cTlwSmk2WlJNbzlUY2ZXTWlLcTErNXkrZVdKSzNTcTlMc3dHK1FLbHRWZW9O?=
 =?utf-8?B?L3dIYXNnMitEdGNUbE0xdldUNlpSYU8zYjJ2VkNaRkZHeDE1K1pEVC9TMUZi?=
 =?utf-8?B?eWZlYXZjWDYzTk5lcHh1NG9HRit5bUtOaC9ZRmtrYzZ1RWFhMzF5UXBOcmNL?=
 =?utf-8?B?a09IZVgvbTJSblIyd0wxdXV2Q0F2bzN4MisybWpzaFBXamdSckhmMzRZSy9J?=
 =?utf-8?B?SzJxYVN3dWtmQlBuVGpyUjJQN2lhMzZWTnl4cmo3TUpCTUl3R3BZZWc1Nlg4?=
 =?utf-8?B?Q3IxWWFrVnNDNyszVS90SVdodUczWUhFOUdOd3Z1bE0vRVovZGV5OW5ja090?=
 =?utf-8?B?dnVUUHZmbjdZZFBLaElqRWljNkFKOUR3cWFXdVdaYm1IRVpoYTUrTHNXQTJa?=
 =?utf-8?B?SnYvbG1sc1NHZXpBUjFxb0xQY2U3dmI5TFBENUticlgyS3lMNG53L05ueWJr?=
 =?utf-8?B?dDllTTVKOW5XeERPMXFGTGFscyt2dWQzeE5mVEpIRzZ2c2RLVFZFcFpHNUVS?=
 =?utf-8?B?WmpwaklHYmJzTDRkSitidkNKTEdLQjNjQjBvbXRZRDZSbTM4N2VhemRqNUE4?=
 =?utf-8?B?WjVkVFY5a2Yvak5saDVOQ1FwZG1LcXRPdzhEZmdWRmpLdWJEN0trS1Vlb2Rv?=
 =?utf-8?B?ZGQwQVZEd0VDRm1laFJoNldoZDlUSGJBTXhVT2x2ZW9yNGFnUUxuZHRVYkE3?=
 =?utf-8?B?MVJ3VDhMeTdLZmJXWkpETjMvUVA1b1dYamV3Rk8xMVVNOEtaKytWSm4wUUxS?=
 =?utf-8?B?eEtSL3Zpd3I5R2pSK0RDbUE0Mkc4K1ZOV3dLU3VDS1R3bGg0cHEwanVnSHVz?=
 =?utf-8?B?OXRqZUM0QXNIN05HTWZqY0MvbjZxYmFEQXhxWTFkclo3VituclJwOFlBUmhi?=
 =?utf-8?B?aEo3QjlhbzNWYVp2eUN1SitUN3UrOWdJUXdYem5MT2RNSFZNQlk5Q3g5ckNU?=
 =?utf-8?B?VzN0bmtkQmtBYmhHMkZPRlA2anFOanVGMWVUdmlvQmxLSFBmNDZuSEhLRlA4?=
 =?utf-8?B?ZllLMkUxeGJ0a3RSSXdPcUw5RzhKK1FqNHlpYnRQWTlIZVJmU0JhMmhoYnNm?=
 =?utf-8?B?OTJMTERVbFE0ZE1TQk15RlR2VlpPWkc3WTZVV24yY2FZd3Uwdk9nRHFMR2V3?=
 =?utf-8?B?Lzd3a0JhVG9XMnJ1dHUySm5MYUxHWmJiTERpd3AvaUxVRERzYlRPQ2JyVFNL?=
 =?utf-8?B?R3UzOHlWaTQ0NmZ5STk4eTdrLzdnNVdmeGMrQjYyWlN5c0t6eE93K29GWm95?=
 =?utf-8?B?TWtvekl1YU1KdFUzMENaLytVcEpHamRMZ1BMeGJxZzhtc0VwQzdkWHJBQzI4?=
 =?utf-8?B?R0hLN2phZW9iTmxIYi91c3BWdW5Da1kzZzZMdVVDSkp1TTRMNHBQcGVXa3Vw?=
 =?utf-8?B?QkFlUC9UTFlHWm91SDRpY3drZHFYOXA1Wm82MldhYVQxaVpUVU5YWXdCZ1hq?=
 =?utf-8?Q?XoKE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0twMmd2T2JvbE1Ybi8ycUplL2dlRWZ5czJKU2lOaUtKaU9WenhHNndBUUcz?=
 =?utf-8?B?K0tyRTNkSEdzWkxRYjl6QjFOVk0reVp2b1hZY091Rkk1VlZJalMyZTd3RG9G?=
 =?utf-8?B?NVNVaEUrOVZyWFBpc3BMSGg5bjdLSi9RLzFva09pbTI4eW1aaTlQYkE5WXVj?=
 =?utf-8?B?YnRyNUhGaEJKd3l1dGRFNFR2OWNjT1BMUkIwTzNZZ3RPbnZJbUpVYjVRcHJm?=
 =?utf-8?B?ZzBnQlVnN2JINlJBSFkzZkFmY0Y3NzNTdk8yd0M0bks4eHNwazlYazdHaXhS?=
 =?utf-8?B?WjljdVJmMnpmaWpWMkhnejd3NFlyb3FvZzdCV1dMN2h1UzExTk5yc3p0K2VC?=
 =?utf-8?B?QnpXeWt2b2Q4TDlxbjhZY2RpdFpmUUpyY3I4dlF6YmRjamc5NWI2dWg0MElN?=
 =?utf-8?B?R20vVnNHM2lrYXpCOG9zMkRuZ1dLaVRTZjVqL2xpeENpWFdaRXRodE1Jdkd3?=
 =?utf-8?B?WSt6M0NabWZqN2JWUm01S1ZqK0ZaNjB4ZFNncjFKMjBvM0ZpbGxkcGdjTWd3?=
 =?utf-8?B?Vnhzenp2Z2pRRmJVK1V5RDRoT0lDYzZlT2RiWmdZWG9JdmNndURRNmgwdERD?=
 =?utf-8?B?OE1IdHU3TTJwMTUyQkZuTDJ4dE1NWDFma3REYktwMkF5Z0VVSHZrSkhJaUtt?=
 =?utf-8?B?VU1UY2JxVk44SFlDb3FjNi9tRGx3RVErMnNJbkFVZTZrbWxCRlpNNkRpMDdP?=
 =?utf-8?B?bys1NXpVVVpPMzJ3amptemdERGpyUk9IOWo1VkRPOERpRmpmaWZmRkZ6Tkx1?=
 =?utf-8?B?RGRSZ1FxNTV5MGUwS2JNbmJtMCtPUG1PUGhUdlk0YWtZU2h0QXF4MXE1cEd4?=
 =?utf-8?B?cUVITkhBbkVDUWswS3o1bmdKWEJTK0ZrUEI4N05qei9mZWh1K3Z0K1NTcUNT?=
 =?utf-8?B?eHI3WC9uVnA0NTIxQS9EMjg2MW4rRmx0eEpiUDlyRWgxR2V6WG9ZR3NwS1A5?=
 =?utf-8?B?dkUvV2F4T25JUWlmRzRhNWd1UThaamZRRk1FRVdxNE8yUmpLRzJMb0lXQlBM?=
 =?utf-8?B?NkVRU1d0eENCaitNNzR2ZWhiczhpRzZLUjcyTzlvd0NNMFdoYmtWS2R3b1ZO?=
 =?utf-8?B?eEV3Ymh3YjBESW93S0NwaEpKa05URklMSldkNmt0S2lVQ3VzV3o2ZFRGK2xx?=
 =?utf-8?B?RjlEbUtDQXlIMWRuSTNIZG9pU2xUUXR4NCs4U0xSeHNzQ2h5dXFIemU0Rm1r?=
 =?utf-8?B?bTJHdC83Y3A5WS9xWHRqSmY2dFdKTU9XakE0MDBUZVc0TTE2TDJoeUN3RUhW?=
 =?utf-8?B?MmZqajhxa0Q4THUrRW9tdTY4OWkwOFRrdlNXWG0yTEpndDJXa29GeHd3dS9C?=
 =?utf-8?B?Y3FNNmVuTHJSZlpOVGpOQ2pQbnN0aWFVYXJNQWpzYmNvSDFCQ3ExNzVjVUdz?=
 =?utf-8?B?SFp0anN1NVZ6Q2lBWW51RUNUYmE4YUZtY1BTdEtlMXZuU2JTbmdmVlZ3SEFU?=
 =?utf-8?B?L3I0SUdZa0V6WWM3cTdOOUlodSs5SUtqN0JKNEpBMjFiTEYrMlM2TEtEZDhO?=
 =?utf-8?B?UGVnVHBmNzl5YzZzNzFyOE9ha2crMms5d2lCT2lOT2lQd1k3QmlkZEFwaUNZ?=
 =?utf-8?B?MjlZRzZoUkJJNDZWSGF4Skc4eGZIOUJ2WkJGL1V2Q0dqaGY3dkNWcjNhc05R?=
 =?utf-8?B?dDR5ZXpmMlE0cTZtTTJiSGRheU1EWHAwS3pxQ2RtcnZXRHhtQzVwa3JTV3h3?=
 =?utf-8?B?Ry8zR2lvWUwxRkYzVmFJZVN0ZHM0QUJ2SXJ6NnkrWTdkY0UreVhQdTlBUitU?=
 =?utf-8?B?SWRsdjlOQ0NOVlVIbEgyMEYxWFAvWm4rM1QzWXNLa2ovZG0rODk5RFZoR1BU?=
 =?utf-8?B?QTFvZkJ4bE5COXRkMUpCWVhmbytFRTRXNFl1K05EeXdabzlUZ0t4TnY2dlFN?=
 =?utf-8?B?ekpmcCtwb3JMTTc0TXdmc0NQM0IyTVRicWFGbTBYUllSUmNod0tRQ3lrSjlF?=
 =?utf-8?B?TDNkU1hySjk3WkI5MVpKSFI2OW1oUG5DTWw2WVJwbmF4bXdyalNUN1hMeW1n?=
 =?utf-8?B?Zjl5VWxwMjh0bHRDYzhoZnhZbnJ6RjlsZHRUT0ZWbWUydGhicmNwN3pVci9Z?=
 =?utf-8?B?MnYvaTJHT3ZpelcwdVFXNVdKUGxaaHAyMkFhL1ZGS1g2L3lFWmd0VTRiTGVO?=
 =?utf-8?B?ejl4L3h2bDZsSHBka3BZdVBRQjdVRHFORVc1bk5iMWQrQUZzOCtZcWJDVWI0?=
 =?utf-8?B?VlFSenBZTmE1MmhPOTRrcit4NWxsa2lZODA0NGw4QzdxTTJZMXJVZlgwU0Iy?=
 =?utf-8?B?YjVSRHlYQlA3RkZudERwaUpycStsWDVXbGR1UEpobjN3WmFTSi90TGlxSjhq?=
 =?utf-8?B?U1ZEUElWTEg3dk1YdWlLejBGOFlyVm1qZWJCdUtqWnVqOVhLUE1PRXV4T2p5?=
 =?utf-8?Q?X9wWNCVnz5IPJLGi5gxq7F79U1ucQO9txIQHETtrR6gVu?=
X-MS-Exchange-AntiSpam-MessageData-1: jaXP++ZRgFeF/g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7d1560-0b55-485b-2f48-08de5f2dcf3b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 11:59:09.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MK5gqx2atpCLj54vMjjLWOjGrhVSXTKMJtOLE0reYCJ5gMWd0EdMjFvGyHlEWNaV4FZu9GczoirQjn8h1crsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217

On Thu Jan 29, 2026 at 2:56 AM JST, Joel Fernandes wrote:
> On Wed, 28 Jan 2026, Alexandre Courbot wrote:
>> So these setters are really part of the `bitfield!` API. Bitfields are,
>> at the end of the day, just integers which we will very likely want to
>> declare constants of out of individual const field values. This can only
>> be done by using const methods, and a const `Bounded` needs to validate
>> its constraints at build time, which requires the
>> `Bounded::new::<VALUE>()` constructor, and by transition
>> similarly-shaped setters to set fields at const time.
>
> I think you run into that issue because the setter requires to do `.into(=
)`
> to do the bounded conversion.

Precisely. Without that conversion, the public field setter could just
forward to the private one, which is const.

>
> If we accept Bounded type in the setter directly instead, it
> should allow to keep the API simple. The advantage is it keeps the API na=
ming
> simple. with_<field>() which accepts Bounded type, that's the contract. T=
he
> trade off is the call-site can be a bit more icky but I wonder how much o=
f an
> issue that really is (it really depends on usage).

I have tried converting the current macro to this idea, and this results
in quite a few `.into()` calls. Notably, I find the following a bit (pun
intended) annoying:

    r.with_start(true.into())

`start` is a 1-bit bitfield, so it should accept a boolean, but here we
cannot pass it directly.

So I am not sure that I prefer this over the current generic argument.
In any case, this exercice has revealed that even if we adopt this idea,
the issue won't be entirely solved because of the `=3D>` and `?=3D>` field
conversions.

For such fields, performing an `into()` or `try_into()` is mandatory, as
that's how the argument is converted to the Bounded internally. So
pursuing const-purity at the moment is futile anyway, at least until we
get const trait methods.

Which leaves the original problem: how do we avoid invoking the awkward
`Bounded` constructor for const field values. And AFAICT, taking the
`Bounded` directly still requires us to build it, which requires us to
specify the backing type explicitly as that's the only way for the
compiler to know which constructor to call. So in terms of API
convenience I guess the `with_`/`with_const_` combo remains the best bet
for now.

>
> I wrote a simple program to confirm the same function will work for both =
const
> and non-const parameters. Actually the caller does not even need to speci=
fic
> the bounded int size at the call site, it gets inferred. So we don't even=
 need
> a bounded! macro.
>
> struct Bounded<const BITS: u32>(u32);

For this example yes, because you have hardcoded the `Bounded` to be
32 bits, but I have tested this against the version in the kernel and it
still requires the fully-specified constructor.
