Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021128.outbound.protection.outlook.com [52.101.95.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8305332614;
	Sat,  7 Mar 2026 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772917812; cv=fail; b=Ooth63ZSqIbIKbfKuyKmUYEowDd5/XofoNCg1o9MhQtyI0kPGeheOjN4th2BMz79ETuOyiR0gBY/NcEo+8xwvIsZ+BXTMmbAI8dxVyPgQ7FqwBM0JQBNg2nBvKDeOD7zyf1lnSv7jYz1gMX81CNo/WyDEpzygHmDboGEg5Q7txk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772917812; c=relaxed/simple;
	bh=FwsvvEDKqKbxmX73pM6DWqd7H55MiSnJLQrtqNVp8Lc=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=TOvoxrz3/ts2z2LAzoGySt0ftqkhyS/hIMwCnJuj12t/e4N8CzHOYLOHNE/Yt+GxIZO4AmWdBJXYv9I6Gt1fHXJ1OgtUxLG7aE+zKGJK5HfBtbN0MwkNC1fqLKB+15YHXzGb/fP4THuRYcWp47gbD50XyT2s5/vXNBifV1X2oyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=IRkbOlN/; arc=fail smtp.client-ip=52.101.95.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="IRkbOlN/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYs5o8q9SL324jpDpBS5jDCI3QDLPq8asPSA0y4ZZvNzzxhx+ktWJOv21tla3M5HJ1XLxq+cWrn2BohF1cSC/qft/Dzwu8R6TNVf+Ft/2U/xBWsxW6vaPVWSetWTqsAZCHa+1cGfzOsI+dY8Ohh7lyZTn8S656jXBSii0/4zSZmYlEXkBQMcIObYfGpivBeNc52/+JxoCKmrQZYAhgifqIqCZo1dxX/s7yXrISf70r8IlQ23TzxQM4LGflUY0tJqazyaAJ5AU+sCmi/CIMJW1QdRAPw4pzzZTaT2ixJyVgkoFWMhoEfw6Dexr/HlwTxJ2Evbo5qwgL18y4cDF1QpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LWe9HxFKSWFORrKKIWFXPLEXIu33VDtSf0pbH5YM0g=;
 b=yJtqS2STBw+UDrpOQWLbjA3nQ79X553ccMXtUCbXoqD6NbfwBFBfCk36um63QcsuaqyUITfch45EDHT44yr7bHCxS2t5vODnVXEoTzNDbLIoMiuf/jRFOapEQasTGMMBJYKq88XW+A5zYxmOdhtR4dFee1vGGnZcQsiUhAGsFSx0CbpbM0FeyUzI6yp5rmBs/V2Im3/+qkpMbJ2CC7F9pzGjhHIOC5AXdNC2OwR218CdMU1+yGDWK7efTapVLydCHyBqBQaiFOeR4lis9AegRv7hQxJBMYk49FaCywFN942BFqYSqesKI82Wj1Hn6t9fCQg8q4Mk1cv2PKiHcFfsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LWe9HxFKSWFORrKKIWFXPLEXIu33VDtSf0pbH5YM0g=;
 b=IRkbOlN/GDFaRSJ0VSZmwhi0i79T0bTk2cWUX03DETSLK9HPXpMUqIm0LctEdBasuLJhTTAjILamCrkePUrwuF40cWKsl2beBvusVqIqSv2+w7NeCMRZ24x9/ib6hmuQZtmZX3bPWJ0DG+hlQ9cmZzCl4K9w5omT9INz8ORtpKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3414.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sat, 7 Mar
 2026 21:10:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.020; Sat, 7 Mar 2026
 21:10:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 21:10:06 +0000
Message-Id: <DGWUWSDMLCTQ.1675OOTK845MA@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
 <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
 <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
 <DGVT62XLP0MZ.YVAQQ5APE9S6@garyguo.net>
 <DGW40MO7G2B1.27TW3629TLBOD@nvidia.com>
In-Reply-To: <DGW40MO7G2B1.27TW3629TLBOD@nvidia.com>
X-ClientProxiedBy: LO2P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3414:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a676c3-2793-4909-59e2-08de7c8de8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	+F3uXnKEx3N/zZXBvYjqUg1E47kRMVZnhpggJtYIbjErQnE3Ge8VVI+vZzOasmpj5Aohw6kRx8ezytskl0cBguuuo6+6CTm22tr2l+vAvcreJx6sZ3A1owcoFtpCna3tTHLebCSEOMy+/UoIPgCDsjccGb0B+B1M8H+5hVyQ5jQ2rqUPLdGyRU7/z/VGOUEj9xliOoMZrTx+taZ9P9PhHtI2tELe1Fv2jN5/Bfv6pv5lOe+to2kbzOg0vjyyjE9zCS1SyDitjnAtDxa2I4DeSPiD4qYhrpRjmpSlWBLhpYAkMH+sUFuZq6IVosSgG1m7XUZqV6Yd9tyT471pkhluUakAzKy+E51oDqcv8nlD+64hmmI6nqVU84gUKoPEZiruMNRbHLgJjJEI7HdvCXG0il/hZbN362+f4wgVnoIbbJNXcGuBxDIupDUprCnCdCafF0FSLYTyMgcVC+XZwdY1A1uDOzovt8OIRQDKHUTiw76aYRHwe/n/6J4if6kVKURgzOXCmmelgZbxKM2+FhP4tR+7WDPY688TQyVAgaSJQPORxTtSVg/Ku4/BEP4TF/pdencCyt20fSvYrZAwYv5yjfF+WOWNSmqErmktjIp+XJeo4+MJsQccSe1dK+5vT6f7bKYEFEK382XRePDvQ1uUq0AQE34Mf9rnjRuHJgKos3/xBJTy485AhDS/11fiLocD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmx5RTBKMVlJNXFraGVSaWlJWVBYMW9MV1pkMll3VGZ1d213Nyt3Yk5aTEpR?=
 =?utf-8?B?cG9EYmVLTWt5MVB4RWpOTU43V1dlRUtobE9HMWZJb01Wdk43REJ0ZE9PUVQ3?=
 =?utf-8?B?VnBkdTJ5VDIrM1E1SStZWkdpa0dNSUlmODNRUURkRVFqcUNpa25lMkNmblcw?=
 =?utf-8?B?VHJ2VkFqZ0VyVXFhd2Mxa09wY1BwK3NxcVF2TzdsTk54RDZhZTNVZ1ZmaXhY?=
 =?utf-8?B?cW5RK2JrelVSZ3FTd00ycU82d1g2VFAwMUdIREtWS2lVOHpCSzlDUFNRY0Z5?=
 =?utf-8?B?eCs4R2hXZEU2UkNVN0l4bjY1RVVaaXNmTlhmZlpkRDA1VXRxZ1F2OTNYd0lT?=
 =?utf-8?B?MFJPdHJHakRYRTljUUUvUFNSTnI4L0QyU29MRkdST2RVSEY1TW9PeWdqWmxi?=
 =?utf-8?B?MmY4OGc1WGRVdkt0K3lJQmdGZCt0YUtic1B1MStkYURTM0pZQzhJeW9oZEoz?=
 =?utf-8?B?ZmdXcUtrUDFDWHNQOXpTbGQ5ekdiODJxMFYxOFZoWlk1R0dwZUcvTGJXSnIz?=
 =?utf-8?B?dldmRkNpMUdTM3A1VWxuam45RkgvejVJdzhLNXNyMTBUWmlLK0cyS1pFcnlU?=
 =?utf-8?B?SDMyWDJWS2Z2WHl6SFNOWGdiU2hzOVF2R3RjMy8xSkN3VUY4SVZXZ0Fib0cr?=
 =?utf-8?B?RmxRMVNUN3hZZCtCQjZLb3ZTMFVDbUdUWFpiSlEvQnU3TXFHbmxCYlphaUVv?=
 =?utf-8?B?Y1dnL3NVMXFtbW5Ham5YVHFTSUhUejVGbm8vMzczd2x1U1hpTUZDSWw4a1hk?=
 =?utf-8?B?dlFBRzdBN28rQTVoSHRkeDVRWWxISU5TVG5JcjlkNFE3b0RJRldQbjhtQjB3?=
 =?utf-8?B?MFVwSlo4MWVSbWZ4TjFLclNNOVFOMTdBNTVQRmk5cHNSVlJkcklUS3dmYmtM?=
 =?utf-8?B?TndTUmhxamRQZVFYaXFIejl1bDBiMjBURkZjWkg5VWJRYm00WnBSbTFLaHZz?=
 =?utf-8?B?VzZqYkpvMXF0ZGVoZXhya014bUYrSDRWWFd0dUlUMHNFcWw4Y010YThwNlhv?=
 =?utf-8?B?YXo2L2REZVpUTlhtUElJZnJCQmRuMGR4ZEpvcmdxWmF0VUorUUhMK3EybFpw?=
 =?utf-8?B?WkhpaWRnN3JKSmdaNnlha3RMWmZvd3RZdjdpb2hmNGVMRU9HS0tTWXk3Uldh?=
 =?utf-8?B?NUJBZGM5L0F6alVnbXY3ZjlPcUtGM1UvK1Q3K1paaGdrRXZTUitpMk9odnBI?=
 =?utf-8?B?NGRTVEg5YjZXeG9aSWpMdmJJdjBnYUUwRnUzQkhHclREd1UzcElUL3FtUWsr?=
 =?utf-8?B?bzNKS1lFWWRkM0NlZDQzSnJBL0tVOXd0NkxBNE9yL3ROaVF6ZzdxeWxuU0dD?=
 =?utf-8?B?NnREUkFtVUIrMVl1eWRPWnUxT2NHb1ZBWFVONjBVU3VVS1kwY1cxNGdBWnR6?=
 =?utf-8?B?cHZjSlU4cnZ3Q2VXRXBZZzA2bGVObkJKamVLSWZ1dXJEU2xwd0laU3VPb3c0?=
 =?utf-8?B?emRCKzcweGk4dUh6eUhJWWdIS3hwcGdpMHpMSXdiZk5RMkNWdzZBSjZrZ2xI?=
 =?utf-8?B?L2dWdVNXV2lkbTNaVERWaTlRUWZ6dk81SWVxM3FVVnQyZ3o0QTRVTldPV1Fm?=
 =?utf-8?B?Q1U3dWxQL0piRThucG05MmRacjBnY1F3TTVreXZvYnJOeUxGc1JvTVJVK09j?=
 =?utf-8?B?L2pWV2pDYWJ5VVZnbHBVViswRHd3VzRMeFdudGFVUFhJNVN6dU5ZMm9LT1Fk?=
 =?utf-8?B?Uk5icElKRndtWUdZSVR3VlpUQ2JVd2wzNTlSTEYrT0poVEx5YTluOGgxb1lP?=
 =?utf-8?B?U0xkUGx3c1BLdTcrZWdLdnBqR1AxbW5Qa0daQm4wQ3NaNDNMbStnOXlISmVB?=
 =?utf-8?B?T1VyNUdoY3ptRnRWVlhnUFpNWmo2UThrWXpIZ05BTTRTMS8xQ3VkaS9pcHFT?=
 =?utf-8?B?VzlDNS9DL1V2cTlOcjAyM2RlYm15bW5tRVJFOWp6ZHNLWkJoUmRZTUVwOG5V?=
 =?utf-8?B?S2ZkZ2RtYXNqci9WQVRLRWNEdndIbVd2UUY2STVKSjNYbXBHc2s2T3Fnc0po?=
 =?utf-8?B?V1N4bWZHa3ZVejRzZTVLYUZ3SzVUTUxaUVZUblJwWVZNU0gwTTVpREZ2U1c3?=
 =?utf-8?B?SkpORk1NMFNvamNuOXRpWUdtTWsxdG1OMXhkMDhCNEMvcktrK3FGemYvcVZM?=
 =?utf-8?B?VzRhYWhMOVpmQW9kU3AraWRVMWVDV0h1em9hdlZ4bzZFbWxkaVNIZHZZVTVx?=
 =?utf-8?B?RHd2NFpWdS90OWR0YjF2MGszZW8rdUJSTnNOUXIyYm1HTHhoRnNsNm9vNmlW?=
 =?utf-8?B?ZzNKQmpLYVpHdG1XaFEzVkdBTFJiQXlBQ21ISXFvS1lod2xoRGVjOGFtY0Vn?=
 =?utf-8?B?YXU3Sm02SmtQS1E1U3JVQk9oR3pQWGtGK2RESnZBVkxnVHZpaWpoUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a676c3-2793-4909-59e2-08de7c8de8ba
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 21:10:07.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwFfzVoaqU1g5wqhB2Gi64mKm9+VG2e0hcev407M5GmQ3no+OicSrD941sHqbPlXigXnvYMWmVTiyXFLA3OgTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3414

On Sat Mar 7, 2026 at 12:05 AM GMT, Alexandre Courbot wrote:
> On Sat Mar 7, 2026 at 12:35 AM JST, Gary Guo wrote:
>> On Fri Mar 6, 2026 at 2:32 PM GMT, Alexandre Courbot wrote:
>>> On Fri Mar 6, 2026 at 10:20 PM JST, Gary Guo wrote:
>>>> I  mean not sure `at` gives me that impression at all. It would just l=
et me know
>>>> that I am accessing it at a different location. If you omit the `MyReg=
Array`
>>>> part then there's no real indication that this is an array to me.
>>>
>>> `at` is a function name, we can change it - I picked it because it is
>>> short and reasonably descriptive. The point being: we have a unique
>>> function that indicates unambigously that we are using a location for
>>> an array of registers.
>>
>> Okay, maybe `at` is not the biggest issue. I just instinctively feel the=
 usage
>> example being awkward.
>>
>> Perhaps the fact that `Reg` exist itself is awkward to me. It looks like=
 a type
>> that exists only for things to typecheck, and not itself represent a mea=
ningful
>> concept.
>
> After partially implementing your two-args proposal it really turns out
> the two alternatives are very similar in essence, with most of the
> differences being details like naming and scope.
>
> The one fundamental difference is that it didn't occur to me that we
> could resolve a generic argument for a function in first position of
> write using another argument, hence I went for:
>
>     bar.write(location_builder(location_info, value));
>
> but it is also possible to do
>
>     bar.write(location_builder(location_info), value);
>
> And that's really the main difference. All the rest is mostly details
> about whether `location_builder` is an associated function of a type, a
> method of a ZST, or just a module-level function. From the point of view
> of `Io`, none of this matters as long as it gets an `IoLoc` that is
> compatible with the value. IOW, each Io submodule can provide the
> location builders that make sense for it.
>
> The `Reg` thing in my previous email was just a way to provide a scope
> for these location builders, but in retrospect a module-level function
> seems better to me if we want to keep things concise. So if we turn the
> location builders into module-level methods we could have:
>
>     use kernel::io::register as reg;
>
>     bar.write(reg::at(10), SOME_ARRAY_SCRATCH::foo());
>
> Or does
>
>     bar.write(SOME_ARRAY_SCRATCH::foo(), reg::at(10));
>
> Flow better now?

I'm still generally inclined to have location at front, as it's also going =
to be
how projection syntax will work for structs:

    io_write!(bar, .scratch[10], foo);

or just assignment in general

    my.scratch[10] =3D foo;

I should also say that, my desire of having the explicit locaction is also
partly driven by the desire to eventually unify projections with the regist=
er
macro. If we would generate a struct where fields inside are registers at t=
here
correct offset, then `io_write!(bar, .register_name, foo)` would indeed be =
a
canonical way of accessing such registers using I/O projection. There's no =
way
to simplify `my_struct.foo =3D Foo {}` without repeating `foo` twice :)

For context, Benno suggested in rust-lang zulip in a discussion about how i=
t
might be possible to use field projections to replace register macro in the
future:
https://rust-lang.zulipchat.com/#narrow/channel/522311-t-lang.2Fcustom-refs=
/topic/custom.20virtual.20fields/near/573703808
Don't worry, the language features don't exist yet, there's no change neede=
d to
your series :)

Probably I should mention this earlier so you see the aspect I'm coming fro=
m,
but none of this is directly related to the `register!` work you're having
today, so I was avoiding to argue with unrelated features.

>
>>
>>>
>>> You seem to reject this design because the syntax isn't obvious and
>>> natural to you at first read. We are trying to build something new, so
>>> of course if will look a bit alien at the first encounter. That's why w=
e
>>> have documentation, and I think it is not very difficult to wrap your
>>> head around it after seeing a few examples.
>>>
>>>>
>>>> If `at` is only for array, how would you represent the case where the =
same type
>>>> is being used in multiple registers?
>>>
>>> That's not something that is supported by the register macro currently
>>> (probably not a big change, but not something I will do in this series)=
.
>>>
>>> But to try and answer your question, such register types would not have
>>> an `IoLoc` implementation of their own and would need to have their
>>> location constructed explicitly. In accordance, the construction of
>>> their value would not bear any location information; thus there would b=
e
>>> no redundancy.
>>>
>>> We do have a case that is pretty close to this with relative registers.
>>> These are accessed like this (real examples):
>>>
>>>     bar.write(Reg::of::<Gsp>(regs::NV_PFALCON_FALCON_DMACTL::zeroed()))=
;
>>>
>>> and
>>>
>>>     bar.write(Reg::of::<Sec2>(regs::NV_PFALCON_FALCON_DMACTL::zeroed())=
);
>>
>> Relative registers are something that on my list to eliminate and replac=
e with
>> projections, so I don't particular care about how it looks like.
>
> That's interesting, I thought register arrays would be easier to replace
> than relative registers, I really need to take a closer look.

Register array with stride might be tricky, although I have to say I haven'=
t put
much thought into this yet.

>
>>
>>>
>>> But for register types that can be used at several arbitrary locations,
>>> I think this would be even simpler. The different locations would just
>>> need to implement `IoLoc<T>`, where `T` is the shared register type.
>>> Then, considering that the two-arguments version is called `write_at`,
>>> you can simply do:
>>>
>>>    bar.write_at(REG_LOCATION, reg_value);
>>
>> Having `write_at` as the name of the two-argument version is okay to me.
>
> I picked that for illustrative purposes, but `write` should be the
> version that is going to be the most used. And if we remove the value
> from the location builder, then the most used version is clearly going
> to be the two arguments one.
>
> The one argument variant would then become a shortcut - `put` sounds
> adequate to me, but `write_val` also works.

`put` sounds good. It was also the name that Gemini suggests to me when I a=
sked
it to come up with a short and concise name for this :)

>
>>
>>>
>>> ... but this design also makes this possible:
>>>
>>>    bar.write((REG_LOCATION, reg_value));
>>
>> I considered about this, but IMO this looks awkward.
>
> Funny how you spell "elegant". :)

It's indeed quite elegant from a FP and type theorist lens. I'm not persona=
lly
objecting this, although I feel that this may looks strange to people with =
C
background (not sure if that's actually true, though).

>
>>
>>>
>>> Tuples of (location, value) do implement `IoLoc` themselves, so we can
>>> use this little trick to support a 2-arguments syntax with a single
>>> method.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> If you want to make things more explicit you could also have
>>>>>> `bar.write(at_array(10), ...)` or something similar.
>>>>>
>>>>> Is it possible to generate an `IoLoc<T>` without having `T` mentioned
>>>>> anywhere in the call to `at_array`?
>>>>
>>>> Exactly same as the `impl IoLoc<REG> for usize`:
>>>>
>>>>     struct AtArray(usize);
>>>>
>>>>     impl IoLoc<REG> for AtArray {
>>>>         ...
>>>>     }
>>>
>>> Right, but can the correct `REG` be inferred when the call to `at_array=
`
>>> doesn't bear that information? The type inferred by the second argument
>>> would have to be propagated to the first. Guess I'll try and see.
>>
>> RE: inference and bounds checking issue that you mentioned in another em=
ail, I
>> think you can have
>>
>>     fn at_array(i: usize) -> Result<AtArray<T>> { .. }
>>
>> and=20
>>
>>     impl IoReg<REG> for AtArray<REG> {}
>>
>> The type inference here is no different to `Reg::at`.
>
> Yes, this clearly works and then it actually becomes `RegisterArrayLoc`,
> which already exists and also implements `IoLoc`. This convergence looks
> like positive sign to me.
>
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> For the array case I really think trying to shove everything into a =
single
>>>>>> argument is a footgun. The type of value in this case *doesn't* tell=
 us the
>>>>>> location, and the location needs to be explicit.
>>>>>
>>>>>     bar.write(Reg::at(10, regs::MyRegArray::foo()))
>>>>>
>>>>> "write the constructed value at the 10th position of the `MyRegArray`
>>>>> register array"
>>>>>
>>>>> What is missing here?
>>>>
>>>> This is completely un-natural if I try to read it with fresh mind (try=
 to forget
>>>> about implementation details for a second).
>>>
>>> That's what documentation is for. Please give it a fair chance and ask
>>> yourself: would it still look unnatural after working with it for
>>> 20 minutes?
>>>
>>>>
>>>> `MyRegArray` here is a type name that is a bitfield and not an array. =
`foo` returns a
>>>> single value and not an array. "at" here is saying that the register i=
s at a
>>>> specific location and doesn't really indicate the array nature.
>>>>
>>>> This is why I insist that I would prefer an explicit location
>>>>
>>>>     bar.write(REG_ARRAY.at(10), Reg::foo())
>>>>
>>>> would have no ambiguity whatsoever about user's intent.
>>>
>>> IIUC `REG_ARRAY` would be a const ZST and `at` a method returning an
>>> `AtArray(usize)`? I still have doubts that its generic type could be
>>> inferred automatically but it's worth giving it a go.
>>>
>>> If that works, then I assume fixed register writes would look like
>>>
>>>     bar.write(FIXED, Reg::foo());
>>>
>>> Unless we have a specialized `write` variant for them.
>>
>> That, or `()` as I mentioned.
>
> Wouldn't it look... awkward? :)
>
> But if we can agree on
>
>     bar.put(Reg::foo());
>
> or even
>
>     bar.write_val(Reg::foo());

I'm okay with either.

>
> Then I believe we are getting close to something that can make everyone
> happy (pending Danilo's blessing). The `()` syntax can also be supported
> for generic code.

Yep, if we want to support both the `put` can just be a sugar

    fn put<T>(&self, value: T) where (): IoLoc<T> + ... {
        self.write((), value)
    }

Best,
Gary

>
> I'll try to speedrun the remainder of the implementation and send a new
> revision for review, but AFAICT this ticks all the boxes.

