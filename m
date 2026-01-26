Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06231EA7F4;
	Mon, 26 Jan 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436226; cv=fail; b=er+3BsmDf1G1OQLhxgADrd8MNWLTGHVYb/2U4HasglWF5LrVyI4e0I5nurn1gPjTW5opvvet1skwYQs+BVajxC6g98VhNBqAD4ujgfVRXhm0bxZxhFIFF27h7yUwl04u7AST/PavJUtT31Ew9e8WLK2L5D3WQsuD+9qtJERpScE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436226; c=relaxed/simple;
	bh=wHlUbg47m655e+cu4BDgP0UgwQbtfy6HyJDQGXC1eCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dm5iHzKguLuAYfEHpS4ClHAS8trjV5u8CYOIhlvZLrvdXvEQtpIAbImEhcsl1oFsxGSSH3CBrTOyILtK4/Q6tRZBpVYMad5AY3Sguwd6ZdFrVouduX0T9Wa4X0nO79N8LPse92hSEeNIEWZr6CX3eTLMmDP5MNte0fbv4pRuVgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ekqLlXj/; arc=fail smtp.client-ip=40.93.194.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ekqLlXj/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAY95BAZn76IukHUMxkUguFAK0K4l7QJ+4xlS/6GS9X4LElHFq/qIKTtCf6/nl9UQ3Y7N3+yCv9BBDZcyJt5sGmz8zmKe/M7xkAgBog1eNR1jRf7J/z41yI9+90RL9GM6ifEULzdMYbeNK9FC5gMySOGo7qWBINfLSj0LMO3lVCRWxGKG52XtZeiO2bLGFx6b9DG6jQDsUi9e7kUV1jRaeq27AzuI/pk0ZzvIZvM48whrTj9zaLKFqNdFwlOZMNC6wSEyWMpYPpMivBSUV6Z8pk1i8qncYquXIilfWqFe65LW3045CmXCJAbOighRUdBrm+53h8WWoSCfDrHrPTV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA4bFtoAstmiCX+W59gGyThX0VVwlFEJJT46DhbWE+M=;
 b=ILU+xNnq0j63IKJQHWpQrbZbIZcQ378Awsp3f4m9TrWJr4VGDFryihEi2JB09v+YcfVSYvMZZmeK8pLaBYequXLkCuG6xA+2RiAe6SyyZ9duMiKbmheI5/fBKOsHPpI33UskqAC4+RAlceKKRlGZOrjVLInWmUrJWNUDgU03CQxWP3L8FgkPIO4e0Ilbi6smGKQly6KVARRK2N22LnFz1aa9Zk9waaiWM0Nw7kDv7/pgvml8x9IYKHmppR+YgKcjlyD0jabNIr4NFFcWZaSajCMl3o+7fOceOCSYeg653BGpTeUI3oRIu70u+9rjUKMraWLh1yFy3gztVC8wlVTj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA4bFtoAstmiCX+W59gGyThX0VVwlFEJJT46DhbWE+M=;
 b=ekqLlXj/E+vl+v403gIJPz6MxLbebVUADklLpvXJHOjN1jBl21iWnrkNtnZEEpGsr5pUFCTo5/4DeZhn25d3nYAvKkExw0P68C0PR9ReAq2S2OvdBtcOVNclZ0aVP+rp+pXdaYbZImPrXXyCnKehD4HMoGrBbUr4P8dE69SEvMvm7QT+OoeyKlw9hUpGgGiaf+7bWwpKnMgzKFynF4XWhgFuuBpxnzr2EqqPWs+M/ISRq8SJ9MvIy4A7NUGrVFX2ivVe3d8PuYN7L94nKSkGHZxt2yig6RZmza6yYiuT6OMGQ8n+/s3GGoRkuzfCPRHUxbQPXGb4aFu3m7WOEpc2tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Mon, 26 Jan 2026 14:03:38 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 14:03:38 +0000
Date: Mon, 26 Jan 2026 09:03:36 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
Message-ID: <EC8B25F5-DF1F-4BB0-B28B-6B8EA721BA95@nvidia.com>
References: <aXBq1TUBKWHVmg8S@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXBq1TUBKWHVmg8S@yury>
X-ClientProxiedBy: BLAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:208:335::10) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee402d1-1b63-414a-2414-08de5ce3b3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q8kph7omvDaAYGtLQwR4GTsgYOtxaGHHBNgwJlKcLS5Iyuq3/h2LEAAoifWi?=
 =?us-ascii?Q?MsHDWvSz/Mu5X5dn96+qhhVO8RRf8j7bUpHkKfnh1h2xfw0WDHVmQhZdkds9?=
 =?us-ascii?Q?1xLYnkyZzwp45l94JrhDoZFN1uP9c0tK0Kw+8Pb0tRU2LPaIhkNvnUsxqseB?=
 =?us-ascii?Q?war/OqalJGvbvekDSIO/Jdh+N1KuZzVyI/IqA/hE+gqgF6oUguJMIbDScBSc?=
 =?us-ascii?Q?jf28oIsM2Oi40I/14DSSDumf9hi9TtiI1NonKbjs67b4eT6uIB6W5WAX3nr+?=
 =?us-ascii?Q?c8FFR4ApjSWR5Omtk/BVvSei1T/mwNMdzfkCVhARWZw7yYo5EGYWCPvLby5A?=
 =?us-ascii?Q?qeW/cDEcKKHv+vBFuRC1Cfbif5nq7H9As9Cbuaoqlz/0cACocSCmIa9XW2X2?=
 =?us-ascii?Q?zarTp1dWdEHXDp+fymrw1th2nwmSf4Nbvt1laVZ1q4gpmQsKtpXk8lTwdp6N?=
 =?us-ascii?Q?rIURXiqxBFvbb6enEbqo6j36xUVzWNy/gAyCoj3W3zvJLQ+BvDnTmBlucbH+?=
 =?us-ascii?Q?egGMGkKOv259vyqLgOfOSCL2aIx57vJUF0JKLL6pyYc5o96Uj5GT0X1f6a+E?=
 =?us-ascii?Q?BopIGIfgAXIxDm6jWxg1s8dcnq2+1DFOhdkLS5q0IL3vW1Pu581RJkyT3bq7?=
 =?us-ascii?Q?AXACRLx0tsDXZhHXd079i6RKZ9mX7ZPRR2Vh2ksYft1vRET/5SOBeUEgJp8N?=
 =?us-ascii?Q?njCJMcpe3tG6chg9s3ztfXWvxB0ZJ26EGBMkRJDXoEbMFmGGCmD8WjCEdny3?=
 =?us-ascii?Q?ZT3ZSJtmz4JeEc4niSAw1kr/aBzwUBt37ALavkvkhj0BzXjh/fd7ztGxhY5M?=
 =?us-ascii?Q?mgp0+yScQyipNmhfRed6aoF9nvcdkCz/AnWhycz90rBJWPnBn+O1ITbvIV7M?=
 =?us-ascii?Q?A5XX5xiMp8yzqPkGny/XTWh0QuCSPdBEjxKXW49mYF4Y1VNzfAH7cIM7NRDy?=
 =?us-ascii?Q?Ncuazg/cBdaiiOvujnnw7EEqcqyYqSjltLtRIhvwOoLviGVAfRmuwZDdGTsY?=
 =?us-ascii?Q?VltcppCZciPZiNakwP0aGG6PLDqFPKj8DSbmPI/wdsrpQwJ5RA32Yh7aNRe1?=
 =?us-ascii?Q?4GLCxLM3kgbzNOCV1dDZCIp3YfkysMsdKUJdUXW8JExLiHTeJH3pZtVoSwlD?=
 =?us-ascii?Q?in1pcDv3CnizL8Fz5CxvSTZUNrFtmwr5C0z4TltuPQXDlf1eE5s+PqqoYyGa?=
 =?us-ascii?Q?hkJEoIOmL2xvKu1LkMyFQQgKfYTYgvvPaPZtUGm1ssjuW9Tm3hGqBlG30nYs?=
 =?us-ascii?Q?ykRGxy63fzO5GG2dWRqZ9b6tckN2c6+Ykmy6XYRESIK7u3u1m0TqI9a1+qDe?=
 =?us-ascii?Q?Q2lmk36m67z2PT5KXoLAZKe743Epwz0QR8ZeVf9PiNP5nU39LY9B4Rl4QX82?=
 =?us-ascii?Q?W06uz84mI6bfxJakNpLMbb3yjqPcQ6qLkBGPUHVS1pgK2I2Mdf/JR8wqA/N5?=
 =?us-ascii?Q?IiJhMb9Wf4djh3CliTwL7wlIbwb1TEtZ5azrUTg9UhI/BakvH8aVtc64udYa?=
 =?us-ascii?Q?frWl0LpPdo0F6wD/97kI5NZNldeuWXS+TuDMj+2+1MGZtsm31zt35fJD+Xbf?=
 =?us-ascii?Q?pa+Xv6qKnH+tXblJcjw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3vLo/Emfjg4bPtxu3gsqnDs1fMS8dY/orzE5al/3VEgPAJgSsxUkpis/aYQm?=
 =?us-ascii?Q?MSIjBMM2dlxcN4ZetgywqqBrz4pIqran3ElJsbqtHioKAd7AcvfGRh9/Py8d?=
 =?us-ascii?Q?CUHKt3UvStbOzH28ZjadG+ft4BpCh6kKu7N6yzQ+cMUGuk04ISneWRz2NBRy?=
 =?us-ascii?Q?fbkzlldo04qd82qMW1tqyHBISG5O5bo5uEf/uCD3pCluSAiFLz44e9i9+yNN?=
 =?us-ascii?Q?/MbcCfYWDDfBRuDIEGbn7SYGM8RwJJ/biWNYuGkY+0ehITFK2rsy3tLnVY2w?=
 =?us-ascii?Q?KINJz0MyGAMaJSmsP2nHqVlbQA760BrevrfQ0Xmwd5Zpa0XPmbQEbC4hpxiU?=
 =?us-ascii?Q?/ihBQrF4l0R2mlf7zFfPrW1tObn7Z1qMGRsCkx8M9z3iS1taaMeZiu4WHCTg?=
 =?us-ascii?Q?ZJVSme6GY1KFYbeWw/L+9G6G3/YZPxkKxj918CbzhwgUDIN8/70QYVF0t4dl?=
 =?us-ascii?Q?5x+geqv2fdTG5koRMy552/PTrSCFl9V6XSJM7T650E2ic9p0ghG2i1fG6SU0?=
 =?us-ascii?Q?2eEy5DT6sg20KCxVcAeprH2CSV3q7S963Xundv0GbXAi6yPI/woVa0DuMtQk?=
 =?us-ascii?Q?TKbe/TiZdKTaGcr2WjF78qiBhIFdXvV8q+rYzExfC3CKBJwey4+Yv2CxZkA9?=
 =?us-ascii?Q?O9mdG3vlr4PVWRQufaQHueAvuyYWPTSO5JXiSuRa+alZs20Z2WDpfkBBnFmL?=
 =?us-ascii?Q?aGq7z5pfYVArlnoraXLvObLaDNEYarPODn1+7eHrxYuBHuTeY4EQhIxMMnCv?=
 =?us-ascii?Q?x97O2uxX1j/xmtSIOFq19Yo9Vf+D5nyoWNISU43OO/EXq9WQlefjhIW8joSq?=
 =?us-ascii?Q?6N2jMJO0Iqpc2M2tb0Q37zkXDZHHM2nl+DmdSWesE8dLFCrvGUKBnq2KgEog?=
 =?us-ascii?Q?nophixiLBITlCtVLWnZbwtu8svC5q5ASVmN0zVp5pat4OOzNqGRk7k5MsJBi?=
 =?us-ascii?Q?ALGAYV5izCLby11bLPVbsF/De7Vjo0DYjGflXpDzxiLfRLaw9qpO/xQc0mEx?=
 =?us-ascii?Q?o9aJ1/qC0yT2vR5PM7N2F6geI9G8UKgQ+Kl+3n2Wqf5GyR3I+foB7be1fQkm?=
 =?us-ascii?Q?iP1qT+xZrf3nx2yfooVMHBTPyYFXxujSXJraaJIMWVT2gbtwXlLu7wS+sC41?=
 =?us-ascii?Q?Oj0eXff59ZoNAFnP9v1YULHpGYBD7yG0DjXmoYFFrHKT95yFCd0Rc80pbttK?=
 =?us-ascii?Q?yJ2gDumjABVBKZPegXK1GPuZ27JlsvAPvaVkv+aMxJmuYyp+V9cewXBWiXaq?=
 =?us-ascii?Q?Iuz6TKmHLo8HWLNnnlI0cbSpvzOkxTMO4bZ0rfEYkTv8gu8NxDzvZMo0ZI8f?=
 =?us-ascii?Q?c8GxGpz6AkZwaufRkR+3XzShP7iZNn3PuqCYQNwa3qY1Mz7JBUaM9g9QhP6z?=
 =?us-ascii?Q?pKMoGj+uuDZaXBI83vwRAYpEIJh6sGR7ZPXCuyLj5euuoZJcfjgLBgkz006P?=
 =?us-ascii?Q?R8U9HrobZ4I0z65o4W1KWRcBQXMpDEsdYJTQ1YY7FqbHUTL+JrRBk3VCzu4M?=
 =?us-ascii?Q?uBzp2YRqt/uR8uvy48sy1QCp3jrdHFMvKbhNCA7OCiAJVpAy1BVYw9wVds4R?=
 =?us-ascii?Q?8f1GOr0e8t+oXms3bD9cXBfhRq1OHUOje2FRVb1KmouZ3QJaE9X3NM/fJCII?=
 =?us-ascii?Q?K/iuUPWnXL6HYnFiFeb1ocIY0tqXSSeboO/blP42HsVHJgUm4NI5obeXB2Ya?=
 =?us-ascii?Q?9Q1regYBCBsD6eZlPHGeJcYC1mcZandyNYxu6C+QcqnbKFzeuwVTmo7BW8Z4?=
 =?us-ascii?Q?s8a0byJQVA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee402d1-1b63-414a-2414-08de5ce3b3f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 14:03:38.4277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2TVWJALROYEXyO65CgQWt9YKoC95ynQFlxo3nr23rztfDAHabgVNrivCXo8FzI91dJmYB82UuMPJfG9Gup0dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889

On Jan 21, 2026, at 12:57 AM, Yury Norov <ynorov@nvidia.com> wrote:
> On Tue, Jan 20, 2026 at 09:31:14PM +0100, Miguel Ojeda wrote:
>>> On Tue, Jan 20, 2026 at 9:01 PM Danilo Krummrich <dakr@kernel.org> wrote:
>>>
>>> I think it's rather unlikely to land bitfields this cycle. I think Yury
>>> explicitly requested more discussion on bitfields and also encouraged
>>> the "two stage" approach [1] moving register!() first and then extract
>>> bitfields subsequently.
>>
>> Does Yury want to maintain it? From his messages back then I am not
>> sure if he does or not (he suggested "some non-rust person from a
>> related kernel subsystem", not sure if that meant himself in this case
>> too).
>
> I can become a reviewer or maintainer, assuming Alex will become the first
> maintainer as the main developer. I can also move it with my branch if you
> prefer, guys. In this case it's better to make me a maintainer.

Happy to co-maintain it with you guys as well, since the initial idea to add a
Bitfield macro to use for Bitfield and the initial work to improve it based on
nova's register macro came from me. I am also intimately familiar with it due
to usage with the nova memory management series:
https://lore.kernel.org/all/20260120204303.3229303-1-joelagnelf@nvidia.com/

>> At least, he suggested adding a `MAINTAINERS` entry, which I agreed it
>> was a good idea (by the way, this patch series should add it, or at
>> least the eventual one that adds `bitfield!`).
>
> Yes it is. Alexandre, can you please add a maintenance section(s) for
> all new files?

Agreed.

-- 
Joel Fernandes

