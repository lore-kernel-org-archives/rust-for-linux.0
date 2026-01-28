Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616C238159;
	Wed, 28 Jan 2026 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608945; cv=fail; b=kzKKOLbc1osfKH7aedMKIPLP2ntJOg0PwnXKeUpQmyGq9voZ5WZNuAT46zOdWyjq/bwscDbDGvzDejuknYR9pmC+wIvTqsMQ73egy1Be7PL4dDPlvaYwQCKi2im5XcBW3xPFIlUMkOH84yLoyG4D4ieBV5+IH9lCS5Ut2lJ3FI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608945; c=relaxed/simple;
	bh=6SLaRnUrSBOj/dVUxrB9/PsGNzxekcXZYQPMAZ1VKLo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NskBMiD1raxIfqHCmBfew/0zXyTBaQFz5YXK3jyAm9kCLNb0I4NgF24nwc65qM33vX/t+BJzDee4WCTfTHj7Z+amXs7f+EI920epal03e6lfQXAsGV9JExcI6kvy8Nh8pk2E3KVZuXKNzMTgswM9nLKYF5txPmnJ+boD2z06hRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oQ9HSuEb; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oQ9HSuEb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9ELxMEufalhMOhktNBjvv0qhGe9xcacqhj23fij+GYoudDleWn0BXgx58tZsLIKGmgA1S0KZK3efQXeP/aM85usUe3UDkOiOA4mE920k5TMmf8Be3kPZh29x0D0ESfWgfEfRo6rg4If81NdFivVqxBdDIGND1lyT+ErqdcQiEQVvNGyUPpiQKgqOAaXZmBLHPehk+HjtNlGTFKNWG9Wr4dBww4IWODQIBkP8QeQqa52ZdibZaXGCM6AxBB2Q6+W6iVlo/RD2XvtnnjYCNrVhK5Yvx7UDPKGB+1bhA6xgk/uZMro8D9hIYkq6brHN1jtv2682Mhnc1AYsn0u+eZvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sf6gBmVZaipD2ZsNtHrLCEG3J1gYIu9KFMuzJTq9ad4=;
 b=T3a/HVgCcQR6UDg0lGFnPddGB5U2ILyPndvZA2N02HmFx7cQpCZIPODERLg21qmA1dzkKk3MIdyLmu67oVoDKIRuYN5i1exog96h3Nt8Fhs7wq6o4SMEN9uuy0sXw3WF0XQkCO1GjzIYNImHyqZ1lJcYZUV74BdVxtFyFFc/Qsyf2DINPbfwhIc39mCNFz1TVbMWZVOZC4OJwecpN8S28DoQKywkeKVAFPLpkS66bk7cJPjLg7unqXh9VPuZv0ePzzKjIVD4vBzUT+bLIvuXsv7IdAwlJ2yGfIRLezUdTI5s3CEuFCifgixTe4+EXVHkqwvgTKxh31MCZlTcyqQeiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sf6gBmVZaipD2ZsNtHrLCEG3J1gYIu9KFMuzJTq9ad4=;
 b=oQ9HSuEbJBYeQv8jlXnD5FPnPeEwudTIOwJ3CSzEzvXc5IuMr8ustPhBT/WIcvypMkhh9SOREDPsjVqQ+KFTXNXuchBeTalGMwhxYisc+jvLRDo5u0c38aTT1NQcGrP/LNPHqmUjg9fs0tVVRt6TB6dmZeX6V34Y4Gt49J7z4Ji7BW4N7jxUWSJHy3uORT7aROJjUztVO1LGOleywQaDvCuMHV4FD+O3Qxx1YAhAWoa5DQ1ndMU61lsg2vDYKhKdjAHNlDkQPl/oPmTQ44Y4wcTDsYzgk383a33gwabsEnkTmexeH2JjBt8KOURi4AHFub212c5n6rv0RTJ7s+Z4Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:02:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 14:02:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 23:02:03 +0900
Message-Id: <DG0A0CPEYCIR.1ZMN457FUXZXM@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 "Steven Price" <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
 <DFZGOCV6VP2N.28M0CWIONBGMW@garyguo.net>
 <DFZTVMUBOHH2.39WYY2O0F48NH@nvidia.com> <aXmRqzkKq0bAQaV4@yury>
In-Reply-To: <aXmRqzkKq0bAQaV4@yury>
X-ClientProxiedBy: TY4PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 0330f1c1-1a95-4c96-da3b-08de5e75d297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azRIdm5KemlYcUo0MmVlN0lWSG9acEhDbk5HM0tzVG1BTEY5UHhzdXEwNkpI?=
 =?utf-8?B?V3RHMFhQbHB6bmZaT1dBQjB3dmFnUXpjTXZSbTFiclViQkRVMWhyYlBTV2Ft?=
 =?utf-8?B?WlZPUDltRzlWcjdxbE93K3lKckRzemFVRE9DR2piWHpDY3M0RXFzQmNsV2I5?=
 =?utf-8?B?cyttZjQ5VHNzOUVUempQV1NscW4zcWRVZTgxbFZ6dlVvcms1bWFQYURUZHZk?=
 =?utf-8?B?WCtOSTRsWm1BSjZpTVN6K29LVTI2a0dXeDFkVWp2M2hVNjgwcnJrU0sxcXlR?=
 =?utf-8?B?NUJXcEthbWRxZ2VhdHdzNDdrVXFPdVI2clFWT3k3THRLKzVpajd6QVp6a0dm?=
 =?utf-8?B?MzFaSGJpK3lQWllOYVpwayt4UW01aC9pVXlUejdyVGREc0Nrdy9RWmJHTWFT?=
 =?utf-8?B?bHlXU3BPQUVrNG9Ddmhpb3ZGcmZTTzRoNFA4bzZZejBRVEZUWk9JUXMrVkZw?=
 =?utf-8?B?blg2SlZIK0MyTnA4RTdIblFzL2NQY1BscXBDYzBNbm5aV3grMVFTL1VsanpR?=
 =?utf-8?B?SDlQK0xWK25zdUd6dFdOOUxHbE9ZanFQUGtDNDRjRitsbndlTjYwd2V2MWdH?=
 =?utf-8?B?SWVsKzdwOXUxaURpOEl0V2FTUkFMbzdONC9zaXpUMXN2UVVIS21LOUplcUJk?=
 =?utf-8?B?WEdVclkwQlZNb0JsNTNCT0VPNjQ4alh1L2pZcEVYT3FOL3RvSWp4MlpGYVhG?=
 =?utf-8?B?YSt1Y2tKVTNUUlIxczVXM1UzTWJwV3VnSTdVclU0V3VycEtMZnNjWlJlQk5i?=
 =?utf-8?B?WWIreVZGdHVuZHlHZU9MZGlQTEZkaUM1N2g0YWN3R2ZJUS9ycXlqM2pFZkIv?=
 =?utf-8?B?UjJzUzdBZE9uV0tZd3VFRWJwWFZpNE05c2FyZ0dIaHlVeStKbGQ2VUswSHE0?=
 =?utf-8?B?dDlJTXhzR0RZQ1plL0JTbnlFZjFNeGZ6VzBGKzRRaEgyek43U2RQUWQyb2lp?=
 =?utf-8?B?TG9iMHhkcDM3S3J2Njlkbml6dWVCdnhnOTBNUU5kT2NHQjFLSGswdWlTTXJs?=
 =?utf-8?B?Q0Nmc1lRa1ZnU2p4U3FNZUZ1SVN5UmdWNko1UnNEMFlnTC9pcC9kVzVHb0xm?=
 =?utf-8?B?Rmc3Y1Y5TEQwenBDSzdXVHo4R25zNnhBNm41dE1JR2Vvd3NqK1RWaUVYVC9u?=
 =?utf-8?B?ejVjc2xXRkRrT1FlK0dDRERrSFYzU2J5QmVrMmxJOTZIekt2U2pmZ2xTRHRS?=
 =?utf-8?B?ZVo2NHpZRG9LSG9kUGhEbC9TY1JtdkNRc3hCMlhLcGlSZkRCNFFXNU5xRjRB?=
 =?utf-8?B?UVBaVStIQnM3aXk1bXhIclZtZlhnMmxUd1VZalJaL0RMY1RCZHNiN0V3S0t3?=
 =?utf-8?B?YWh5bkJVYlk5b2s4Qkc5dXFLNk5ETi9nRlgxeXAyOXN6RTBab3FwWGZ5ZlpZ?=
 =?utf-8?B?TFpJb0Q2Sk10S3VZZDFFemNPMHZZSGhVNGJaTDZCcVQ1bXNFMThIREZOZFZJ?=
 =?utf-8?B?bDg5THNMcVdaUlhPZWVMY3VBRzNXN1RudWJDU1h4WVNheEUyelM1TExWK3Nl?=
 =?utf-8?B?Mk94SGtrL1crRWNadFgvREdwK3c0d2RMR3RlM2pYRWF6VFZZaGRremswSi9M?=
 =?utf-8?B?T0N1MEZ3VUNZdDBQSXBTNnBENnNNd3BtRE5iVHh6YUNwTHMyZXJrV0FRdlNo?=
 =?utf-8?B?a2xhdmp3aUUxTzcrd0xQTzVZTVd1dHlSRFZUSmRjUkZnL1lZbjZZNVdvYUZC?=
 =?utf-8?B?ejh6UFNSQTlmT24zMTdML2didnlvcXEzbVVCQkdVbS9uVnZKTXFSck0zZUhE?=
 =?utf-8?B?NlhseWpZSmZId1U4aUQyQkNDTkQ3NW50czRWZGVrMXRUVEI1MTVPY0tWK3hs?=
 =?utf-8?B?UXdYeEQrUWhPdVhkMWdQdkJicHBreHU4bFZnbW8remxmVjV3NjMxbVZFUGxX?=
 =?utf-8?B?TStteEh5eitBL1RodkRoTGhZN2kyZ2FoRlozNnVtdDNNdTVhT05rVjdncVRx?=
 =?utf-8?B?bVJ3TFdKWUEyU0tXUE5EWXVTT0dDVUpJVE5JUVJwRkZrcmZka09lUEJxaDRH?=
 =?utf-8?B?S2dXUkFXeGh5dGtKQ0daUWNrbFpncFdpQXlUalVubXEyR0tnS1hyYVdKcmhW?=
 =?utf-8?B?VWFNcTY5WlpYb3U4Ny9LUFlLR2E4MWtWSUtyemNpWHc4TEt1SHlsY0ZXMGV3?=
 =?utf-8?Q?FSPc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlYzUEdkVlRpWkJnd1p0d3k2VjNBTEhGVmxyc2MrV2FuRWo3S2c4UXFROGgv?=
 =?utf-8?B?N1hNZmhBMjlERDl1bTg4d0hIWXZlQkxxVm1NU1pKTXJMd1lWR1A5SmdVV0NT?=
 =?utf-8?B?bEJweFp2REhXM0ZEVjVNOUk0Q3p5Rnc4UWJjVWFKK0c4RE1temFxcnZSWXNE?=
 =?utf-8?B?WHkyd25JU2Vmc0pMUU14Z3JIaWhHZXp3TVhvTEFObFVnYXFkSXRnNmE4Yzho?=
 =?utf-8?B?eWF2MEN0QjFjUzJzM0U5NWZydlBpTlltaWNxakg2dlRYMFVlWE05VVhLU3NK?=
 =?utf-8?B?eS9jaFBHejNIVTA4Z3U0YlVMTzVVYjZkZ1IvS0E0WktqUmJ5TUFybWc5eEN2?=
 =?utf-8?B?YWtlQmJsUWxCVE95c1p5S2ZtTzdaeW5XZjhmYzZCWHdGTmVhMkdSTkRMQWlM?=
 =?utf-8?B?cm9YRC82RSs1TjJsa3Yrcm53b25DeUZUVWoxMVQ0Vm5qbjY2dHFTc3pHalI2?=
 =?utf-8?B?QTYvdlJvemMvRWtheXlkZUx6dG5zWnIwSGFiMEdGK0hFMkNUSkZVS3Yxdzkr?=
 =?utf-8?B?ZitvdFBJWEdVak5Tb3RZRkNsaDVkeFpzSlkvcUtzVkJodjA3aU9Ob2lwejVs?=
 =?utf-8?B?SkJWVnpQSEFVNElEbTlWdmtaQWJNSnBodjhNcW5uRUNuZ0NJZklYVlFzMmxR?=
 =?utf-8?B?ci9KOHJsMnQyZlJscFYxYmZXUXpjWmVFclRlbzd4c2xKNm9raEFxY3JPbmsr?=
 =?utf-8?B?YUVOcDZPbzhhVEdQelBsazk3bS9XdWdBNlFZMFpDSThZU1llUVFRYWpIYzIv?=
 =?utf-8?B?VGJYK0Z0NGZFM3NENTZjb3RCV05RdlJ4d1NTKzhISG5DNi9nZFpaclg4SFYv?=
 =?utf-8?B?bFNIaGtEd01aajRGNFNwMHhiM1NrVml6M3Aydm5yWTJqclVydmZxdG1xWHNx?=
 =?utf-8?B?TmNNcVZQV2dpM1hKbG8vZDBDaU85TTBaQ3dQdkdTMGNWSGkvY1o2SkJNblE0?=
 =?utf-8?B?amVic3hQM0poUU90VE9GSTV6S3hoN2x5NjFTbGxyR2ZqcEhHenJ4eS82UHJT?=
 =?utf-8?B?QisvR0ZuS25EZmU4dkJRRXBTcTNJMWxCU1lYeGI5RkV2QmZJeDFWd1Nyd3BB?=
 =?utf-8?B?RW54S3lsTjBNRzBtWXdTTDA0Rk44ZjdkV1R0c09WYXd0WDMzV1J0NnlxbDNL?=
 =?utf-8?B?a2pnTUFMdzZrYVBwTHRqZnRtM3NjcldlQk1GRmxwc3dmeUg3R2xNT0VZMTN2?=
 =?utf-8?B?SnpaU3JPeWFTRE1hWmFkS1pSMEZzMFZwQ0VocVJ1RVdrSU1qejFMV2IvYnV3?=
 =?utf-8?B?cWp1VFp2TUo1T0FjdWd0eE8wNXdjdVNGNGQzT20xNytFM3VzcG0ybTJWWFU0?=
 =?utf-8?B?R3V2TW1ISGJra0duNWlHWDQxNkQ0OHdzWUNFTjQ3T1dRWWx0OGZkUUxyeGhV?=
 =?utf-8?B?eDlBTE9MYXdURzA0ZEZHaW4xalZKcFd1d0tzMkJ1clA1NGRlOThLcCt3Rjdx?=
 =?utf-8?B?dzFibjA2OStnU1FhWkJlMlZvTFpZREhKczZ1MGRWMm5nZTZraHRFMS9Na0Ur?=
 =?utf-8?B?bkEydHJmL1FpWXc5S1BDWFl0dkJ2S1BtNDczUWN4amptN0hRYVhLVDVRWHRX?=
 =?utf-8?B?NFJyRDJmMjNHNUZ6endqMXFJMkxJU0RYK1RScHkvY2lkTXprZmhPRFpCTHM0?=
 =?utf-8?B?RW5mM2Ezd0xVQUdXVnJNUHJFTnlOSXo2a05TbVBMb05zS2VFSVJrOFpGdk8r?=
 =?utf-8?B?QUYrdWRtT2hybThDb0Fna25WMnB4OVRkSEZiV0JuMjRXSXJjSzVHMnB2VjR0?=
 =?utf-8?B?Y1NnSHRHVTdrbnBjdGtaMGdMVlhoaDNVemQrYkM1cS9iMkNFaVZxdDJBMi8w?=
 =?utf-8?B?NHZRNlJFaUZBTTVFTFBIYVFyemZnb3M5dWl3djBhTkNZdEl4NStWUVRGTy8v?=
 =?utf-8?B?R0FDL0RZTmJtQUprczU2QWNobVVlaEFhQkdyNERmMW1hR2FjdDFybnVLb2Ey?=
 =?utf-8?B?VWR6bGd5M3QvVzY3bkNrQWdVYVZ3b2t3Mkk1RkN6Y2VSaEFIRTlLOTF1MzU1?=
 =?utf-8?B?NTE1VUhRRGR5Vk12T21yU2NFdFpGSFB5NzR1bllhcmhQa3dEc1pDWDB1N2o4?=
 =?utf-8?B?U1VkcDhVdGczb3prRHMyUVZhYUtkR1JRRm9kcXRuenljcW5JSmkyZjFZRGZW?=
 =?utf-8?B?UjV0cEU1Q0xkajk2TGhadnpBd0dwKzVldGM5cE1zR1ZlWDJuNThQRVZmRCtP?=
 =?utf-8?B?VTkvVTMzSnIzNEZwU0NNajkvUkFyOHZBNkpMSlVKcmUvUGd6TzVGTDdadkcy?=
 =?utf-8?B?RGlWQklqMzZOV3pGTFE4YWpoakdoQUFhSVpLV0pYeTVqTTNROERIeW8xMDFB?=
 =?utf-8?B?UytQT1Bzbi9JWlgyUjVRWVJFVTFyVE9tK2pWL3EvSUFiWDBpN1BOZS80Tkdw?=
 =?utf-8?Q?fvgTjqezLw8BTVCb/+uu3gQ2kyFpj98DlyVduIAnsJ5sS?=
X-MS-Exchange-AntiSpam-MessageData-1: YRxJEkJ1QL1pOQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0330f1c1-1a95-4c96-da3b-08de5e75d297
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:02:07.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbilwJ8314U+FiJTU70F2xjYIYQTnvc98YRQJED64+TsMWeP73i9LHAqHVAKuZFMmo/D2bjKfiZ9C2bbBmkMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442

On Wed Jan 28, 2026 at 1:33 PM JST, Yury Norov wrote:
> On Wed, Jan 28, 2026 at 10:23:36AM +0900, Alexandre Courbot wrote:
>> tatus: O
>> Content-Length: 4095
>> Lines: 108
>>=20
>> On Wed Jan 28, 2026 at 12:02 AM JST, Gary Guo wrote:
>> > On Tue Jan 27, 2026 at 3:25 AM GMT, Joel Fernandes wrote:
>> >> On Jan 26, 2026, at 9:55 PM, Yury Norov <ynorov@nvidia.com> wrote:
>> >>> On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
>> >>> > On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
>> >>> > > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrot=
e:
>> >>> > > > Add a macro for defining bitfield structs with bounds-checked =
accessors.
>> >>> > > >
>> >>> > > > Each field is represented as a `Bounded` of the appropriate bi=
t width,
>> >>> > > > ensuring field values are never silently truncated.
>> >>> > > >
>> >>> > > > Fields can optionally be converted to/from custom types, eithe=
r fallibly
>> >>> > > > or infallibly.
>> >>> > > >
>> >>> > > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> >>> > > > ---
>> >>> > > > rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++=
++++++++++++++++
>> >>> > > > rust/kernel/lib.rs      |   1 +
>> >>> > > > 2 files changed, 504 insertions(+)
>> >> [...]
>> >>> > > > +/// // Setters can be chained. Bounded::new::<N>() does compi=
le-time bounds checking.
>> >>> > > > +/// let color =3D Rgb::default()
>> >>> > > > +///     .set_red(Bounded::<u16, _>::new::<0x10>())
>> >>> > > > +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
>> >>> > > > +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
>> >>> > >
>> >>> > > Is there a way to just say:
>> >>> > >
>> >>> > >    let color =3D Rgb::default().
>> >>> > >            .set_red(0x10)
>> >>> > >            .set_green(0x1f)
>> >>> > >            .set_blue(0x18)
>> >>> > >
>> >>> > > I think it should be the default style. Later in the patch you s=
ay:
>> >>> > >
>> >>> > >    Each field is internally represented as a [`Bounded`]
>> >>> > >
>> >>> > > So, let's keep implementation decoupled from an interface?
>> >>> >
>> >>> > That is unfortunately not feasible, but the syntax above should se=
ldomly
>> >>> > be used outside of examples.
>> >>>
>> >>> The above short syntax is definitely more desired over that wordy an=
d
>> >>> non-trivial version that exposes implementation internals.
>> >>>
>> >>> A regular user doesn't care of the exact mechanism that protects the
>> >>> bitfields. He wants to just assign numbers to the fields, and let
>> >>> your machinery to take care of the integrity.
>> >>>
>> >>> Can you please explain in details why that's not feasible, please
>> >>> do it in commit message. If it's an implementation constraint,
>> >>> please consider to re-implement.
>> >>
>> >> If the issue is the excessive turbofish syntax, how about a macro? Fo=
r
>> >> example:
>> >>
>> >>     let color =3D Rgb::default()
>> >>         .set_red(bounded!(u16, 0x10))
>> >>         .set_green(bounded!(u16, 0x1f))
>> >>         .set_blue(bounded!(u16, 0x18));
>> >>
>> >> This hides the turbofish and Bounded internals while still providing
>> >> compile-time bounds checking.
>> >
>> > I think this could be the way forward, if we also get type inference w=
orking
>> > properly.
>> >
>> >     Rgb::default()
>> >         .set_read(bounded!(0x10))
>> >         .set_green(bounded!(0x1f))
>> >         .set_blue(bounded!(0x18))
>> >
>> > is roughly the limit that I find acceptable (`Bounded::<u16, _>::new::=
<0x10>()`
>> > is something way too verbose so I find it unacceptable).
>
> I agree, this version is on the edge. It probably may be acceptable
> because it highlights that the numbers passed in setters are some
> special numbers. But yeah, it's a weak excuse.
>
> If it was C, it could be just as simple as=20
>
>         #define set_red(v) __set_red(bounded(v))
>
> So...
>
> I'm not a rust professional, but I've been told many times that macro
> rules in rust are so powerful that they can do any magic, even mimic
> another languages.
>
> For fun, I asked AI to draw an example where rust structure is
> initialized just like normal python does, and that's what I've got:
>
>   struct Foo {
>       bar: i32,
>       baz: String,
>   }
>  =20
>   // Your specific constructor logic
>   fn construct_bar(v: i32) -> i32 { v * 2 }
>   fn construct_baz(v: i32) -> String { v.to_string() }
>  =20
>   // Helper macro to select the right function for a single field
>   macro_rules! get_ctor {
>       (bar, $val:expr) =3D> { construct_bar($val) };
>       (baz, $val:expr) =3D> { construct_baz($val) };
>   }
>  =20
>   macro_rules! python_init {
>       ($t:ident { $($field:ident =3D $val:expr),* $(,)? }) =3D> {
>           $t {
>               // For each field, we call the dispatcher separately
>               $($field: get_ctor!($field, $val)),*
>           }
>       };
>   }
>  =20
>   fn main() {
>       let foo =3D python_init!(Foo { bar =3D 10, baz =3D 500 });
>  =20
>       println!("bar: {}", foo.bar); // Output: 20
>       println!("baz: {}", foo.baz); // Output: "500"
>   }
>
> Indeed it's possible!

Oh yeah you can do all sorts of crazy sh** with Rust macros. :)

>
> Again, I'm not a rust professional and I can't evaluate quality of the
> AI-generated code, neither I can ensure there's no nasty pitfalls.
>
> But as a user, I can say that=20
>        =20
>         let rgb =3D bitfield!(Rgb { red: 0x10, green: 0x1f, blue: 0x18 })
>
> would be way more readable than this beast:
>
>    let color =3D Rgb::default()
>        .set_red(Bounded::<u16, _>::new::<0x10>())
>        .set_green(Bounded::<u16, _>::new::<0x1f>())
>        .set_blue(Bounded::<u16, _>::new::<0x18>());

Without having tested the idea, a macro wrapping the whole bitfield (and
not just trying to create a bounded) looks doable. Of course, it would
have to rely on some underlying mechanism to set the fields, which could
be the abomination above, or something a bit more convenient.

It looks like we are converging towards introducing the
`with_const_field` setter for now with registers ; when we extract the
`bitfield!` I think I would like to entertain the introduction of a
macro close to what you suggested above.
