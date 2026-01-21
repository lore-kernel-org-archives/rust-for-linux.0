Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011070.outbound.protection.outlook.com [40.93.194.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6324337B;
	Wed, 21 Jan 2026 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001240; cv=fail; b=d5PDORDdlYRnLTuqAmNdzMuqUaKSyjdgiHSx2496CivPrGxUDcaBk3mitgukZKzvRTV6mm6gSCIWwVnZehSVe0V9QsHEWaCcZPTdlZMD7JkAC6KMXWmlXxi97WOKdwHa4pmLsDk9sKVbib+BJot+nDNhe761/DY3g9pLDgm5wfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001240; c=relaxed/simple;
	bh=VVb0+X0INftvKKcrveguCQoUdS76pBKNCS14OXnxWuA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GZdrl3+q/YrXAeG4C40g3dpSXe2O3Aw9vA/qi0Tzt97XimWy5mf8EcaGHsb78eIz64uZJ+WoIQCP77Fp5d7338o9zNy3ASsCxtA5ANKGTTkNsGo4YFgVuU9QNyoZY9QsM+ZoXXZhdayg/OccW/bDBfkFfbNOKjaEBnEY7uqW+NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oThUc2jz; arc=fail smtp.client-ip=40.93.194.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oThUc2jz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQVniOwWIabaJVFKSnKrjfK8Dftvzne3L6tBnBOcdaDcAqzCOeB1k2UM1Igj45BV+8gQBr9/DcWTS4+Cmjf2mpU1pXa9uiKuz8rNCJyM3mQASPJbi0UCQrI6O+yHuqAWP2AvJtxY4I6Ku7kdGdUN0/ajkRCU2b1OZgYONFz42LowzQVJLhr+UlCAidsKTnsbgBtyb6VHdzfrBSZPcOgCf2GXC0m4Q8AA0NSubQxR0VmY/uKBQm7dbzsaR7ahHfqU7nkYfc6UBjwUJMn3xSvmmWJgVBs8hTyffI4M3ULuIc1ibTxJKJMvkbhBRLzcqMBuPv9cxa80WBtUCr9yEPksOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snHdqtI+VBT1VGrEvYNMi2kUI3Imt4PvTwaqYk5fKzU=;
 b=x/VrMWbyGPMB4J5NgO+yMa7jMzYkc11/UKvw/9brGaJgCLXdjnOjpXhUuA7QFDBMhjqOvk3hCW1o88tT4r05HBOwUEPMc2kZontbC+mXcOKU3n/soqN0oxyVw1lH8NKzT0nZZHLwd/zx5CfZrQMpTShwaSI1YBHwII9khRG05LwUEdl4jkP75Trj+U879aCsI+Pc4WAegYnDaBjVhOo1ArFoqzDo1FJDqEdyS/cobLllHDXseiZsob1I6J5MgdisTuoX0tC4mugP47vBe0CwVJffp4Crrox0KAd2w+o0aIxFdHcWXBbUgx7JN0q5D9hnHIMdLtaNSQP14V1Zxz50TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snHdqtI+VBT1VGrEvYNMi2kUI3Imt4PvTwaqYk5fKzU=;
 b=oThUc2jz1qJXYYiXwwVjDfvgBWKxHAz049m1aKG7MXFdlQOC7Ud1e8Y/nOx8/bvhcR7v3LmrtKPxXiqL+qyP3KjL62j3ewrP/aon+6bZ53+5RgmEmUJWA/kWZhH0JTrBj5DaMCO21CfBeJ62l2U92q+qHMQLj8ZvfwmLjLa1vT2UgNsFltg8qHA2ZijnzBwBse60wExo5QJiZDCj5SE44BANZbXLPR+JMoFxnjxt1VHcML3EBbkwJXVUu1pcIPJLdjdLSHZD0sVGZvCDH0vaac6Yb44ywH0LPN4tnbl89YXE93tIr4pfwJbWu5Q8dPHqitM6VwiscKn5t/qO+lzP3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8647.namprd12.prod.outlook.com (2603:10b6:208:480::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Wed, 21 Jan
 2026 13:13:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 13:13:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 22:13:51 +0900
Message-Id: <DFUALMIOT3N1.8QCH5X7RKM4O@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8647:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c79a64-1b26-4099-fa03-08de58eeedc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVBMTm1Da0UzWWhuYmFBK3lOcVFsSHVKOVhjYXRQVjU4SlNPMm54RjhZZVJ3?=
 =?utf-8?B?REdFdU5hV2prWUFIbzJ6R1hZamlNUk9CbjBNeGU0RnFMNEZjaWsvMkZsbGtx?=
 =?utf-8?B?M2p2bkV5ZlBPN0tyNFluTFNsM0Q3UXB2cHB3T2k5eFZQZ2N3ZjdDUHVaTDFT?=
 =?utf-8?B?UERSNTBYd1NEb2oxWU9YREdPN1lnWEd3RG5Ic1lrM1FEaGNDVlZMS1B3VHo3?=
 =?utf-8?B?RXNSUURKc2w1U3hEd2xKalpmbWFWclJkbzRielYrU1VLbzNZZ3greWhrNzBl?=
 =?utf-8?B?aWllYXduclV3WDhNNlFQbkVLQTcxL2N4ZEdEazlvS0ZCQXl0NEZrR2ZPZHBJ?=
 =?utf-8?B?QzRmazRRdEZNc3M0OFBZOTlkRVgrK1ZGdGNyaC80NUF2YUlzdXlWUVBlUC9Y?=
 =?utf-8?B?K2w2a1Y3OEovb0RXMjVod3c3ZTR2NkxaTzVFZU1TKzdrbmFFWk1oOTVYclBE?=
 =?utf-8?B?cldVUWRoQXJsQzFmLzJTdVF1NDRuVHVEbjNCSnRPNGl6N0RpUmpGTzRpOCs2?=
 =?utf-8?B?U3pYRUF2MVc4RTFpOEJQYVc1N2Z4a05QWjl0RUhHb0tpWGVyVEJLdjJHT0Fs?=
 =?utf-8?B?c3V4RmMrWmFyY0ZKamwxNlhFVW1jVEhWZVF3aXRzWlpRaUZuMEJVcEIwa3Ji?=
 =?utf-8?B?WDFiNVhZVEZuS0FmR2RFMlFOUHFUZTVkdEhOT3c4MHNRNHRsMUVLRE1sY1Ni?=
 =?utf-8?B?UjQwNEdBOU9QcXpGMndUd1BzNTZKcCtqYUFWNmV4S2laSS9aN1VoOW8waGJw?=
 =?utf-8?B?L1d5dlRHZUplcWxvZkxjelorY0RNVk55Nk1pQmhoazZkYlRESVdzV0dFUTM1?=
 =?utf-8?B?Yk53bHplRElWbnNwUEdoL1dtbDNqOG1rSkwzV1crSzdOQ2l4WDVyMjhrcE9X?=
 =?utf-8?B?Y0V5ckJQdG5Nbjdhbk9teGppNjIvSmZUczl6aGVQaU1GTGpPMXJsdHRYTVhI?=
 =?utf-8?B?R0NHNHN6NS9XdW5jSTh2TEFIc0pYM2xJMDVWM21zdFBXNTJLL3VXNmVpdUts?=
 =?utf-8?B?WXFzUnUrNmpDTFpiajcxSWxra3FKaTZpSWZ5eU9QTmVlS2ZtMDB2N3k5Mnky?=
 =?utf-8?B?U3EyUnk3VU45dDl0eFNCR0U5WkY0TE9aeDlueE02T20ycmw2aWt1UzdPRXQ5?=
 =?utf-8?B?dXVDaHpCNURicDlyYjZ2aHBKM1dyK0wyVk9QN3BCRkFjQlpJMDJwbm9HUWd4?=
 =?utf-8?B?MFg3WENDQnhZQ1lGd2RadzgrNjh3RGszWk00MlpXVHdiOUJSd3RiRHZJdldD?=
 =?utf-8?B?eTVmbmcyZTBMVnVnWDNFNVFqOFFLUFNEUnF6WTd6RHBUbGU5ZXVDZGw1NXZ0?=
 =?utf-8?B?aDhCQStEWThWRjBrTk1QaWFYdEs5RDJuVGdaa3U2ZkFEdXRMaE5hdTZqWlBS?=
 =?utf-8?B?WXY5Sk5wdk9rV1NCNGxKRWVLZC9YVnN5VlQ4dmdNQTFSNVA5b0NLeVBuSGx0?=
 =?utf-8?B?bmpUKzFQRlQ3b2F0Smd1VXJvcXRKWWZDdUZWeFdtSkY1dlpXcW1TUjVpTkNE?=
 =?utf-8?B?alhuQWlUSVhMcG4zZGpITVl5dXRVcjJ3U2FVVHg2ZG4rbFNVYXlxdVNJY09a?=
 =?utf-8?B?SXhVOFYyZFJTUG9lMDdBVy9kd0pydjJvNWJFOGY0K2N0bUtJN1RMeGNpU1lO?=
 =?utf-8?B?RGo4Y1JiRUlYdndaSk9LZ244MTRIM3hObWtzNnRZODd3L1B3NnZtZk84VEFG?=
 =?utf-8?B?TzY4TFJKZG56dllGS2c0RE1FaDZaSkJMR3I5aGN4bktneHR6bUVsUXJaRkNL?=
 =?utf-8?B?Ymo3M3VKQ2U3OGE1Slg5TlA3eXpEVDkwNGpMN2s1Q3A3bStqeVhkaFFicEQy?=
 =?utf-8?B?ZU8xMzVjaXFremExUkVXa0lFVEFzMXBybWdtQkwrNktpRGg1YXdlSjRPY3dt?=
 =?utf-8?B?Vit1VUF2SEZwLzhOVk9ESCtzTC9IN3lBVjg5MFJwZTVwQ0xyOVcybXRTNHFL?=
 =?utf-8?B?VWdRZ0ZVdkQxbGs1akJYOUs2SmNBQS84aWRKYmZZeE5tbjBKS0ZjNkZqc280?=
 =?utf-8?B?N2Y2SGxTdnA0TWl2aDdxZ3ZRSDVqTmtBSU5wMVVYUEw2NXo5S2ZTWEpxVXBD?=
 =?utf-8?B?b1IvR051M2lHbk4xU3RobGdRcWRSdjkzSmdrQTJWSWpBNGdaNlplRzRTOS90?=
 =?utf-8?B?SzdLdWZZVmlmZDRDSVFBTTBXbkNjbFhCY2pIRVJncU5NUlJPQ1ZYbVY1ak9G?=
 =?utf-8?B?RXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFVrZDMzYkpwTkRrNmNNTnBSV1BmbTlVK2gwZmtsendTVjdvbHRoMVBPN3hU?=
 =?utf-8?B?TERlekcydkNoenpVTUhWVi9ld1VuSkNyb0llTzJhWmRFRTFwOUQxZFZITjJl?=
 =?utf-8?B?VXkzVUNESTJ4RFoyOTBOTnZKREpydUViYUpWcU5Xa2dweEdRS2pMVXQ4QWov?=
 =?utf-8?B?NGlqWG1QU05lVjB1b21Rd3p3QXpjdkZRQVhIWTgzdkJMTk5pczhQaTFXZWNR?=
 =?utf-8?B?MVlWenpuNDQ5QXhRTG93dm5UUEh4MDZsWVE5aEFYd3NOTDNXZHNCeXFETEk4?=
 =?utf-8?B?NW9ZL3hDY3lzSEdlamZ6bXRuVm9Vbzl6TFpKbWY3ZkNNcm9QaVZyTkw2cEJY?=
 =?utf-8?B?Z0pzTFpWdFdPUXJZdlZ0Y2NlWW5zUXN5T2pBZ3Yrdis1eUI5SG9GSW04N1BP?=
 =?utf-8?B?Y2ZZTnRxQnoyN2o3MXB4R24zZDBaSVFnaE5rdDhkdGk1VW1DcmhHUUIvNlBO?=
 =?utf-8?B?MGdzSXl3ckxmSE41Z0RNaWpNZVN3U2VzT1U4WkRNbitsTERzSVppeGJrMEdY?=
 =?utf-8?B?UHlCdTEzWnRuQzhoZnVuUmp1SkxUbmFCRXFqeXlqOW5hRXRFcjdtLzVhK1R5?=
 =?utf-8?B?bGtnUnJneHJnOFJ2Ui9TeGw4RUZXdU4wMVg4NXpocjhZc0NjKzJ2RlR0SmFo?=
 =?utf-8?B?SWZtbnNqZDNFOUwvYTFMc0p1VjBuQzd3dEk3Y3hIYlpIYTZmWGJmTUtwemdY?=
 =?utf-8?B?dC9Yd21Fd09QMXNOVko1OHZJUUdHbDJacU5xa0VoYjV5VVNWRHNNT1V5WWFT?=
 =?utf-8?B?MTM1M1Bqdi9nZGJzTGJCREtXblpoQmV4b0dMRml2SnhNVUJjNGllTUFHWmdL?=
 =?utf-8?B?Y0s0RVhaaS9aMlBzMVRtOW9pd2NmY3ZyZm1qWEdYTkFXWDQ3dVVGUzZoL0NV?=
 =?utf-8?B?elJBb0dlMlk0a3ZNR0NqQ2J4OWN0Q2h6V2s5UDRwaGREWEVpd1dseWZKdzlC?=
 =?utf-8?B?SHNIdXJXSyt5dldnT25xZDBPRzJYNzdqaUd1RjdzaXRUVUpaUmh6R3B3cUdN?=
 =?utf-8?B?MWprVEVIMjg4MlErZGJGandNaXUwS2lBV0VSekVTL29DTnZaMlRoVHJRVmY2?=
 =?utf-8?B?SmhxR1M3ZGl2RzVRNks1WDF4UlNUaXBobkpaNDJySWNVV1IzUVd2OHFGWHIx?=
 =?utf-8?B?NDJjQ3pDdUhRNlFZTUFtU09Eb3RwRXZzVHY3aGZlWXlMckVWbzZyNFZjV0V4?=
 =?utf-8?B?cHBNQmxBVE5udlRzREtDdDgvUkVEMzZGY0JoZjlpVmRCdWhwaGtoVDhPazdV?=
 =?utf-8?B?OXZ0RVI3M1U3dU0vWm1xdEVrNlgrTDNnaEg0bGVRMU5LM2xVSmNPbU1pMkFR?=
 =?utf-8?B?b3ZwbSs2N3VVUjk3RUp1Q2NsY3RPY0lldGpVanFET3VUTlJwc0srTkpldGRB?=
 =?utf-8?B?Yk5tM09PVFlXYXUrYzdRM0N3U2xxZXhlM01vUGxOMGFibE5yY1Y3dnYrV0FK?=
 =?utf-8?B?c2hIdjk0aWc0V21UWkU3U1daa2w1RmNUT1pESHJCMGEzQTdyMWlYdUk5anpl?=
 =?utf-8?B?ZzVKSEdOcExXOUhLVmtJYm4ydm5xVDVsU2ZJQjFWZ01WUk0wV1Irb2xWWEMy?=
 =?utf-8?B?UXkya2ZkV3RHRmRHVUs0WDJaY1J1MGJRSlJzWFU3WjM4S2NRd1hpSHRoL2h4?=
 =?utf-8?B?MTRGUnkvWks0cXBqaEM2bUE3b2RtREdUVnRRNHdoT1Z3T1owU1lTWGhMa1Mx?=
 =?utf-8?B?c3ZKOGQ4cEZ0RTdlcjl2SVJhVVdDRXdCWDYwZVpjUm96b1FNd09GandwRlI5?=
 =?utf-8?B?SUExalBNekZLRmdITkJRTmI0dE8wd1pYRDVxOWt1YnNHRG5mMzdnRDNMZGVs?=
 =?utf-8?B?NC9USkZ2RnlLQlRiSGoyV0dZby9rbGJNKzlYeTI4LzlSRE5xbk1VR24xNEVy?=
 =?utf-8?B?Y041eDY0Zmg0Y0M0RXovU0dudHI1clUrcVNIdmtVQWQ2Mkl4S0ZiL3RYV2Fx?=
 =?utf-8?B?clExTUdoemJycVAyWGRPUTdVMVhjMEFDNFhYaVFiRngrTldQelU4ejdGMnJw?=
 =?utf-8?B?VmZ0T1ZqSkNyazVBWXJSWHF5WXJVb2dpQ3NBVkV5Ym5qSTA4cnJ0K2lsM3ZR?=
 =?utf-8?B?ekI5dm1FWXNMaUJ5Q1lRaXRmYmhFamJvbzREM0ZrcG5ZekNkUmZlL1ByVUZK?=
 =?utf-8?B?Y3J0S3BwT3BwWnZUaENNYjRTVW41QklQTXh6S25KZnhjVjE0RjN2RFZpajRa?=
 =?utf-8?B?ZjVTTlp2WXErcVNTZkRJUVNWSFpQRGhpUjdjMk5iVFNtNnQvMXl5TVZXaEVV?=
 =?utf-8?B?MHBMR0QyMXVWWWJFY1k5RkpkWUNFL1ExWUhvZ2MxMlRsVHI1eFVwK2ZLazdJ?=
 =?utf-8?B?MWtyYUFxc1ZNbjZvaE1LRmhxUDFDc2tQTUNxdmFRdHV4bTlBVkJmMXFtVTJu?=
 =?utf-8?Q?P9yQDYMaO5xoxntqPHZJucO5Wfe7GY6Hw8YyMafv6ePOk?=
X-MS-Exchange-AntiSpam-MessageData-1: daYFoJ4oN/1YMw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c79a64-1b26-4099-fa03-08de58eeedc5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:13:55.1890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABfepUeKh0YQAmEOxo+CmTBMbClW6/aDE53xsfYkJKOpHNAmTrn4/VJ6hrztGVOZ7Ts85V11yLgT6wqu8fxprg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8647

On Wed Jan 21, 2026 at 4:23 PM JST, Alexandre Courbot wrote:
> Add a macro for defining hardware register types with I/O accessors.
>
> Each register field is represented as a `Bounded` of the appropriate bit
> width, ensuring field values are never silently truncated.
>
> Fields can optionally be converted to/from custom types, either fallibly
> or infallibly.
>
> The address of registers can be direct, relative, or indexed, supporting
> most of the patterns in which registers are arranged.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs          |    1 +
>  rust/kernel/io/register.rs | 1198 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 1199 insertions(+)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index a97eb44a9a87..eccaa176b6b9 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -11,6 +11,7 @@
> =20
>  pub mod mem;
>  pub mod poll;
> +pub mod register;
>  pub mod resource;
> =20
>  pub use resource::Resource;
> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> new file mode 100644
> index 000000000000..e414aebe4c86
> --- /dev/null
> +++ b/rust/kernel/io/register.rs
> @@ -0,0 +1,1198 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A macro to define register layout and accessors.
> +//!
> +//! A single register typically includes several fields, which are acces=
sed through a combination
> +//! of bit-shift and mask operations that introduce a class of potential=
 mistakes, notably because
> +//! not all possible field values are necessarily valid.
> +//!
> +//! The [`register!`] macro in this module provides an intuitive and rea=
dable syntax for defining a
> +//! dedicated type for each register. Each such type comes with its own =
field accessors that can
> +//! return an error if a field's value is invalid. Please look at the [`=
bitfield!`] macro for the
> +//! complete syntax of fields definitions.
> +//!
> +//! [`register!`]: kernel::register!
> +//! [`bitfield!`]: crate::bitfield!

Oops, I should remove these references to `bitfield!`...
