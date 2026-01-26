Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1681C5D72;
	Mon, 26 Jan 2026 04:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769402025; cv=fail; b=kbip2OdwTSRqYHkmF3j5gUqnkWyGycG/QFUk4BX4e1HJsfiH0gEh9ybV6RuU2hnMkxs5O+8NiPemroHnuowwKIL5+/NsUVY8XH5YnjrURa5KSQ7Tycd5NPjBw9tfHoe3ALhoh2FemAxNXxwdtJ2zyDV9+N3fhnkYCJOFqZzKPiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769402025; c=relaxed/simple;
	bh=nS6hMX4ZEiFibXBDsnAIB+Tx+9bmCF8oCpAr4XqoAYc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZKmXp7xPfTMbs6uQ6F94X2eWX7z9683XsUXrxxuwzSKEWDIqGSSvlfst7H28stcjhro77eC+cJ/w4q01kGKK/Dr0FldhE/kYcGB0fVRF7ngj4QXFz19xGiwbRtbGVJYwiIHd+6juB7iseKoDLSuUiwo9NyD1iTMV8cRMtCkYdug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nXJpOgTt; arc=fail smtp.client-ip=40.93.196.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nXJpOgTt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUUDV+rhpmeVG8HLOPVo8jxugFIZJC86RkSjRqkpkgIDieU4syk1Zdwhp8vDljFalCDgfmpFxuVAZJZcvu7eimbDpdlH3mHwlpCO2qOtScMQ4gWSnE0wseDVNXYePbOx2ugWaaQWTMoS6u3goNRee1iUqpw4nWxRTCnuHLWIZK3X63YByNhDmO3cKYdyuJACjS6Fmznrxzp6OAVArMf4/+4+cQB770nv1ye9/QPPWN4iK2/WrrPr6JefJQcgQn+r+ZMCiYc5pSHfGajE1yfsCE7YGrfYFEuxea5tCDG+cC3ssq7Yy7FzkpEd1an+7bK7fxg/lvvlaCHOi5lrhTC1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCE/GtEIjh5u4JHOaWkxwGsSlzM505ePrjZbEtdNmis=;
 b=wFV1sK1CNpRmfp/QX2FPiUZ2hBTcXPWdai0DL3OyQ1dlCwccJ3I4k/SElJ4AJy/q3W/XDiy3YExV47ioKVkP4v2c44niaGryKThNYQEI+KMJaZAdHoq8ZgrV+ErgVeIeTgRLKCPpyDBMRCAuQGZ+GmVtmHDSIwXhltOFM7reCM8lWR/GMafEQUzvyAyTFu6rl57IpIRI/ASNKTAA8RnDuObbwM8vnDzLzPZvbP7FquWAAxO0jJCGU+gdysjLaxYYMzkzZUdEnprMOqXWIz96QUa0StTgPMbZxvE7/tOGQIVXiNfAJbsbj3jN+V9pYIagmZ6v3woheoYTc+gx+m1pQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCE/GtEIjh5u4JHOaWkxwGsSlzM505ePrjZbEtdNmis=;
 b=nXJpOgTtzdL9liFxurVQx7ZMzgsyzb1HYkmkW8hrLJPtFrRvjJp838zOu5yxypZ4hi1OgCra8Nld/8O070uFGXtfewyoTKAZIDib7AB//mEhih7u9Cv6zDMsLosNNKTjqoj8laLw8L1zk9Y72Sdax3VEhKWcZ4MeXCeELgw4fRQ85W1MvPKsfj1oEVZfdv6eXZy/L/0GoaHt76evzdDZfSFhW/dlZdIQtcFxOVHYA7aOjwzCdh9OqnFmfmuYiFrQqJFjHOrD5zuaNT7BH75VnJUptQPeNV/bQ9Sl7OjxJ3gB4zQhHTNV8kemDVpR4X/oV4ZY5J492Z+XFKSXCiYcOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 04:33:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 04:33:41 +0000
Message-ID: <dd9e0094-ee84-449e-90ec-a75c7d8479cf@nvidia.com>
Date: Sun, 25 Jan 2026 20:33:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: John Hubbard <jhubbard@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
 <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
 <CANiq72kkRJVsp_BNszRDy5DaQ6qKhB7e7g16qvEQK5gBtVrYug@mail.gmail.com>
 <edac88ac-664a-4bdc-a702-b6f41d9cea41@nvidia.com>
Content-Language: en-US
In-Reply-To: <edac88ac-664a-4bdc-a702-b6f41d9cea41@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a40f0c4-abba-4120-43c5-08de5c9414de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a21oaVVza1JLczJ6UEZiTGFxaTRXZlRYT0pXVS9CYmdWaWR1dUIxWnVIWDVz?=
 =?utf-8?B?QjRXTmVueXdkL0Nra2UweE5VS2s3RkJ2YVNEeXZWeFN6V2ovTzR1YllDR2Rl?=
 =?utf-8?B?ajl1V3E1V0xmbVMyTGd1MUFIZUlvT1lPNzRwem5DczliOHF1Q1RhQlpGaG5C?=
 =?utf-8?B?U3Fxb1h2OG1SeDNPRmpzZFJ2MXlkdFJLYUdjdEVNNW5xcGcrMTN6STRKUWtH?=
 =?utf-8?B?SU1RZHJRVFRzejVzVmZlLzRUZU1JTWRnMzRTckE4SnkwL2FEbXQ0djNORmpM?=
 =?utf-8?B?UG0wQ2dKcEh6T0dUQ0JCcEZpUTI2eCs1V0dwRm45V2FMQWRDNXNaK3hHeWVp?=
 =?utf-8?B?elY4V1BDU0cxTjRaZGhiWnEzK256WTM2TVUwZTdHMFkyTlVZYmozQ0hMcFND?=
 =?utf-8?B?ZkRoVlNhMk9VRlNZRFFMV1VVaFNtQUYrRmtQc2xoZVpDaXJCN2ZWRUdPOVJn?=
 =?utf-8?B?MWZJblVLQWRpN2prY3lRdWhrQ1NNQzhtdmd1QjE0OU9RcmVKNjVJR2VpK2ox?=
 =?utf-8?B?NHdhcWZOY25maVlhb0YycjBIZTFsd3FISUNWay8wa1dJenRJeU96ZmxIRXg2?=
 =?utf-8?B?T3IwUzBvRndHVlcyWFY3VDdGQlFvQ0FYM0RvL2ZrUXlGSS9NOVJpUXJXWGZD?=
 =?utf-8?B?cDRkSmxLa2syYkFFcmVuS25LR1h1V0dmYWtRajhjVE1QVzFzNDhYby9PZXdC?=
 =?utf-8?B?QkszYjVVYXQ2UDhtOFJaVE1mSjlVWVpSdWpUNDhoVDlvMFg1UzZPZkM0WTVz?=
 =?utf-8?B?U3B4TmlvSS9aZE01MFg3elUzdytOTFVRa0htcjBYYVp1WlRZNDB6MHFLZ25j?=
 =?utf-8?B?WnA1VlJWQ21jdHZSWVkyaVN4c3I5cVNEVllhcWJWZnl0VmsrZEJodCt1MFJT?=
 =?utf-8?B?MkMzS2M2VElGem1jOWtlYm5YaFBEWXU3TUdsanhaVUJNcWlUYlpsdk1DS3Vs?=
 =?utf-8?B?S1hpZSswc3JtNjFBL09Dd3NtR1JFSDNOdENpMXUrd0k2SWFGeG93N08yWXUw?=
 =?utf-8?B?U3RmclQ3a3EvMUtKcGIyeTY4bE1PekVZcGpPOHI3bjJ6dkFzSU8zRFNjQ3Y1?=
 =?utf-8?B?MHFUUi9odjFFMGlPQ29NWVdlUE90NC9xK010SGtheklkWHlHK1NNeXZ6YVRK?=
 =?utf-8?B?ZVEvMDRySUxmZWNkMVpEZE5aNklqT1BacWx5dHFGby9ZT2RiYWlsMExyU2x1?=
 =?utf-8?B?NzZJMGVSZ0tZZU9oZlZzZVJRZlpOTzd6NDBWdWM0eWd5QWdCSGlOdE9aQ3dz?=
 =?utf-8?B?T3pRYXM2ak94WEFYZ1JDS2YzbEgxQURQUzMzRUpkT3E2Ukh2NFMwdGZoaFM5?=
 =?utf-8?B?UzN0cUJKOHdZRzJCR3ZXY2tnWWRML2FSY1VnYzdFek1MaC9Lem9lSkltZ1Yr?=
 =?utf-8?B?VDJCNXRISmt3bWdhMG84Rm1uNk52YnFYYXdWWVFkaE1WKzFGalovMTg5TVRM?=
 =?utf-8?B?dVRldWUyemFDaFhUZmwya014M3pXdzhMek1ZbWRzZHZxNnZiOXJ0ZU52ODI4?=
 =?utf-8?B?cnZVNGk3UDBnamFBWTl3NVAyeUFMMTBkdWVIYlZqeUJ0T1piRDhDTUNMcDBC?=
 =?utf-8?B?Z3RSb3FLU0JJdXVpTlZPQ3phUUtJMHdjTitKbFl0bG9NR3k4K2x3cG00bnh6?=
 =?utf-8?B?UURvVWdoTURScGgxd1hvK28vZjkwUFhiMTVUS3l1emUvOWZjZ3c3L05VaWlK?=
 =?utf-8?B?ZWdPOUZVZENRSkNHcXIwcVRHRDd3SWRMY3NGdmV2V3ZiV2JFMHhmYUZ4OXhp?=
 =?utf-8?B?alROeHVudzQ1ZGxSYVNCNkI5QWNvQkRRMHRZZE8rZFAzUEJHNmxyQkpxbVVp?=
 =?utf-8?B?YXZ4ZW9iQUxJKzgzOUNaa00xazJRVFdUSVZ3WFZPOGFvLzNXekV1Vm5xcFNF?=
 =?utf-8?B?VzBGbS9vQVlKeEVZSE84SDN3a2ZOeFRHOXd3Yno4bjRMSkZGa3JiQVR2V1Zm?=
 =?utf-8?B?dUhnZHZkOVgrMkNhWTdJeHhhMWdzeE1vbXoxMXJmRDNIZDVzcmdhRDdKbEo5?=
 =?utf-8?B?cFZOWHNSdVRTVTh1SXJRVVBEY0hoN2pxZElrMU1kWGk0cTJwZmVxQW1LZHNH?=
 =?utf-8?B?enBHcjRlUVBwMGxrY0tPUVFUZytKK0tDaStHUE92eVdjOHB1NjlpREU2dHYy?=
 =?utf-8?Q?pDgY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkFaSlUxekUvNXUxQVNmc2VwVEw5dDMySHM0WHQyMXlqSG9SQzkzQVBQTEdK?=
 =?utf-8?B?Yk5za21sMVJTdG1ja3NrdjkwdjJyUTI4SjBuOGFTRktlcTU2S0hrOEVseDI1?=
 =?utf-8?B?TldFbFc3MVh1Uy9JaHU1dE96bllXMUpWWm1Qc1hjd0JTYnFqR3dQblNhUE1T?=
 =?utf-8?B?ZXVjL29IdXNJN21uM3RYQTdwcmU5NGJPNU5sQVhSNTRCdWtBWDRUT2FIcSts?=
 =?utf-8?B?MTBucnVMd1puUlRnbVVBakxCUkVoYzVJU3prWGtTaXY1UCtORHUvWnE2Slc2?=
 =?utf-8?B?bWZTRVp5VnF5V0hSVWtqdTRSZ0NMMkIrNWZ4SFIyUlhhVFp6L3dZelNSbEM1?=
 =?utf-8?B?NDJucVR6ODVBN01XNUhXTCtyUStNeFBPdlhkSW1yNE9tdVRoMGFHVmVNZlpQ?=
 =?utf-8?B?amlsWjlaMUlKTThXWHN1MUVEc0R1dnlYTTFEMDJncVlvaU1hYno2Rzk1Ti9o?=
 =?utf-8?B?WVFjd2FDWFRVTHFLdkt4WWhlWTdVQlZmUlNwTWFySGFIQjhjTjFwZ05YcGZG?=
 =?utf-8?B?bkVraFVQMlBYQjE5L0JQaGJQSTYzendxQnNnSjVHU0lFQXlhMWdqVTdmRzdI?=
 =?utf-8?B?TGhENmVRRlcraC9wc2V4TkdWUjZCQ09JRnRpQ3RyNEtueTVrbGJTVmNrdkRU?=
 =?utf-8?B?bU9xREVVZWI3dmM3K084Zlh0aDc1M1Q0VHhpVVB6VEhDVVZsNjRBM3p0SUVw?=
 =?utf-8?B?Q2ZpTk1ZM3Zkc3BLUnZ5U0Vpc3MvbTE4UGFRaGxhUFNmVGdOOUV2OUtmY3dV?=
 =?utf-8?B?eW5SUEkrMVZhZWxTOUptK1Fibm94QWF1ek85ZndOU3d3TTJSOWlkSjZmMGYw?=
 =?utf-8?B?NC9HdEZlTDhQMDNVZ3JTVnlPOSsrOWZmZ2tDUm41SFVIUEozcnRTeTFkZFgw?=
 =?utf-8?B?TVZ5eWZZelNvSXd0bWdSNEF5YjhKNmNoT0VBRXRTaFluQUZwdnE3VUJRMlFN?=
 =?utf-8?B?VUhDL3ZNV3U1ck9JQTA5RHNXUytIQ29MWk9kazVxb2FBQ2JHVW04ZGZWYjcr?=
 =?utf-8?B?RzBOUEU5N3BkMHZ0RTR4eldhY1RVbW1HczNYS0gxb2lYc21DS1FFeGUyYy9u?=
 =?utf-8?B?TVNIcTEwMUV0Q1NBOUE5RDNVODlSMU9kbThCZUlKUFlzRk5IcSttVmtmaW5F?=
 =?utf-8?B?Y2tYRFpqZUdQb05waEdJL3pTRmluV3ZVUnZONDFhZ0pQdjVuWDdOQyswbGQ0?=
 =?utf-8?B?dHhvT3BjMGVKL2t1YXd5UlV1Y1A0dWprSHIzOTRIZmdIRzI0UkdTaWpuRko0?=
 =?utf-8?B?WkUzNXZ6Z3dPK2t2KzVzSlA4ZWZPci9BVDNzbk5VTDVzeUVLcmdPYmZBQThO?=
 =?utf-8?B?VnMyVVZiUDNuVFptM0F6SjdXN0c4OEZDYjlMbmhVZEFFTXlJSCtyQUFDZnNM?=
 =?utf-8?B?ZFVrLzU3MFBEOXJqMnVtUHZSditvSEhSTWxGTHFuNHh5dlBhN1FaWnhyNkVS?=
 =?utf-8?B?a1Y0cVBtZTdnT1N5NGg0WHp4Zkg4bVQ4aVRIWXRJdVFnaDFPdlUrNUdwQ3R6?=
 =?utf-8?B?eG1EVmpxRWFNblVTcmsvVWlVbDdiRSs1V09iRW16VDh5OFJWUkR5RVpNbnhs?=
 =?utf-8?B?SWtuRWlOQ1kxUzJ6YUl2T1h1OExWMXYvUmhqbWI0bmFRWkh6RE9rUjYvMGVR?=
 =?utf-8?B?NTVhNzdPY3VyVElsZ0d3a3hzRjhqaEpEWTYzdmNibFo1bE1Wc1ZjNTRQNjQz?=
 =?utf-8?B?b0ZnMjN6YUw3T3hHYXdwbWJLWUVnSVhmd2gwUXJQQ2I3ZTJaWm9kOGxQd3dt?=
 =?utf-8?B?Z1Y3T1BZM0dqSFpGWmk0K2ZJdW1mbXpjMEpJVVp3MnRvSlVlU1djWWZYbkRw?=
 =?utf-8?B?bzBwUU9QUzh2dGkyU3hicEEvL3BpRzFsN0J2b1RmOXU1VitlU0hyb0N4QURC?=
 =?utf-8?B?YktsUkZYWU5zMlovRVlnQXBMaWI5YlU5dVlxNHpwV3hpSFRZRFpNK2dkVExD?=
 =?utf-8?B?c3JJekErdXZGS2FmNXB6bjhpZEpuUy9OV0UvaUtsQi91OENuUmlxN2FpNjNv?=
 =?utf-8?B?cGt0dG11dG9ldjZERXR5V0cxQjY1Y1RyUzR6dTBoZ2JoTy9jUnc3OU55aGNw?=
 =?utf-8?B?cWxYUjBRVjFvTUZ6Y0QwcWw2MkVZeVA0QXJMZUI1aUJPTlFKcDNyQjA3b2kr?=
 =?utf-8?B?M0NVSk9ZMWt2MjFkTmlWSS90emV1RkdRVkRMc2ZJN0h0UExuZ2x6U1hFSXVE?=
 =?utf-8?B?eXZXTE5vMFVkWHRyL0NWbitTaVM3OWFLaVJ2cUpBY3hsVk5wVEhsL0FvSXZv?=
 =?utf-8?B?K2VTSmxWUWVmTkF6NmNpNVZheURPM2kydXZpUlRCY1l4aWRPdDZtdk5FbFhk?=
 =?utf-8?B?UU5Tb0Z3SHo0SEpZbjBUaFVRVnpxUm1MUWpsNW5EaDQ3WENFZEFIZnJSTm5V?=
 =?utf-8?Q?l8cZV6Bj8NM8FP64=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a40f0c4-abba-4120-43c5-08de5c9414de
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 04:33:41.0093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nhDXom+Ys64nxpevZqC1wlLtAIpO6mQrQ1mgJVSmBu7ZwHO5FKH/pbxW0q3vF6qa6o5NgwsY8h4rwZz2jgRGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739

On 1/25/26 8:31 PM, John Hubbard wrote:
> On 1/21/26 8:15 AM, Miguel Ojeda wrote:
>> On Wed, Jan 21, 2026 at 3:58 PM Gary Guo <gary@garyguo.net> wrote:
>>>
>>> Another top-level question I have is whether we should define multiple registers
>>> (perhaps all) in one macro invocation. That's the strategy of `tock-registers`
>>> crate which is widely used in embedded Rust.
>>
>> Yeah, I suggested a multi-register one for something similar in 2021
>> and even tackling extra automatic codegen there, like e.g. adjusting
>> the value as needed to get to the proper unit from a sensor.
>>
>> Not sure how useful the multi-register part in practice it would be,
>> but it would allow to relate several registers together if needed (is
>> that even common nowadays?). Or perhaps things like the
> 
> For the NVIDIA GPU drivers, maybe not. Just a data point.

...although it depends on what you mean. We do have lots of registers
with a common base MMIO address. It's just that they are not all
invoked in one shot, is what I'm trying (struggling) to say.

thanks,
-- 
John Hubbard

