Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010032.outbound.protection.outlook.com [52.101.46.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C60372B58
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769633581; cv=fail; b=f1t2x3hklSDBUkMGE2QrXZlHrLhaZ7fD8RRdIZF6+nQMbVRTCHVVCzjxMwmR6N0mDhAs7V4VSTsZEcE3+xJ5PSWf0RcMplGaG1PQFJ8Dr5mD5fqML+cRYDS7Dho0XgpfQ38QgihvYtPwJ99r0Er9RUEePhT+d8W9Yi5EZTsYxm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769633581; c=relaxed/simple;
	bh=BJRaP/C3q1/6g8zIPXt238ZMLXLGZOHG9EGoztbn0KA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q/BP4Jn3fPblqVyq+WCv+bEe/w47dwxokN8izHwjLKG//JslXIkZqaChZadHcJlpGLXpBVnliTsd5YdwSUb5Xf5M8A/HEUqce1uFRMbONRenqRVAHijIltK+eLyFVYejTkTmNCwosodjKbrQYh8nnRVK/HwuJO0ktmtWaAsiDmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gCiosG8U; arc=fail smtp.client-ip=52.101.46.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gCiosG8U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYU5oM4nS8hbP+e1FaEW5Ogd4FiEcspuU21A4Vw3URcr0gL9A1VHnnCHApxlwrQtkV+VtXwshsZwrStpCJVg/CyIK6WK2oEK5hKHq9KdPFpXRfpgWhKapXqH1pPO3INhRkERplw2Ws+I43E6MRNKYs3xdevqcptRGj+dqBVo/V3ivD3m3xlhS5mmNe9BlrM4QkQ72pVmncIYl/ciDhRVjSm+tGH1UsMf/ysYJkbcJaM1fhRqtTkd061oDJhsl+xDYtYXwoAwLAQLPp+ys+z3woNEexc2QCqQOCp5qQ2biRCG4pezeC8NCW0MiuOq1hbk40LH2uDVm1gMOLQKLA3p1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJRaP/C3q1/6g8zIPXt238ZMLXLGZOHG9EGoztbn0KA=;
 b=l78DeXU3wCIFRMS6TIt//4jIU3j1WgDDILgxXsT4+jO0f8UoZpyHKQU+mePBlLtfODztqDhnMA3LejN+JByD1uhyjx+OUingx5Ftv3zqCnrFJO9q0jHfpzCDnvmenF+eF7Ja4ix+O0v3dXS/sdYwpSa69hL77X2PWYgWXeuJIWn5XDL7yOnhnTnPGixeqFPWulUlLUypS59Bcr/miaQzwK9xthrMEdZB1UcMAv1wvkts9IVaHyCVRbhx8oRpbPc8Q0e+x8KR8hq+4mQZEDYutp2ZeQxLj1wihwwHDujUxli3mK1IaY9wzVMjOkpoUZ41Nuxt27efJCeqRZ9Rv0VgtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJRaP/C3q1/6g8zIPXt238ZMLXLGZOHG9EGoztbn0KA=;
 b=gCiosG8UAkvYABqJQfOgtH+6nboMB0i1CMvk1H9Jq3iI2V/VWNGnXRJ0P4AtpeovQ4KMel8NvfJ9wT//1y6qIo3ppcWwRmKtZhBx5jFkJHqm9CptT5W6dHfd9w+TwfPY9TtPQemviWCQ5Sp6E5x9y4tbvxfBPs/k4f08Pcw6bqMZRfMr4ElVu7j59iSkDFnoogfERUUhUMJnHaegAwslJ44JnT58g9p590mEpMGHe04BkyXypKUBtEs9f+QrXJpzK4jMH9HODnRNbG64VZ6rcldpbFwVAurjbLSKlzl5CERllys1YFI7mF8FGaMPKKCm8CkGfI+bPTa6A3n2qp4DzA==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 20:52:46 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 20:52:46 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>, "mmaurer@google.com"
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 5/8] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Thread-Topic: [PATCH v5 5/8] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Thread-Index: AQHchzIpGuqnm+roLUW3JtHk2rWej7VWOSsAgBHoi4A=
Date: Wed, 28 Jan 2026 20:52:46 +0000
Message-ID: <f3bd901af4a439e68acdff9c10ba2fc111c50e79.camel@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
	 <20260116214959.641032-6-ttabi@nvidia.com>
	 <DFQTRDK9BO2M.995Y3QDQM7CG@kernel.org>
In-Reply-To: <DFQTRDK9BO2M.995Y3QDQM7CG@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|CY8PR12MB7563:EE_
x-ms-office365-filtering-correlation-id: afa0ee20-7d3d-4739-c2ce-08de5eaf30cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnpIWmh1RDBieUFZVDByTkZRcTFKQmxLT3VxVWpyQVN6Tyt2dWtkWG9hclFi?=
 =?utf-8?B?cklCeVl6ZGlWdEJBM29KWkc0aXNtajFEb1dycERQRzFRTmE3NHBxNzNkQ2pJ?=
 =?utf-8?B?OWtKcVV2U283UVNEdG8zdDByNmxBdHNzVk5jWVFHaXJQcHVyZktVTDB5ZGIv?=
 =?utf-8?B?L0JQSTV0cVAycnpiVXYzcHBybkFtSUxKZXp1S0g3V3J6NVdaM2lxa3ZQTGtm?=
 =?utf-8?B?K01CSytQeUlhNWxRUHMwODFxbVdSTTZ6VkYxVTM3cWhvNS9Vdm9jU2g2Z1NE?=
 =?utf-8?B?S1FvSnN0SElVUEZRUFRWZmJWQ1luRGlYNkVFVFljMzlwV3hEMEFIYUZ6QjQz?=
 =?utf-8?B?a1BKUldoV0FZK1F5OWJsZ0tBbEJxRjVxaVU3YnZ0Ty8vNEdpU1ExNjl6WFFQ?=
 =?utf-8?B?UzduL1BRZGN4V0kvdXpFMWxDUnFIcUJlQVNDd1FlY2hSdkt6S3Y4NnozWEtX?=
 =?utf-8?B?UTRtSy9sUEtjSlRjR2JtM3krbnN1YndBbFQ0Qm1UQ25CMlZKZTZFNlV1WFYx?=
 =?utf-8?B?Ry9nWG5kY2tMaE1nNTcwS1NYTXhiRktsbDd1QXFqR25qci96SXBsRWUwc0JJ?=
 =?utf-8?B?eVZqVTJLSjNjS1lXRTcvckFLeE94UGppYjF6YzIvTW82dU5qK203bm5xWlFD?=
 =?utf-8?B?dEtoRGxNWTNHalgzcmF5VkprTEhNUzFRdTR4aXU4RDM5bnpZYk9CeGlsRXds?=
 =?utf-8?B?d1VMZjBBbjVpQytHYnZENGdURjMvZ0V1VngzWXAzcXZ3bERzaEhzd0RvUFg1?=
 =?utf-8?B?YUpGN211YUdWVjlTdC9YTEZtYWkxS1RRYlAzWC8xTXlOTWhPbTgxVmxIM3RO?=
 =?utf-8?B?c2JqUXZ1b0VvRTQ0WVhFK1RLbUZ6TUhhQUpaY0RhZXVQS0VRTXVGN0NVTVZs?=
 =?utf-8?B?c3lMcGZJVVJsN0dxZnp6SEJ0U09YZy9SczdUNC9wOUIyVElIck9tSDlxKzFZ?=
 =?utf-8?B?T1pjRmFEMXdEOWRmWGhiUVhrS3lrNVVxMWY2Vk9JOUF2QkQ4Skp3a1pvdXJG?=
 =?utf-8?B?M1U1Tmd2d0ZuL0NMY1RZdEwrR0lvdlVmUXV2a3U2bkR6WkVmVzR2ejNpeTlL?=
 =?utf-8?B?MXorRjhGTmU2Y0YvQWQ2NUl6ZXhxVWtRbkQ4c052YTJXRWUwdGZvZWpnbjlJ?=
 =?utf-8?B?R0tiV1VDbjZGOTdOY2pRb0RrUW9VTnlmWlBLTVpuc1dqWHJZbFlqRENnVElV?=
 =?utf-8?B?MVJzTm1DcDZoaHJFQ1Eya0ZHRGt3YXRFc3pwZ2pUeWdqclpSbmFOS2t6R2FX?=
 =?utf-8?B?bzZZYkdKVnFnWHMzeU1UdFh6eG1iRHNzTjJPNk1xQjhWZ0V2NUtpbW1wUDha?=
 =?utf-8?B?YjlBRHF3bWdjWGNlZGsxaXdqaHhFaWswUDBrU2twdVc4NUJyc0NjNGhsNS9k?=
 =?utf-8?B?WTVKb3YxZUZtTkNDaml0NVVwWnBXRmpQYUZkVmp6aXB1TTdGQ00xalRPa3Vy?=
 =?utf-8?B?c2dTU1gxeFpFMDZSVVBoQk02TWxJRXRQMVI4aVB4TXNMSWV2S0JsMGphYWt3?=
 =?utf-8?B?azZOSlB6WUU5UlNGRnZTMDdvQXF3OHZFU1BZQi9EV2NtUUNDUHZDMzRJZE56?=
 =?utf-8?B?M3pGbnVXeU1memZOV1dDTDRPcjc2bmVNUWt4ZiswTWlDeVM5M3loNnhreGJs?=
 =?utf-8?B?YXpEcExhV1Vwa0FxWHVaaWhVRzZXd0pSYTRVbTRVYXcyeWZlV2h6TVptYTdO?=
 =?utf-8?B?TDRUeW9QTFFVcTNSUTl1blY2Tm5JTURaSDBOUk43WnFMNklZejUxR2FuRWJu?=
 =?utf-8?B?RGlMWVRrczNkOTZOMnBDOVdaVWlPZG9nUis3VTFjOFFqdkQ4TEczb0hmQzJ3?=
 =?utf-8?B?OTJnemtPN21UWFNTWDJsRU85R0kzaUJHVGd3cFcycGRzWFM5dFdUK3RMZG5H?=
 =?utf-8?B?dmNBblp0NFdWT2VMSC84UEQvTkphemZHQlY4WWtuMFQyVURDSlh0ai84dkpj?=
 =?utf-8?B?YVJlYzhoYU5RMmhNSENzNk1BR3Z1US94c2ZhdW9TQzFZOURRSzBtc1VGMGo5?=
 =?utf-8?B?UlpQR2txZUxNSGZzVyswOFZSZFJMd0FneFBlQUxxSGNpcGpvLytROGkyN3Mw?=
 =?utf-8?B?R0liMFl5UnRrQTExRlBuWU5yUU1KT2s3QXRvYStCUzdPK2ZqRzZEbmpURHJz?=
 =?utf-8?B?aDNUNTQ2YTJNc1M3c3Nzb3V6MWZTRUdpeDZuTVN4ZkgweFRGdGZ5RHFrcTEz?=
 =?utf-8?Q?wwBgmx5Q3tMW9TXjNSbq8SM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmVGNEpHVG9LQkhzR055aSs5VElCMFpCaGRaUVNKNFREaW9lRFFXOHcwYXZw?=
 =?utf-8?B?b0dDbFl6VllmWjRWTDc0ckkyNUg2Qy9aZ1pBclUyT0dFRjRQSXdjeldYdzNm?=
 =?utf-8?B?M0NDM3ZTU0xveDh2OXNaVUM3d3BsZWJRZEtKSFhFY1RUSXY3a0Z6RzdWRm5G?=
 =?utf-8?B?U05WbndETW4xSDYvWE1jbkx6azRwRDE5TWlOWENxSUZWcWlHUFo2WTRDMEd1?=
 =?utf-8?B?T053bkJrc0pLZ3Yyc1BwSXlHMkNCTThOOFNSSTlSN050VVdBclBvUWdpZmR6?=
 =?utf-8?B?QUkwZEhwY3ZqTWJWZ0xiOTFYUlE2MjRvbTl6MmxRRXNwMVlhVjRnMFlrMEVG?=
 =?utf-8?B?N2haMi9ERW8rVnVBRVZmSUM2UDUwZ1Z6TGZZVDVKOTZ2aGNrT3NCYlJvOXlO?=
 =?utf-8?B?RkJ1UFUraWJVR3NvYVplSElpZE5FL3VIZGwzWmlrYktTM3lBK3BmczdPWW9B?=
 =?utf-8?B?TmIzODloalVJY3VOeW5BTUpoeklYVUcvc1BaUHVwY09LdGJ0MGVIMEN2SzQ1?=
 =?utf-8?B?VVBrSmRXSm01YkhjZnlDSi9adklNbDZGVEZPVHBKOVV1MFVpaHZLOENHRnhy?=
 =?utf-8?B?c2lOTEpIMVFJaXI4YTNUclVmMkVHVmNyckVMWVFzMTRDeCtwU1kzMjhmT201?=
 =?utf-8?B?TmN5Zklod1NiN2dFVUhwbTVLUUFTcUtWS3c3aEk0Snh3RWhyWC9iNWFHajBF?=
 =?utf-8?B?bHJMcm1EZmp3azljU0VLNnppc1BLQ1docWo4NFFFbnNRZ3hrcXBhNUZMUlJW?=
 =?utf-8?B?V1RURmpoLzlrcWs0bG1VajdyTm81YTdpZFdsVlM1SmRYa1JaZUh4U1czL2sr?=
 =?utf-8?B?bU5yT0NjZGlCN0pvcEUzOGNESEx0NUdBR1dTU0d6WlZFTi8wejZQM04waCsr?=
 =?utf-8?B?aEQ1ZlVqOUVnYzM2YURiMVRUK21iMXdyK0hkSnVwdWlId3Ywc0dUaFpkUnhi?=
 =?utf-8?B?STVmV0FnTTA1VERNdjgyZ2ozOWRseC8zVmxjY1NXc1h3SXIyQWJrTlQ5VmpL?=
 =?utf-8?B?bHZCZjl4NitnU1B1bXFPOTZmNWFvMzNJQzl0WVBTbkVyQjJrcWJ1RTRLVGVZ?=
 =?utf-8?B?ckh3R0RaMXMyanhic04xdjNWd2kyVE5ieDFFbDlIblZFMFMxaEM0V2hEbjBx?=
 =?utf-8?B?eHkwY25WOGh5R3ljVHhFalBZWVVIRm1uSnhoajkxNjFBZWI5Q1JvMTFyZVRW?=
 =?utf-8?B?aXlMVFB6VzR6R1d0RVh3emFwc2FUekd1VTZKdDhQZzVQYkFaVExjaG5MTTV4?=
 =?utf-8?B?NXM3WFpkTkZvTnZqbnAyeWlDc3RSRjh1cjdNTDJSeS9GRkhLdVdpaHA5N0t1?=
 =?utf-8?B?MjFrSkRpVExtcE05cGhkNUhvREsrSUwrbXdQczlzWjFTQVVGeEtSMG15SHht?=
 =?utf-8?B?Q2RKc2FWODlWcGNSZVJVS25jVkVFUEQ3VlRTUjQ4QkRVT3lCR1BGVUhtRFVG?=
 =?utf-8?B?SGNTS3VOQkJtTlZGZ3kzQXhuUHkzTTIwTzEzLzJZVzJmMFJsUDlYcTJDbEFv?=
 =?utf-8?B?cmViSmJWeFNtUFQvN2tlaExKWkx2cnJkeUwrRGFLamN6WDhYaFBHN1dvcU50?=
 =?utf-8?B?NGFOYmpNblpNZ3RGYndvTWk1MWkxclpnM1hOeFdaN2ZPWk5MaTNsSGtCZjFk?=
 =?utf-8?B?eUtFa1JuY1V3MnR4RGowMWRDbHVTeU1ZbE9maG9LeTg5RWZsdXI1TUJYQWhM?=
 =?utf-8?B?SFRJY2N2MDByKzNDTDkxdWFEREJ3YVFRWmJGdWFXMERXOTFVTnRmQWwybXVF?=
 =?utf-8?B?TmRmTzdWUnZKNlhsQTM4RmdGUnpINDQ4MEpvV1l6bTUvclBjL1hCVlh5REJE?=
 =?utf-8?B?NnIvZWJKNHJqUCtUMS9QUUNESkxVcHp0UVV3VHFubXBmb1c4dE9OZG8xeWFK?=
 =?utf-8?B?dHBrOFV6aW43bDdXVFdESlYrV2NWbllyZFJQWUNLRUlVbWF0aWt1Q1RtbjV0?=
 =?utf-8?B?VEhSZEVsRHVmV3llT28ydFFNcmRRbHh5anRmcXRXc0tKOWNpdnhSSFpYNWZ1?=
 =?utf-8?B?b1hZWFE1Ty9ZZWJSOWhGaGlyc2wxUHQzWExQSTZOWG1GVXFvOHJIQ0lWV0d4?=
 =?utf-8?B?RXFkWU5mZFpSNWtLbFBJUmVBOHc2RlNJNExKdWJvbXB4LzhXOWNTSjZtZmI3?=
 =?utf-8?B?VUgyWmI5MkgxYVc0dG8zVFZlNUIwdFhZcWR3KytINE5pNjNBQ2cxZUJ0WGk2?=
 =?utf-8?B?RmNRQWRqTm9xRElUcENsS1gwOVJzUWluOHVMZVJjUGhnNWk2am5jT3BGeFFK?=
 =?utf-8?B?S1FYNU9RcGlVZGpha1NrSXdza2VGSEpHV3FMMks2RTk5NWVuVkFCdEtZc3hx?=
 =?utf-8?B?NWZ4QTltcnJ5QS81bHRUaC9zNzJGR0lpdHhndkVheVF1cUxZSFVrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C641A23B071EFD44985569C6D27DAB2E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa0ee20-7d3d-4739-c2ce-08de5eaf30cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 20:52:46.4106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkUW15iEJLjM/bMJFVzunYbVsRU7mXoumSItS4ziyTKIgdN1V79GhR9vdLcGmpSuNZ8gzdqqimXdZCm18dVzQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563

T24gU2F0LCAyMDI2LTAxLTE3IGF0IDEyOjI0ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IC1rZXJuZWw6Om1vZHVsZV9wY2lfZHJpdmVyISB7DQo+ID4gLcKgwqDCoCB0eXBlOiBk
cml2ZXI6Ok5vdmFDb3JlLA0KPiA+ICsjW3Bpbl9kYXRhXQ0KPiA+ICtzdHJ1Y3QgTm92YUNvcmVN
b2R1bGUgew0KPiA+ICvCoMKgwqAgI1twaW5dDQo+ID4gK8KgwqDCoCBfZHJpdmVyOiBrZXJuZWw6
OmRyaXZlcjo6UmVnaXN0cmF0aW9uPHBjaTo6QWRhcHRlcjxkcml2ZXI6Ok5vdmFDb3JlPj4sDQo+
IA0KPiBMZXQncyBpbXBvcnQgZHJpdmVyLCBzdWNoIHRoYXQgdGhpcyBiZWNvbWVzIGRyaXZlcjo6
UmVnaXN0cmF0aW9uPF8+Lg0KDQpXZSBhbHJlYWR5IGhhdmUgIm1vZCBkcml2ZXIiLCBzbyBpZiBJ
IHRyeSB0byBpbXBvcnQga2VybmVsOjpkcml2ZXIsIHRoZSBjb21waWxlciBqdXN0IGNvbXBsYWlu
cy4gIEkNCmNhbiBpbXBvcnQgZHJpdmVyOjpSZWdpc3RyYXRpb24sIGJ1dCB0aGF0IGp1c3QgZ2V0
cyBtZToNCg0KICAgIF9kcml2ZXI6IFJlZ2lzdHJhdGlvbjxwY2k6OkFkYXB0ZXI8ZHJpdmVyOjpO
b3ZhQ29yZT4+LA0KDQpJIGRvbid0IHNlZSBob3cgSSBjYW4gcmVwbGFjZSB0aGlzIHdpdGgganVz
dCBkcml2ZXI6OlJlZ2lzdHJhdGlvbjxfPi4NCg0KPiA+ICvCoMKgwqDCoMKgwqDCoCB9KQ0KPiA+
ICvCoMKgwqAgfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICttb2R1bGUhIHsNCj4gPiArwqDCoMKgIHR5
cGU6IE5vdmFDb3JlTW9kdWxlLA0KPiA+IMKgwqDCoMKgwqAgbmFtZTogIk5vdmFDb3JlIiwNCj4g
PiDCoMKgwqDCoMKgIGF1dGhvcnM6IFsiRGFuaWxvIEtydW1tcmljaCJdLA0KPiA+IMKgwqDCoMKg
wqAgZGVzY3JpcHRpb246ICJOb3ZhIENvcmUgR1BVIGRyaXZlciIsDQo+ID4gwqDCoMKgwqDCoCBs
aWNlbnNlOiAiR1BMIHYyIiwNCj4gPiAtwqDCoMKgIGZpcm13YXJlOiBbXSwNCj4gDQo+IFNob3Vs
ZCBiZSBhIHNlcGFyYXRlIHBhdGNoLg0KDQpJJ2xsIGp1c3QgcHV0IGl0IGJhY2suDQo=
