Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020084.outbound.protection.outlook.com [52.101.196.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7DF2475CB;
	Tue, 27 Jan 2026 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769548245; cv=fail; b=UdjFnw/P6LOUi/A34apPg3EAqrxUh1JloidxvCbp3Ijnzyk/pfGPmv1Dc/y7kBLwcyJH897uFCNDMZ2PHoz9ziLy7PQFzoY3FJo7oYwVprHDtZNighzjNvi2syHzrIDnCflzpG+qSsLe6BwhEEEDJkP9HnpEIy3pI/TlaozYxR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769548245; c=relaxed/simple;
	bh=zq53Vu5NGt/PiVXgCiAOw3ybp1Zy3tMw7+VYWOpKUrw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MozW+hwEjRR10qOG7NyS2qq1PoGvEKDhYj6ZMXiBr9GPGQ8IaFHhQHOgKuX7GOZ6wnjQ9eKGbhdK2VEMcII2HQfX5//Vz2mq17LRwHqrOSWydcjsmvrX17lW93Ik7esw/Veb/pf2JmYdO8ptoIYx8QnN1HOyrViy454QvzDaZZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NHrM2NYe; arc=fail smtp.client-ip=52.101.196.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NHrM2NYe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHAUzxK50pG0Wz7R1dnrwSrddGYH6ttVKKoabCETBfFz3kbvtfjANQIWDSNhrmP2XQ6teXJOZOTjOU/cyHZNJEBe8YEAfTaKIeQS8hHJGA7vlNj06ML66pjI/1QFRASUrWdFRHmPvQnbSnWoWRZTyzKPGbHDnuqDd+y+srAhRt79WrpJXEYXoLYhClmifHC90J29ZrqCsSFMS6qTE6lBNnDEGDs7wJborgoD0r2BasFIJbKUUdzz3ac6/+ml98fZ9yUwFkIiGQxZWe8YE+6Uk3AMLWOS8MfYhtvAS8yUeR78lYZ4HqO4e/bQ/5686+Xx4g9GqCU7ulRb76Qbw0V1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hB0Wma/xNFj/I8Msfq1OR/1ehfVqnKylWxVgKAu0go=;
 b=HZ/HE/NHXZWMuUhNznWknrLilK1auB47Q08ZZkNGOuqE7PEKqzXVBpumteFbk9/4aR8pJZAmOgL78WVFwvy3LMRW5tDfOFsJ8Kti9BCog+bZC7TIAOZoQKLF1ObWDVbIUgxyXWbSmozS8aNZzqNFU6A7zW2yVhPqPkHFwOHhShgq/aCXQmhYp4YTBvtuIE3Js8X1Nzr5zoI0tLISKwQfZlucHcqyouVMyz69PPAbsEn3a2zDu0vFUHRr1EODUth+lKTZIC6CqwqT7yziaRJF/kqQMHJCUnQQwVHhWHUYT8NO+iyOnPr3Mg/5hW4lmtMaQiwhQD7bX7fCk7khr0kRfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hB0Wma/xNFj/I8Msfq1OR/1ehfVqnKylWxVgKAu0go=;
 b=NHrM2NYeR7BP/qmRVvuVobpq/2yW1K/e5GymWz0YSZWs6QimXNjwyEGqQJxlp6Zs1dJgN++42/04wlP5LcyyJgvLsAZB3YdjRWkY79p2+dvnh8KJheABAneSsMrg1z9BdvKcdM9679MOEsUnOF6qnFNjSUXKsxwt7l1it7brjs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB5000.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 21:10:40 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 21:10:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 21:10:39 +0000
Message-Id: <DFZOHYP9I47G.14DDKPXUOU4V0@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Yury Norov" <ynorov@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <aXCZeVqkDrBWr1uq@yury>
 <DFYK76F1W6QC.CCHFHL1BSD6K@nvidia.com> <aXgpKOHAmvZuMVSt@yury>
 <DFZA6JOT6OVO.FWRPGW2GN9Z0@nvidia.com>
 <2c3ddf4f-3085-4447-ab2b-1976ea0a49a2@nvidia.com>
In-Reply-To: <2c3ddf4f-3085-4447-ab2b-1976ea0a49a2@nvidia.com>
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffc8182-9c1e-47a3-d0c4-08de5de88646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWhGN0NiY1pzVDR3cmNTSWgrUzNVblVTR2s0V0swL1R1dyt6VkVpaXJPWFN0?=
 =?utf-8?B?cU9VU1JUcUdjeFByUXRoZG1DT05NTjBqYlhuWnU0ZkExM2dnZGNsYlpCSmt2?=
 =?utf-8?B?V0hldlhtNDRYWnh1aHFpRzRUV2tMRVU4NzdEV0svWnRCZngrcWVGbGFPdHpF?=
 =?utf-8?B?RElUNmlObmNNOUhkYkZhRnI2WlF5MEV1NTRWS3VOS0JTaEhuYUcxYnVJdFhG?=
 =?utf-8?B?NFVpUlRHUEJwaldyY1U0bjNXQmhJdUo0ZzdWb2JnNnp0MGYyaHA2TFpqR25Y?=
 =?utf-8?B?SGg3aWZ1U0dTOVpTaHlFQzhFVm9zNXNucG9ia1lDV1FmZ3JNNWlGSXMzTUNk?=
 =?utf-8?B?NTRLaVhHMHE5RzFuM3c4WlpXbFlTMURYRmVIYzJlQUdYcmIyYTZ6Wm9NRjVP?=
 =?utf-8?B?ZytpTGg2QUpHbEJ6Q1VxeFpFNkxya1JmSHpJUi8yYlZtTmxiV0tYODM1QS9E?=
 =?utf-8?B?L2pHRG0vUWhyMnBRcHY5eUpEL2JwV0lMODNsVTZSM21qMk1BZDdvdFRlTE9X?=
 =?utf-8?B?dForaG9JTisrYlQzOFlSeUw4bE81VUZQSkU4eGtPR293VkFtTWxTNnZBVkU3?=
 =?utf-8?B?ZHJ6YU1GSnd3SUtmR3B4eTIzdzQ5blFKWkU4d0F0WkxVcTJRczVDbVh6d0Vy?=
 =?utf-8?B?NUgrYW1CVlM0dlFaWmtObzRjcGlBSlI0Q3Z2bVVCdlk1T0dNOUFVV2tjekVu?=
 =?utf-8?B?Z280dS9pMXk4UkNLbFhka1VxZTJrbWw4Yi9Rc1phd3VsaGhwQ0draC9KZ0Jy?=
 =?utf-8?B?VFlPcUtxT1dnM2ZhQVZlSjYvcUl2ZHcxOUZNN2czY3BDTW0rL2dpVlZDRXdL?=
 =?utf-8?B?d0VpL2FoUW13YjJCeWRWT0ZvN05FL0Y2c0svc0wrSE5ka0NvWmxueE9sc1hK?=
 =?utf-8?B?bk5lZ0FJWU56cSs4aTlLVW1EbTYvQVN5bHZUT2U1WHNoY0JtOUtlTzR4ZjZO?=
 =?utf-8?B?dWl1NlNYam9vVWRzZS9PSzZqWExtQUZXcGdmbUhLMm5wWUlMUlpManl6ZE1t?=
 =?utf-8?B?NEo5UEV2dFNKdUYwZ2dZa3RTMFRKR0ZTMkFTWW5pVnplRlZXTUdDTWcreUlL?=
 =?utf-8?B?WEhUN1dGQnN1dDdQcUpNdkF0YWpvaHZyWHA3b3J3QXdZb0hZTm9uOXNXNkUy?=
 =?utf-8?B?SHliN3ROR2pxWStUdkVUWDZmVXhUT2dKM2R5TndiOUdZZjdWSEJtcjk1WXBn?=
 =?utf-8?B?SmdqTmQwSnJ5cFVsck93bTB4RVJUelg1MjV0bWk0Rm9QbS9PeUh2SWltR1Bx?=
 =?utf-8?B?blNvU3d6ODhER0R3YktPMHJJdkh3ZEdmUkx3ZHluNlBKMzRuemQzZWJQakZV?=
 =?utf-8?B?NklxRUdzK0JwV09adUtPdEpEcWpuNzZGd2hCZFI1YytVOHJvSGcwaHVYODBD?=
 =?utf-8?B?d24vaWozVFl6SENCTzdoekJwQkVYUGkzKzRNU3pLUEkzN3FJK01BL3VkUGV5?=
 =?utf-8?B?RnlndFduSnJ5dm5EbG9qck1CenhQalRkSHp1V1NtbkxEenlyS0ZuYzhvYTdr?=
 =?utf-8?B?cVZnTUlPamZWL2JaNU1LVUxIODdtb0pUbzVSbXRST3BDaFRESFhRdE5qbEZH?=
 =?utf-8?B?aDFyWGdraHkxYnZDdEhwVEpUQ1lxckx2amZwdmptNFIxQ2tOVkgrQmpSYXRr?=
 =?utf-8?B?WFg2T2U0aWYzWHFaRmtqajI4QWxVSmRkNWZKZFpIWUtod3VwdzBIT1V0REpV?=
 =?utf-8?B?WHE4VU92RS9na2U5OGxrcUh3ZXlpa3h5ZGNGdGh2clRVYXl5cnczQjdpZGhy?=
 =?utf-8?B?NEVKN3gyMDRpQ244Vnp3R2xqWUoxazM1YlhwWEY2SGlCTVlOYWQxZGFSdnk3?=
 =?utf-8?B?OGlLTEFPY0JwYVdxWWNqNEF4WTF3TVhya3RFMGJMUThCL0VwMUYzMjBGYlc5?=
 =?utf-8?B?TGZWUlpjMjROTExYRkdhazEwSGFsQzlJdlMxS09YM0JtOTl1V1lpUDdRS0ls?=
 =?utf-8?B?ZG4wblNReDZsSlRFTjdQUXBtYnpZa1VHM0JqNm5lM3hUWFU1WnQzVW5kWkJx?=
 =?utf-8?B?MVc0TWFXMFFpUlVySjlFS2tuandwR01PRkxiNGwxRERFZEN6QzhjV1lOTmdh?=
 =?utf-8?B?VUl1Y0hpWm5xYjhYVE01VFVxU0hTM01hbjBsWVlEMTk3VHVqZU1LeDAwTFVp?=
 =?utf-8?Q?KcAE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFFrZzdtaGNsWC9QMUt2M0lZRzRiUkNqbmtnaFBxSVJZaXltWGpveTNVcTV0?=
 =?utf-8?B?YnkrUkJGVzhxdWtvVWR6R2VXbER1QkFzZ1dIejJhWE9Pak9tUmtLOFlweERC?=
 =?utf-8?B?M3Y4Y1NTck5jelpDTlNrV1dvSkVEb3FHVGZSTitjTElCZ0NJYVZxZDN1cUVM?=
 =?utf-8?B?NFFuVVJRWGRIMi9IeUJESEFFNCs3N2wvNkNYNkRBa2tzTVF3OG9XRXdPbFZ5?=
 =?utf-8?B?TmpCL2NGalFZM0dCU2Z2NVR0ajNNS3hIdXdTTVJNU0gvQkdzQytKZjVDcGJV?=
 =?utf-8?B?cTg5RE5MY3VCNjJ1TkFnVVFFRFIzRENPckVlNnFlc2ZCamJnVzhma2M0R3lS?=
 =?utf-8?B?Nmd4VjFzclZFODJiR1ZXSWNEZ3gxclVoY0JwNTRoVkx1Y3FTNlROV1lTbDF2?=
 =?utf-8?B?bkltYnhjczJTSVkxVEFGcFBlOTdqVWVWUmN1OFFJazVJTkxPOUphSWhCdi9p?=
 =?utf-8?B?c1RSU1ZFZ2IzS3hHQmYwenY5VXlja3J2aUxkK3J5TXFkRGRDYXZ1ZkpPRnRa?=
 =?utf-8?B?WUwyem1kb1dvRjJxWUpIaEdJZEVUMHhMbDBTSUgvbjRScVVuN2Q3UkUvNE15?=
 =?utf-8?B?Mkxlc2R2TEpGdEEvQ0xJRTFLTXZGUTNxNTNXRWhTYkJvbGNVaHkwSkxsWlp2?=
 =?utf-8?B?RE5zNm1BWWZITkUwVXNGWTdKNFhFYTNxczBnc0NHempMOTY3bDZPU05zRGky?=
 =?utf-8?B?RnphZlJjTC92RU5Ic2FjSHVkTjZuY2ZmVHAvd05nVWhqdENJYi9WSmxiV1hN?=
 =?utf-8?B?LzMzRXZPN0Q0Nm5NdmlVOXZPdjVXaU5hdkFlc204KzJBQWJBSXBKZGNQZW8w?=
 =?utf-8?B?RjZtNncvRG5XUlZCNzNCdE5QZjRoMkNEVmY4UE56TytkODF6S1RrSGwvKys2?=
 =?utf-8?B?TmRqa01JSFVXSmVwQ1lqTjZlV0ZQZ3ZqYUZXNUxHek9kYThBUis5V3FzWlZC?=
 =?utf-8?B?UFUvUTMwVGpiZzlvL00zNk9WM1Nxd2tvcGxHOGl6bVdDT0ZjcG83V1ZqaHp5?=
 =?utf-8?B?SEw2c3pNVFU3Uk1BVmNGdkF4T1dQV2pBaVhkV2o4RlNTbzA1L2pxSnVPVysr?=
 =?utf-8?B?eDdCd1dicjV5cjN4SEp1QW9qM0xoRmxESVVsZ2E5L2xGMGNHZEJPTVdDbkxI?=
 =?utf-8?B?MUl2L2drRFZadDZCMENLM2VYVnpzdnEvWk1qWHB4Ykpwd1phdFZzUzJKQ0ph?=
 =?utf-8?B?ejhQZHk4S0tOOHhyMGVvKzROY0VDbmJNTnE0cEtJNVQzWTA3dzkvcTFNOHlL?=
 =?utf-8?B?WDhRRVY4S25zSXpzdC8zemxRUnhxZEtBMXFjMVA2ekdQVFVZSkM4WGZ2R3Vy?=
 =?utf-8?B?R0s5eWNpMkFleWp0Mm5oN2kwamtuRjd5YTVBblJpaDJ0L1pyVE1GUmJxejl2?=
 =?utf-8?B?SGh0RGxFNUkxUVdtTmZvRjlIUzNJdmdIN2JRYjNDRHlsV29nYkFMb055UThB?=
 =?utf-8?B?OUlrRUlXaUhYWmRlTW9hekx3VnA2UndjRzdsNFdHWHUxUkg5UEdUZ1pHQUti?=
 =?utf-8?B?dHM4L0VsdTJ5ZWJCMlRucGhVTExLZWlQZDZFdGJvcEYrcTlOSTJyS0dVaVkr?=
 =?utf-8?B?SXRXS1Vwd1pLcHJOQ0ZJTTBaN2Q4amN3SC9HYUdRTmo3UUNSdjAzRWd2bXNT?=
 =?utf-8?B?MUFaUWpGUVdTQUUweGpiWGV3YkFnazEyekNiMzg4UjR4TkU3a0NKc0NES2gw?=
 =?utf-8?B?ZXQrOW1hNG5ZSWQzTUVkc1JZM1NmaUJmVTJQcWdQekRNOHd2L0N4ZlZSUUhu?=
 =?utf-8?B?NisxQXZWRkZpYWYyVkRHRDV2TUd3UjJHOS95MnR6ZWEycUZjbHhpWnNGU3lh?=
 =?utf-8?B?U0RZRGNKVkpXTUlWVGdHbytEK09VVEpkNEtMMlpIdTJOZXJwWndna0dWSUFq?=
 =?utf-8?B?Q2p4NTNuSlhCWU1GYjdjZ0R5WnBLbWYwdjVHSzQ0WnhDaHFKVmVNd00yb3o1?=
 =?utf-8?B?NDZYRVFNZHptU29rVjdkTWxPcVV2Mk94QmVYcGN6K0hnU083UDk4a0htU1Yw?=
 =?utf-8?B?Y2NldVB0OGQ4N3pRSEJXNzl1OVdGQmpUci9YQWtvVjFHTEhNYzYxOEdJOG9l?=
 =?utf-8?B?ZU5UK01hTTYvMk9JWlFTUEJIaWE3KytWN2FtT1h3OVY1c0RIemkwK0NxTXRy?=
 =?utf-8?B?UjhRdzZVY3lNY3N5TkN2dDNjUjc0U05vcHNlT1oyRGQvYXN1a3Fpbzh4RDJh?=
 =?utf-8?B?bDVjZXJIU0JGOWJ1SXhZZHQ4K0M4RWRlcnBVR0ZUWU9DbkYzcG5VRkxVS3JV?=
 =?utf-8?B?K1ZicUxHWkpoVElmcEZRVmdYWlZqVU1Kb3gvRVRZZWV1QjFNUFcxYnJsRGJX?=
 =?utf-8?B?WlJtcjZVaTkwZnpENXB6SHppZkJZbWxKbFhKY0NtSzl6ZmRzZ1QrQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffc8182-9c1e-47a3-d0c4-08de5de88646
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 21:10:40.0554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EciXXxGmyJb9b44Ui8UIjxbFY/aAUdLMhiocWswT9P9kdA7SapWxxkpB+pehdrXuyVuVaJYK/RVetVs2ijR2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5000

On Tue Jan 27, 2026 at 9:03 PM GMT, John Hubbard wrote:
> On 1/27/26 1:57 AM, Alexandre Courbot wrote:
>> On Tue Jan 27, 2026 at 11:55 AM JST, Yury Norov wrote:
>> <snip>
>>=20
>> So while we cannot achieve exactly the short syntax above (which has its
>> drawbacks as well, such as the inability to operate in const context),
>> we can introduce a new setter than works with a const argument and
>> spares us the need to invoke `Bounded::new` ourselves:
>>=20
>>      let color =3D Rgb::default().
>>              .with_red::<0x10>()
>>              .with_green::<0x1f>()
>>              .with_blue::<0x18>()
>
> Are we sure that .with_red is a better name than, say, .set_red()?
>
> "with" is not so easy to remember, because it is a bit
> surprising and different, for setting a value.
>
> "with" feels like a function call or closure: "sort with
> qsort", for example. But here we are setting a color
> component.

`set_foo` implies that the value is mutated in place (and takes `&mut self`=
).
`with_foo` implies that value is returned with the specific thing changed. =
For
example, `pointer::with_addr`, `Path::with_extension`.

Given the signature in the API I would agree with Yury that `with_` is bett=
er.

Best,
Gary


>
> thanks,
> John Hubbard

