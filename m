Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D21307AF4;
	Wed, 28 Jan 2026 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769586166; cv=fail; b=toALjxee0iUmqgv3eBJU2DONjeJoZEstNkj9Kc/Hlm10tRAm0XcS/ZBqQUSMXwFO2hPSwZOztlumSJCaZWZ8oRW7exnmA2gh2N6Ub5+CPs7CNeVODRxy3t5aMS6BWfOqNbbZTkbdBpfB3w7YMlSYCjJp33xCqfDdpD2djTblDE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769586166; c=relaxed/simple;
	bh=P4anF5tQNPYJ0aNMa7EhoHVCGNY7mKVFYli9Xq1wNuI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=I3jH4at5MwFSYg3/M/xwe3tT6yVSLCMRcr2AohNBflFFla82e1ijTuAtr9Ri3ZOIi6ryhKWlxBdQc3mlu0Ja/lCMU06ezZ6YV5w1qLFJx72cIWk5Ua2VELC88hn596FqrTTMk5g8csgj6roSCOIryO3OUx9EHo5tXefemXaojz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bQIUKt4H; arc=fail smtp.client-ip=40.107.209.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bQIUKt4H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWnR/7dZ8/qvLQym1zq9pZ2fA+A/8LgdVPcMrXT8zLAVSNYnAhUOxRcAL/L0bPa3NMcz62mfD3LQq9jVWXh7Vaf0TZZZPWRb9Fk79dWXtQ6Ul4DfhtpUXrnHLEYMMe3/SM6iP5WW19bqzXh4J16WjOlN4+IQXQnJt+2kQj/9zSsRViCS+L2nTUyZ0fZOGbph31pgXuQd4HZOCWuowWviwOviW8sADqKK3u3Ux5W/wZwcGUL3bHmVVpK5H73NbGodkJYz75+7axTwPpCkC3dPaIuOSHNAwt4+LODh3Y2TVf+jXv0WfvkKTTnOXKF6eDC6luHOiuarXMHrq9xMFNdUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNLGivzepBRF8UG7vwidxHRkkCChtFse5xjWLec7/vE=;
 b=WUnA6v9bb4CdwYEJjailb+gP5nMyMwtWJDLOTRYT9xXZ31hOKtjpVi0rGPnxxVEqDuKzwgfeBtCxq323cIp6se4MaKvJ/QFhWWzy6yOTGsy4mCi/lJVztKnoQawnNqY9cfqXvre6TF5EJGWKspJPmIwVko5cu43jaDruqer5WKakOJRKqddGIWym5EIVuTIwyi2w9X6QtxN17M+ygAgCFGpJLZm9DSAqp7yEV4YvbyFyvPRHV9wdNI+RXs+ktFYh/yX1kplc4k3OTJZbQXaeoq3Sy0DmfRRjLA5QQp3is6LqxUO3WJzj+gcCpQv0J1hRpRf4ivQoEelifD9yEGK5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNLGivzepBRF8UG7vwidxHRkkCChtFse5xjWLec7/vE=;
 b=bQIUKt4HhuZaNYQDjBywL8kv+btbVkhYi+o6wodjnqNzbFctFZnXKIzFKV4lfSbrtZ93ITBZqD/MPS5ftlmNblYL2vxEIIrlWIvghqwOhD7gFPBaUP5iZ4He6KYJop7r8yi35vmiutgakSmG2UjBirK/AQrqXOBYYesxRKSA1Wt9zYgEYA2BqdpzOiVweyZjOc6p56v+QT8AfCprRhuRJ6vMocUO/w47Kte/uYnIp4XLcBqrq1Hrzad0d8XrdPDbwXYVBCo5OPT0LSIBCCgeYTwWnN1pIf8xQ/BSMERSFboDuGfkigm9zw8tessWDWnIxQMWu7gluOzzO8YuGTMc9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 07:42:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 07:42:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 16:42:34 +0900
Message-Id: <DG01XSMD0VL7.2LN9LJPH57FFW@nvidia.com>
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
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <df2772b7-0313-4767-a370-4a4821425f60@nvidia.com>
 <77AAED55-B8AE-428D-AD3D-D52333DB8D8A@nvidia.com>
In-Reply-To: <77AAED55-B8AE-428D-AD3D-D52333DB8D8A@nvidia.com>
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: 156637f7-1dd5-4174-52b6-08de5e40cf2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVFPUXdMTXpYeEJ6eEZTTXNEOG1YVmIzTFA4M1FNY0lqYVNJRnp5L09SdDgr?=
 =?utf-8?B?cUQ4K25hU1ozcVdSYlk2WEoxZVk1TXQ1WWdjbFo4a0FvR0VJM1F3bEY1dWZ2?=
 =?utf-8?B?K0wrMDVrVGhhQ3h2bEJzQ3hJMHdTU0x5cUlTU0VpN3Y1RHdxUUo3eGFVL1Fk?=
 =?utf-8?B?NGhiUGhjRXpVb0tRR09WQmZkQTNmWkpIVE44TlJRT3paK1lhYTZlaXNoYzdl?=
 =?utf-8?B?QW5OaHduM0FVZGlWK3FTRDJyakwvLzA2d0FZOFRtU0pWVEVPTDJmTW9wTlZM?=
 =?utf-8?B?RUR3b3RodTEwUG9zTGVRTkhUakRDcEp1clFycWhnNFRTVmVFZzRXRzl3bW9E?=
 =?utf-8?B?UHZYakZKbjc2ek41UDU2a2U3NjNabU92TjVaUlF4TSthaGE2WVJUVXlIeVRP?=
 =?utf-8?B?YlVBeDFxTjF5dXZIWXF5WVZDOFVpZy9hcVlyUlo1NWJ2bTNPRnQyQ3E4K2t2?=
 =?utf-8?B?Z2M0NVRUbzlCWkozMHJxakxoRnJuSktmWUsyWTFDaWF3ay9LdTEyb3FMR2VC?=
 =?utf-8?B?ejQxNGZwY04zd01nZEd4b0N6QzFJUkV3VktpeHlOQlNlK2Z5RSs5YTlEK25B?=
 =?utf-8?B?NU1FOUQ2YVhpNCt3V2Z1OTZOVmRySmgyNkl3NnozNWVoRUN0YUV4aE9wdkZT?=
 =?utf-8?B?K1dXT3pqK3VWMG9zV2FHbnBXOW9QQ29RdkRqc0JQalFRMUhoT2xPWUZiOWpq?=
 =?utf-8?B?V3h1NURGejN3dmtjOHgwODV2QXRsb290K25NV0oweXFiWUx2NnkxMTU1S2NJ?=
 =?utf-8?B?MDhCY1RXaC92VDYyODhtT3BySDBOYkovZTJ4bDVCWVdTNmExY2hJRjkrRHBr?=
 =?utf-8?B?QjZDeHgxV1VrSHYwWVhjK1ZhN2ttZlU2ZEFnZVIreit4OHN2cXpaWE5SNita?=
 =?utf-8?B?UXF4RHZDaDJWVy9BTmdXQndBbmRRNWxuZ3VLK2gxdm1Wb3hZQkx1S05maUJs?=
 =?utf-8?B?Sm1LRWt6QW4yS2YwRDdaTTBFRnY2WjNJVkVPREJwdFRIVlNIbHE3cngzbU42?=
 =?utf-8?B?eGNvZkVjMG45RWJrWHl0d1hYY1l4YnFBMWVYUG5GaTBaeXpqalFRNjUrTWs5?=
 =?utf-8?B?cmcwTG9IU1VCdzJ6eGkxK3doSGFXV2Q4bXlhL3dBRytUOCtkT0tJOU9PQmUr?=
 =?utf-8?B?MzFYYmtlUEpzQURpeVFuT1BLaW9Jc1pNM0tJSzVzL2VTWXhScFhKRndOakpp?=
 =?utf-8?B?NzJZZFRkSlkyNC84OCtyQk91M0tqSlQyN2VNQjhlNVVnTThzSXp6bnJrcnlR?=
 =?utf-8?B?a2MxVXQvTTZEbWJaLzgyTFJMZnBxcmZhMHoyY3h1N0x5bExFdFJ3QVNpRDV0?=
 =?utf-8?B?NldCVG53NWVuUVhOUjNRR1cxb3grV0pJYWtoTWxjSXJUUTlzVVVJVTZpQWRQ?=
 =?utf-8?B?cnV3QzJPSjBubTlFWFRac3FoVElFMCtOelp2Mk1WV1VNSjA3bXpSRWVPUFFt?=
 =?utf-8?B?QlhrcHIvalpwcTZmTy9keklzSlAyOEJ3bkx5cjNmVHJ4UmhWYmxrMVNrYktk?=
 =?utf-8?B?R1dmTmNzWm91Nkh1WThQWDhmSys3NU5uSCsvYW9SRy9HRkhtNXBLK1YvQ3hB?=
 =?utf-8?B?SVFGUkZtYWlsOXl3Y25ERG9ZR1JmN1dhYUF2cjU0cWRsclRwUmx1YzhIdGFm?=
 =?utf-8?B?RS9HdjdkUFVmeFpjN1dNQ2pLWmVzZnE1eXZqekcwaTR0SVJTbnZwamFXRXBR?=
 =?utf-8?B?VFRDSk5aRDZUY2ZrUTQwUFhhejBCajIxcG42bmttK0FmZzJ1V3psN1QwM0xT?=
 =?utf-8?B?bWlvd1VjejhoQmxpNzhhUzI3dm5HLytvUHJQN0JnN3laYWpJODVBbnk3NEt5?=
 =?utf-8?B?MWx6WEVFNzJBM0pSaG05ei9HY1JZTGJKd2d4MVA2NWtIT3lCNWZJNlI0eGp4?=
 =?utf-8?B?RU1lbk4vN29OWHVOaUpQR1gxYStUV0wzVjgxNjBYdERLOHBuUm83TXRQdjYx?=
 =?utf-8?B?ZlFxRUxVb01KSjdKQmJRY1o4a2ErSzBTbS8wY09CTURCMjZxc094WGNJOUlV?=
 =?utf-8?B?T092aTVyWlZ0RHFuMGVIVTYzL05YWTl3TDlTYm1GaE40TjYxRXlqNEVja3Ur?=
 =?utf-8?B?WmIyM0FwT1NwVU40aVc4cG9haTZGUVBWL0s1ZjBNNk50ZmQxRGVOSXdzN0xo?=
 =?utf-8?Q?aGr8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzBrVDZTeXBIZGw2YVQwbnlpQkp3Yms2QWIyME9VMXNCNlhOdUt5cGl0bGxt?=
 =?utf-8?B?VDc2WC9XSTBVbG1QZ01nWFQrbFZHbWxENjgxRTJFNS9NVGNpbmk0a0t3OXRJ?=
 =?utf-8?B?YzY0Zmk2QlhpRjNlaXY3RDRkSmRNZDNWZ1FRNFpWaVh3bkNrT0dzZFErWFBt?=
 =?utf-8?B?Tm1FSStISjcyNllHb05RNWpmcm1jeUhIeW1la1FUVWFGUzcwdTdkTFRWVlo0?=
 =?utf-8?B?ZmZWclpncWlJblBFejZqNGl3Vm9YZFFjRmFNWjZFTEV2b0hiUXUvUlR4WlJ1?=
 =?utf-8?B?UkRmOGx2V0tKdm9kZTMyUWE3b0hhWWovS3QwRHBGT3JmOVZRL2RKOHRYc2V6?=
 =?utf-8?B?TlkraG90VGpXU3p4U3l5K1gwUTJ0SUY4RUJPbzF5U0JiSUdRUzFvZWN5TVJ5?=
 =?utf-8?B?M2VwZm5tcEdLUlVCTThsR1o4ZG5ZUzh0dG9MUWxrZEd4UXMrMFhubzQ5R2Er?=
 =?utf-8?B?WG03dGtueGNPSjJjdWdiTXpSb2pvdk83TWJYRzI0Y0phajZERkJUeUlGUmtP?=
 =?utf-8?B?ejBkOWlsNG9MYjdpeGd0aFNLdTcxVUhta1h2RzVyZ1B2MHFtK2JKaXYzQ1pw?=
 =?utf-8?B?MlVXb2cyLzdEcXhoSm02ZllsclpPQ1ZBOFZ0RlFUL1hCc3ArYXJpVmFZZ3Z2?=
 =?utf-8?B?bGhyd3NrVlRCT3VDMWVJcDl1NFVzT0tPMjRRcWV0Qkt3NHUxTXRUQXJTMVFj?=
 =?utf-8?B?NTY2cXBjNGdMVUhiaDVkM2JZYVJOWXJKaVVYd0xFeER0U0RMNG0vNTBVUVkx?=
 =?utf-8?B?ZnFuWkVDckpJZE1MalBXMUxIU1poRlZrUm5UMFA1azc2TlpYTzJraC9OSkJy?=
 =?utf-8?B?SnF3SXVUUUk3cGlsOUlzT01TZndjNkJxbi96WFNMc0IrRTZzbE4yeXY2eG9t?=
 =?utf-8?B?ZkF5d3hFR3V5dWc1V25vUVd3MEg1cG1wUzVqalpOY3BkYTFkQytHeGxxblZS?=
 =?utf-8?B?RDdvNVRjaHRvb2JCdXN4YzRHWU9JWGIvTS9DL1lKNi9IS0tVdk1ZNCsyQ2p0?=
 =?utf-8?B?TUo5bVJBTzUzdVAyMDFnOFU1TVB4NHk5WUpRTDFUeXZaL2tQZ2FidXJFMmlw?=
 =?utf-8?B?eWlXUjkwYXZQdkVRK0dmWVMwdFlxektKOWhwekhqbTBVR3d3TWcrRmtreVBF?=
 =?utf-8?B?YXRMdWh0ZmoyN29DaUMzV0FtM1FidFRTNnYzUVBodVYwVEFSNS8vbnBjdGp5?=
 =?utf-8?B?N2hDSXdweUlybTZsVUdSSFpCYkc1Q2gwZ1ZrV1E3YWQwMmRwMGtvR242UUlK?=
 =?utf-8?B?aXVVTDc4YXIrK3NVOTNBWCtvMDk5SHBqcmhrcENsU1piZk5qWEVTcVRIaEF5?=
 =?utf-8?B?MEh6b21LVjZZeGFjeWxqZ1plOHlCRHFmWTFFYVpWQlh3VFlINTVMdkVmSjRT?=
 =?utf-8?B?TGVsZ3RRR0poRDNsbjh6YTQ3cjEwOVJFb3lSMk14OVF1d0FoZllrOEZReTNB?=
 =?utf-8?B?aHVvUURPVHJLZzg2TlUyWEkrWHhvKzZjWWhOVSs5S0xLdUE0dHlUTXVOVDBi?=
 =?utf-8?B?RFZXRXVJUzlHQS9tTCswMnRaRGcvNjJTUlc4a3NyZ2xFM3o3dmRheU4rNEdX?=
 =?utf-8?B?c1dtS1lTcVYvQjZIMkJmd1BxcnBuNHFMOXpPWUt6MmYwTFpwTXdjSXNneUJV?=
 =?utf-8?B?WWZUa2NieTFOUXkvWnBEUENwMHFmM3pGTzFBelFKNGhSeG5OK3AzK29GTXEv?=
 =?utf-8?B?Skh1UkZUcnRHZVg4T3VjMStqTXpVMjE2QXhUSGxjc0pEcXp3Q1JjOXpYbUQv?=
 =?utf-8?B?emVaMDE5NXFVR256VU43Vjh0VmVFUUdQUzg2MlV3cEFkYStXSGo5ZFpHb0Qr?=
 =?utf-8?B?eXM4cXhkSWp1VHpmaDVaOXVvaG9zZWpEUEdNR1lvZTFsUmlBWkZSRXhjeUZN?=
 =?utf-8?B?MGJJaXRtT3BPZWIybktTZGlEZzJSbEd5M0NvRkZXNDlMYW0xbzNTUGhVb0pn?=
 =?utf-8?B?a0ZhOVZiQ3NCR0p2MUNTUVdkSHhuLy8zY1dYOENpTjdWbERRbVNRRWo1SnE3?=
 =?utf-8?B?aUltc3pTK1N1ZWJ0V3orMmt5STVyVFh6Q1RQdlVDblluUVFWT2lLRXBuNlhq?=
 =?utf-8?B?Zkh4bzdVRjJNSUVDTTR2MVA4cjMxZFNyaHRoZ1ZlSEJobHVkeW13eWlCd0M2?=
 =?utf-8?B?TWl6Mklucm9FNWl0VlduZVdhNkF5SFVIdVQwQmJXQW8yY3RZUGtOY2hKTWJu?=
 =?utf-8?B?L25WQzZncUNRUEZxWVFKVkhoL0RRVUt0Y0d5ZDZETm4wRVdqN2ZnbDViUEhV?=
 =?utf-8?B?NHVWSnBTb1ZRRmMvR3dzMHh1VW9aZENjdCtjUDdiaFdwNWJkbFdybnpUYTdn?=
 =?utf-8?B?dEpyUTFVQUFaOUZWMmlJekVFamVlb3k0eVduN3dKaGROaE1BdFAvRmVmVU85?=
 =?utf-8?Q?3tWMhxplQe8ZJ8Gz7IGQWtbTjUFiHFNPdJvC2UkJ02lDZ?=
X-MS-Exchange-AntiSpam-MessageData-1: j205jO1nDlxm2w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156637f7-1dd5-4174-52b6-08de5e40cf2d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:42:38.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xO8K/4kww5HJ17VSNL7pKNZb36Oa90B/2ToKdCWHhBJgr8pi6//iYkNhCFYFzRvmtgvq6bmx3CkViTYzz627Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262

On Wed Jan 28, 2026 at 12:47 PM JST, Joel Fernandes wrote:
> On Jan 27, 2026, at 10:02 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>> On 1/27/26 6:37 PM, Alexandre Courbot wrote:
>>> Add a macro for defining hardware register types with I/O accessors.
>> ...
>>> +/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can =
be read by calling their
>>> +/// getter method, which is named after them. They also have setter me=
thods prefixed with `set_`
>>> +/// for runtime values and `with_` for constant values. All setters re=
turn the updated register
>> OK, this still looks like a naming problem that we don't need to create.
>> Let's just pick either "set_" or "with_" as a prefix (it seems that
>> "with_" has won out, in the v3 discussion thread), and then add "const",
>> so that the name doesn't require explanation.
>>
>> ...
>>> +/// // Update some fields and write the new value back.
>>> +/// boot0
>>> +///     // Constant values.
>>> +///     .with_major_revision::<3>()
>>> +///     .with_minor_revision::<10>()
>>> +///     // Run-time value.
>>> +///     .set_vendor_id(obtain_vendor_id())
>>
>> See, that is just not obvious at all, why it's different. That's why
>> you had to write a couple of comments.
>>
>> .with_const_major_revision(), on the other hand, keeps the pattern
>> clear and obvious. No comments necessary.
>>
>> nova-core doesn't even use the const_ settors yet at all, according
>> to my quick read of the (very helpful) [PATCH FOR REFERENCE v4 7/7].
>> So clearly it is a bit rare, and the extra characters won't come into
>> play in daily life.

Great, if everyone agrees on with/with_const then this is definitely
idiomatic and clear (and not too verbose).

I'll respin tomorrow unless there is new input.

>
> I completely agree with John here, let us please not create a confusing A=
PI.
> I would much rather use a bounded! macro to create bounded values and pas=
s
> those to a single unified setter, making it a unified API for both consta=
nts
> and runtime values. Let us not use const generics just for the sake of it=
 or
> create special const APIs that no one but examples use!!!
>
> For example, instead of having separate set_/with_ prefixes, we could hav=
e:
>
>     boot0
>         .with_major_revision(bounded!(u8, 3))
>         .with_minor_revision(bounded!(u8, 10))
>         .with_vendor_id(obtain_vendor_id())
>
> This keeps the syntax clean while still providing compile-time bounds
> checking for constants. A single unified setter API is way cleaner and le=
ss
> confusing than having set_ for runtime and with_<N>() for compile-time
> values.
>
> Is there some reason why this will not work?

So these setters are really part of the `bitfield!` API. Bitfields are,
at the end of the day, just integers which we will very likely want to
declare constants of out of individual const field values. This can only
be done by using const methods, and a const `Bounded` needs to validate
its constraints at build time, which requires the
`Bounded::new::<VALUE>()` constructor, and by transition
similarly-shaped setters to set fields at const time.
