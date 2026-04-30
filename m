Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A817D6;
	Thu, 30 Apr 2026 01:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777513359; cv=fail; b=WO5IPWBa+La0GQHeZtE0i8a2CYgSA5wD/46Blq7byflH2FGWY3N7DFqq5fRmYGvJp8u5/6XQFh+frmSJjNFPXYGOR7ikWdCSqZ8XnxuK5GHXyWxRu9CXihoPpA6d+SmYzhBYmk1pmNz7PkI/liX/wxzxubpV7C56Q2hGIIkJ++A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777513359; c=relaxed/simple;
	bh=WYRlW4ogoQym3tbz2WGGJ1en2JyrSt2unrHayddic50=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=L26Hn/hrzgp8MXHS1UVGveSnnSRqzYCmCtjY0UpUJNYyvj9a4ezYrQbCfSKdw4Ot13F1EEUKbCQWl78+tiwL1a9SCEumq6zbhXElJxqaDxHRrpfXICOnh9wNTfdTWzc4OyNYQpVgAcf4ly+29udhvpjT99bSg1IaR9H4PyguWqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ax9xNB+b; arc=fail smtp.client-ip=40.93.195.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ax9xNB+b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=td+8e+q0I747ECEqR2OD7P6RKAj5RXo3vsxcXi897vvn5W0+orvu4ikHtqqlAqcQA7yahmxuC8wE1rg87H2mHF32O5Mo2Hk6X4wepHtkk7usyzdXPa9JAArhRfJbJ/MiVnBTrB9aWfXBTg6Xw6hdfqYdVzPM6Lu42MblbJaaMl12vS1j1zPQYEhi0Blpr84g8JRtVVF2YKn+d0WXG3r+RKrmxhqZjISFZ1wh9C0Tqehdu43/fgrdjidopErcNUX5p7k5YCTsDb0ZUqbAx0Yp1o8oim6dDp90BO51HSVzxYxJxevSFpQtituGgzcxZ8fwSeQeeSmXxcqqXZFrIjbNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYRlW4ogoQym3tbz2WGGJ1en2JyrSt2unrHayddic50=;
 b=bLG/wLOAk7Qnn+R9mDxFt5hXXXX6hnRkBzc/FdcygVG5ppeMJ6z6SGHLr1GVJXuUqtZDDuc7aDdHmeSY1fVecwZ5AMuC/xkgVsskbaG78NYghuCnpU47mHrKEhxP/cyAtr9GmZ9BxcLIAf2uclTJIgED/k56nLrXWwqtufcZse26p2MAwlzemWzgqMxdW7RiILw96aOHu8CqJzx1Dz8ASvRIdzbXaKoMa2jp2gXEme8dyamSX2+V9iGat72IErHcCxK7QVnWSpIIrwQ4caolBHiL1xc+KVdDaaHHXu/YGRRJ0ps9EkvGV+kRpBExC4naWLSAA1oHpqhlG4aeykNYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYRlW4ogoQym3tbz2WGGJ1en2JyrSt2unrHayddic50=;
 b=ax9xNB+bEXFJSgrJDWv/yvcjokOzFBxkSO1q5MIcp+vGpGHCItPP1uP//u4KzqWVCn5DyzGNn5aKLNYlZu+wEfEl4vozHj9C/+sMZ3kKsol7zRad9/6O2h3YMcBDkQEI1wJa7bp44yZUsCy4sQsZBdCsWyeTgYnJfryik76oY942oZX/ohVTQ/oaIkVFNvnPpBgIMQJIxPnF519dZfAc9XktpU3Hdv4KpcY9oK1hXoBerTCHMIWC8It5kG4yJIPlYJpppsPkg+jtPmhojaZE0VPyGzfd0b08xd9101jmGWL0m6O2yp/vU4Gq5w84UNGmUIDNy10hc2MCILx215Nn+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 01:42:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 01:42:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 10:42:30 +0900
Message-Id: <DI63W897LC81.20VICFB5PKPV@nvidia.com>
Subject: Re: [PATCH v9 26/31] gpu: nova-core: make WPR heap sizing fallible
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-27-jhubbard@nvidia.com>
 <DHNECWUPID7S.3C46WAVH8ESA3@nvidia.com>
In-Reply-To: <DHNECWUPID7S.3C46WAVH8ESA3@nvidia.com>
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: c133c59c-0aa4-435e-71e2-08dea659c05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y8icuj2sqNyhkgxoyRCsCBohHjF9zF9GFLb/NtsmQUE7oSEqEtbLo1t8J3aLZHtBThLosHTqmRSyBis6dDcYVO3tHnHOL3m20uwVe373o0ZkSW8ffXs2NNM3k2EUB8bQ1i9Z7+c/ypYeF172MKJEbuAhIdJ1b2ljLa0q2sOk+Y5/POYk6+lcIZVLgEprmQSUgOq9Tjk1p8przasGc0y+uA5fZ4iaJl4xqI7UpLh4bYCgndG8VjVPhxm4RhfLtIgRpEGpxC0OI61bEsS3WLO+ZvSJvwdNw9QYXmTGt4gsqFMSN8vPIbgAo2jlFlq3icTCIm9gB2V2N6h6F77Q4TcuDE+ZvQJaIVCOxTT24nADaTdcIvP0eog89R1xjQieJAYu3WLP65cqmeNLd0g6ei6EEyDOABXAQDIFSYANhJCEawDEQlp0/A/qUUp42WjNCliCeK0qzoKt53Exc/TseeIHIPfeaIoSPulMW5K2BAcZyTkvw2JvPulqIPDmGRXQ52RsPX9IouLxUO4qwzJHePPlKZ2dKXzV76LWlL68Rp7403PPd4sEf7bsZ6Ho5Iq3O/thaWr8ndo8zFv6pZzEBdGfY1iZfjKxeHT3KII0F/kJLgMsOmVkEwDVDdyUh3/ofgnHZ00BuXUDH8iUygTzt4Whmp6BSzbLfQrkrzWv8zJALZQN2MiraUgk/FoMcL0CfkPxsx9nAzGUTW37UGSU4mW7dT4/4bh5RTlVs6q01iyLX7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUNFRnR2cFQ0RU9RZ2h3Q0ltekh2K1ByUGlwTVBScy9ZOWE5YW1nVUp6MldO?=
 =?utf-8?B?UlppeFdncUdsN1NEdE1Ia0thNjRiL3gyS2daSnd3T0lrVUxsSzRYOXNieDdH?=
 =?utf-8?B?d1FOYTYyZTlUSjVwZkVUbHFIdUJwTTMwalZLMzZKbmNGVjVVb0tRMEZHdlUz?=
 =?utf-8?B?eVR6N3VkQ3NTOFROU1g4UGQ4WWIrcFlCcjA1RkdXcFZxOU1VTVhNRkplK1FC?=
 =?utf-8?B?Q2NMR0ZYb3ByTWFLMnY1RFBqTkZQV1hZdzBRUllVcG9TUGRmOU1KdVZYSExP?=
 =?utf-8?B?YU40dlZkTXFiaHFQTmJwUm8yR2pKMC9JRXJ1QlpINWhlU0V0NlY5YXdITXNY?=
 =?utf-8?B?a2dBTERZU1czQlBXYUFPSnNjVVE5aElwbDNVak1Sc056TjB3andUNWs2VWpM?=
 =?utf-8?B?d2hLQk96bHJRaFFkZEdKUmd4ME9FQk9FdnJsTTQxWlpuM1VlczhySDNhOVVZ?=
 =?utf-8?B?ZWhFcnJDSVgxMndUbG8rRzFuekxnQlZsK1Z5b3FIemJkMWdoZ3I3ZDJTbm1K?=
 =?utf-8?B?ZmdzNW5tVitLN0xBZ0MzNzlhc3F5ZUhVUzh1dCtqSXVraWJyY05aM0RyRk5o?=
 =?utf-8?B?UkRvMDcyQ2VaQ3hPSkp0Mkw5OWI2UHZwbkV0Y0pVbU95SVF1Nmc2ckRER2JI?=
 =?utf-8?B?YmVzaXR1ejYxYkZlV1JlbGJIQU92c254WDNGZG1YWUpsemo5MmpNTkVqMnBt?=
 =?utf-8?B?QVpVdVZLUXdnZ0Iyd0JnMEI5TUJkMk9RVS9qVy9vdVZ6WXJ3Z1FWNk1wWDk3?=
 =?utf-8?B?QnlvVXViSGJIQjl6RFdtNGJuckFtZGYxNlUvTGFiMVJDVVFmS05UYkN1Uk1s?=
 =?utf-8?B?N3o2VkRlMUlyUUZLT0VuUEdUVEx1Y1YxV3hETWlMUjVjYXdnWDdUUEJDVVB5?=
 =?utf-8?B?OXYxWFhTVStqYlJHcmNIV3NkV1l0UEhiWDEwNFhOMUFVUW5vQnlVSUFZOEw2?=
 =?utf-8?B?UDdBSm9JVWYyYlphUS95N2x0OTREVkNnNml4ZHBkbGRIMThOOWVYUVFkeGRn?=
 =?utf-8?B?VFRXUGdUZ0o5QWxGaklXMDdMY2lSTHY5UWhFSXRvdG9UbzBqSjF2Y1hKN25y?=
 =?utf-8?B?RzRHK2pQV0k4NXQ4c2JWa3lxdVJFRlcySWZlN0UwbHJBOGYxNDZkdnlMcnhT?=
 =?utf-8?B?ay9WTTBtTWY2dDRETjY1SzZZd3NGcmhLVGp0WkZPUmhGZ3Fsd2gvejNqNEJK?=
 =?utf-8?B?TUxFV1g5d29oaUI4UHdVaG92TlIweGdJcm52ZlpUQ0M2YU9XRFZMMjQvTVQx?=
 =?utf-8?B?UEZCL2J2K0ZMNDFWb3pzaXhjalBjZFRkcGFNOTMrODRZSXJrTlhacWJXREdT?=
 =?utf-8?B?RFpqS2VHTXdhdVZ1OFF1N3NJcEorbW5yVzNOVWZJTm9jc3R6dHhDam15OGRJ?=
 =?utf-8?B?Wjl4N2tuN243RjNwU3lpRzBtbSticFRycWVod1BIMnpHUk5rOTFxODROcE9N?=
 =?utf-8?B?bmlnSkJ1UnVOcDhUbHBiRGhPeUUxQ09LNGM5QzhmdVJpUlovSWZQSk5mSDlF?=
 =?utf-8?B?Ni83dzdVTG96dTF3U3JUSXZRVEk5RVRmT0I3ajFOZGg1UXZkNW9CUm5qcXRN?=
 =?utf-8?B?UHB0dG5ZenVoS1h4YVRlNnF5ZEZnNmZrbDF4Z2hjK2ZXQ0hncmpDcFlJb09G?=
 =?utf-8?B?UUpSSFlYNmJaNmxsYVU5MjFnOUJONjNseThqYVlzSkUwaUJRbEtVOFN5MVBa?=
 =?utf-8?B?QkRUM1pxeDFNa2djUkpqM2JjZTM1alRpS3FjenBhNGQ0VncvQUw3WllKak1l?=
 =?utf-8?B?eGJzWEE4SFI4QTlSc1JibUZUMHNqOVhiN25BMU9TZ1YrcXMwN1ZEa2VSVTJl?=
 =?utf-8?B?U2dwbTVjYkMxMWFxZUZBb05rMlBZS2JMWmE0NjZlVVV3cHl6Yjh4Syt0UTRK?=
 =?utf-8?B?eW93bThrR1BGV0hoc0FZdGcxSENyRjUwT3hMd295THkrdVlBbFJRRXR4d3V1?=
 =?utf-8?B?Um84WUtnbkhPSjNXWHNJTGJhNkVxYzhaL1p6amFkekk3NlJBM2hrWmthM2M5?=
 =?utf-8?B?Ris4alAremZFM3NCWGRRNGZSSDhDVDFCMSt3YlJLWTdrS3VIQTNpR2R6R3c4?=
 =?utf-8?B?OWlQVStVbmNRK1hpV1ZPZkRwZmF1NDE4OEtGMEVvTTVxTGhUdWVBQ3NHc2tV?=
 =?utf-8?B?Sm5DdzlqNW9ORGJ1U081T2ZxZDFNVjFyNHUwL2kwQXFrcHZwNVI0dmhBb2VQ?=
 =?utf-8?B?OCs1QVoyYVo4WUdsYjcwT3Y2MnllQnZpTmQvVit6SVpQS3F1TWFjZnJoUVFO?=
 =?utf-8?B?TGRKMXpnbGZVOWwzRElkYWh5cUVWLzV3b29BelVEay9JRThHMlNvc04va1k4?=
 =?utf-8?B?M2RUV1FzRFBHS0NKK1JmUGNadHNxWTdSOUZLeHJHQmVjTGFKR0x0blVpUjRj?=
 =?utf-8?Q?aDrv3e5xXQZL/cpVM1xkRLw56JnPy+PP8kBJTeuNY4yEz?=
X-MS-Exchange-AntiSpam-MessageData-1: WhgTI/NE+F4j6Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c133c59c-0aa4-435e-71e2-08dea659c05b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 01:42:34.4228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tbt9qhtwLxJrliNif5Q/SFlyQbwRvG6n/V0MmmxZlhpBTtEg1O8S/9i4Edy7OLPOggBeY+7ApC8RNYKqypkB9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407

On Wed Apr 8, 2026 at 10:53 AM JST, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>> Make management_overhead() fail on multiplication or alignment
>> overflow instead of silently saturating. Propagate that failure through
>> wpr_heap_size() and the framebuffer layout code that consumes it.
>>
>> This is not Blackwell-specific, so keep it separate from the larger WPR2
>> heap change that follows.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> This looks completely independent from the series. Staging it for
> merging when drm-rust-next reopens as this is clearly correct.

Pushed into drm-rust-next, thanks!
