Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D6322B72;
	Sun, 22 Feb 2026 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771766741; cv=fail; b=Dqq4xjYydZ3XRIv5+phpbh+VwP86WFsF6gLezofULDKiD+FEMIIv2V6nt7vD3MMhJ6BChdohVtkv9Z9a7S0GK4FdiBJSWJmb9KqPKQlm2ij8HDB02uIvxAIt7HsaKnTOE1sDUuX0OINf2FBb3KgXNWNNlqUssL6WrlS08CrYgqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771766741; c=relaxed/simple;
	bh=DTPQAuFl99KDHlq+FGXivbdllK2XofaCt3pe7K45fNM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pp9qYvC+K2cUm0m3ZceGWqQN0sDR1O+b1F4Mni/ueXC5cb2SsLBa5sobyyl/9tpTm6CXXsn5Ko2FeLvhPTk/KoGJuF3xIAN10ruXVabdkromhyBf//BEqSsa8Tkf+Tobu9W6V0ezuKUQ/10uiyrLHFmidxoeWn8ojWYDTSDJ8so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t5Hc+iUj; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t5Hc+iUj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6IGp1jJMTSR9KvCf9R2q0JB/tKAuMoVHMym0vYMOTEkX5+0HDwGKvKwxv4PaVfB8Df54Ae30GmBghFqnWlKFoY1Oow/wb2ZwjOvpLcm0J0PNqFkzUdZ4vDMumbp3d1KWs5Kt2qiRp6QUNy6BLbCEX75Jl+bjaJLTcX8K8OYtA06rjKjNH+ZX6vv0+YxeBUuSwzUMrw19lgzXBRR3QpVU+ea/b0e5nS9idr5XktDuDrxHMS5l4iqWPmqbTUAIpfmlriF9XVKvXByltsDougeTvnj4RjQzvrVAICHHpxWni37usJWdRDwdiVXcEZu7lwAY+MSKWeHT8C3noYYHibBgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59RQ4n7nvk1povx11I6toXwSeXiYRPb/R2WAERIE6hE=;
 b=kpJ+I045iOVU1bZNm7x6WdLhD8JuVjOEFAsP6oyQZ8JQ4unqvy/ptwv9iUx6RK/Bs4D+GR2XYPwVNOzXqnfmsba5dUnEPpx4/G/M+Zq69GwUOKhqxZZPm2MCJSKB1sOE1xqPUeaUAprKNsWcKaf7Rg98qt2ahecD73Rj9IUDeixhXdm25cJQCWJMUzauNR3wmzTUNDHFjBgX1A9CxUFccnNhFCB6+OviRVlwhLwr/3H95s2rTzoTMcfbmn0pDFpuKNXBdpRkyoTk7igdWIMj3NNwKINmOLAHzt71R8Mq9movOjlqyWPDWnm/f8Yiz5k6W0Yj0WiNnNCDF+s+92OisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59RQ4n7nvk1povx11I6toXwSeXiYRPb/R2WAERIE6hE=;
 b=t5Hc+iUjEUcfL/xc32poaxXnLxf9i+6vh1Unocld/1Unv10xmaVojR1dFQE4LSrbX0p9ajDuQea3xKcoeP2GgTlVIyQyeUQj+/yVpkbrFKcK/2ST39FNjICx1mYx06DHu+MtNi/Pgj8XAZS8OZWw/yBTqux0mr9JG3Q1Vpcy9lZsFXWraHR6XxnWdD+O/DSPKmB2fe7O1fUr9s0D4226OE7kx4vqXawdqii317V1sKlMiLkjyY8kwjR5o+EF1iuDo2eEGIjyGY8NlcwOTEdb8gpViAFq9yPrH26l5/zpPLsNaBKLQ5HX4tq7IbHUGMMeY8AA4qcfwxfjd1NRy+WDVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA1PR12MB999109.namprd12.prod.outlook.com (2603:10b6:806:4a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sun, 22 Feb
 2026 13:25:36 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 13:25:36 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 22:25:31 +0900
Message-Id: <DGLIVZZMHZ21.26OXTMDN4L2CJ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 "Steven Price" <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/9] rust: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Dirk Behme" <dirk.behme@gmail.com>
Content-Transfer-Encoding: quoted-printable
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <e5c01465-9571-442b-8490-6ae336cffba8@gmail.com>
In-Reply-To: <e5c01465-9571-442b-8490-6ae336cffba8@gmail.com>
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA1PR12MB999109:EE_
X-MS-Office365-Filtering-Correlation-Id: 041520e1-debf-495f-d50b-08de7215dc89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a25CcHVsQ09MTmNvRENHUEhXMXdENENTSjZpaEZ0aXZhc0NhQlQ0SkE1ekRC?=
 =?utf-8?B?S2FYR1FFM1RtVGE3UlV0RmVUSEJsY1JTdkgvd0R4dkxBUXduRktSeGNEY1lB?=
 =?utf-8?B?RkFCNzZoWGJGOHo5YmRPdDZrdzQyTWFYZFFWL3R3Qk9SUURiN1hTWW1iZWhi?=
 =?utf-8?B?RlAzbDhpZG4zaUhPaEg3Ukp2ODZ5Z3gwSG9XT3JZOU1hc0U5bEZNT1RtbG4w?=
 =?utf-8?B?bkcxUFF3c3lVUFA2cFBMTkNDTmhjRXFqVDBVVnRhQUQ4K1EydjJrY0FIODd1?=
 =?utf-8?B?QnhsT3E5ZWUxM2VENGFQZzhVL1ZhcG05Njlmd3RIUytGWTYrMjZTd3V3VHph?=
 =?utf-8?B?Z3VBRFlaOVRIRXhzOHorU0RkamlITldMeDUvaHZHOEJqUUZ5QnY0U09SZFJO?=
 =?utf-8?B?YmZzMlFDTnNMREZHSElrY3dRb0dSUk1ISklhUDlJQnhGMHlYcGF1SkxhU1Nx?=
 =?utf-8?B?MUxzK2dLRGVCazc0cHhjK2xpV2xDMEJOZUFwVkluZk5iV08vditvdHNnNGxR?=
 =?utf-8?B?Yy9kdkxFU3RnNTh2K3YzeDkxYURuNjg3MEFzNzRvcVFsQ3hiQ05kM3RZYmsv?=
 =?utf-8?B?cjVOaUhGdU5nZC83OXVPcVlxeW1zYlZNeFBxZE5NYVhSS1BPaHBMbkxOT0s5?=
 =?utf-8?B?SEhGZlRDMWIzdENSbjdqcDZMc2t3bG1JTnM4SXZvVGJrWC9HeDRsWlliT1hT?=
 =?utf-8?B?bVJ2RmhOQkxCSnBvUFVjRk5Zd0tCallLMEdPN2xsT3ZhYUdPc2RhTS9nSmlk?=
 =?utf-8?B?ZkFXWTJmbkppM3lyT3FTdEM5anZuM25jZmN4ZXVDb3NHbDB4TDhYdUp5bmpr?=
 =?utf-8?B?REJwRkl1c3drQ2F6MmNQNGo5MGNzWThWNTZPY2JveG85VE05NG42NGVKZ0dT?=
 =?utf-8?B?dlVKRE5uaUFqNFljTjArd216WlJ1UjhqRHhCSFlkUWdLK2Y1akZhaUpsUlZL?=
 =?utf-8?B?SFhjMmZTb3lQWWUyY3lQL3hmeVcwclNjdVdDdWp1alJpR2N5RmpsdkZQM2lU?=
 =?utf-8?B?d2RwVVRoc0xnTHllNk1tVUYxdFFtcVB5NmxMcnpoWFViRXVHU0tGR296ZEdH?=
 =?utf-8?B?a1BtWlBGUTAzYVRTTXJLRlVnaUp5Z0E1RkRLUis3akM4a2NUK0RSMzUzMSty?=
 =?utf-8?B?cEtOc01jVWJTazZZK2RsTW15QU1NOFZ2WFpITlZrZmVWZDJLY0NXS3ZHaGt1?=
 =?utf-8?B?L09BME0yeVNTSVN1dGZoY05JOVVmNitwSWZpRDdyM0VGSTNnK3JNdkVIN0gx?=
 =?utf-8?B?R0tkeS95U1NNVzhxZkVaeWRwQWtkb3NmZFF4OXhIRVNEaURINGd2ajBJMWJX?=
 =?utf-8?B?d0c5NGRBUjlIamNCVnMzWGk2ZTlCRDgvVWR1RWxOZHd4K3RkdGl1dWhXR2Rl?=
 =?utf-8?B?Y2NHWUpwRm1NYzNHdkVPLzI1eU5Od0N4TTl4NloxKzRsYmZBY1FHbjZpM0VX?=
 =?utf-8?B?UHZZb01wTjljMnhZak1YVndIY3ZlZlU3YVgzS3ZmQ2ZjYnNEdzBKTmNNZzVw?=
 =?utf-8?B?cUxXZUFuM0JySzdLTkZMTnBMOTRyLy96V0dwb0Q3S1gyNFZEM2ZRVXJFUDVI?=
 =?utf-8?B?MzVkUXJ5OFNjS1RYTm5POEFZbS95TFpra0pvMkFjWnZkOEVscTE4RmNXeWUz?=
 =?utf-8?B?OFlmcDAvKzNkemdhTmZtRFVNUldqc1huYUtidFBpZGRKeVhxR2czdVArdTFt?=
 =?utf-8?B?Wjk0MnIyR0F0MGU3ZXhTU282cGFSaHVmQ205dDRRVy9WSTh1czVVci94OWJL?=
 =?utf-8?B?OFh1RzVCbUFXSEp4ZTQwUUVVS2U4TFFlZmNWQWtMYmRsdGNQUzYrc3ZRLzNa?=
 =?utf-8?B?S2dLVGlSbko1UmNSYW9QLzJWUmhCZUhRd0treDNucnNSbGlLQTlzNk9hS04y?=
 =?utf-8?B?RVh2aC9yR1c3eGVRc3FGYXQvZU4wRjBiOXlyOWx4TVpiNEN1bE1ScDNUaXRj?=
 =?utf-8?B?dkRncHM5NEo2cmt2VFV1Ui82ZHJ1S3NQNUhSWDErV2RIdENkUjZFRlpXTVFq?=
 =?utf-8?B?eWI0VWlYcWRmdStScFdzWmV5RFo4Z2xTU2NsNkJNdGZ4WnNkY0xxNGhNdnVZ?=
 =?utf-8?B?UzRFT05JRm1yU3FQYUNxM1gzTERRSitteHU4SERkRHFwRzhLV2JCQnZmdlpY?=
 =?utf-8?Q?zkFs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWVQTUhhYm1KR1YzNWtOL1JBZkJoYU1QUTlmREszUWJORVM2U1Z5NDlvM0lp?=
 =?utf-8?B?UlpHcVNTU1VYZXZFTXA1RkRoVUx5bU8ydDhKb3lWODlDdW9uNXZ6QWVyWDhD?=
 =?utf-8?B?aVJKRGRhZUZKL250bm5ZRmEzMjVUVDVNK1BndW1qMEh5bG0veXpoakJGWWE0?=
 =?utf-8?B?VTZrR0FMbG1UUENvMnZtZnlFUFlTaWFVN2pxcE1EVUFJNnVRb0pOaXFpMlNU?=
 =?utf-8?B?WnVYRzNmY25lWmhVRy9ST1l2WE1rdzFnajJuK05uK1pLd1FPSEVqdVFPOHVK?=
 =?utf-8?B?Mk01RlJTY3psVlExNTM1OEUvWDI0ZHoxUXh6MEFKU3ZiOHRiMWtEdTJOc3I4?=
 =?utf-8?B?eFZwNjRNMVo1VlExWXlIS2Q5aTVKRnJ5VWJ6VnFJemd0SkltNDg3YmZiaWN0?=
 =?utf-8?B?YlF2bHVzRUlPWFhVemh1L0xGRjNPM0lwU0pod2JXbXdDTDJqWHdMejlScHBW?=
 =?utf-8?B?eFZRZElyYUNDUkJvOVFHQzVRV215TnVSUWJjWlBLSWIyaFgrVmxjVzJsdzVQ?=
 =?utf-8?B?QmJqYXNEK3IxZVZaVnFRckNvckFCTHppd2Z6Sk5aelljeW9TcGRhd0lMQnVp?=
 =?utf-8?B?OWJ0MGgwRzFtZW5iTVdicXJIU1V2OVVXU1dUNjVMaDNUMEhEZ2pSQTNHQkMx?=
 =?utf-8?B?ZDZkdHNPODcxbC9FOEk2ZlNaMnNKZ3ZVWGV6aHpHZFQ5d0ZDa0RBYkFjdS9D?=
 =?utf-8?B?eFV6MzJZQTZvSGx3cUwyZWJxckhZSUZMOWJlazNLem1oYVlBRWdXbWJWUTlk?=
 =?utf-8?B?cFpGczJ5WCswMFRlYzAzck5laDV3MlRaazAwemFHN3JiWG9lcXFhY1F0azNJ?=
 =?utf-8?B?VGJIeGlVY3IzbHpSMkoxdU8yNGw4T1VWUWcxN2MybEFCTkJrMzE0TGo2MnAv?=
 =?utf-8?B?OU9TaXQ5RTlwUm9jOVhjRmgvVlVkdXEzTGYwNDBWcVorR0NzVkhZbnZPbEt1?=
 =?utf-8?B?bjlxSlFha2lrKzlyNE9PM0VrRXZGV0VxQUlLUjRSeGxING9iT05UZVcwdDEx?=
 =?utf-8?B?UFZjc1JpcjBWbDBnczVnWkdvTVdHTUczWVhKMGdlUjVIMk10US82REVOL2JF?=
 =?utf-8?B?LzNjb1MxdVJmVGJzYzFSS2NPcE9PR0lQbm0wZkMvNC9XRmQvbWNKbFFHbWVJ?=
 =?utf-8?B?TVBVTFRlZXVvbEM2bmkxUE05dWVMUy9oMjhpYW5kcHZzN25kWXNLTEpqWXZk?=
 =?utf-8?B?NUdYQzlmMEhWVWNCdjFPVFcvSmlwMVdUKzB0cll0STgvdzkvbGZ6UlR1LzN4?=
 =?utf-8?B?QzRFVVU4SlRla3dCQTB5d1cwSXVEb2UyY1p0aWJ4ckZ0ZXhBVUZSNDRudit4?=
 =?utf-8?B?V2oyYjkvVEw0RVUxb2s3a29qRDF3bWRKcEtjV09KZXByTS9aUlYxem81eE9S?=
 =?utf-8?B?VEd2NlZBUjExSUdBajh4UStKM09DaTJpMzBBTnFCcm5zeUlkWjNPSWVWNEcr?=
 =?utf-8?B?dGJxK0JCTmdSdHM5ZmVMNSs1MzZFUFFYYmt4QVd5dk1WVjhDaEMwd0pJYzAv?=
 =?utf-8?B?S29sMWVNL25qRExRRkkwQVNQQ0FUam1DbG1Cd2pOSW8vOWJSM3lwVGJvcWw1?=
 =?utf-8?B?VSsyckxXWUs4QTZNVU1Zcm1WcVNxc0tNSnFSMHFuWCs5UTVDR25SRTJmZER6?=
 =?utf-8?B?aXRvN04rR3YrOWsxRERUTjhaVVpXeDNXei9vM3Jra1J6ZFdyTHV0VG40YU9z?=
 =?utf-8?B?YTVlWGZoSlljd0pMTlUwNTIrMTVJUmEyUGJxYnpSN1oreGw4YU1rRWJkRTVv?=
 =?utf-8?B?OWVJQ3RqeEZXSGtZbFN6NjJ1RjArRkdFNS8vVS8yNFdncFFobXYyUWs2SEg5?=
 =?utf-8?B?UjAzY3c4dXkwTFZZVSsxcUk5KzFQaDVJemp5U1llSlNDenpwdWF5ZWhpWUtO?=
 =?utf-8?B?UkpLcXkwL0g3TExLZXc1VFNQZ3BBcUpGRmJqM1hQVXg4OGQvaHZBdVVFaW16?=
 =?utf-8?B?WjY0a0llTmdLaVM2NkRteEJnR3VvT3BqcGRzVGo1WndXSHNyWVV5bUZFNzRL?=
 =?utf-8?B?SWdnaFpHL0l1RDljaStiSW81NDJ1VFlZUzA2YWNGZGU4Rk1HN2hYZUF1Q2Mv?=
 =?utf-8?B?d0RCVTNTc2p1eGhTSmNXKzJrd3Z0QzZabUNSVGhRWnNmWXFwSE00dzMrVmhB?=
 =?utf-8?B?NTEveUZQclBUTUFOYmNqa2pDSTF0MjdLQWNFZWQvamVEa0RzcWRDTWtiUmxN?=
 =?utf-8?B?b0Y5TUNxOHBPM1dsU0ljTGRzQ0ljaTZMclh6VjlDNm5TQ3RsNGpORWdBV0Ix?=
 =?utf-8?B?TjNPWkRWaVoyanJJcExKZHo1UGk5cC9NdzdUYjFOdTRad3lIakFoVXljc040?=
 =?utf-8?B?Zi8wcVNsNkNybW1ySDlPNXVEbHV6clB2RkE2UVMvYmxmcjB6blZCVllzTG9J?=
 =?utf-8?Q?tVrePdZMlCoUmccOozfRQzJt9RC3fOib3hRgx+8uBDSFq?=
X-MS-Exchange-AntiSpam-MessageData-1: Tkno4B6vxE5uZw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041520e1-debf-495f-d50b-08de7215dc89
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 13:25:36.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2ZKrew3MMBDtMULFy39njCrXr7TM4PzEQ16yanxcrjftyCaks5TX8vA29+xzvgGSnb8JhcfXc9Pyen++g4d0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999109

Hi Dirk,

On Fri Feb 20, 2026 at 10:20 PM JST, Dirk Behme wrote:
> Hi Alexandre,
>
> On 16.02.26 09:04, Alexandre Courbot wrote:
>> This new revision took some time because it is (yet another) overhaul.
>> ^_^;
>>=20
>> Thanks to a breakthrough by Gary, we found a way to have the I/O type
>> perform the actual I/O instead of the register type, which moves us from
>> this access pattern:
>>=20
>>     let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
>>=20
>> to this arguably more natural one:
>>=20
>>     let boot0 =3D bar.read(regs::NV_PMC_BOOT_0);
>>=20
>> It also has the benefit of taking advantage of deref coercion for types
>> that wrap an `Io`, something the register-based methods couldn't do and
>> which would have required extra `AsRef` implementations just for this
>> purpose.
>>=20
>> Furthermore, this resolves the inconsistency of the former register API
>> that couldn't use the `try_` I/O accessors (and even had methods whose
>> names clashed with them). Now if `Io` supports it, it can be done on a
>> register.
>>=20
>> Another benefit is that there is less work done within macros, and more
>> in generic code, which is (generally) a win for readability. The
>> `register!` macro is considerably smaller and easier to work on, and now
>> mostly made up of the bitfield accessors that will eventually be moved
>> into another macro.
>>=20
>> I decided to remove a couple of tags because the code has changed quite
>> a bit since they were obtained.
>
> Last time I gave this a try was with v2. From my aarch64 simple timer
> test on that version I have [1] below. Could you give a hint how to
> convert this to v6? :)

Yeah I'm sorry, this is quite a heavy change. An LLM should do a good
job at updating your code once you give it an example.

>
> Many thanks!
>
> Dirk
>
> [1]
>
> register!(TCR(u16) @ 0x10 {
>         9:9    icpf;
>         8:8    unf;
>         7:6    icpe;
> 	5:5    unie;
> 	4:3    ckeg;
> 	2:0    tpsc;
> });

This would become:

register! {
    TCR(u16) @ 0x10 {
        9:9    icpf;
        8:8    unf;
        7:6    icpe;
        5:5    unie;
        4:3    ckeg;
        2:0    tpsc;
    }
}

This part doesn't change much - it would however if the fields were
documented.

Note also that you can now declare several registers in the same
`register!` invocation.

>
>
> impl TCR {
> 	fn handle_underflow<const SIZE: usize, T>(io: &T)
> 	where
> 	    T: Deref<Target =3D Io<SIZE>>,

`Io` is a trait now, so this will need updating as well.

> 	{
> 	    let tcr =3D Self::read(io);

        // Note `TCR` exists as both the type and the contant. `read`
        // expects the latter, so you cannot use `Self` here.
        let tcr =3D io.read(TCR);

> 	    if tcr.unf().into() {
> 	        tcr.set_unf(false).write(io);
> 	    }

        if tcr.unf().into_bool() {
            // You will need to have `IoRef` (`IoLoc` in v7) in scope
            // for `set` to be visible.
            io.write(TCR.set(tcr.with_unf(false)));
        }

The direction of `read` and `write` is now more natural (and more
flexible with respect to the way I/O now works).

I am also contemplating allowing the following syntax for the write:

            io.write(tcr.with_unf(false));

which is shorter, but will also only work for fixed registers. Guess I
should ask for opinions as an RFC patch.

Hope this helps - let me know if anything is unclear or if you notice
pain points!
