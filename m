Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC026AC3;
	Sat, 25 Apr 2026 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777098787; cv=fail; b=RX2hqRUHo7PFc96fLeSFmoWdE0QqkpM/Zz922217H/d6KccapjXtmLqgingN5YkOiGEbknzB/CkbxZO27LFTr6lsTUye7d4i0dJU5st6HOqDp8G0Ko8BlcMT7yUPtVu8W/kM0GS0nuluDyt0UHzjmX4KNYChnRLDXGNRX3OnkbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777098787; c=relaxed/simple;
	bh=uUypvuTpS38B4ZbvU0ep5fxQ64eWiAWRMqK8WcdDJLQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=GeBAF5xpQIfMgKB2ZcduUEpE8lFVKxU77VSfQ+2vVPmbY8xCIBpwtuO+qskLbeTc3VBPOC4NbHbflcfXG81Czz0l25JI34OqYEd6qUNv7vQ7vyBeQ60nfqNwgS92D1RgKBmnLeN6/6d94ou1pqqTuo8aOUR+cXtlpjvQHaH5uM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OPJqERPh; arc=fail smtp.client-ip=40.93.195.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OPJqERPh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWHosXDYs9O9WEThP1hX0Oqq9kClc6mrR8o0yfEztdTLDwTU0/InIvpE13yN5OhPMW29LXOYdGJQBgwcZp1eRPO4/ugTdK1DTMY5S8qdcivyEIyT3IpnyeGhR6V1KP1ViRpf8Hfrgs+CG0tjNZbBb3GoP5p+zktfVqzZOpy0ntwLOdb2c3o2mWGpTWug7DG8FcDmEMY1M8w1a+gMLFFvnZ3xvhdzHQnBLtTwK36UPzdJihDczUz79II2iX59u/pD9Sc3jHAf9nhKkNCWm+lxBoFAXHnEryzMf2+MypjngVjyuyBdnpyTi5EigV25TCuLYLNhf8Q66LG1+hWgVxZc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUypvuTpS38B4ZbvU0ep5fxQ64eWiAWRMqK8WcdDJLQ=;
 b=MowVV0kXEa9rVhg/P5gk6q7TBKbb5G1/7i4DnKtPU5dMBQ4GUPHBFZTuEQxQqrasB7VjuQo25Bgo1580IL9lgBLJ17WsNUnMS5/58NcCplvfRtgXVp2Wv2KcvaKrvQgv566et+ZXRysGjLioEOZSKxZU9NGc28yI1kqOGKVpAfwhyG2ZrnGLlMkVexeDfUe238syhpPZuBULHy9P41VNKMQojQnLdmpBukuBjzPak/pilhoraW9Rb05+GfCZIC86bdb0jSMg8AGmP/2WkdmaiQR/dpymM6KPuw2M5uppnG8LZP3Ml2FdrX8Ngm4r+dXaJ4kDElr2i0slb4cUCsbUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUypvuTpS38B4ZbvU0ep5fxQ64eWiAWRMqK8WcdDJLQ=;
 b=OPJqERPhqpiFIH70KEEpw3b5wZUipMEjby0Y2NNStmc6IyZr+TVmmdPXmzNy23xnzKAJmZ7sJnt6AJIWb1e3j7afWdBCrY6nSeLO1D8fP7nEtt/JIwZf2HLUY88kTS/JPdrbKbi+hWwvW7uGKXBW/kIUQfXL+GTOiA38ypmVjlJEWO9gsQmz+grFkF4Tn84zjmYyG+E647UEgi1nzwZFHaZUYtbjKvEvkSE9TLVzznhOeNu6rQ7gO060g0bfdbc5KydE5a9jeI9jN8PkoCvyqRkfeCZ0UIitZoeU4alQtub+eLezuZa0CChkSqz0ksNRfAbsq78DDFpYLUFAGtsTog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Sat, 25 Apr
 2026 06:33:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sat, 25 Apr 2026
 06:33:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Apr 2026 15:32:57 +0900
Message-Id: <DI20XVTPLERK.CQ95NC4Y3QXN@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: add doc test for `Vec::extend_with` and
 fix comment
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
In-Reply-To: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf81666-c73a-4b69-54c8-08dea2947f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vaHsy2oFL0sLM+0Usyj7U5HN10LFpFu4jylT5AocjUBTBv5BKXfWHW6laeJYKsKvwTBEPB+Ls3Iv5IHQFMR1UZNr2RNxi1KjkFwuA+DD3dhfyWaEsl4tozy7JJ/WZazr2LpFm87Gh+Iv95SnukBGeXarTrm3gmSrUuw1cSOIzvd/EtFu+K8LXo7luFRtiGjtb4CMM2V5hwso0W8yUZM4/60o8v649H8HFBZmMp/8xIX+fm9OVt2f6lKVwZLHxXe4Kk6k3QcDAk7AftFHsm2rALZgaCGeFBwcDB3Bn6nBYiQhT8fwjREolzIJKFTTogRsRo/6jMT8Zw86pG7iAE7JbELJIg1wmHyeqpfT6OB/aq21ob+nwKP8k2ZzxQs2Q44nMVBw0UzCNLw0j6Jlyv18nUWnhtyUvCX9dmJk6L8zUJ8ntvivqsLtuaqHsxCf8lU3RBTBC+Y28hfPL04OPyOZpquicK0myt1RALCCWDF11H4kC+vIturfuMsuQdnSytWyEWsqOTqsn4PZ60xikd7e+RFHHOfvIz/ThCcg3kaBbkQBTOvx6s//7a2gSeQGswF/0R6+OJVCQKfwKNuKeBp2RgH2idWYHeXOiXXSwXAiSxoGprzWN/M4bPJfbtgonOkmgVaPt5cDfPKKuBYF7zXJ7kvDIbIhM5T40QQHqtJ99MV50DzyG1v8nXloFrw9Q3MHKDbdmB7ZYjsYHpu8XeoFOsA6Vp7PijdMTE1ZT+7SxyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGJIVEU5MzJ5YjFtYlpuVWdUZTgra2paRmIvVmZCZFV5c0VkamFVVWlRblFJ?=
 =?utf-8?B?VnRtVklTM3g0VVArY0FvbWxDNjZneVZKQWxhVmZ1SHdzbmpKQmZJQjVqRHdj?=
 =?utf-8?B?K1h4NGV1eGRoL1lXTFFVYXdINW1Ea083YVE3b05hVFA4aFVJdGcyUURYYkd0?=
 =?utf-8?B?Y2U0ZzhMNmF6c0lobjFBSVpRb1dldVhKOEtYWDBDSjkyTnVIL0ZXQVNicGZU?=
 =?utf-8?B?SFlSYWdZUmxUTlJEc25TWTRrNkE5Q3NJWGpNanUvL0hMMWJhNnBORXR3dmJ5?=
 =?utf-8?B?OWtCVUhwOVVmZld5Rk16cytqenNkeDZNZXBLSVI2MUZUUThYT00rLzBCRWJK?=
 =?utf-8?B?bU9wQVNPSTRhZUY0SEpnTWxLQXZSSXN4L1lRL2lHNXkxQy9kWHpJd0NjT3Y3?=
 =?utf-8?B?NHI2bW0wS1VUWjc5MWJTL2hGUUR0L0xFZGJNUmhqTmdONkFCQ05sN2srU2Fn?=
 =?utf-8?B?R3lvMSs1NmI4bzdDZ2REb0NZT2V4aVBjL0M5ZklYU1R1Wm85c1FyeVFOVEhO?=
 =?utf-8?B?bU1weHBPTTFGeHYrWDlDcEdGK0tQU2ljY3lERzRoQjdoT25yY2MwbmNCMXFo?=
 =?utf-8?B?K3JJaFY4VStEWjh4VndDUzdGdXc4TmZONTlDVUZQOXllWVV4MU9RaDNvbm1l?=
 =?utf-8?B?VklyQWxRZzU3VTdabzBDcWNKemY1MTdoVHVGT2V1MS9vKzlsZWNZRG13S2NB?=
 =?utf-8?B?M2lZbWtMc2NHWmJOcVV0MkVxSnNhWSthenpuK2IrZ1lIZjk2azAzY0FlQ01q?=
 =?utf-8?B?K2crUnhOdVNSbTB0TUtNdzdZZ1FjWkd3ZXpveGZ0R1FCdzJIRjA2aFFoR3d6?=
 =?utf-8?B?c21qeG1ia2g2YXZNN2tUMnp0WDQzQjRTWmVNeVhrLzI2SVJYRTMwY2FINEpq?=
 =?utf-8?B?aUFzU2dGOE95b1d1KzBWU3NIUEd2eDg4cDBMdGpFZStIeDJBUHcwcXFXL2xU?=
 =?utf-8?B?Z3Z6eDVLNDdGcVpjLzZpeERaejE4WFpxMTgrbUZaamhZSmdPS3hHS08wMjky?=
 =?utf-8?B?RGhpbWc0OEU4MkNQRzFvbDRjcHU0NThMb3p1RkdWUWUwSENIUEFSZFpjbVZl?=
 =?utf-8?B?MERPVFVhOUMwOUtxVG1PSWlCa2JXdi9kSFpzVGs4Mnc2TjFBOTJKdG5OZUxk?=
 =?utf-8?B?N0RFNmdHOTVMQjJRMEM0WlJZN2RlZ1MyRzBNcVU3dHd6d3VkaXFHenB6aUY3?=
 =?utf-8?B?ckgrY2g4VWI0Y213TkVRZHRKRC9uaXhIU3FlNCtGMll4cVYrTzlnUkJjbFho?=
 =?utf-8?B?MVRkV2F2cXVpRktzbVhDTHVmZHhSb1dOa1VTaVI1SzhlTjM2allEL1FwRnlK?=
 =?utf-8?B?b1FQV2J6QXZRU2Z5YW83VVVEQXY2QWVHa3dEamdmdFNPcGpzSGZwQUlXL01I?=
 =?utf-8?B?K3lCUFhMRG0zQ3dyTXFkOHh2QzNIdTNTb1pPNEoySGkySVBtSmFqNDkyb2Z0?=
 =?utf-8?B?WjFjWWJqSEhRbjhhNnJMbXB6UzIwMXBRdWZvZ1F5M2IrUkxMclRlNXVEYk9t?=
 =?utf-8?B?bHcxcUN3a2hueXRMUXB6MlIzSlVZeXJnd0Fyc3UrcDJiOXZQVER1ditFN05s?=
 =?utf-8?B?aWdLNTB1Sm5aYjRwUitnVjNndkI1TU9DYXh4UU1HMUV1Q2dDZEJlZTFBMTdr?=
 =?utf-8?B?TVc4V0M1Um1EbSs5MUpGakxKelFJSVBONlo1R0d5TmpEekYveWpSWDY0OTlF?=
 =?utf-8?B?OUd4NVFkWlNSYjFvVXVnK0R4UWxLTG1XYmV1Wm42RzlEb1RQWmVOeVJsWGFi?=
 =?utf-8?B?TTZBd2U5SzVkd3R0V2ZWMUVPWVdCYkZqTnZkcy9rSGVPQjJnTWd6ZEo2bUtM?=
 =?utf-8?B?cWlZdjJBOTloSC9sL0JvdWE1ZXptbkRIaC8wOWNaS3VJOFVHNTlFeHdCWFdQ?=
 =?utf-8?B?WTFacFphOWdQdmVjdFNsYWhkUGpPdnFTMmxZZ05ZUjk4MGpHN3F1V1ZxUDV6?=
 =?utf-8?B?eEFvMmEwMnA1Q2dIdFFHeGoyZ1JzazRlTVhKc2UwenFCZjJLZHgxQ2ZUbTBo?=
 =?utf-8?B?amFBd05ma0RJOFpNZjQ2N2dSMzdSYVk4S2plWnJ2RWluMWo0dm5pcW5JdmNn?=
 =?utf-8?B?TklENXhkaEhOZjBGL1FhTlBWVjJOUGIyNDV1cVNRTEhxQ0ZhdEtYc2JPL256?=
 =?utf-8?B?T1B3WktyNzMzamNkbS9FcllEb3VXQUEvRUJxNTR1VzlodkZwK043TEJ2QW9O?=
 =?utf-8?B?M3o1c2svRUkzd3Q4Ymx1TitaTG1Xb2kyTjBKSlA2Y2xFZlNKakE2R2gwbHNu?=
 =?utf-8?B?SVRZSk5Lelc5Q3M0c1RwVXc4d2c1QnQxZzRTRU11TVppdW9MZzhnWW5XU0xy?=
 =?utf-8?B?VjVrQWd6Y2wranBnK09jV2YyNi9ueHpySGRwb1M1UnY4Rk1xVUlLbm9hQnFs?=
 =?utf-8?Q?gIIIE+dLtiixCOCaC9r298R/XzzoEOOqXMvYirelx1TR1?=
X-MS-Exchange-AntiSpam-MessageData-1: Zxwug4QLCzjemw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf81666-c73a-4b69-54c8-08dea2947f92
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 06:33:01.6251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHvbNSfyTGcPdXJWafyWk7wznLZ7P9cnqM6kd7jSvZsQGuShr2bsms1WKJWl1dd8mmYa6l/qLw8nXysLsqoJWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604

Hello Hsiu,

On Sat Apr 25, 2026 at 3:08 PM JST, Hsiu Che Yu wrote:
> Add a doc test for `Vec::extend_with` demonstrating basic usage and the
> zero-length case.
>
> Also fix an incorrect operator in the SAFETY comment, changing `<` to `<=
=3D`,
> since `Vec::reserve` guarantees capacity for exactly n additional element=
s,
> so the equal case should be included.

As per the guidelines [1], "A patch should do one thing and one thing
only".

These should be two separate patches.

[1] https://kernelnewbies.org/PatchSeries
