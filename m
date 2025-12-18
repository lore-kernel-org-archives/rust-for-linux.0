Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F943126B6;
	Thu, 18 Dec 2025 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766056075; cv=fail; b=Af7gmkEmvhIa2k6MLBI+7kLJXvdb/JTJM3Z5cL7lUzf97UFiv5eGO0fzG/WBCiLw4yyhtEBRJ3DhhvHk3iPspgUC//9hjKkcv/4QAKA4dG6RrgH7tA1G1kgaL4GDVJ7QMxwti+udTIBhuqk/RFamMr08Ab7kZ76BsHBUivCD7SI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766056075; c=relaxed/simple;
	bh=S9UGzObEfBJzbmsqlUPNH3qElpjXu/0V+w/0Xw58VE8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ls70CmQEZXWjs0UT6JtNBq3H6ll8KK1VvsBzqGufa/WWWxh8C+ULeaW9SiRc+TEVXHhOq7W+Hi37hNHqOMAV4TBxQo3WmU2E/IAv7hDfFhhrYQbgAatkfZ928O+TbyA8FqUwe287qvpEpL5TZbGMwpZC39nvif92whbFvGGG7jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FczdJFkl; arc=fail smtp.client-ip=52.101.62.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FczdJFkl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rkj4/FuOJAAht4bz/Sy75TTUfoVFCaltqmpx+7bv7YugAU0viqsCzMl/WX6fur1Xl2l4BYKVp5yncTL9OxaZIs7NKVGEl06j6WwU5mggkkUW4q0w/O6YRvUluOp3sP3TKK15KpO9Uc46lPhVJv1R0UyiBJ85RfaWUdhzvTWjzkQ53aN3lF4wvPbUwsi7UK/ttxQLa90yVmfBP2QKDY3RL3AfQgb/0XTjejjvmRXPK23Y1W4b3mHl3BG6mx1TrkvW/DhCY++Wxe3h8tM3/3rzJWQur2dPStO3PWNIUrIPoI+JptPv1lYYl15HZ3wDDyodnreDTRHAJzn9EYSYRkTwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9UGzObEfBJzbmsqlUPNH3qElpjXu/0V+w/0Xw58VE8=;
 b=siph207IaXLpZnNOtDdY66vZGTTpbDjrjNOETutfSRruRyz5P8FxxECCUKWhrgxkeM86AT6mM1CU4NFlmno95+MElGFhDPmcHhUvqvhE4yvpuQhMcb1gRdZes23zCG7S2RgWujAfM2FEkOmdeYixqNlNaEuZ+5flkrDTRGKgqf1bhMWa7O3fUGiWF+NWqLA9L5+lmZd2jFSZ4KYM3UHLurNkxramTpqQUCaPpINoZrmERi8QTo2wUFLivrPoEMK2Ar/N+UjAkmuI042C3AmgGVFu2uFunWyx/HRs3nUSvuZ9bwObpRIvtDtDh0cq7jVRgvLwSbPIB2OqAZOQXWtTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9UGzObEfBJzbmsqlUPNH3qElpjXu/0V+w/0Xw58VE8=;
 b=FczdJFklG6O+6/ikwtb897yKKNGyyj9ZDwfbVMBVvRWX1M7s4jautB9BHLubU6J4HWbmtzjLNK+mlf6INY9wVi6w8PLJXD/qJs7sVOJ8KamGin1iKp6kXhVXuwTDDYdAy1Qm8ykVF4MPx+PVMBD9DgQbGRyQkrTwV/GBmQV6WDabrKDhUmy3m8b+7PRoI6kcLmZ+k3Ahp3N/hPsw87sLl9LaHyFjUP67YK6zQMyhHBdQykd/UOrnfcc59leavWphLbSipYe0uouQkhGrtm2cB2Lwk3OdBZD2CWSlrksLy8T4gCET+MCja42lZ8gkV0BuvHi+MzcbkGz9IRYey8fJmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5800.namprd12.prod.outlook.com (2603:10b6:408:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Thu, 18 Dec
 2025 11:07:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:07:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 20:07:46 +0900
Message-Id: <DF1AMKK7Y8S3.NDQ6IJ5Z98JX@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2] rust: sync: implement Unpin for ARef
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com>
In-Reply-To: <20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com>
X-ClientProxiedBy: TYCPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:2::24) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fedbc52-3399-4ab9-43f1-08de3e25aefa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW9sZjRXMmd3U1c3N0FWWlE4ZFFVQlJJZUh6THpXblh2T20zVHM1cWtkTVMr?=
 =?utf-8?B?emFFbzNiU081NzlvNkgxN0xJTWpQaEg1U1hwaVhGQldzblVxa2RXM3ZNZmJZ?=
 =?utf-8?B?Z2FjZ0huTk40SEdGS0phZkNnK3NEdjRaemtEaEFsM0NnZWduTmVSTmZuTmRl?=
 =?utf-8?B?VnRKOFAvSnJsYkVjVUFrYzdoRHdIMFZDSWlJdUk1Z2xEOTB1d1UyTzRNTGVR?=
 =?utf-8?B?Y2g4UTRReWxKSnkzayttaC9TcnZuMDc4WFE2VWxYVEZiYnpyQnYzSFRLc3lV?=
 =?utf-8?B?ZmlNWW9UWWpVdmFUWE1RNVRERFBOTmdMVjNMeWhleVF2OEdVdlBsZEFjcFQy?=
 =?utf-8?B?NVVGZUxyZHdiaDMvQlFtdXhuN3N5Z21Kc0xGSFM0dVFHYTIyRHUwbFZ3dGx0?=
 =?utf-8?B?dUgvMTVPRnFqZkw2bVpUZmo5QktMV2ZXUzZhblpjYzVwVXVjTE5reW55KzUr?=
 =?utf-8?B?NkFIcVdQczlMZTJXaXdoM2Q0eHdValVza09Ub3JELzY0SGhXbW4rNmUyVUxz?=
 =?utf-8?B?U29jUnc0Q0NZV1NHcVZmYWZwazBHVGRhLzRaV29IbkV4S3VMNVpvWDQ5bnR3?=
 =?utf-8?B?Ri9CaGw5L29pMWVZaFlHWmxHMDN3NGwwVFlVT0R4cWxTQ1hyM2xLYkRpWVMz?=
 =?utf-8?B?SzUzbVA5N2hhcnlaekdqU04wWlQyQVhEUS9rYmJkWTA3R0IvVDhtWmxMZkZU?=
 =?utf-8?B?V2JCcXlPL2NSdFZ4SGRuYVU5Y0xzcGllL3VQY3VSemIyTjI3dTczTjlKb0pD?=
 =?utf-8?B?cytOOTAzaFF3aXlTZzNvN0ZZa3QzblZBdG4zT1VpOUlBQmhoWDBCSUIwNjRv?=
 =?utf-8?B?ZVAvaUhLRGthZXB0RzQvQnBJS1RxYzE0bnlyMEZSWWxjZmpOTTFsVmVzNisy?=
 =?utf-8?B?Mk01V0w5SE5Kd3ltcWtyLzJhcHdGTURRaVEvK29QbzB5T0RFcTgzbVFFNnI2?=
 =?utf-8?B?RDlSZkE2OTAvNjFlVGpMcXZOQzdTNGxYa01pMGZEeVFsa0E4TG5jQmdYR3Fk?=
 =?utf-8?B?d1EwQy9jbWEvV1dheGpKbW1GZ21kOEVvMEVZZDFpOTFoOVIvc0Q0eGxkSjNI?=
 =?utf-8?B?NWt5OHAxMXFtNjZvVlVGM1BmRGlEN1RGanJ2SVErQ3hIZjZHeTlBRlhob2NC?=
 =?utf-8?B?a09NTDFUSmpnWFJxcC84WjdzTytuSGlDRk84OCt3YlE1dm8rYjFYcFNaaTVz?=
 =?utf-8?B?T25XTDBqM1FOcXpRRm1lZHN6OTh5MlNBYTN0b1lyWVVKM0J2UHZsUUdqKytm?=
 =?utf-8?B?VnpaSi9mWW1kS1pyYTQwSG5IbTdiWjFMMUYzNXFwSnZQMmhlMUdIMFMzbTZG?=
 =?utf-8?B?M1dPSWtGOTE0WTJjbllzUDVkaUYyV2JEMDVoV0w2ek9hNkppOFRDS2krTEF6?=
 =?utf-8?B?SWJjdHRKYUlXcks4Ymo3cndPNDlWWk51Q3RCTVFiRElWL0ViL3E2aTR6SVVV?=
 =?utf-8?B?SnVQYVlyWTZvSGRHWkp1V2FiMGllN3p2Q3R6QlI0V1FzZVQyL2NlR08vdVkx?=
 =?utf-8?B?c0NoNlJxbldxcXcrS2dMcm92eGQ3OXFiUERmMytJbmh6ZHVkWXpRL0JQOStR?=
 =?utf-8?B?dmZqY1VzVmJvTmFueXhTZEJxN1RzaFdQb1J0b3VhZTJsby82NXpyTlFxQjJw?=
 =?utf-8?B?NmU3eTk0TWNNdnZONTNlN1k3ZlRvNW5vSmZjV0Y3VittZ0NKcEZUcEZVWlVB?=
 =?utf-8?B?cHZmYWdraGlqS1JNWE9UMXpSS1Rqdk5sMXFkK0Rlc2taUFhXMGRPUkRidDdI?=
 =?utf-8?B?STU5WlJqWXFLeUt5Q21WZXVxbnpha0dsSk02cGVQMk1zOEE2bnU2SmRQaTFs?=
 =?utf-8?B?Qm5NR2FBYkY5WVdJUDFpMjZZU3YyZGxWRVMvTTVFcmdhQTJ5WVpMcHN0MlhP?=
 =?utf-8?B?YkVEcTJhSk1xUVRBVG5wTlAzTU85MXJsMXBzU0hLWHVGY1FMbGZRQnN5TzAx?=
 =?utf-8?Q?9/kTbsfyrZkH69No2sdSAZMFjAW1++++?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHVwN0xEaWlxV1IvSWdIelhHVzN1Wlo1bUJpcUNVRm1HeGw0Tk42RWxJbUNy?=
 =?utf-8?B?WXVXSzZ2UGRubmpYU1RkWjhmYzNXMVpKbzlMZXhzY3pudDRrZlprUGlvZmhr?=
 =?utf-8?B?NkpyMWR4anYrcjhuMzdLTit1aUVYS2VQUnZoVTRudndDdlk2UGFQTXBTbFhm?=
 =?utf-8?B?UmY5R2dobjJFalg3ZmNJK21VSTFJcElBSHFZdi8yb2QyRm9TazZxbmlzQUg2?=
 =?utf-8?B?RnBwOEErZFJORUlVYzB0a0pNblczc0lFVGdKRHhHaWliVGcvNG5SQW9xbWov?=
 =?utf-8?B?Zm1qNXNWNmpTMXJnMnA3djc1Qlhza2xIUEovS2M3TnIwZmRDZmh0K2EyY2Fj?=
 =?utf-8?B?SmVTQjJYdUozVkxZQmhBTlFzSEdjVTI2RHdzS0hNajhLS3Rzc2NOWFhyc0RV?=
 =?utf-8?B?UUZlRFJYUG9GUkxMcXpqNVNzOVJuSGI4MVlabC85bjVvbGVLWXNhTlVkWXc0?=
 =?utf-8?B?RVNzMkVzUFVLWUNFSUg0a1duVEQ1anVDQUN4MjZpZGtGTEFNZHhvSzg1S0Zk?=
 =?utf-8?B?VmFnaldGalY4TDlFLzZhT3RiQTV6QnJseUhnVXB6RnJtVXJDWEVxTGNHS0Fk?=
 =?utf-8?B?R2F5b3kxdjlKUzRXelFOeitQMlZwNHRwVE1XS1pBcFlPb3g2MkN0Zmt6bm8v?=
 =?utf-8?B?QkovQVlCd1dvV2RuYkc0azdwbDU2NUVJS0lucVIwbW9HNmE4VjJSQ2hkM0kv?=
 =?utf-8?B?Z1RZZUpDM1I1V016bjl4UlRHdHQ4Vkc5T2NhektEdDB5d2V5SGZpSVM2YmQw?=
 =?utf-8?B?M0xuSGZaYnZaWjVLd3BIYmJaZzhQb3NwdHBoazZGbjUyZjZESCtOYmxGZGVl?=
 =?utf-8?B?amZNMkpBNlF4R3N5VW9LcUgxckRSTExsU0U4bkFZcUF0QnJEZGtxVHhUajFi?=
 =?utf-8?B?Y3hVMXBvMkJPU1BMbUQrb1EzZEdlMlFBdlY4bkVXbkpnMUZMbm8rQ05vWjVX?=
 =?utf-8?B?SlVmMCt3ZXRvZUwySlI4c1Ztb2Q1MzFITGUvb1pqNkVoallPU1hyU0hRamp0?=
 =?utf-8?B?WGZxbTREbW5tTlZWeW5KelRCQWJ2OGNodHMreFdnZEJpYnZwZSs4ajhZa1Mz?=
 =?utf-8?B?OHBCbnRwQVVmTU5BYVNoS1MrNEszelNscU1EZjVnYWhWWmRnS0hvdnVraEhu?=
 =?utf-8?B?TGQvR1B1MWtkUEJxWmdORU9GMVJ3cFZlMUI0VUNETVd5Ymo1YTY3Z0h6cEIv?=
 =?utf-8?B?aHo2Ym05cU10d2RKVVdIcTdFSFBsZDVtY1EwQzROdkRjZmlEZGxkbVhBVnc5?=
 =?utf-8?B?SlFZTjdMT1o4WFhPbjVialhXQ3NSUlgxZVYyR2d1cUhiQWYvcm55ZGpnMXJJ?=
 =?utf-8?B?NjF4a2dKajgzNGZkbEQwV3BBV0d2SmZYWTRuZjhDaUk5UHNJNFVoRk1QN0dL?=
 =?utf-8?B?aXFPTTZZRjVCNGZ4UTR1amNnNlAxSCt4RzBSTWV3UlVsNFJpWmxQaDk5N0gw?=
 =?utf-8?B?eEMrMHI5aTROT010MlVOMm9kL2JvQTNyeHErK1plb1NDK1ZJQnJhZEljc1Ix?=
 =?utf-8?B?K0MybXpnRG1JdVlpcUgrNjIyR0lrUUFHNUQ2VWpIYnZEckVoQ2NwMjcrUTVn?=
 =?utf-8?B?eWpPN04vTnBMa0lXd1dnRXVWZ2NmMDVUMDhWTmZ1L1dlMEQ4djdoaTNmdzR6?=
 =?utf-8?B?c1k2NVJOdEIvSFdKZWJIODl1SCt3WXJxLzFWeThTbTZ6Wm9vMEpaNjdaYUc1?=
 =?utf-8?B?TFRrb1IzZENweWFLRkkrTnRlemFYalhneGZLRVJXUHNMQkdaL055aWdQSnND?=
 =?utf-8?B?K2xmelYvVnU0VnI0emtXQ0lPdS9FcjRBMWlWNnpoclY1OThXVWplUkZDbTBS?=
 =?utf-8?B?YmJsVHR5Ulh1V0pDeG5jRVVHWFlvOFMrQysySXpFZFFkbVdNOVRyekx0cE9k?=
 =?utf-8?B?MlFURnNpRFVEeGFMVEl6UDRnNmZsOU8yNEtjQTFMcE52eHNKZGFBcUUzZzBQ?=
 =?utf-8?B?MllCQjV6bWU5WmpBeHJ4S1BMdE5KKzQwNUIxWjNEWmIyaExLSDZTUWpsRTVt?=
 =?utf-8?B?cTNtd2xnMytJSnFFRTBFblRJWEdvaFVxZmJDSWJjQVMxSnZmY2htTEFvTHhE?=
 =?utf-8?B?eW9UV3IxMTUwY21aMWNJZkxydzNxVGhMRHByeFp5a1lRR1N3eXNFS2Z5NndV?=
 =?utf-8?B?K01aVWlMSE9hMjRzMEIyeXJlUzA2bnpnYWU3bnREWXNTVXNBTCtXUEM0Z3N5?=
 =?utf-8?Q?RpUfbjmkFOvA1msp+1T+qPfJyw4m9Cv4VCEtYbEhLkOp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fedbc52-3399-4ab9-43f1-08de3e25aefa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:07:50.7684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzVXQUUUvL8Va6ZPClwBTYx2JNu5YE2WbVVHTcYbcJZoZ6Audzo2OXJwMFP65X6JCB+nBneONooyXIDnkusyLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5800

On Thu Dec 18, 2025 at 5:25 PM JST, Alice Ryhl wrote:
> The default implementation of Unpin for ARef<T> is conditional on T
> being Unpin due to its PhantomData<T> field. However, this is overly
> strict as pointers to T are legal to move even if T itself cannot move.
>
> Since commit 66f1ea83d9f8 ("rust: lock: Add a Pin<&mut T> accessor")
> this causes build failures when combined with a Mutex that contains an
> field ARef<T>, because almost any type that ARef is used with is !Unpin.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

