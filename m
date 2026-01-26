Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2E18872A;
	Mon, 26 Jan 2026 04:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769401076; cv=fail; b=psMYQZprQW//32C4pDKcMPNgzqeIdow+4slnIikZcYB6lpyXe18N2h17PhLLFzVfq7XGixg0QiJwvjtcRpFf8HeMleu17/owAYPZfTrnE8xmMtF0mT/ZTaQHoKoM/VL1B0hdEYLek1bq6dBh8bvQgAtY5OIPeCnGY5q9IHkbU48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769401076; c=relaxed/simple;
	bh=MHbAlISJv+h5as4P15pdvW7RqHHzj5nCiQw28vxhLk4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=J52ZjG5/saQ+gq/LoUeo8YIlObzRGtS36vNPfKHQP6dSUK17DDIR5M36F994t5VeGDy4FrWRk8AiQ2F52tq45XkGoKTPMMOiDf8cA8an1JIGhXi/ebeEb09DvW5AHuu/ZR1mzR6wPCtfx2CQFyiPk2++QJflCTAi1vA8cZ77kdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rkYWiXg+; arc=fail smtp.client-ip=40.107.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rkYWiXg+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkgLuBc9JrD/q7hqu8TU/mrRHU+nAlHBU7B4jRY2rcYBW4MdgDtw9MsH9B5kQw8S+lTd9cQgZw/Iv7apIQ+J6usewefQEOmo/ftsXrFJSv5Dgq1dvmfV/FwcPk64Yb5HbVqERhM+TDDIexW4symVzJqD2Jlf+I5Sdx2axRK6cBB3Qa7o0iJCdm/d5jsUmiHQPOwiamN1Q9IYUjjO6Uzajqk+L2GlzNQ6r65EF+FJoAhoDiO3gnpUnsxGpGH1bmAaKsm95wPwVHLkr6A0ENbForxyDohQGA9lB+Qbob+I0wPn7ldWuN+cMT0gORcvDPaclaVJXugC+1JSj58ieRLgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHbAlISJv+h5as4P15pdvW7RqHHzj5nCiQw28vxhLk4=;
 b=Sjd1UmLFu5Yy0Hl++pSldDsfG4Rrsp/0PeJT4lKy9SVGcjxTOxuOZ0E5zl7A9vDsUbHolM62zCmS4e0cY+uEvOaPDg9tc48xW8yl3E+HfQv8LX6egATkSkh6ZMrC/Rt1UfzbhvWIaKbHNesFiZZWsd40V8bOm56deEC0qXNYqyAIc1JODgKAU76Z+8DrpHHUkXD1naLmpRHYICyEDyTNYoN9inMniqrDsdfhwJYhOBs6NIGjVZ9of28ux66n4l4kQ+C7EbJUFE5KhdZdsOdXCHbQjS58H0Qa+oEVteYKBacBYsOhQwFOS7s+nvfJxTNB4Drn/8pT7MvMj2c3vqv6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHbAlISJv+h5as4P15pdvW7RqHHzj5nCiQw28vxhLk4=;
 b=rkYWiXg+Dc1FOGQkM0YhXjKHulr9ri5pFsKgnBLtYc1+DNFp9EU3wYjFzZvz52YwXArrZU5+eOzsdHJaH7wZw7r9DOEF/CFIT3v6JO2xvn0Z3Tg/eoPL3xAMzRNqW8eA3RyscKwq7sAvrM+hTYazPOeC4TrCxkndDYN6ieeGvvDifQdo/wXCWNvPqQSeZLjaAXeQhXXpFSH7yZLDs7mcmnxpvKJv0F5MKMHQgYQ2aZSWLPtbC5CkRquG3gNzo6sXFu9xY6mwf0N9EJ0ewetRlpN+epaBhCqwjYnhK/Pp7lLlMMjxD/P5LACWm0W4/a42TIvtFpxGqzbnIYfAbaq6qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB6700.namprd12.prod.outlook.com (2603:10b6:510:1cf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Mon, 26 Jan
 2026 04:17:51 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 04:17:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:17:47 +0900
Message-Id: <DFY8BWTRMOZN.2EBDVAOIJE4P0@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
 <DFW6LTFCK75Y.1U7ZRPNHVVC2I@garyguo.net>
In-Reply-To: <DFW6LTFCK75Y.1U7ZRPNHVVC2I@garyguo.net>
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc833f0-b1a9-4d9b-5e92-08de5c91deb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGphellhZmdKaVhOcUk5bjZ4KzBQNE5aUUhvVUZwV24wWWFIc0Vld0hMaDUr?=
 =?utf-8?B?d2IyM2NkclIwMCszRjNTNHZDMU45enZDNTdwbHZZdnRIcklEQXdqODV2eEw2?=
 =?utf-8?B?YzJjak1PNU5nMDg2dHcxWkkzQmI0ZjB5dU1QVEZ0ZUdjOEhCQ0NiWU1SVmhE?=
 =?utf-8?B?dlZuQ2F4T3lUR09XTE5menV3UlFkRG5QZk41ZEVzaFQzSlZOQmVnSWFyMXNh?=
 =?utf-8?B?RStmSGVPZDVQaVlDL20rZzRkR1FzSEpSMFpYSUlIWHlqUUFWMGM5TVNVTEJW?=
 =?utf-8?B?SXByZUNoSkczYVRZdTBGeDdDU1ZMT0laMlVTUEdvejBBbjJNNm5GYmdvSjEw?=
 =?utf-8?B?eFFkR0FZY2hkZ2xtU3QrK0FiWXZhcThEbzVRZ0E4VzVsNlh1bmpwYlBkbjY2?=
 =?utf-8?B?aW1JUVdRN0VSck94dzV1TlJWUWptZDZtWDNpaXppa0w2VFVYajRwWU1yZEJQ?=
 =?utf-8?B?UnJ1SGsrck5ueGp0QS9tVlRxcTAwY3FrVzZobG5oU0F4MUxoa3d0M1ZOR2ZU?=
 =?utf-8?B?dXhFVHJyM0kvZ1ZWSVloZHd5dkYwRzFVcnIwN3FTZ1hYd1RVR1FPLzFiSUZ6?=
 =?utf-8?B?bENhN0ZydVNHbmxMc0picUkxRUtlQU13OHIxTEZIMkQ3S3BOVmJwMFlKWDND?=
 =?utf-8?B?U1gyZjV4Y3h1K091VVVuTWROcG9GbElFVGNJbnA3L29jNGE5bGppeVh4V0lm?=
 =?utf-8?B?R1FpdzFGdXNBUE82VnhrWWJjYzBxc3M1OENoVmhxKzU4b2lsNFdvalhYMXZh?=
 =?utf-8?B?dlBubXN2dmVocnJHRDAydU5FTFh5dEhOSVdEaTR5eEMwR3hTbXFPRkJsUlhu?=
 =?utf-8?B?bkNZOC9ia0VXb1ZBbndlN2JSa1FyVXNhRzdBWFdUOWdENlFJOEZHK0syVEFK?=
 =?utf-8?B?TkdpUmZhWEd0aVVqWjJXZENsK3RueldiRHlwK1kyT2NMN2owenlkWHJVR3Ni?=
 =?utf-8?B?bWdTRWkxSE8rbXpwekRzdExNbnAybXFUelgvWDRFOVB4TEtYczU3amxvblJq?=
 =?utf-8?B?UUJ0UVhKVGQzR2UrdUF0Tk9MaXVrY3JMekw5dHJJZVhxQU9SRFV3VUo5Wk41?=
 =?utf-8?B?RmFMWTJsYWVnQ01rVzNXRDhVaDJEUkxmQzdYSDNnazc5NFBqUnBjdVoxN3h2?=
 =?utf-8?B?bFMxajZTOXY1ZlhlM1hRcnp2M1d2MEVkQ1djQ0ZFOUhwOGVXMXRaSlJTNkk1?=
 =?utf-8?B?ODJBR3llR3BpOXA4WWFERlJZdWFUdytoaHhHV0l1elI5MHIwWDR3YXRpOHlW?=
 =?utf-8?B?TEoydXN1dzhENHB4MHdnblJNdjlDQjFrcjNScmp3OGZxK3plN0VOUnhDbE8w?=
 =?utf-8?B?MlNoWVhqRWl6VFNjUGRueFRzMlBPVHRTL21DbjRnWHBJV1NVcWR2SVJMdzhT?=
 =?utf-8?B?RnlLajhHa2RZTUZDUy85MWFpbnlmeTVlcEUzUHduWWVEcnBDUTlGSWUzbVpX?=
 =?utf-8?B?aTByMVRkQzRQQnJIb0RpYi9Fb3ZhdlJJTE1ZMC9Kb1Vpb3lueUkzR2hKYVJR?=
 =?utf-8?B?WVRoaFJTMXk0eFJaTEc0aVloSmhNQ0czQzc5Z0ttTVlKTXJYbThJZ1F2dkc1?=
 =?utf-8?B?Q09UcENoRFpFLzBncG04dzNvdjlWaE03TG5ubU9QSkU3OFZWcjFsYXFUTTNv?=
 =?utf-8?B?RFZHNUhSWDgwZSt6Rk1ZZ0x4YzJNZjJpTDRzNFo3V3lhaUNrSzBrSWRzZERw?=
 =?utf-8?B?bGp1UGx3SUZCZWExQ05zVE5CT3lFOXVqWkZQUksvYkovZlZjZGprSG1xc2FJ?=
 =?utf-8?B?M1lKVjNVNndGZ1gzVk12eENWbDRuemdIMWtiWVVWV29VNE5LZVhTcDZwbGs3?=
 =?utf-8?B?bmxiQ3k2YktZUE9hMmpJYUZZbDVtWC9lYWI0VGxyZGtpUThsdHJFTytPS1ND?=
 =?utf-8?B?YlJEcUl2QXZCS0gweDQyT2FVN1l1Qmc2RmxRTW9xSDZKVWJnSlpkV0ZpYzBK?=
 =?utf-8?B?VFFuMHlRY21LZWNacjlDdFNxSVNxRlpvak1TY2h0bTgwbnNEdVQ5MkY4V2Rl?=
 =?utf-8?B?TFJCa2FCL0ZrVElFbWRPRmRheW1wUFBhMXZlMHN2TUZzZ2EzVmlaQXNSbXVN?=
 =?utf-8?B?akVqTkk1aGJselhqN2xYY3c2RjkzZjNBbmRKQjdGaWEyOHNhSHBaT21wQ1pX?=
 =?utf-8?Q?o2sQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjYyMUs5NmFZNWFTQm5MbTJZYTZrTE9yWnBydmpJOGE2eXU4aGo0Vnk4Q0dt?=
 =?utf-8?B?Vlp0QWljWFF1TG9xZGZWbUU2SEVHeUovNGJSQUVNUUdrdFVkdlNGcHJKR2hz?=
 =?utf-8?B?R1oyenMxRms0anlWVVcyZzN6WUlQVlpSQVpGeEFRSzFpRFBHTkh5WlBVYXd2?=
 =?utf-8?B?WFZPU3hXMG1oU2hRbzJ3NW9vUkNSQ2prY05ydTBuVnpTNUNqRE14ZHVKSDM1?=
 =?utf-8?B?aCt2cXg2Tjh6Vk0zOVQ4dmNFb1p5azBJNzlJWXJwMERUbDBLdHM5UnBBMnNJ?=
 =?utf-8?B?WUdyVkhQNXFWaS8xUk1TNzhJMDJ3em11WkdGTUdJUmw2UGVDSlVIM1JhZHlC?=
 =?utf-8?B?VFZkUGE2NnFJVDJpd1FmWEdSSFdoaUh0eEFQWFQxWlh5cGVmZW1PVy9WOCtF?=
 =?utf-8?B?am1FWVVEU1VINkt0R1pMOGtkVloyakd4WkZGSmlSR1A1RUhvYitxVFdNUVRu?=
 =?utf-8?B?QmNZVE1XSXRiRHNYckNrYlVaRHFjVTlRVjlnRGFQeTVURGM4WWJ1VmYzNWpX?=
 =?utf-8?B?SXVjVXI5cDFvdHdQdDlPaEZuTUdtTFUvY1NzOUg0VGlkdjBUeWs5U2xSU3lu?=
 =?utf-8?B?MVU2TWs1Ykg3NkhzdVJpRVBpVDlGRG9DSHZ3Y3M3THpncG9Rc1V0Y1FIQkZT?=
 =?utf-8?B?UlFLRDRwTndTUkVFSFhpZGJFTFU1QThvZ1V6R3RRd3JDUVMvRGxSQUl0blB3?=
 =?utf-8?B?c0xiMndQbHptandvNlgzemdHc3FUcWw1dCtvRzlFRGlraU42MWNxRzM3Z1Yx?=
 =?utf-8?B?NDYwazR0MU9Ma2g2UFl1bjdkZkRPZGNCT3ZaWVQyVWhncm9VQjBvaEJSN0tT?=
 =?utf-8?B?c3ZNbzJvU0pFalkxNTB5Ti8xYlUvQ2hsSDBTc2RONUNFcC9qZlhIRm1DMm1q?=
 =?utf-8?B?bFdLYWl0eVNzZE9udXRieEVCVUtnMGlSK1pxUmdUWTVJcHREY0Y3TmdtM3BB?=
 =?utf-8?B?Q0F5Znl1UmtFK0h3ejBtQmF5MDVPbTlyNys1OGJHUHNpZU13NU5qN1JvWTRu?=
 =?utf-8?B?Q04yall6NS9wR3VXR1JLUTJtd1NERTRXV3o4QVlqMTFIdGk3cXRwbitDRXha?=
 =?utf-8?B?b0hleUZNUVhtWEFvUGdINHloZkdzeU11ZDJBcjJlRlFHQUQ4VHZIcjRyMmJ1?=
 =?utf-8?B?cGRnM0EwKzZ4bmJJWWhpWFlsL3UzTjIwQ0tGVERNYlBEZkhLTUNMTi9YcTlq?=
 =?utf-8?B?aXZNT0ZUTTRlUkVUSHFxeStNVVBSNy9mY3RvczkxdWFWU0hHMXAzN0YxQWE3?=
 =?utf-8?B?VWNNVGVLaHhuTlNyR1FJNTkxVldGT3NKaUg3S0xXZy9QQnJCZm9ZRnJROERl?=
 =?utf-8?B?MlhOdGxPSTZJVGt6MDF0SzRUQ1U0TEd6VTMwYmdBTmdRVllnRTFubDZTY0xM?=
 =?utf-8?B?bDlKdEVvOHkzd3Z3aGNrUmd2NytnTWk5MWtndEo0aVJBT0tib0ZxOHlIdDRu?=
 =?utf-8?B?RlJpMlM3VDhBMllGVEowU1BXak9xdVFJYW41bVpkY2lUdEJzRDJhRDZQZ3dz?=
 =?utf-8?B?NHpMdmY3OTVhSHBjRTR4R1d5d0hhVE9Mdmp3R25XelQ5ZytRRW5SVE9WZklN?=
 =?utf-8?B?eG5Iclp0WDgzamlVenV3LzZZSm02NjNpTHF0dWVWNkNab3Nab0FhZGE3ZnF4?=
 =?utf-8?B?MUxxVlp3YjdiU3JyVDM2dHZNdTRsYjNvSWZtVmNUaHhiWkdqLzkvZHp1K2Zs?=
 =?utf-8?B?SzdnL216ZThjc0dpZkJwR1hZUWJZVlFQTVIzSFpZUnNmdFFpRWY2TWl2Szhv?=
 =?utf-8?B?WFVpRk5nY0lJVzNPUm9velBlUXZYVm11elQwN0Y5bGRhSUFLVS8vaFZoWnBH?=
 =?utf-8?B?MXFrTXVhU2taSGxmbit3cDczaTk5Y2VDMjVpVndNRy9wQndRRTUvQktzeUdC?=
 =?utf-8?B?dkZQN2tBWnJIUUlIWmoyZ0tFNnpmM3l0c1hjMEg5L25nZ2ZkR0tIaklxYzNV?=
 =?utf-8?B?RDBKMWo5bjIzNitDOHY2eG9PQU41RFV2bG5tWW10ZGtCR0RNWVNvZ0RzVVI2?=
 =?utf-8?B?MzFHSVZ5REUyc1ZEV2prVVBWZUN5QXNOcEwrOXkzZkNwUzdia1JkNlo0WlNN?=
 =?utf-8?B?YTFCMk5WcTNvdndYZ0hFbUtoZVc2YllKOWt4VTZGekl3SGNYZld2Skd0akVV?=
 =?utf-8?B?eElyWldyUDE3VllZeTNuOHVEcXJEYWxHRXVEaGxlNTlYYlA1eU1QbDZpMUd2?=
 =?utf-8?B?UEt1dG54SkRGTmxRZmhibnBpa2VyV0FZNjVJM2ZVRUNhL2hZdWVVendPa3lX?=
 =?utf-8?B?MFdTUUE1K2NlM1dLU0diMlFDWnlXV05leUovUjdvRlcyREg2N0hadklkbkNK?=
 =?utf-8?B?VmIxMm80cXpMSDlkdTVTczRvU2pYM0RPT3FBU1RHVXVzTGU3T0U1ZjZtYytw?=
 =?utf-8?Q?a/Of8QglDZmniXZAxTs7UHYZ01nYXOo2jb7w7eARWB3AB?=
X-MS-Exchange-AntiSpam-MessageData-1: nM+Nf25U2f7djw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc833f0-b1a9-4d9b-5e92-08de5c91deb3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 04:17:51.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYzdMxJ205LddO1w7UvDArb4Y41/pPb4oLH5WHn8ZWs0zQBsxZRH/K4D1iH2KXgxiDSbOOCT1Mn/xfss2I+ynA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6700

On Sat Jan 24, 2026 at 3:31 AM JST, Gary Guo wrote:
> On Thu Jan 22, 2026 at 2:59 AM GMT, Eliot Courtney wrote:
>> The current code hands out buffers that go all the way up to and
>> including `rx - 1`, but we need to maintain an empty slot to prevent the
>> ring buffer from wrapping around into having 'tx =3D=3D rx', which means
>> empty.
>
> Doesn't this mean that you're effectively wasting a slot? You can easily
> implementing a ring buffer that allows you to disambiguate empty/full whi=
le
> still using all slots.
>
> A common approach is to only do modulo/masking operation before accessing=
 the
> slot. Then `write_ptr.wrapping_sub(read_ptr)` will give you the accurate =
length of
> things inside the ring buffer.

Yes, we are wasting a slot (the current code also does this). But,
this is the protocol between the CPU and GSP, so the GSP actually
expects this and we can't change the semantics easily, IIUC.
