Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC38350D4A;
	Wed, 11 Feb 2026 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835749; cv=fail; b=hyA59/fQzGPhFJ2RxubCqyUVfSgtE3wLk2CmjjUtax4j5+Pj+PcmkYxAjlUncXZZ5FJWvD5wdHh9nPUGy3YzcJHLr3rAsFyZIwvx+2L+KpcQBvbvbEaSZPEGX5lN11oTrfTCDv2YkorEynJ/IRk5MMy4/9t5pNU8T6HKlJLNXMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835749; c=relaxed/simple;
	bh=Vj1PCxQzQU1j08XUHTDu9eI7MnKkpyw+6IgLdgEuxRI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RYC19bSfJCmo9h7djQX2hHJu7tPA/SzN7pLZRGgODflDNyiiydHw6vF0YxMf4mnbTzcsLsS6TQ31KXS9OHF3Xbuezxaj54hOO9GHH8QltYw8CZI0WgW4UQ0HpaFaizBi86BTP+3Nqi7wfzJfaXxMOmUI0E0qW1WGUXIhgy8SPbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RS5gqVDj; arc=fail smtp.client-ip=40.93.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RS5gqVDj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esQ9YCqZ0kdmlROJT7YmfcnuBuQU4f8AIPnUWwo2QezmvF4icOs6cJJyt5bLeh9cd9KQd4ixlZD2U7rJ2CtkpRnOnUPKuV5ywhNWsELZn5FSRtzV5NneLdes3JDD3frDaF4BhbhfkDSD0X/x1ag/qzOew2Z3tpkgSg1y+R2DshQzy50C9r3FAGudd4y6AX5SQjf4oEoAWFJoudcapxqrqeLQ6TYQPlMGvIR4ko+hkFqgGtmUlnlHw3hlLu5CMIMoS3ZhlLMnzJizurpRoDYJihgSVshkFKC35ZpgpaM4W3QYTozeEvE/RyNdg7MrnvGMTBXBbSbTVBFbqf3K/N01BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYgBV99zWcouAyrmNeYqsejD5FSj6ZNNKorPBGqr2yg=;
 b=uQbzpL0d3wB/Zt0OLazpLncS9ZQmxkfXSp9t4bterY2oxrTSPB0zSsOHuE8uMZEXwZtY/0XGiSbVqfoIss4WAcE1xtenpdTd5xgpfDjFpfPL3mTtKejEzmNpmw27HEy2xiFqMQG2pkujmQ7rRfeWyZFtBs9VvUnEs0glmWQXVL+y8xapb4/IbJiKAGmJqXMqQ2+qmcMlKBsoxl6VW47QIQI90qNTsvu36zMw1Q8p6sXdgWyWrZpPeydlLcxXrDsbN9tlpKaOx5D9opcuu/BtnRoohu1vGpDisyYACmOn8bFLPsr1oR6eL5J6rmDcpVPUqEr7WblSX9QF288zSCy4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYgBV99zWcouAyrmNeYqsejD5FSj6ZNNKorPBGqr2yg=;
 b=RS5gqVDjDqpNOQNPeYzNGJNMNJRwm7AU9kx/pOhYYgGM07udopcwzmdCnNLGuQ8EFP6I9zhuf7uMNTpJCSW5AqBq99+83ecRJkQKKKw4FlX9+L4/Be6LxgANmVmylC28LZTEMKnTLS6XT9rFn2E4k2Tr8h5gsQf2g8VLnrAnE4Zi1Z2tJotAM7BxylEkFD2OqzRpoqMtvn64i7pU2WOrJ7ZUxoYyQ3FGC//pttHcx6hriROlZEY2Iv8e0Dn036kL7EkLCUt1oxvY7d1iwegx+wKl5/vcGbb0MwvK7oPy4u24veRIKJPu+QF5ZHt4eHiRQ5vTkwaCIekML1pEAsDfjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 18:49:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 18:49:00 +0000
Message-ID: <544f9306-131c-4dbc-93d8-7d0231a2a5dd@nvidia.com>
Date: Wed, 11 Feb 2026 10:48:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/33] gpu: nova-core: pass pdev directly to dev_*
 logging macros
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-2-jhubbard@nvidia.com>
 <DGC1RZKMETA7.1O3XLC1N090G8@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGC1RZKMETA7.1O3XLC1N090G8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a5f1d1-159e-4d43-828f-08de699e3857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlZBeXZLbGlSNEE5aFhaWHZPRmNSZzFiSjlyeFBodnRqSmM5UElvdzdzc0tZ?=
 =?utf-8?B?dWJEYmk2MHJadlFINVFBZTJZdzVEWVUzQitBdFFsTmRxT3ZOSCt0QmVpRXNy?=
 =?utf-8?B?WkFSQTA4V3cwaGQ2WU1TZUQrU2NEQU4vRzBlb3ZNWmR3SGdnb2JZa01XUzZ4?=
 =?utf-8?B?M3diVnZKQUZCaTdUZ2swQmFpVUJFaUJlZklSWExZM3ZENENYK1lhMTAyWHhP?=
 =?utf-8?B?M2tQTlZ4bDhXa1k1RTlEZzJZOHZFQ203c2x1bG1pWVNVRFl0Z1AwKzF3SmZm?=
 =?utf-8?B?MWpTQTBxMVZnMlBDblFkM2J6NUhGcDFoeDFBNUhSOUFMbE5CUjRNaHpZR09S?=
 =?utf-8?B?UytsQXN5OThtUVdVamsrMFl5enJZSEZ5ZmloRGJLMmVGZ0Z2NWVDQ05zWG0v?=
 =?utf-8?B?NUJjckllNEZQOUtoSGFtZFA4cDZLOWVrZXYvWTBUVFY5WXpYS2F1YXB3R1Y1?=
 =?utf-8?B?dXlyOUxWc3RLSyszT2VMU3pkbjZTY0prLzNSaVRKQWZnSXlGZW4yQ0kxY1pR?=
 =?utf-8?B?aHRzOVVRZDFEWFRrYmZYUXJ2bTM1ajhRUGJhRjlCdStEcERzc3dIZG5xVDV4?=
 =?utf-8?B?ekc3WEl0S2Urc002Zm1tcWFoNGJhMGhFYW9pTjhIOWsreG52RXAxYW5ibFBx?=
 =?utf-8?B?Q1JjWnc5dllOakd3NVJ6MmFVMmFkUURCbTQ3MmtGUlBjZU1USE1zWVNQQlhK?=
 =?utf-8?B?c2hpNGV0T1BPUzluR3pNQTd5TGN4Y1dVSm5xOGx2b1BwWWNYbkxtZmF0S3VL?=
 =?utf-8?B?cXJRa09MZ0pwT1FTWVViTE42ckRlT1RaOWpBdUd2c0hOVjhFSEhTeExFdk1p?=
 =?utf-8?B?OXVDb25BaW5nbFhScnprRUZhL2NCNGtsWEVSd0libzdyMTBQblZyQTExdTJq?=
 =?utf-8?B?cFVnSVYwNm1IcmF5c0FORzhLaG9lTTN3a1RCWHVGd1dhMTIwRjZvd1I3T1lQ?=
 =?utf-8?B?VVlOZnJkMEwvL1ZSMmR5UkRENDJTY2JtaElwcmJybFkrNytGWnI5YUNTa1Bw?=
 =?utf-8?B?dmx4L1NwdFgweCtmb0VBWGw5cEFDQjJRUVRPa2hkK0QzQ1pxRCswQmdId2Yx?=
 =?utf-8?B?T0NqMzJLZHUwTUxpTzIyM0hrS1NjZHVTV2VNVk82SlZJZHhtdWJXOFN3SFdK?=
 =?utf-8?B?MHNEeTdTYStSS2h3eVZYSmV5OWFWTXo3V0VvYzFrcEx2R0dvSlRVNlg4TmJz?=
 =?utf-8?B?VUtBT3RIaTVzVVpSS0xvM3JMQW02NUY2QXRmU2JuamNqQmE4YzhkdlZhS0Ro?=
 =?utf-8?B?Q2ZDazJaRHNFcGhwbjZLVlRqcGZUaS9pQXRYL0swV2FabUNZQ095OXBNZTNh?=
 =?utf-8?B?UnFTSWphOWNpWEVNcGt3MDFNZWd4TW9hWUFURXMxMEtRczN4MWJIQkRvd3lN?=
 =?utf-8?B?NDdFMUhLN0lVQ2t1U2JUR0N0TjFTRXVIY203eGZDQVNQVVV1elFOVDB3Z0Qz?=
 =?utf-8?B?NUdGbWFTN3l4Z2krUE00N2hYZnFGUmRLRVRyUW5ua1dNOEFKQzhaYXVnM0tT?=
 =?utf-8?B?K2xaQjdYWFN6M25WTXk4eEx1Z0hqNjBROXZNQWZSOFMraHd4RnJwZ1JMcVVO?=
 =?utf-8?B?cHZodUkwNE03WWYwZExucisyNS9KNDQ3a1B4SXphZ3hXMjNvYXRUQmZGaWxM?=
 =?utf-8?B?eTlRRDJoRDlFVDV5Wm1UeG1tajVGQ3ZNNjdQZXNWVjdIQVNUNEM2M01VMUJp?=
 =?utf-8?B?M1FQenNtbnlXOGk3N1BkZkNDU0N6TXFZQXBDNUhKamJFNTY5eVpHZklMWWVl?=
 =?utf-8?B?L0tzb09ucXE2czNSYmpCZk8rWndybmx6SEFPeXBySW9ySm91cXZrS0dDZEZj?=
 =?utf-8?B?WGZPTFlTL2ZNeTljZTBuekM2Y2d1RW5KNVlaYU56dFRGK2pqZzFNSW1qdVBS?=
 =?utf-8?B?MndwNWM3QU9XbGRscDh1N2xVUHpxWnEvUGg1Q2dHWEd6ZXZBdWh0NTRuVXY5?=
 =?utf-8?B?dmV4ZjRNenRSV2ZlWUtKNHF0L25wRmUwK1VaNXpCMDQ3WUE3aE5OMDVUR2Za?=
 =?utf-8?B?ZSswckJZNzlRRXhEeWxRZTllZkJ3cEV6NE5UYkRyVHFjN1lhRXJxL0lhQkRV?=
 =?utf-8?B?M0o3NTVSbFo3RlpBUU05Z1FjN1lsMU9NL3EwcFRsNjFvR3F6YXI4RysxdVlC?=
 =?utf-8?Q?miOE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHV2aGdmaGx0M2c2S0EyMUdBL3RIRm1qMHFBeVZPOHpYSEN0OGV3T3hvYy9K?=
 =?utf-8?B?YVhERXhpUXIzUjlKb3gyc3kwNWJwYXYvcEFKUVc2Tmc4N2JnWmwzMHJsWWRY?=
 =?utf-8?B?ZjJHSXNpZVFzcG5Vb3lGN1NQOVdSQlpIdUt6ZmFjVW83WlVGenZ3emtZVHlx?=
 =?utf-8?B?TjRwYzZPNTViczVtRUNZaTdPYVJoclZPSlFsRGNyR2R2YmsyWmt3U01idWxr?=
 =?utf-8?B?YmNrdFZ0K2FKbnN4YnFweFBubTVxVjJhTGd0aXZYcWFaVWYzZkNOaVIzTkIx?=
 =?utf-8?B?NmhFRjJrMTd0ZUxzN01RMlRLVm5rTjYxUklSUWF0ak0vOWFEWkFBLzhwTXFH?=
 =?utf-8?B?UVh4d2lLR0N6QlV6REhadVREcUlHbDZpdHQrZnFla1RNQlNSSzJFd0JLYWg5?=
 =?utf-8?B?V0FxSVk1dVQzeXFrOG9DL2RPVWpRd0NOZDhRZ3h0UTBUTitKTEVnQlo0cnE5?=
 =?utf-8?B?TkR2Y215cVhPM2lEd1Zyd0VBZXluZXNMZmt5TXF0VEhNRkpSTkU0dFlEUnB3?=
 =?utf-8?B?MVVCby8vdGdSQllDdUZ2N29LV1pHRS9URHZmV05IRGRGOENVaTk3VGJ6ajRy?=
 =?utf-8?B?akp5dnBYTUJjZjVqem1TUXNXdVlyV0VqYnRsVW1LOGV6NnFTSHI3RWQ0Vit0?=
 =?utf-8?B?aFNieXJUaHRsYlU1MEF1Tis0em9tUi9NZ0dDRmFNQXlGOWorZDBheExPa1lF?=
 =?utf-8?B?ZllmUVBYNmJvcVFoaWpPd2lUNDhQenpWdE9FMEU4aDhYdnNWQkhnTEg0TWp5?=
 =?utf-8?B?K2I2R1F0UEFESUMzWVNSU3licEVwSXpwUW1BMk9NSThmTjJta1JCNmNIUVNv?=
 =?utf-8?B?WTN2VS9BRE5wM3IvdTloaXI2STExMXZheGpzZWxQL21xU01CV2tpb0E4d0xi?=
 =?utf-8?B?ZjQ2QjlzUWNBNHB1NFA3K2xwSG5Ub1Iwbm56dVZXV3lVNHBncVRhbUxlakw5?=
 =?utf-8?B?cG01bm5xdFN4cnhJV2ZCdzBwZUZRc2FHT2ptZVdkSDBNUjNUVUVxT0dmQXdl?=
 =?utf-8?B?Tm9GQk9MWGsxTXRQWUQzSXVnVysxUk1NMERZSkpyc2IzRW1NNlJpQWtQakUx?=
 =?utf-8?B?ckNiRzRmTUJ3eDNkOTcvY1M3UXZGQWxoZVJKS2ZpUHRBdUVzOTVzTVpXYi8r?=
 =?utf-8?B?LzMxK1B3d0lNZFdVN2Iwb0FVK2Y0RmtFRm1zUjZ4WWJQUzl5eHJIZ2pHa1l6?=
 =?utf-8?B?ZE05SkZ6Tm1IbHRZZUhYbzhNT1ZidTFGa1VTbVhqUmRMbmR4QXY1c3MxZEd6?=
 =?utf-8?B?dExyRHRTMGJITklaeUpDUytoeEZNWTNTVVBjOEhUQnQvN0VBUWdwT1FEQW1K?=
 =?utf-8?B?cklaTXR5dmJCTFVBWkJ2NSs3RlZJbENIM3FqMHVuYlQ2ZzFaeE5wOWh4dGlB?=
 =?utf-8?B?NXZwb0ZpUFBPRENmOXoxc1pzTjQ4bWUrZS91ZGNFV3dWcm5Qc0JDeXJOVk9I?=
 =?utf-8?B?UEsvU2cwUCtYUkNBQm1QbDFqUFpmb3JVNzNrTjR0eStNYjVPbVMzaHFOTVVt?=
 =?utf-8?B?eTRobnRZbUxmQmxVbFN6elYweFZqV1R4TjhPeERCNGxPbXA5QUNPQk8xUDlx?=
 =?utf-8?B?WC9ZVGtSUXFOR1YrTW9LOERobTJRWGU4aGNiaGhOWm9RRE5NQ2ZiRWVXR1Nh?=
 =?utf-8?B?ekh0ci9wZlBZdHpoeFkrdys4TStrNncwOW93WmFNeHc3UFpWYXFsOGNMUTd4?=
 =?utf-8?B?dWFleXZMaytha01wYWFCQ25vaFFDRDgya005NWhBQlExM2NlWmt0akVHWFR6?=
 =?utf-8?B?QnY1bDZXVXNpZm01S2Vsd1RjWjhCZ1pNS3lhRzM3eXFqNS8xaTdGUkJBV29I?=
 =?utf-8?B?WHlaR3A4eTlEWlBlYS9LSUk4d243SW9sUTlMc1RuUmFGQm5qbWh6RW1UeFQx?=
 =?utf-8?B?bXpMMTNvYmF5TkQ0S0dCQXV6T1hKSE90MGpJSHQ3eGV6NEQzdERtclp4NDBH?=
 =?utf-8?B?TmtmaWwxaFQxSHo2NC9WNHRWR1dCVVR1TmtZM1ArVTh3ZDVpcGFucGJRdnlD?=
 =?utf-8?B?TENuekk2aUJYV3JxdlF2MWJieFdJOEw1ZmovRWpXT20vaW5Hd0hMeVpCdUpV?=
 =?utf-8?B?UzZoR0txemwxby9xb05pTkRCbDFhcHgrTGVpNUxhSENEWmYvUlo4N25LZklF?=
 =?utf-8?B?L0c5L2ZFRXJkeXJjQ0JrMWtYcE5ZdTJWT2JWdHN3U1lvQUZNcm9uanljSDc2?=
 =?utf-8?B?dU5aOXJWekxVMFEwTXZWTUZRZDNKN0tzb05uSlBFb1A0QUlydTdDVTB2ZE5M?=
 =?utf-8?B?WDVveGNkbkNMcG1qNkJ0Zm5RVnBYSDRrTHcrOEQ4bjFjMXE4V1dSRjNDWFlj?=
 =?utf-8?B?UGY1aEcvV2NpbTZoQ3NEcW5kMGpYb01KZitrOTBNOVZIWmc4cTUrdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a5f1d1-159e-4d43-828f-08de699e3857
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 18:49:00.7103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gc7oYUXFsLUcGCfKyilI9tZqoFHAeR9yD3uZSu/g0u6WKjCyqyX0jPF+qqUYI2w9B5Na63bRDc+utq0K2KJYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982

On 2/11/26 2:06 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> The dev_dbg!, dev_info!, dev_err!, and dev_warn! macros now accept
>> pci::Device directly without requiring an explicit .as_ref()
>> conversion to device::Device, thanks to commit a38cd1fea989
>> ("rust: device: support `dev_printk` on all devices").
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> There is already [1], which I queued up for when v7.0-rc1 is out.
> 
> [1] https://lore.kernel.org/all/20260123175854.176735-7-gary@kernel.org/

I thought I saw that go by. OK, this will go away when I rebase onto
the upcoming drm-rust-next.

thanks,
-- 
John Hubbard

