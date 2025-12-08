Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684852BE7AC
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Dec 2025 03:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765162885; cv=fail; b=lhffAGz+NWMQ43nW9buf8wGnWVlv6cN+loG3ie478KhdF2cUKz9S/kqT8qb9CCrjRyBBxwWmY6A+q5syi1ZQdptTdf1mWvaUSx2SwyywEJaKye1TI5ujr9BAmgGKrHG5BQHMRuNSh6vYRCwwAsgqFTk2rFIQiUV7lp9QykDVWvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765162885; c=relaxed/simple;
	bh=rkcPbzKL72y0Z/pAECUFmOBw+Y87DTgqIHw9FP1bSiY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Sa9lnieW1kJQOcgI6zg1hLFspg+KdBQ3f1Ze+VCehvjuU4WvfgJ2itReGE4SsFGjpQ2DN3IOAfaQB5GF/WAt2KOGiUETeBZ0wtHgTYkJri3KbojadI48bJ2t9pCDeIDyNoAfeKcZjl5kCqT/PlK5bXKu/BzjzHzflbh6pGPaHk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T1byFX+a; arc=fail smtp.client-ip=52.101.56.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T1byFX+a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAAdoqJoPhXSSFxY8ghCM2Q5aHhJXd3NkH/TkWsPAKU2sFTRZ2Rf7q/8NNHXkyoMtr7EtRsrlcCoWwCGkw9mP/zOYwSkdIyo1rTTUlj1gaO73xOk/FdqFAmCXZrkN2R7aVdukDtqOMTXYmXV+I3Hsmkexe1PCcMij1bT0QuOpDGlF7moR7CUMCZBpNJBFWQqjv2DX8cFeHu3W9ugioNE02MCMUINOB0RvFAszARiaEsiAxCwsbIrB8uilfnYzWFFv5eLHABD7+w1BBoAtvLflGkTIj5l8Z6Klo14DolEvVrsoCdX7JVpe0TtpZxyIkkVdPl6Y+VGl9dGTcy5iym6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVvJlQ5nPr5suHROnd8uZ5DCOpE6av8gwSvFnZhBK+M=;
 b=iPn2N0vixVxIGvi3p7rrrPqkx/QC8AQ6fv5q99eMxl2XUU06eRzC11Sk6dRr6v6FlOWcNZe33bY06AGeB4Ag1ERk50vp7+XymaPxI8Zj+k5k2A43cqq98gZ3+S8pJdSOA/ebOYfo9LybG7Ucwt8u+2D/pHbtw7yn5McF94jVvOTRXjwZi7GEcd98mloFGYZ4C2aEQKRp6dYO+YY8aUbocaHV8ASuj9sUWX/85cPtgZHgg99+WHZUWiyR1KOzqammVUtPLdIU1HZ5xTorCfrFuSYULcfWT5mjzsXFIwACa93Q1F0e+arMNweMtoOc92AT9ZwELV1RIpjRildZmQzDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVvJlQ5nPr5suHROnd8uZ5DCOpE6av8gwSvFnZhBK+M=;
 b=T1byFX+aci+05Fr9qXwEgfYgFpcUneOVwnlU7LK9AV3NjApieb1qUKo3Icu243VjmDiKX/1b59U24P6whna61vnOZ3blxNIaZ/NYaV1iOWX1K8qMOEj2emeP3K4OZqFDLCRmJZ6pdi7juujiRehrJvf8ZuoWZbopwcBjbcCgiau/4DP1M47CKVELweOLcbjyA7FytLo7HUr4o1tBBGUQ5PcZA7UiLwupDVukgYO/jBnkY+60V8lx4TSAraVvB7GBwdyhqCJjyZncn7DYLC6azkjZBG9OANk2NHNy+VfSXH8qcuj5QD7mzUOc+5H13vWSNuvmH5v0fLkEPfLo9C04eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9823.namprd12.prod.outlook.com (2603:10b6:8:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 03:01:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 03:01:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Dec 2025 12:01:12 +0900
Message-Id: <DESI0L685D0M.1NP1X7KGIDJEW@nvidia.com>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>,
 <rust-for-linux@vger.kernel.org>, <tmgross@umich.edu>
Subject: Re: [PATCH v2 1/4] rust: sync: Add i8/i16
 atomic_load_acquire/atomic_store_release helpers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <ojeda@kernel.org>, <peterz@infradead.org>,
 <will@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
 <20251117001035.4068507-2-fujita.tomonori@gmail.com>
In-Reply-To: <20251117001035.4068507-2-fujita.tomonori@gmail.com>
X-ClientProxiedBy: TYCP286CA0274.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: 573b1dab-c78f-4dff-2069-08de36060da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmtFejZ0Y0NEemRJK3pRNFpMTXNHMVBxZnhFRHc2UCtlRDFJNkFTQlAwRDJX?=
 =?utf-8?B?ZnNEalh1MldsOEEvVkhJYXl0Y3hUTnZaWCtWcVVHbDR3WmRlUk1pV1NMZjNi?=
 =?utf-8?B?Y0h4RFA4WUVqYitITTR3MWpYVXlBSVJZcldIV1dCeHZ1bTlpRU1QeHpGQTQw?=
 =?utf-8?B?cVdEam1nU2g2TXNiTjdBbnNscjVqa2F6NmdubFZwRVAyTFB4bVNVL3M4Sms4?=
 =?utf-8?B?Vi93bkl1QVZJTmZJZmx2TSt4Ylhma0cyTy9la0JSUm5xVFBwQkVJbVIyamdO?=
 =?utf-8?B?UjVRRWljVFA3RGtqdi9oT01kV1h4YUVvbmlpN3hQWG1kOFRWZkNvc1B6UEJz?=
 =?utf-8?B?dlBldFUzTXV0b1ZFcnJOcGxRTlNwVVNBb2FCaFYvdU5WSHlJdXVROUMrdlRV?=
 =?utf-8?B?Zm9mbDVCd3NITVhuRjA5R2lQbCtobDhUR0hMdjR5TWh0NjFsNGdMTHUzdXJF?=
 =?utf-8?B?U1NxeDJzWm1rTk9tTXprN2RQMGtHNC9xMC9lVXE4Qldtcm5UcGRUbml1ZVZU?=
 =?utf-8?B?c3NpSVMzMzFFZy9mR2J1cW5NVkdTd0VwWHpZakt0Z2twRFNkRURZK3B3ZG03?=
 =?utf-8?B?bTZodFpXaVhQam5xRnVGWVBkbXMvNHBOYXJ1UGlNaDJ2KzNxaVdMbkNjM29v?=
 =?utf-8?B?UEdxM3RvZ29IQmtPQkxaK2pmWDZEcjFHaGIxUU10MUJtWm5OYi8veDFKazFu?=
 =?utf-8?B?Q0RaWE4weGFOUDVJRDhkU1htZ1BZQ0ZQZTdnOE1LVWtwRVhSbzRDd3U3S1B5?=
 =?utf-8?B?TUtybWR5d1hOSWtrQTRlTURHekJ4MC9sUEducUxESGMxeDFSR2sxaG5Hbndl?=
 =?utf-8?B?MEZFMHF6WjczKzBTOEhWaGcrNHhoQTNaV3Y2cXY2NGxPbE5TWlcwMkxpdVg4?=
 =?utf-8?B?MjVPbUtRU3l4bTcxWi9qUXlTalBZVEV5Zm1NeWJXWVVvT1BCMytuVForQXAw?=
 =?utf-8?B?QlkvNVVDN3NudEpUamE3MmRZY2tyQ3hkckwrYWpYdm1SbVhIaXNNYUJiRUpY?=
 =?utf-8?B?SzVZK0t3NDZ4MzV6eGt5R3JDQ0dKamtaMjhnTlU4ZDlVUEQ4TTJNNXdiQmNQ?=
 =?utf-8?B?RWZvdmZlMlBJT2VGcTNZK0hDRmdVREpYcHpwZnN1R0VEL1FxZ2NUeWxzZmRw?=
 =?utf-8?B?blA0TnhvWUlwb2JGN2pWYTdVSGRlNVhYWHI5QnRFUTNPdFM1aEI3VVpaeDB2?=
 =?utf-8?B?RWl6M25CQ3ZLbVpsTi9DcFZyb29RZ3JHWkU1S1h6QVJWUXNpMlFqdVNBcU1a?=
 =?utf-8?B?QTQxWTVIRFI4VFFIOHlVQytnelYreUNyR3c2VzNUMkIwT05LUkg5TUFUZDVw?=
 =?utf-8?B?NTFLTld5MUp4VGNtQVF6WXdEa3kvamlmTDdUM1JQeHNwMCtVQ1JBd0ZlNW9w?=
 =?utf-8?B?eGRwczBwMFJ6b0d3U0JLUFU2dlZmUGtuMEg1MmkrQ29CMzRFSkMvcmFwUUtw?=
 =?utf-8?B?aE9CQm0rN1V2eDdXQm9MNVB3dS9CeHBCOTUrTTV4eGw3d0VhejExamN3QktN?=
 =?utf-8?B?Z216czZlNlJ3ZmhpWUlnNUdxS0tZL3pHUmNIVmpIM2VrRXdINGxNYXE4U3ps?=
 =?utf-8?B?cEJyODFMYUpNVDI2RG9nZkRZSWk3YUo1QzFFbjZyaGpHUis5ak5oL3h4QmNO?=
 =?utf-8?B?a0FKYWhmYzIxczNlazdZcTJKZFoxRkl4STRSc3hnK0NZbVZlb0tkZjRDczUv?=
 =?utf-8?B?S3gycExNZ25BQ1ZtT0IzSDRDVFdtR2IybjNIbGMxMXMvUFlmNEJlSmJqbm5a?=
 =?utf-8?B?R2J6dHRneDRFMWVKaFZvM1N3ZGJOMHZJaTZsRlN1Z09ubkZoek5BYjlKQlJN?=
 =?utf-8?B?R1JnQjg1bndmYlhHUWJGamp2RitnM3JYZ0JVLy9HazVHeksyMTVtK0QxNFNQ?=
 =?utf-8?B?eHNXT2lmTzNyTFdRTE9PRGFud2Y5Z2VZY3d5TkVQTTdsWjZKMiswTGV4SmNS?=
 =?utf-8?Q?7gbyPibj8J3zBFzkgsBtCdgUH6UYlo+2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlI4bG9TWWRlR2hIakRaM3Q1TmxpYXd0MXhDMjZYZHJnV3VEQ2dGUDlleUx6?=
 =?utf-8?B?d0lTQkRld25KbVRmeFJtN1hmc0ZxOHkrSXBERHFsVWltUmZGMFdIcmlzeGVQ?=
 =?utf-8?B?ajhUbk9xb0pTakRtVWFmVEJsV1AzMkZPWWxQTk9mQm1qdEZUS0hKaHJoM3pO?=
 =?utf-8?B?TWZwa1VIRDhSc1ZMSUVuRzczNHkrZDVoR0Rhblk5TW9leGpGQ2s0Y1o0VUxn?=
 =?utf-8?B?WURMZkJBVUpzMmFXQmNZRlJRNGlTeC9OcWFITjlRL1IzUzhxaWVuZFNrdU5n?=
 =?utf-8?B?NUNzUWt1cXY0cU1zNXNXMlloVUozbW12dUpSNTlMbm1wc3RzZkc5bXE2SWIz?=
 =?utf-8?B?cGpzMmh0VjVjb2xPOWRPTS82cG5XSmRSRXlDZW9RNVhVaERDRVNyTXZtNHJx?=
 =?utf-8?B?blJ4UUE4TVlBNW1KSXlSMjZGUFFONStXVHMwc3M4S0ZmSnB4KytnaGp1aXVO?=
 =?utf-8?B?cis2S1ZBSkdmYWFWV3l5QXlqNWhqS0xIM2I4TWlEa0Z6S3k3cExxS0YzQzcw?=
 =?utf-8?B?eTdUQ2xWaVA1dnVMM0x1MDhlUDc2eTJISmhOR1BhaE1FZW05cHJWOXF0TlBq?=
 =?utf-8?B?ODhFaHFXVjZFRUxzYms0cHgzTDRrazRzbnp0STlYL09qcHRVbW1mcTMxZE5v?=
 =?utf-8?B?U0hKbkNIZlpXM2RuTUtDSThKZHdyamdMZXduNy91V2kzRGpFRUgwd3BQemVp?=
 =?utf-8?B?bVZlK2RMQWoreUw4SXpBM2h4eDJ5dnBDMkZqM0Uxc0JJWUJKblJCbjFzT2sy?=
 =?utf-8?B?ejc3UGxmV2NRQnFKN1A4ZUxFVUdlMmg3anUyZVdsZ1A3RzBWYlcxb0lUcE55?=
 =?utf-8?B?c2E3WUNkK2ExQlEvWEo1bFRSSmJBekRJYjVXRmxWZ0pxSDVwN1c5TnA5SXN0?=
 =?utf-8?B?czdlSk4yYUhxZzM2M3RTNm5nLytZMXFHQVd0QWMrQTFNTHVNc0w5TEcrb0xm?=
 =?utf-8?B?UUNyYi9JS3lwRk5wNkp4UmxQbDhXY21KdEMrREpJZEFlelRJQnl0SWp2bktv?=
 =?utf-8?B?ZFZiUHpuV0hjREhsVDFFemZuUTA5UVJGbHBvYnhyWGpkbjZIVHpua1pRNXQv?=
 =?utf-8?B?V3NJellZa25JMjcrUllQZjNnbzkxdkhUOGxpZDg0QWtacmdKbHFIenlZZEU1?=
 =?utf-8?B?OW9CTmx3R2UrWHNrTDBCazlUdkc1aXlrTkJrOUFKSzh1SVdORDJPdUtMbUlJ?=
 =?utf-8?B?Qm02U09yVVdnSzZRcTVIYkJxR1B2SlFSRTFDMktab0NUZzVrK3J4bU9DQW41?=
 =?utf-8?B?RHBVZEF3MmxTTUw3TjRyb2g0SWoyY2ZXRTZzdHIxdkRtWFB4TStrWjE5K3g4?=
 =?utf-8?B?dHBvRGlHcFpFSEhDTnhMOTBucmd1S29aYlRiek1EQU9RU1Rka1JqTjY0YW5r?=
 =?utf-8?B?RWhnclBvQmtHNUpPVFhvbkRBM1Y0ZjBabWYyMC82eWVtR3dhMHk1Um5aKzM5?=
 =?utf-8?B?emdlb00zZUgzMmxkQnRPSHZpOXlPT1AzTHJBbUx3dGZmcnkyUGRwYnZUbENW?=
 =?utf-8?B?Qk5oR0s1ak4vOEpsRURIY2p5YWo2K1huaS9JTXJCT1NSaUdlRGFFb2JIKzlS?=
 =?utf-8?B?ZHVGdHdBWkJQYzZlN0JaL1dCN1BCNjRZTnpjdHA2MEY3Mm9ZT0x6Rk5XWFQ3?=
 =?utf-8?B?dUZwcXNjK0FuMVRzWlI3WS9RTTd3MG96ZVNkTjQxNUJUb0JDS0VuM0pBbWEw?=
 =?utf-8?B?WlliTkErazlORitSUVVHcS8xdWVNR1UrSW5kc1JoSWcwa21IcXZHZEVOb1BT?=
 =?utf-8?B?WVNkZ0pndE9sY0N1WDdGL3hDTGxYODZNLy9nVGdmYW5sMWFnNFE4NTA5ai9H?=
 =?utf-8?B?cTZaUVliKzkza3Q4T1pkT09JampGdE9MWlVPNlpKeitRZjZNWkVIS1ViY0lP?=
 =?utf-8?B?c2Fpd1RUWjBmRC9iamNSSy93TG5hZUhqaUtvQmlLK3kxUjIvaEpqZEQzeUV0?=
 =?utf-8?B?RHdaNGFmMDdxdlhkdDMwSTlnOUxZeHQ1VnkyWkQ2REd0b0ZydllFTWpSVHdl?=
 =?utf-8?B?cmd4d2NqN1JxNDJ5eTNXTVlhbm5YVjZYL3k2ZFJ1dG5nSmNRYmtWdWdVUnU4?=
 =?utf-8?B?eUo1RUsyc2gxREUwa3UzcEtEUFpUV0tIVzJhM0NJdm5MRG1kTDJldjVuWStl?=
 =?utf-8?B?WnBaKys2WWtpempORmovSTMrM1BlMDdaMDNvZmxteFFLbkRjbGJ2eXczU1RE?=
 =?utf-8?Q?uPOSGmZIT4BhYsxBmfAclx5GB3uTjKZRCKSUuhYsmZkP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573b1dab-c78f-4dff-2069-08de36060da6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 03:01:17.2861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOxWi0jq0DK/ABE/0+nEf93V3N8xso60SH987dvF2L5my/37X8adJBucqDQsY3BNz4dxOvh/9CByNbwSvbw5iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9823

On Mon Nov 17, 2025 at 9:10 AM JST, FUJITA Tomonori wrote:
> Add helper functions to expose smp_load_acquire() and
> smp_store_release() for i8 and i16 types.
>
> The smp_load_acquire() and smp_store_release() macros require type
> information (sizeof) to generate appropriate architecture-specific
> memory ordering instructions. Therefore, separate helper functions are
> needed for each type size.
>
> These helpers will be used by the upcoming Atomic<i8> and Atomic<i16>
> implementation to provide proper Acquire/Release semantics across all
> architectures.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/atomic_ext.c | 23 +++++++++++++++++++++++
>  rust/helpers/helpers.c    |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 rust/helpers/atomic_ext.c

Why not add these to `rust/helpers/atomic.c`?

>
> diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
> new file mode 100644
> index 000000000000..d05f6f7ba10c
> --- /dev/null
> +++ b/rust/helpers/atomic_ext.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <asm/barrier.h>
> +
> +s8 rust_helper_atomic_i8_load_acquire(s8 *ptr)

I guess you will want to prefix these with `__rust_helper` in the next
revision.

