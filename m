Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010036.outbound.protection.outlook.com [52.101.193.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D762FE076;
	Mon, 16 Feb 2026 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229126; cv=fail; b=SdLML0ElFvuXLWIVMdauP6VT37lK5WF1wgjeMMcRrsTDNYsG1G5KFRcfj/10eWqmVsW1wPwQUBloZJtwW1eebgH/wY35YXqOhT4qa4q4jF9nawPfiE8bhNcC4STfOQ4ncFuj9TnY81eFVcW5u/czCkh3N+lcjhMIj2T3lRvvHX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229126; c=relaxed/simple;
	bh=y926/UJ/g1xEjLjydSv1FG7S1eNqGr0qB0ThTWHQDfg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cG16GSeRbL7W+b8afExr0aJJ1uIKmDFP0bdJ7vO0ou/438Q3Nmu+YzZgStIuOS2/A+LqeVby6qa2KGez+6Ub4a8LWANdfNMIrS/hy1Rkjhf6hxhi7D0I7NyQbKctvCT6yHsekDRjj1Klb2LfsOPL+fDFjCbhRIwIyK9T6arXIjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ee/dCrsH; arc=fail smtp.client-ip=52.101.193.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ee/dCrsH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC2hUssJur9zxSGAP2qBQV1934i8ar1w5BTed0yYon7BH4Uruu5WWXMAKEOUFP2SdDJIuCMwBmtNfGT0fZ0yhHFOCwcWDy7FzCZhUVqvhpEyfcM9mCGvp+gZOtDtkn9IqJhS1hwimNBJcycjYS9dngP7xbnG8P1XprzzGudCRljtURMQJhqoZwFkA86nvbnryYfzmszOFj9tuCwA5h7Z+Fcvl7EgA+jDdNaUKgMsxCi0KQSBIFls2Y0+FOEgOaqsqyg3dLZO7aJmOt0RF5xayC78RmD2bC8EAofq0318Te3zf1hxnbJFZJF4geR4t/98Ereakh9remCUkW9cUlcQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W69XAM9t97CiywdjiMzuKhyGgwirjvm1zvnEl+j5k9g=;
 b=bnGMNUUYKzyiuVOjIBN91UUOE/Cndp97euadnefg5ZTSWqRMylZx4IdgACV2wDJf2ZKRzVZbrX+UXxCAf5c3bQCu1F+VKqSc89OhoHEo6q7+fd86rcfmYMGpSNHwoflf1WHlVwLvsIce1CnLsQvxFea+QCFQU3DpN18fHwvi/bnT6sp+WtJ3eTjvSnGCh3gT1OKY6FBphmcoPf2BNCku5NiFw4FkWkLuyvus6aNzQLVRm1/qQLnXfx9NXxpFNB+tQhnp7tVuQ26zjtC4hhvbqGI3PAaRvB5KhXnpbxkVH7pZT4dkLJMgzdWKr1Bzyks/vIiLjcvmlNLm+nTpjOP21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W69XAM9t97CiywdjiMzuKhyGgwirjvm1zvnEl+j5k9g=;
 b=Ee/dCrsH4PLnhi0NtXcJ/6AIOCdNMba4ngh1ySzJ7NCe/qdyeKfZLM0zwBIUE+4wcWgMKmPon57TcR34eBPUBCN7BvGzZ7JFyv2aH87uVseT1btAj2+U41E7ZQ6mSawTl8xDPDaTlon/SbGIzDgHjIs4oDi2pHFb+r41QaBkBV0YJDB3Dsqr0kOpWMSJ9YLHxJi3D6XmadrZw1krTcpwSNLJJZj8qDr8Z/oxVfG/0wHUEpgy5mQgpQLndwID3N0Orykh6qidCkah+sxNtzCBdba9v3iFRfIqQ1vuGIs/Pm5XQcHiq6u6Tn2SXOFwsUptX1sXU15CdgKfnT7y+P1SoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 08:05:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Feb 2026 17:04:40 +0900
Subject: [PATCH v6 4/9] rust: num: make Bounded::get const
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-register-v6-4-eec9a4de9e9e@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfa3b06-d514-4066-adfa-08de6d322283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2Rob2dqRkxUamUwNE4wcUZTRkRFZkphVmJhdmpUemlRSXVsYjNOeG4xN1dy?=
 =?utf-8?B?Y09xVTUzWjNVcHRNWXQ0MnlwQmdpdGllUXg4aGIybll6aHhpOWpWNkFwRjRG?=
 =?utf-8?B?Q2VGekdxU3NwY3ZEVmpPRyszY0RHQ2RoZFprNDZUdmxvY0FUWFlqVmFJYVha?=
 =?utf-8?B?NWY5SGdYWHBPdEJWQ1hmT0JmSVlDQ1ZRc1J3aGtMVjZMMVlGSHFlR0N3YlI5?=
 =?utf-8?B?ZWhTWmovVmlLWVJMRmExVVVFQzlWNUdianEzclZrVCsrWWdXK2ViQWEraEVT?=
 =?utf-8?B?RHIyakJhV3JwbDRGblVsenNPaVJpWmpHdWQrbHdxd25TWGp1R1A4M1JKc3ZE?=
 =?utf-8?B?S1RyU3ZUWnIrVTQ4L0RqczM3cWROSjF3cms0R3FZaFdncnhkUnVuWmhHdTFP?=
 =?utf-8?B?d3hMUy9pbVNhaDlhbDhFQWJwazNvcVZZV0w3eUdOT0drTlVKYmZTckYwcGRS?=
 =?utf-8?B?QWpjNWdXSTVhWGpWWnNVdEFqTEVSY0xOMEJybHIwVERuT2tpWS9Tc1NiVnhZ?=
 =?utf-8?B?eHhiMWd6QStocll4UEtVV0N6MDg2UGpmVlo2SGMzYWphVWNrRHpTQlV0azJy?=
 =?utf-8?B?R25TMEp1ZlJIb0FtTk9MYUxMNTA3aXlmTUU1WWFSOSt0Y1BkdmtBSFM4R0do?=
 =?utf-8?B?Z1Q2dS80SzZ2Y3FkME95bkhjaTNqZTgzMXNudm8wbGpjV2xHQ3ZqSTg5V2d3?=
 =?utf-8?B?WERHSFhra2pzSytsN0xvb0t3SUg4WEJzNjNkcC9Ra0dwNzR3SWw5aDZib1RQ?=
 =?utf-8?B?WDhlSDREYUpUSUoxaFI3NzZzRXBpRllpM0VWTzJCUlQ0OHZGWVZId0FLdFVn?=
 =?utf-8?B?V2pYZnZaRCtvdEs2Y2F0U2laYTFaVi9VdXloNDA3UnR3aU5LdlRXWTc0WG1s?=
 =?utf-8?B?TjZBUlA0MW1jejI5OUE0NTFpelVPUWZ1SGh6L1RGNlhCanhLaitFWjhuVm9F?=
 =?utf-8?B?WkJNbWZRQXRkbXFZU0lLRTNSQzRxZkJMNElCMloxMjRUbHFBc2k3NWE4Kzly?=
 =?utf-8?B?SE9CajlVbkZFK001aUloZjRVMlEzUTd5VTMwQnlHd1k4RWd2YmhpT2ZqVkE3?=
 =?utf-8?B?QkhkSXRSaDJxRzlKc3JUWjJaUzFJbGRKblQxaTQ0VFg5MVM2ZWxOSit3bW5C?=
 =?utf-8?B?Ny9qLytyQkJZakRIV0tKOHRUZmljYm8zN3Vub0JXS2Fjd3BvRFEzZEFTeWJy?=
 =?utf-8?B?R3hUbzF4Y3Z2RkM4N1pTTmlRTGZaRWVvWVRRWHV3eEpRMjNFaWRVb244M25T?=
 =?utf-8?B?Y01xRVovTlQwR1o3a2VGMkRldkxkZ0R2NDdNL1d2U2s3VXJyaE5Oc1pQR2k5?=
 =?utf-8?B?bzhGdVVERVdwcFZydXNEdlBBa241MlNkRnlXczUreHA4V212RTl1OWp2NEVM?=
 =?utf-8?B?ZUE3VlBPZ0lYeEVBYm5ING9tc2ZIVmlrWnd4TFJjYWZLWGFUUFBNWFhPWTJW?=
 =?utf-8?B?UWQ1U081REh4RDJ6V01PY0paWk5sL1pxTXpwRUZHVkRXeVhuRGgzamNIWGZD?=
 =?utf-8?B?ZXZRMHRqRVV1QnNDN0FWSW1OY240U2pETDRIWDdwbmJwdkRiaStWV3FXY1N2?=
 =?utf-8?B?R3dzRDQ3angraEdqNkRkSElIdU95MWMwT09aZHZWQTVoYjNhNitqaUJvZzVo?=
 =?utf-8?B?YUlDVHNPVmtvdVpYSk95TkZoQks5VENKL0hZckpOT0xsWTdJN3UxcVlSTXho?=
 =?utf-8?B?RllCL0UxdmdEemxER0NGaExPV0VSMVk0YW1zR1pIRE1ZM29pZzVJcDJ5WXVH?=
 =?utf-8?B?aGVVRXQ4NVN6d2hoakdOeTVIbHhXTVJKNjl5RjFlbWYrR1RSeFlqVEp1V3o0?=
 =?utf-8?B?Slg4eEFDWm9MdkpYd1FKbFk5Wkt2eXg5b0gyMG5mOGMxZG5XTzFRbThqVVg1?=
 =?utf-8?B?d2NUNDBqWlhIZlpDOVdsNE91ZjlVblphQUprbVhwVHVFMlptWFZuM1pzUGVs?=
 =?utf-8?B?RTREbk5BejNVRDQydk9oN1QzMTlVT3o1K0FXWUwrS1IxQUM3ZityOHFjalFY?=
 =?utf-8?B?SVJiTXhhSzgvaGJ6MW11V092dXRIZ0RqdWFucldOdUdVbWh2d0lmeUNoMUpp?=
 =?utf-8?B?VFk0R0hxY1ZLMmxHOG8yZTZBd3BIYnhreXNjT21KK1docXFHNjRNSmFwdVgz?=
 =?utf-8?B?Q1VYNWVsZGp5TjlTVFhPcDNsRUdkL0VmR0Uvb1hteGtxZm50QnVEOERMYyt3?=
 =?utf-8?B?Z1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXNvMHVrVjhSVnczc2RIYUptRXQ2UHoxUlh1Q2pYTk9TSUtDaGNZZjMwOFZx?=
 =?utf-8?B?WFVFZG1VUk5xcHlGdWNsOWErR3RHWG1yY05tQTlVVWhNMUNqaDBRSDJYVUdt?=
 =?utf-8?B?eWxWbEdPMUw5VHVVQUl1THR4ZUtXQW95dFdZcm5VVkNRL29NOHZidW5qS3pL?=
 =?utf-8?B?NXNzMWluQ2p5ajluQzVHeFN4dHYzYjFjUVRQVGgxZWc0YTRXczdyQ3FQbHRR?=
 =?utf-8?B?R1dQbFhoKzgrTnkxZUpNNjVzc3Q0UjgxdnpxWGhJOXJreGEvNFYzMkhDVCtY?=
 =?utf-8?B?aDRSWWRrZlJTWk12ekhKZisxWDIxREZHSGZtNmRacFRSWThFUlZUT2tVdHFs?=
 =?utf-8?B?N0hVMzliT1hTdDVwMllvc0dRdHVUUlR6Ry9acXh4MHdpazREa2V5V0F6RzVI?=
 =?utf-8?B?TnlkNE9HVnRIK0JHRWZLR0s1c3poc2ZwdDkzT01QcitMU3VEWWRRd3ZhUE0x?=
 =?utf-8?B?YXVqcHQ3dzkxcFkvbXJJYTBEZUM2WUtLekp2aWh3cXhwelcxbzkrcXNEcnpm?=
 =?utf-8?B?eU9GZjYrQU5tL3R4VndzZWJKTlhNSlFlWUFOOXV6akdzVVUrdWMzNWVVV3B2?=
 =?utf-8?B?c0pUWUNsQU9CQVMvTEM4c2ZCcS9pV3MyZDJqbFFrREFLZHlKbEpEQTdwOUY4?=
 =?utf-8?B?OW9ndDRSR0RPb2pHSS9STEJLMWFNVlhTMHVaSnN6M0MxUVlQYWxhQkxuV1Fn?=
 =?utf-8?B?aEtvVDhuOHRPTVUrYXBndGF1WW5ZRzlLOGEwcG5JVGIraWxhNVhmVVpRMDNz?=
 =?utf-8?B?VkNxV2gzbU1nTWFTQnBwVmVtRkNwaGRuSysxSnc1V2tWQXFkb0EwZW1WRHh3?=
 =?utf-8?B?S1oxTUdaOFJVbFF5YmREbWZBSnBzcGI3cFRyNjBGWlBTdHdsdktPWTFUTWw2?=
 =?utf-8?B?amtCUU1sOTI2Z2trQk9wM1lKY21sZjFjaWkzUUpndHZrS0x5eXNxbnIxRjNX?=
 =?utf-8?B?VkF2TGNENGhBWWIyclE1ZWtSd2p4MHVvaHZvYkRUeUJuWmRobzZPY2pKRTdj?=
 =?utf-8?B?Z2c0M1NxNE5nUkNlYWJJczRVRzIyaUhkNnZpdHY5SGEyRG90OFFEc1ZJc3hU?=
 =?utf-8?B?K25ZTHV1YWZmR1dVWXZSdnk2bVJzb2dJM1NBcTYyWm5jdkphVVlvSnlPY0px?=
 =?utf-8?B?VkZkdzY3NGVqUFlUSUoybXBxc0tsYjVvazRYbllnS2p1bGJYaXNLbnhkRXh3?=
 =?utf-8?B?anZ3WGdlVnBua1I3UGtsQmlVbTZUN1JJL3NDcnlqUWhRM3d1aVRLc3lVb3Zx?=
 =?utf-8?B?Y2FSRDRZcmN0eTlsRVl4VW9VSk1WZWVOdGlzMGl0OU5zNDN6UXZFcm1mWFJ5?=
 =?utf-8?B?WFpldW4vdlZmbEdETlRQSnJIeWluMXFMcTJPSlA5RU9nYXV4YUdqcURLWFhQ?=
 =?utf-8?B?eEo5emdnK2VoNUhEWTRzakNlYlVkTlBRQ0Uwam1KTC9ydTB0ZUQvYXkvYm5x?=
 =?utf-8?B?eEhlNlpVd3VscmZhbUhsRjFaMGNWQjBGS1FlU0lJMEg5UmpaV1U0WnplYXd0?=
 =?utf-8?B?THRLZUs3STBCM1BFU2ZrR2tTT3ZCVGpPTmdFcTI2SVg0MDdaREJLOTdCdzdM?=
 =?utf-8?B?ZTBsTW1LSHZsWlVFSVQvVUh3QU5wcDR0T2xzOVVHeTVEdUprTTRNNVhBcHVZ?=
 =?utf-8?B?M0tGSWVqcmlOUy9Ob2lDcUdVdWNWczk3RjdYeDBKRnVhczlCeEZvcDY1VnVi?=
 =?utf-8?B?T0dSZGxuR091S0tTbjFhS3U1UXFPTE8zWUZpbGZrcHU3WWRQMkJCR2hURmZ6?=
 =?utf-8?B?ekZ0dEY5TUI0ekFGcllTVWM3dmZqZlFyUDAxKy9Na3hCU2lMd3ZpRVQ1ZDJ3?=
 =?utf-8?B?SC8yVGo2aTNLdm5ib0grRC8xQWJhK0ZPcitJZFYzRkZseHNsUEU2TDNYY0dW?=
 =?utf-8?B?eFlLQS8ycnJZSVFWQXV5QVhnblBoancwek41T3A4elM2RDc2Yjk1VlljQlQ5?=
 =?utf-8?B?V0pKcFkyVFIwdmpnczhsYlkxTkhKcXUrSWtDV0Z0S0Exc0lxczd1d0V0UDhj?=
 =?utf-8?B?SjRWRG10ZG55UXF3Wm1vT3JQUTVZWjdHNDl0K1RRSjhZQ2ZWc1cyZUtvb1d3?=
 =?utf-8?B?Y0hnWS8wOHMzUWFJUzA1anZWdmliQnFsRkhjUGxSUDlIbk5FMVBUckU3dFY0?=
 =?utf-8?B?eWZlZ1gzcFA3STFEOTY1UEFrRGhzZEU5MEVjWHkxKzR3OHovQUdqTUFOZDYx?=
 =?utf-8?B?aVoxc1BZU2JReTBmNzJ2OEh3U1JNWGhnSm1xSDJ3Wk5oSWVXcGk3YTRDb3Jq?=
 =?utf-8?B?NVROckpyZ1JmYVlWMHBQL0JHSUpScTl4R01iSjBDU1F6dW9yTm0rdEJjUGQ0?=
 =?utf-8?B?VWNlNVY3RTZXRG1BS3lFNVd6SnBoY2I2VEZxN3dpMlZjWUpLbHZ2dXpsSlRR?=
 =?utf-8?Q?1iuJGJ8uTUlOzCx/pMVz2esOTiALP1QLa8/2cTyZG789s?=
X-MS-Exchange-AntiSpam-MessageData-1: /qppJsdIcwFe/A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfa3b06-d514-4066-adfa-08de6d322283
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:22.9363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcsOmdhivrDeyenJBUs9jLPyfETt9Rc7rb9BdI8pK3FdZpsejNpKDj9P1qzedFkhVMT9742btAf5LcWFQCbDEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

There is a need to access the inner value of a `Bounded` in const
context, notably for bitfields and registers. Remove the invariant check
of `Bounded::get`, which allows us to make it const.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 8e4c08924d96..b09b93cd0c5c 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -379,6 +379,9 @@ pub fn from_expr(expr: T) -> Self {
 
     /// Returns the wrapped value as the backing type.
     ///
+    /// This is similar to the [`Deref`] implementation, but doesn't enforce the size invariant of
+    /// the [`Bounded`], which might produce slightly less optimal code.
+    ///
     /// # Examples
     ///
     /// ```
@@ -387,8 +390,8 @@ pub fn from_expr(expr: T) -> Self {
     /// let v = Bounded::<u32, 4>::new::<7>();
     /// assert_eq!(v.get(), 7u32);
     /// ```
-    pub fn get(self) -> T {
-        *self.deref()
+    pub const fn get(self) -> T {
+        self.0
     }
 
     /// Increases the number of bits usable for `self`.

-- 
2.53.0

