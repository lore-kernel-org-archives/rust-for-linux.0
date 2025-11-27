Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013013.outbound.protection.outlook.com [40.93.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41635695;
	Thu, 27 Nov 2025 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250221; cv=fail; b=hzMobXxwENpb40G0Gwajc0GUkTfxfZqNelgLEado/ZmV3v834WtOpqqZ6NmC59OE1ePM6CnD2w+l2/QTOf4Pbvf8EMh6hCv+4UuDnFwzLId5nrTyTt1lFlLzDq+6IHkgmF8xNAVEKFthOmqvYsz0UhXU6roNCwARz9bJtuIcL2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250221; c=relaxed/simple;
	bh=rkaP5vBwfK3KFSOKakcu9pUP3oylpUZVRDdL7rufhao=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=uenYCFbUs/MbMB8Tg1JDidcE/u/F4yvcggWfAZ6/z0TlE3ti4JZF63D9il5zJJeGxPhKH6ehbFg4QZh08ON2sWEF1BPFDeg8X7lyadALRLqZqsDQdXa1ZKu4H99avG+jUKO3ZsctOC/sjEMFEO6aRaU48lH17DNeFSIBvTuFMSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uIzJRVqZ; arc=fail smtp.client-ip=40.93.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uIzJRVqZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kj0fcFg9UOm6F17gjHUPVN32zIRSDb9g6CWu4yToI72PM92LtPUcLuc2Pzv58rBj2HGHwlmhK943s4r6rO3sNt61Pmo2xxe6PRasPGLZc5te8ncpO/GMbU4IC40QuTYGb9L4DxzR5UWOm96AMKKZ/IOQo1EAK/UIGq3W3NQPLZ0aklGuy31+icFib36gvTEurZ828G28Rzhy9AE8BSJcwHk5FFQIr45UQFEPluzHoJMEFa9q/CXcn6Kd31shAv32Adu8u0F9XTsdLsBWTyn3w9IuJE41RM2Oxs1t7i09ia9L1Qejr4f3l2DrtKuAQlKqtXCUe64GaIt7OieNjcAcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXL7pLNpxGZYz+EgvgEyLaEfYUlQthAsUk5y5iYvSK8=;
 b=DA0LXofEv420L/5BiSh9TlD3/mZPl46m4kuY6UJYR9KXwDjG5Ucbyb18QjeWJvYZSzhc1Itn5/REJQjPZwjE/I/q+iaDxHhJAbUe9IDiIMnI9Lrc3VEeW2u9M126aezRI6Wkt1RYr2HpHMxTXpM1frw6bR3VEDLb/0lXlhn0ZtzUetdOxIEYV1yxfGJ3W38HDSeEhxWR7wHoah9HZmzrPlxcqJFAPQykZu4bHR/ymy1Wr3vFSGV0aCo00DG2XBR6mh8csPK00H1EmyX/rCZW7Hnkd4rHHnXyRwaehRcYIdP4vx8v1UD18JhCLraYtTT4F/uS3aSEVt+D4YkqjgzMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXL7pLNpxGZYz+EgvgEyLaEfYUlQthAsUk5y5iYvSK8=;
 b=uIzJRVqZeGEPrdpN7+jRaFbBseTb1GMNkpwKpF/7QHWOyzUUdQsZCQ+ZACYcrsfiUyR5MizWhK74ApwfcZEc777IIljA7UuxK9Srin33nzuo73IZevDQXJaGR4YH0F8z8gVQ3Q2I9cqLK6Ihn3IpnDRkfEKTccCGc1zMC3rGuVu4N+Mz7weZHu+eLSL1KkDO8xC52CRJY0TGSKMmsg349M/dCgMaDdmpotqn1z9tUyumpJ0crFdlOLk7u+uLGUMjxLPVQOkbdYGXLXEw56U+jz0Qhwipqy1c80FXBQjxy8ja+/ErQzXwuFm8mv3PmecJAg5J6GpLjeV2TlfUiA1Z1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by IA1PR12MB6385.namprd12.prod.outlook.com (2603:10b6:208:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 13:30:13 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 13:30:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 27 Nov 2025 22:30:01 +0900
Subject: [PATCH] rust: io: always inline methods leading to build_assert
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-io-build-assert-v1-1-04237f2e5850@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAFhSKGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNz3cx83aTSzJwU3cRioNYSXWNTc8tE06S0JAvDZCWgroKi1LTMCrC
 J0bG1tQBGtCtaYQAAAA==
X-Change-ID: 20251127-io-build-assert-3579a5bfb81c
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|IA1PR12MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2f5c89-0609-45c7-5f80-08de2db9172b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmppVHBHa294dUh0Q2s5NHZYR0liSGd1MytsV3F3TzRCNU1FVlpKbVo3Rld1?=
 =?utf-8?B?M3lrQ0F4M2RBREZmY3JLMEVjcVZZeDhLaVBtRkJ2UVVmRjRsM0FldmtFZFlX?=
 =?utf-8?B?TmhDSm9pVzRza3BONjFGOUtLam5MUlE0ZkkzWVB5bDNZS3ZSRnM3YU50b0Rs?=
 =?utf-8?B?MUcrcDJEaDdhZ0doUXoyTGl3VmRiMzUzaDVSWlBQK1pPMG5JYk5DUW1rVGxt?=
 =?utf-8?B?bWVUcUpmV1dyRGxxN1NURC9EWmFhR25LT2Zwc2dGcEJHNXFxS2xJV2sxcG1D?=
 =?utf-8?B?VUdZcVdBOEQraUhyT2FCTU5EdmxvOFB4aG5tbFZxOXhtK0FNb1JpbVpzUzMy?=
 =?utf-8?B?SkpvWlBrQmtYOUFGNTJEMFljcEZpVEdwdXdpMlUwdEFHUExvcko5bVJLZUU2?=
 =?utf-8?B?MWZOV2kvaUNDbFR2ekJJZlN5a1VSWUFTTEVURmJpdXZSdk90OTVScGdrLzQ0?=
 =?utf-8?B?c2dwLzRqUmVCUjZuR3hiQmNteXRMblNqQ2U4b213TlRBUEg5S1ZCcVlUYXJQ?=
 =?utf-8?B?aHpUanAyQjQ5RnBlK05FQ1JsQ3VtaG44T0c1YlFSK2hMOUxLOE92bjZqc0Fl?=
 =?utf-8?B?OTh1eVBkWjJJUFNndHhsSVdvMUNEZ20waS9CcXUvK1dlTURpbGdRVjM4OEYr?=
 =?utf-8?B?UXZHcEZ6VERHSjUrUjAzR3J4ZEV3WkF3S2JDek0wY2hmSUQ5NWphSDlBMkVo?=
 =?utf-8?B?UVV3TTlTcHVkWmZrSmdYWHpNTDlLRjR1OEVXSmJEdVYvRlpzcExaRCsyamNP?=
 =?utf-8?B?bmJQYytOU0wxYkRlMEZwZS9BSkdjMEQ3STdrWnpiMjZKKzBFYVY2eVdpU3NU?=
 =?utf-8?B?WlhGbUl2RE13cGl5K1Y5MUhZSHkzak1VWUZvMkJzb0dIV09zTEZOcnJlMGg5?=
 =?utf-8?B?Szg2VVRQbjI0UlF0d2pTZ3cyR2dTaWRSMG5XMlB5d1FTU2JYdUVmYlB2Vmpt?=
 =?utf-8?B?QVAyTTh0ck9GYTFHaGRNK0dDQjcrWlk4TmcxcTIrMlVkZVJORkFMVWt2bUZE?=
 =?utf-8?B?TnN5U2RCQVhwMFl2eVY3d2lnYXgyaldUZ2dIVVA0eTdzeUp4MHQ0RXFRMklS?=
 =?utf-8?B?elI0MDRYQm5iR1o1b21KTjF4Smp4VTI0U2NxRzR1aDdMaWtQQ1pPNnhHekFq?=
 =?utf-8?B?Rm9RS0RPVU9pWWN3Y1lydmN5VUlGZ3ZVS3ZHK2lpaXE1NWdIV1gvdHhiM2tR?=
 =?utf-8?B?bmd0UHJlR1J2a1ZPd2Y2QjZ5citIaDVMN2JUblgrV1h2Sld1UU5ScytreW45?=
 =?utf-8?B?S1pMN2tEL2hYOHptelduVEpYVmdqSTc0Um5UVGVteUtNSHRpbW9Ld3FJWjNX?=
 =?utf-8?B?alJzQUg0SUVKNVd2RFFQNXViN3NwWE9zSFFvSkRYQVdGYlU3bzh4a0lpYzEz?=
 =?utf-8?B?eDZRckZwbDdwUWZCbXlRSU5na2ZSK2Z3dldqN0toVVAxNi8xVHQ1d1VoZFJY?=
 =?utf-8?B?cnNCNWUzeVh5T0JsWVFuZ2FlN3cvM1Y5WUxFZVhTQy9RZHg0NkVDRm54QU9G?=
 =?utf-8?B?NVJaYlhINnl4Y29rL3pSaWdjR1Z6OG83MTFCMFpyN1htb3NwSVhBdnBZYkdu?=
 =?utf-8?B?b3E4eU5WemhkYnh4emh6cXlDZTdwZVRlbFdBYnBmcW1KbGxQdnkzRGtOVUVl?=
 =?utf-8?B?WS9sZE10Y2RZdDNsRHNycko2L09iT2VGalpxaENhZ01jQkVBUE1xaXdBdWg1?=
 =?utf-8?B?bytTci8vWGF6M1B4MU9GSFdNRGQvVW1Kbmg1alpSSTZQSUtnYzVQODJSTmZt?=
 =?utf-8?B?RFVnYWE2MzNNdkZqcXFCUWlSNWVEZU5XbzgvTGlZYTRUUVZaNmpKcEFSUjlV?=
 =?utf-8?B?aUNiVjNZekk1cVI4NkY0S0xyYjNVY2NMa0JUbWhVbkhDZWtKZzQvMnFEeFlq?=
 =?utf-8?B?OFZLb2xKemIrYk5nbWJLZGhUYkNrdmRjR0czY3hvcnJGZzBCSjNicG5XTE9S?=
 =?utf-8?B?cUJ6dTVTaHIxdldGalhVaU5xamprbGlEMG44NW95TUE3NnJEb3ZYMEYraCt6?=
 =?utf-8?B?UEtkOHNZd3dPWENSL3dhNlVWQXVDOXFVNnpHaXJFbWtXb0lmRk1OUVVKQTJS?=
 =?utf-8?Q?jzkg0w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlE4emNWVWtPaU91aFRTRFZ1cUVzT3hFemZuV3JQNk5CdVR4TnVaUmVNYmtR?=
 =?utf-8?B?ODJQRm9SY2x6SURMbEh5Z29kZHVBa0E3YW1maGYyTHF4MWpQNTYyY21QYWRl?=
 =?utf-8?B?TmQzbENkQWs1VXVEYzJxWS9sYlY0T0ZtVVJkak01RG8xTHBQeVNXU0V3WTgy?=
 =?utf-8?B?QWZpaWFQeEVqTlIycVprNnUwcGV3TzFNU3k2bHZYempEVXdlRlhYT2tXWTJh?=
 =?utf-8?B?bnBHbkw0cTN5ZWtwQlVyUi9RNnNiajZiZGMvdHg2N2VoTzlFOGNHMkx1SGlR?=
 =?utf-8?B?Smk0ODhPTUt0VGNqRmFQcXVBdkI1c3dHaDh3bldiaWZiV1FMaEh2RjRsaGFH?=
 =?utf-8?B?U2pGOU5yL3NlV1FOL0VHZ0VQZkFNRC9Wd2tmditJVUJEaTQyNFYzY0QwY0Rv?=
 =?utf-8?B?Y01NQkMvZlNBaTg5N2NLK0dTT095eFRuc1NjSDd6T0VyOXZWUk8wVTlPbUd5?=
 =?utf-8?B?RkxjOVRERktQU2dDSmh4aDkxUnFWWUVCK3AxdkpaQ2U3aktKT0lFZE5mMktm?=
 =?utf-8?B?bmxQQVowMlZ0Q2JEVW81YWRvSVZmYllPSjZsVnFYZDF4bzJXUXlmejBYOFNP?=
 =?utf-8?B?aFZhRVVYcmY0OVRNcFExRGRDbzV4bkI3YlFvMXpTOHp5bDBmRWNoTnlnUE1X?=
 =?utf-8?B?U2R6eVZxeVBTVHZhSjdlc3lZOUkwYURqMmVacDlMeWZEUktydEJFOHo4RVRB?=
 =?utf-8?B?emZMOHNBTzNZS2tEVkY4b0pBZWVqUndvYW1iRG9LaVVGTDhVTml1Yy9ranJo?=
 =?utf-8?B?aGRNdG90Y0dSTlBSdjlNYjVBZzN5TDE0Ri94VGZwcWdLeFJRSGs1NHVYc0ZE?=
 =?utf-8?B?VHFlSUpwbnJKek40M1M1RWRReUk4eHJLNlA2TVEzNGIrVEs5TW1KZXB5RFRP?=
 =?utf-8?B?T2lCMmpTTmROZUpjUlFzbnBpVlFQYWIwaS9HeUhjb25hR1ZHTUZ5Tm9XSDdh?=
 =?utf-8?B?dzJPYWlPRC92ckR2V3hlcG5OWDdnaDRvVUJ1ckp4dS9TeHdRUHk5RlIwc1da?=
 =?utf-8?B?M0lwTlUxcDdMam5YS21Kc3NoQzBTVXovd2l4MHJMZGRNMXluaHVOQVo0M0kx?=
 =?utf-8?B?WE5qam1ZSzQ5NzZJVUloanhoUURmbldxdEZjK3hnZDJiWE1Ka2EwdjhFOGIr?=
 =?utf-8?B?SGo5TDRHeDZtbjgrZUJ2bzBkeUhCWTZpQXBHUzZLOGRITUFLVXF0c29XUmJK?=
 =?utf-8?B?Uy9QQlNOL3VkS1pvWnFnYXRieCt1alNrRHhlendwdFh4V2ZUVmFHaDFlVnBk?=
 =?utf-8?B?S1RoUUx1ZnlTais4WGVxZVBGSStJdUFEUDZEUFlrSXRZdm5veTJIRWdka2o2?=
 =?utf-8?B?Q1Z1ZmR2WjZ2WEhWb2g5dDNvOTlSdWVCOU1LQzZ3eTJtN2IwNWkrYmhsUlp1?=
 =?utf-8?B?RUhsdER3ZFdHb1ZXaFFlQVJmTytjdmZPQUtLRUZVNTFIaTQ0b0kzUGtTZFdM?=
 =?utf-8?B?eUkvOVY1bXhCam1ReER2TlpFckw5UHkySncySVUrU1lwZmZEY2ZxaTJHamhi?=
 =?utf-8?B?NmtxWjRCZms3WVBDbzd0cUw2cjVWb3g4UCs2WXhiK3Y1bE43RzJCakxXZlBR?=
 =?utf-8?B?Z1plSWFTdFFGNmZrUTVqL294aFNDQkIzSi9nc2V5WDFMNnVjRTBxeGQ0TThv?=
 =?utf-8?B?Nkh4UXY5QUt1TFYyT1B4TTJSaWNtTGUvaUtrVHpzOWNkRytRVGlkOEdhU0lE?=
 =?utf-8?B?WFprTGVONjI2RjQ4YVpUdkUxbmdIanhRa0tBbHhUcmJVQ0ZXRzdFTFB2NXB2?=
 =?utf-8?B?T1JCczVYWjV3QUtwUm9DTEx1YmNiRXBaVk9OcVJYdkFYTTU1Z0J5SHhvMDhz?=
 =?utf-8?B?VlJwN3FrdFFTMGVVSzlJVFROczJzbEhKWHRHeWQyUWt1cVVFWlBycGlteGRJ?=
 =?utf-8?B?bmQwQlpJSk1DR0QxVDlRUDZNMlVyVUdBWVVCbUhORno2Wmh2ZTJVcFRtYUVJ?=
 =?utf-8?B?Z0M3Wk9ndHZBSWVsaFYxMFBmdXcvOW5GdGQ5dnpmOTQzcmlhUWk4MVZmV0g1?=
 =?utf-8?B?NzI2OG1oQkdpTzlaSFVVelNJbXU2bkhldXNzTXlGVml2c1JTYlgxbWlHVFZ0?=
 =?utf-8?B?RjdJSUFZR3dmbi82Z0haTzUyNHBTOUxsQVg1eWlRSk8yZkJIaEFIV29ESzhL?=
 =?utf-8?B?ck1WNzlyTTZpRVpodjdFMTB4Mk10NWtzdUZkTWM3S0RNbXJBZ2ZTOVUrQzdr?=
 =?utf-8?Q?EgFDNhsZyGsZefDRgwJJjLH2hDV9ma5lYxRG1aZbcxfQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2f5c89-0609-45c7-5f80-08de2db9172b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 13:30:12.7403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIvkR03Ubs0SioFVp+LfaYs4ODMIeATiZZ7jsORS/2NbCFBZGrDDkeI+lcXX0hUX2ZZTIqWD9//k0TBztqNOug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6385

`build_assert` relies on the compiler to optimize out its error path,
lest build fails with the dreaded error:

    ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.ko] undefined!

It has been observed that very trivial code performing I/O accesses
(sometimes even using an immediate value) would seemingly randomly fail
with this error whenever `CLIPPY=1` was set. Removing the CLIPPY option
makes the error go away, but that's obviously not a great workaround.
Clippy appears to influence the way the compiler optimizes things,
making it on occasion generate a method where we would need it to inline
in order to satisfy a `build_assert`.

Fix this by instructing the compiler to always inline the methods
leading to `build_assert`. This stronger directive is effective even
when `CLIPPY=1` is specified, which gets rid of this error.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This is the same fix as for another build error triggered by the use of
`build_assert` [1], which signals that all callers of this macro should
all be tagged with `#[inline(always)]`, as inlining is a requirement for
`build_assert` to perform properly anyway.

[1] https://lore.kernel.org/all/DEEUYUOAEZU3.1J1HM2YQ10EX1@nvidia.com/
---
 rust/kernel/io.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 98e8b84e68d1..f161ec8056ce 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -142,7 +142,8 @@ macro_rules! define_read {
         /// Bound checks are performed on compile time, hence if the offset is not known at compile
         /// time, the build will fail.
         $(#[$attr])*
-        #[inline]
+        // Always inline so the error path of `io_addr_assert` is optimized out.
+        #[inline(always)]
         pub fn $name(&self, offset: usize) -> $type_name {
             let addr = self.io_addr_assert::<$type_name>(offset);
 
@@ -171,7 +172,8 @@ macro_rules! define_write {
         /// Bound checks are performed on compile time, hence if the offset is not known at compile
         /// time, the build will fail.
         $(#[$attr])*
-        #[inline]
+        // Always inline so the error path of `io_addr_assert` is optimized out.
+        #[inline(always)]
         pub fn $name(&self, value: $type_name, offset: usize) {
             let addr = self.io_addr_assert::<$type_name>(offset);
 
@@ -239,7 +241,8 @@ fn io_addr<U>(&self, offset: usize) -> Result<usize> {
         self.addr().checked_add(offset).ok_or(EINVAL)
     }
 
-    #[inline]
+    // Always inline so the error path of `build_assert!` is optimized out.
+    #[inline(always)]
     fn io_addr_assert<U>(&self, offset: usize) -> usize {
         build_assert!(Self::offset_valid::<U>(offset, SIZE));
 

---
base-commit: ea34511aaf755349999a1067b2984a541bee1492
change-id: 20251127-io-build-assert-3579a5bfb81c

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

