Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED4F7DA66;
	Sat,  4 Apr 2026 00:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775262698; cv=fail; b=FJAlVb37UJZgSuFqB6xOWPw+/9VKq0RHfbQ01ceWCppV8CE3H57jhB8m2JiFel1Nrz5QBUNzHZ7vTq3Hwt3Z04jXOIkQxDgaE4prQsFuPFJhnHuDIraFfhgrqQz7F3nrpdNfPuVlvaz/gy3QdwU+urNMEwaSZdKIeHVZ+OzukFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775262698; c=relaxed/simple;
	bh=NL2lRQsuXbiTKTmbN1qqxrLFEiXMyPXQv04sP0+3pig=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qJPoTCb7zBbdxdQkoUu66uZeUyg3wKchfQc1mpVlXx94AmTOVyl6ZLFgj0OsL81/bNsYdNvS9BoxFuB+hxxvJL5aKIqD/vJaGVsmocjuBKo8hcYdqpn5hBW9NJqETBu3WiRr7Mel1fKh7tkvehMGrsxGo96aikPZNZ4swYeikfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HbSq/SPA; arc=fail smtp.client-ip=52.101.62.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HbSq/SPA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyXl5fsSHrwqYXJQpaVV83FKSJAQP8rM8nnFCMjmcnvORImQs2hic5fMNjZlxfVg0srk8Lpx8jbZ9zsGc1HJfRzhxVMosW6UOlGOwYimxB4HfyPJ/LnJab7h5Ez/bx6v41nt0BWVIqoYM0qMVuUSkCHKO3Fp7Qwb4cYXBussMZgzN3jbu4xXPw64HfcbrLMyiMw5BY5g1WeYln6jWtCI8NBfCtR4wZb+ge2e2DybJy04a3tw1GjmIXth6Vhm8k1i7of3GsxSPNpbrdNSfqfoUiqGV6tp5skk2nXfGCWO9jNRWlPk7rgTEfRM/+TH5Tc1bHV1DIZvqYuTnpPNc/jSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeMG9K9MkDgcjCHO2lZKbZ03ZKUFWHYH7qX/TpbRETg=;
 b=XmB0iY4CDwaYCtBX4Ry+E2084LV5O8h5UO/jnczIZ/fB7muWHaVXIA2Ec3uA/sakT4EjuzosgmSdfe68o7q1qlhJWxmuKtm5TQ4HF2lmNzM3IK9M5MnJyGKTcl5nwxde2bFUPGlZFCuMTprH1eYsahVtJ0Yk8cdo2YkjCFu/Ik4nZuJ1xJidC+zcZcCdcYy0eNVAk6v3oge4yppqv23vHm51zHC29X6sMI6P1R6oxFSzr6OSS5jvVQfFTKx5790ulOyJ7p3Q0LLFIeYCtCZxC381z6zPDXcLmkxGpnaasez5U9cySlnOKKvVyr+0uXLMH2GK8dEHv9OmqdxCuB0SOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeMG9K9MkDgcjCHO2lZKbZ03ZKUFWHYH7qX/TpbRETg=;
 b=HbSq/SPA9IA63xBbGXZtPqP0LJCeFr7GArqqTcyt6vyDM8q85z/3BMvEn9/fNFy4OVKsd750ZkAMKurqaesSpVf/jNf3UoannDcmyh1mAq4U3U29q52+Y7t3ZNF5t9Dc2Y+tKhRgQkt9ZnfC6jzM8oQ6scMM2APzejzZaBisyjkIehOtKPOIxZRzrFMBYxv3HuBxFSKyta8GeK6D6fGrBvXLe2mm9b39GtW/POanTXt6xvVK3+X58A/5LijpwAe8QopJfNwUJaCJFOhlOVzA7f1/2H3257wEh5kKuqCKgnsm17w/GnSGm3zfuIu+C8eSVLSw+NVJ55PfHRvgcLnQBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8689.namprd12.prod.outlook.com (2603:10b6:a03:53d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Sat, 4 Apr
 2026 00:31:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 00:31:33 +0000
Message-ID: <19601749-9e89-421d-a2df-399b3758ecca@nvidia.com>
Date: Fri, 3 Apr 2026 17:31:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "gpu: nova-core: gsp: fix undefined behavior in
 command queue code"
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260404000254.284467-1-jhubbard@nvidia.com>
 <CANiq72nZv=yPswYJ4anOxhe2Vt7rjBF-5dxvawsUMWDrq7jMqw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72nZv=yPswYJ4anOxhe2Vt7rjBF-5dxvawsUMWDrq7jMqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ae4c89-a420-4bbf-3a3a-08de91e1859b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DDS+wgP+JfnWHNcgFu8nBix8Qifg3x0IduyldzgbMUknO57AoOJk01LRfZBiTbD6hYynq32JyJxfYZLZom1L/MAtnes6qH4t9/BPUGRLirzyrR48IhFO6Ofh5XPekAbyjRlyh2FSdEqgwi0Rle3WP2/k8MS/zCrBlUCs7S4sGhpikRB8e98fX91NQfxQc8HPvNn6p5HCcu4r0L6jLpC5AyRonhPPww54gWynMHVKReJULBqPZHMWbnv/MkJj1h8Od7l1bd7uOhO3FpSHtN3ThCm9JYGpapYC9MXvzVMywzlNOLuu3RCsIPt4H/EvSbCnNbxkpwJ6cdBCMmEny0r4HLh9wXxVPGzZUJMdHWg2kVQ7gwS9ubWb4ieJ6t1iMgEcvGlUIVYF5XVsgSnPpi8yKdpeA4YPKB+l3tL506yttiGtwpERO+cypTnv+k0q+Nb/YUsjNVKK/nqiAX5SAr/ZI095/PlFpE47J5KYW916H97Zf1n5a6I5RtEgChVsF4c+cGLgClZB/1pefDV13D2uGy3bb+kA5gEUuRQGEiHIleNVozUina5BIX7wDtepjUS5g56uD1DaMfbuhkvPv74CPZCoAaq+1/HPafn29QKxRui0AntUXGiI1ezewsoVJWYr7/78QiQvV7HwbYE8zlIs61DQRCU/GoU830jrw861uBuR/9l6gYcLtD2zSZsP6sSxa9EJrkp0TnFW4rspPO0ZGw7hMvXlL8z+wXUML592Upc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDAvdi9qM1VSZDFHQ2ZtZ3EzK3NWT2c0ZmNwSjhKVGNvZUVuV21QOXM1MmFM?=
 =?utf-8?B?bDdjY2tmTGQvZW1MSk11Uk5pSnlwN0MwVUJ6OHJLdW5DK0VWeGR0SHpFUUVm?=
 =?utf-8?B?WHZOQ0Y5cXBzdDMzNUFlYk44NXVyZWxJY1hOcUZrQzZxczY4ZlQzdWx5VFRW?=
 =?utf-8?B?c09RcDJuMENRVVU0YUdNUUhqOWZkRTRzeU9rRzRKTjBBcE16QkxaejVOdHoz?=
 =?utf-8?B?cWNDUjlCSnRodHRhNHBPZ0VWdlpZRFB5blc2WEY5NXhVcEtRTmw3VUlQQW8z?=
 =?utf-8?B?ZDBudWdOanM4SmppWmJhcWd2azZrcTZPZlBESkx4K3Uyc0F4UVQ0UDFqTStG?=
 =?utf-8?B?ZnVWR0dlUmlFWXZ4MUQ5T3lQTEhTWVVMNzljVDlUVE9PTDh2bFFXRWRxQ2dU?=
 =?utf-8?B?djJ2azVTUWk1TDFzdjZnSzE1SUlyY3pPRVRaQjhKQVMyUEVUdWJWZSs0STgz?=
 =?utf-8?B?czFqUlBnakNhS2JOWG1peG13aWxSaUVIQnd1VFZLMEt5WmdocDN0Zy95TEVr?=
 =?utf-8?B?MzczcTFyNzFha0t2ejE5dmlYOVRDYW55a2hKNWVjNUlHbEE1eXZMM29ONXJU?=
 =?utf-8?B?ejJ4UlRraDR3cDRteEhpRGVDeVloQVl2SVk1Zkt4Q3ZnRE92Q2RlNGw4K1hN?=
 =?utf-8?B?SnUwM1VvMXMwcjBPcFFkZ0VtTkErckdiVDJpK0QxdW8xSXd3OVd3SlJ5cEh1?=
 =?utf-8?B?TnFwUFhDK0g2aEM5U3V6aXplSjcwOFFFNHMzQWRaTDV3TkYxdytZekRvR0tB?=
 =?utf-8?B?bjhDbEN6dmd2aXVjb0VHRUNDTlZ1LzNLQVpHRkhweHhIRzlnREtSbHY5a2NO?=
 =?utf-8?B?a2pDZVBlRE56emFmNFd3SWVpQXhyYSs5MWd4dmNlRDh0bUxjajFjT2ZSejVs?=
 =?utf-8?B?YWVBQUdscGdRVUlnNXc4am9PaktMNEp0RUxUS0wwOUgvdHFnd241eEMxRTFm?=
 =?utf-8?B?Tzhsb0xDWXZjcTNvQklMV0dCcEdYNmJhdG9FamxBUWhvd1c4YXlMOTZoaHZF?=
 =?utf-8?B?MGEySHlRUGZqcXBDbnpBWkVJYVJRcW5TUDZsSWxhOFZUYTFtbWhNazhob0Vw?=
 =?utf-8?B?T3A2TGk0T0FVQlZiTnZHWXZob2JuMElmbjFHbUxsblQrTHJPWnpJc2JhQUhT?=
 =?utf-8?B?bHJJRGoza0xFSjBYS042Kzk1Zkd3SEp6N2ZNOHBKWmJUMHdYbnA5NU05aDQw?=
 =?utf-8?B?R0VSdkhES25xbUNTSmQyQklnTEVBaTJPRktaSXVlRjBtVXlsZ1dQSmlDMGZJ?=
 =?utf-8?B?a00zV3VYSlhJdXpzMGpUS0RMOGQ1UG9nN0RUam1hbE1UdzlpZUNNaUMvMUJJ?=
 =?utf-8?B?Zk5TOW9sWFZFMElMbXpEWWdQcFk0STVETGl2N3B4a1dHUFlvYm1JRW5xMVFs?=
 =?utf-8?B?OFViRzlHQzB1RlhZdEdhV3htc1JmSC9iRVRQK2dMaEtmc1dHWFhubkt2K0s0?=
 =?utf-8?B?b3M4ejkxeUNRcndLbmhaWUZ0cE40Ymg0QlI4MEt3MFVnS1VxbFpPZ3ZSNjJS?=
 =?utf-8?B?bE44T2d4STZWSnE4UlRNcHZRRHdxVlhYcDFGbW1jNGxwRW0yYTFrTkJHU1Bo?=
 =?utf-8?B?WWFmd0xNcjhDUFQwMGJxc0JWNDlLdnN4eWJrRmJLS1R1T2xybmZldDZCNVhZ?=
 =?utf-8?B?ZUp1ZTg2K0pFTUp5NTBLZFBpdUhUWEwwdS93VHdzWDBFYjlYWmVJRFhxVlh3?=
 =?utf-8?B?aXFyWmkyMllOL1VFb1d0L2dRTDM2bU43M205aGw1QXZQY3lkREw1OUY4ZXpy?=
 =?utf-8?B?NmswOG5hcmt5WmJYSFc3dk5nRXlmVzVpdUVmcjEyN2RzUHM1RTVXa2xTUERx?=
 =?utf-8?B?Wm0wZFIvZld3dVlPQlRoYkQyTEpJa29OVG9OVjNIRG1icXFwSERpNEZhSmRj?=
 =?utf-8?B?L2E2K3RoekhPdEYzeVJMUnhNaW5QMUZpV0MyMmdoS202T0IrMlM2OUlGb0Rt?=
 =?utf-8?B?dGpwOXppd255ZEgyMlgrSG4wUmluK1BJcllqdFlub0d1TXV2Ti9pL0FGMG1q?=
 =?utf-8?B?bnNGblErbFVCeHNhS1RDSDJ1b29DMW5YNlRhVDZFQkNTRlMwamppNUdPUENG?=
 =?utf-8?B?b0E3RnFxbnlkb3IwTWp4Nys4UU5ZSHMvR21ndlB0Rk5pMThYSDNaRGRCNlRK?=
 =?utf-8?B?N2pEbmV6bXRzd2g5U2kvRjBTS21NdktTZElrWkJIQ0lQZWZUTXZKcTVDTTk3?=
 =?utf-8?B?WjlzWFhvaVdZQ28yekFPR2xhY1BBblVzOXYvZENLL1ByR3RtWUNiZzcwT1pT?=
 =?utf-8?B?dDh0SlhETWh4ZXNMUEJJcVMvWnJDbThjdDNQaHZ1aHVJYmZ6WjlCUGRPNHl2?=
 =?utf-8?B?dlZxcHJpOVdUWnVwdWpqbDZZVWxQdU1FWnVmcExxTzJLMUxLUXUxUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ae4c89-a420-4bbf-3a3a-08de91e1859b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 00:31:33.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxRgBrbbchnejJeED/V5WqfKZaZuf22YL0fu8KUU6pQ3xFkPMG9SY2J0miLc/ElHQ831Jy0n2onrn6PMOWcrZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8689

On 4/3/26 5:26 PM, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 2:03 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> This works on LLVM 21 (rustc 1.93.0) but not on
>> LLVM 18 (rustc 1.78.0), nor on LLVM 19 (rustc 1.85.0).
>>
>> The kernel minimum is rustc 1.78.0.
> 
> It will be 1.85.0 this cycle, but a related note in case it helps:

I was really confused about which cycle 1.85.0 would land in, and
still want to confirm: "this cycle" means Linux 7.1?

> `rustc` supports typically an older LLVM major version even if they
> provide a newer one.
> 
> For instance, Rust 1.85.0 has a minimum LLVM major of 18, but the
> upstream binaries come with LLVM 19.1.7.
> 

That is also good to know, thanks.

thanks,
-- 
John Hubbard

