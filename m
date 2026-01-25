Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C45405F7;
	Sun, 25 Jan 2026 01:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769304837; cv=fail; b=PptkH7JbP9BGipctj1PaWn3ymaYyUYsxN7VkulCNCnKBRHYhWKXYelQ8UTnEstDyRTfbPPZqSrjN0Sc1NIh9OA2LydT1xJ59dObSIRMMr7cTw/Tw0mtTf1ntPyL9sMblsXEoxSDqzPUQMTKrLQrXJY/y4Q4+icSr707+fSzX124=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769304837; c=relaxed/simple;
	bh=0JBYykxF7Evn3WtzE53spYCQoFJuOmrphZ9/de88vrE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=m+ZI59xy6Q2Qapx7f3w36nCLv6V0OZcM5q17bt3QsqJ+Wpx+VxdH5LL5I7oG6QCEiuL6E37gJdebDnTGA90hgbQZjX4WywGQ6J/vjhx7xJDpR6UQ6C1hOphbvKuXg/yqwEA8k2iN0wHF8WNyM6o8IR1QFYXDMv3si4sql4nw8ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AgLBsqsD; arc=fail smtp.client-ip=40.93.196.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AgLBsqsD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxFnuPQrKQXpACACwNlPCTbjlXRI3FSc4qIi7DyJ2s35VsOJ2tdUlVxUp/1bEym4P9Kzl/HSsgZuB054l4Vm09e8TASpHzKZMFnHt1/TavEAzhiF3Ln5HBYDUUUBAex/m0p3QhFCaQdLm5T8OVRlI907zaxmglAf5ao+KdcJ+Je3jTA3MyQRvhaG9znmaFWiZgDzLAcXdyBV027RIYipZVpAMgdWCSbTGc0/KDhMvrIkX5/qJS4NSkp5Hd7XxAje9i+ktdwcs752HU4RivKQ1NdujT2fs9CK2pZNAEuw2RAU8atSGqIoV4n23dEWGWeIYQv/JcIywU3IRLZyfR13dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JBYykxF7Evn3WtzE53spYCQoFJuOmrphZ9/de88vrE=;
 b=HSjyIw48JOh+su7wI9++YoFcvDZIWvZ8TsCtQCUso7ok+CrYoqpf0SC5sRPnXCPUcVVW2CgTAt4CyoeNNGooXa8InnZjW8LWvDJgKROnrrV0Sbqk1d3LsAhghpOWhkM7kF6k7QavIcyuI43T9d21FVHUt5R1POuYalS13sp65BWWhn6CECekJmySOsvZHmZdTMuTUXrb8P9cVu9ezEEGFRX8Mgn4ddxY4ukY3aXbQnOhaN8mYksNFqTF1Kf8R6duZY39Qp4FW7oxFE5YwQy07yUkJg3OyWkc/x4iId59r1v+tAL8/kekTUOa6uFu1jCw1n9563zA79hrPm8iYUD0oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JBYykxF7Evn3WtzE53spYCQoFJuOmrphZ9/de88vrE=;
 b=AgLBsqsDs82Hy5GE2KUrdGzBB0SEYn6h81ynuXDPlU6Qc1Ti+yfoWGUu0BgL6NYlHb/PiXs0CJODrg5BnDkYBciR1SuvHlSg4r1KilRBkKSKTKgSFB6k33horNmAKso9vfihvC0DuaUKyZUYIZXI6Q5wUKQFE8bivPP9I1p1bveSq+msvzta4KbNIZ3VGYZ8AqIoh1hzwBzuomj62/zDafsEOoEWpCu9QyVxOe7Vt/qorw3iiFqE6cMhlSseP9JppcqHnRXZ1xMaaQgpQ21e7YfhlfShxXzwToDtp37VVekuf9MyDzLvdOkdpEcvzvHSXz5I0FC+HbO9q7urR2mPZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sun, 25 Jan
 2026 01:33:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Sun, 25 Jan 2026
 01:33:51 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 10:33:47 +0900
Message-Id: <DFXA7SX9O1K6.2H4E9IDDTYNIJ@nvidia.com>
Subject: Re: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
 <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>
 <DEYMFYQH2GY0.3HF506HL8OHY6@kernel.org>
 <DF1DP93V7IQ2.2BA2EV61WUA6C@nvidia.com>
 <CANiq72kc_SY9Nsy0kYDa__Uqjt3WqNnT-yfqvF=1La7ox2Fzyg@mail.gmail.com>
 <DFVXYNDE1USI.3B6GIBDMP36AU@nvidia.com>
 <CANiq72mwvMBymD1Zt74o+isB1r89kdXZiq8fmX-9vOd9JFcY_g@mail.gmail.com>
In-Reply-To: <CANiq72mwvMBymD1Zt74o+isB1r89kdXZiq8fmX-9vOd9JFcY_g@mail.gmail.com>
X-ClientProxiedBy: TY4P301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8e86fe-2ab0-4338-e488-08de5bb1cb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEJEY3VsRkRRMzRoRnB4VzAvYW0rd0xmVHdGS3Vobkd5dVQ4Tjh2SHU2QVgy?=
 =?utf-8?B?OVN5cVZnWFJ3OEtSYjlCMm9DZHlCM3ppMEY1ODRyRnF4TDZZMUdwK21ob3J2?=
 =?utf-8?B?VFB2QVZvZG5TaUUyMGIwQzI2UThWeUUzUlNaVFJ2L3RiQ3dXdUVHaEh5Z1d6?=
 =?utf-8?B?NktMUEhOYTdrUXNyVnhiM0VZTTJrTkw4RGpyZmIxamQxS00zV1RNVUcvbzNw?=
 =?utf-8?B?a2xGcHo4alBPdmQ4cVZKVlhtenRYdCtUTGFTMzR0VzlpRk1KbGJGbENrS09J?=
 =?utf-8?B?MkpGa3luNFJEV0pqK1FnRzhzUHZCbkk2VENBQnMzZExEWDZKS3EvWkFuTDZt?=
 =?utf-8?B?ZHpjankzSGpubXFEOGNpZ0wyT1R0dU9rUG1aUFZOVUZkSFZIWnRiYVdWQ3VK?=
 =?utf-8?B?R2dUbnh3TXlhU05qL2t1NFIzenRESlN6S2h2enlEaDRtU20wSytzOVFoL0o1?=
 =?utf-8?B?aHhZNXZuMzFFdkFGSEwwNTUrTHFVMm1yYlgyNVN2d21oS2pCS282NVlIY2pk?=
 =?utf-8?B?N0dod2o2WWVROGtXY20xZHBJYXR2a05pZUZjemRETEhCUjZUM1g3Y2N1clo3?=
 =?utf-8?B?MHNpMWVqS21hbWhjTzYwejlDQmVrMXN6TEovemZHa3h4VnR0ckU5WGU1MEo5?=
 =?utf-8?B?TGE2czNheE1seWViRTNIRTBPWWlyeWUwYmFHZEs1bnZiMnpjUW1XNnoyQUxU?=
 =?utf-8?B?a2V5c0NSNjRXdTI4UUt2cUI1QjVuRm1WZEo2TUdxRVFRUzgrWjVoN0tCdlVV?=
 =?utf-8?B?d3ltUEhXekpuQm9RdDBzUGd6YTBjbFNFT3U5UElUSjBhZ1crUmJncXh4KzZk?=
 =?utf-8?B?SENZRUxLTFFiQXFPWDNaeGFtUjc4M2NocXkvQTAyT0VCdnMvNHFYZlA2NnpE?=
 =?utf-8?B?TVVvbDV4Ty9jYUkwMkJCSDY3dW1xc1hQZnNHcGN2TjhMMFRNVktVYWRtVU1y?=
 =?utf-8?B?V3UwNU9ITFk0WDVJNUhCeEt3Y1ZFMVoyQ1JBL3lDYldPVlFvVEFQbmFmN2pm?=
 =?utf-8?B?TlNXT2l3NmIvOUs5eVRCTmFFRUtqQUJJR1VXRzE0ZjFTUWdyc3hnNGo0OHFW?=
 =?utf-8?B?UXI0T1ViN0VTT3p4VFJ5a080OGo4d09rWStsRTc0NHp0aWpDMGdHRjRVWm5l?=
 =?utf-8?B?Um1FbVFoSi9YUDU1WXhWemQ2WC9BekRPS09ubEVrYXp1YlprYWdqOXlqQUhN?=
 =?utf-8?B?NnhEa2lTa1JvaUtkb2RhWUcyb2dhOEYxL1MyQ1F6blR6SmhQNUhuMGdRQ2ZD?=
 =?utf-8?B?U0hhMHVDUFRybFdIQ1ZMOHVTRW91SG9vZU5jaGQwRmRFaVExSXViVTR3Ritj?=
 =?utf-8?B?c0xiVTFXb3RVK2xFblJtZThrVU5DWUtFeVFpd2drb1lGT3d0WGU5SzBXNVE1?=
 =?utf-8?B?OVNXUUdzTjl4K2ZrOXU0ZTZoUEhyMHc3emVhamNmRnp4Lys5K2IvTU5wcVB3?=
 =?utf-8?B?VWZYNGk5VkgyTzU2VWJIMWh5bjFGY1ZrMUI2eks1WjFoWHdaU3AzM1hlc3VM?=
 =?utf-8?B?RnVjcEJHOU5JQ0hYVldLY1BES0x1aHZ2OFhuV2xJUUNsTk9PNTdJcVd0ODVu?=
 =?utf-8?B?NXhLRHo3NmFsVW9SRjFwcGMrRWE5T3dja0VzTno2YjUyM25nTHB1cnRCNVF6?=
 =?utf-8?B?dHBBR1NHSkl0aUlVUUs2a2ZGeTcyL1B0Q2lkZnZlOHBPMm91YUZLUHhkK2R4?=
 =?utf-8?B?K2VOcDAyVnQ3WnNsNnNES0ZJT2xYc3g4cFF1VHo4UTFDM05vOEUzQTVjVFFQ?=
 =?utf-8?B?QkU3cGlFeE5ZQUROOFR2cW9TTDFGNEhqQ01wb0JhZCs0Z1JFYTdkbVpHQkVH?=
 =?utf-8?B?TUhyTzR4TUdiZ3B3WWlTWG1WajFWYUYvYWFtUEc4ekJEWHJEa0w4amJOQno1?=
 =?utf-8?B?d1JJTGpSZTdHdEJmaGVGeUpVT0ZjeFBOandZSVBOUVdJWmN3aitSRW1rMUpI?=
 =?utf-8?B?R3dQVU1ENXhmNGFVYkNKQXB0RXJiOVJWem5uNnRxU1doUDVYNmQ3cW0va1ZD?=
 =?utf-8?B?Qk9WcTJpMFdOV3pGVElMdSttazI5UFlNVm5WZFVJcDVVQXZXa25kSUVkMWI3?=
 =?utf-8?B?NHNYb1QzV1hEb0RpbC9ZWmlvUTNwbVZqcXUvT0NZTVJIRkl0Z3lLVGFKT2V2?=
 =?utf-8?Q?PjbA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkVuRUp5NFdHTVhwOVRuWDc1eEVOczJSN3gvdWdINmtNYlNscW9OUVN1d2xz?=
 =?utf-8?B?am41ZWFqQlEwOXJOdlN3ekJCTUZHbWtzVXJreHNLVWhaeE5XUkNLWUxpMDZM?=
 =?utf-8?B?SDlqMGQ0NnBpM280bVVQeVBmYVBNYk5hSTc1bThTcm9oRElzaFZLQzU3SUl4?=
 =?utf-8?B?UEVuVWVrZ0RYZzBUN0F3ZlkzSkVnME1ndFZDeTBRbWxCUEtuV2Evdk5mR3N4?=
 =?utf-8?B?ZjJQdDZ6WXZ5d0piS1piekJvbVNMSGY3MkdqVVR1Q2VzVE9sT0lWRGRNeWpp?=
 =?utf-8?B?NlVWUTIrWm9EZzJpbTdlZmt4TXFRSWxKcVlmNmQzQ2llbmN1Z3hwK2Q2ck5H?=
 =?utf-8?B?SFdzVVZyNUx3ZmQzQXk0Qko3UWpMUXlGTGRJako3VkxHVmVpVTQ0K2dmYnRK?=
 =?utf-8?B?K0MxSjJqaEYva1c1ZmI3N1pQTFkwQVd2dVpyc3duMnlWdWl4MXN0d0dOajlw?=
 =?utf-8?B?WjFsU0wwN1RYSU9wTkUrMU9mYWxPMkp5SFhwUGxpVmdhSERlbHdzanp0WUJx?=
 =?utf-8?B?eWlJVU1BMk1IaTcyS21Wd3RvYTRpY2tRMStXa2ZjTXFGRHdueEE4SmpienBM?=
 =?utf-8?B?TXBRdm9sYTFoRXRGR2N0cm5SZFlHaWwvMnliQ1pheUFpd25KK3FEN2RCMFFx?=
 =?utf-8?B?UmVlMTczVWM4NUd0c0dxUCsxQ2ZoVEQ2dElyalJmWDBSUHpOWjQ5M29MKzlQ?=
 =?utf-8?B?cUNvQWpOK1hiVFV4RFZQRTZEek5oUFBDaGoybWhUTmhqNHBZOC9ZdWVHT1V3?=
 =?utf-8?B?aldzenp1TFNGWWlHS3BpM1BIMm9hRFFvYUpLVG15QjBCelZoZ3AvUnVQNE45?=
 =?utf-8?B?NHV4QWVCOEZUa0d5YlhJUDhaNXVKTG9ZYkQzTXJHWWJxL081VWVBMWlaTmgr?=
 =?utf-8?B?TlM4cVZDOTRkRjhKbkZLYWhHVzNCOTRzNUsrMXEzT0p1SysxNXJWOEI1NUhM?=
 =?utf-8?B?MnUvcndzQU5HZ1hrRE9uUmZsNlhZZjhzaWdLMnBOUmVBN21DL1dONnlIYjdN?=
 =?utf-8?B?Q0VJdDZGU3doY0dRa2tWamppZHJvL2VQV2M0eEY0YjF0a3QybGZ2emFQeEpj?=
 =?utf-8?B?WVljaHY0aVBaR1B4ZGZRMUo2UVIxcGpVR1RQTnNsVFZ0RDd6dnpQdW5VMnNM?=
 =?utf-8?B?cWloVmVucS9LNWxMLy8wS1FnNWNFQ3lSM3ZuOWJ5bXlDdU81RDRNdi9ZYVhs?=
 =?utf-8?B?eCsvbTlzaVgvUC8zeDAyc1kvL25MRlF2a3JqY1QvNFVNalNKb25HY0pmZWl2?=
 =?utf-8?B?WS9iMU0zOG9aa0tHRnJUVW81N2F4QWFIRCt4N1RKY2Yva1d5aDc0c1cxbjd2?=
 =?utf-8?B?MEJoaGRTdVpZWlFadFFQdGZ3SWg5aHVka2d0ZlpoeFVnR2tNL0p3RllISGlF?=
 =?utf-8?B?bGVLTHVYM1V5ZVE1Q2Q2dU1WbWFBYjE4Vm9XMXFnWGljMjYvcFVjNnord21R?=
 =?utf-8?B?ZWFNQnBaM005d1NYTXVWcVpBY3I0ZGF6ZUlFdXpROFBHQ0UzMDR4TmlIOFBa?=
 =?utf-8?B?bjBiZHhvT3Nva05ENU11dnNzNU1sOE9MMEtxT2dIWkxiZzBsNTBUNGpWYXQv?=
 =?utf-8?B?MjI5aFBPTWxUbjhuby9ObXhFUGlieEswQkp0b3ptSk1JdHVKT3ZTcm01ZDgr?=
 =?utf-8?B?S3YzcnhRcmVMS21GQVJ6RmJPMURkQUwwTDRlQ1B6UitIZnBxNzMwQnU0eW4y?=
 =?utf-8?B?VE5LUG5iMXVRaS9VQ2Vic2lZYklGYjZzcUg0MU0rM2IzQ24xbWQ3cmh2Qzcx?=
 =?utf-8?B?cEVJcnFUdWJCemcxZDN4RnFncGliUWZMSXJSVlN0cS9MdXI1L0xITHVTcUFh?=
 =?utf-8?B?Y3BYS3JhdmNFV2N1alNYRlZjM3kwek9QdjBrVnNLc0c0WGJIbi9DYmtjT3dC?=
 =?utf-8?B?SFp3VHBrUHo1d0RTRUp6ZEtmYzdGc1VRSHBsWXdqQW1udWdEa0dvaVFveElC?=
 =?utf-8?B?YllkYmh4UzV5UFptVGNQR2h2V2xudnIzS3VUblh3RCtZTXJNTU9GTytCUWlQ?=
 =?utf-8?B?OUFYQ29qQWVUbmhuR0tKTExtcXM0akplSzc3aWt6cjg0S0hrdU9oUVBrQWhv?=
 =?utf-8?B?WWg2b3N1eDlGZVdvQWRBQVlPY1E3aHRBem5MK0dZR1BGck9WMnpVN0J0NW12?=
 =?utf-8?B?TE9UMzZnUFpGK1hxSnowK1JQVjF0ZkFkUnZRaUU3Q2tMQlplS0ZHS2tPSkZT?=
 =?utf-8?B?aFpUVFdBWEFySFhzVHJueldZSWVnbjBBZGtNRXo4ZzNxYUw0Y0dEN2k0RlI0?=
 =?utf-8?B?ZGIzMnZMVExYODgyUGg1bnVPdE5yMVZZVUREWUtoQXRFbkRtL2ZYQU1SRWV0?=
 =?utf-8?B?QVJtejMvbnpOdDhnK0ZEYUg4Q21MVHNIWDVucDdwOFpRazBKcUVjcUt5QVZn?=
 =?utf-8?Q?KI5wIPZgpgl1CX1EzVBVZxaeZ9XEGw+KAGHqdOAVf+UTi?=
X-MS-Exchange-AntiSpam-MessageData-1: 9wFIrgtZSZ9HNQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8e86fe-2ab0-4338-e488-08de5bb1cb88
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2026 01:33:51.8599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7f+u4XVeODAVsgVtT5bdAxd8PsTwe9nG94tq9Tdqgjc1Sel2e1heuqynIf4BYq2UIoQDoe9Qxg7ZHrNb1+33dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693

On Sun Jan 25, 2026 at 1:17 AM JST, Miguel Ojeda wrote:
> On Fri, Jan 23, 2026 at 12:45=E2=80=AFPM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>
>> Actually, the nova-core code that depends on this won't cut it this
>> cycle, so it is probably more appropriate to merge this through the Rust
>> tree.
>>
>> Sorry for the back-and-forth and last minute notice!
>
> No worries, I can do that -- do you want that I take the second patch too=
?

If it doesn't conflict, that's probably a good idea yes!

Thanks,
Alex.
