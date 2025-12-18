Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA4172634;
	Thu, 18 Dec 2025 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042633; cv=fail; b=NRbZ9woI0MxJJBJIOCfdagNi3R/em776WdOaGmWLnhwS2RLRb6h5sxWmGi1ghEJER7QqFu0+lUtooSkIY7NRm+g5dIoLlyyDYJtgZxhOTewXtvXDGJdLjThkOHiMrXYE6clPD9NXgThHA6SWmE260dtM4SS1QRDAzAwOSOFHAss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042633; c=relaxed/simple;
	bh=f2VRKByVX+Jl52veTUbaF3ItqWbnr4nqIyAMelQHduE=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=i+LUmgLgYI62+4RYHBeTQlCa5Ts9v7Iou7VDvqVTqKTG8zLuHYeTkaWLbKBP5vj/ow0VKWdDgre/pYrlGWriIhExcnJuhNU1hcRLzi8kyRxUf9kp5ZiufPwEFlFDQIv/vikvtctTZVASgaosViE/JCKmcf6RWV4iXcVmAlzPy14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Se8hmnbq; arc=fail smtp.client-ip=40.107.208.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Se8hmnbq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLHlxESxlrzjxHxDv2haNoz+moA8OGnBF/jIB1HpfN4JYMGxudxRfiDqTJT9qOpc8C6EvniLbkjq/c6LjA/aIsvTUgbC76A8pk43eKgpZETwzX/jYBzZfjVcyALtwW5VlgeeBGSn5jRk9zxpcjwSBYAdGHz9ll+8dz97qvcdm+BgnMfYMXAdVnJO1ra33zQ2rUv6cdJNr1lxbTGU6TxQfRZbjG7g9Gd6LS0p9nWQAi18EwUKC/npjK9oNMv3G9zj82ksExpb08kAeFEWaQ9+P1nVehqadXKOPGll2P2eXjgj/7UtIButwGb5bVy9U24zTPzy+MCSwvk/Q6yBkWmdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6enE1W/Z1+qnmmVNZ/BV35Wyc+Ra3dLc5LSFOVbhhDg=;
 b=Ymd2ARNEnzEkiNgLkY/i9XfFynufSzs1WebQ0Up4d13eJ6ZUjYtqed/ij9NFPpbADf2DvTHkjq40czIziGVfqQrV6AhBB2kGQWoK/FOpfJGJFbcYdqspJ3oYJfkiEW+y3x86vFJm3OdlFZcvW9HJ4NY7OzmqYGK4W22F8hyLS8Sic6VzHWjF2nNgY8Bg3XQoqzDdAOZ0dT4NcTnfGcK/RjqZ8zuYXtWgyu3Y/xBkynKuMfTiMDPEsGfrqlcQ9INspv8fooTZvHBPbV5+RZluV56GLq6mHcH50Q3c3c+kNtWCqjlz3spNemw2+KjML6PKNVgdGvD82bHLhsXWpMq8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6enE1W/Z1+qnmmVNZ/BV35Wyc+Ra3dLc5LSFOVbhhDg=;
 b=Se8hmnbqqehzGVFoeBfQnylb03lidSHIFJelQcgJHWPajabg/BMl5tvrrEvAlNpkc8W0q+GPrEnu9snZw3aihjtv+tf+4KrH31yT8IDSauOPTQI9YHdeRDQ5Nrfh53njQ8EDsukLVStzqthOho0hYP+M0fk0gQXhbV0hy2PXf6I11j4bSn+OBxyrzDyPyeHKy2tfQ61latbMS0J+ZmkljB7l0P4X6cP8r/BUwYj/oH/Ddac8KyjSD/0pKmHjolGlZVtrvSIorFM5idJ65AiYb3ktvucLrd7Q/Yfmht9oukN4Fc7pJfsr/0rN4w1eWUEepUZejOzLCbCWpKJfK4fy6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 07:23:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 07:23:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 16:23:43 +0900
Message-Id: <DF15V0W5G9K5.KCPM8M4BZVOE@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] rust: Add support for deriving `AsBytes` and
 `FromBytes`
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-2-b23e5277ad02@google.com>
 <DF05VVOUA70W.30GJE9P4Z3OL9@nvidia.com>
 <CAGSQo00qe74q-Ztn2UubrMR+F-knO-DhrznSgM8Gk3j9OjNfKg@mail.gmail.com>
In-Reply-To: <CAGSQo00qe74q-Ztn2UubrMR+F-knO-DhrznSgM8Gk3j9OjNfKg@mail.gmail.com>
X-ClientProxiedBy: OS0P286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1b24bb-9b59-4245-cbda-08de3e06620c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnBtaURBV0NHdld5T0dvT1Y5Q3JjYVdYdWFjWHNXeWdlRkE2TjM4R2ZoZ2hS?=
 =?utf-8?B?aTRlT3EzMzZZY2FuaDQ3K3NOaGRYME5BZkJkRFdCTFlDQVduVHJGN0EwZnVU?=
 =?utf-8?B?ZHFSMk1jRUlBRDkwRTBqNlYwdWlrRjg3dUxJbmZKZGFrd0oyTkppK3FPK05C?=
 =?utf-8?B?cEtMYThXWGpPbVJtaUUwRVNXMlFvZE5NTHZ0VEtjK3JzbzRtT0t3cjJPUE44?=
 =?utf-8?B?WHRlNkVlTTBUNFp2SjNJd2VodVc0bW5SaDg3c0FKZmhrbXJ4ZTJ3K1JWY21C?=
 =?utf-8?B?eVgvRmtDL3BPOUI1R2hWNXBkelZ5T3N2dE5jWnZyQmloVzRXNGFMeWIrMTdD?=
 =?utf-8?B?cDYxNWV1QmVJR29zZW9YL2N4dmNEdFVBd0N5MmJib0NvdHk2Y0xiK2xaNUJC?=
 =?utf-8?B?NmhWSTgwWU05UEJIZ3hMMEtiMXdtT0tNZ1JQMklWYnY0UTJOVEsrcDhOUEJB?=
 =?utf-8?B?RU84MGNnYjVxVzVVNUxxTXJ3ZThTRUE3ZnN3cXZKSTdHSHF2R2Joalc2T1Iv?=
 =?utf-8?B?VDdmSnd0aWpDMTM2aUJGdXlnZE92OTg5YXIrVm1JeG1oR1ZXOVpUOEw4SDAw?=
 =?utf-8?B?clJoenRVSDJHbTBRNjk3SkZpSWNXekZ3L1JJSjhLRkZNN1MzREY5U2dHN0Zs?=
 =?utf-8?B?YXlVTkF0R3VLdzZ3QU8vQVlVM0NyVi9NZHZUSGlqNEozRGxsWUtSOTZTZW96?=
 =?utf-8?B?T0ZpeUxDdUwybmFETVlWKzlwaDZxQjUwZEU3enhZdCtlS25rVVZJYmhQSW1u?=
 =?utf-8?B?QzBYWVhhM3I3ZE0vVjczN2pFbEZvVDdhQ0FrMHJiMDlVY3U3cVF6Rk5XS1RT?=
 =?utf-8?B?d0VQY1hrM3BENzd4eG84emNVeS9Ea2JyemF4cXFlMm4rVkNWT05NclEwZkov?=
 =?utf-8?B?NktwbzA4Y1BWOTg4bm5zMmlHOVowWm16djBxMGd5aC9ad2ZQYzZFSnY3dldv?=
 =?utf-8?B?R21sT0VXK1hpMGtXM1Y4NkxVR21wRVE5R2JxTmZuTnNpSktWMVExZDVpekFq?=
 =?utf-8?B?QmxORlZjWkd3ak5NcG1GdGdkK2h4eHdCWXhrQXUrY0VhQ3MvMlQ0TE1GOXFv?=
 =?utf-8?B?R282ZU9PK2NxOFM5c2JKOVEyZzdUNkhEajNWeVl6VkhuaDE5M3BrSnlraDA5?=
 =?utf-8?B?djhDbXVKVHF4S2dqVG5pU3AzczNac25NcHB3OW9uNVdXK0w2ZGs3a1ZpOHFM?=
 =?utf-8?B?NHRxNEZ4RGE3ajM3WldUWDlzMG1QakFNWDVUZXBNa0VkMmY3eVJ5dlc4blU2?=
 =?utf-8?B?amlEUFVoUXdjY2h2ZzFxQ05jRzZtdGVCRnNMRGo3dkRNcGFabkFrMmRzUjIr?=
 =?utf-8?B?dkQxTjdDUEEySlJudUxIRml1U1llNTJaK0ZyWFNYR0t4TzZvYllERG12eldr?=
 =?utf-8?B?U1diOUpKeHhsa1NQNU9kRHdaQ0s5TFdUdG94dFFxaEZSOGpmaGdObGN2NGZS?=
 =?utf-8?B?cXdPTitsVnhTdVhNRDZGd0NLNm5DVVJ3T3JTMmM5R2RQbytzWDROQmZWQmdL?=
 =?utf-8?B?aVVuOUx0S25XQzBkUmhEY1ZOaWFiVHMxZE15bHpFOU9SdFlmUG5US05PTDBG?=
 =?utf-8?B?TXRTVmtYdUVaOVpmWkRrOTZvem5vOHE3eTBYS29uSEVodmxGdit2N3ZkWmhC?=
 =?utf-8?B?bEV6UmF1L3RSbnBZdnI5YXRFZDJkNjFBZU4rcUkxalkvcmx0L0g5R084MXB5?=
 =?utf-8?B?T2JhN1Z6RWxOVkR2M0dqUi83YTdCSlF1Z3ZmaUVhdVM4eThNWTc1RUFtcU4r?=
 =?utf-8?B?bkdJTXNYeEd6NklOM2RPRWFHaWU4ZHhTL2xrMUhIbGlkdlBGWnJRTkhrRkha?=
 =?utf-8?B?RHN6aEE4NlZmQVNIK1ZvTUw1d2hUSCtIOVIvVUY4b0psZUNuOFdtaTFMSUhL?=
 =?utf-8?B?YTN1VU9xbnBZbGNGZHA0d0tVcWtxZThMUkRLNVNxUHptay9RREtmcVdwdm1H?=
 =?utf-8?Q?6ukvTTK+PRwwnzN5Ya0aw4ORmkzcgh/R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWVyQ25tcTkxTDE4NWFIQ0pWeGpVWTJLczZOOHFBOU9VSUI3WWVDVVVsSjNV?=
 =?utf-8?B?bHd3a3A4OGZWZkdPa0FSR1o3anJmUUxIcE93VHZZVVJhOWJOUjRQeHVJQ1Nt?=
 =?utf-8?B?RVJFU1piQnlSMGt5Y1FIcnJXUmpxVXpsU1ZENkZ6TzUxWkdVb2IvWjJ6WFhu?=
 =?utf-8?B?WTJwN3ViakpYTDB4MXVJZkREU1ErMFFWYVlydkgxTVY2S2dReVd0eWJOQWo0?=
 =?utf-8?B?ZXVYbzV4ZHZKU1lyakR1Nll3c2NGR242L1BBUVJpekNhbkU2ZGdGVmo5UzVB?=
 =?utf-8?B?ZnBLN01zbWZLbGlsbzczNTZyYy9TRkRQT0JVTHQxd1Q3ZnhQWEpDQ2ZhekhD?=
 =?utf-8?B?Y2ZZbUxrV3lRMU1ESXJtQjJpZ2dJeDRYOWJVT3Q1c2o0WWtYZStKejhQSGVm?=
 =?utf-8?B?YWk4dlBsdlVib2dZLzhZazdja0pCcWE1ZC9FV05CTE1EZURxOG5kQ2hJeWxt?=
 =?utf-8?B?QkplbE5XaHFFZHgrOGR4REFWcFRaeURMdkgzUUsxSUNZOWlkN1NzVXBsNXZM?=
 =?utf-8?B?Mkg3bUhwQjhYNDdlTklENzRMMmU0WS9NY3pPWGxvRG5wZDEvaVNIOWNFbFds?=
 =?utf-8?B?M01mUWE2TGYwVE1uTGovWlpiRzNIWUdzWWphL0Y2VlAzM0RNSmM5ZGt6aW9K?=
 =?utf-8?B?NzcvVW5sMTVnTnp0Mk1GblBwTzE0eHFqZm0vREw4R1VyZncyNDNXT1k4TlNF?=
 =?utf-8?B?WlVSYTJCWDYrbWF4bzdIL2Z1T25JUGRvZFpuQ0lud2RPYXdSMUc1alNJOTNo?=
 =?utf-8?B?SncrMVVIWWpUbXBZN05CWWJLcWtBbXZNZkllUWJYeVZsaERwdmJvV3NtM1hW?=
 =?utf-8?B?T253OTVLeUJ2MGZuclBnaXFyV1I5SFJlNklETlBDaEgvSXZBN1lsaWJCZzVo?=
 =?utf-8?B?ZUJvQjh6d3dFYjFyS2VXM1ZrcmZ5Rjl6M244d3RIc2dMZm9aK3F0L0dGRklT?=
 =?utf-8?B?WU5tM3dOeU5VeDFTSmtqU0drbW5sRkJXY2tlbEZIdkVrQ2FxaWN5cmI0ckFG?=
 =?utf-8?B?Uit0OWNNS0t2ME9BMGQ5OTVRRmdOVFBtaU9YZzBDT2RQWWJXNFhlUEs5dWxH?=
 =?utf-8?B?Y3RvNlhQYjRiYlpET0hWbEVyME5WbW4wZE1WallYQ1VwZWU3czVkaXpwM3J1?=
 =?utf-8?B?dGMyTStsTVpPTVZ5ckduT3JSTFQ3ZHZaZXZaU245THFxbTZzQUNRSUVsNDY5?=
 =?utf-8?B?VXFqNkk2ZHNCSVdTdzVyRHZDR0tHOXNhU1QrMGFZU2k4Mnp0VVpEOGgwZnFw?=
 =?utf-8?B?ZTFXdHhmVjNTYWJGS0lBcU1odFZ2bVdsRlFnOWJmMFF5b0xpNm9lKzJBYTM1?=
 =?utf-8?B?MU82TGF3NkR2TGdKMlp5MmJUWWFOTTdzajhjMzlLSklyMUN0SE9QS0xYeFAz?=
 =?utf-8?B?Q2R1MHVuME9MMHhGTVo2amtCcWtQQjlCUUJWbktPcituaGFubVlLNk43dTUy?=
 =?utf-8?B?MitkdlU1TGVadExOc3BJSVNMZHpDMm13dWdLQWlCbWdGZmJieUFZbTByb0JL?=
 =?utf-8?B?R3NkVTR4OVdsSzUxYUZoTEtVdjUwNDZZdHR6ZVNtTXVKYkFlWlFDZ2FPSFlJ?=
 =?utf-8?B?RTdIMXk3VmFVcncyYW1ydXJIdVN1OEh2N2xTaTdHQ0d6aE5sOXkzdGpqZ1Ar?=
 =?utf-8?B?eWJZNHpWRFoyWVN4OElGMG5rallQamdCWTBKc1c1cHdDbWdnQlo4MXV2ZnJI?=
 =?utf-8?B?K29QaGZKVlFNSUlIUXB1RVJTYU14RnQ4ak9BdkFrQXlBbjVzVm5HeUZzWE80?=
 =?utf-8?B?bWxLVGJ6MHNPRk5LZnBrOHNoZnQ4aXROV1BYWnBCTEpKNjBuMitxMU1FZmZ6?=
 =?utf-8?B?ZmhFWFhvN09LNXVXTnpRQmp5L0VCWndRRWU5Syt6Z1dwditpMllhZ01OVFdy?=
 =?utf-8?B?SXRTMmF3eXlEMnE0dWdraEJwK2x0Q0RnK1J1ZjBvdzFrUWUwMXMxU3NuZENm?=
 =?utf-8?B?OEtWblV0R3kzMmRaN29YbDZQTHNtNHcwTjVRTVM0WUI5ZXpKZWl3Q2FaM3hk?=
 =?utf-8?B?a3RjSFBHMU04aEdlMFpWaWtYd0JHNGpvNFIzUWhwNC9SV3ZiMmVLcC94VFps?=
 =?utf-8?B?d2cyd2p3N21VMGt3dEFUQ1BJSTZFaWJiUUVtSEsrdWdpaWVjVEpINTN3WUla?=
 =?utf-8?B?MW56enlwaWZ0S1dvYklkd1VESjhYdDBWQU9na1g4WndDc09laE52bFAyMzRC?=
 =?utf-8?Q?R6QoXVxSyux5oJS3Qi2+ItbKwkolxI8p3EPHbQwFLbX0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1b24bb-9b59-4245-cbda-08de3e06620c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:23:48.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaY1ptoKGQ6PiAfSu3JyWHU8ypl9Th4SI40FDqxlP1CBeTthWmDhnXrroOIlmrUznIVjP6jJWjjOcXXosyOsDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081

On Thu Dec 18, 2025 at 3:01 AM JST, Matthew Maurer wrote:
> On Tue, Dec 16, 2025 at 7:12=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> On Tue Dec 16, 2025 at 9:44 AM JST, Matthew Maurer wrote:
>> > This provides a derive macro for `AsBytes` and `FromBytes` for structs
>> > only. For both, it checks the respective trait on every underlying
>> > field. For `AsBytes`, it emits a const-time padding check that will fa=
il
>> > the compilation if derived on a type with padding.
>> >
>> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>>
>> I like this a lot. We have a bunch of unsafe impls in Nova that this
>> could help us get rid of.
>>
>> Amazed that this even seems to work on tuple structs!
>>
>> > ---
>> >  rust/macros/lib.rs       | 63 +++++++++++++++++++++++++++++++++++++++=
+++++++++
>> >  rust/macros/transmute.rs | 58 +++++++++++++++++++++++++++++++++++++++=
+++++
>> >  2 files changed, 121 insertions(+)
>> >
>> > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
>> > index b38002151871a33f6b4efea70be2deb6ddad38e2..d66397942529f67697f74a=
908e257cacc4201d84 100644
>> > --- a/rust/macros/lib.rs
>> > +++ b/rust/macros/lib.rs
>> > @@ -20,9 +20,14 @@
>> >  mod kunit;
>> >  mod module;
>> >  mod paste;
>> > +mod transmute;
>> >  mod vtable;
>> >
>> >  use proc_macro::TokenStream;
>> > +use syn::{
>> > +    parse_macro_input,
>> > +    DeriveInput, //
>> > +};
>> >
>> >  /// Declares a kernel module.
>> >  ///
>> > @@ -475,3 +480,61 @@ pub fn paste(input: TokenStream) -> TokenStream {
>> >  pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream=
 {
>> >      kunit::kunit_tests(attr, ts)
>> >  }
>> > +
>> > +/// Implements `FromBytes` for a struct.
>> > +///
>> > +/// It will fail compilation if the struct you are deriving on cannot=
 be determined to implement
>> > +/// `FromBytes` safely. It may still fail for some types which would =
be safe to implement
>> > +/// `FromBytes` for, in which case you will need to write the impleme=
ntation and justification
>> > +/// yourself.
>> > +///
>> > +/// Main reasons your type may be rejected:
>> > +/// * Not a `struct`
>> > +/// * One of the fields is not `FromBytes`
>> > +///
>> > +/// # Examples
>> > +///
>> > +/// ```
>> > +/// #[derive(FromBytes)]
>> > +/// #[repr(C)]
>> > +/// struct Foo {
>> > +///   x: u32,
>> > +///   y: u16,
>> > +///   z: u16,
>> > +/// }
>> > +/// ```
>>
>> One thing I have noticed is that I could sucessfully derive `FromBytes`
>> on a struct that is not `repr(C)`... Is that something we want to
>> disallow?
>>
>
> Why should we disallow this? I can enforce it very easily if we want
> it, but the only difference between `#[repr(C)]` and `#[repr(Rust)]`
> is whether we can statically predict their layout. In theory you can
> use this to elide the padding check for `#[repr(C)]` structs (and
> `zerocopy` does this), but it's significantly more complicated.
>
> The only argument I see in favor of disallowing `#[repr(Rust)]` here
> is that if it's not a struct that also supports `AsBytes`, there's a
> question about where you're getting the bytes to load from.
>
> I will point out that we probably don't *just* want to restrict to
> `#[repr(C)]` because `#[repr(transparent)]` and `#[repr(packed)]` are
> also great use cases.

Yeah it's probably correct as it is. I am not sure why we would want to
use it on types without a predictable layout, but also cannot say this
is fundamentally broken.
