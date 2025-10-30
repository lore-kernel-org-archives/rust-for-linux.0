Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C7C25DD0C
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761863104; cv=fail; b=KemEvDVELkQ/JoJxjGJlcOALd9bkfTerqYm4/WavgtW9T2izGLew6zpbRuk3JyoIk7yB3g1BxqRyBlJokWhocRzryAdaNSNtclxh8ZU3fHrIWi3rOJRfm4CqEHgy0Nw25OonYerT0/XTfa/XvyVGgSel+0wsudroEVYvITnYvOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761863104; c=relaxed/simple;
	bh=LFJsWZUo9SLb3xRbYMxu3/bbzoXDXqm+WibEjhr3SRE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G1trb7r7nopD/lSP3J5mwAnKX1suvK0O5eyz7/gRqicU1akAntZelfwMB1yENMjq/8Co5Op+pvxRys3FZqUvXz1t3mEdCtsbSYt3R3PTkSQGjK/tpnMn0M3M7pt9VaSaAt+vTKmfjmzzSKbMEOmMm2bTFItU4VTyi2LdkzJNNPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ua0M8k+R; arc=fail smtp.client-ip=52.101.46.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ua0M8k+R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kt9qpM/076orGPgIblKNrYVe7EzwI6+Ii20xPldXn6/UgcNu0RtqwjO5ZJK3KdErqikSol3IpH6tuJJIp0rOEnGzxGKmMCcTqIRRfDK/zLvJ7iRLkAmjCGRuPvG8Fvr2OtCY1vWZP0tOdf1iSwj5SvH0Zc8EMzBxdPTDmRrKA2B+kit+vrSjF51m5td4T/gW2pBV82LAArH0thqy0VgBEV5bO1PYEgKxFMd3iEG5oPi2PQm2GOkFEqviDQ2XP/Metjbj/7FT0dL6bV9JJvYwufYaiuImoerz/mESHR4VbEGfbzocbf7NLCGiGGKDiANK8x5Y02C40KNiAouHi8R61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogDHsF9gVCrD0rWXO+LNAnvAFIVil3pI0JNs7tAfaP8=;
 b=sWhy+a8u7rh2MgfcXwjxYa3V75fI0FzuuTTU3yQewJB+1x0uRwX3H3zo1Argtk4bwfWOgSMJBSr+dBx4Y2UdOvmdLDxkPeVBGO2UmpNgdFF3Tbpfn7ZV9oi4+1Al0II3XN1soQm9Moj0IpsmXN0CFC4EzyN5bZWFT4FDMF41PmlR7F4cH30AQKhisx4krKqj9MaC/IOaCWYmqcKAKXPmpzTWKpvOBDPHGwrFshhMH3aNADf7TTNZoYnN97b4UnpF4klseneTOTNJPqQ593Ip6XGyPYXqL2VFuk75T/fProtm+pVlk7NKzpjFjSxnmOWajIz0VkwR59uD0t+EGaSj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogDHsF9gVCrD0rWXO+LNAnvAFIVil3pI0JNs7tAfaP8=;
 b=ua0M8k+RYGqMUEk9d/qJmd0Hua7qYY4YwXgeEjE7Ynl+z+1V9h7ngJ1ozcA7LWPNwA2nQ8LH/VPFLqMHPAAK063pvKEAyNmieOpVDcyhl/4eVKv38EARR2AWJs8ZchLZAOfxaBdkgbSrDePQumr8sTMX2P5whg9L3R6I7KUZYztGe/m43AYCjhUmanFh7rNbbRDioNPJWhyDXAAzY68fC/U+zLTZYaA87sTTRUkIjIjnSxSV3BP+5oa2vGJShF91X8bypw/X7jiHV5ClLVvCb3gXJpVGsuMSPjLzcWnHU+0UaU7CwaAnEKAS2ev0cWzWqiGMji10bR8mF0xMDiuWhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by BL4PR12MB9484.namprd12.prod.outlook.com (2603:10b6:208:58e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 22:25:00 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 22:24:59 +0000
Message-ID: <45b1aaed-7001-4cb3-905d-0a81c438f90a@nvidia.com>
Date: Thu, 30 Oct 2025 15:24:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: nova: select NOVA_CORE
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251028110058.340320-1-dakr@kernel.org>
 <20251028110058.340320-2-dakr@kernel.org>
 <960e710b78f18efb52c6b43ae22423ad3ec3bcfb.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <960e710b78f18efb52c6b43ae22423ad3ec3bcfb.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|BL4PR12MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: e108cfc3-782e-4f12-a90b-08de180329ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enFqK29BMGNISVdNSHZyUkMvQVZOM0kwYVdubjQ4UFJsM0hzYWxjMU9QNXZV?=
 =?utf-8?B?cUpwRDhsd3gycDBvRWJmU3BrUStobDBrb05rWnMrejFnL0MzU1NUQzdpbTVD?=
 =?utf-8?B?eUROS2UzaExQMXd6Sis2SFl6OXJreXFjRkY3Z05tV0o2eUdONFNDejhORDBy?=
 =?utf-8?B?OEFaRzVBMzdUMCtYVVFLNHIxR25ZM2VnSU45QzR3d2o3bDMwa3MwTURURkxi?=
 =?utf-8?B?eEttblFHVmp5VmIyL0dyUmp6NlMyL2ZKYkpCbnVXZnBXalpyS2J3RmttMkhW?=
 =?utf-8?B?MGQyU2hCamFGTjhmQk1abDZyeXpheUpzSWlPMURCbHFBUjJrZXE0c2pIYnky?=
 =?utf-8?B?aUt2V0k4M1VRWnVVUWp0RDdQSDJxWHNGcTNLcE54Ui9zOTdKcjl5Z0JSdkl6?=
 =?utf-8?B?Q1RVUTh6NmJ3b2N4aEdXMlZyNU1qc3hTS08rcVBxVGpQOVYzOEoxak1lSlhH?=
 =?utf-8?B?WmRXakIxZ0NkR1NIM05HTlBBZTZOT0hLSUs1UEtHWDArS2ltcFJ4MGFldlNU?=
 =?utf-8?B?ZkZpOG9mYUJrT3JlZXllMndTbU95ZnJOZmFZUTdxSG9wNkorcWkxTmlMM1E2?=
 =?utf-8?B?ZUEvVjU5ZmtUeWtkS1RvZHdEcWRpczlXdFN5dHdKOWdpUFRONXovaXM0N3Qw?=
 =?utf-8?B?eDI5RW8zL2tXRzZoaHg1bWhYYmtsZXVxdEVhRzhrQVZFdDRkY1Y5N3VMdVRR?=
 =?utf-8?B?WGRnbkovcDhPV3lNbjNzQlpTd2JXaVlsYW95MUw1cnVVbEtFbElyRkVUNUJW?=
 =?utf-8?B?U28wMkdQMnNlMDlyakpkNDdYVEF5NGlHVmlFYzVrcVdsMmRGNnRJcE1UUU1k?=
 =?utf-8?B?azJzb1gxSCtpcDdPM0R2eDBMNzRmVHdNLzdqTUFzU2pzYnFWZGoremQ1YUpz?=
 =?utf-8?B?ME01Q0VmMnI3dVZaakVSRllndGt3U3JaQUxsTGFxVnV0ZXYwbUVKRUlmYUNz?=
 =?utf-8?B?U1hQYzBLcGlSOUJUSnBzQ2NXTHZJaXZ6K21EWWFXanBWQ0ViUzBnNndyV3Ex?=
 =?utf-8?B?U2ozSXRqMm5MeXFVanFZMWkvUFZCNHZlL1lrcElCVjFiYnhDTlB1SGhESjJG?=
 =?utf-8?B?NlIxcyt1NE1DUkJrbFl0KzhzdmFYYnlWejB0TFVwU3Q0U3ozWWtwcXJ4S2E0?=
 =?utf-8?B?d1A4bVZ3VDZKNjE4QURNb2hMczd6SHBkeExqTy9ES3U0NkFqem1vdmU4Z3ZO?=
 =?utf-8?B?ZDhBdnhBekpTVE1tUnk2N1JaTUtqYkJwbGcveEZ3aWp5NzlsbkJaUWYvek1X?=
 =?utf-8?B?d3c3dWd6VnhEWFZnS29ORjJtRjVHclJENHZnUU9rbTZEQTJ1d2hwMGM5MEU0?=
 =?utf-8?B?dVhVOE5DdU5FSlAyWGRDQlBYcHd5WDJXakVXTGJHbWJCci9aY2N0WW56N3Yv?=
 =?utf-8?B?VnFYK2ZZTTlRMHI5dDlsMjduT2ovaFRBZmZjdE5teW51NmRRNHRyODJ5Q0tE?=
 =?utf-8?B?MzBWVlhBM0dwckdLZVA0NjV5aVRiN2puLzF6TGJMTHkxcHh0T2hyMmFSN1RG?=
 =?utf-8?B?clRvaDNLd0NOZ1FnY3BIRmZQNVQrQ3YzNlMyV1ZDWWZqdkJzdVNveGNzSE1L?=
 =?utf-8?B?OXptYmZLUGZNZWJrQkJmYjZYVUdnaHB2Wkg4WDZ5ZkhDeVZIeW5GbFdHRDMw?=
 =?utf-8?B?RkhIWDJSR1N5UXdYeFNsNzEyQytqWUZBUHFqc0h6NlRmQVZzRzRmWERTbFdM?=
 =?utf-8?B?YXJXS05GRVQ0bUFSbGJsRXdOV2hxYWkrOGRQdVN5NHJ0aW9FazVyRE5qTFhK?=
 =?utf-8?B?aFBlRnRrMUljMWEwejd6WDJoaWRhQ1hybEdoN2l0Z0FOTjcwZExKSE9lalFZ?=
 =?utf-8?B?dEx4cExBVDdTejZkY3pMTWE1U1RpOHdHQ3grNU9Eck9JdnJEL01sWVJmOGpW?=
 =?utf-8?B?WlVwVXlIQ29wRUw3NnRqUVZ1ZWZ5OTg3cTBIMmtWbzRXcjM1bGJTNVNSRHpy?=
 =?utf-8?Q?2bBwZ5I9dTn/yd9+lyGmoszm40brSdGG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4116.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGhDTDl1YVBpSkJaYiszVzN2VDRjVWdQQ0lZYVB0SE5IQUlsK3M0VndlajM2?=
 =?utf-8?B?aERJZ2pQaXBFRVdoempZY2FYWm5mTzZzSk5HaXJqM0xwMkxKYTRJdUtkOFk0?=
 =?utf-8?B?VHhIUTRDUlRiU1MxZmRJTzZDKzlBd01lU0hOM1E1ZWtjUUg4U2dlajNlOWgz?=
 =?utf-8?B?NjNwVkV6Y3hZbzcybFlvK0wzV2g4akxyOXluS3B4SDdDRFNnbDVTVk1HMFJR?=
 =?utf-8?B?Nm1DSmJaZkVCdi85L2xhUHVxUEV3WFNiZ2x5RWhEUGdKYlNCeGRvZG1hWGts?=
 =?utf-8?B?SDJNTy9VOHBNZXFYSE1rUDVlc0VWREVacnhyTTZrdkF5SEUwN3l5R0ZRbUp1?=
 =?utf-8?B?WVpnMGkwa2ZKeUpHTGNJeWNaK2tOMkFNVXFVaHE5WS9XU3Uxb2tBVWdhWU9K?=
 =?utf-8?B?RU9vMEczRThEM3hESC9KNEl1alZTM1FxQlRBYkcwYWpOd0E4b2MyN01NaXVJ?=
 =?utf-8?B?dnM4aEliaXJJelFiSFBURUxSZjU0Q1pRR2hieFR0ZldUZE15UEhINmlRbGRX?=
 =?utf-8?B?TGlGd3hhQ05YOGNrZyt4a0lnQTNXd0F1NklCR3R6RlRuSXhYUDNQVmtHemtu?=
 =?utf-8?B?YTRxV3ZUNGdVRnhhUTRQM2lDWUJhZHV6VzVFUDFycUpRN0crR2pZOUV4MzI1?=
 =?utf-8?B?OFo3d1FzdXRoWVg2OXZ3bkltUVFoSDJzaHZRTHlwdm05MnBKeGhHZzVDbWw4?=
 =?utf-8?B?eEdwVUxHTzBsTFh5ZEZ0RzdxQkRQVldNdDBlZ2d1ZFprdGo1cVRHY09wN3Ft?=
 =?utf-8?B?NGN4MWRqejdmcGsrcU5qSExDckc1OHp2ZUpqN2VBWmJwUDZjWEVtYldURVVR?=
 =?utf-8?B?UW5FdHFLRFMvblBxbFM2bHRLUkpDVzdmNTcwcjNGQXNTTlduSFR4cm5BSGdU?=
 =?utf-8?B?Yk5ML28rZ2hvVDV5QjBWU1U0L1p2RzFIQU5uUktzYmFSL3k4OExJN2VHTXNh?=
 =?utf-8?B?VCtCcXFMV21ERVp0ZXYyYzJvckZjTGlYL2ExcjdvZFM1ak43RHZjakpqV2Vq?=
 =?utf-8?B?R05JOEJwZUJDbWMxdXBOVXJUY21IemZvUi8yQWM0OXpWLzJYc0RYa2JOQ1Uv?=
 =?utf-8?B?YmVia0hvTzIxUWY5dVczaGk0VVAxT2ZVL0FRWEJrOFJNWVJSMGl5aVNpUk9S?=
 =?utf-8?B?SndwVENQdFdPcitzYnJCSVlJK0dxMnJLM2g4VGJUTDhyNWErQTVEemdISnJv?=
 =?utf-8?B?K0ZHSXlOMTJLVlVIN1pvcXh5NkNmb01sUE5vbkxZVllvRWFsVkZ1S040RCtP?=
 =?utf-8?B?Sjk1VVJrbmZYR1o4R3ZZVTdSbVdJNmVzbjRhRXlONWhFRnhkTmlEaDJJM0Jo?=
 =?utf-8?B?SDJ3Zi9kTE13VVBBZWVvdExLbjU1Q0ZVbktGQ2I0UGJrcVllZkRtS3RuVTRZ?=
 =?utf-8?B?ejZ5bGk3OWVPMkc0bko3N0xmUStVbERLMFhzWGIwbW5aeVAweEJmNEhVSHc1?=
 =?utf-8?B?MEtPWGVlWXVZb0x1cUFUNFY0SFJpMDN6UlFVRkJNaW85cEpMcmR6K2E5a0lI?=
 =?utf-8?B?ekU2Vy9XMHhsTWtjTG4xNE1oTVIxQ2p3OWdNVEhWTEFDTG15M3JFb0JkN09z?=
 =?utf-8?B?Yld6T1BxcVB5RENEM05BeU5oam4xOFFLYmwyOXh4bWpxOUpra1BjR2drLzhK?=
 =?utf-8?B?bTVITzkzV0Nqd052MUxCdm41Mml2ZitQWjREQ1BjZFNkZzVWTnZaeVFTdXEy?=
 =?utf-8?B?TGY1WUJmcGNlU2JRUUJNa1IvdTIvSHJPbGlNbzlDaUtSSmp5dFdFM2FzcTky?=
 =?utf-8?B?ZENMcVFRbXpHMHpFMFBTd09qNDRXV0lmRFM3ZUJlaWJmNG1McW9PaEEwVDIz?=
 =?utf-8?B?aHkzV04yZ0FwMTNyeS8zQTlrQys3bm42U2tXQ3NpSkVtRnpQU3g0eldvT0p5?=
 =?utf-8?B?UGR4YmRXeGw4Q3A4a3p3YmdmLzl6ZDJIVDRkLzNucHZGWUxNVkpDOGxpT3k2?=
 =?utf-8?B?OTJDa2gxM3Y0ZzVhSTEwbC85LzdKeUljVmNYNFRydHg1UWxZWnhmdzVyTklt?=
 =?utf-8?B?MG51YTgwSE1VNWdraTR4VmdMaGtmKzZRS0JyTTBudFF6dHRjc01JcGdqWUJt?=
 =?utf-8?B?Tkw2bStEc2JkblQ2REhJWWFHTk9iNWFZaTNHYlZmYXJVV1lCaFE5U3hEMmxv?=
 =?utf-8?Q?ZO5ckqsM9ROeciHivTPyeCG/1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e108cfc3-782e-4f12-a90b-08de180329ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 22:24:59.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4srOFYFx4uNjqpzX1DOJM79EClqcSefNKGHYf9RUVQ1iVumizbGGAnZwWLfvsW5OVfJ9XWO5+6IYEwseKYB+iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9484

On 10/30/25 3:21 PM, Timur Tabi wrote:
> On Tue, 2025-10-28 at 12:00 +0100, Danilo Krummrich wrote:
>> The nova-drm driver does not provide any value without nova-core being
>> selected as well, hence select NOVA_CORE.
> 
> Isn't the converse also true?  nova-core doesn't do anything of value without a DRM driver.

Absolutely not true. See: vGPU on Nova. :)


thanks,
-- 
John Hubbard

