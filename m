Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55A30AD15;
	Tue, 27 Jan 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511622; cv=fail; b=EAlfgJ5DNuaCVVWawSuNhtN1Vm5WU4QPYSba5dcWtx9At5UW/GREa408oCd7XVLasrcNd1HTlnfBhNCfxojs+dRu31CPxbdbPF8jfPnDIcHLt0IQGrB7ckETvqzaDn83Ya4hdio5rxOj28G20GidstLXf3IkAfIBLGeHI496WKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511622; c=relaxed/simple;
	bh=bvHZk5QsNpn4YOvJs11+pAEcEI0LMBRkNBWOzSjgQ6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S+bhxqO2sT3R27CxD9S36uagw0QSBW7ahjPVlAiz1fDvpEyTjbD5lr/Z0Hpd5abyBWxGyvIT0Nv7IGeE49dJDqujlMlrizv6tHqTFzgtgU3slGTMdqEyMGVXqCWbxaEaTlOuqBzu6GgUf76zoIayeqtdy/p1FRw+6dEOyNOGxbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LtxWnnWR; arc=fail smtp.client-ip=52.101.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LtxWnnWR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+4DpF+K8qLmH1TK1+7e1KX59iML0XIvdbNQ2P4lYDaaklY1YZWjmcp0SMB3TMwijRzEH0VLgDW9hrxp8PgdrojeL9jHjxN8EQQSYPBFCU+WWgHvymyu5+u/15INuvbvxdPhnzTNxfnc2ker/a4W/o+DSN5hSp20CDfoo3QM3yeZaR31myhfA6kEVD1L7BifrUR08k7BGgMZdERZrJSfH9kehbghuRjxrw/AwwzcALGW/0d2Aktu/lK7/3hX/LZ4/Prc7S5TD+657YNgszoZNE8YoyA3pVUDJXWstQ78fPIUoQVCNPHZ6r2yxZZVd5cRi5mWBDoQgvc68rcg8XzFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4PT+8JqjH8Xe5/n+UNB4TnfruTNAUpm/KZsVvmKK/k=;
 b=zVxJZiZ9zRIwrV+cMGyVfHihnH3PgApJ0OGroXNqbrOOsA6gvHTVlntGXNiqZP/T14AvRgsoqzG6BAhIPlMVJkZYlE7sWB77yFK/ZN6LVVoHuLIjOBVRGu3oVWzeSSPEI6pO1J+ercjmMFlKIoeUD7IWD8ghGUsS/BrwBrtWdrHSgchR5tOb0+w4+7875Fhoy0iNfM9auQsjArRwWvJ0btjCVcB/CnP9pmZ4VZYy1mKWeZsCED2+dtjklgMR5pVeMLevnQWnB79xhVEjl5n061enzFs0x0MKagQKsq5ilp+cQNFp4/2baIbLNrQk+556OtR2hqinhrpReyPS3t74BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4PT+8JqjH8Xe5/n+UNB4TnfruTNAUpm/KZsVvmKK/k=;
 b=LtxWnnWRzfQnbdlf7vuNF1P5njYTP7ZixLCPRie+XYKZdQFGn3f6E+6oYlrmiVLjoJKrDL2zttvXMplNXwbACmG2U7j8PXmIHwbo0X32x7cZ+juItsaW82PjlwpmKkRcA0dKXY6IZYpsAUHytMqcYUFwiD0KVxK97dTY2MeCxL8hpFEschcPhgvUvlunw5c3KsN/QZ9f9tntxHtUGJmNuGAwnzUNNlrygQvRFEa807g4fQzsq9GYkrWipjrpq720wJiydVVlUyO3aTqlRbvz4oOQcluekAYXmfqCWVx1cqlJERUk1POMMLzaf9qjRmzizxemi6Jgr6WgQ61bPkk7Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CH1PPF0316D269B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::604) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 11:00:16 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 11:00:15 +0000
Date: Tue, 27 Jan 2026 06:00:13 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
Message-ID: <F2B7D456-70A0-4A0B-8C4F-7835AF2BC413@nvidia.com>
References: <aXhD4sI6MHdAvgNT@yury>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXhD4sI6MHdAvgNT@yury>
X-ClientProxiedBy: MN2PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::39) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: a1af0512-a922-4d03-899c-08de5d934054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2ZiYm1DQ3RxNDJFVFVDbUxhUWRSZkE3alo0Y2VyQW9BOGJIYTJuaEMzWjJ2?=
 =?utf-8?B?YVVhbEFuc0FaUGJ1NzJJWnhKV1g0MDBhVkcyclVQam4zNFJVZ2plejZTK2Z5?=
 =?utf-8?B?Tk03VDVVTk43U2Z3RW5JV2hzNXprZWt0RW9wY2xvRjhhdXJBeS91Vm5mbnk1?=
 =?utf-8?B?ZTRVUmtUV081UkE2VS95QTRNSGZnb0ExOWpseHhQbDdUeHdPQ3pRSXUzVGtm?=
 =?utf-8?B?YmJmbFNuWFlDRG0vekZhaVNQNE5CaWd5U3UzYllSVGd1K05NNkNua3RXQ2Zv?=
 =?utf-8?B?V2N6cnM5dGFsS2NXbHdhYVI0ZU44cDUrZXNVdGMrbG1kbG1tajI0NENOMFNm?=
 =?utf-8?B?R09qUVU4cnM5VGZocUpJejJoV2s4YnJib2JpNlZWdk1adFFyZ0RCdnc2ejha?=
 =?utf-8?B?RVdTdkk1SjlIdG5mTTdtMDdyUTdtSmpIdnBWRlprTHE1V0Fkalo1Q2xnaHdF?=
 =?utf-8?B?VHBBeUNrYW5IMzlLVVIxUnh3V3ZQSmV1SFBUWUg2cU56Y0R1MVBuNnkwbjBk?=
 =?utf-8?B?VEZ4d3VxTFcveUZqQ1YwMEdmdDY0UUtkM0NER0lvcXREQ1dIeW0xUk1ab3px?=
 =?utf-8?B?SlZVWHNnUFFoZDZPbE0yaURpNHpMZG01ZTRXKzlzQ1RyUWdObmxMWkRmWWZ6?=
 =?utf-8?B?YTZNRktaeDVXcHNuNkNmSWozZ2NSZXlUT0pwdGJhOXQ4dWZITktUWUpKQjd0?=
 =?utf-8?B?cFJwTEpTZGdpbU54Yjd1NnlHTlNwVFNHTWo4b2ZMSzRxSVFSZWdxdTNKT0hH?=
 =?utf-8?B?aTU4NzZ2VE42Rkg4T0l2dlZLSHpqMjFkVWxDSitQUURFZlk2YVJ4NkNqWmdi?=
 =?utf-8?B?V21FL1lTWDdSQzBHNHJFOTA4QUdwL3RzVTFJaytDZ0ZNcXYvUWtGWjNsNU9R?=
 =?utf-8?B?T2dCNlV3UDU1L2N3elZsMERBUGFxSkVpQ2xnOWRRS2RQdkNsaENXMGROdkdw?=
 =?utf-8?B?WXFBUXUxVWtNRG84T3lVQ0V3dC9aWkhlZ0RRK0NTbmg2eGd6SmJTVGNvR1Rl?=
 =?utf-8?B?aVV6NitEN0FFa21BNGZkZGZXZE9LS1R5ZGEybDN2aC9Gam5SSzlUaDU1OEpk?=
 =?utf-8?B?VEoxeE91SU51V2g4VUttSkhWdFJjTEdrWlhyQklsUlRENEpBc3BGMDB3UDZP?=
 =?utf-8?B?b3dvT25UVFRLWDVuQkt3bmNLSVROT013ZmJWeHNheGl6ajQwNVVCMUNuK2pn?=
 =?utf-8?B?NktCcVNoakN2L2R1S3pYS1ZtUWN3UmRQMFMyNkhHZkZ6enJSSFdIZ3pEZFkz?=
 =?utf-8?B?T2xJaUYvQm50cGg0U0JXb1dhN3Z1SlhtWDdjcDFsNzdHSmNYMktGUDhXYTRZ?=
 =?utf-8?B?cXhOOFZzbmJzRk1zWmwzeEw4OHgrODNibjU0Ti9nVVYzMEtJWnNFWFZNRnBO?=
 =?utf-8?B?MVo3QUZ6d2V0QTQxcktPeTJsVThvcS83ZElnQzhkMlA3OGxTM3Uzd2FOZW94?=
 =?utf-8?B?eXhjNVBRM3FoUHR4WU5GSlpETlRiZlJHck9ZNHFYUHVXZDdqa0lFcFdIcDZU?=
 =?utf-8?B?RU82MmdpV2l2Z0pwbTZnZEcyTWlvTWVPejdCUzV4L3JZM0ZiOHlXU05GbndF?=
 =?utf-8?B?ekRXeHRySUlYRXhOcTY5WTdxb0JVSk5GQ1U2cTR2UGJPREhKd1lmUjNSajd4?=
 =?utf-8?B?VzZkZXJ4N2xDUjNBUWFFeEtLY3VnSjRxeGc5ZEkwNXgwQVMxRloxTE50Mkox?=
 =?utf-8?B?WTRrMDhHakttRDk1THkzK1RSbk1nZ3pRd2xKUEl3eTR3RHgyWHltVDNjYlcx?=
 =?utf-8?B?bXR4SHp0MXp3Zkk5UmJMcDhsVStCRHU3SWVCNUxsTWpEWlNuQ3ErektxVlR3?=
 =?utf-8?B?YTVDbkJ3NUZtNXl4eVlKSlB2STMxaEZrdGJlQUJnZjVnanhFK0VBMCsvamps?=
 =?utf-8?B?OTMvVDR1L2k4ak1FSGU2Z3lNdGczdVo0T3FwbEU4MnNsWERRNXdEb3hhaUdw?=
 =?utf-8?B?N2VjbFROLythVlFybmpVZmh3Q0xsbU1BSFY2RDhaWVRRZ3NuU0ZoQTdqNzRj?=
 =?utf-8?B?bW9UamIxUGd6cjNyMG93SFBnelRNZnpXN3lJeFFsWndRaGFYSDdtY2R3T21U?=
 =?utf-8?B?cTlEU2h1ZHBPakMvVWNnYWtvbTlWYVN5b1VzVFh1RG5XVUEvMWxrWmYvMmZD?=
 =?utf-8?Q?PBAg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3hkL01LN04xL3ROaEtUVXZqOUFpbkxtRkRmMkJoMmhXd3JoMUFubGtEdzJ5?=
 =?utf-8?B?S0dSS0c5Sk5vTVB3RGNyRGhhdVZqekttcGw4STdqZVEvVzBRbS84QjBDV2gy?=
 =?utf-8?B?NEJSRXFXMnFaZDFzVXVYeFdOQ09aNHZKSXh3dTkrdGE1TkpWTHRjWjNpcGxP?=
 =?utf-8?B?TkFIekVXOTRockcvSjA2dG5xc1U1eXRJSUhhc2lBWmxOUnZnQ1FGUkgwbEdt?=
 =?utf-8?B?QnJmRDJqdzBRUEgyeDh6MjhNSWl5alNjakJMVXBNMmI5MUcrandSN1Z3NzdP?=
 =?utf-8?B?SWRQdkdwOFdjcFFWSHlKT2xuQXdIUS9sbjRXRFEwa1c3UHJiblM3VnBPYVhK?=
 =?utf-8?B?elQ4dWRPV3hJOXRNc0xOdnlua3JTSDEwOExDYk0yS0JHaEJSSEFWdVpVVmgr?=
 =?utf-8?B?aEF3TkQxZGFLYzRmRU96eS9tSVEvSXRUakJVNnRnbENaazZaMC9hVVJ0SUk4?=
 =?utf-8?B?ZllTOVFmTHVJQ3g1czFUWDRrWi8wa25Cb1dCNy9tMGNuem9kN1hOWk9YQVVK?=
 =?utf-8?B?QUNscUhkVk5hMGxaYTBXdThZQUkwNm92cUR5MHZWUmh5MEJEKy9LVy9TUERD?=
 =?utf-8?B?MEU3dmtUSjNtWTN6WWtKNklzQW9TQ0x3dlFDczN1WmlXTzlNS09GMThUZWRj?=
 =?utf-8?B?bHphdEEzcHF3UlE1U2dXYnZnSlZ3bTZXT3RUR3BhYWJJU0ZYV3ptbFZzT3FK?=
 =?utf-8?B?dlNoZ0VGU2luSDhmTGZyandMemNrOWpDdW1nci95RDZsa0NJc0hQZXRTRUZp?=
 =?utf-8?B?N0s2c1J3ckNadGwxc0RKdU9WbDlLRzJYQWYwOUphNFBzOUdFQzJPK043Uloz?=
 =?utf-8?B?UVRwamhOaGhySXlnWVNiWnFZYmxhMmh5cXFkZDVTQVpGSmJyRmsvOGVxbnph?=
 =?utf-8?B?RGZEcHV3L1RWcWRleHhGT2NYTmZGY2dmenVNeDZHcHBuQ2JKMnFndDVGcGw3?=
 =?utf-8?B?WU1kbWQ3Nkl6ZjlkL0JNcFpzYVV4d21oMmNBSkhuTmpNa3dZOEtPdDB2MXla?=
 =?utf-8?B?MVFQbmhXNXZleWlvdlJoek5hTXlMNzZVcjVtNDFHZzh6d0R6cnpra0c5clNE?=
 =?utf-8?B?b2tqamRIN0N1YnQrM09ZVmhmZ0R4L3hxTkx0Ymhrc255c0hqd1M5OXoxc09w?=
 =?utf-8?B?SWNjNHUrbEtLVlVhMG9RY1BaQXErWkFaREpKZytVdmxNZ3FSMlhTVGMva0dK?=
 =?utf-8?B?ZmZQVks0U1JlWVV3b2pCMHQ5MmxycG9QV2hKaEljZlAwQy82dWg4aFlyUGVl?=
 =?utf-8?B?dkRQT1RkOUVweXFaY2ZZNXlqaG5oNUxDTE1zV2FSbjg3ZjBrYzNVOHIyR21D?=
 =?utf-8?B?M3RkbVlzQTlTa3d0SDZYS3pPVGRzTzF1OGVtQVBLbzBnVkI2c2Y2ODVSOFU2?=
 =?utf-8?B?bUY5UWU2aE93WGhETzBqNTBxQWJXS2k1TmZHOUt6am9qMUR2TWZHTC9Pdm5o?=
 =?utf-8?B?a2V0SlU5SkRFa1NqQkJnbTM4aE5kUkZwMFY5SFd5cFpuTDh5Smo3VkxsQjFx?=
 =?utf-8?B?Y0dUUGRwZTd5cHQ0dW1WZ2tndE9HMlpJSHpFS0VBaktlSDR6Y1R0SlZvSFY4?=
 =?utf-8?B?N3MwekhLQi9kdnYxYngwUTFLSGVUaVExRVRXSTNJQUV1TzBwYm4zOVBGamNy?=
 =?utf-8?B?RnZQUUk1M0ZJWC82WWxwWjErcmxOb0cwVVBmMTZzTGx4N255WnNrZ2pVeG5F?=
 =?utf-8?B?NEVJQUVZZEZsd0JRd3V4SlhqRUU0c01zS0VOait4d0VQTnNWUjY2Ym5BajZx?=
 =?utf-8?B?d3VPZkl2ZnUvVlNuWVhKaE02V0tQWE12MnArWU1LOWIxaTRLUnh1V3NJZnFM?=
 =?utf-8?B?RnMvYkN6azUzTHJUYWdUM3lJVG8vV2hmZU5JYmVBNCticUJ3bVhQQkxoeGQz?=
 =?utf-8?B?ckdxMkMvcnJhTkFYekVtUE1MVTVDbjh0aUNXVTJsazFFRkthSmppOElpaUhx?=
 =?utf-8?B?eEJORHRaamVVQ1FiSTlnKzZwZ3ZwZ0ZhS3Y0czFIa0ZPd0x6NTVmRkxMQThN?=
 =?utf-8?B?bTZXVUExMUdITWViTDVvWE1kcDBreDVYSVZEZkt1dCtjcFBIZllPa3IyMXhy?=
 =?utf-8?B?ZHY5Q0xrUzY2WW5rd29TZURoMG42eEtWOE9DQUp0bmZTY08zM1ZnMlF5VEdN?=
 =?utf-8?B?ZkNCdnNySjFFRU1KTWF3V2xxVGIwck1MUEd3YlZLOXBIRkQrZVY3THROR0RB?=
 =?utf-8?B?SWk4K3lxc3d2YnFEbXlVMDVSdHBPUjdQRWZZQ0xDa0wycGk0MFZXNWF3UVBt?=
 =?utf-8?B?bjZUK0N6VGFlaEF0VERGcGVPMlRkSTZCNVloNWRvNk13Y0U2bGc1NW5hWnFy?=
 =?utf-8?B?SnJhTzQxUGsvdjZXM1NOWmlOZVNTT0k4Wk82THl1NUJPTkVuaHNQQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1af0512-a922-4d03-899c-08de5d934054
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:00:15.6138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDCifJcNHYE9Z7u4oqq7ZERgxDx+YlR1QoUCA7BZTPq7AiCpWgbucp6hlPYNTYL7OODckicSDktVRL5/aItr0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B

> On Jan 26, 2026, at 11:49 PM, Yury Norov <ynorov@nvidia.com> wrote:
>
> ﻿On Mon, Jan 26, 2026 at 10:25:54PM -0500, Joel Fernandes wrote:
>>> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
>>> On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
>>>> On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
>>>>> On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
>>>>>> Add a macro for defining bitfield structs with bounds-checked accessors.
>>>>>>
>>>>>> Each field is represented as a `Bounded` of the appropriate bit width,
>>>>>> ensuring field values are never silently truncated.
>>>>>>
>>>>>> Fields can optionally be converted to/from custom types, either fallibly
>>>>>> or infallibly.
>>>>>>
>>>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>>>> ---
>>>>>> rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>> rust/kernel/lib.rs      |   1 +
>>>>>> 2 files changed, 504 insertions(+)
>> [...]
>>>>>> +/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
>>>>>> +/// let color = Rgb::default()
>>>>>> +///     .set_red(Bounded::<u16, _>::new::<0x10>())
>>>>>> +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
>>>>>> +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
>>>>>
>>>>> Is there a way to just say:
>>>>>
>>>>>   let color = Rgb::default().
>>>>>           .set_red(0x10)
>>>>>           .set_green(0x1f)
>>>>>           .set_blue(0x18)
>>>>>
>>>>> I think it should be the default style. Later in the patch you say:
>>>>>
>>>>>   Each field is internally represented as a [`Bounded`]
>>>>>
>>>>> So, let's keep implementation decoupled from an interface?
>>>>
>>>> That is unfortunately not feasible, but the syntax above should seldomly
>>>> be used outside of examples.
>>>
>>> The above short syntax is definitely more desired over that wordy and
>>> non-trivial version that exposes implementation internals.
>>>
>>> A regular user doesn't care of the exact mechanism that protects the
>>> bitfields. He wants to just assign numbers to the fields, and let
>>> your machinery to take care of the integrity.
>>>
>>> Can you please explain in details why that's not feasible, please
>>> do it in commit message. If it's an implementation constraint,
>>> please consider to re-implement.
>>
>> If the issue is the excessive turbofish syntax, how about a macro? For
>> example:
>>
>>    let color = Rgb::default()
>>        .set_red(bounded!(u16, 0x10))
>>        .set_green(bounded!(u16, 0x1f))
>>        .set_blue(bounded!(u16, 0x18));
>>
>> This hides the turbofish and Bounded internals while still providing
>> compile-time bounds checking.
>
> No it does not. I clearly see this 'bounded' in your version. Can you
> completely hide it inside the setter?

Looks like Alex replied with something that does that. So it is good.

>
>> [...]
>>>>> What Rgb::BLUE_SHIFT would mean in this case? Maybe Rgb::SHIFT(blue)?
>>>>
>>>> You wouldn't even have the luxury to yse `BLUE_SHIFT` here because where
>>>> would be conflicting definitions and thus a build error.
>> [...]
>>>>> What color.set_blue() and color.into() would mean? Even if they work,
>>>>> I think, to stay on safe side there should be a more conventional set
>>>>> of accessors: color.get(into), color.set(set_blue, 0xff) and son on.
>>>>
>>>> This would just not build.
>>>
>>> I know it wouldn't. I am just trying to understand corner cases that may
>>> (and would!) frustrate people for decades.
>>>
>>> I understand that this implementation works just great for the registers,
>>> but my role is to make sure that it would work equally well for everyone.
>>> Now, for example, Rust, contrary to C in Linux, actively uses camel case.
>>> So, the blue vs Blue vs BLUE restriction is a very valid concern. The
>>> same for reserved words like 'into'. As long as the API matures, the
>>> number of such special words would only grow. The .shr() and .shl() that
>>> you add in this series are the quite good examples.
>>>
>>> Let's make a step back and just list all limitations that come with this
>>> implementation.
>>
>> Why is a build error not sufficient to alert the user to use better judgement
>> for naming?
>
> There should be no error at all - that's why. Any name that one can
> use for a regular variable should be acceptable as a field name.

Disagreed. Here is why: the Bitfield macro is required because we are extending
the language. We could very well get this as a language feature in the future.
In the event of that, it is non sensical to allow users to use reserved
keywords. The same reason you would run into errors on the C side.

>> This is no different than using reserved keywords in C. For example, this
>> won't compile:
>>
>>    int if = 5;      // error: 'if' is a reserved keyword
>>    int return = 3;  // error: 'return' is a reserved keyword
>
> 'Into', 'as_raw', 'shr' and 'shl' *are not* the reserved words in Rust.

They are reserved as far as our Bitfield syntax extension goes? Note that this
is a macro that introduces custom syntax so it is more akin to a language
extension than an api. Note well also that macros in rust for Linux have been
used extensively for filling gaps language features (see pin initialization for
instance).

> Rust makes difference between upper and lower cases and doesn't break
> build if you do:
>
>        let blue = 1;
>        let BLUE = 2;
>
> So the bitfields should.

Why on earth would anyone want to do this though? It’s utterly nonsensical to
do so and I would rather break the build than encourage bad code. Mixing case
for 2 fields in the same struct is not a usecase anyone should have.

>> The user simply learns not to use reserved words, and the compiler enforces
>> this clearly. The same applies here.
>
> Most likely he will learn not to use this API at all. The worst thing about
> those 'reserved' words is that the set of them is not definite and will
> constantly grow.
>
> I'm trying to say that this approach is not scalable. If a random client
> gives name 'invert' to one of his fields, and you'll need to implement a
> method inverting bits, what are you going to do?

I would error the build out. See above for comments on language extensions and
reserved keywords.

>>> Again, this all is relevant for a basic generic data structure. If we
>>> consider it a supporting layer for the registers, everything is totally
>>> fine. In that case, we should just give it a more specific name, and
>>> probably place in an different directory, closer to IO APIs.
>>
>> The Bitfield macro is very much required for non-register use cases too.
>
> Then let's implement it better. Can you comment why the suggested API
> doesn't work for you?
>
>        color.set(blue, 10);
>        color.get(blue);

For the right reasons, I do not mind it but it certainly cannot be that we want
to support mixed case of the same field IMO. And the reserved keyword argument
is weak at best, for a language extension.

> I think it should solve the problem with name clashing.
>
> Can you share more about the other potential users?

Sure, take a look at my memory management patches for nova. [1]

[1] https://lore.kernel.org/all/20260120204303.3229303-1-joelagnelf@nvidia.com/

-- 
Joel Fernandes

