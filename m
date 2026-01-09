Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022142.outbound.protection.outlook.com [52.101.96.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1635BDDB;
	Fri,  9 Jan 2026 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767962863; cv=fail; b=rxJ0TtBzWVWucwvsRStzk/8mUcgvDxVVDa/ZDroBcpUJvVdprQbWBfbJRM75ipvHjUefGBVUpjCjDzEuPpsydgCYp8iYUHbXobvYQp+QEaO2Z61u7EMrbQbvRU+qHnKBLeQYQgDvCjgtHoE99YFkRwQTThWGD/Su+MLPa7Qbm3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767962863; c=relaxed/simple;
	bh=XocXaOStFc4GBkJVlZaBphx+zCftHAwu03DVbgNZnVo=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=sULvlvd+b4vfEJVDsPEudxWudfufahOBGvZ5gcpp7TlARcT6/8l6Goz2JFriPaN1ftUNTDsqubD7YWvfWd7zvGkTu9X+KnAfItpLKBqaQlGHQdZ7T6qJLG8zc5jcnN1MQXQ8TbZLhztQmssFp3QRDvAnUpJKwpsApxvp9KNiEpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=g88KeMJg; arc=fail smtp.client-ip=52.101.96.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="g88KeMJg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nu/d4rhWHLKqkZUs0OUF7/mWz2Vi5ZN8Z8O1ra376FsQT7rP1XghJSxHNLcyPlLwxEzF8kHek/ouCCKL7R42qM+HqhyvHzqDEMgn/EvFyAtOFaQR9HUdlJAKqH3k10Qs7IMHq3mtguUymJixOMrL1bsEbALhV9D8LBQLHtRsMOYi6x9qo84ExjJdSJFBFqRZu5x2Hq3R3tlEP0G0oIvoXJIr0ZamuT40Io32gZdKW1Zdg8dte1Zs2d4Oc/uRQSw4yuUbuxYY+/0VwIdA/ER8NBFZSrcr4RPh1wj5uh2ta1SS8TVh3ibJVazVOQXD05z07+SaJyiCdOb0SHW2nA7tJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fj4Y4I/BvrzGyrHWg//W9bIXA4vYmqbJ7ROuIBCBKzQ=;
 b=DumqQB67kPEHEpEsOri+H10H/5NaqDtWMkCnMhy1gp47fwUywh6S6EpoHglog9j1uNuSp7nLQozQFm4eSVhYrV+z1GGF+Dxsq6LVtbjgsdPEQum5sV8DZcQfvrtfa1m7++stBS+sR97mISXbew7tdNV3mfzC31BjJX1ePeeNIGP+DFyPNXUCeahQvReER9j2yA1K8aW77dcY11F0v92vvwXcQlrQQWZ1nd9anTIIoQDSD1wGoMwpnxRiTDLPUY6RfV6tCU8FaMFwIdenHXP96wl/lbrQN/8Mkt5JripD1FZ6YW1E7arQFDH0zX4uB0jn9Zc/1jAWFMRX/8da2aNqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fj4Y4I/BvrzGyrHWg//W9bIXA4vYmqbJ7ROuIBCBKzQ=;
 b=g88KeMJgpLr+0GFah+Nw0rzP5iOISuS3oqEDq2f70ZblMvCmXiHBPiIlE2txZGcf8b4sv2VayqEcYVWm7da52QhkczemIfLkU3IZ7u4q093/HlWD8v8jFv7+F/EUuo8+eCobqo9U3n71rsnSQPSL3bXPpCA/UVvEa1nVn2u5Ay8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7184.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 12:47:37 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:47:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 12:47:36 +0000
Message-Id: <DFK2IZSN3G5Y.2ESC7WN213SYD@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@Kloenk.dev>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Alban Kurti" <kurti@invicto.ai>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 06/12] rust: pin-init: rewrite `#[pin_data]` using `syn`
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-7-lossin@kernel.org>
In-Reply-To: <20260108135127.3153925-7-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0697.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e64b83-c3a6-45a9-fde1-08de4f7d44b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|921020|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amlSNllFa21aaXB4SkNyenBiVmw5WXd3QWZjQXk5bDlxaWpFelFTYThyUHVL?=
 =?utf-8?B?Y0dyUFByWVhKU1VHVEtqaCsrc1JmanJXVkpaVHhydXpZOVNzbDFKWnhGY2R5?=
 =?utf-8?B?OW9OS0dXYUxmdEpOSGxkRmd5c2x5Vi85Vzl4MGJPM2xXTVNqZWNjVk9KOW5T?=
 =?utf-8?B?elhTaUloRDRSU0xxUG9MUmFnOW81eDZ0UDhzdDlFbDdBSnBkcVdidVdCRE96?=
 =?utf-8?B?TllPU2ZwMlRPR0FIcUxZNEtiWWZDYXNiTlN3dWk5L1A0ZXE1U2lzMENRRTVN?=
 =?utf-8?B?TjV3Z2tYdHdRU1J0TXFsWG9DUUdzYUhkS29HUTVwb2poNU81MGkzMWl3aEl6?=
 =?utf-8?B?UC81UktvN0JTY2liU2xCUElhSWtoYk5la3lYWFA2eENoaTU5SEIvNE8xS3Rq?=
 =?utf-8?B?d2oyTVhzQ21neno1d21SWlcrSnRRN2JjYjZiZVdIdEg2ZkwrSzdmU05iRERD?=
 =?utf-8?B?MjN6MzY5UXJUWWNCZ2owSGVuRklJZHlONWZaSmw1RTlGSFNvVzA0SnB3SFhs?=
 =?utf-8?B?Lzd5aHRVbXBIdzNDNFhZODE1dTNlRTRuOWZVa3ArejcvSnBuS1pESGNCV3hI?=
 =?utf-8?B?cFo4clRCRGNnT1dkSm50dmJ6cVhzbGtnbFJZVlZ4bDRsb0ZaOXdqd3MyNkZ5?=
 =?utf-8?B?Mnc1My9tYWJnbko2S1VwTURlOGpRSG5QOFYvQktTdkYvVmVVaS81bk90cWNa?=
 =?utf-8?B?Tm5vajVDYTR2YUVlQWJ5M2p2ZldhaHg4VzZ2SG84djA5SjNPdnMvS25mNHd2?=
 =?utf-8?B?T2gwek9kWGRlK3JwaUh5YnhxWUpsaHQ1SGZFamJXQUVqSllrbVIvd1Zuc0pm?=
 =?utf-8?B?VVgzang4RTJPUlFHQWlPcWFZMlBucjM4UVl5bXREZHJOcmZKZlBYb1NZdTFy?=
 =?utf-8?B?c1VVUEJrRldaZVFDQ2FpZHNleTZOM0tBWHFZYmZ2d0tDK0V5N2FHd1lwQmVw?=
 =?utf-8?B?S2UyR09CVzE0YjBqanh3cnQzdU1vQTliamgvaHpZa05saXJUZUxoY0Q3KzBI?=
 =?utf-8?B?UVduY0NUUmVPTzRoV2pabEFIcVZRRTRLSUlzemZya2VrZU03ZmNHRnVhcWJB?=
 =?utf-8?B?bEhZbW84MEg0OS9hejMyLzF5eVk3dy80WjYrdzAwTVBJV1Vad1UzbDVmc2lY?=
 =?utf-8?B?U3pXVVlGQ3dJUWdVTXc5Vi91clJhYkJESUtiK213NldsbFArN1hnTW1SbVRV?=
 =?utf-8?B?RXBuWXhlcEZSdEVBUUNQeE04anVCZEZqOEFYSE1OS2xoNjV5dThrL1l4L05E?=
 =?utf-8?B?bU8rM0xOYWh1ajNGaElQZkxmblUrUmdJOVErdE9TeFdwSm1ZZFE4ZFVXR21P?=
 =?utf-8?B?cTRzYzdmVS94MWZjRDFxa0xEbGE3RHRNeVBwejN4UXZKZnlCOXZ3c2FpaUQr?=
 =?utf-8?B?RVdWcFRzNmFFZmVGdS9iVHJYTkVoRVVqK1haT3Y2SUQzbTEybDlSY1RQK0FK?=
 =?utf-8?B?SlZYNUh3YldlemdiODR5VnV2OEpmQ1F6cGZxREVPS1NwSzRmVDVndlZmRFB0?=
 =?utf-8?B?WCtZTjUvOU9sVFRldDhjMXpiUnlITjFsaGNUL2cyY3hsWlV2SUFhYkZWa2tB?=
 =?utf-8?B?QWZXSGtiMHBZUDhMeXY3a0lseWc3c2poOWwycGs4SXN6MHlERXlPZVRpNlZQ?=
 =?utf-8?B?RHlRT3kyYVl1Y3Q3ZVE2ZDJycGZieS96QnY4Vmw4Ulg5VnkrT1NqeEZoR0RP?=
 =?utf-8?B?c0drQktLajhaakVNeURDQVFEbnVZbkkvZlR0Ri81YTNpaHJpY2JwdlVzdFNJ?=
 =?utf-8?B?R3hnMUVrQlVBY1RKUWFYc29ZSHRZd291WXlsM0JRWGVrb2RWeVFQTXJPMStY?=
 =?utf-8?B?T1B2R1RwVHpUQ09rYUh2MFFoeUd5YjZRUTVGelZvbGpHTVlwS1lESk1OZnZw?=
 =?utf-8?B?U2R3VmwxYUQ3T2Y2OHAyWnFObkRpNE10ZmpZekpPa3BGSU5jVW5FVkFONE5a?=
 =?utf-8?B?bDIzTGE3Q3BteG9KK0NGUy9TSUd0V3RZOVV3VzNYMGs5Z1RBak1uRy95anBp?=
 =?utf-8?Q?IT4wocU5DaVHqaNzeQ3/DXBHbBrrS0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(921020)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVRSK0k4MWFKd3NtMWVwUlNHT3Y4T2l4L1pJd21NdXRkYzhveWtqY0toVEtU?=
 =?utf-8?B?YVhCakx5eXc4UVhTc2tkbnRGbEhPOHplYVE2eDZpeUtQWmM3a29QcmpzUW9z?=
 =?utf-8?B?Sk5TRDlMN0VaZHNsSjczYktSUnJZYVlVV0RmRlhJYmh5NFR6aS9weGc3Rzkv?=
 =?utf-8?B?cm5MdzZIYnI4N0RsM3RJc0t3Y3NoaEMwUTdqelhtVjhJTkpVQWlMTDBtNVpI?=
 =?utf-8?B?Nmlvc0l4M1NKYUp5TDVsT3l1VTJIN24rY2hpUVpQWmpZZmlHT3FubDdZRlo3?=
 =?utf-8?B?N2ZHckxQVnhjSW81dG1xc2tiNW5FNVo3dHgxUUU2VTNRWmloVW9FZUFtTlRE?=
 =?utf-8?B?WU1QWXZWVHZCSlNNVTdnWDhzNmh4VXdzLzFwSFMvMDJId3hTYWFhajNUWjU1?=
 =?utf-8?B?M00zTEtWS2U4YzFSdkRuNnV2Mnc4K003ay9jcEpsQ2JZWUJxK01sV3BKZERW?=
 =?utf-8?B?eEJTN1I4VkZzeVNXb1BVQmxEZGdjMGxZbUNsV3ZiTzBFZGFsRTVEQkpBYjBw?=
 =?utf-8?B?dEpVNE8yUnEwMlZEK1FDSVp5UEpuQUx1MGpWVHVtakRTbm5Ocks0aDliWThB?=
 =?utf-8?B?dS9YMWJZdm1ORWJOTnlVSTF3alZsUlc0OXdIOW9hdW5QSGJMREZUNk15ZDhs?=
 =?utf-8?B?NndieXMvV29LMUVqUHhFb0Ewc3duY3JQZ2JxUFc5YW85VUZSV2Q2SFc1RUc2?=
 =?utf-8?B?RW9UNnhlZ0xpNHlidkRLWGJzRnBwS3FvTUJuVXdOL0lVRDZOdlQxY3YrQ1oz?=
 =?utf-8?B?OE0vVWxpeThqMGw3VGkyY0NwekRUUVlSUkNEUDlvU285NTRNSWhqamswQkFD?=
 =?utf-8?B?UTlhdDJPN0p1UXAxMXk2NGJ0QW8vRWVDSU9Ud21UOXZtaE9idVZLQSt6a1dq?=
 =?utf-8?B?cTRJNHRWQlFQemFjaGk2TW9rczhrMXFPeVhoWEtWbytFN0xOQ0RZWUp0MWZJ?=
 =?utf-8?B?MmFpSDZZc3U4OU9rU0FudjZZVHVGcklQRUVHaUNyWEV4SjBaeE1wOWpLQzFH?=
 =?utf-8?B?Zm9YWmkyZm9tcmJJTmhidGgvcUJQQm1abi96ZEEvMHBZRHhadlJid0tLckYw?=
 =?utf-8?B?bUt0a2tpV0FsbXJNa212UVFvam0vOW05ekZBQ1YyUXJLUGtKampINlRMV2Zu?=
 =?utf-8?B?QVZoeHM3ZFlXV2JvSHUxVFhYUys1YjBYQjRNSG5VQStORjVQVG1jRi8zaWRv?=
 =?utf-8?B?bm9NN0FkWlhhRzI1alI1eWtqc2Y4eloya012U3ZtNlA4Mm1NL01ucTkwZCs1?=
 =?utf-8?B?RE13ZEg5cGZRUnFqVllDdnQ0TXJ4T2Vrc0tDSlpmVWhkS1RHTzhaWmdtTUVh?=
 =?utf-8?B?VzRsbWE3c2srR1daeTFBci9qelBuS3FtRFFhTkFaYXBnZ2xsZEhLQjR5Vkh4?=
 =?utf-8?B?SFViZFdhUWtVaTdnVTlKYXp5QUpYOUd1WDhsODJtaW9GdVNLL0JrbVNDU0ow?=
 =?utf-8?B?NVpobHBZSGNIMUl3TzZYMVRCcFNDSkdCNkxjb3R3THhjUllTcDJyQ1YxWnpa?=
 =?utf-8?B?M0E4VGcyc3RzcmJmNU4wUjZWRzV5RDQ3RFBiRlViRzFaR2R2ZUtObXV4WnN5?=
 =?utf-8?B?RDd0STVFSXdNU1lZbEViVVRmcE05cW8xaEM4aXBHVmQyam9pbU5zRWpsWHlN?=
 =?utf-8?B?QXlBNThPMnBXa0EwbFd4c0xBN05zWm1IalVKSm4vTVFzQmE1NFkvcjdVQ3JK?=
 =?utf-8?B?Ty91Um1oUk5SblhPOHA5WFJaQ3g4cWlIWCtsR2t5NTlUN0Rhci9kRHZIUHRz?=
 =?utf-8?B?cmVnVHZzNWREd3VBaytpYWZZdjlOcUlaRmNFclRCZ1VwS2dBSE01T2Z6Z2ZW?=
 =?utf-8?B?L3FuK0gxMTYvRFVuZVA1dnlZNnVkUDRNMWVRRExwb2F0MmJpTXhUQmlLNlJa?=
 =?utf-8?B?T2JqeHNJVjlxeGcwR2ZMNWZMTloxdkVxSUZVWllQY3VhVjN6VVRkeEVrVnhW?=
 =?utf-8?B?ZnJBSVN0NVlhaXpwT0c0WFBFOXU2Vkovd0pSSmJiYjlHcllsUjNnWHR4bWJl?=
 =?utf-8?B?bTk4UTdxdnpwWmZ1TDMrSEIxeFdJbXF4N05YdkJmdUNsNWNmemRSdkpXc1Ez?=
 =?utf-8?B?L3Rwd1NjR2V1VXFEd0tOSFI4VlU0em5PYjMwdUIwb2pFR2NvRHUzNktmc3Jy?=
 =?utf-8?B?a3NVOU9KVHRKd0hPYXpPNlF2ME5PbzYwOVFoZlZNTFlINVptU2hpUStpblZH?=
 =?utf-8?B?bVQ2ZnY2bDZvVjBmME40QnJHcktvVWVwSURNcUF4OVRmdXhtUWdxUWdkYWda?=
 =?utf-8?B?eWlOMzVuL1NrYkVOVDhVYmxXOXhMWWtTNnpuR0JlOFkwMUg5WFVFS244RGV4?=
 =?utf-8?B?ZnJmbCtqQWxwMTBUWkd6MDR4NXFvUit1UGFXZXAwbFk3cS9uUi9wQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e64b83-c3a6-45a9-fde1-08de4f7d44b4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:47:37.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgadtYYKUreWEP1/cPQ+QCsO+PWqh4E4F1GTjX6/03ietsTkIyUkMVyDuMda2wP2Fo58eYCzFfeXjM/1c+z1ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7184

On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
> Rewrite the attribute macro `#[pin_data]` using `syn`. No functional
> changes intended aside from improved error messages on syntactic and
> semantical errors. For example if one forgets a comma at the end of a
> field:
>
>     #[pin_data]
>     struct Foo {
>         a: Box<Foo>
>         b: Box<Foo>
>     }
>
> The declarative macro reports the following errors:
>
>     error: expected `,`, or `}`, found `b`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:5:16
>       |
>     5 |     a: Box<Foo>
>       |                ^ help: try adding a comma: `,`
>
>     error: recursion limit reached while expanding `$crate::__pin_data!`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:3:1
>       |
>     3 | #[pin_data]
>       | ^^^^^^^^^^^
>       |
>       =3D help: consider increasing the recursion limit by adding a `#![r=
ecursion_limit =3D "256"]` attribute to your crate (`$CRATE`)
>       =3D note: this error originates in the macro `$crate::__pin_data` w=
hich comes from the expansion of the attribute macro `pin_data` (in Nightly=
 builds, run with -Z macro-backtrace for more info)
>
> The new `syn` version reports:
>
>     error: expected `,`, or `}`, found `b`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:5:16
>       |
>     5 |     a: Box<Foo>
>       |                ^ help: try adding a comma: `,`
>
>     error: expected `,`
>      --> tests/ui/compile-fail/pin_data/missing_comma.rs:6:5
>       |
>     6 |     b: Box<Foo>
>       |     ^
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/internal/src/helpers.rs  | 149 ------
>  rust/pin-init/internal/src/lib.rs      |  12 +-
>  rust/pin-init/internal/src/pin_data.rs | 645 ++++++++++++++++++++-----
>  rust/pin-init/src/macros.rs            | 574 ----------------------
>  4 files changed, 543 insertions(+), 837 deletions(-)
>  delete mode 100644 rust/pin-init/internal/src/helpers.rs
>
> diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/inter=
nal/src/pin_data.rs
> index 86a53b37cc66..d1e7ed121860 100644
> --- a/rust/pin-init/internal/src/pin_data.rs
> +++ b/rust/pin-init/internal/src/pin_data.rs
> @@ -1,126 +1,549 @@
>  // SPDX-License-Identifier: Apache-2.0 OR MIT
> =20
> -use crate::helpers::{parse_generics, Generics};
> -use proc_macro2::{Group, Punct, Spacing, TokenStream, TokenTree};
> -use quote::quote;
> +use proc_macro2::TokenStream;
> +use quote::{format_ident, quote};
> +use syn::{
> +    parse::{End, Nothing, Parse},
> +    parse_quote, parse_quote_spanned,
> +    spanned::Spanned,
> +    visit_mut::VisitMut,
> +    Error, Field, Ident, Item, ItemStruct, PathSegment, Result, Type, Ty=
pePath, WhereClause,
> +};
> =20
> -pub(crate) fn pin_data(args: TokenStream, input: TokenStream) -> TokenSt=
ream {
> -    // This proc-macro only does some pre-parsing and then delegates the=
 actual parsing to
> -    // `pin_init::__pin_data!`.
> +pub(crate) mod kw {
> +    syn::custom_keyword!(PinnedDrop);
> +}
> +
> +pub(crate) enum Args {
> +    Nothing(Nothing),
> +    #[allow(dead_code)]
> +    PinnedDrop(kw::PinnedDrop),
> +}
> +
> +impl Parse for Args {
> +    fn parse(input: syn::parse::ParseStream) -> Result<Self> {
> +        let lh =3D input.lookahead1();
> +        if lh.peek(End) {
> +            input.parse().map(Self::Nothing)

How about make this `impl Parse for Option<Args>` and remove the nothing
variant? It looks a bit weird.

> +        } else if lh.peek(kw::PinnedDrop) {
> +            let res =3D input.parse().map(Self::PinnedDrop)?;
> +            let lh =3D input.lookahead1();
> +            if lh.peek(End) {
> +                Ok(res)
> +            } else {
> +                Err(lh.error())
> +            }
> +        } else {
> +            Err(lh.error())
> +        }
> +    }
> +}
> +
> +pub(crate) fn pin_data(args: Args, input: Item) -> Result<TokenStream> {
> +    let mut struct_ =3D match input {
> +        Item::Struct(struct_) =3D> struct_,
> +        Item::Enum(enum_) =3D> {
> +            return Err(Error::new_spanned(
> +                enum_.enum_token,
> +                "`#[pin_data]` only supports structs for now",
> +            ));
> +        }
> +        Item::Union(union) =3D> {
> +            return Err(Error::new_spanned(
> +                union.union_token,
> +                "`#[pin_data]` only supports structs for now",
> +            ));
> +        }
> +        rest =3D> {
> +            return Err(Error::new_spanned(
> +                rest,
> +                "`#[pin_data]` can only be applied to struct, enum and u=
nion defintions",
> +            ));
> +        }
> +    };
> +
> +    // The generics might contain the `Self` type. Since this macro will=
 define a new type with the
> +    // same generics and bounds, this poses a problem: `Self` will refer=
 to the new type as opposed
> +    // to this struct definition. Therefore we have to replace `Self` wi=
th the concrete name.
> +    let mut replacer =3D {
> +        let name =3D &struct_.ident;
> +        let (_, ty_generics, _) =3D struct_.generics.split_for_impl();
> +        SelfReplacer(parse_quote!(#name #ty_generics))
> +    };
> +    replacer.visit_generics_mut(&mut struct_.generics);
> +    replacer.visit_fields_mut(&mut struct_.fields);
> +
> +    let mut error: Option<Error> =3D None;

I would probably just collect into a `Vec` and merge at the end.

> +    for field in &struct_.fields {
> +        if !is_field_structurally_pinned(field) && is_phantom_pinned(&fi=
eld.ty) {
> +            let mut err =3D Error::new_spanned(
> +                field,
> +                format!(
> +                    "The field `{}` of type `PhantomData` only has an ef=
fect \

You mean PhantomPinned?

> +                if it has the `#[pin]` attribute",
> +                    field.ident.as_ref().expect(""),
> +                ),
> +            );
> +            if let Some(mut error) =3D error.take() {
> +                error.combine(err);
> +                err =3D error;
> +            }
> +            error =3D Some(err);
> +        }
> +    }
> +
> +    let unpin_impl =3D generate_unpin_impl(&struct_);
> +    let drop_impl =3D generate_drop_impl(&struct_, args);
> +    let projections =3D generate_projections(&struct_);
> +    let the_pin_data =3D generate_the_pin_data(&struct_);
> +
> +    strip_pin_annotations(&mut struct_);
> +
> +    let error =3D error.map(|e| e.into_compile_error());
> +
> +    Ok(quote! {
> +        #struct_
> +        #projections
> +        // We put the rest into this const item, because it then will no=
t be accessible to anything
> +        // outside.
> +        const _: () =3D {
> +            #the_pin_data
> +            #unpin_impl
> +            #drop_impl
> +        };
> +        #error
> +    })
> +}
> +
> +fn is_phantom_pinned(ty: &Type) -> bool {
> +    match ty {
> +        Type::Path(TypePath { qself: None, path }) =3D> {
> +            // Cannot possibly refer to `PhantomPinned` (except alias, b=
ut that's on the user).
> +            if path.segments.len() > 3 {
> +                return false;
> +            }
> +            // If there is a `::`, then the path needs to be `::core::ma=
rker::PhantomPinned` or
> +            // `::std::marker::PhantomPinned`.
> +            if path.leading_colon.is_some() && path.segments.len() !=3D =
3 {
> +                return false;
> +            }
> +            let expected: Vec<&[&str]> =3D vec![&["PhantomPinned"], &["m=
arker"], &["core", "std"]];
> +            for (actual, expected) in path.segments.iter().rev().zip(exp=
ected) {
> +                if !actual.arguments.is_empty() || expected.iter().all(|=
e| actual.ident !=3D e) {
> +                    return false;
> +                }
> +            }
> +            true
> +        }
> +        _ =3D> false,
> +    }
> +}
> +
> +fn is_field_structurally_pinned(field: &Field) -> bool {
> +    field.attrs.iter().any(|a| a.path().is_ident("pin"))
> +}
> =20
> +fn generate_unpin_impl(
> +    ItemStruct {
> +        ident,
> +        generics,
> +        fields,
> +        ..
> +    }: &ItemStruct,
> +) -> TokenStream {
> +    let generics_with_pinlt =3D {

Can you name this `generics_with_pin_lt`? Otherwise I read it as a misspell=
ed
`pinit` :)

> +        let mut g =3D generics.clone();
> +        g.params.insert(0, parse_quote!('__pin));
> +        let _ =3D g.make_where_clause();
> +        g
> +    };
>      let (
> +        impl_generics_with_pinlt,
> +        ty_generics_with_pinlt,
> +        Some(WhereClause {
> +            where_token,
> +            predicates,
> +        }),
> +    ) =3D generics_with_pinlt.split_for_impl()
> +    else {
> +        unreachable!()
> +    };
> +    let (_, ty_generics, _) =3D generics.split_for_impl();
> +    let mut pinned_fields =3D fields
>          .iter()
> +        .filter(|f| is_field_structurally_pinned(f))
> +        .cloned()
> +        .collect::<Vec<_>>();
> +    for field in &mut pinned_fields {
> +        field.attrs.retain(|a| !a.path().is_ident("pin"));
> +    }
> +    quote! {
> +        // This struct will be used for the unpin analysis. It is needed=
, because only structurally
> +        // pinned fields are relevant whether the struct should implemen=
t `Unpin`.
> +        #[allow(dead_code)] // The fields below are never used.
> +        struct __Unpin #generics_with_pinlt
> +        #where_token
> +            #predicates
> +        {
> +            __phantom_pin: ::core::marker::PhantomData<fn(&'__pin ()) ->=
 &'__pin ()>,
> +            __phantom: ::core::marker::PhantomData<
> +                fn(#ident #ty_generics) -> #ident #ty_generics
> +            >,
> +            #(#pinned_fields),*
> +        }
> +
> +        #[doc(hidden)]
> +        impl #impl_generics_with_pinlt ::core::marker::Unpin for #ident =
#ty_generics
> +        #where_token
> +            __Unpin #ty_generics_with_pinlt: ::core::marker::Unpin,
> +            #predicates
> +        {}
> +    }
> +}
> +
> +fn generate_drop_impl(
> +    ItemStruct {
> +        ident, generics, ..
> +    }: &syn::ItemStruct,
> +    args: Args,
> +) -> TokenStream {
> +    let (impl_generics, ty_generics, whr) =3D generics.split_for_impl();
> +    let has_pinned_drop =3D matches!(args, Args::PinnedDrop(_));
> +    // We need to disallow normal `Drop` implementation, the exact behav=
ior depends on whether
> +    // `PinnedDrop` was specified in `args`.
> +    if has_pinned_drop {
> +        // When `PinnedDrop` was specified we just implement `Drop` and =
delegate.
> +        quote! {
> +            impl #impl_generics ::core::ops::Drop for #ident #ty_generic=
s
> +                #whr
> +            {
> +                fn drop(&mut self) {
> +                    // SAFETY: Since this is a destructor, `self` will n=
ot move after this function
> +                    // terminates, since it is inaccessible.
> +                    let pinned =3D unsafe { ::core::pin::Pin::new_unchec=
ked(self) };
> +                    // SAFETY: Since this is a drop function, we can cre=
ate this token to call the
> +                    // pinned destructor of this type.
> +                    let token =3D unsafe { ::pin_init::__internal::OnlyC=
allFromDrop::new() };
> +                    ::pin_init::PinnedDrop::drop(pinned, token);
>                  }
> -                Some(res)
>              }
> -            _ =3D> None,
> -        })
> -        .unwrap_or_else(|| {
> -            // If we did not find the name of the struct then we will us=
e `Self` as the replacement
> -            // and add a compile error to ensure it does not compile.
> -            errs.extend(
> -                "::core::compile_error!(\"Could not locate type name.\")=
;"
> -                    .parse::<TokenStream>()
> -                    .unwrap(),
> -            );
> -            "Self".parse::<TokenStream>().unwrap().into_iter().collect()
> -        });
> -    let impl_generics =3D impl_generics
> -        .into_iter()
> -        .flat_map(|tt| replace_self_and_deny_type_defs(&struct_name, tt,=
 &mut errs))
> -        .collect::<Vec<_>>();
> -    let mut rest =3D rest
> -        .into_iter()
> -        .flat_map(|tt| {
> -            // We ignore top level `struct` tokens, since they would emi=
t a compile error.
> -            if matches!(&tt, TokenTree::Ident(i) if i =3D=3D "struct") {
> -                vec![tt]
> +        }
> +    } else {
> +        // When no `PinnedDrop` was specified, then we have to prevent i=
mplementing drop.
> +        quote! {
> +            // We prevent this by creating a trait that will be implemen=
ted for all types implementing
> +            // `Drop`. Additionally we will implement this trait for the=
 struct leading to a conflict,
> +            // if it also implements `Drop`
> +            trait MustNotImplDrop {}
> +            #[expect(drop_bounds)]
> +            impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
> +            impl #impl_generics MustNotImplDrop for #ident #ty_generics
> +                #whr
> +            {}
> +            // We also take care to prevent users from writing a useless=
 `PinnedDrop` implementation.
> +            // They might implement `PinnedDrop` correctly for the struc=
t, but forget to give
> +            // `PinnedDrop` as the parameter to `#[pin_data]`.
> +            #[expect(non_camel_case_types)]
> +            trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {=
}
> +            impl<T: ::pin_init::PinnedDrop>
> +                UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for=
 T {}
> +            impl #impl_generics
> +                UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for=
 #ident #ty_generics
> +                #whr
> +            {}
> +        }
> +    }
> +}
> +
> +fn generate_projections(
> +    ItemStruct {
> +        vis,
> +        ident,
> +        generics,
> +        fields,
> +        ..
> +    }: &ItemStruct,
> +) -> TokenStream {
> +    let (og_impl_gen, og_ty_gen, _) =3D generics.split_for_impl();

Please make sure the names match the early generate_ function, so impl_gene=
rics,
ty_generics for the original ones, and _with_pin_lt for the ones with lifet=
ime
added.

> +    let mut generics =3D generics.clone();
> +    generics.params.insert(0, parse_quote!('__pin));
> +    let (_, ty_gen, whr) =3D generics.split_for_impl();
> +    let projection =3D format_ident!("{ident}Projection");
> +    let this =3D format_ident!("this");
> +
> +    let (fields_decl, fields_proj) =3D collect_tuple(fields.iter().map(
> +        |f @ Field {
> +             vis,
> +             ident,
> +             ty,
> +             attrs,
> +             ..
> +         }| {
> +            let mut attrs =3D attrs.clone();
> +            attrs.retain(|a| !a.path().is_ident("pin"));
> +            let mut no_doc_attrs =3D attrs.clone();
> +            no_doc_attrs.retain(|a| !a.path().is_ident("doc"));
> +            let ident =3D ident
> +                .as_ref()
> +                .expect("only structs with named fields are supported");
> +            if is_field_structurally_pinned(f) {
> +                (
> +                    quote!(
> +                        #(#attrs)*
> +                        #vis #ident: ::core::pin::Pin<&'__pin mut #ty>,
> +                    ),
> +                    quote!(
> +                        #(#no_doc_attrs)*
> +                        // SAFETY: this field is structurally pinned.
> +                        #ident: unsafe { ::core::pin::Pin::new_unchecked=
(&mut #this.#ident) },
> +                    ),
> +                )
>              } else {
> -                replace_self_and_deny_type_defs(&struct_name, tt, &mut e=
rrs)
> +                (
> +                    quote!(
> +                        #(#attrs)*
> +                        #vis #ident: &'__pin mut #ty,
> +                    ),
> +                    quote!(
> +                        #(#no_doc_attrs)*
> +                        #ident: &mut #this.#ident,
> +                    ),
> +                )
>              }
> -        })
> -        .collect::<Vec<_>>();
> -    // This should be the body of the struct `{...}`.
> -    let last =3D rest.pop();
> -    let mut quoted =3D quote!(::pin_init::__pin_data! {
> -        parse_input:
> -        @args(#args),
> -        @sig(#(#rest)*),
> -        @impl_generics(#(#impl_generics)*),
> -        @ty_generics(#(#ty_generics)*),
> -        @decl_generics(#(#decl_generics)*),
> -        @body(#last),
> -    });
> -    quoted.extend(errs);
> -    quoted
> +        },
> +    ));
> +    let structurally_pinned_fields_docs =3D fields
> +        .iter()
> +        .filter(|f| is_field_structurally_pinned(f))
> +        .map(|Field { ident, .. }| {
> +            let doc =3D format!(" - `{}`", ident.as_ref().expect(""));

I'd just use `unwrap` over `expect("")`.

> +            quote!(#[doc =3D #doc])
> +        });
> +    let not_structurally_pinned_fields_docs =3D fields
> +        .iter()
> +        .filter(|f| !is_field_structurally_pinned(f))
> +        .map(|Field { ident, .. }| {
> +            let doc =3D format!(" - `{}`", ident.as_ref().expect(""));
> +            quote!(#[doc =3D #doc])
> +        });

Instead of building the `#[doc =3D ...]` streams for each field, I think we=
 should just build the
docs entirely and insert in one go.

> +    let docs =3D format!(" Pin-projections of [`{ident}`]");
> +    quote! {
> +        #[doc =3D #docs]
> +        #[allow(dead_code)]
> +        #[doc(hidden)]
> +        #vis struct #projection #generics {
> +            #(#fields_decl)*
> +            ___pin_phantom_data: ::core::marker::PhantomData<&'__pin mut=
 ()>,
> +        }
> +
> +        impl #og_impl_gen #ident #og_ty_gen
> +            #whr
> +        {
> +            /// Pin-projects all fields of `Self`.
> +            ///
> +            /// These fields are structurally pinned:
> +            #(#structurally_pinned_fields_docs)*
> +            ///
> +            /// These fields are **not** structurally pinned:
> +            #(#not_structurally_pinned_fields_docs)*
> +            #[inline]
> +            #vis fn project<'__pin>(
> +                self: ::core::pin::Pin<&'__pin mut Self>,
> +            ) -> #projection #ty_gen {
> +                // SAFETY: we only give access to `&mut` for fields not =
structurally pinned.
> +                let #this =3D unsafe { ::core::pin::Pin::get_unchecked_m=
ut(self) };
> +                #projection {
> +                    #(#fields_proj)*
> +                    ___pin_phantom_data: ::core::marker::PhantomData,
> +                }
> +            }
> +        }
> +    }
>  }
> =20
> +fn generate_the_pin_data(
> +    ItemStruct {
> +        generics,
> +        fields,
> +        ident,
> +        vis,
> +        ..
> +    }: &syn::ItemStruct,
> +) -> TokenStream {
> +    let (impl_generics, ty_generics, whr) =3D generics.split_for_impl();
> +
> +    // For every field, we create an initializing projection function ac=
cording to its projection
> +    // type. If a field is structurally pinned, then it must be initiali=
zed via `PinInit`, if it is
> +    // not structurally pinned, then it can be initialized via `Init`.
> +    //
> +    // The functions are `unsafe` to prevent accidentally calling them.
> +    fn handle_field(
> +        Field {
> +            vis,
> +            ident,
> +            ty,
> +            attrs,
> +            ..
> +        }: &Field,
> +        struct_ident: &Ident,
> +        pinned: bool,
> +    ) -> TokenStream {
> +        let mut attrs =3D attrs.clone();
> +        attrs.retain(|a| !a.path().is_ident("pin"));
> +        let ident =3D ident
> +            .as_ref()
> +            .expect("only structs with named fields are supported");
> +        let project_ident =3D format_ident!("__project_{ident}");
> +        let (init_ty, init_fn, project_ty, project_body, pin_safety) =3D=
 if pinned {
> +            (
> +                quote!(PinInit),
> +                quote!(__pinned_init),
> +                quote!(::core::pin::Pin<&'__slot mut #ty>),
> +                // SAFETY: this field is structurally pinned.
> +                quote!(unsafe { ::core::pin::Pin::new_unchecked(slot) })=
,
> +                quote!(
> +                    #[doc =3D " - `slot` will not move until it is dropp=
ed, i.e. it will be pinned."]

This can just be /// ...

> +                ),
> +            )
> +        } else {
> +            (
> +                quote!(Init),
> +                quote!(__init),
> +                quote!(&'__slot mut #ty),
> +                quote!(slot),
> +                quote!(),
> +            )
> +        };
> +        let slot_safety =3D format!(
> +            " `slot` points at the field `{ident}` inside of `{struct_id=
ent}`, which is pinned.",
> +        );
> +        quote! {
> +            /// # Safety
> +            ///
> +            /// - `slot` is a valid pointer to uninitialized memory.
> +            /// - the caller does not touch `slot` when `Err` is returne=
d, they are only permitted
> +            ///   to deallocate.
> +            #pin_safety
> +            #(#attrs)*
> +            #vis unsafe fn #ident<E>(
> +                self,
> +                slot: *mut #ty,
> +                init: impl ::pin_init::#init_ty<#ty, E>,
> +            ) -> ::core::result::Result<(), E> {
> +                // SAFETY: this function has the same safety requirement=
s as the __init function
> +                // called below.
> +                unsafe { ::pin_init::#init_ty::#init_fn(init, slot) }
> +            }
> +
> +            /// # Safety
> +            ///
> +            #[doc =3D #slot_safety]
> +            #(#attrs)*
> +            #vis unsafe fn #project_ident<'__slot>(
> +                self,
> +                slot: &'__slot mut #ty,
> +            ) -> #project_ty {
> +                #project_body
> +            }
> +        }
> +    }
> +
> +    let field_accessors =3D fields
> +        .iter()
> +        .map(|f| handle_field(f, ident, is_field_structurally_pinned(f))=
)
> +        .collect::<TokenStream>();
> +    quote! {
> +        // We declare this struct which will host all of the projection =
function for our type. It
> +        // will be invariant over all generic parameters which are inher=
ited from the struct.
> +        #[doc(hidden)]
> +        #vis struct __ThePinData #generics
> +            #whr
>          {
> -            errs.extend(
> -                format!(
> -                    "::core::compile_error!(\"Cannot use `{i}` inside of=
 struct definition with \
> -                        `#[pin_data]`.\");"
> -                )
> -                .parse::<TokenStream>()
> -                .unwrap()
> -                .into_iter()
> -                .map(|mut tok| {
> -                    tok.set_span(tt.span());
> -                    tok
> -                }),
> -            );
> -            vec![tt]
> -        }
> -        TokenTree::Ident(i) if i =3D=3D "Self" =3D> struct_name.clone(),
> -        TokenTree::Literal(_) | TokenTree::Punct(_) | TokenTree::Ident(_=
) =3D> vec![tt],
> -        TokenTree::Group(g) =3D> vec![TokenTree::Group(Group::new(
> -            g.delimiter(),
> -            g.stream()
> -                .into_iter()
> -                .flat_map(|tt| replace_self_and_deny_type_defs(struct_na=
me, tt, errs))
> -                .collect(),
> -        ))],
> +            __phantom: ::core::marker::PhantomData<
> +                fn(#ident #ty_generics) -> #ident #ty_generics
> +            >,
> +        }
> +
> +        impl #impl_generics ::core::clone::Clone for __ThePinData #ty_ge=
nerics
> +            #whr
> +        {
> +            fn clone(&self) -> Self { *self }
> +        }
> +
> +        impl #impl_generics ::core::marker::Copy for __ThePinData #ty_ge=
nerics
> +            #whr
> +        {}
> +
> +        #[allow(dead_code)] // Some functions might never be used and pr=
ivate.
> +        #[expect(clippy::missing_safety_doc)]
> +        impl #impl_generics __ThePinData #ty_generics
> +            #whr
> +        {
> +            #field_accessors
> +        }
> +
> +        // SAFETY: We have added the correct projection functions above =
to `__ThePinData` and
> +        // we also use the least restrictive generics possible.
> +        unsafe impl #impl_generics ::pin_init::__internal::HasPinData fo=
r #ident #ty_generics
> +            #whr
> +        {
> +            type PinData =3D __ThePinData #ty_generics;
> +
> +            unsafe fn __pin_data() -> Self::PinData {
> +                __ThePinData { __phantom: ::core::marker::PhantomData }
> +            }
> +        }
> +
> +        // SAFETY: TODO
> +        unsafe impl #impl_generics ::pin_init::__internal::PinData for _=
_ThePinData #ty_generics
> +            #whr
> +        {
> +            type Datee =3D #ident #ty_generics;
> +        }
> +    }
> +}
> +
> +fn strip_pin_annotations(struct_: &mut syn::ItemStruct) {
> +    for field in &mut struct_.fields {
> +        field.attrs.retain(|a| !a.path().is_ident("pin"));
> +    }
> +}

Multiple places have similar things for stripping annotations and checking =
if
structurally pinned. Would it make sense to do this at the very beginning, =
and
build a `HashSet` of structurally pinned fields, and use that as canonical
source for all generate_ functions?

Best,
Gary

> +
> +struct SelfReplacer(PathSegment);
> +
> +impl VisitMut for SelfReplacer {
> +    fn visit_path_mut(&mut self, i: &mut syn::Path) {
> +        if i.is_ident("Self") {
> +            let span =3D i.span();
> +            let seg =3D &self.0;
> +            *i =3D parse_quote_spanned!(span=3D> #seg);
> +        } else {
> +            syn::visit_mut::visit_path_mut(self, i);
> +        }
> +    }
> +
> +    fn visit_path_segment_mut(&mut self, seg: &mut PathSegment) {
> +        if seg.ident =3D=3D "Self" {
> +            let span =3D seg.span();
> +            let this =3D &self.0;
> +            *seg =3D parse_quote_spanned!(span=3D> #this);
> +        } else {
> +            syn::visit_mut::visit_path_segment_mut(self, seg);
> +        }
> +    }
> +
> +    fn visit_item_mut(&mut self, _: &mut Item) {
> +        // Do not descend into items, since items reset/change what `Sel=
f` refers to.
> +    }
> +}
> +
> +// replace with `.collect()` once MSRV is above 1.79
> +fn collect_tuple<A, B>(iter: impl Iterator<Item =3D (A, B)>) -> (Vec<A>,=
 Vec<B>) {
> +    let mut res_a =3D vec![];
> +    let mut res_b =3D vec![];
> +    for (a, b) in iter {
> +        res_a.push(a);
> +        res_b.push(b);
>      }
> +    (res_a, res_b)
>  }

