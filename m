Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909581A9F8D;
	Mon,  9 Feb 2026 02:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770603278; cv=fail; b=E84Hro5rjTEWSV4lU7Q+nCdUtVmxiUoWnq91yety/qPlCP3cWAvw7Q0oari9zWm7S5GaoV/+E0oa1wldBTmywCrP8wX4dvvfdZcIPHU++BQMKNBaXPKtlYgnIRWrohxS5wiXz6RKjjW8wroAcZYyjX4anQBg+RpNrDSCUsdLsNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770603278; c=relaxed/simple;
	bh=0FOVc3LR2jtIxJs+1UzBGs6ce1Ek7tYWmI6LzpR0R9A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JLtvH8256duZBmbCCYCfinyOsCEJomPvG0n66oUgHMHqJkHDX0+bvnOX6ZY/ysnVnOSmVSR9AKjcS8j0A7I7YZv3+4MQMNvGUnq1vekw6DJmXtxxQi0/kPLTwUQOCU7BRrokBYp2z5u3FDhHoSIPo4kWheIvMK+8qH9nAvgpvOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cGB4La6P; arc=fail smtp.client-ip=52.101.46.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cGB4La6P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgysZ9HefdmJoalD+5pn5iXoxEghdDecL1HNCuJBmTw2JiZtl0BpKmjW9MZixGu+yQEG4JU7/he0oY6iSlUSy0f4sMwfmFrhNjSlu4P8wcemAK1E12t0SzklUEv5jyp3J1WlATwLHqGin5elq/nnd8KQv22k2VvjWIwCfXlCEqIpqkdLf5q3J8+16HF/NbyAE9iZeLDD1XSUJl3/7j6z73YR8NkTX/u43DgGlwpncfG3DYAn3Oq73RfVaTI+BW7FEQU/skJgwokh7deOG3nLDasd5+QiqzUyGkZIThft82FAiMfhtrFlEwLa1EiiF9MqMIq4tQqyfUAAXPnWYAHxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+Ame5PgmP+BX3xVqKtN2yGM4vrv/ehk9Kg5AQbvoK8=;
 b=x7XWzQ1YEUHgrlsoigD9UwdD1iDSVo+zwSUFP7R73KIuyhNDj9+nkO/yoD00fxNNj/JO1U4s2GpAxY+6M4ZxXcIY6/RGUveQrt6f0ryAx5HV4u8tC2eZKbS8zucUtSskF9zuFqm7S+3akUme9v3wHCRzi9p4ESSk0JsavibZ7lawIVYWcD/80gUAWA7vbrvDRXwFMJ8myq1i4cxabDlivJdB7A9+boEWpxD7bX8AK/pWhaXcn5GSM+sYCVsbmJriNkT4/cEN1T0Z6J3PgQPSzrezj56ro9unxiIupgJGEhGPsIIU8BvjR2J9EPFTQmTvYNhuup1knRSF76UCBvaQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+Ame5PgmP+BX3xVqKtN2yGM4vrv/ehk9Kg5AQbvoK8=;
 b=cGB4La6PsvWC9EGS4nqI7tA6UPBpYz4vgLoA+crWJnR3aTuxbH6/OKVExAqOrXIkWjXWHzWbKtpeLq23HWAc4XHY/lMBUDuZSUBnEdyzuuwZRKBkKdABaYx0lKNkkMH69CN0HrYRyagF6PxgsFsHctciWi7Y0xEHolroDyUkacnpWVKeLycs+XmrmY8o7puoBfA2koUhQ65njb69OMvEcnDfzR7VfCsyJhr7uIqKp2vVFetKuMgcW7rIg/Pi2G+ma99YA3AQ7Mym8XIALxOtncC/AjzuoLyG9PjkK6bEMAIRpXAPrkKJLjFEiL+IaY8fbAMibuvRevU732TaV0JgfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 02:14:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 02:14:34 +0000
Message-ID: <bbfaf5b0-6e10-469c-8a01-9575ccfcd8dd@nvidia.com>
Date: Sun, 8 Feb 2026 18:14:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/30] gpu: nova-core: clarify the GPU firmware boot
 steps
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
 <20260206042123.303281-31-jhubbard@nvidia.com>
 <46121c46bb52e7f8578367232b772f234f20be86.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <46121c46bb52e7f8578367232b772f234f20be86.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:a03:54::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cce3a9b-1852-441d-b38e-08de6780f804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG5DT01FSUpLNi9TalpnRW9NREgycjU3UENDVGNZd3hWUGhEdjRoWVVHclNp?=
 =?utf-8?B?TytiRllIcmJENURJbWNqam5WSkNNY2t1RFRONTRudmlvNDJybG5udEdERzIr?=
 =?utf-8?B?WmN2ZlpOa1Z6OFVZaUEwWmdXWm9XSTZwUSsvcVliUVN4a3o2ZjgrcGVKSnFE?=
 =?utf-8?B?SkFOSzRUaExqNmV4czQ1Q0ZIeVptendwbDIrZ2p5MFhtRnM3NWFYWVJiNHZQ?=
 =?utf-8?B?V3RZYXNaL1NHeXJ4S044OTZDUDJpanZtNFNUMU1aZUt0VHVpQ0kwakNlbnc5?=
 =?utf-8?B?bkxnWnBwZTc5aytUcXlaZHdRWDBmUHVPTGlsVERYR1hXNzU4VkUrQTlydFNR?=
 =?utf-8?B?ZURIUndFaFFpdVRpNHhEMTR1OFdzaVgzNFZNQ1lmWkJ2K3I5aUgxRFRFaXZn?=
 =?utf-8?B?bnVLS25Bc09QM3hKRmNac2JEWnJUbmlOaGZYeDZ0OEhSUnNRaWJpSCt5bVNE?=
 =?utf-8?B?d0h0cWFITmtFdGdqTEptSzBTTEt2WGorLy9iRFNhb2FtZWk2L1c3ZHgrOUlV?=
 =?utf-8?B?QlEvb2ZEY3lqbHZybXJDSitsYmV4SUFRdWZHNmFqS1orckQrY0xoU0t6YUU2?=
 =?utf-8?B?WFVVMkNKeEcwa1lBNjhOYzJBQnEySXVPa3B2UTYwRkM3cmwyZFowZFdBQmZK?=
 =?utf-8?B?WDRhZE9TakZjUE5sUHdKamlubElpelRxNjdzS3lDS3lVelQ4MFFDakRCY2FD?=
 =?utf-8?B?dFFMOU5pbTdEVzcxZlN6b2ZrSHRhaHp5RElka3Q4YzAxWmk4cmNodEhPaFNE?=
 =?utf-8?B?dmVJcjRzQkxGbVlnYW1NTFYwSWpFTTJiVVJVOERhdXNjTmkzN1ZTSlBtR2F3?=
 =?utf-8?B?RWRIeXR1MjUrNEFRSDQvb2k3UjRYVWpIelVsRngrZGRBMnZhNkZSUENjQUZR?=
 =?utf-8?B?YkJGb2NlZmI5VXJXbllndThXTFRpZUlDL1NnbktoRlp5RTN0SHhvaFBRc09z?=
 =?utf-8?B?SGt3V0p6U0FCa3Fqb3NFdE1wcjdnL1hIQVF3RWVvOGl1T3ZrZGhiWlhLZUE0?=
 =?utf-8?B?TlYzT0NxWUZHU0ovL2JBajFwZWlpZ3c4Snh6MzljVEZ2SDJuQTYyR3BhR1BQ?=
 =?utf-8?B?YktveUtOMllGZHpFeFJPWG9HclRGaUltbHlNRXNoZ2gxenNpSWgvMkRaRGxP?=
 =?utf-8?B?ZWZSVkFEUkkrN0tqbW5rUXZGL3hMdjZHZEc1UzB2K1RMemdkaFVxNHVWcTJH?=
 =?utf-8?B?NUk1RENxTWpSbHU5QU5mODlkT0RjazV1UWlMait1ZFpmTWpmYUxCTVgzc3FH?=
 =?utf-8?B?SVIxbDJ1TEl2aU1rVlBLY0M4cHRJbEJ4NlEvZGQ5Wk8xNlpzYXdORVVTMjNT?=
 =?utf-8?B?YW5lNklneXYwY1RLTFZZYUlpMlZwQ0tQZHNmUG9YNGZBS0dqY2pkOGpWUTVP?=
 =?utf-8?B?ZFo5YjFLclV6U1BOYmNRWHQ4cXptZ1U1OVJDbWN4UitON2xjVjdpeWZ6LzZ4?=
 =?utf-8?B?MnRLMlFxcm1SRlNrTG42Qmh4R2tFdkpDUXVvaVhZaWtDRElFZlZpQThHU1B6?=
 =?utf-8?B?Y2R6dGRVcDJpSml0ZzRDOTNTNlp6NlN6Mk5sZEZuUDllemhISmptSnlXTVdo?=
 =?utf-8?B?Rm9PSHpMVFJFRjVnU21ycVluSzMyaDhsUVg0T3hJSnJKNSt0UkVCdGNNRWxR?=
 =?utf-8?B?YWJESGNvamFXdDQxUXRicjFSTkxtREZMbFlFR3BNVkNja3FLc0xCbERGYmQy?=
 =?utf-8?B?QU5GQ0VMbDlXSnFwN0xkdlZERnJXek1nNm5PZWxCSlh6Y3hFUVpQQXZuVjdD?=
 =?utf-8?B?cm4rV2JoWG1WRk1SSzExSWJmaFNacHp4NTVmMWJJaWhtNHJnRlV1R1VvMU4v?=
 =?utf-8?B?b2FGQnNnMll0MTFXMkY0ZzdoeE1sTVpNQi9wYjVSUy96YktvOXBIZkVGYUZn?=
 =?utf-8?B?UDBxY2JOdDIzc29nSlI0Y0xCeHdSeVJ3TGVTU3BHOHZIR0F3MnM1bERqVWdj?=
 =?utf-8?B?bkhWbFZ2Z2pyT1pJOHN5OXJOWVBqaDJLanlGUjVLdTlsSmRKVjd4a1o0a1gr?=
 =?utf-8?B?RmlQbUExVktoa0h6MEprM0Fhc0RXZmxDQ1JSTkxkbyszNDNXeSsyZ2p5bFdW?=
 =?utf-8?B?NUYzdWdhVWhnazZJSDhDU0tpcGV5aGNZYUhvb3pCaTRHY3lxcVpvS0ZmN25T?=
 =?utf-8?Q?9Dss=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmZicmU3MTVHbWptaEFaM0tkdVd0cklFZWFBOUhQN3BvRzdJWnJjZlNPRmFu?=
 =?utf-8?B?VlJPeGU3UXAvdUdOMXJBZ1V0RTJUUllQQnNPTUxMWHJEQmc4RW14MWR0UFJB?=
 =?utf-8?B?cy8rRHNCUVEwOVYxTFRBL0hWUDBNMkgyMkRSVTdUNDFLd1craXF0Wlpva1Fk?=
 =?utf-8?B?TUp2QnNVNTYzb0RndnRyQVNtMWo5eWd6b0g2SFBxK0V3WUlSK0QwY3loZ0RE?=
 =?utf-8?B?eFFJcDlwdWFkQkdDQkdUcE5TK2VNTzBOVCs5UGVzVVJ5QTZJVFkrL2pMVU44?=
 =?utf-8?B?d2lpZVhsQzUxK29uNWYrODVadU5wMWtTTlN0Z2VtUTU1TjdNT0ZEUHl5OTc4?=
 =?utf-8?B?R0l1bkNaYVBqRnFzeFRIMnFjc1dGWkNUSEFKMjlIK1Y0aThoNDkwb0xLYnJC?=
 =?utf-8?B?M0MxSXFQcHc0Umt1U0RaQUtscFhDTkhjaklzdXJFLzdlaVpZblF4aWxOWEV0?=
 =?utf-8?B?a0tKaU5lakNlamNDSEdOLzNvRnJWbHFjZkdXeTVnVGcrV0tybHNjQUtQY2FX?=
 =?utf-8?B?VTc1bnpqb0ZmdVJEdmxGZ0w0V0lrNzE1TlhRRkpzeGxBQVVBeXAvWmk4TUl5?=
 =?utf-8?B?bU8zQmdmaWNlMkFwcU5md0VDUG5iQWdrQ2tPV0ZEcjRjdjdTakJicGd1dUNr?=
 =?utf-8?B?UThiemQrR0FOUWFYdjQybDJCK1lid1FydkhOMG9PcXk5bjN5ZkFVMHlTNjFk?=
 =?utf-8?B?S2lTYk1rb2twOTJNc1BuVXBwbzlBdnRxNnMxNHpiaGdSUVFzR1Y3dTZ6b2FI?=
 =?utf-8?B?QkxHdGs0dGE3cVZDWitsVmd3UnBNSFRReVo0YnpjV2V6ZmNPaG0vYVN2aDhz?=
 =?utf-8?B?R2RMYjVsOWJLMC95a3ByVjBCSTBFRnlVMjl0cVNwV1hPVVFxWVdYOVVzQTdo?=
 =?utf-8?B?ejhIMTRwQ01JYUNKWmhTMVg1N0NRclZ4YTV1azlpeVJpQStyUk5KWG5vRFN2?=
 =?utf-8?B?M253b1ZqODNKMnd5QmwzclZMNjVhWXhkODhCTmtna1gwZ1QzT2VWckNiU0hY?=
 =?utf-8?B?ZXdBR3JpajhGMkZFRm1QYWJXbGNPeG1iNFMvQlBBT3pTejJwakVDLzdvMEF5?=
 =?utf-8?B?c2N0a1FmV3J2QUVOaHFoazl0dXhJbEJRY20vbks3N3VIcFNsT0ErZnlrVE5i?=
 =?utf-8?B?c3ozb1dsWmh3T21yOTl4RGFWbTN1WTRtSFp3RkwzVHdtcmFBVHRXcUgrY1lG?=
 =?utf-8?B?SG9JZlVMaUlDWTl1ZTFoY2FscEkyYjFjMFY5emhGektLZGw3OFhldE5zZ0w5?=
 =?utf-8?B?RnowbzF5dXZRR1V4REJMS3A2NlFQaTZ3cm9IQWkwNXV6cmdBeHVhSmF3Ly9x?=
 =?utf-8?B?NWU1S1FhellBejlwNmlobDFGUERpZWhjOG1JdjhOeFRaVGRJS0lHekJTbHI5?=
 =?utf-8?B?OVZwaWIzbXc1Vmh5ZzlmN3hNbEhrN1FjMElzZ1hkY0tYL3hTR2RkOTdjeGQz?=
 =?utf-8?B?eGpGdEZ3Z2xtOElhN2VlVVFpL3VmSnBXK09NcEkyakJpSEJtSmZVcDRJOFpM?=
 =?utf-8?B?NzhXWWtpRkpMVGNIUXJVQS82YnBXMTc2L2R2K1FER3ZnVDVGS0pzQlVnNFRH?=
 =?utf-8?B?YksvYXJTY3d5Rm5qTGlEdFUzUUNrN3VrL2JyYmRweXdtK0pBSnhrR2xGaHB6?=
 =?utf-8?B?eG5BRTRmWmR3SFJna0R5QUdsVnR4R2I1cm9BdjJjamtzTnFNa3J0d2dVZDFV?=
 =?utf-8?B?KzI0dmhPTHdJbUlINmZrSkZaZGc2VDBtQkVUb3lqSzNZNzhwdWxlWTBoY0Vq?=
 =?utf-8?B?SUhhaXI1UFVlN3lETVVraU5iTnU5QmRCb0FRSmhQbVU4SVhVaHlSNEMyNTB0?=
 =?utf-8?B?cmtJUWpERnEraHh4Rm0xUUdJU1R2ZVFaTE0wdldINW56TGxlamtLako2aHdL?=
 =?utf-8?B?ZnVpdVJUdm1yYWtORHpCRElNZFNpRURQODBmeHFZR1VkVVN1T1A2L1M5ajhp?=
 =?utf-8?B?U1RIanBzR3ZSYVMraTl0MExvREVwU1drYjBER3lsYmJUS2xnQVVMdGdnczVu?=
 =?utf-8?B?WVh1T1lLYy9tRVlGVlFYdFYxUXRvR09RSWoxSVp6Mm82V0lVb0RlWHNka0Vs?=
 =?utf-8?B?TGdMVlNmM2twZlN0S1A0d2M4UGhib003ajMyTTVhNHZ2aERNSmpyOC9UZHhj?=
 =?utf-8?B?NUNTYzREd05nUlJPNFhhWVlTTkVoWE5zMytybHpHdDM0WE94WHVXVEZ2V3hJ?=
 =?utf-8?B?ZGszMTlwUGYwVnE4aTdRRkRRWnBBSlBrQXU3SzdkNml4amExRmZza0FONDhG?=
 =?utf-8?B?Rld5a29mVmJKdUZFK0Z2RHFrMWpyVmtiY0ZraVQ3eDJiNEpWZHZxaXE1QTdD?=
 =?utf-8?B?MGRudExBUTVrTVlVbUVNd0p5R3ZpNE5SMlFBdzgvWC9pcTBGcHFJWWNQS25K?=
 =?utf-8?Q?boYaKGYUZGObHvqI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cce3a9b-1852-441d-b38e-08de6780f804
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 02:14:34.9148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SpYGyxoixMV62UUPnEcfgPq0jhzWKVCqh9E1UXjuUmQSrVOwqSBOXKA9vH9CsU7tTkL8k/GdTA0MpvjsWtvLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302

On 2/6/26 10:43 AM, Timur Tabi wrote:
> On Thu, 2026-02-05 at 20:21 -0800, John Hubbard wrote:
>> +        // Reset and boot GSP before SEC2
>> +        gsp_falcon.reset(bar)?;
>> +        let libos_handle = libos.dma_handle();
>> +        let (mbox0, mbox1) = gsp_falcon.boot(
>> +            bar,
>> +            Some(libos_handle as u32),
>> +            Some((libos_handle >> 32) as u32),
>> +        )?;
>> +        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
>> +        dev_dbg!(
>> +            dev,
>> +            "Using SEC2 to load and run the booter_load firmware...\n"
>> +        );
>> +
> 
> Looks like you accidentally deleted the "if mbox0 != 0" test.
> 

OK, I've added it back in for the next version:

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 02eec2961b5f..d19dc4592579 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -190,6 +190,12 @@ fn boot_via_sec2(
              Some((libos_handle >> 32) as u32),
          )?;
          dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+
+        if mbox0 != 0 {
+            dev_err!(dev, "GSP boot failed with error {:#x}\n", mbox0);
+            return Err(ENODEV);
+        }
+
          dev_dbg!(
              dev,
              "Using SEC2 to load and run the booter_load firmware...\n"


thanks,
-- 
John Hubbard

