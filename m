Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34BE379987;
	Thu, 29 Jan 2026 08:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769673949; cv=fail; b=l5rySKJIzcai+5L53Zu/GGifeqYSEHox9xH+5uhixE3sAh19yMbkJmh0Jo8keGaX/7DNclujQx5xr7xuVBEf2G76CwG/ZG7ZZOKM7Pozb2ld3tNi5gBlrXffXuDIlnOuV84cgigtvSA2kZwyvOUDDllcMpjJm8fdgecbsxdcAQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769673949; c=relaxed/simple;
	bh=C9thGf7Apzxd328/Vw1pS/9uKIs99BM5++s9sXppGBo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=QZ0lCPTiMxAKUPv3aNcoO4kSweV+nhx7j5gXWVQ9p2MijcTB3UfAASd6ykvOUBn0KrQnogskewqngiAWR6oot4Frj9rVRn5sSyZHGiXhotzTULExISWmHCtc/8Gt1h2zv5yD23d6jJ1TuSSOsE7YxYEuunsu0T5K/7U0QyV2cOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W/mNN85/; arc=fail smtp.client-ip=52.101.46.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W/mNN85/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8Vzq+IknA0ZOuqM0TL3B52PjF4Ar3SjSvmKVjKwDb5eB15vZwDAwLFD51i+BwoIgkm8ahpqGnjhjckfsk1jsLZ37obfFGV1GWDzK3y0Ij5yYhtupQrQrus1LAsStb0T//XKrUcjrod0amVf18n4ghPxbFi8sjqcKY02v4bzLsljcq32ZYXB0Demyv6IBjrEDQmtfnkndJBoJS3mcb27Fxg1jbYMhv1L4i1ceMLf5LHTif91+rOu59VwPy8ThDrkDnt1iyY9Y1nrOG+bDUT/k/pY4+T0GJkzr7kadAvKaJx85VAtvt9O0zpKdHFtxAzT4zEuKwXkIPy5hskKUjqlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMTTBVF4x+QBx4FBgiLkoODV0wNeeZ8YAsAy0vzWqxQ=;
 b=t+GyGaDdgNHCFZ9LpAWl4LKMvd90qcRdtutG/1a6vy6pYYvI+TYNWg+KXgMiXcjTN898lPCoS1isZ2blEY71ZADg7IjxJ/Rnp0TUdtTFU74xPFq5pwdVJAN+Yz8H9a/nm7sFs1yF630r5R+Fw3gE9SQEdaN3yHs8L4xw3icEazmoCXzkNVMcpyDG0C9JVwN5Td9mqNrF3tZkPxBJAS0I5K/i/6vWliLuwf3AWUjYUjVcaqh97r+rXEhKc9MpAmvMcP2w+ClFTjLazXzZ94FmUiTR5de0OxAsW1wDMx2qwB8tv8d6sSoeqv6BwE9X9gRoH12I1JLnj2ELaTfvn22GXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMTTBVF4x+QBx4FBgiLkoODV0wNeeZ8YAsAy0vzWqxQ=;
 b=W/mNN85/R8TBwfiFRPubbA+4fTxadksIDxSPXRCXreE5fEQrch1hsO97p0aYENA16VlQJv1rmc+ohtUDfsD0A2ZmMFVJ1jSUMnN+e384Dg0spEWZ23qoEDoMjH7IKZJFOfvopMe5tcKnMfizNjWehaL1VLUvQNK5qnE5GLtBCEocibfpylGqy8/sGaEzUBqnktPPJfG6VIRnGP0UsCXLS8ArBolVBiG78SEoF9kCXZjHvti9GYnkzZdOi67mITstiC9PIXjxtWcAbbtvBuUerdfVUYK0v16QUY86CCiYcGGVIUw7pwEF/EPEaBcoVKmc16iUVo4UmOTtmFYPr8YkJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:05:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 08:05:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 17:05:38 +0900
Message-Id: <DG0X202UKD4K.13ERXKFN9XU7V@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] rust: num: add `into_inner` method to `Bounded`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-4-aee3a33d9649@nvidia.com>
 <DG0C68O25Y9X.2X8M9OXMW17IS@garyguo.net>
In-Reply-To: <DG0C68O25Y9X.2X8M9OXMW17IS@garyguo.net>
X-ClientProxiedBy: OS7P286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: 32285ee1-d645-4118-971a-08de5f0d32e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTF1dHZaMkxDUERZUDRndVhlMU9NZnpsK21aYzE5UFozV3llVWM3WDhMN3lY?=
 =?utf-8?B?QVJQOTZ3cVQzQkQ2clhoVVIrNStWVENER253NmQ3QXQzYUZUb3VmY05nMmpm?=
 =?utf-8?B?c0FsT2NxS0JDSHVIanU1MFJQa1JZbnZFR1ppQWRiTEQ1MFVWT0diN1BYU2dy?=
 =?utf-8?B?RHZhcDZuUG1oYXdUWWNpOVJtRHoydTBkY3U0dWhiT051elpiNHFUYWp2VDBv?=
 =?utf-8?B?bkZEMmdDcWZXNFV1QlNaTkZGOW1hVjQ4eHdtRUdrV2d0bEtrankyekJvN3Vk?=
 =?utf-8?B?QVRVUUorSDJIV3lkTkRJWWQvU0VHdURLNVRralcweDhMRWdDaThXYW5vSzFM?=
 =?utf-8?B?L1ZGaVdFNG1CQitqZXJabm5aRkFmMk0vbHFHUVpIc2hLa1dZMjE5anJkVmZt?=
 =?utf-8?B?Z251TTVQN0ZtaVpsN3RITEJsTHB5Wm02dnU3RUV6L28rSTJRekZuUzZhbXpr?=
 =?utf-8?B?RGRYbHplSzN0UXNIR1pWKzl6MEhTQ1lkQXF1aGJWY2g1blZqZG1zY2Y0azlJ?=
 =?utf-8?B?RVRESWxGelJ2K05SeTVxQ0liUmNvUnlEdDU5TU95RjVHZ0NqUlMrRlpzMkgx?=
 =?utf-8?B?YVVLSzh6WnVjVS96ZU01RG9YUWRZSUt0dC9JY1NHc0hHd1BLanEyQllvR3VG?=
 =?utf-8?B?TG5Sa0M5L3pSRjdDOFl1d1J1UDRoTlVQQ0h4UkxTazlKenNBcFBrREtTS1F3?=
 =?utf-8?B?WG5vQWRGVi9Qa3BhaWtIbkQvU3V4VXhZenVtbEFxd3lnWXVFY3JQcDhJdTli?=
 =?utf-8?B?Qjhrc2FMejlmWTZwUmVKTmFnYUZ6eUNtRXFIZzU4TERaR21aMTEyUXMrUm1Z?=
 =?utf-8?B?Rm4rQnBJUEF3R2ZTdFp1UVl3dklpMDRlNHpKNjNacVMweDRINDZneTRWY2lr?=
 =?utf-8?B?UTFVOHZ1ZjNMMEpiSmZTaFY4SXlPOHFCWnNVbnFzU0pBQzEyODQ3OWVGNXIr?=
 =?utf-8?B?aDNaejFIVi9RNlNiM0ZiaklsS1BKZGNhVThoYTJzcXQxeTJCZ1AzZVFObU9w?=
 =?utf-8?B?WXhZLzUzYlZwNStNekEvaTF1b3IrWkY2bHBFd2dTM2RIdjl2UTl4eWsrN3F4?=
 =?utf-8?B?a0pQL3hDdllCMjlyUjJrK0xLaFJpSlorTmtCc090aGszVzBZZjRFY2dUT0VX?=
 =?utf-8?B?dVMrc1VuVjA0V1EzZGVoMmdsQ0pQTTNrYzJWVGxVWDd2Y1d1SXIxSFF5ZEgw?=
 =?utf-8?B?ZlJ0R3BacGJQUVdHakhzeGNDbVcrVThHdlpPbFFyKzFJanJLeXdNdHVQYkZj?=
 =?utf-8?B?V1ZGSzB6cHRRVFJyd1FuVytWZXVKbzFVblMzTTdDNXl3UTFWbW0vRThoUVJU?=
 =?utf-8?B?bUNJN0tVQklYMTFpZGNNczFXbC9XMy90RkNCNThnS2hNTVplMzgwZ29nSGpl?=
 =?utf-8?B?MXpidmg3ODFOdis2bW45RW03YytqbDd3bU9BYkk4VWtKL3AzSFNqV2c2d2xh?=
 =?utf-8?B?Wi9VamNPa0lhTW9CZ0NteWllbW5mR05MS1lEbzlEWXVTK1dINzBFYzZsNU9L?=
 =?utf-8?B?VHUzVnhPTWIvTXcxR2s2WWxYZEdpVzZ4eGlEVkllUGxDQVNCUjIzTUZhNW8v?=
 =?utf-8?B?SHBoRHBvdVpvVzlDNGtUam5PVmkrR3RIVnlkUXlWMTJES1JYaWJ5ZHVlOXo2?=
 =?utf-8?B?UU1OMkFBbDNQQWh5UWJCTHpXV2pMOGZuNzRNb1JGNENUMW45UjkvTVVFVTlZ?=
 =?utf-8?B?Nk5JMFAxNkRqTW52MjdRaHZIdHVaRW5GcTh3SnBiRnA0NzMxUHMzZHM2eXdE?=
 =?utf-8?B?NWwyV1ROYUNxOGU0N3NFeVVsNHptTWJQbFFHVDQ4dmloSnljM1RkTjhTbmc2?=
 =?utf-8?B?NzUxWm1mU29mdWliTndnejdrV1ZnazdJbUtQK3F1bUdGNWttbStobnQ3eVFZ?=
 =?utf-8?B?eGMwam5zU05idGJ4RjZPMnVIVGZ3UFArbzNxZzVmeXV6K0EvK0s5NjJUMmNE?=
 =?utf-8?B?aTNDelZIZXlITGNvUXpQMXN6djN3Rk1WMkJEUHhvSGE3RWZNZDFNakdHeUhR?=
 =?utf-8?B?cHpKNGdTcjRwWm0yT1R6cEJ1MWF1L1pSbnliVVY4NHBmY0w1VG5GVDJmYVBN?=
 =?utf-8?B?azNqMDlnT1BpcVJ6SnFSMldCVlNKbW01NzltRFY4b1Q5LzZZVzllMTltWFpH?=
 =?utf-8?Q?3HmE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTdCdDl0RGhnT2ZVbzZYcFFUZWo0Zk15Z3hsMVkxK0FqUFVtSjB6MjNCdVR1?=
 =?utf-8?B?bS9oV3UwZTVHeG1tNmxPRVF3aVRoMmk5MW5LYi9PdXRwUnA5bWwwY1VueWV5?=
 =?utf-8?B?VnFZanc1OTVHRzFWbjRvSDBQMS9rS2xjaTFTVzhRT0J1Uk9iR3k3Wlc0azhL?=
 =?utf-8?B?VUgybFdEL1VyTVNscGwxUUMzcndZakd2VkdNQmpRYlkyVkszbEw2dWxuTDZ2?=
 =?utf-8?B?akpGL0YxeVRwZnhrdjNnYzVSUi9VZzRQSXl0d0hBS3J2RVBpcVNRTUhNNU50?=
 =?utf-8?B?alRuNE5MM21MMjVJbnJVN2pUZjlFYWZyLzIxWEdyUVVaNmd3THExVGxSYjJN?=
 =?utf-8?B?aFJlOWVaZGtOc0tBL3JTKzJtRUE3SHE1VGZpMzhwM1M2a0kxTTUwZk8xMDB4?=
 =?utf-8?B?MFZtTVpKcHJtSmdYZUh1RTFyUHJ0RzNPR00vKzdHeFh5RFN1dzJGNHluVE9S?=
 =?utf-8?B?VG94VUpUbnh6UEduR24zVzEvcWZqcC8zSW5qaFVReGVJTmhVTVpNcjloTThT?=
 =?utf-8?B?MnlXNFVLL2tOS2EyQTNoN1RDdXBDT0xSM0Z5aXBMVEZFV0xKUkhCVUhPSGE2?=
 =?utf-8?B?c2paWnlRWjRmdWZrQ1N0QXh0ekFabnpYWjlLdGZkbEhha0tnWnpOdDlHeFBs?=
 =?utf-8?B?QkppY3JKRkNiUEkrU3hUby9rNlJPK3piVDZGdkVaa2FXSE9VdVhCQ2FCMEdO?=
 =?utf-8?B?M1NnMTdXK2FpandEd1J5bVJuWjFRamlycTE5VFM0ck14MWZDaUZzQXVMTW1J?=
 =?utf-8?B?VlAwL2RIZnhhbzVFKzBQVmZoVDMra0N5cUJ4cFZRdkFFVzN0SWVGVTk5OU5y?=
 =?utf-8?B?QTZUVWxOQUZncnJBbkU0cTVveSt3VE00eVgvaThoK3k1ck51UUpoWUEvMFYx?=
 =?utf-8?B?THVXS0FRSW1obXNOVjhaQjVlTS9RdUVyS2Y1Sk9KOWRtSEpNZzZ0dEpJaHU0?=
 =?utf-8?B?aUgwWlQ2QW5kNFpNT3NDZGphNjFhWStYMXlmaDBvNkU5U1pYTG1aSU9mWFZ6?=
 =?utf-8?B?UW15aUp5Q25kZk53bVBYbDFSdXhkMTAvUE90TWt2WHljSFdHSVVFNE85czRi?=
 =?utf-8?B?REhIV3NZSDhVSUFOTWh0d1VpeWJYTFJqYVdNVE5uMXhLcmdyUjlVNTFPYWdL?=
 =?utf-8?B?Vm02TnpuQzMrSjFqUHQ2YkFMcFdCcU9SVDZoUjkrcDV2eGg2VW9FMUpYNWlq?=
 =?utf-8?B?TCtEQXZzdnVHYXlyZnl4Uk50NFZQcjZlOGdWRG9tV3A5dnZHRmZDS0RVOGdZ?=
 =?utf-8?B?THRhMm52RVkxZ0RIZ1poNUFoRzZ5WW0vc3prVDFWdVlKQVZRdU9SdnBIcDFQ?=
 =?utf-8?B?OEdGV2VXd3VDVGd2V04rV0QxRytkSC91TlVZZ1p5WGFLdEM3RUJmME1URHY4?=
 =?utf-8?B?dlQzdVVkdU8yaDFNanprVnJ5bS9DMU9iOUhUcUFlQkVkZHgySmlCRHJScEll?=
 =?utf-8?B?OThhd3cwaVF0aGkzVEEwTytKNTRMSUlxVjZzREcxcUhBZ05YM0gvNzhHRVcr?=
 =?utf-8?B?NzRmU2JlYUg5YlhIYWVReDQ2SGhTcFBZd21kSUVIMC9vT3NsQVovUi9nUVN1?=
 =?utf-8?B?Sy9hZDdtVDRtZUhoSVFFUUR6cnVwdjJQUjhRRnNPM01hWjA0clk1alY1TW51?=
 =?utf-8?B?OFhJMEVIc1lTMzhLMzlvOUZPdWc5MVJtYjE0OHZPUVlXSHh2akthbldUdXJ5?=
 =?utf-8?B?ck80bzR5cGdKZ3VVM3g4NHgyU1puWE9qd2I2ekFCVlBPbmtHOFNRclk3a25E?=
 =?utf-8?B?V2dHT2ROMXBESG9KN0ErbjlTU2tvQ0NRYXc5VHdMTU1Cd1BubEZuSDNNemg5?=
 =?utf-8?B?ZWJaK0E5VHlFMlRlS3Jua0tWbUM3bUZXZWtTVEZ5TjU0bkcvQ2FyeWU2YWRB?=
 =?utf-8?B?eS9mUmhKUHQ0RDVITmMrcC81UXFub3puU0lWRFVMSUExUy9yeVJiWHJSeHYw?=
 =?utf-8?B?WldEWGpOSWIvS0p1RUhQQW5McWVIcUtPNjc0Z0FSYVBtb0N1QXZaMlROdGR4?=
 =?utf-8?B?dFVtcU81SjNUVEk2MXMrRXNFRC8xRjQ5WEJrV3ZSSFAxWVo5WjExYXNWYXFs?=
 =?utf-8?B?a1pjODFmeHNNMXhkRGdJeHNXOTlqSlVoTExyMVhLRkdhRTE4ZFYvRDQvbXRk?=
 =?utf-8?B?akhqRUpDbWNFS3RVQVJ3MUdhTHpsWkdaZWNuYkhYS1JhY3lldlowbXc1TWlU?=
 =?utf-8?B?cjkydXg5N1hDZjdLcC9aaWdOZ0QzTDVPdm9GVkQzcU1RaTlLSXNCSXFpODFO?=
 =?utf-8?B?U0ZrUE9DekFkVC9lODN0ZURMZmdLdWxZd0ZQcWFOVUpHYityeGQ2d1Bhd2tJ?=
 =?utf-8?B?cnBGa3hmUUFWZEtxalRnSE1PTjJuTVRNMmk0RUlWNTcyRnd3eTN0bzVOdDJw?=
 =?utf-8?Q?HbEWe/KDUyBz8mZOanDkw7Hcl4zSZZpGlIoLYe4k5xs7t?=
X-MS-Exchange-AntiSpam-MessageData-1: aNlLvJv6L6QLCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32285ee1-d645-4118-971a-08de5f0d32e3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:05:42.7950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tJmv8iNh8eu13ZX2svQ81zK8sHzKBXfI5rdbWCrGZ3nmNL5hUvfgGhtsoncExvVIHclFWUsshHlDFXAlFLzGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216

On Thu Jan 29, 2026 at 12:43 AM JST, Gary Guo wrote:
> On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
>> This is useful to access the inner value in const contexts.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/num/bounded.rs | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
>> index b41ca6df1525..850827033f67 100644
>> --- a/rust/kernel/num/bounded.rs
>> +++ b/rust/kernel/num/bounded.rs
>> @@ -388,6 +388,22 @@ pub fn get(self) -> T {
>>          *self.deref()
>>      }
>> =20
>> +    /// Returns the wrapped value as the backing type.
>> +    ///
>> +    /// This is a const-friendly variant of [`Self::get`] that can be u=
sed in const contexts.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::Bounded;
>> +    ///
>> +    /// const V: u32 =3D Bounded::<u32, 4>::new::<7>().into_inner();
>> +    /// assert_eq!(V, 7u32);
>> +    /// ```
>> +    pub const fn into_inner(self) -> T {
>> +        self.0
>> +    }
>
> This is... just `get`.
>
> You can implement it (with the `fits_with_in` check) in the same manner a=
s the
> const new.

But unfortunately doing so also prevents `get` from being called from
generic code, which is a must-have. Or am I misunderstanding your
suggestion?
