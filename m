Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202E21C84A0;
	Thu, 19 Feb 2026 02:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771469716; cv=fail; b=B+GDTKE6TCkFe7y/PAQ+g9EWVV7I5wMuuMkICZIgFgpfsGbM6sQy6Ep7ENomPNHp+OkHPE6VZiYPxGOS4+tfYHYx6KnpUgBNr7H18KRfdPg9lKRVMfiA7QjVLuhesJtlRBP1jIlNdPiOllOSqzl/0xri2IAMixE4f5Zo6meVDuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771469716; c=relaxed/simple;
	bh=lPsx3+H6kcJihSP0C5NCxwPSUNgZGiGggWpvTP0RfBg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H7w3az8tbjVK5naAJ9rsrz4ZvPNmgdGQJV+xsrf8Dk+H+pAe4zYVp2BdYADMpi4EbI/xvE5VeD8r9rcH0Tj/h3SnHm9YInICPc3h4orDWJABpqqGerrR0VRrg0iY1gtBuvRxXJ0USd6D2AZeufUVqFK8O41XwDcKen+NlWrL7Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m0Kii25r; arc=fail smtp.client-ip=52.101.56.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m0Kii25r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWXSbceDvnLuanBOURspzbu1ULpjCARY5vzPnD28V/MiGbmQsptvLkLF75X3uybiNU7C2d4P8qArgIjVMBNP9aTkjwhZqk/mArpnYmSK4dYwE/MfAls6c+w8A8PnMjZQGecK4/FzfiRn6P/Hozt5K7i6kIwmIA9QeQUyarZ1BvWsUflZn/8cS0Vz/HhEJDFJzIjANDK1RQytjYvu0U7lrEuJZMtbL8EHs3jy5g06+/0YjVDPslEaQ3QvePEHnY4CRgWE8YoVbM7T0jnhAHY3bCAT7ZW5ocMM8jvz6+ovvI7khl5UHt9wjFliPy1RsobNNJV8/lNmLc0lQO9jJUvxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+S2pnZs3qJ1IITchuM7cPDi5GtVsogI/jKgUT7Ta10=;
 b=feSYbWSj7tjFxY8X5kztLhE1hfUNYW4Sd92IWPRMjUIrpIIx0u9hkn4WkCHixhhqq/Vx4aHJ4lmjir449JUDpWp5Lslai6bZWLzOBefKYWvw+1FSs8Hwbr/0X/ee+zEoT6MB5g0xrM3DaVmgvfG4zhriQnQ97SeuayhIAo0QxdV5guzRvU7DXEVEl8kxUn/LWe62P9KLUHkgHXwVqyKcJs5fyYgJUkG0nmAlPZKufvQfTanf38HZByKc5+lwLXqTZ9hq1K7n93hLchXAhl/+mg/8nvHHFjZBU+9csV1Q49lxkg4Uir4BWJGHy8bh/ATxEZZcvEP4JFOPWNc9vR1/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+S2pnZs3qJ1IITchuM7cPDi5GtVsogI/jKgUT7Ta10=;
 b=m0Kii25r6Mw+M1e3uQlYUGslBYZqXX4BYfagR0242tat3zHDgmiXA6bYPcHijE+BDf3JjqW/Xy89PJrwd6FLlWWgjAHIH4sRmQzNc+8Iuzww2X54D/Bda+Lpe03Njs8orM5nMrzw43gthrnx2twTujyXnNUzYHl6N2c/nBPmrWzB7tPGUC/fnYxs2gdevOckfEsF3Lm6IcgTvqDAOP+jpdY8X4H/B9oKVYvw29n37TccOTD3NqaVpgUY4PJWKhFVrxdVQNNBSnLWWCxX8LXInpEzso6wjQRImnFnCxxBM2mmqECZ6pFlubKA4ipe7zqyshYnVA2fj/KoQDuH7mW7QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 02:55:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 02:55:10 +0000
Message-ID: <eb4ce2bf-3d10-4cc3-bcb5-f52133470b62@nvidia.com>
Date: Wed, 18 Feb 2026 18:54:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/33] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-18-jhubbard@nvidia.com>
 <DGC2UTPTU2ZH.3Q5E9OW3ZRPLP@kernel.org>
 <b38a9707-a640-4104-a8a9-238cab23187a@nvidia.com>
 <DGHCP8CM5CRI.2C5YJ7S899XE1@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHCP8CM5CRI.2C5YJ7S899XE1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f0d739-883d-45d7-b236-08de6f624b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW96dFZ0MmtVWE96dVplTGk4cHNFK1FjTlEyOS9KR1NUbFJITTdrckVJMkRs?=
 =?utf-8?B?eVNQa043Nm4wK2l6NWhWSTVTWThWeXUxcnJGcloxWE9IdkxxdEtVbm4rdXhn?=
 =?utf-8?B?NC9pV1BxY3dTYUxqc1BzQjhrU2hpdEU5M00zV1htbEh3VzNSeGpwSEZ1emJZ?=
 =?utf-8?B?Y0czYWdrYWpGaDV1UG5wZDM5S29ubi9ZWkd4N1VCZWZ6K1lhaXhpMUY4elRk?=
 =?utf-8?B?QnpvUHViTndEY0RkNEhveUJua09wdmZncmJDN3VYVU1OeW1vR3h1WDRJbjVz?=
 =?utf-8?B?ZEp6UHpObHpwbVhadlBZSnhRZm5ZUXUxMDFiTnpTLzV3OGp0clh5ckg4a2NR?=
 =?utf-8?B?V0UyMlB0a3RKNFA1bUZZOThGVkdGcG04NE5NZlRNS0NMMDRpK3BZdkxRVWl2?=
 =?utf-8?B?Y005YmdlQTBkMUsyK3BhVVNoRVYrNlFHd2U1MkIrZWVXTUY4c09RL0dFVkN6?=
 =?utf-8?B?Q2gzZUJSbUVCeGdxYzhvYlBSQ1BHSkFKTWVHYlFaZ1RJWFMzQ3l5TVBmSmxP?=
 =?utf-8?B?QnRGUStXTUdZVG5FME40a0NOcENXTGhHTGwxT0Y3ay9WeEtxd0U3TFRsZUhn?=
 =?utf-8?B?ampYZkVucVpjYnRXUUcxQTlrSGRTZDRCUU9iYkVPaURJYWZWWk5ScEdDSm1p?=
 =?utf-8?B?QWFkTVNWeTVUT0VIVzJXRDRWb0I2S1FCTmFRWHZ4TEdzZk1wbGZxMjYxSWVh?=
 =?utf-8?B?eTcxRENRSDVMMmdNbXFoTjBmUzlPNlVZeFE4aFBMTmJWR0tUZVlibmFlQkQ5?=
 =?utf-8?B?OEduYXhYRTlzVzdKaCtRcWl0c1pKeFArbDVrRUpmY2xLb0dHRG5FVitvcTVk?=
 =?utf-8?B?bm4xb21LbnBJTXJRT0NBaDMrVzVLL082OGhKcmpkZU1hUlVhdXMyMVdkMndE?=
 =?utf-8?B?T3dLS0lyRUhQOUwxUTQ4T2pCNlBFV1FoK0hLcG42QTRxbEJ0M2trcXRKZ2lV?=
 =?utf-8?B?RjB0UHVPT0tTM00zS1JZUVptdk54MlRMR1RnMmhLZENiRXFmWGQ0ZWZqV2wr?=
 =?utf-8?B?bWhvWVgyWitmUUpaeXYvUzZLYU8wWTlXTk9kSVk4SFlOS09iOTVlUVFRV1R6?=
 =?utf-8?B?UTZ1Sm8vSlBZQ3B2aGJMYTF3MnV5elVFMVRweWR6Z2hUZUhKbnZBTjJGdEIv?=
 =?utf-8?B?d09ISTludFpxWFEzb25velFCQ2QwRjdKQk9sZ09EdDZjdGVWdC9xTm9ocTV5?=
 =?utf-8?B?MjRXN2tkY0ZPcVFkUHJmdjRlNDR5MlVwZjhiWGx6UGl6Tm4rUVM0WVQzUGVz?=
 =?utf-8?B?Unl3MjNQaURDc1ppamN3NElvc1ZRUnp6VnZ3anNISUZQMU5MYWpneUkyeUJI?=
 =?utf-8?B?b1Z5eHVUbjBXUXQyZURyaWwyYkV5WUY2d3k1ZU5nZ1F1NzMybnNMc2lCM0dJ?=
 =?utf-8?B?MHh4aXl5aDBBSWxVVHlqME8rVHNpbjZkL2dlQjB1VmxMLzNSeS9MdzNlZmtB?=
 =?utf-8?B?Mm5FZFNaZVJCbFN4cTBjL3pUZU1BdFM0RFR0L2F0QmsxQk9veHl1dVU1NDlM?=
 =?utf-8?B?cVB4MDdaYUQ0K1JKOGthd3dGUW9oTjVsYUkvN21ISVJoQXEvenNTRElnWDJo?=
 =?utf-8?B?SGtBMDEzYkhEQ3htM3JGVDhiWTVrZVNFNE9aY1R5NFhYM2RGdGV6dzZwN2pP?=
 =?utf-8?B?RnU0RkFFczhVTXB2clNQcmw2Wjl0bjJVRDkwSXlSaFhCamVsVEVtTng1QkFH?=
 =?utf-8?B?S250ZFVGbkxNVnVVQURlOXRRKzV6bUtQVkEwVkNmbW91K3lLTlA1bm9qM0dK?=
 =?utf-8?B?aGU3M2pXS1hGbEhObDl1ZXZlWFRZblQ0QklabTJSZ2NWQkdNWWFQcFRFNFhy?=
 =?utf-8?B?cVh4VktHL1VGdXQvYzhuOXIrM1RPRCtDL0ZZbnVXcXp4NWlLTzVHbmtHV0hI?=
 =?utf-8?B?TmYzYmd2aitMMDEva2lNQndDWGt1S2s2SlpnZmhJd3NvU0hvaDJxLytlK2RE?=
 =?utf-8?B?Q3VVN0dzd2R4Zmt1L2F4RFVOaW0xUVJZWk81WW00WlZJMHlWbkk2WHdyUVlq?=
 =?utf-8?B?SUJLQklqWHpiWjc1TlI3bjYxTkJWaStzUGVrdkxZRVpJc3NTUDFneXpkdnRB?=
 =?utf-8?B?TGVWT3N6STFyQ1VDTVBvamNEMXpsSFhwQmhUSEx6ZXFuWVdtTGVXRmpuVnoz?=
 =?utf-8?Q?2kn0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEpiaFZkQ01qMFZCRTdhVDhrVmZlSWkvbklJUjdpc1BSRHhxUW56Ny9aM0ts?=
 =?utf-8?B?N2tGYXJyeW1relVoMXZTSjJhV09raGRKUWlobHd2TzFuRHRveE9ta3Fpd2h2?=
 =?utf-8?B?SEw3ajJWVE1LOWdoaEhnN0QveE5objNMUHlNUHdRY0RzdC9OQ1liSDhsZ3hw?=
 =?utf-8?B?aHRYWlBKblgvdTFkMXlLZ0NTU1RLbFY4Q0xzVVoyWHp6ZmFxTXdlTGdMOUZz?=
 =?utf-8?B?aUpCdTBYOEhkT3JwdWdVZ1BYckpyRXJsN3VJZHp1d2FUNmJyRzY3ZDVNSmpw?=
 =?utf-8?B?MC9wc01kbnpHaFlYNlpiY1VPRXZhYldIUE1FMUtHYmRVekF2d0tIMFVGeDJ5?=
 =?utf-8?B?Z0tEZGE0OE1wa1h4TXBuSEdDMFAwWk5ienlrY2o0TmZyYkVoTDhsamFvMjYz?=
 =?utf-8?B?WW1TcHdzeTNCUU14Y2FwNW94dkgvaTB2cUdVaVB6SHNFSFA3NWkzYmowRkl3?=
 =?utf-8?B?U21VN0Q4QWErTmtsdGt5MW1yd0U1b2VZRUhiWktWeDAvY2JmakZ4bXMwYzlj?=
 =?utf-8?B?cXoydHZPQXQ4Y3dLRHcxcWhDaDdOSDZ6TjR2OW1sZUxieWdaOWlqK3ZLWEVx?=
 =?utf-8?B?T290TFZKeHZBeVB2allNVFVDakdCVzZUeTExZDhScUNvNFFoYnVRTS9pTTNP?=
 =?utf-8?B?MHVJRk5EYno1NktaTVdqK0VUMVBDT2E4OWJ1R3kzY2ROSWJRcFVIK2cvdXRQ?=
 =?utf-8?B?TWhhWEZ2VzdwS2tscEZjZ0FtcTQveXdrKzdzdlNsSXFBTW5FT3JRNlRaNzZm?=
 =?utf-8?B?aG45c2FCT3pVdnV4UWpCamsycU5WZGYrcXhqWFBiSE5BekFQNmlRRVJtcTV1?=
 =?utf-8?B?aElZQVFqMVppUlBoMkxjc1lSdlFjZW1oMU1MSDhEZjN5cHBmaTgvZHNaN1Rv?=
 =?utf-8?B?Zm5vdGdBTmd4MGIybXRnMC9TbDAzN3hhdzVjOXRmUk94NEpNaTEzZWVzMW9k?=
 =?utf-8?B?VXV2NkhNZW5WMGhHWmFNb1Y2QmhWcDlkY2NpdG9BL3V0WVJtR2lnMXJkVmxr?=
 =?utf-8?B?SFRMbVprZGZSaUJ5NEJiWTlqZ3dPN0dJU0c1OGdoSmFtOWxGeFdyZVVFN3Jv?=
 =?utf-8?B?RzlnZGJzVE5mQUdhM1E1Sk4wNkZaMm8rRUdRWlJNaXFxYVNLT2pCT0V4Q01h?=
 =?utf-8?B?NDhqV01ZU251c2FUcUpqQW1CaGF5RkxXOE9xUjJrcUxMY0trWU5KdjBKMkp2?=
 =?utf-8?B?OGtnY2w2c1RUYzNBOUU1T2lIL2NEbzNaU2VScTV0Z1pnQWVvSTVKS2lad3R4?=
 =?utf-8?B?YmU4TW1EY0tvZDVWSm12TmJuQVNEM2pNREZNczVVeVJiMW9LelFnSWE0STln?=
 =?utf-8?B?dkNvaXNrSXc5N2FYZlFENFJjbFdLQm14Ti8vaTYyMkhYUytXWTIvbUpBNXB2?=
 =?utf-8?B?RWE2b1l5enBBZjNpZGtRWnZhcExwNG0rekdrMlJrVjVhNE5xbjZvSWFISHVO?=
 =?utf-8?B?K2JlVWxWQ3lsK2YvUWw2SmZaazk4b3FHb0ZMNXdpY25GZnFxUUh3SGxmTmI4?=
 =?utf-8?B?OVQyNHgxS0pEN3RQRmwra2QvNkJpZ2R3b0FRTEVZNVVlTDhyTytWS3Z0bnVX?=
 =?utf-8?B?anY1NkNkRHJmV3dScFJ1TnBqRGNyWURjdXZndHQ5dFJHdHZ4QTVHQUk4MnhJ?=
 =?utf-8?B?R0FSdDhYL05RNHpuN2RPL0laTWNUYmhCWmdQQnk0UlJoQXBTbVNZQ3Vzc2Vk?=
 =?utf-8?B?aUIrL3hsVDZSWjVaa05xdzltRmJTYXVCZ1U4MGVsZkNscW43eHZSWVZiV2cv?=
 =?utf-8?B?dlZIZkowVEFTWUJTMXNyVWpidmNpSi9EV21SMjkvL2VHeWFqamhsUzQ2b3kx?=
 =?utf-8?B?VFBYcU1kWGMzYVY4ZkNJSHJ0eXA5ZUNHVlpYQ20yd3pFbjdBanpQQ3hPWXln?=
 =?utf-8?B?YVVtQWQrTWh3bDd5cm9lcmpHbDVpcElwa1dBZ3QxRkpHenRTUERobG9JMjVs?=
 =?utf-8?B?TTc0VVcwMzcyOTk0ZTMwdVlvTzBmUXZrbUNBZzc3RzNGcVUzRnVTS1R4NFZW?=
 =?utf-8?B?bjdrQWc1bko4NUFhYjJZaVBPaEFFeFVFdkFrWHRtSWErNUhYLytpTGdQVkgr?=
 =?utf-8?B?Q1UrTHppeWVGWjZuRVJHam9NbjU0YUczb24xd25RejVsdklsZE50U3V1UEF2?=
 =?utf-8?B?ZmJablNXcUdvUGYzZWpnb2plUm9ueXQxWm4wWGZEUjNHSGliaDlpc003enRa?=
 =?utf-8?B?NWV3bDZCK3V4UVNxdzVjNjEvY1R4OTJyemR4cVBIZkdheG50Y2VGdVRyYzVh?=
 =?utf-8?B?bWFoZXN3QnBGdHZJSmZWN3NERFM5KzNSZWZ0czVCcVpHbEtEdlpCdFRVcFFj?=
 =?utf-8?B?N3hDemtBWm9aZWd4Qk5IS2tSMjk0YWZFc0VyRWQvOWw0bXh6aVlLUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f0d739-883d-45d7-b236-08de6f624b6f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 02:55:10.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHhfMFIen7Wte5t3ppMoEgNB+5YeSRQ/Q00okipDcVbJyIsI46l8gAUH6QVH9CQHpL/GXuCRsgwvvyRFTIlpwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243

On 2/17/26 7:43 AM, Danilo Krummrich wrote:
> On Thu Feb 12, 2026 at 3:09 AM CET, John Hubbard wrote:
>> On 2/11/26 2:57 AM, Danilo Krummrich wrote:
>>> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> ...
>>> We may not get the full potential right away, as IoView is still WIP, but I
>>> think it makes sense to consider it for a follow-up.
>>>
>>
>> Yes, let's keep this in mind.
> 
> Just to clarify, I mean we should implement Io and IoCapable right away, but
> leave the rest as follow-up.

OK. Done in v5!

thanks,
-- 
John Hubbard

