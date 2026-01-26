Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205FD33987A;
	Mon, 26 Jan 2026 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434147; cv=fail; b=YWmk/bGT5yeN5YJdflY3L85L+drkATxu8L52Xb85kR65X9UXmdijoUs3GpQpmOnoIF2SExeaXnmWgrpUP4oiBkuBBA1ZeS+MWDK8k6XwYcK55DUXmRqUTDnOFe3yyyvKGQgeSS66764070e+TMkk6f03hdVi3zpC3LBCPrpMul8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434147; c=relaxed/simple;
	bh=94a0GfIIcpNG4qFW/FtzPoI4PHKALm6qq5o403n47EI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YBQ+/yKwOfsO5MP9OQydNqDHFN3qu4t6id4G/bNcEh/idTcsDCBdC9mRLSNmz7KPqCzJGOwfPTab7QqYrFnpz7fRsmk8AoXlXFjLcT8vBjBLwAh6MW8DJYugMUFhthT5acc+6SHMdYur52WbkBb0M/hZukKdaxuX3lFC77EJSiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d2GSHRlN; arc=fail smtp.client-ip=52.101.48.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d2GSHRlN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju5IFLwBjWTyfa5dKMhaSBPe9VYaP0cUrJJQQ0lAXNF4AyXqFYJK5GxclI+5BCWhA4/2O6263CC/8/qqbnxIeKRfga/U9T4bpu47yJpQO4G2X1NQLvxL/QR9ZX06EF4LItEf5jhn9VNjJtorfhwvyKKuEuuGwhkhIbRLMf9oY6KFAHQRM+XGLbFn8M1Ai1/12GL1XEd0GM1HUH9t06ldwNciobefbMjeVgbcCqyTZlH4aTJAReq5WlZnRCJG1jtu+2QjXuNPAgZzUBunUq7kn6gpeZHkDhiwPbxyRUdYjk2FoCZf6fAxzSpUrTOx9EevhRQGgWvl3CvwExScn+GHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idq7gFyxrdFRzym8TMUz1tq5ZeWxC+YNOQmdhq/3BVk=;
 b=L465GJ59CAi8Ixaer0cyAfUZO5OSlxQBXsbVkgVlVFxa7nBdOOZ5tYOSOO0bYM86lGlvNHfMplNlnx25PNBTymYDKAP4sghDHifOP9GRRC2J8NaDGxseRmqNZLSWaEcBZeW8fDFIRdaqQeGZIVmciynNn9aVpHCJtTqHp5tcs5KbX/NQQp3icqauQ0CKsxK9cUqsdjGhaBLQQM0Ku3YveXMqRbURSKHUrFdXbBikxz+IthywC8maA6H5lEx8NZV02+3QDGHVmOtIFhJn7JOUod56ZFqP0Z+gHjr2rzv+sRVbQ6wsxgQy4GhXRUfdm04PWwTDQw5BEYzFklPwjyjRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idq7gFyxrdFRzym8TMUz1tq5ZeWxC+YNOQmdhq/3BVk=;
 b=d2GSHRlNMiryRj0Fks2azcn7mh7hunDPoxjrKnUajZleTnwjyybIpsSIAXhqkA8kJi/hRyBaUPKFSksCy3nFVsxsvk4qt4u9T6lgoRGJmT56eMZc2QWzgmV2+79P1lkw113p2ODClSiCQ9CPxP2iJ///Q2tjGCHmb94orQE5RMlrSeIDo/lSitQG3l4jmmR+cXXFNcjv+wAv6dToJUsCpCX1PHV8E/KnSwvTo7qrZrKEu42g9u3SY3aKvv9FmE1i5TKfHhabLenqCMR2rPvsYnebo5+tyTGsd0OoLtS1U5c7kJseBwT4W750ricjRyLj23RaRRqLFhmBmywpw7HzpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:29:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:29:02 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 26 Jan 2026 22:28:41 +0900
Subject: [PATCH v3 2/6] rust: num: add `shr` and `shl` methods to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-register-v3-2-2328a59d7312@nvidia.com>
References: <20260126-register-v3-0-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-0-2328a59d7312@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 3913a41c-6958-4f18-6d2e-08de5cdededb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elpTS3djL0JvTjVrNXFNcWN2LzFZb2dNenZhSG1wK0xDUlpHQlA1V1cvRThh?=
 =?utf-8?B?QU54amZ4Z043cWtVaTM4Y20reFBCMnRKd3AwLyt2dWpJRXB2bHRHY1A3UDhl?=
 =?utf-8?B?ZVV0K1daYi9mK3QvSFhWZUVWbzcvSkdsZFJQK1dLWnovRGpLMyt0QnZBdE5Y?=
 =?utf-8?B?ZngwekV4amhyUWUwNWhkS1ExL2hYbGRLUlIzRHQ0NElmRzdKNmlBVzE2WHhm?=
 =?utf-8?B?MTY0RHRZUXl3dFphT1hUeVk5d0lmaER0TnhQVTgrYkFseXlEMTh6VGdZSE5F?=
 =?utf-8?B?Z2JCVUN3bmRUY25YV2k5NlgwdmhDdXpCVmJsU1RoSFlTTUVaak8vSWVjbUth?=
 =?utf-8?B?cUpOa3lCa0dWdnd3U29DRUpXUDFxdjhRWlN2OS96c3dCUU9BUitPSG03MzFL?=
 =?utf-8?B?ckJkOVZ5MVQ1dnhidndZb0hLY2V5T0VsR1dNenpvbmRNc0o0ZE9xN3NwdVNS?=
 =?utf-8?B?U1lkc2swdDAxYS9YQ0ovNHcrR3pZSEhYeFhlL3MrUk56VDZDZEQwUW9BUmxt?=
 =?utf-8?B?ejJjLzl4QUtmVjBaQnFpMTJsY1lmODY4SU5TdDdidnFvQkZ0WTU5WDdIdVBr?=
 =?utf-8?B?TVpGUjBSK0Z6TTF6aGxTTXhDZGh6TzZENTdQZDFNY0gwaHA0NkdXZDZPQWRl?=
 =?utf-8?B?OVVaSzFKdDFtTnZBeHVwRjNHUmt6SnVBMXEvbkFDTGlDaTVqaEhkeXo0VTdm?=
 =?utf-8?B?TUlUekFiT1p6bzJlN3gwVHZ3Y1l0S3pPcGJjMXZteUFMRWVBQTR0NndhYkVT?=
 =?utf-8?B?c0h0dlFJTENUQm94YWZWdnY5M0ZhSmQyalRteTZKRnlnLzhZN2hJTFRIUktQ?=
 =?utf-8?B?MXI0clZtTGNibmtML2JqY2RYUC9OTjgxMHlEWFBIZ1hVUWdLT2piQVFoSUVW?=
 =?utf-8?B?azFGVUlrSCtvTXpGV0ZaSE9Hb2VrbXRDNFY5eUJPT2Z4QjVEVnJYVXFFTUVq?=
 =?utf-8?B?TVVSZ3huSGtpUnlaN25ud3lsT2s1SmluQ1dkQ0d4eXZLTFR6Z1NxUnhoMnJq?=
 =?utf-8?B?UVkxb1V1MUhKblhjcFFZRUFnUktuMkRnTFBoRFcwQUVJQm5QbVgySmc5V2pM?=
 =?utf-8?B?czVyYTN2V3doZGJZaDJGMU9scFJxaG5iQ0o2TmNJWnJPTHlxZGV2UTVjUlBN?=
 =?utf-8?B?SzR4cFJ0VVlOVG8vQng1VVJ4WXBYcWNyTFRFS1VOTDRaL05sNVJzdERlNm0v?=
 =?utf-8?B?NjBnZU11aDcycm40bVhFRUkzUXFRTlFNbzA5Z2hhbnBjZTBhQ2U4Ym9acnpX?=
 =?utf-8?B?aDQyeXpVSHhETi9BblhXTy9BYS9oZkNBUGNkU0lNc1k1V3Y3Z3FQcGsycGlG?=
 =?utf-8?B?ZGpRaFdnRUI1cVEzOGJiemsxaE5VOW9tMzFnNUpDNmI4QTRaMGFNejdmZjBh?=
 =?utf-8?B?M2YwSnZmTnlwcVYySnM4YTlKSi9CVDFLL3czU2gxYy9acnhiOGNoRWhqbTFz?=
 =?utf-8?B?b2YxM1JqM1hzSzNyUVJndWxhaUNPTEExdjJqWkc0OHpaZ2U1Y20veHBOZ0c1?=
 =?utf-8?B?TGxJVzhRU0JqeTB3T1JyQk5yNG16ak5iNFAxUWttVUFaQk5RYThiYlpWZEVu?=
 =?utf-8?B?eHQ3YktQWWZwQVlQK0N6aG5kWXoyNUg2MWhTRk9kTXdQeWFiTys5SUh4WDFV?=
 =?utf-8?B?dk9DTE9RRCtHV1M5NHl2dENXWHJ1MzdGU1hGMzlyc1lqZVVLSmtvbTdGcytl?=
 =?utf-8?B?NWY5U2tJcTZUSkMxTFlYNkNQNDNaV3ViV3k4VS90MGVGd3NwbSt1WG1Rc05t?=
 =?utf-8?B?WnhuSnVNeE9rMDF1dW0vNE9EQXJrdEthTWl5eXdjZUpwVWtKcm1xTzdpQVRp?=
 =?utf-8?B?RzlMTVRwUDQ1bUFKRDJwa2V5R2xYNVpQMkdkNHFxdVM0eU1HdkswZVphMnRp?=
 =?utf-8?B?SE1ySWFLdEk2cGNhNmRSNVlnT2RuVk5tR2dqVnZncVJ1QUdiSGRCQUZNaU5D?=
 =?utf-8?B?aDFYS3hPNUlPODBISWNUcTdSaWZONTNjYXdSR3F4WjVlZjF4Q2RUNmNPS2cx?=
 =?utf-8?B?NEc2b2J4NTdpZTE0aFc1Zm9OVVZVREhOU1FjY2hEbnJ2ZzVtU0NRZ21pNUM1?=
 =?utf-8?B?WTF4YmREd1I1MVkzZEpvMHpzd1puSFhiL3JMZnZtR3pzMmNjU20rVlE0dTA2?=
 =?utf-8?B?b09NZDJERHhhVXNldndTbko4K2EwTlhjQmdra1hxR1dObnc5S3VwenJ4MDRK?=
 =?utf-8?B?UUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHdQTDVkNnY4MGNhUWYwQ2tmTFg4ZzBmTzhtRmF3RUE0TzM0ZUxkS0RZazg4?=
 =?utf-8?B?eUF3Q01JdjZlTzVyTkVVdjBXM29Ld3BEYVkvV3cwSHFhQzJxQm9vR2QycFl2?=
 =?utf-8?B?anU5M25rZW1ocW5ESHZPVHlyajJyUzlIamUzNVRweTh0MW5IbFRQRXMzaFM0?=
 =?utf-8?B?MlNUQ1ZCMXkyT2twVHBTMm1wZjVkMjZYRVhhTFBibXlGcSt6Q2hpLzNkRjVq?=
 =?utf-8?B?Q2dYekRSNUZkQXRPWjBxcDJBbkhib2RSalpNNWdRY0UrMVBXNmJvSi8wV2FX?=
 =?utf-8?B?WFdqWC9PaHBYZU52UkRkcGpONjBqNHZvczdxZnRoWnd3R2pXNU9iWm5lc1ZE?=
 =?utf-8?B?Z1Zyc0t0b2dMTzJHYy96YzcxTktQVi9iendDeTZmMEt6RWwxWWh2dk9KU25S?=
 =?utf-8?B?K0RKTU4vM3RJc0ZWWUJidFd5NGV5M0NsejE3c2FLdFBjbEFlbFZkWXhnTTAw?=
 =?utf-8?B?cG54YXo1QzU4UU1KYzREb29YbzBiZm1qdWdMVWx1QmhVVUEyWFkvUUFkbGYy?=
 =?utf-8?B?dDdRcXh3cVd1elN6b2c2SXl3OVg0VHFPaE1FSCt5UVU2NUc5QWRTQ1JQRWJX?=
 =?utf-8?B?MW93ekIzSjdSYnh4OEo5ZFV0dFl0dXAwM1Y4Wkw0VDNkSnJOeG5IaGdxTDBI?=
 =?utf-8?B?cWlyanpDQ090K1RCSU81RUlpQS9ndmpQdE1CclQ4YW1NZTRVSnhOVCtTa0pI?=
 =?utf-8?B?bS9zTk9mYVNKbURpcnk2eGpnWXBaUFpBK01tem1Dc0JKVGxjQlhNWUt0S2ww?=
 =?utf-8?B?c3BpbW10dHpVczYyL1pEYjl4Vk5VMDhEdkFNa0F3c1Y4RCttQVlrS3lZM0l5?=
 =?utf-8?B?Q2U4UTJTWVd4TG1kZUxrRDlaVVBqM3NmNklObmFTUzRlaXdPRTlGb1FydVN4?=
 =?utf-8?B?Z2FPRWFLTUVSOGYwRk5PamdaMVA4OUF0L0tiRUJjdTQwczE3UWFSYm40R3hk?=
 =?utf-8?B?ZTlUU09rcUZtbmVyckJJckVQMGpUOGhvZUI3V2VZZExqUnpsM1hIOHhGTDJi?=
 =?utf-8?B?endGUjBoTjVqN01lZDJKRkRNc3d6UWhjWEpSY1MrMGNHbVhoOW4yQWlSN3ZN?=
 =?utf-8?B?K1VBbE0yUWF1MTVNb1hTS2loZ2MzZ2h3djRoQnc5a1FQTXdXTHF1UkNuT3Yx?=
 =?utf-8?B?TnhhZ3VVclp6VWpRRjlxNGQ5RUxxZmE2OVZTV1ZOV2hLb2doaUlsa3BZYWNl?=
 =?utf-8?B?d2VxOEJSSkY5Q00zaFZPUnorblhUS0FNUXRKTHFhTXdTMUlYek5ad0M4RXZ0?=
 =?utf-8?B?OGxKUmFKOGVrYUNQZk5SbGUyYU9selRDbE9MRTgrSnFqSGUxN3E5UnBkemk1?=
 =?utf-8?B?RGVNVS9DMk1QUXJJb1ZLUERzdERoWlJERHQ4ZVlvQnovbVZLYnFkbTdrUVhs?=
 =?utf-8?B?NkZrY3dsNzlIK0RHSnhacEViMGlIZCtIcFljK25uWWVMKzg3UFdkU3VNZVlD?=
 =?utf-8?B?TnBRL2kxaUJOM0VCdDVWQ1UxeWhyMXNkQjVIa2dtVU5rSEQvQlljd1NaTWIz?=
 =?utf-8?B?SVNLUUg5dysxTHhLd3o4VlExdGVheERLRjd5dnZqOGlncGd3N3B0bnZYc1Ba?=
 =?utf-8?B?OTBVNXk1OVMwT2JPKzhEaitMRElyY1IzcTNoY0pZeER4SUlWU1NaOElGbHZ4?=
 =?utf-8?B?K1RNcGhXRVlybkhKNk9SWnR5Y2lGMUpkQjJNSkEzV1NwU0lLVmQ1bWFsclJy?=
 =?utf-8?B?Z0I3NWlLM3N5SFl3UnZyV21razRORFZuMUpQSU5Va2k2UFJIWTY1L2dmd3RD?=
 =?utf-8?B?aTFqOXVZR3ZZcTl4ZGJxWHpMWTMxUko0UmNTRlJlNTNwTUs4OExmaEV4a3lU?=
 =?utf-8?B?QTJEVGc0dUFRamdCR1RlclExMThaTUlBRWp1Q3V0VjY3cnlIYXBOak9kY0Z0?=
 =?utf-8?B?WDZEWkptQ0tKTS9uRkpnVk11SmN3L3JRY2pFNDlGd2tFbndxdFlhV0Zwdmhq?=
 =?utf-8?B?Y2xhUElOTTRmZkRvUnlwMG5RbVdUZmlIbkU0OUU1OWs4U0JFaGJwN0RIWnp5?=
 =?utf-8?B?WmJUeDhGNXNabDAreFRLWnFUaExTTmJPMnRZOVBUeEpUMTFOTnZrRnU2cHlt?=
 =?utf-8?B?K1JGUVhaZ0VBczFQa3dQRWVubE5MYWwxV0xwSTBsUHhsbWdUUDBvYmtoZUZY?=
 =?utf-8?B?VXdGN0tTcDM4eUpPc05YNitiZ0dVbHcrOE83MldkbHRudXJLWHdkQ2laY01U?=
 =?utf-8?B?OFplcncyQ2FySEZIQlFCMW94b2hEazlKNEpYbXhadVRZUWpuTldSZUJhQTBC?=
 =?utf-8?B?SUV0aDlwdm8yZWg1T0crcURtUGFGQXlkSkVENzdwQTNyV1Q1Y255ZXhSWmlQ?=
 =?utf-8?B?SXhqL3FmbHk1d09XTWRIbkVJTm1hcnpla1F4ZWtRNDRZaWJlMHFncDlMdTRI?=
 =?utf-8?Q?qpMUUtWGVdm8xAX2zxUvLo5KyccrIHc1l2HKIctsN9n1x?=
X-MS-Exchange-AntiSpam-MessageData-1: pXhGICpeB83QJg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3913a41c-6958-4f18-6d2e-08de5cdededb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:29:02.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BjJkNybzwo52b9XP6YoLF2R/g2vkLTwB7P6Tg2Zsoe/E9klcrxRmE8nAe3ELwKlrU4qXLIp7qOjuzfoes+hoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index f870080af8ac..69e718153137 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -470,6 +470,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         Bounded::__new(value)
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N - SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 16>::new::<0xff00>();
+    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff);
+    /// ```
+    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N - SHIFT) }
+
+        // SAFETY: we shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N + SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 8>::new::<0xff>();
+    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff00);
+    /// ```
+    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N + SHIFT) }
+
+        // SAFETY: we shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.52.0

