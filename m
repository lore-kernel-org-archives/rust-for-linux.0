Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D43CE4A6;
	Tue, 10 Mar 2026 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128696; cv=fail; b=bx3VQNxcquNY3lPTKxtumUAh0lN7Ji8YiWdOGXUT6+Q80HvYEX42t4FKQgEX9w/4FUNmWIDMj/hy+qlWu3LhfKLNJ4gmDvOEH+db+qySDbRN0bbAvECrUeHXtWCLQwhxB/6LGMtvQJSrAsKYC2tozIRpYHhUPrp8EoNoezB4CL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128696; c=relaxed/simple;
	bh=WEQ43qGNbiut+1jHeJSLfd1W/41cmM8AJCNvRwesqnE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=jz67HhTl+yRCxmvMtXV/4HHoVR6TBqvP3qNA6MWet6sxaGRfxGgCQ92CGcOTKzEwdR5bgMAAEBQJ+q33EWP69pqcPYaWG6SL6vvrk6Rh5F01pJRLJ8ImRUSN5umP4YyNbLvjx+10Uu2rOlXr6AbDHh4KA/vskqQlLwJAAsnlFGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i9ulPznb; arc=fail smtp.client-ip=52.101.52.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i9ulPznb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mf/9pxSLjlITUHN93m0eDbUoigDa4hmzQBhEWkw74KR3U0MKhyHwLuMyPW7OE5fLH1tyV/2SVk1hMiJ4wNZ5QlKq6FIjJmcVHGydqHr5znUiMr2fsGf00C7HtO9dL2y+BGLxQuLRnzGe6QbrNEJrvmBKaVMePIu3x83ecFSB6V6/Mqv0u+1tx1aXNmsTCadA2spziop0XnMeYu84XHbKon31FPhj3P2+7qLmHlB8xvwdXECc3R8Z1lJIIzrV83T1uYqtonEP1T8eWVXqC7nqHcUZ9OCcvmFlLZL5hxXM0dFcrFbBiFtF5Pk8cGY5gDt2F9hPnyW3+Rwi3bSRhMi0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEQ43qGNbiut+1jHeJSLfd1W/41cmM8AJCNvRwesqnE=;
 b=Yu8mCMveMRYKr+G1pj/6/L3WlX4E4Mff30psSj1z138T6n3K8v1OlLya59IaYJ9hmuJddvsYISr9iPagFzPRmVqsoHXd5GYT3Jb085cE0Y/01xg+BEd9RcYnYFAddBJokLTCHsW6aaqgkfW4ZDo4E0tOUWkPwONtRCcg0siF2BWjnnPnyBPaYAjxvqENt6e6uA5mquxqr/AIOQq2lNu/OrX5+9zp2TYB+PLwsCKli78fpVnfveR9+rkhwpwsywLVjRCezbNMXRsbTC6EY1QbrFzRmsKdMlsukPEWmxZ//6H6+93Q3TRQ+dD9y5JtAizO16O6BjF+EUqbvpv/XmcGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEQ43qGNbiut+1jHeJSLfd1W/41cmM8AJCNvRwesqnE=;
 b=i9ulPznb0IXIvjfBnTG4nS6etijJD84v4R1SS9BicXbrU1RwgGIBathybXhu28Umba0yJkYpJgrZdZNVwuOKECncvtX5jcTeVuDddqMF0nVLL5j+/flabXmMFssIv1Cw/exVeLFrbo162wcsGSfXkhBARS4+m1kVz2WD8Gu1l0CVpnxjK9jjIMl6dUEyq0Nwh9UkAYO/t3uSI3u1uX/P3J0tB2v7iyxqlhraP5H8LKdx9TIeXRbauZA0d3DyJXIi0BVKZRw/ilRkx4Y9itsqKuYxE3oQU9Fqp9cL0U2W7zMML8X67CD+kehqNsqkuUpN8f5PlQ3ApELmBXDIefX47w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9816.namprd12.prod.outlook.com (2603:10b6:610:262::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 07:44:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 07:44:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 16:44:46 +0900
Message-Id: <DGYXNT6J445H.3C3A7F3BJIACJ@nvidia.com>
Subject: Re: [PATCH v6 0/9] gpu: nova-core: gsp: add continuation record
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
In-Reply-To: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
X-ClientProxiedBy: TYCP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f23a615-2dc4-488e-dd0b-08de7e78e818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	ey2Dwaf6PZ9lCS4mtgeYa5JrgZWEGcjGawLG3f7vBhLHK7Il3TqkDgaDF/AhnFcwBzp0XbSdc7TZ59hn6cG+2a5oVgZZhlQ6YwXmGN9fdgCI0aBiKbwMhJ0hnoe8YQGKgjFJlTdqa9+uKEtDy3I6h59+bWPuA0U3OC9V1pxmdoz/l4QYQ583nF2ekQPCY27pL5mTx/boNSYTnQpZk+quhdCDXLnTMrDJDoQPOkRThwmhisKwPZq8SOl6CJJDQP0fgwmuVUCYYik/mCJsjihlyZkwE+xZO5KJP2RUf5DsXF7KudUbmNoewiVTTInFN8xBVs6i3TOateiLb5akdSR+Vyofy54QvSePcW+3wCQ9w4xp+qsLt6aF8JGTXEFNQmWY3M+Wy950Gly/JVpNnD9PzrH0VOYMLZo18Kp/ROHeyhnYalXE1vOyW8FfNocGClkXBk8TzrbfUqiJT0NZD7y3jfODj6B7SXVGK3CymVrayhTx2+l3y7Lp/M5V1fxxxTUr0Lmfe5BY9BBqm/WgCuSQjfjQNWW9LsUPusfXowG81zpfdFHQxtMZWOcTiRit9yrRlE7hN0ggfncjsMcoXW0cOKHI0pA7M+7MQdQ60DRbyH5ye/HNk5O3SFInjxiaaWJons7wUrysXoYxRJKHroyF3hZQKfFLkqZWEMguo6b/J5RDG/b8DBtqH9XlbkmAm+hT09aWYQKJkaAJu/xHaSnCdWs4kCIPwiCl/vjSdJVZSwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3NsaVNVSTBFUSs5YmJ5UTRMOTlwaTNscmVsQUttVjNxaGNjb1pBNHBrY0x0?=
 =?utf-8?B?SjBUWTMvbzBIRVpxNEpPVVIzQWFOWkxuMG9oZkdwRUx4aC9hb2FOdjdPU2hP?=
 =?utf-8?B?WENIVjl4cUkxR2NRYnBQR21McGxYS3ZDQnViaXBQbXFZdDNRMDRlcEgxMkhI?=
 =?utf-8?B?dXJMbVUxTUFLRHJjL050RVpSTmFSWmQyWlF5SjBSV3RIUVIrcUd3dnNuVnFn?=
 =?utf-8?B?ZkZJVnAwY0tac0lHVUF1SDN1b25pYWxZekxPbUd6K0t2NUZOVGFzV0t3ZlFq?=
 =?utf-8?B?UGVPUjh6eEpPcjJYZHAzMFBiWlQ1T01OS3hrRFNLbTY2MjdNVUc4UDRRSnRK?=
 =?utf-8?B?aUdTSG1qN3ZtakVMYTB1N0dyUXJaV0F6bjlhejExNU1QSXZpYTFDaGNBN1BW?=
 =?utf-8?B?YWdZMUVyVjNNanlkK3I1eUxTRmRySFV3MHJ3WStlT3ZKMXozNWZiSExHRXFB?=
 =?utf-8?B?dkdBMk1kNGRUS1JIQVFFQUI1RUJLTGEvVGVoeUxvazYyd2lBbGZMUUU2Y0M5?=
 =?utf-8?B?OFY4WHdsM0VLaWdBT0NMemhZVjhGQXFxdFVyL3VDTFMxNTVYMG1RLzlQWW1j?=
 =?utf-8?B?eE5VTFBMWjRrY2NoRjJ1WTFzSkJ3RDMyNXJ3ckxVdThydWU3WTUvY3lPR0cv?=
 =?utf-8?B?eHdJTWNkb0RvRWE0QjFaNnJodll1cGplOHRQUEFuTXRWNG14Y3E1S1lZc3Bs?=
 =?utf-8?B?bm10eEliMGt2SjVjL1drSFVCT3drbTdibUFIaGdtbklROW04Zmh1cVY2dU5q?=
 =?utf-8?B?cUl0YnNIbTE4YVFUczRoZldSS0ZpVXhFOG9QLzhwZ0laWWpocDNsVW9wN0x5?=
 =?utf-8?B?VHhkZ3k2UHdnd1JvWEpGUmhVN1VmN0JqQ0ZOT0ZRcFRMdVRVamg0d2YxSmkx?=
 =?utf-8?B?b056ZGpHS2xNaURKSXI2SnVlYzFFM3ZEbEZaeTFGdlp5LzZRWEJVTlpmaExp?=
 =?utf-8?B?QVNZd0diSU96QnVsNmFpVERwSnk4WEtQSTd2dm1zQVYyRmdKSUl1dGZ2T0d6?=
 =?utf-8?B?elVSUVd6Wm44TU1GWmhySm94OFJUdVcyNUJDbEsyaHFGM0ZuMFN5aGNYS1VL?=
 =?utf-8?B?K2VrdVpiOWYybDEvYzd3SHN1N3BUaXdVQnhjS2tjRGVMKzYyalhYSFFicjQw?=
 =?utf-8?B?QjluWVFneEQvWjlWZFUzTnBpeGxLVy9JbW92VDU1ajg5UDZUWU92c3lVd0Fn?=
 =?utf-8?B?YWR4UmZybnQrKzNtdmNaNjd3SnlSay9pUmNVZTJwU0FpTmdKSU8wdE9KRU9o?=
 =?utf-8?B?T0o2dWVLU05NcFEyMnJSakk4M05qTURRL1lUMG1ZTlUwSSs5NFVSZTlLMnRH?=
 =?utf-8?B?SllCYXQxWlJhcjVBTlBsTi9zeXZmR1V1bm56TjhPa3VUNDdSdWxwUDZZY1Vt?=
 =?utf-8?B?S0RLRC9Gc2JROXhXMHlSM0JXT2hBd3gyNWxrbFROVVlCWVh5b29kbHpTNE5Z?=
 =?utf-8?B?ajcwTEJoRG5pdkY4dEZCeUdsSlZLdDNTeVRUdmFJNU1zc2FSQVF3bTVOdXZV?=
 =?utf-8?B?dTNTd29SaHIyTkZFYWZST3l2UEU2cDU1a01ndmdyaDNLWmZFZjVITjRMbXM0?=
 =?utf-8?B?ODNDRVBMbG5vSUV2azNNTTJGUElYNkdGa3hrMk9tYlpVcTdhL0xyOGozeFdJ?=
 =?utf-8?B?RG9SZFNveTVQeHZQNVdyOTBVSGFBRnVZd1M1MGJNQjZRdEQ4cTdHbXpLSUky?=
 =?utf-8?B?WEVaQ3EyaGF0WVU0S1M2amNaRmVwNHh6WkRqbG9RREEwaytrVlBKeDF5TVhL?=
 =?utf-8?B?dDJFU0YrU0w5bi8ranpqTmtiSGVKUUZWTUVXY2t2NWZtT0RGMDNDaldQd29q?=
 =?utf-8?B?UStvUHQrL2V1eFNjSFNlMmRjajAzY21Qek5nVzVJQ0IwVjBUblNsSWtYbUlE?=
 =?utf-8?B?SGlSNlpjUy9KU0ZtbTZaOFJpeXJzUC9GMWdoeGt1dUl5cWx4WTZxcy9VU2g1?=
 =?utf-8?B?QUttYk41TXMyM3BTZmpNSmE5dkVUOUNEMUJ4YzJhSlp1THE2NWczSnBFQkps?=
 =?utf-8?B?UUo3ZXd5V0V1NDR2ZjgzQVVNSEZWbmZjNjBaMjc4WVNZZzN2ZWM0M296citP?=
 =?utf-8?B?TVR5aWJ5UW1hUjY4SG5JdVEzanFYYVlGU09MdXZrZlVVVVBTTjZqUFo5Vjc3?=
 =?utf-8?B?MFluV21pTjNOVDA0NzI2RkRiV2xlMHkvNkpxZXlubVAvRGM2MVlETThDaHc4?=
 =?utf-8?B?eTVCL29Ja0t4MVZjVlI5TDVDclZvajdYQnRiNmxiRlZBTVdWUkxVcmlpSGJk?=
 =?utf-8?B?UVVhTHdLZnB0RTZRU3pta1l4cWtIb0ozWDV0RGN2UmlJUXVSWG83Y0hxVzZQ?=
 =?utf-8?B?bHBWWWdDTkdCT3NScTZFMWpYeGxKSnJjblIra0lLaDNSRmJXOTBxdEtNVTNW?=
 =?utf-8?Q?glvL3bSv+P/buu1ia8pWGRR3shXxrJRZNporTSbH8FUUF?=
X-MS-Exchange-AntiSpam-MessageData-1: OxaT+1Iwo8mnrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f23a615-2dc4-488e-dd0b-08de7e78e818
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 07:44:49.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqZbOrVJrsLhtqigt5GX1pJvDSu27oYFEUChDDRpHrs0mVizdRdk6DGH+2ynopcKnoMQZMdbwWBhVihG7PkZng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9816

On Fri Mar 6, 2026 at 4:21 PM JST, Eliot Courtney wrote:
> GSP commands over 16 pages need to be sent using "continuation records"
> which essentially means splitting the payload over multiple commands.
>
> This series adds a command type `ContinuationRecord` which just writes
> its header and whatever payload it is given. It also adds types
> `SplitState` and `SplitCommand` which support splitting a large RPC
> into smaller ones while transparently letting regular sized RPCs be sent
> without extra copies.
>
> The send pathway uses `SplitState` to send all commands, but if
> the command fits into 16 pages, it still writes directly into the
> command queue. If it is larger than 16 pages and needs continuation
> records, it writes into a staging buffer, so there is one copy.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Merged to drm-rust-next, thanks!
