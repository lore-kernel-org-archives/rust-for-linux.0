Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E5027B4FB
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 21:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769549205; cv=fail; b=eMhnUpoLQq2JlTqFUVOJwhcsuqaYHVV8SwZk0s0lc5mRlJ1dPpWoi1KCxAZvSymyU4idssdh1Pw2scERS2Oln3zuCa34/+6EH9lDixFfrYxv0oqLtpaY7ZiGURPuEPFN7EX1DRlYg6FUWkSo4hlSMTXpdLwfXZg9rDvQ0PyQR8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769549205; c=relaxed/simple;
	bh=tzz6g5dGnrwgfa6kuwZ5Vt1CLJl8hd0Vs2kevtQDcNM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C3FGb03DCRSrf+MLfJBZs5EbDZl4zJgU0y9Cq7HHpAkuDDWinK3MIuuVnoKefMYfG47Cih+gMFkK0fIc3lyKRqEqYYwKNjmNfoayMN8Ke4J0O0ldOt/TxbNpk2S4rXdPA+613D7Mb2BuqQIy+77miql24M+5UnHMmg3s+MLciwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OTbZfilD; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OTbZfilD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0WS1FpxaLr2mcsUIMPJgK5Sv2sv9ngv8YcIeGvkwc0g8BUI8HlqrJMSVQ/ShTwHJ5bJeGSI5g/58r9H0k4EmFoekv/KXGUH2a7DttS9cnPH2xXZt6ZBEOatIrGuArMva6n3HYNsygPoGs/wz1La9qtNHS+Di6qWjxYLVc31gSviTWsZusRHwr3QBgv0TXw6nE8+z3ziy77jyf5gunxtPLRh7Z32IfFFOAj7SHKOqNabcFYJA4T9sTWeLTdaFuhrMmWJkxkFRmiBInfgmIPlEbAgyWDbnEQy1t0J6sge/rxKj6j98VVvZ5jPX9bns617N+0DYoUe1I6HOvUj72FaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tb1Fl9Fai6baxa2QBEOLOxAW8t8H4QL9PlcoTOGHteU=;
 b=FXhIWdjbW8aOzpMDGAP8w9P4BF/qmK9h91Qzhomkc2rpnn5ve22oCmxihwa7yXK2avCsHT29L6aKziImrd5euWrTaZ8k2zxe7yOmhuklkSe4yC3VFCtvDR6LOhT21FEcfqlX3oziAQAwY2mYQIslSzWmyftZIWWbLNEWf29m9jeQXdQR3MZ8gjWxWKHPg8YzYn60B84yjr5PP4g1zmXvB/l3L9PRZvtuhEBjrrIlZYxkwt0tqa2u/sBjVAu8l0MMrar6j/wXCq586qgIHS1R1POHK8LFwxzFep6bw420iUvUaDsEbssFeaU05g5w2Orm70zu1eIoISbQGLbW4wbJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tb1Fl9Fai6baxa2QBEOLOxAW8t8H4QL9PlcoTOGHteU=;
 b=OTbZfilDuqSYqTQTT/cZH9LatPFJV0T4uN4CMircpJpE02F6NrU9iDyme0cY38c06bBii0dGzl6BTOwHimT424hhyGWsuCwIDMM3K/yT5fKpElIoWV2lerDzIw2t7qj8QvhtK5HIflC4NSb4r4xWJhteofmXVC0F7tmA0w2mvJ5ehazZZLirXNGbhgc1QMOsQ38c+a7o+USrGbH0KTN3v5/nGVBQvtT5ScReJ1h3Ccrnmj6lsYRuVmrLgJgVb2S7OflXd25tRQDUR7feAl8fZzjjCSqclV5/UdKij2jPzLDldhMKkWNDJeA/AFZUIgZi2qmEGmMjUP4pIzMUMWs/sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 21:26:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 21:26:40 +0000
Message-ID: <834443f4-066d-4223-a086-aa764ccc5d1b@nvidia.com>
Date: Tue, 27 Jan 2026 13:26:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Initial klint integration
To: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
References: <20260127172330.1492107-1-gary@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260127172330.1492107-1-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY5PR12MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: ab59bd7d-231b-4978-4997-08de5deac2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjRNekJRQlUvalFTbHBpNnRldXZKUVVSVTVFV2xBL05FUWVhZ0cxS2MxeGFP?=
 =?utf-8?B?anNVU3BnTzMzNk9oU1RrWVZWalp2QW1xWkk3WUZneDlNQkdjdlNkN205TzBk?=
 =?utf-8?B?WFR2NGorbnJQcXltQ2lrenJLb3JLbytITlZNYUtFZFJoMTR0QThLVFV1Nklp?=
 =?utf-8?B?M3hTMkdiTHkrZ2h1WGt3ZmJReEg0bXp2YVg1b2ZYdmJKM0kybnNZYVd0S3FC?=
 =?utf-8?B?cFdsU1RTWjNDZHNqNk11YStCTHJIYUI1RlZCTzJrRGNRcmRNRjRNMlZIOFNI?=
 =?utf-8?B?enR3Qnd1R00rQ0ZtbTMxWUtmdFNxcjc5dEtSSWFNOEJCNENydCtBaDRlSFc2?=
 =?utf-8?B?WHZRZjl6TnRnem4weHdFQ3p5bTBrNFpCbkw0N1k3UXFjdU43emw3WkdTaVEr?=
 =?utf-8?B?VzZ3K2I0QXNuWVlHV3hVeUV1NVlURWhQOFlpR0ducGMzeEJiaXNGNGZDM244?=
 =?utf-8?B?ZWRnd1hvUGU4cUdBbUorc2o1NHJXbkdhdGZBTm1POFhlVWc0Y1lwRE1uRXY5?=
 =?utf-8?B?WHo0ZzgzcUViZmFMTkxKN3VqZGNKUGREL0l0UmtwMEZZbGN6QWliTGhJeWlR?=
 =?utf-8?B?SEtmTXBHaWg1ZWZwaHRza2VaeFVXR2daSzg5QU5LS3RlL3ZEeDJpSDUzVUpG?=
 =?utf-8?B?blJjY2ZNVGV0RDREWVk0OHFvNDBhSUNKRS9YYUZ5cUhIR1lhQUtGOW90TTkz?=
 =?utf-8?B?Q0dZS01lK3pHd1A5OGNnUTZMUFhyMUdNZlpaenVXSDhoSDFoblFtcGtWdExW?=
 =?utf-8?B?elFSUVlMNmdabm5RdUJaK0w1TGhNRS9lblR3OTRQZkpkd2dpR3BLUjl2UFhI?=
 =?utf-8?B?TldKLzJObmNQeGZ2S2NhTjhUSGo3N3EwT3FLNkE0bDVoZEFSQk10Q1JpTHJo?=
 =?utf-8?B?U2NZZVdKSWZTZWhiTEoyYy82VWhuSE9ycW93QW9ZNGp0Z3JxT2Z4SnNuaXF3?=
 =?utf-8?B?eEVaaS9SMmFxcy9PQVRtcmFzU2JxMTRpN0tSSkowOTh1WXZOSVYxNU9ROU0y?=
 =?utf-8?B?WUgwMUg5bi80TWxQTVhqSDVoR0FtbFRVYTRXekMzQk54YXBRTFVUNVQwVnhW?=
 =?utf-8?B?MGZoSkNvM0lhcDdrSEQ1QXROZFVqMmxtZGFTNnR0Sy9qMGVnY2Z0ZmkveVNi?=
 =?utf-8?B?bDFBN3VwekZMbnJUQnJTY2RmZEJzOXdidE8yam9HeTcwa000N1lsUWt4WE1O?=
 =?utf-8?B?aFRuN0g4clp1MnovK1dadGZzc1IwY0tYWmpKMmNYZ3RUK1NoejhWY3JCUzFD?=
 =?utf-8?B?SDRpYmNpT0lteHRWNmFWNmx3TlE3bnZIRG5TNWJ2NG14YllmRVdRelNQazZv?=
 =?utf-8?B?cjcrM3RMOUNORkJES1F1ZnpsdEtoSXhCMGhvMFVnWHBWUlV0SGhYU2ttWUVB?=
 =?utf-8?B?RG4ySWExS3c3dXd6ZzJqVExZbGdBOEx4VDZxZFNWNU55bDByQ2pId1FSeHJY?=
 =?utf-8?B?a3ZMM1F3d3BoWHNmSXh4Z1lPM1pJUTJuVE10RSt6YlZ2c1lWNloyRTNQOURz?=
 =?utf-8?B?K0VYTlZ5VkNFZ1ArMHluc2RUVlFQaWdYSDZXMC9rcVhGdkNqZ04xNWJFMDJw?=
 =?utf-8?B?bmJpc3pINkZITGdzdThsTWtnYmFFb20zN3EvdzNsbklUYmxkRmFYQ29jQTVy?=
 =?utf-8?B?aGtSd3FOT0RDOE5YcElXVWJtdHNzUnNrVkczcWhNMERKUUg4TUJLT1VBNGdh?=
 =?utf-8?B?QlpOUnplNnAwUDVlSzFiamZpNTJveXZIVGFVUE9MckhlcDl5U2VpZmMwaHB6?=
 =?utf-8?B?cURVNWtPWktzQ0x6ekJDQkJMVWVmM1BOakFjRzdpYTFZS1NFcFM3bTdvZDR2?=
 =?utf-8?B?Q2kvNnhMTHZrQkNZNmlENVo4YmV3TGtJek1jeDNydXg1YldveitZUXpONXpm?=
 =?utf-8?B?Wi9UblBhMTc4QTNOeXc3T2VJMEdNVS9BbEcvRlZvU3VoQ3NLdXh0MitxMXE4?=
 =?utf-8?B?T0JDVHp1MHpHYlRydHh5ZExIV21VQlFIVHR0WnZnanFXZW9ocHZvSDlIMmd0?=
 =?utf-8?B?NUJDdll4OHJnMDRUWlRmMmpSMXJ0cC9sRFQxcTdBNUVpVlh4aXIyN2hQaUFx?=
 =?utf-8?B?K21IdzlTTnh1WjdLN0M5Uk44aWNtQ1ZaREcrTG1QYUUzMkxQM08vZ2FuN1FW?=
 =?utf-8?B?K05YdDhtdXZJOWE2YzZzODhSSUVrOFZoWUNZT0hiQ2kwQjU5TjBadHhvMmZW?=
 =?utf-8?B?UGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmZnUTExRjBNc21yUFI2blJ6UTdYZGF5SnQvS1kxUGFQbXNoaXhUbDhNZkFP?=
 =?utf-8?B?aGVDRCsrYUt4cGRTRzFyVTZwVXZnN2tvUFh6RFEwaHZKVDdNcXhJWFVqcUFr?=
 =?utf-8?B?RXFRaS9IcWpUN3o5SzNIYlVSUGJncE5SbUU3b0hrMU5ERW94TjFYR0ZEa0FI?=
 =?utf-8?B?dkRLeXBMN0ZtOWxDZzkzWHpYeUJ4cHdud2xUYmFQN2pIRUVTTG9FaUlCU2Qr?=
 =?utf-8?B?NWI4L1o5VTJKR0tpbjNIenJNQVZSMlorbjljNm8rUmVOOURQMEN4QmxXa3M4?=
 =?utf-8?B?NUJFSU1VTUE1ajE5M2NSbzJrRnJwNE1TU2xwaXhLcDR0OVdUcnhpa0ViVTZM?=
 =?utf-8?B?V3JEK1FPaEtFdXpkejdSZnZ5Y2p4ZEdtYjc2ejZVZUpGNW9keFBuYm5pblhq?=
 =?utf-8?B?NHNrNWlxSTAyclpBd1JNbUZuSEs0UzhjUEpIN0NFMDYxU3BUOGpuempFNmRK?=
 =?utf-8?B?TDh5RHhUK1dSVndwOEd1bmh2WTNGZkhyUUNUc1ZFYXpFK0djdnBSY29qZjBz?=
 =?utf-8?B?UEY5Skg5b29sODJzcUhkSHZjMkFGSGtLRGRxNXdqNlpTL3RKWnVtRXQxRUxh?=
 =?utf-8?B?SjVyQmRLZUVFeW54MnJQVmVTSGltb05yQ1NRZGpyTERRQ1dzemVIRFExT3Zo?=
 =?utf-8?B?Vm5SZE5KOUF5cmRQZ3hTTWZtSGVZWjNaZE8rQ0lwbWxRQ1R0SXpCVlh6UVZs?=
 =?utf-8?B?U3pEVVdpdnhTMW5kdlhNdjFXc1NnS1VVTm5UVGtJSDBvY1VQbmwwcDRRekQ2?=
 =?utf-8?B?Tm80NUhueTdOeEgvZVo2UEdhbkFJSmNielRvY2swSHVFSFRnL2h6TTNncHAr?=
 =?utf-8?B?T0hKQXRqMTg3SHdPU0dpT1RrL0lxa0hxOHJkUk0wY3BFTzlyN0xHN0NBdm5i?=
 =?utf-8?B?ekI5YUlDajlTLzlNY3Jpa2hyYVduMTF2eUFWSkFWbHZicU1OMlRFcUZoZEJW?=
 =?utf-8?B?d0JQS3htbHBQWk0wRGtrbWtDVzlRSXI0TjdUbk9vQ2JqWlNkeGdDVXIzOU4y?=
 =?utf-8?B?dHhIei9xY1huVVFMalFsS0RkcEhGd0RONlJ6c3NHNS9Mc2c4ZGpPVmZTTXNt?=
 =?utf-8?B?c0Jjb2pmU0ltOW5WU084cUtLZWgwMysvWFBQcW02c04zek9WZnZoUTJDWU9Q?=
 =?utf-8?B?dG5vVjNEcGhtY3lSRitpMXVhTTU4SXRFQlRJS2U0enErZHFReThkQTl4M1A2?=
 =?utf-8?B?d1VxWE9Md09TVUprZUFKU0xBRm1hN2ZVVGFWTExpZnhINkxRUGtTaUhlTGpC?=
 =?utf-8?B?dk5BTDNXdUYrbDMzWEpvdStzN0hFOXQ5Yk9STS96SEdwNUwwVThIdHJMdGpH?=
 =?utf-8?B?cjcxOFRJeWR6a0hxcG94ZjRHSlFRdktqbkU3S3ExbWdpc3duMTBFQ1B3VTJD?=
 =?utf-8?B?SUdjWHkyMDY4NTZrcC8vVGVFQThLZU9PQzVpeHVRWkxMUExmenRPVFE5RGpW?=
 =?utf-8?B?dkZJeVM2QXI5Snh0Q0Vxc2lBa3prQU5kc0luakQxcFo1a3hIZDFyRnVDcGFh?=
 =?utf-8?B?UDJGMm4vSmJQRjZuQUhucGFGR3Q3TmVZS2daV0loSS9scXdHRmtIN3BDd2J1?=
 =?utf-8?B?d3g1Sm9zK0RqR0ZpUVE5aDZHVmxMN1VHU0dDa0w5RDl2WU5OWC82NGNLQXpl?=
 =?utf-8?B?UkpJcFZUV3pCRWtiRlIyWlpwMDlHV2JVcWJDYmwzUWdiREd0NUJvYjBIWDlk?=
 =?utf-8?B?MWtYZlgwWmM5U0ZRbUVYTVViN3JCMlpheHlQa2NZME5QY2xHNUdodFR6cEVU?=
 =?utf-8?B?b1htSmJMdHpQZVVVekxaSVBPTHZlVzhVSFZaek5Kb21hRGgzeWZDQW1SR2NI?=
 =?utf-8?B?QnVkWjVzY1d3L3hrSFhXbENINWV5NjgwNUpXNVVDUGFqSDVqWHpsQVdycFo2?=
 =?utf-8?B?NW5ocTFsbVhkQzlaNzhkaXhxR1d5RlF1eTJybHlnRDZNekRMNXJlNE8ybXdz?=
 =?utf-8?B?VWh1akhFUWVlYTdOZW4vekI1bGYwbDl4WXkzR0FpL1p1bjU0RCtiS0VUbTlx?=
 =?utf-8?B?NG1Jd2ZxR1ljUERsN0pESnIyZWdZdHdTUHk4N2tDVm1wNHhZaklsL1BiTUYy?=
 =?utf-8?B?a3hNL3ozRU1CVCtkQmJJU05UTTFXVHB0NW9TSUU0eDBjSDQrNVlhTSswQnBv?=
 =?utf-8?B?YlVSd2p4eTNDelhDTXUxb2VISm1ZdkJ0T1FGbEFtNUZmQ3dra1RGVXloTVUv?=
 =?utf-8?B?VlpYYk0xZmY1MUJBUGFHVkJ6Uld1NWZNQW40RlpLWHVvODFqeUlESXpYK1Y4?=
 =?utf-8?B?YWJTNTdhRnhzU3dKc1BmM3BYbE01YjltWHltSUUrZkZsWnNvR2V1V0xpNmxi?=
 =?utf-8?B?WEN2VkFWY3plVDBiZjRjd2dETVFpeHZDYjhUVThzd2pJWENhUTc1UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab59bd7d-231b-4978-4997-08de5deac2c5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 21:26:40.7031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiuYjcSbev3lIfSJpwG4AO3LmLOx80BoObtAWQesFq1SEtNO/TmBWce8bgqOd5UuXnF1gcaNyL/BbuKFdH2uxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146

On 1/27/26 9:11 AM, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
...
> The kernel is not currently lint clean. I've already sent out a series
> to fix the prelude imports; there is a true-positive with Nova-core's
> Cmdq::new method's excessive stack usage which needs fixing.

Nice find. Stack usage in particular has been a concern, and if klint
can actually find some of these cases early, that's extremely valuable.

thanks,
-- 
John Hubbard

