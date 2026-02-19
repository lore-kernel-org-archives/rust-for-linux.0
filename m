Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E67C32F759;
	Thu, 19 Feb 2026 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771486344; cv=fail; b=gOCaH4T8txl2wClgsA9utFM6JCG8tS831NjpIWMqhAKPLnQATAMOS35n5axS4Bs2vHBptaRw9xTaL0PaUxiVD75sDyNTDNBZf58BhTTRWyWs9Nf5zX+caXvwKUyDk4NlFN8vWriBYa06sOXUkMFAFeXJ4FKilSoCxp5Uh8elASA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771486344; c=relaxed/simple;
	bh=X9jKP5Jnkded66VsgezzfDQe7yezghoIPIKt2+C9M58=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sjNJ/9dCUyhZSs971uEHk7UZkGx1dMw50u6NvySSFi40eepykY/wlRTGa7tPzUpX42iNfa4EwqG9B956OJ97sYBa32WpSgTonnmgwo2lE0jbOV/qPp1RGLO07IIoMbl1Bp9Q5KafBUgbCZHy2faNoYcxQmdvM/VXx3D/iSZCHH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rrFfvQbo; arc=fail smtp.client-ip=40.107.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rrFfvQbo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iI/h244ysmalmQy6maOdbkfd2CFBO9dI2HMgyIyU06QyN4RXSSXRUejgAbPedJu+qd7T6oimtqeqqJ/EsPO/AyhTDV6HLpgu1RDBuuXs7zHxkwXUbSqHcClC3BGZazFirk/nJ3i4lyImgYa4Hs8dcRrlRmA39Wtmd8faxYYlH7/zWfVDbPKSokQ1WjpdHHG47uNRG1DCiYugctA6lyjSHU45igeG8+8jNndMDpgON+PteTPLi+/KukDVUjFaazJwdg3j0MK/s+R/kEAx3IjqUUU2m57Ttbt9Q5Q6JtmGRtGG43YvmmpTBtVKKHLKHhJmj5ShYZEHM9UMeNDDS+zjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtN3bDZnp0AAdoqmUxF3y4ySlKBnOAveHve97ENyeto=;
 b=DHtDDBr+udK4e/2dMWFVUkpjN6umOKj0izrX4PlWTUdEOPy/+IB+6vViwjeb7cvMd26Dmo7phuHdi8SEPEIVt6N3QiV0OqymV/e70HYoyt3CRqe83ttSDS3AU6xHHf8k/yCI+guBMnTiyM58oAtFGJp5qLEwWtXW4omX+Jby7C6F7RmE1SCjB6ch8mfm9p4KLBS6zX6THHZCwirKT9T4j7R/Pntf0H2Tut4TFsaRAmRxXt/MW0fi5ogwn6w9fTBQQXzJVSk4YgiL/QI2nL4rdADG8PbwfNa4lz76OBpFM+itxTCTT9NsKkQMcHlwGXtG/3v67MQHuDPhYyWnLR6SQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtN3bDZnp0AAdoqmUxF3y4ySlKBnOAveHve97ENyeto=;
 b=rrFfvQboCaDsxxRhJNYw32iL28cPEhVkFI6khjjI3RiO89AIW0lqPZrei9XN+kY+04yllZEi7wCNizH6yPwGNLSLZ7Lg1IuaG34ZShHqQRDOdvkhfT44FsF9Zzw8ZSJtQpIpABF2t+vYHr0nCZS6ZdlOXtvgAPjEyVVqLCYS3qImyxU4XygWEr8jHkfXSFH1SeMMLBMefHPfp0H7XKFck8kGm/nXh07KGr3nBQZPfx/AUHf9dDsmARJX1oguLU93lUyZfs8tz8t2w0sIxJQ+UCxXzDRI25lwBY3FNwdaPBQuCJqUEIKdc9A2H+eauhKTDeeqLzg/4uarT7IP2GpmdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:20 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:20 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:51 +0900
Subject: [PATCH v2 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-2-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 888d1cb5-ee5f-45f9-0ea2-08de6f8903e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amtXL1d3NUIwVnN6MEdwSHJUZnVPS3FyZk1kbTd0eUhSanFrSWhSZnFRKzhq?=
 =?utf-8?B?NDZHNDRYUlhCUEZhRVl1Zkt3TjhiUWVlMXZ4TGFyS25zUmllM2JxczBZRWNq?=
 =?utf-8?B?S0c2WmwzWlBJVUJDR29RVWJhbmNsUDJsN0tkek5qd3FiYmtYUStKVW4rNEtp?=
 =?utf-8?B?MmVNYUZkcGlvKzV6d09Nb25iMUZyTjZuaUtreU4yNWZyRk0xWHlRamtQMUF2?=
 =?utf-8?B?R1lpaEZxMXNVeks4ODQxaW8zMDhOUVRlY3NNY1E3a3dZanNBZWI5YjFxVVNW?=
 =?utf-8?B?Mm1mcjlIa1BSeW16N1cyWTZBRTZ0S05GY09kcnZ0UFRJcVdvNWJ1b3VWd1l4?=
 =?utf-8?B?Ylk1bmhkSDI0QlNTQjV3dG9oMmFTTWVPQ2pWUXhlVXZDRE1wNFlvK3dwaU1M?=
 =?utf-8?B?bkRnU29PMWFjY3hBNnJVWHJoeVVpazBxRGJZcUhhNEFnRXV2RllpWWxlMjRD?=
 =?utf-8?B?dWhpZnJycHcvNXI3R0JTeThIVjBkWlpFL0I1cFdRWWxPMWk1cTd5M2lGYkR4?=
 =?utf-8?B?TGo0c2ZmOUo2eUl2bkNRQndnYXpUYTBDcnJ4N0ZVVjc1bWtpWmNvV21URUZ5?=
 =?utf-8?B?aFBWa3lOWUJBbTZOT3c5WjJmeWM2RFFxRnEyNVN4VHNYdE96aXprYm1EN2Rt?=
 =?utf-8?B?TVpZSnZ4d0gxd2ZaNFEvUzJFNW8yQWRWNkdIcC9POFNJOXRKU2dMcWRFZlN2?=
 =?utf-8?B?bHp6OWh4b3JUbjM1R0daRjA5WTRma1Boa2piTGYyUzM1UnVHTi94bk5sWk80?=
 =?utf-8?B?REJNcjU4NEhsT015RDFqeWFyd0drcnFPWGVFQTBwbnVtODFWK1lHa0VzbHAy?=
 =?utf-8?B?aU10RDJpZXZPTWd3OVQ3ZzRaelFhd2hNYnpwOUpYNGhjVmh0TUtoVE9uZElw?=
 =?utf-8?B?MzgxQm00SnE3cW5SZWNlelBvbVB2UDJqNlA0ZjcrOW1IMHNzbE8vT05xbjNn?=
 =?utf-8?B?NGhoTzBqck1lenRyNlg5WUk5d3BmZXFKM1ViZFYyTGtkbjlEN0FpYWNTQUpa?=
 =?utf-8?B?YUtTRStGaHVLdjFPa2VLUEhkSklYSDBVRS96elpGNnpBOVVOTEEzdDc5NFVp?=
 =?utf-8?B?bVNvUUhqbzVXakhXZjAwUUJvUWdVNGhzaTQ4RFZwS0xkVjhVU3Z5ZE9odjFk?=
 =?utf-8?B?UFdXeS9Hc3FCOGlpYjhuU2tRdndBV1Y2a3pJR21IQVI3RGFhZnFIcVE3b0M5?=
 =?utf-8?B?Tk03M0Q4UTEvcndhL1NjQ3hpZTlielQ0QzdtVHprNE0ra2FUaEZoSlhkejAx?=
 =?utf-8?B?djVYLzJJVy9EVDQzZjZsQTAvb3VzdnlUbVJBRzBSOENNSmh5R2RGNFVwbDVs?=
 =?utf-8?B?aUFReWV4d1UwMExxYzErenIyTjlvUzlEVHR5Z0xpLzFPYmZZd2pINGtVblc2?=
 =?utf-8?B?RmJWYzhGYm52ZFM3Tld0d3o3NFVyMiszVzM4SVRxbStCZnVKWGtsYlJFY0NN?=
 =?utf-8?B?Vk8yL0JDV05LZ3c2Tm1FZzFVTXZraDJJdnJwTmhveVdoZTUvUGhhY2xmRzY0?=
 =?utf-8?B?NHFSb0Y5LzFpTFdKOWVsTXR0bVlZYlFIcHZVcXVXaUZ1TjdZS2plVDJSRFBu?=
 =?utf-8?B?NnZIVUk3dFJLdXUzSm0ydXpxcVU3YnhJNUpLOVhaMnM0OXZOL0NhSlEwZ2dF?=
 =?utf-8?B?Z1M0blV0Y0VxVHdWeXBYdGJHNW55ZEN4SXU5UkYraExnUW9KcnE1dUVQWXVx?=
 =?utf-8?B?MnVnTmhZbWR1RDV5MWpmUzRlcVAxenJ2UFhMbkJqR2NFMnlzUjl1WXpKdzNC?=
 =?utf-8?B?YjBWYjNyOThCL2VTZ2RLNHpPbXpIZGNOcXNZaGhkcGx6VE9qVFdaVE9yUitZ?=
 =?utf-8?B?Y1hVa2dYNFF3MUhYdFZjamRLSmdBUDFtVGhKYmxBRW1DQktOSjNrREJBbDBO?=
 =?utf-8?B?VFJlaFcyQk5RZ0h4bEVuWGg3azdjOVpMVHg3Nzk4dEN6aFZFU1ZtTHdUdUhK?=
 =?utf-8?B?UVYyUWw2UElTSDRpTEVqelQ3WDFscnZ4bnk2YmtudXJNc015OXZpR1VKZDM4?=
 =?utf-8?B?TG1HQjc3SGh4SU9rWDdDdUpLM1ZzNEh6VDFvNTNOL2VNZkdaWnRvbktWZUZT?=
 =?utf-8?B?MHBYVFlONzBkNzA5SWlaN2FtQmZWL0JJU3k5RDNRZjltZXNKajgrcDV2Zncr?=
 =?utf-8?B?V3pOcm4yMTVCbjNtSHJpYXpPSk1lUUEyYSt3UUdPcVR0eWtlSzZPaHlZS0ZK?=
 =?utf-8?B?enc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmFFak92clRiR0t4WFBTY0F2YmVNeUxZcktqNTVQNStKd0RWajJVNHNwSDBm?=
 =?utf-8?B?aTdzUEtmQ2wwNUJJZk5EMEk1RmZab2xxY2FrN0haamNoVUlRRm8rdUZDZGlr?=
 =?utf-8?B?NmJ3WmtRbGpuaUxnY004aSsvclAvd2dJZWNuOWdEL2tMYXk5Y09RRTk2QjFN?=
 =?utf-8?B?aHF2SmxGSmpGQ2VzSlBoakp6UFhURHNTekZETWxvUlMrbmYxYi9WU1NMc1Vt?=
 =?utf-8?B?VTk1RVArMmpIem1GK3oxcTdTd1I0MzlYNElicVozS0NVUVlRUUdCUjkvTUpH?=
 =?utf-8?B?NmplbE45aXgrTXh3MWx0VzYzQUZPR2tuUmVkZ3dKOTBLNnB2VHE1NzRPZW42?=
 =?utf-8?B?VXJUa2pENldWNERlUU1TMDNrVWVpQS9MNlZENkdCVW9NV0c0RWVFdWNLV3BC?=
 =?utf-8?B?ZkFxcjdTZGFraFoxWURweHJWbVlXeEp5a1h5QmpNaHRNQmI2VjBzQ1IrR0h6?=
 =?utf-8?B?c2xHdkZpaGRZRURKQXIyNXpzZlMvL0cvQmJXejZCa2hHdjBuYjVEQzdxMXNk?=
 =?utf-8?B?SENaOHEyNkZVZjJZUHlDZWJXbHgxN1YvVlNZY29LNE9vTFBHVjgwMVpuOSt5?=
 =?utf-8?B?Zm1iR0RIVXRTcTZVVjlMT1hpTGtoWDJBTm9DSGlUa2hydlZtb1ZzUi9FQmdj?=
 =?utf-8?B?OGR6Um02aW1FYjZtV0RjTnRoSnV1cGRxL2RHbXUvUWMydDZBSkpYbFJlT0U5?=
 =?utf-8?B?dFdZc2NOaHVLSG9sS0MxS2Nqd01HTld6clhWTlRUWTl4cDkvTThPTFNVUGMr?=
 =?utf-8?B?eVNtcXlKR2dkMDhSZnF6aU5QcU4wWVVNZ2lZeG1oTHdYTU82a0ZhZDBrbkZZ?=
 =?utf-8?B?Rm9lTjR6L0I3Y1M3Z3Z0d25YQXFZMzJZMm5qSVRacVBEdmJtN05QbUdiRGEv?=
 =?utf-8?B?MFJLZzVFNjVHREVPM1M5VUMveWFMNWVOcXE2M09aUDZGSHZmRS83Qk9qcWRC?=
 =?utf-8?B?THVpK1g4N0FoVXg2eHZwTitTNE9NUy8ySnhwcXIvQnd5VGxrdmdpVEpKN29I?=
 =?utf-8?B?ZmxBbmM2RTNLNlVFbEJVcitOb2QvNHNtOXRBLzh6OEJSaFZGV3d3N3l3dkh5?=
 =?utf-8?B?c2daenEvOWc0UlVrOElqbkF4RGVFSnFvVDFmODhxNnN1aURuVHp5cklpc0p2?=
 =?utf-8?B?ajdGODJLRGxhaTNLajJmekd4a3o4YkdWeDJma0QvKzFJenpCekt1MnY3TGpN?=
 =?utf-8?B?NFd0MmpNa0JlT0NuSmR2QXR3a0pTZTRNRGtHMFBYaFFiaDhyKzRSMC9FSXFm?=
 =?utf-8?B?QituOS8yYkN1VkFJaGtjK3BMelhsTWFRYlZJVlR3VmxVaGFLak1tY1lwREtY?=
 =?utf-8?B?NXR1RDBTYjVZMHNsckJJSTBHdThkb0E1c0VpTUxvblJlcFNqNnJCZ0E4YkpH?=
 =?utf-8?B?ZXJOVHluVXU2OFhDWXJvVGd4MC9tQlpYMVNnMmtEdTJMODRPdWs3RDAraUk0?=
 =?utf-8?B?MWJoam9tYmZLSUw2bFdjRWRZMkNwc1VQUDl6Y3plczd1b1VWYmpOQ1J6YktP?=
 =?utf-8?B?TlpEdWgra2dZL2FJSUFQMFhlVXJUQWZrUTZKYVo5bmtKOHJIRTViY09zZCs2?=
 =?utf-8?B?akpVSUMrRGVkTUZOSm5BYndXV0tOR21iZGdsSXFjb0hZamtCdmtCVzNuOEpB?=
 =?utf-8?B?d2N0VHJaVjUyOUJUa3NTUEhqOEVJVDVQY1NKdXpKaExrUW16cGUvcFdDbU9P?=
 =?utf-8?B?YWJXZ1FiS2VxQyt5dERMWEhKdGpPTGNzT013R2tBdFV4Nk5tekx0OXEwc085?=
 =?utf-8?B?RjVtZkQ1dUdLakF1LzJTdjhmeHZLdENKdTMzajdQSkVHcDZZTlQzejllOEM1?=
 =?utf-8?B?ZU1wSXZXOHNKOUdUYVpNRGY4eGtrME11OHBrdDAxZGUwSVd2WTJKQ1ZmWXEr?=
 =?utf-8?B?YWxlZWNVTG95QityME10Yytta0V4MSt1TFdmZklxMVNKWTY1NXc5NUtNM0hB?=
 =?utf-8?B?QUtYRm9NNE5XWEdTd0NGT2NGaHFJTzRZN0V6cEwzaU54aWhrUElzYkV4c1dD?=
 =?utf-8?B?MEtraTk3NXNoZmRMdkVCMlNYT3E5cnpRbEJZZ29Wd1o0MGpKcjNHeVZDdjVG?=
 =?utf-8?B?OFAxTktna09QWXF4MjdzTGNwLzk4dk8xS1JZclpzK0VkM1F1WW9DZGtnUG56?=
 =?utf-8?B?bGRPR3dMelU3cXgvNE13WVVoT1JrMHF3TUNDRUtLeEFtbi84WHhDQkpaWU1x?=
 =?utf-8?B?SmZMZW1MeXlIZE9leVF5bUdKd1B3R080aXFwSFo3Z3F2dlo2c3F1SzkzNGZW?=
 =?utf-8?B?Q2ltVnhOaG5IYTQvTklraE9JZEdHWkhzeGY1YTB1RDl2Z2M5NzYvaHZkcVdN?=
 =?utf-8?B?NWlPcmtMbnNDNEgwZE52U0ttUzRRMDIvZEFWUGc1SzFMa0EzTEpNYTlYcnYr?=
 =?utf-8?Q?rwRdVwm0cfhh7WhUjGjKqRSZKg9q9MUrbM/qDksvHyPFO?=
X-MS-Exchange-AntiSpam-MessageData-1: mhKomeOZJdq1Dw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888d1cb5-ee5f-45f9-0ea2-08de6f8903e6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:20.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpidtoYl6yaXniwj+c+t70UT22h4QcjsOhdL11DC/EADf5rhVf7MSfNWtzSsdNaugm0K+AgFKJAxtMZZyWH6ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990

Add a timeout to `allocate_command` which waits for space on the GSP
command queue. It uses a similar timeout to nouveau.

This lets `send_command` wait for space to free up in the command queue.
This is required to support continuation records which can fill up the
queue.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..f7f3cf2c7443 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -243,6 +243,19 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         }
     }
 
+    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
+    /// to write to, in bytes.
+    fn driver_write_area_size(&self) -> usize {
+        let tx = self.cpu_write_ptr();
+        let rx = self.gsp_read_ptr();
+
+        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
+        // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
+        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
+        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
+        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+    }
+
     /// Returns the region of the GSP message queue that the driver is currently allowed to read
     /// from.
     ///
@@ -268,15 +281,22 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 
     /// Allocates a region on the command queue that is large enough to send a command of `size`
-    /// bytes.
+    /// bytes, waiting for space to become available based on the provided timeout.
     ///
     /// This returns a [`GspCommand`] ready to be written to by the caller.
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if the driver area is too small to hold the requested command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
-    fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
+    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        read_poll_timeout(
+            || Ok(self.driver_write_area_size()),
+            |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
+            Delta::ZERO,
+            timeout,
+        )?;
+
         // Get the current writable area as an array of bytes.
         let (slice_1, slice_2) = {
             let (slice_1, slice_2) = self.driver_write_area();
@@ -285,13 +305,6 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
-        // If the GSP is still processing previous messages the shared region
-        // may be full in which case we will have to retry once the GSP has
-        // processed the existing commands.
-        if size_of::<GspMsgElement>() + size > slice_1.len() + slice_2.len() {
-            return Err(EAGAIN);
-        }
-
         // Extract area for the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
 
@@ -484,7 +497,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if there was not enough space in the command queue to send the command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -496,7 +509,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Error: From<M::InitError>,
     {
         let command_size = size_of::<M::Command>() + command.variable_payload_len();
-        let dst = self.gsp_mem.allocate_command(command_size)?;
+        let dst = self
+            .gsp_mem
+            .allocate_command(command_size, Delta::from_secs(1))?;
 
         // Extract area for the command itself.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;

-- 
2.53.0

