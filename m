Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013013.outbound.protection.outlook.com [40.93.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E5C145355
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 04:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769230611; cv=fail; b=OLUGh2gD1ZYtIE8K37HeNBL4YbQ+PSd4kH7z++uTxojjDef6IjM1OrJcbpgL08nJ8g5KWqz/8nqy19KWvTeoXdo6ngW1e2fZu01oYDYnKSdGcXQc3F3XfapmC3FZ/WJ/3hz8P0lgTE4f21uOxIdDd/6c1mUIqKStoXdQXPapNkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769230611; c=relaxed/simple;
	bh=CpYZeMIRBSl14shA4V5OK30VakptEP+ThMydrt75OVw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NebU1mHW9wBn6b05ZNKmh763aLnTPlDrRij6cit1OJaA2rAFfQgkkwmK6EpB/NAoFJbEKx4qV7wMlZHk1kW11wuSPJ3CGOoYE9XAQ9TYRiXneIVjGBh/AX25kZS7HWkt0DoXLAPl5gULdrx94kXsClm4RYrKWD7RoOFkvXaA91o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TRVMpRyJ; arc=fail smtp.client-ip=40.93.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TRVMpRyJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDdPvPdUASEqn737eucbzFRAPW/G/9k+lVwRA8T6R5t7Dne3GeAgmflcjmQa+u4WMdNfn2PoNoRQ8MwDSP/J1rNkvqEEbPXTLlUdWFiEZMbzcsPEJzDS/pgsn4b0IkSL/uEmMdiszPKpjordymfRRMYZ8ONwVlD1NnYDecf5ocU7gKksoIbpqOzJB9llq3W1FNNFE/tAeZRx3/zGGBumvSSvXWSQJidvrrphhNwGJPPYXpRvWtS3hRUGBM+oPJFv09lMcAoES97etGUk0WbBTJK1k0TEItc5NR45M3J7yWjjXXL6fkF8Khol88F0H8qf5oENG3qGdHi7XcvewDgirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpYZeMIRBSl14shA4V5OK30VakptEP+ThMydrt75OVw=;
 b=Hsxz8tvTrrLGfiuASlt0C676KDBI7WzNPo4rVGRGu2yN/YORm/1suh3rEg4F/Pn/w1TN12CnV6dZCeBBCajhRpmLlVj1YsR4FW2SqKD6flQ/t6E3NgYZjUqWVo5hRAB/IDcy407bWa0J9b4iOPWOM6vx1WRCew7zNQWZRWVNdGw0lTH0tHA74XclJb9VeGSSRw6jli5qhIEVGALCDgtiyQMF2XP+XnL9oCrXuhg4A4cVPy4P39wyMlnYDMB2rX6PfX0NXhWbj36Pl/kcQeFsDx/8zhFotJpDPo5srYHDnx0VPLX8gR46A++vb0yyyVTPIfjWKfHaFIvbJvq9QQ/PaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpYZeMIRBSl14shA4V5OK30VakptEP+ThMydrt75OVw=;
 b=TRVMpRyJz3XLQtcKHyq+vePTRouphUPpFfrmJ6c3M9ikNGPrLvM4kkUnH6J7QWuxY+uB2IV2PA+WaEhqKoZpDTveU5c2HG9FVtj3RnG2mzGjpRA7WDu/C0tFjRg4acMzko+3qpEY0iGRHJe5K0LViCFKMMV99PZI5r06EVm83RRMSN+Amn2AvRESPkQKvJC19j39x+zogWe3LBC8XOGEmg5aOCVf8YSc17/WAdK74IlO/MqsV2NTahuBMTW7XPDc8Gq8QZZnDSc3W8fah1lWfXOZ4jsT6Wv+7kjWZSZHFdMG2quOYIUyI9TPsohNuKmKFq/uXUDN9e+tivYZ9XU11Q==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by PH7PR12MB8106.namprd12.prod.outlook.com (2603:10b6:510:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Sat, 24 Jan
 2026 04:56:46 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%3]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 04:56:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method
 load_method()
Thread-Topic: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method
 load_method()
Thread-Index: AQHci+6WXEGx5WyC9EeQUVN2KrhwRrVgme6AgAAp4AA=
Date: Sat, 24 Jan 2026 04:56:45 +0000
Message-ID: <8dd8d8047615cadc73e0a888d5172ab15cc372a1.camel@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
	 <20260122222848.2555890-10-ttabi@nvidia.com>
	 <DFWGPVUB7Q7O.XCM4MOK1SK2T@nvidia.com>
In-Reply-To: <DFWGPVUB7Q7O.XCM4MOK1SK2T@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|PH7PR12MB8106:EE_
x-ms-office365-filtering-correlation-id: 9eb37805-a62f-4148-330e-08de5b04f93e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bmNBdnJnZitkZ1FhU1ZPQkJsTHVZd1pER3ovMVdUbDhVMStONWZWMXFtelM4?=
 =?utf-8?B?TVN5VkJ2b0JlNHlydUVmc3JQbVovTUpPOXJkT0tmbXZCWWNNUUxlZ3VNU1Jr?=
 =?utf-8?B?YTcrYTRydm1EOThPM3BhU3VkZGVoQm5QaXllWEt3VlJpNUF1ZlZaaVA4UTdh?=
 =?utf-8?B?S2hqc1N1QlRsM1VyM0FRcTZ1cnYwbzl0ektpRHdCazdub0dDMEw1L3ZyelVz?=
 =?utf-8?B?SzFvWUxDZTdGTnRueGVFR3ZCclBhZ0NNMUVlQUl0bUNjN1BFbHUxN1B2WjFB?=
 =?utf-8?B?a0tRT3lwbW1Ra3RvU2ltM3BjbnJ5RjgvMjRmbUJiUEdJRFhMTG1kZ1B6OUNS?=
 =?utf-8?B?aDVvQkR0NCtyRU1pMlVZREkxMHFndW42RmE3QzZOMTBoWE5OMzZIRlBNWjZY?=
 =?utf-8?B?MlhyejdZTjgyOUxzK2RIM2gvT2xGNWJOUFhob1JreFV5NmJIa3ZYN0t0SDJw?=
 =?utf-8?B?Y0YvbzJUbWdjamtWRHNRR01hd09XVUFDa1J0bVFUZjEyTnFqSjJTOU9HRUtN?=
 =?utf-8?B?UlZ3Q2JPcUsxS09SWTk0S1pRQ3ZpbGpFSXZqK2dFUVZSejNseUttampwR2lC?=
 =?utf-8?B?S3dzM0k5VXpDZmh3UlBYMjlwVkxKRlhyaUIyRDNIVDF4ZTE5SUFIRmw1eUNI?=
 =?utf-8?B?ZFhrR0h0Q0M5cDdEUVRrZTUzZDJYUTU0YzBKUVZrQW1QeVRDYTNPYmVwblh2?=
 =?utf-8?B?UTRvNkovai95Tkl0YkY5TkxlUVYxZVZldHJlOVduYXFURCtnT01uZXpLaWt3?=
 =?utf-8?B?d21lMjdCeEV2elRhQk45Y2s2c2dURHprZU1OMTUyTWdJM2U0TlViakRtbW10?=
 =?utf-8?B?aFhrS2Jxemo5dXd4KzV5ak01U1dHeWErcFZ6TVBrTW8vKzViUDY0VE1TcXcv?=
 =?utf-8?B?TEk0bzVXZS9EbVpGZm9iMytYTVM0T1dmQksyWGN0clZldFFlYzZwR0Y4dTZB?=
 =?utf-8?B?eGQwaWtrdVRBdE9hTWF4R1liQ0pXVDZFWUx0UVM3L2tHR3VncG1Xd0RQSFd4?=
 =?utf-8?B?Sk41Y1FLeFh0MVEzbUZXQUtiTHZmMzJhUGdXdDU1Q1JFV0Z3QmY4a3hHZjdT?=
 =?utf-8?B?Y3ZObmh0aUdmWkYzOG1VMzM2eVN0TERDMTh2aXNlZG1zQ3hjUDFGNkI3ZGtv?=
 =?utf-8?B?bWRzazFCWGJ5L1FkQU5SWWh6RWpJR1E5eG5pSmsvVjlpc3k3Y3BLNTdVS3ls?=
 =?utf-8?B?WDZuRmxiTFlxSW1kd29FdktPN2JnaXFtTjRrVTYwNUhxSThhcnRNRko1aTY0?=
 =?utf-8?B?WERwb29wY1U0OGFGK0NpSXN5VmlzRWJDb1d1aVlrdjdJV2d4NFp3VWFEa0NW?=
 =?utf-8?B?ZFJobW5aNllVMEFOSFIzbDU2cVVjejhGMlJNek9SWFRxa0Ruc3V6RU42aXp4?=
 =?utf-8?B?TUFqczBsb0ZPWjBLUWZFdzN3ZnJYNmg2SWcwY0diSHRLUnlWT3JMZHJpcE55?=
 =?utf-8?B?d2thakJ3clIwclY1Yk9CUVU3YjBIeVBiajNZY0pCa1ZWeHcxU2ljWnFzSWUz?=
 =?utf-8?B?U3A1SzB5cDdiRkc4ekEyb3RBUEhKVmVONldsYTR6RGJqVHF1SnFUczBnQWM2?=
 =?utf-8?B?dFZJU1B1dTNHck4vR1NtN2lyaStRMlRhbmRrc3plUTRMbWl0MFJveWd2TWtY?=
 =?utf-8?B?T0ZiSE16ekd4VWFhcXhyNkcyTGdIUG93cnkvdG9xcms4UFFoTXRSb1lZOC9L?=
 =?utf-8?B?SXZMaXN1K3pyaDZEVGJSYi9OVXUzR0ZLdVJGbnFnNEZnMVJQRnZ1N1VTdzJr?=
 =?utf-8?B?am5JYkRUcXFzaEsxMTZmUG04ZG9HalMyQ0tQVUg2T0xFdU5tMzFSRHZFb3Zl?=
 =?utf-8?B?b1poVW9oNFJIeHpZdEcvS0daQ0Rob0dSNWtodUNyZUtIUFVRQ1JSZDBESUkz?=
 =?utf-8?B?b054RDF5eStvMExuR2FhQUZ3aFFCbGw2M3hPek1ZM3c3SHp4Z1gxK2VBVTE1?=
 =?utf-8?B?eC9VY2NCZ3B3clR6ZDYvUkhtMXFFVWZlTC9uK0w1dTB6bGVQdlVGQ3BqLzMr?=
 =?utf-8?B?TDRqMkZTZDlJWTBBeDVYMHRMQUI1VFpJRU9xVHRGcGw1c0VGNVBCRkRId3F1?=
 =?utf-8?B?QTV4Z3BERHVVSnkySzkranNsOXg5eGJSS2dqdjlZTUpVTTR2WG0rVHJyOHVh?=
 =?utf-8?B?ajMzaHhrSk5BaFhiaFhPYkZQeG40ZGh6blVFZXR3SlMrUUJnY0NMZkhueDRL?=
 =?utf-8?Q?jCVq+VsXCOOIYMx1MfH46nE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnA2RlRRRDVYdkcreWVvQUFPSnlRK2pkbnZBME1jWGxhQW5sbmp4aWpLdWs3?=
 =?utf-8?B?d0pzR3lFOUdwWE1qU3MraTZCYlJacVk2QjFnNUVkcWtNengxYjcrNXNWeU9r?=
 =?utf-8?B?b2Z3OW5CcjdjcFpZWEY5aDlJNmxwN09GV3l0bERGRHpYNmh2N0FjMGJJR3ZI?=
 =?utf-8?B?RDVZeUpuL3BpZFByZmpuVSsvS3lIWisxWExrTGZ5VWFIMGpYSE04aEhESlpL?=
 =?utf-8?B?K2QrbXJ6RERxbjZqSkRuM3ZFL3lMYnJaWjl0cTNWRUxzMFpoWFFzcy9vVVJI?=
 =?utf-8?B?VEtPUitjYjErVTVXdjVyaytQRHZjMTU1VFdKbWIvOTJFSWxPMjRTVktKdFls?=
 =?utf-8?B?Z0JnMERTaGlXUmtaWFNuUXNLeUptMkpXWVh5ekFydmJ3WG85ZVUrYXpERmxG?=
 =?utf-8?B?NEcvNUxIRXFoR2k4NkJycXU1NGN0SHVBNEwwbkY0RjVBSEs4TVdPeGxubkQ2?=
 =?utf-8?B?OG1hU05UTjUyN2pGNXJKSGVtKzN4clNIS3JJaUhqVnMxYVR3RVBSdDBXVDE4?=
 =?utf-8?B?OFhtTWtPbXhGblliNW9LY3R1N1VXZHl0NVN1RGRxK2U1VFNWYmlZOXpLczdY?=
 =?utf-8?B?VTZqYVkvSS9HaHY2TS9mY1lHLzIyWXg2dVNScngyWlNKd3NvT3YzNi9EczZM?=
 =?utf-8?B?aHBRbklGR3BGNzJtQllhS0JmZUl4MjZhMzBLWFVFNG5JZE5YejkzUFd0a25j?=
 =?utf-8?B?QXRWb28wdWpCeU94T2pUMjZLZVY4RloxQVF2YmNWbW1JMEtoVjFvN0V4OXRr?=
 =?utf-8?B?aWloYjBjYVFvKzJncUE1ay9CZ1NzTGVUeTA3RmlpNm9IUk5EQmUxOFUydmRy?=
 =?utf-8?B?dCszc3ZjRWsrSWl0c1NmOWsvc09FNmZlK2tDQ1ozRUJoWHJBWGNKMmJpN2hi?=
 =?utf-8?B?b1pCWWgzYm5zYUpocTVqK012RlZLLzZuUGJwaVRnZjZ0Mnd5Z3ZNaWh1MGVG?=
 =?utf-8?B?SEdQMzNxMWpTVFNxZXJEUklDRUw4WSs2RWVYN1Zva3VZRmpBcVhnMUk1V0d6?=
 =?utf-8?B?L1M2UEVzTVoreXVCeUl1VW44c28vNklqRWJLaHROYXlQTFJYd0xMMzdLa0Fq?=
 =?utf-8?B?NGkwTzFxMnVqTGhyODBaQVV3NUxoc1F2RjREWVZxbmdHb1JLVXZVSzBxYzV5?=
 =?utf-8?B?QUZRZTh4LzdnN05DNUtkUlZQeE13N2RtT05USVErK0F5TUsrb29wRlRpZ0tx?=
 =?utf-8?B?dnJIM3FqMjhGcEliU2wrWkdpdk5oRmlwcEpvTWtRQVU0UmhHdXhtUzF5dFlQ?=
 =?utf-8?B?OHVYeWF5T3A4aFdCUHoyK0NJU1NSTytEektFa2NpOW9qZVI1TVpnQWROUkRX?=
 =?utf-8?B?ZHBWU2xYTjF3djlucmE5dU8vNlA4eWpXeVNzVG96WFB0VjBxV1I3Y3dkWUgr?=
 =?utf-8?B?cVpDN1BZMVArMjJheVFsVVNWZVZvUVBRUHlOd2g2aFluMlhVSHlTbmZQcjVs?=
 =?utf-8?B?RWQreVg1NFZkQVpJUTRmTXVhNW8rN053Q1hhUmNLRjhVTkFObFRSUWszR1o4?=
 =?utf-8?B?VUxuSHdLTncyQ3F0TnBURHdIOVVxOWp5UlZVMlpISVM4cTRFck9jbVh1MDY0?=
 =?utf-8?B?WUphUm9hUGFmRXVuaC80TG1mVGdRNHE2VStENGcvVkczeXpqR2s2Nkd0elZY?=
 =?utf-8?B?aWY4UWt6SjdYb3dLYUM4VmJjZ3F3YytIcHZ0cDd2WnhteEJ1OXgrWndCWTNy?=
 =?utf-8?B?QjhTWlNxK2FodWxBcjAwS2lVOHVCc0dpai9rYTVMKzVCb0twY1dBeVF6azd1?=
 =?utf-8?B?cGVvMkdYM0EzVS9OUjZsWERBVTZ3M1RYSVZCLzhVTkN6UkU5MzFIU0RGNXha?=
 =?utf-8?B?ejFIQW5EUENLY1pwMHNocWVEU21LMHN5NTRYVzdqeU9mYzY2VjBFMUdzV1JK?=
 =?utf-8?B?Q2NDSXFNWUJsS3BXV0hxS3daSHFrSHEzaWVadlNERHlQczFIL2diWFFpY1NO?=
 =?utf-8?B?NmVSTllHVTJuQlV2RFVwaW51QUZPN3g1NmVpRTlGYzBOZ3JXRFNXUXFPelFF?=
 =?utf-8?B?dmpjVGlySHF1MkdTblBDcS9MZGtjMm5JMDVpRjQrU1ViYitraHhxd0Q3Y3Az?=
 =?utf-8?B?bHlFREN4MEdZdFpoWnJFWFdnSlp2aXU0ZW5YYVdHaDN6aFZlZCtCRzF1TUFP?=
 =?utf-8?B?eU50UXpUYWQ1VG0xdjdNU25FRG5vNVNZMEptbDdJenIvOTF3MkpqU29QMnFp?=
 =?utf-8?B?Q1RxUWEvOVQ0WkVFSE96d2JTelpGU0lwYUJncHBzdFh5cmVrWG96TGFWY3N4?=
 =?utf-8?B?MmJGSmkybjdFb2VoQUllYjlCRU85NVoydlNiTE15Zy9iMkNITUdMdDU5Rk9w?=
 =?utf-8?B?SHZGYS9kL2R3dnpPeldsWW9ScHdpM1Z4d1ArNHNVZDNpZEVaS0hHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <408D45828286C14BAE5891B433CB296C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb37805-a62f-4148-330e-08de5b04f93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2026 04:56:45.2232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLsNvsdiTZToI3zq2YQw5V1HJQvBAURnkipAWSk9s2tTw6zn18gB8xs6VLvJJD5nFM7BSWfdTpTTFLqnku+RLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8106

T24gU2F0LCAyMDI2LTAxLTI0IGF0IDExOjI2ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gcnVzdGMgMS43OCBkaWRuJ3QgbGlrZSB0aGUgdW51c2VkIGl0ZW1zLCBzbyBJIGhhdmUg
cGlja2VkIGEgc21hbGwgY2h1bmsNCj4gb2YgY29kZSBmcm9tIHBhdGNoIDEyIHRvIGV4ZXJjaXNl
IHRoZSBIQUwuDQoNClNob3VsZCBJIGRvd25ncmFkZSBteSBjb21waWxlcj8gIEkgcmFuIGV2ZXJ5
dGhpbmcgdGhyb3VnaCBjbGlwcHksIHJ1c3RmbXQsIGFuZCBjaGVja3BhdGNoDQptdWx0aXBsZSB0
aW1lcy4NCg0KPiBBbHNvIG1hZGUgYGxvYWRfZG1hYCBwcml2YXRlIGFzIEkndmUgc2VlbiB0aGlz
IGhhc24ndCBiZWVuIGFkZHJlc3NlZC4NCg0KU29ycnkgYWJvdXQgdGhhdC4gIFRoZXJlIHdhcyBz
byBtYW55IGJhY2stYW5kLWZvcnRoIHJldmlldyBjb21tZW50cywgSSdtIG5vdCBzdXJwcmlzZWQg
dGhhdCBJDQptaXNzZWQgc29tZXRoaW5nLg0K
