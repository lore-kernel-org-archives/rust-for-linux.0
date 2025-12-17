Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2D61F0991;
	Wed, 17 Dec 2025 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765938499; cv=fail; b=YvFYCoJ8LVLZG284ZaD1wzsQzHjKGjV+xcnJV+bLKkCgbsdvShFfI3qp2x3q1n0SQLSruW16mwuxYI4s8m1jZfaHKc/zRAmpFExfDnhAVyBWTTdc7cauCactFYIVTJhdURWuAEva6XSe0Hpcp64EoKjdah7nrLvEjXWvswPmjFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765938499; c=relaxed/simple;
	bh=otaDHoqcYGBzUmx/ej23V28of8ZZArUGlvgDM5/JbcA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gbPBuR6GEhgxB1cBgJBZ+UvT2DaorG6E51yJx8tXsflaDfYd6mWZzKHWACtyRl//YfPrRy+CmqpqScTt/Q+ESIabkHbYv+u0A5lMY2FP+sE6wiv8u4m/xsDJXxKcAdQ4iZ53GmXy4UlU/RfkKVR/8ilELm6b6R9ktomfZNa8LYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xf+RqFp4; arc=fail smtp.client-ip=52.101.53.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xf+RqFp4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebJvPuUlz5RlOlKwdXO90k4fnC82rjkeZzGwZX3hQbby147SX6oC9PEYyBYNF4fX5Gt5lU3IRhL4pkXYv88foN3zjISz1LwXHWxxuKMZcT+Q0+3VlQTlwszhr/WfUyXZDZ30TkBcXH33UCcM/XaUSgruaVSlEl+iz8IjM/KKgS55SoQdcBPZ6c1AgAwUt1hxRuF/uwG7sNwadIV1PlVeQLfsneIkfYh+UhePwIvhRgj6bMJBln3q6kaUmOa4gGx0GDSk3VnPRg0OcuQTZkD7DW7P6SXbILbETts7FzpM5mnf7qgpH93led4Y4zBgV7tXvdP+OXyIAW+pcHaV92mSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J86hRbIAwTuamdIS/Z1+fYFK2OcLISfBl/r494Xuy6c=;
 b=bnoxB0A3RNFF+CmK8azWxB0LVxlOU4/cAHaCseCXJ2ufC5yMfvA9ZeScb4cyiQCU+1FRFbc26ZpMMIksPVvzXbUOzaNgvN8SKrB3fZgwp3mlCaKKxjsEoXTBLT1XHklu8CMMiC04h2wuV/PA/+PCs55HU0+UeyVOIO4A6DSoJXSyzCNeS0d3RSPoRu9LZF/rd+cUmnMxuBl+/XHNNLUXm+mYmC8EF7fKGiop/68EL2dBLaiGxvI8761xY+nNJ5j63LJ5qeFyJZDgKA+eIDSe7v6jeIiyXgTzfDyhWLJNkL1C2cG9aZ+mIsk5K7hQ8ieM6+gflRleO1hB+drrwCjCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J86hRbIAwTuamdIS/Z1+fYFK2OcLISfBl/r494Xuy6c=;
 b=Xf+RqFp4RGc4BW8NB3QBl/qQbjsXTngm/Dc380+ixmo8mJEG9RrDb8RMxCqGgc7pg3L7FgMEXt7VCQG9gPgSP66L/in5FLVcMWd5baUpehuBg2galaSDGQnbVOr0StNpq+J5EoOQPtEQlt/Q+vb33VaWJU6jCxonQDJL9NM4HI5pZ1Kx9fwXIv+c8iCXdJ0ZYm8DLHfiDgVgK4fNh32YK5rFcl2JI2J0PRdhd8TWwTJhkV8y01J14D5ZocKAyyPI6qLYgvZf7KILOEHBKikslgk6pjrqZ3wFmYmrVwVljTy5Q9qihiMYU7kaPGmIGWkG1D05Wer/Ky/+px1F0QD02g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7118.namprd12.prod.outlook.com (2603:10b6:303:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:28:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 02:28:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 11:28:07 +0900
Message-Id: <DF04Y5PE9GLT.3MGJ2WAOP1WY8@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] rust: Add SoC Driver Sample
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
 <20251216-soc-bindings-v3-3-42ecdc8c117e@google.com>
In-Reply-To: <20251216-soc-bindings-v3-3-42ecdc8c117e@google.com>
X-ClientProxiedBy: OS3P286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f5::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: ca44aeef-a1d5-43da-6db7-08de3d13ec9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nlp4bHJ4VDhXT3lvcnRLcVN3QzdEWWloeXVTVUN1ck5kbW5Vbmt4aEpnQVky?=
 =?utf-8?B?cjVoaHNUNjhBM01vY05RWk5rYmlhNVFXbjZ2T1Znc20xMHJNc3V0bEU0UTNk?=
 =?utf-8?B?UHFNYzNVdythN08zUVJLenBPVWVWUU5XQ0puQUVUVzNwbUdRSG9lSEtXSVhD?=
 =?utf-8?B?RGpxNENmbE4vUUtrTkwvVWxSaVhTaG84bm9KU25xb3hyc1NVdmN6UWhpSHBP?=
 =?utf-8?B?djhtcjcxbG9FckdFaGtqVTZHME1TdThSbGdYZFZvKytSK0NmNDF0cTVFbW1G?=
 =?utf-8?B?bDFUejhtVE12azg3aW5TR1V3K2tnUE52UVd0NzNkYlpWdlJ1T0xEQUY0Y0Z0?=
 =?utf-8?B?R2p2TUtYdjhnSWUrQmFCMUt6ejNLb1pPcFhabGlYZWpXL2twNVNFT3c2RWl2?=
 =?utf-8?B?bVdIdTZFamU4MWlJQzNRTkVoWE5zdHhCenhqNEd6dmd6VjVybFlHbVltUWFB?=
 =?utf-8?B?Tm9tbUdZeVZ3ZFFJdnFJQVZta1hpK0JsSnB6V2pINmN3WklrYkExcUpiSndM?=
 =?utf-8?B?Vnc1VUI3OWtCSGRiN0ZXSWYwOTJJS0praEEzWXRNb2U1bUU1MldCcmJTZ2t1?=
 =?utf-8?B?NnQ2YTdLN2M4QTlIVkZVYTdiZGRWQkdjVS9qQXFWMmVOOXk5dlhSVEE0ZmIv?=
 =?utf-8?B?bm1YOTdZTVhHUytzS3FBY1FPenBMQnNHS0hKWjBQUEVwb3N3L2d0bWxiK0F5?=
 =?utf-8?B?cTg4Wm8wdkthU3ZNcDJkaXNLeTBNajM2OWdvSGx5U1RyNjR3c28yVjVvU0VS?=
 =?utf-8?B?RzFNOGNocTRrRFpBdzJLN0FZT0Q2eXpORCs4N085R3c4bzZUOVVCekRyai93?=
 =?utf-8?B?Z0xCa1NBTjVPYVl1aW5sM29lQ2Y4aklESlo5czRocFdPZW1MWkV3eVpPOFd2?=
 =?utf-8?B?QVVwMVI1dWRVYmNXc3J5eG04SCt0Sk9LUTlzL3JUUEVqUGRGK0J6MitRaDAx?=
 =?utf-8?B?aUFnRWRjb2t2UVY4VjYrcTdITkJtSnZmWnZHa1VDMVErTkk3c3BZOW1nNTIw?=
 =?utf-8?B?N0pGM1lzSWptU00reVdjQndMdWlCV09BREU3c3RwWUl5WDd2MUlQRUcyZWV1?=
 =?utf-8?B?dFJsQWxNaXN1Q1JMWmFBdW85eFVQTGQwY1NIeXhRK2w0WFB4d3B1RVJmN3U1?=
 =?utf-8?B?dS9tbWRkaGVZb0FZcjJsVE5FUlNaVFFQVFE0ZXJQUWJlVlRRR2dFeG9YRzc2?=
 =?utf-8?B?QUtZWnBhYkF1Sm1VbjdPR0cvQjdaeGEzM1FJcDloOHRoVHdZUWp3eVA4NlQ1?=
 =?utf-8?B?YkM0VUp3c2l6cThyeVNSSllURWxKaXJyOXk1eHdpNGd1b0lwK3BNSnB5c0VQ?=
 =?utf-8?B?Z3B6YnRsQ2M1bHRhY2laNEtyQU1lQVppQ0VaWG5nN2pPVXBFN29vQ1ZTT0p4?=
 =?utf-8?B?TVhOc3d2cXU1bVVqUEgyN2VXWW1tcG96MXdpbW02ZTNES29yZHM2VU93Qy9v?=
 =?utf-8?B?NkRUQ0FiYnhxUzhyYjJOZ29CRkM0T21lRFYvYWljendhUFJsZmVRYVVZZGZK?=
 =?utf-8?B?WnFjWHNiY01seWNmSmVFQzI5MU9KQVUyS0VqOFAwa3RPK1BMM2dqamIwVWtN?=
 =?utf-8?B?ekxvVTZ1R3IxUlZ2b0JoRlVFRTRkL1lxQUd4N25rZ3dQL2dyVTNiWnRYRTRj?=
 =?utf-8?B?Y085bWRrNW0wY3c3eExvWmlYclVYSjYzTW5OSzFzZmwwbk1oN2xOaUs0TGRw?=
 =?utf-8?B?bXQ3RVdsYmRxcS8xTUo4L3lMR2pVZjlIdDhiM3Fhclo1ZG1COVYybEV4VG13?=
 =?utf-8?B?cFhYdStoOEFOdmRNVmEzYzdiVEhyeWdGeGgvZ01zNmZBVTE4b0p4bEI2dWRE?=
 =?utf-8?B?UkYvU3Y3eXNTQzVib1pheHY0Qk1UWEc1R3JNU2lUNVlSMmI5RndYaDNNZ3h3?=
 =?utf-8?B?UEE2WGh5YjR6T1RNaW01QzNvUTVxcXhvRmNaSS9OWUZOODdNWEJiYVNKL1l3?=
 =?utf-8?B?Y0p1NnRESEZ1TmljM1lpaWV4WUJxcExaZStOL0dQV2RCQ21VZ1ZSamlCVnB5?=
 =?utf-8?B?K2Qwc0xrRDFPb0Q3ZlhBZ1A0bTZEZWJEZFNlcVZjNGFBdU5nOTRKNDJDM2NW?=
 =?utf-8?Q?MHTzZB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnNIanJ6WmEzcTYzRTdXTnZqTEdHT1ltYnFRZEZ2eGhvem1YUHNIZllWVnh6?=
 =?utf-8?B?STgwaXhvUUJBWEo0cHpTZ1Q5MU82V0ZWT3NicGxFaEhSWnhpdGVYZWs3dHFY?=
 =?utf-8?B?YTRsS1RCVFZZVkFrN3N4VHVyZWR5andMUkhYRmNvaGJsbzRESXk4TjB2dCs1?=
 =?utf-8?B?eWZTR2FCVjd0cEIycVc5d0QveVJST1dXWlhJSG1TeE5ONjU4MnVRQUsvUm1h?=
 =?utf-8?B?cVFNSkhEQjl2OW9UdVBwQ1VKTmV6ak9ISDYrNFJvL3lhVG1uYnBMTVpqQ3FO?=
 =?utf-8?B?T1YrSDFJSUx5SEpXUVh4ZnRKMy9Wa0JMRFU5Ry9RcUI4K3kvWFhHc1NKaERj?=
 =?utf-8?B?KzRjTjVqWEkvZmg3a3VsY083d0hNVUZyWU5Fck5wbERZZG5aVmlnSmpoYWlw?=
 =?utf-8?B?UWxzbXdISzFXajhpQkZtODdlNXFhcDluMGdHWDlSbnhIdEVudFdBQ1c4TDVF?=
 =?utf-8?B?enhad205SnVtaDBvNEdxaVpaU2s4WVp4a2s3NTFZdnZ5QStyRWNUM2tNcGdG?=
 =?utf-8?B?VmtPbDkrZFY4SkdGZUNDSndqTHV2eW00bG56TzJUbXBPZ29jRUwrTFRKRWNZ?=
 =?utf-8?B?Zm00TDJNbDFrN2RtZHB3QlNyV1ZVZHZZS1VvNHBrS2hvcG9LM1lPM1EvNmlJ?=
 =?utf-8?B?WUwyTStaK2RzSGprZVJBdTJEY3o3b1E4dDlCYUhEOGZkNFlLYnc1dzNic0JZ?=
 =?utf-8?B?eUhnT1hvQXdXd1Y4RllWMzkxY0F6K0lFcmtQbGFCUWI2N3pEQ0R1M0VxYVV1?=
 =?utf-8?B?bnc2dUZJNmhXaEdRSm9VdzR3WjRNZmlEV053WmUxRVRTb3RLMFVTaHUrRU5P?=
 =?utf-8?B?ZFJsbFEralptTFZOc2xlSENuL0pVcmlJRS9SQTlhTnVXUmFDQmZSYzd0QWtt?=
 =?utf-8?B?VEY5RWFBL1RsNFZ0Z1JpbmkwMkFCcXd4YTVSRHpKZTZzSUZydG5EeWdTNHNP?=
 =?utf-8?B?VUJqM3d4OGtsTlBocXNhZ3ZrZGI0WVI2WC8xejBzUnZ2cW8wRzFjS2FRQTBq?=
 =?utf-8?B?dHF3WXZmbC9MYWtvQjlNU29tZjNvaFRGWnRWSjhXN0p3VWZtWHBWcUJpQnE2?=
 =?utf-8?B?N1Rma1BFcXJNL21iWktqb2k3b0FwdmFzS091K3AwdEpLZDBxeU1obGJ4RUdw?=
 =?utf-8?B?blpQTndCVE1sYWZRN05QTjNzUGd4M1NUazZWSVNzZWdQVXBkbHBjdnhqMmc1?=
 =?utf-8?B?Ty9wZXdWZU0zZHdHZGYxTytrVmFERXFaOHk1d3dQVWdvR1FKSkZyRmdWUTFV?=
 =?utf-8?B?UmFySlFhRUdkeCtodE1STW5aa3FGS0ozdGN6K0RQVlR3NGtEUmVicmYzRmhV?=
 =?utf-8?B?NmRsamtqNFBvbTQ5c1g5QXRsbDN5NVRVRDRSazRtNlhMbUxsVEtXOFhkMHZU?=
 =?utf-8?B?QTI2VkpVSXhVRVFFNXhkNkhLY25FTEFJaEd4UzZqYVVhU0FoQTlhdnRqYzNu?=
 =?utf-8?B?WHRlN3Z1YlRFTGlYRzV4QVlYUXkyWDNEbGd3UmtiZzVDRWlySXlFRVY4Z056?=
 =?utf-8?B?VVNkZkVkdHZmcWVyV2RQUkIrRTJVTjRVVUV3eEg3WVBlb3I0d2VrU2NDa3Fk?=
 =?utf-8?B?a0tpcmtxc3hLbGNWNHVzREVpT2xFMk8xK1E2NWt5QVdxZFdVV0xYWHprZ0Fz?=
 =?utf-8?B?TXlvVXByMnhoU1hJcTMvNUVjdTBTdlpVbVpQRXZjL1lhTFVaTmpJczVsUUZU?=
 =?utf-8?B?Y2l5MkIxKzhNZWlUUC9sbTRyMUtIVHFwVVRMUkVaR1VEUm1QckNSUW5CSXJN?=
 =?utf-8?B?OHBPUEswbEpUT3l4WmovWXVtemJJV3hKVmc0Rmx4cEtHUHQ3b0VQR2piNkZY?=
 =?utf-8?B?VkNRZm14WUxBYm15eU1na2ZuODJCajM3OW5VajRDbHBXS2d1eUYyQVI4c0pQ?=
 =?utf-8?B?TWFWWHlrVzZpVW1IdW03eEFxTlVjNU9Kb21xMGlUZis0ZVZBSjhSUXdUOTQ4?=
 =?utf-8?B?ZmhkcHVtNmJzazZPVkFyOGZMRysvb0Rsd3R6TVo2SzBPQUk2KzdRbkx0MzUx?=
 =?utf-8?B?UERrZ1dmVndPZFc0cjdSZi9kTDhacFVkZnMxenlSNkkxYWQyQjdyWnJDUVh4?=
 =?utf-8?B?VDNEcHMxRHpIUnQzTUJKTTVBT29RZnlYTkFjZjJOMDVPaVlhOWlFUWFZZ3l0?=
 =?utf-8?B?b2cxeGQyZkpLZHBCRENyY2YrbFhqb3RRUVBsT0lLZWdVNkZ2YiswVUpqUHh4?=
 =?utf-8?Q?2FL1VFiYWLNeY7p/5lbQI4QkV1P3xdK0RXN6bvPEmbNE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca44aeef-a1d5-43da-6db7-08de3d13ec9d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:28:12.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgRNfdiS/xkILRAmmbhAg52jWuR/w98Tp0kQ3zmZef3pKC3ZaDBt/1Ccu+yxrYdiKXON31M2m1rCoffAP5+Ysw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7118

On Wed Dec 17, 2025 at 4:24 AM JST, Matthew Maurer wrote:
> Shows registration of a SoC device upon receipt of a probe.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  MAINTAINERS              |  1 +
>  samples/rust/Kconfig     | 11 +++++++
>  samples/rust/Makefile    |  1 +
>  samples/rust/rust_soc.rs | 82 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 95 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4ff01fb0f1bda27002094113c0bf9d074d28fdb6..bb2e710277cc84dd6042d4d46=
076e665d9f68752 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7705,6 +7705,7 @@ F:	samples/rust/rust_debugfs.rs
>  F:	samples/rust/rust_debugfs_scoped.rs
>  F:	samples/rust/rust_driver_platform.rs
>  F:	samples/rust/rust_driver_faux.rs
> +F:	samples/rust/rust_soc.rs
> =20
>  DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
>  M:	Nishanth Menon <nm@ti.com>
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index 3efa51bfc8efccd91d9ee079ccd078ed1a6e8aa7..c49ab910634596aea4a1a73da=
c87585e084f420a 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -161,6 +161,17 @@ config SAMPLE_RUST_DRIVER_AUXILIARY
> =20
>  	  If unsure, say N.
> =20
> +config SAMPLE_RUST_SOC
> +	tristate "SoC Driver"
> +	select SOC_BUS
> +	help
> +	  This option builds the Rust SoC driver sample.
> +
> +	  To compile this as a module, choose M here:
> +	  the module will be called rust_soc.
> +
> +	  If unsure, say N.
> +
>  config SAMPLE_RUST_HOSTPROGS
>  	bool "Host programs"
>  	help
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index f65885d1d62bf406b0db13121ef3e5b09829cfbc..6c0aaa58ccccfd12ef019f68c=
a784f6d977bc668 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+=3D rust_driver_=
usb.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+=3D rust_driver_faux.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+=3D rust_driver_auxiliary.o
>  obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+=3D rust_configfs.o
> +obj-$(CONFIG_SAMPLE_RUST_SOC)			+=3D rust_soc.o
> =20
>  rust_print-y :=3D rust_print_main.o rust_print_events.o
> =20
> diff --git a/samples/rust/rust_soc.rs b/samples/rust/rust_soc.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..33043b0ac8dadec36aebf369f=
0fb68dbb3b118ed
> --- /dev/null
> +++ b/samples/rust/rust_soc.rs
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust SoC Platform driver sample.
> +
> +use kernel::{
> +    acpi,
> +    c_str,
> +    device::Core,
> +    of,
> +    platform,
> +    prelude::*,
> +    soc,
> +    str::CString,
> +    sync::aref::ARef, //
> +};
> +use pin_init::pin_init_scope;
> +
> +#[pin_data]
> +struct SampleSocDriver {
> +    pdev: ARef<platform::Device>,
> +    #[pin]
> +    _dev_reg: soc::Registration,
> +}
> +
> +kernel::of_device_table!(
> +    OF_TABLE,
> +    MODULE_OF_TABLE,
> +    <SampleSocDriver as platform::Driver>::IdInfo,
> +    [(of::DeviceId::new(c_str!("test,rust-device")), ())]

C strings can now be declared using `c"test,rust-device"` (applies
through this file).

