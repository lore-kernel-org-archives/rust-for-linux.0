Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A479C3A0B3A;
	Tue, 24 Feb 2026 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942956; cv=fail; b=ElasQsRTCV0PfbFwM6tNkLIlOuPrVApFxDXkW+Dll/py981QXyeSwJfqpO+vpxXptDRbmQ1qV3IAQj4073mv1ditWyvvJHqqNjEvHCTLwlokQtq4NhdgzA2+YHejrl7uPdYhsrfPsdz+M885/XFtIwoz850sL1WAo1fWqH8/37g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942956; c=relaxed/simple;
	bh=wGjhG/9RSyaTAXnnmpH7dJPCHyn3GhHAEbEOXTnjTJ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KOqm9/Ip0qgYXiB8sjdvXvx0/wgTjYuruleE/2/megw8+ucDS9SJS7TWSgdJSj/lOM2CXiGro8307ZdYJ5U3umPtfjnB+A6S+qVXpqVCc0DxfX2qzKQAA1xU1gXafZ38Yuqxe6ic7RNrd7wFJfPlBK2zW3Jqmlda2ZJDvOXEfXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RWg4JXaq; arc=fail smtp.client-ip=40.93.194.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RWg4JXaq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqNkHo1Gl75OiCT6WVmFrtSoH3Q+D2AaGptthNmcMvVZciq+o0/gmpHzchSoMbbt4WdFTNREn1CVXdZHnhReCCN4X1MGupXhG201Aji/BBv+iCr5zx8GoQDw5DftuzMuhSnelWcfEG0M+Q5HfmfLBz3ZCcYSdwHCw22V5M8SeTdjVJ030f7jacimeTlhz3BUJF8Z20KCvy0qiaH8lVj9n9WYO8MMrNVikTFeOhzXrdm+NiZZLwSLbTvggXvCHQg3CHTzkZ7pjdrXpywuTBpyDcbrLD4dvp0xYBd79vD2YHktLnKsrex1NJ1D1IFttUrY97CX4LCBOWtP9EYvl5dJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfZkMnUs5cw7NtIB0JmEB9QkrrltwWG90h5c5CiN8Vo=;
 b=D6QQcvB+RP4YCIZSUvIs60RPwZVmn30VIDuspVMVizo5jNgPBQQ8/B6WPfYgXZSjNoLbCZ1rqU4Ivef5xlDDYkJQB4ob1xc3I6sgKDvHgoYpaV447MjoMYJ8uxu4yfXEW6ptjNQNxN9Zwjit2sWP4hz3qK2aeG+E+zIc3bs2u1L0X6DC2Ir3MxcyM4aStRVNFW4HTUAKEb4NBwM19DFedLq8wcfWkIX51XeKba6FO5YuL4oqOXoMPrczrDmQ5j2naj/MV+A2kSNjSJDYcuu4Iw3073G+3+S8z5pmtbBU7PViVoqFF7iomiG7xFGFiUafaU6qDeXSKWm566PRJ74IpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfZkMnUs5cw7NtIB0JmEB9QkrrltwWG90h5c5CiN8Vo=;
 b=RWg4JXaqRo2vJp77fn6vOl/XQ422QtbSL5oIaCyI0Pk0loZ0Jtao8Z1yeSbSIYk4Hj2hVvCOEpwl+RE2zx89j6y+yVI+5ufjXT1k9e5hYpUTnKy42gVSFeAlYBOBOrI+Vv6Tci9Lv8KjETygihQe1DhDiGUebtwIVnjPFTUssVRwjAQmknmihfsJWd9BjwziipUnPrAMz2JHb4rLjLMgwgeKqLx0XyuCW0ZSiYvxXaLtmyzvHuQ9Oumjb9QMO1FgJoDF4MJw0LIkNYtjjoFGlE6rEfBbc4LovxPntnxaox1SrGJGmmfrZM7faOHlKCtvAccZgedQtZtMKQ+NCJqjyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:44 +0900
Subject: [PATCH v7 06/10] rust: io: use generic read/write accessors for
 primitive accesses
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-6-aad44f760f33@nvidia.com>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-0-aad44f760f33@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: aaae5ce9-4c7b-4ed3-11f8-08de73b024be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDduakxmMTNQb1NhSTFSbStkV3I4OWVBNVhCQTlQSUVvUW95L2ZraE9Nc0ND?=
 =?utf-8?B?MjdUNnUrbmx6QmVpdEdkMy9La1dSZUxLTjkyVmV0TjQvc0tuQ01iSnNwa2cz?=
 =?utf-8?B?Y3lua1R0alNITXIyTnFyYU1NOXZVWW9rdjRJS29jRCtwL2RicHdRdW5rRVdO?=
 =?utf-8?B?NGlyR3czUG9XTHJqQ0xCV1hCblpWL2VrclV5bEFJSjN6M2ZodWIxSjJqR2ZM?=
 =?utf-8?B?VDVnMGpzeGlSb2RCdzNyTGNUd3AzQUFuUk1Xa3h6dTc4OWNMMGt1S3VUUkg0?=
 =?utf-8?B?blNOV0ZMdTdIWHk0MTZsWnNORUcwN3ppK0t6TEh1bjlSVGY5WmlMdWtYUjVv?=
 =?utf-8?B?RnRRK0lYdnNYU2FhSWRNdVBMSE50M1RRMldVajNRVE5FcEd4OE9xZ2p0K1Bp?=
 =?utf-8?B?Qi96dGd6dzE4eE04U0dmOGtVWXFJTjhGNEVCR3JUM051YmE3MlZoWjVMbS8r?=
 =?utf-8?B?VkdKazNsTGVTZ2c3ZDJhUWNJamd0ejFDaStxbWdkeldYM3pxRkFCVk1WRkFO?=
 =?utf-8?B?SWJ1YjZVWkZURVdERmdYOXdyVUpIK3BwcXZ1SGg0QmRZaG9IOEl2bW5jVi9Y?=
 =?utf-8?B?UkVUdHZTSUQwTmo1MmxuMHpQc0k5T2ttRDl4MGc5T09KU1NwRURWZGFadTBC?=
 =?utf-8?B?UnZIamk4VE0ydmlub1BTc1RlS2xvV3pvWTk5dHNlbktNcE9UbGVkbjc1djg3?=
 =?utf-8?B?MmVDNmF5SDhzT2pLQ0JZTXo3cWhkODEzVmE0T0YyYkZKUVkvNG9jaGxEMDVk?=
 =?utf-8?B?aTNXUDJQVDVtUDU3QjVpcGdGYXB6YWg3THRpODhVL3lKTjc0WjdQMUQ5NW45?=
 =?utf-8?B?bjNPYklKWjBTem5aZEwyWkg3S1NrVERQZFBJVTREMkVTMzc2WTBoZlhiRzhV?=
 =?utf-8?B?dlRlbkNoNVA5UEZEeDM0UUthQ3dFSjhiWStsa2Q2MnFYcWlnWEtrV3czL2pL?=
 =?utf-8?B?Rm5uT3hDMStpN1FvSkRWRWJpc0Z0c3B3NGtSN2tyQ25YNFlkLzJNa2g5VlNP?=
 =?utf-8?B?eUxvdyt1Z212dHV5N2FuaE5mYnNVdUZaQ1JFaWZHTmFrTXRWT2lDVUF2V1R6?=
 =?utf-8?B?c0FDUHNMUlpzTDFtVlVlejlrYnFCMzRRWWc0aTdmenBRVkQ1RFkzK2dJUzFt?=
 =?utf-8?B?WWVsMjE1Q0JwTlo0OHMvRGZGZGZVWU5yQWdmLzNUM2ZkK29iYUhVaWJJRDRa?=
 =?utf-8?B?RU1rc2hnam10NUpEYXpvRk5lTkx2MThNeEFQdHRhenhpdXhzMFJFNmpHU25O?=
 =?utf-8?B?dXBZaVdTYU5TZUt3RlczL2M3clZNQkJrYlNCMFdtemlneTkvMzROSkNKWkpt?=
 =?utf-8?B?ck9HQmRmZlU4S243UVNNSGpabWZsRzN3YTZhQmFkOUJHNXh4YkNKQVU5SUxW?=
 =?utf-8?B?ZjlKajlsTzJtQjJFd20zeFNoZTBuV3RMVUdwSW8wY1dzeStDcUJ5YlYxeUsr?=
 =?utf-8?B?RWE2L2R2WDNad3RRQ0ExWDQyR0VKcUh6NFF2dEN2QytRUm5Mb0duUVBHNmQz?=
 =?utf-8?B?U3MzT3JwQW41cUptU1BqTytVeDRTaG1KaDVwVjU3dnVFNjZHVWRQaVBqZnBL?=
 =?utf-8?B?OGd3MU42RTZJTjliYnRYbnhhRXNMZVB2S1IzU05KSFpqNHFmWStRWEVkZWZi?=
 =?utf-8?B?VXh5ajlPcGhiK2FaUWU4a1JmSk5XYTlvMkRJZkhMc0VmeFVCVE5GV1duYUp4?=
 =?utf-8?B?bFZKb1NiUm9ZY1NMZWFNenozdS9VbFBvNnArejNDV3I3akRtTFdvRmdYclBR?=
 =?utf-8?B?L3FzRjZJcUJLdStQQ3FBb1RXY0RPUFFaVGtFdndMcGJ2ajdvM3JQeDBqYzZR?=
 =?utf-8?B?SkNSQTJ6TUNsZDF5Wjg5bGFPdTBsd3ZBRHlnSDJRZ3JNK0lKOFFJQytpb1R1?=
 =?utf-8?B?ejFIUGtaL0tldXVIS3FxejJzZjhGS0lwclZ4S2ROT1NuaVQvY2xnNmIraGx4?=
 =?utf-8?B?dU1RY2dJcUhjTTlGYVByTkpuTFdmSjZtOVUvUVJKQTcybFY2a3RBTEMvVDJN?=
 =?utf-8?B?RXYranpodUNHemp4YUFLQ0t2NlErb0JrTnIxaTRhSEtudVpYQTdCS0dvTkd1?=
 =?utf-8?B?OC92L09wc09mTjYzRmhWUjNEWTI4TUpCTDhrNjlSeE5uVjRjRGp1Z2VtcGNr?=
 =?utf-8?B?aU5iS3hVaDhRMTV6V25VUGh5YVkvOFJQZzQ2MkVWNlI4WjRSN3A1cGRRV0ht?=
 =?utf-8?B?Y0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWc2TXVKRWF4aTFsanF6YmhHdTRKSEhMZld2T3pMeUlDMXpDZDBibVJQY2VE?=
 =?utf-8?B?ZHZIdktOK3lmMmR3c1FaMnBNSE5OUGlyQmVVZXU2aGdDeDIxNmVtaWxiem5C?=
 =?utf-8?B?bWlOWUVHU3M0YmtxVmRpK0QyQzdkbTlZKzl3cjR4eEVDcWdDODVhZitTbzlG?=
 =?utf-8?B?SGcwMXY1ZjFjUHgzTEFySnJydnJoV29yVjV1NEZZVEZYRmVpNEx5azgyT2Fn?=
 =?utf-8?B?OFZnM0hYRjcwRlJERGs5UWczTy9CZ2FOQkJ5cHFycXBUeXU3L2Q4blFlLzdQ?=
 =?utf-8?B?ZFlwdFJZVm05K3Ztc0tDSmhKRURSOXZ1V3c5ZHBCeHUzSE8valVvT0ZUSlVh?=
 =?utf-8?B?YnRMOU9sNTFpK2xnQkhIaUJ1Y1VGRVNmNk4wRkI1MWhEbURRYjlTV1JWN1NG?=
 =?utf-8?B?YXI5S0R5WmhCZjF5ZDZWeTlFdmROQUFobWtEcUVFZmNKV3JFSW9QV3J5T3Yy?=
 =?utf-8?B?NDk4akFmS1VXZFpFQjN2R1JHKzJMZ2J6TFdoSktFaERZa1VQRXFDWlAzaW82?=
 =?utf-8?B?WFpncXI4SjNTdkQ3UWdWT05taGRWQktGMnhNekJncWxMd0p0enZqVHFJUGx5?=
 =?utf-8?B?Y1B6TVVNNytYQk1hUFA2YjlqakpVR1VFZFdjb3F2WmN1cEdkaVR6MjBnMFNn?=
 =?utf-8?B?K3duc0ZhcUpPVEphZWZ6Y0xaZDNZTlg1VU5aeWpQWkwxNnVlTEVTM3grUWF0?=
 =?utf-8?B?Wlkzbmp0UWJWWlNPUEdVWWxadEQ0R0NUR1Z4alpTSW91QWRIeVdNWmxNVExJ?=
 =?utf-8?B?VTZUM2V2NW9zVVNTZnV3WGxWazl2WnRhSjhQaVMzOFA2VVczZW5MNUg3VmR6?=
 =?utf-8?B?OHdpNjdYYVh2Z1RSdlBSZDB6TkdudE5WNG5FWW9waXZwV1B1U2E3MTM5YndM?=
 =?utf-8?B?SXdqcEQyU1BCMkFtQUtBS3V4Tyt4Yld4STFTZVpzMmlKYjd5T0ZySnhJcTBU?=
 =?utf-8?B?MWdCdENWOEw4SmNPRTBsU2pWZzZrOGEvZHRFUlhjZFBOYmJmYnN4V2JuU0NF?=
 =?utf-8?B?cHpxRnFIQzg5MGxIalAxYW1uQ2l0NWdOMm9aaTBoL2d2b3FPWEJiVGR4VCtm?=
 =?utf-8?B?ZTNFK0FIY2s0a283SzhWbnhBcWRSaFZodGVHZlhwVlhXWmxRaXQrNGp6OCtn?=
 =?utf-8?B?dEZ3aHFLY3E0RWZSQ2hRZ0xGcWlzRFN5bW9DQkMrNDFMc2RXVUNGREdzYm82?=
 =?utf-8?B?UTJZQVczdHRreHdySGNDVmVqZlNJV2xPS2MyUlJpeDNybWFMc2s3bzZzYVg0?=
 =?utf-8?B?NVdMNWh1aGx5S1BtS0RBam9HbDZqQU5HTFN3Rmd6NnE1TlAwZXhJTW1NbG1k?=
 =?utf-8?B?aW5GZ2RxRFd3WTMwTk1LUG0xTU9EdVY0czJwK1VDTHRsUGtlVDVrVllVKzA2?=
 =?utf-8?B?WUpZV0cwcmkycytWdzc4QW9jUVV0VGVDY3RpOVF4T1RrNFBuNmoxR3F3dDM3?=
 =?utf-8?B?M095OTJXVmJtSXhkMWltNGlhTWJQRWg5T2NveW5oTHYzY3ducmoyZkpuTjd6?=
 =?utf-8?B?U2hWaGE2M25jWTA2WURTQlc5SmVnWStVN1Nic0Z1WEI5UXhRUzV6WENnbDBk?=
 =?utf-8?B?eGp3YVZTaUt6b2Z1a0dBUTNCNjcyN3pGcVA3WmFzQzNyc0lzWTlZWUdWQWZM?=
 =?utf-8?B?WTF0UFNad2M0c3NaK2hVdFB5QjFqWUlSQjlNRnJIUDNxYVB5UjJXdXVGVXhM?=
 =?utf-8?B?MVFDcy9zRGM0U2F5SFhuQ3pZb05rckJVeTRjM3FUUEhoeEp1bVAyNDU0c2E3?=
 =?utf-8?B?NGZHZXNmRWZibzRLZG1ERForRnNnSGlJbkNjRkt0d3p1NjlaWm1TVDJkOUdY?=
 =?utf-8?B?RERROW1qUmdTeGh4NVZ6QXRQRDBWMUxKZzZWTXZ4bmU3RHZJeHVyeUo1dm16?=
 =?utf-8?B?Z0tYY0RDcWIvMWxNd2JXMlRoS3g3YVhmVmZlNTFSTUdPajNSbWpPMSs4YWlG?=
 =?utf-8?B?S1ErVU5FUFh0dW5nd2dlWWhEeVhYT1gwQVAwVFpYcUFCS2EzZG1aZDB4SmtF?=
 =?utf-8?B?RG9NVXA1UGxuVEhVZWVHMnR5YmVaZzVSc0s5eE8vc1V3dktPcVp2b011TUFG?=
 =?utf-8?B?RWwweFNhQjNleUVqWFJNU0VnMlJaYXhWY3dIcWVmSE04c0IxdEo4bHJocFdv?=
 =?utf-8?B?eXJKbGlaRkM4akhuV0Z5NTNkZnlEb2FiUk14KytsZlE5ZmFiZGxyOTZvbkZn?=
 =?utf-8?B?QVhFYW9pbk95Q0Q5NGhrSW93R2VadXY1V3BTdE5HMk1GcllHQjQycEpUVE5a?=
 =?utf-8?B?YnhPbXo5OFZGbkVkM29QcVZzSHBJUXNUUGR0K1dIK1lETER1TVJjM0NxM1I5?=
 =?utf-8?B?aVdQY3pIQzhCL2dGYzZnYXAxaHlvQmdNWGlLb1c1YW1RcnlrN0VlK1RRSUk2?=
 =?utf-8?Q?30S9OWOGp7F8ecADA89RkK9q5ISOCyiV+c0XOPJwpuit0?=
X-MS-Exchange-AntiSpam-MessageData-1: PBAtvVDEKkYC4w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaae5ce9-4c7b-4ed3-11f8-08de73b024be
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:30.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aArpMCrzG2vEP6B/4BJMejoGDL8sremlfLVWAPu6/JRyKsPXr3VdVBHHVQDsISqmEvxTaURGVlFw91vDys+Bqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

By providing the required `IoLoc` implementations on `usize`, we can
leverage the generic accessors and reduce the number of unsafe blocks in
the module.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 103 +++++++++++++++++++-----------------------------------
 1 file changed, 35 insertions(+), 68 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index fdd2549d8e13..256eba16ccc8 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -275,6 +275,25 @@ fn try_init_default<F, E>(self, f: F) -> Result<IoWrite<T, Self>, E>
     }
 }
 
+/// Implements [`IoLoc<$ty>`] for [`usize`], allowing to use `usize` as a parameter of
+/// [`Io::read`] and [`Io::write`].
+macro_rules! impl_usize_ioloc {
+    ($($ty:ty),*) => {
+        $(
+            impl IoLoc<$ty> for usize {
+                type IoType = $ty;
+
+                fn offset(self) -> usize {
+                    self
+                }
+            }
+        )*
+    }
+}
+
+// Provide the ability to read any primitive type from a [`usize`].
+impl_usize_ioloc!(u8, u16, u32, u64);
+
 /// A pending I/O write operation, bundling a value with the [`IoLoc`] it should be written to.
 ///
 /// Created by [`IoLoc::set`], [`IoLoc::zeroed`], [`IoLoc::default`], [`IoLoc::init`], or
@@ -369,10 +388,7 @@ fn try_read8(&self, offset: usize) -> Result<u8>
     where
         Self: IoCapable<u8>,
     {
-        let address = self.io_addr::<u8>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 16-bit read with runtime bounds check.
@@ -381,10 +397,7 @@ fn try_read16(&self, offset: usize) -> Result<u16>
     where
         Self: IoCapable<u16>,
     {
-        let address = self.io_addr::<u16>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 32-bit read with runtime bounds check.
@@ -393,10 +406,7 @@ fn try_read32(&self, offset: usize) -> Result<u32>
     where
         Self: IoCapable<u32>,
     {
-        let address = self.io_addr::<u32>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 64-bit read with runtime bounds check.
@@ -405,10 +415,7 @@ fn try_read64(&self, offset: usize) -> Result<u64>
     where
         Self: IoCapable<u64>,
     {
-        let address = self.io_addr::<u64>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 8-bit write with runtime bounds check.
@@ -417,11 +424,7 @@ fn try_write8(&self, value: u8, offset: usize) -> Result
     where
         Self: IoCapable<u8>,
     {
-        let address = self.io_addr::<u8>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset.set(value))
     }
 
     /// Fallible 16-bit write with runtime bounds check.
@@ -430,11 +433,7 @@ fn try_write16(&self, value: u16, offset: usize) -> Result
     where
         Self: IoCapable<u16>,
     {
-        let address = self.io_addr::<u16>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset.set(value))
     }
 
     /// Fallible 32-bit write with runtime bounds check.
@@ -443,11 +442,7 @@ fn try_write32(&self, value: u32, offset: usize) -> Result
     where
         Self: IoCapable<u32>,
     {
-        let address = self.io_addr::<u32>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset.set(value))
     }
 
     /// Fallible 64-bit write with runtime bounds check.
@@ -456,11 +451,7 @@ fn try_write64(&self, value: u64, offset: usize) -> Result
     where
         Self: IoCapable<u64>,
     {
-        let address = self.io_addr::<u64>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset.set(value))
     }
 
     /// Infallible 8-bit read with compile-time bounds check.
@@ -469,10 +460,7 @@ fn read8(&self, offset: usize) -> u8
     where
         Self: IoKnownSize + IoCapable<u8>,
     {
-        let address = self.io_addr_assert::<u8>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 16-bit read with compile-time bounds check.
@@ -481,10 +469,7 @@ fn read16(&self, offset: usize) -> u16
     where
         Self: IoKnownSize + IoCapable<u16>,
     {
-        let address = self.io_addr_assert::<u16>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 32-bit read with compile-time bounds check.
@@ -493,10 +478,7 @@ fn read32(&self, offset: usize) -> u32
     where
         Self: IoKnownSize + IoCapable<u32>,
     {
-        let address = self.io_addr_assert::<u32>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 64-bit read with compile-time bounds check.
@@ -505,10 +487,7 @@ fn read64(&self, offset: usize) -> u64
     where
         Self: IoKnownSize + IoCapable<u64>,
     {
-        let address = self.io_addr_assert::<u64>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 8-bit write with compile-time bounds check.
@@ -517,10 +496,7 @@ fn write8(&self, value: u8, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u8>,
     {
-        let address = self.io_addr_assert::<u8>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset.set(value))
     }
 
     /// Infallible 16-bit write with compile-time bounds check.
@@ -529,10 +505,7 @@ fn write16(&self, value: u16, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u16>,
     {
-        let address = self.io_addr_assert::<u16>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset.set(value))
     }
 
     /// Infallible 32-bit write with compile-time bounds check.
@@ -541,10 +514,7 @@ fn write32(&self, value: u32, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u32>,
     {
-        let address = self.io_addr_assert::<u32>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset.set(value))
     }
 
     /// Infallible 64-bit write with compile-time bounds check.
@@ -553,10 +523,7 @@ fn write64(&self, value: u64, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u64>,
     {
-        let address = self.io_addr_assert::<u64>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset.set(value))
     }
 
     /// Generic fallible read with runtime bounds check.

-- 
2.53.0

