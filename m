Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C3736C59B;
	Tue, 20 Jan 2026 06:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890241; cv=fail; b=qEpqKTluMFDTO5ND/mBGcowgdV17ODjEScQ7POj1ymsRRYvKnPFliuPPM/Xx/B4Nn8TMTDf4dHd6EuZKclsF1KHSUH7kKRDGKc4SR5ILRQ2JBmks1MZ90L8fhw+aYb6GYGmwq9Qj1B/FJevRaNzTiJVKqqxCQa+n81zhhf+IDAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890241; c=relaxed/simple;
	bh=5bUogOqiCGz16L4PeiKUjiVjYs0KU3OcuPxBR+8gbL0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hZFv0m4O/0hJqfi3FpjB1zgCNsF6WZNYy8baq+93G+Kv/A0bVE8HpLGUk3Q5nhoZA+QtSSZachYXn/M+4E3XmVAjVYdDe6oUKz4/W7sb6wzAOAm5Z6bdGqd9dFKQstZUMFbrWzii9c/lmEpmsVJw8Aj27IBVrtwh6quLT74NVMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MmbEbqva; arc=fail smtp.client-ip=40.93.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MmbEbqva"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kn1549Fbim0hKuu49wDpDCKaqjeB4W1DA8QUC2bGJYk2oxvwM8eex4zk7YioO+yIxGVSnYi6+G74pNDLyu2PaHtsdoJD83/cqqn/5661kk1MK2mqzAb7i67liN4j3aUMvzK45xn+S3SQVRbSK9SuCX/rtRZ8gRayIhdjP7oW3crswNnEEdAV+lkUP00+V2u3X8nmaVSSF3KVByhfq2ZYhFL0bWBPyCsNbsQCQnLl2lZ4oKAK0EhdyKSs2fsB0HAzI+e4TjcA4C4yn5HXkmzlx7SYTECL+y+/HoBtg+Jd++PCAZ91bGOL5XhsU2d2LwGmBVhzWXQEDQ0WjO3+3vmBgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wkytn4gSWa9DaU8l5afIrLOfILjXoEKBV90GNilJCyA=;
 b=S0KqzSK01PcRA0FwXXkKwOvB2oZsdRHWMvsmBD9bZCM/ECO3JM+wciE2QmkXf66RSIh5uX/t7tnsBYm0hUlLyso96cmgyCP/Kf788fhVCBWtGjEvPLvQTegmBjonszL/MZOed4b92zrRNE0uyfVyEh1wWWNd858YiAvCdpmz7gHKX4xswbbbv/oi+KKvYO8Edvczg7FdhbgCIK4WNRnurSiOJhAs1d6mHB4cTcoCc2LehZGGbxuNVk16okScYgMQNv+k67XIKGXTFDHgbFBebikXxVmwzH/1ztyL2mR4m5zKPykC58kK9Yk/DBWA+Hqc8vwsOMHI6OFnStywDfqHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkytn4gSWa9DaU8l5afIrLOfILjXoEKBV90GNilJCyA=;
 b=MmbEbqvav/dNlgKH2iOcoC04uZzVqnvfjCOSsZ4Rrd7E0e133CByABaaL9kBBPyrrzfroezRqG9JGGjxOOuqeR8o8Pml0/KttBI4ucVW1sghuSCE5XlTZvbgpaZAurZLJHOXwkFKMryyjFIXc0B+jlcQqpzcuLhoKUsyYd0whSM3DGNCqtpl8/01ubQ5eRfXrDC1v7bn+MGM9t5TvU3X1OCf/cVo1YB5jtct3gSBdUqMvQGXxLZEMJnAiKnTOqOw9MrCHqtJJ6kovKzGY7MOk3iu2sgvCFja8zLa1IYK8za7LGvP8XPYiqUYHFX08tBmDLuzoGZc7srPlbcV46V94A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:23:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:23:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 20 Jan 2026 15:17:58 +0900
Subject: [PATCH 5/6] rust: io: add `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-register-v1-5-723a1743b557@nvidia.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
In-Reply-To: <20260120-register-v1-0-723a1743b557@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 29753159-e9c8-40ec-8a05-08de57ec7a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|7142099003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEJGaW0zenRmZE1xMHNnMGpObTZRUnh1dkRmY01LQlh5V3pBQ2tLbS9vMVFW?=
 =?utf-8?B?dGRDUW1pTlpUL21RR0dBQk5JTE5EYmNFU2tpUk1wWW1kRitBTmNJR1ZqVmhp?=
 =?utf-8?B?VVVxZ3lHUnBIQ1FwOEZjQ0UxVjQ1YUFLVVlMSU5yanNBeG1qYkU1WEtMR1dV?=
 =?utf-8?B?bFYxVlF2VFBhUTh6SCs4RXZrbzhDMDhnaFdwVzRFVmlPRlN6Q3QvMjVyY3dy?=
 =?utf-8?B?RFFYbTNjeEh1MTgrRHVoYmU5d25UWm9qTnd6RW4rb0tNd09zdmVWQnpJdTRi?=
 =?utf-8?B?Y0FGc3AwNmVTWEdCM290SXErT24vVmp1SWx0bjRFVUl1ZkdrbW5vNVVjbktD?=
 =?utf-8?B?Q2l5bTJUOENQVFJMamowYlZkblBLczZSdDhxR2tPdmI4MDNhM2NuTkZZaTJ4?=
 =?utf-8?B?SkNJczFMZ3RZRk9YMnd0WUV2cFlXN29zVmRhU1U5eE9uYVJkQW05OXZIVWRM?=
 =?utf-8?B?WkQyVFB0Q2VrRmxKaG9ONFloMHFUcnpya1habnVkekZXc3NXOXhIbHZjUXpY?=
 =?utf-8?B?Mkh1VmIwZGdKMGhvWWhLZUNJNmQ0WjBaeUx2TXR4dFpJOHFhSkhJK2JscHhz?=
 =?utf-8?B?WG8zZFQ2MmovZzBXaVp5TVdaWVFzcnRZSzQyMGJTb282REdSS1czTHIxSngr?=
 =?utf-8?B?aStuMCtKTGIrcmRyMEpHS0Z5S2toNnNkdW9NR29pY1ZxSk5FU2tYZms4Tmht?=
 =?utf-8?B?aHQ4ZlZPWUJ5RlJRNUh6ejQ5bVYyTE9XODVqNWlTMTlOSmZCTmM4YkVDWXZ4?=
 =?utf-8?B?V0hIejd4dUhtVVFnYmZwWGRweHEyTFZaQVRoK094YlJMQ2lVWmVkQ1JBeE40?=
 =?utf-8?B?ZytleEpoZ3V1RlI0dElVVW5Qc3dPWWszam5wOG9jbmFaWWJ5UnhzeGh4em1l?=
 =?utf-8?B?UTN5WEVOWFJSRlIvM1ErcWNtV1VxeGlTb0h0cEcxbDdSL0FKbmJZTzFDY09w?=
 =?utf-8?B?NnJGWkRmREl1V3FKVDlpck9nbVZMZXhvVVBwT2VjcTdIUThxdXNYK2N4cEFD?=
 =?utf-8?B?WE9Tcm54dmxmRUM3UUE0ejVtMjlGektucy93c2pjbkVEeFg3Q0pubTdHd3Nw?=
 =?utf-8?B?VDArdDJmZzdzYTh5bmIwWks4Nkd0NGtOYThZT0s0QUNxMXB1N3RDUVlNdlNo?=
 =?utf-8?B?Y3h5YmRvYytNR1BNd2VnVWtHWTNWV0RBZjFvUXlMdzBrUVU2VmNMTGNQakh4?=
 =?utf-8?B?SFJCc294bGJMcXFyNE03RGZFQnNVSkR5ZGZQQVIxVXhaNkliTi9jOUkyc2tu?=
 =?utf-8?B?cUVMSFhseW5mdVNHQmRFNDhiZnM5bUIxNWo1dlRVd3VWVVRLN0JVRWNUTS9a?=
 =?utf-8?B?QmVyOUYrOS8yckNyeStjSUJ5a2RaUjRaMG1XTWNaUFRXQ0theHgwS0RsekMz?=
 =?utf-8?B?dlNabGdDRENISi94R2kraDJOL2g3bkZXVTBVWlBSZThWOGxLSndpWTUrUkdY?=
 =?utf-8?B?S2VjN3N1TU5TWksvcUNRQWYweEUwVVlIT0E5SHEyMVR1SUE0ODNYanJSbmRm?=
 =?utf-8?B?R3VZbW1mR3JCelMrVFkrdWZtVFY0eG84UVBKT041TWFRWDIwclVoNk4xRHFq?=
 =?utf-8?B?elN1MDhJSXJqM1VGNjJYVkhZZ0ZReTFUaG02amMwNnZPRHRwbWFJcmJCRExh?=
 =?utf-8?B?cDBnSkkyeGdwQmtUK05Rc3VEajA4Yi9IbTMxRGZRVnk1OEl4MHk5bkVRYjFu?=
 =?utf-8?B?dmlxbDlaK0xFOXpFU2FtaUVmU0VGdzIraEczK0RZemlaK0NWYVpLT3M0ekth?=
 =?utf-8?B?amRxOUlEYTVlUUNkZUlZUWU0bWlWdElqdEhNS1RpWlVYdXZOY3JGNW13eWpX?=
 =?utf-8?B?WFZJQWNza0M1NWN3ZzJFTXhIVEJPZHNzazNhSDQ1ZnJjZmxVd1ZnNk1XN2Qv?=
 =?utf-8?B?UVlLWHVtRFNPenhXQ2ZLNFJVSFczZjd4TEV0TW82Q2h1ejU1Z0lZaE5HWUNX?=
 =?utf-8?B?OW1EdXpEUlRDWWtubUlRY2VBZjNabHQ4aU8wU0FwaitLekQvUDBvMTFWV1h4?=
 =?utf-8?B?eFk2SzBaTEhNQkFkRFNxOVNudUg2Smhxc0drWG1aQlpSby8xdCs2cFMrWVUv?=
 =?utf-8?B?NUlTdzBicktGQTJoTzVkVlNCOGNyNVljWXlpNkRuUUxpL2FuVWdnWndCWERB?=
 =?utf-8?B?Ym1vVjk5NWo0dU1zSmlValo0RWoxQXAxc0srTlNLV0Z4M1A4TlBiaVdqa1g1?=
 =?utf-8?B?NEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(7142099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjFGbEorRGY5aXJ0ZStoV0VURHcwTFRTQ0FBMGJzMWZOTTZUNStObXI4UVV3?=
 =?utf-8?B?djVzYzFoaXdacjI5WW5LdEFRTnpwdjBCWURTbEhBUnNlcFJlZ2dkVTBGYW9l?=
 =?utf-8?B?WkVnblpkcGRyM2g0S2hhY3dQMVlwUWpQYnR1UW1zeEpXSE92bVBKbmlSekQ3?=
 =?utf-8?B?Z3JrL3dYUXFEbmdtOVZCWGhwRnNlT2JLQjFSY2FST2puQXBwWll3dThMSzM2?=
 =?utf-8?B?R0RwYUY0aU5Lamo3RHBZc2ZVbVlWWGorL2p2LytHOEF1T0RGZUFhK2x1dGp0?=
 =?utf-8?B?WWJUdGFjNTdZNUlIM3RHUGtuSzRjcUw5ZHdTMnR5UzYwTWZIaS9oRWM3NzN3?=
 =?utf-8?B?UDZUd2FhTVJYdC9wTTBjTTY2ejZWOEJjS3VPK0d1cEVvcCt2RmpiRFlQV0hv?=
 =?utf-8?B?V09mVThlTHZ6bDdIQkVIeXBUOERUVlhKbzVENEVNNnFPUTlCWSt2VFJ3UkNu?=
 =?utf-8?B?U090TzlUK0ZUZ2hPOElmTjNVN3A4anlHbURuNnc2dmxKdkQwQmlpaWwyRW5B?=
 =?utf-8?B?TEJhY2Z3Uk5jSTlZUlNWWXNFK1BTZ1QvS25TSWVHd1JUVDQ3bFQ3VTM0dWts?=
 =?utf-8?B?ZUowcjE0N01EUkdEWi9zdFhKZk5yUTZXQnhzWXIveVd2YjNKZlM3ZTFScFZ3?=
 =?utf-8?B?citoQ2loN3ZpM01pWDFVTngweFFYZml4QXlBV2hTWkRXSUprNDhldDhRdDgy?=
 =?utf-8?B?Q21LY1ZJZ1Rkck5jQlhob1h2eVVwK29pRjUwa21PVU1xVWtaK3dkTlc3cWNT?=
 =?utf-8?B?bk1JdnNDSGhlaHZNOUNvMVRnN0Rhc0hFakpialFMRWc3S3g0am5aY2RMVG82?=
 =?utf-8?B?WHVkcDJFdzFZSmxSdXIxa0tDMkJSVHJkYVgrQ2R6azBKeVZUM2lxSkg5N1M5?=
 =?utf-8?B?RXdYdWkrSENrc2JGN3VHSnN0NXhRN2t0ZkNKTzB2ZXVvdEYxWndNb012OUQy?=
 =?utf-8?B?dFZCQXJjdW5RUkp1eERhR0ZRblkrWUJZandRWXZLaGJVM0hidlJqbVYvYUcr?=
 =?utf-8?B?b2J5bGZhS2RYTVJWaE5ndDdoL05VVTVwTWw3ZzF3Qys3M0tDTnpLaFJoT3d0?=
 =?utf-8?B?VW1WOTJ3QmU3eERMejFJRDQ3MXplQVcrWUZPUzhoRFEyZ21WRi81VkttdTRV?=
 =?utf-8?B?a3VJSTUwTTlpLzlhaUVrTzIrSHVrNnBmTElsbzlOT21uZHBoMFJ4MDhXakZT?=
 =?utf-8?B?Nm5uOURjbmt5eDhQWHZ6ZVQ1blhiTWpPL2ZsYlpYYkJMZ004dE1BVlZlTUNn?=
 =?utf-8?B?VXU4YVIvd1Y3Ym9uTjk3VC8wSjhEMG9rOXY1VXl6c3hSWTdNakMzQ1FQMjB6?=
 =?utf-8?B?eHMzV1ZaV1lYb1hnVmszUU85ZDN6UHhkTmczRWsyTnFabzlFSVkrcnNQVC93?=
 =?utf-8?B?R2o5VDZIN0pEOEVSL2djd21ENUprYlBGZGYydy9vT0JCY292dW1waTI3c0hU?=
 =?utf-8?B?WC9iWDVpcFNpSUF3Wm5kMnhISlRqcldabVRCRjFWTWc4SkZvM1VaWEhHVXZK?=
 =?utf-8?B?WnNCUlFNbElTaDU5SlZ6T242RnRTdHVyano1RU5ScmNKMVJVTHcxdjBXczFi?=
 =?utf-8?B?TU0zQVN1UFRSblN0eTJhK040NUlWajdHYS9QcFpCZU1iRFhvT3FqRWhONVdt?=
 =?utf-8?B?aldTQldiblk2SlBIRE9QczNoS2tQT0ZhNDluK3k1Q3NaV2dZdHFWdDBuYmFP?=
 =?utf-8?B?L2JHRFA1YlNQeGxVbU9tTDBZTWQ2dzR2dGRGU05rNC9TSTYvNFR2eUdSSFdI?=
 =?utf-8?B?NjYwZjE2YWwweXdLZk5BdVhibVd2RHllMGFwNjA4QUhlWFJkUWQ3cUx0Yk5L?=
 =?utf-8?B?bmx4OFB5em5zenNxOTNnc0RNU2NtRmxuMTFYSTRJR012Q29WUjIzcEtaQVRv?=
 =?utf-8?B?M2phOHZOTnBCaExLVENRbTdBeVBNaEZtVnNTZWl0THhtcWtPNk03RG9WVjNk?=
 =?utf-8?B?dG5KTlRZOFp2azNac0JxRGxFTXBEaXh3b3BNQjU1cXVNRVpCTFpyVGFNSktU?=
 =?utf-8?B?MTdGVjN0UnpGRkFpTFFpZVcxWE9BMzhld2EvZzRBcHlCVUNGY3k4UGYwMTha?=
 =?utf-8?B?MEdwYkhVbGVJY3NzY2Z6Mis5L3NwYldWVVRlWVhJclFybThENUVWY09UOG1l?=
 =?utf-8?B?VjNyeFNDZFNrNklIT2prS2I2eitHN21rSHhDbE5RVisrQjZJWGZZZXVPVldC?=
 =?utf-8?B?U09CRlV0ckpRNXdDWmJEendqZDFFNmViZVUwNkFEUTJ2RVFadHdIdjZubFJ3?=
 =?utf-8?B?eFh6eVo4MmFrS1ZiTnZMZmJsWEhPaC9GeUJrTUtBM0l2WW5xUk90ODdJNGFE?=
 =?utf-8?B?VTNqK3ZheWVXWGVxa2Y1di8wQW1nK256NitCTElQUTRVdVhvWXczbmdGSW5k?=
 =?utf-8?Q?qc2uQyTahfn1M2zKoiEW+DeNqZ5wdlHGm2RHtHDuwXiNa?=
X-MS-Exchange-AntiSpam-MessageData-1: dpB4K3KWp5ktRg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29753159-e9c8-40ec-8a05-08de57ec7a9f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:23:51.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YT1F/7nSzbpCX5i9COoqB5uI74tVXa+XsbK0fWsiNXV6rLoD+s7Cgg3LYNh2QpggqVJBbeeYRHxsHviahX9fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606

Add a macro for defining hardware register types with I/O accessors.

Registers are essentially bitfields with an address and I/O accessors.

The address of registers can be direct, relative, or indexed, supporting
most of the patterns in which registers are arranged.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          |   1 +
 rust/kernel/io/register.rs | 926 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 927 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 98e8b84e68d1..19b34a88b66c 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -11,6 +11,7 @@
 
 pub mod mem;
 pub mod poll;
+pub mod register;
 pub mod resource;
 
 pub use resource::Resource;
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
new file mode 100644
index 000000000000..f28dda146679
--- /dev/null
+++ b/rust/kernel/io/register.rs
@@ -0,0 +1,926 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A macro to define register layout and accessors.
+//!
+//! A single register typically includes several fields, which are accessed through a combination
+//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
+//! not all possible field values are necessarily valid.
+//!
+//! The [`register!`] macro in this module provides an intuitive and readable syntax for defining a
+//! dedicated type for each register. Each such type comes with its own field accessors that can
+//! return an error if a field's value is invalid. Please look at the [`bitfield!`] macro for the
+//! complete syntax of fields definitions.
+//!
+//! [`register!`]: kernel::register!
+//! [`bitfield!`]: kernel::bitfield!
+
+/// Trait providing a base address to be added to the offset of a relative register to obtain
+/// its actual offset.
+///
+/// The `T` generic argument is used to distinguish which base to use, in case a type provides
+/// several bases. It is given to the `register!` macro to restrict the use of the register to
+/// implementors of this particular variant.
+pub trait RegisterBase<T> {
+    /// Base address to which register offsets are added.
+    const BASE: usize;
+}
+
+/// Trait providing I/O read/write operations for register storage types.
+///
+/// This trait is implemented for all integer types on which I/O can be performed, allowing the
+/// `register!` macro to generate appropriate I/O accessor methods based on the register's storage
+/// type.
+pub trait RegisterIo: Sized {
+    /// Read a value from the given offset in the I/O region.
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>;
+
+    /// Write a value to the given offset in the I/O region.
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>;
+}
+
+impl RegisterIo for u8 {
+    #[inline(always)]
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.read8(offset)
+    }
+
+    #[inline(always)]
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.write8(self, offset)
+    }
+}
+
+impl RegisterIo for u16 {
+    #[inline(always)]
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.read16(offset)
+    }
+
+    #[inline(always)]
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.write16(self, offset)
+    }
+}
+
+impl RegisterIo for u32 {
+    #[inline(always)]
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.read32(offset)
+    }
+
+    #[inline(always)]
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.write32(self, offset)
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl RegisterIo for u64 {
+    #[inline(always)]
+    fn read<const SIZE: usize, T>(io: &T, offset: usize) -> Self
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.read64(offset)
+    }
+
+    #[inline(always)]
+    fn write<const SIZE: usize, T>(self, io: &T, offset: usize)
+    where
+        T: core::ops::Deref<Target = crate::io::Io<SIZE>>,
+    {
+        io.write64(self, offset)
+    }
+}
+
+/// Defines a dedicated type for a register with an absolute offset, including getter and setter
+/// methods for its fields and methods to read and write it from an `Io` region.
+///
+/// A register is essentially a [`bitfield!`] with I/O capabilities. The syntax of the `register!`
+/// macro reflects that fact, being essentially identical to that of [`bitfield!`] with the
+/// addition of addressing information after the `@` token.
+///
+/// Example:
+///
+/// ```
+/// use kernel::register;
+///
+/// register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision information about the chip" {
+///     7:4 major_revision, "Major revision of the chip";
+///     3:0 minor_revision, "Minor revision of the chip";
+/// });
+/// ```
+///
+/// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
+/// region. For instance, `minor_revision` is made of the 4 least significant bits of the
+/// register. Each field can be accessed and modified using accessor
+/// methods:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::num::Bounded;
+///
+/// # register!(pub BOOT_0(u32) @ 0x00000100, "Basic revision information about the chip" {
+/// #     7:4 major_revision, "Major revision of the chip";
+/// #     3:0 minor_revision, "Minor revision of the chip";
+/// # });
+/// # fn test(bar: &kernel::io::Io) {
+/// // Read from the register's defined offset (0x100).
+/// let boot0 = BOOT_0::read(&bar);
+/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+///
+/// // Update some fields and write the value back.
+/// boot0
+///     .set_major_revision(Bounded::<u32, _>::new::<3>())
+///     .set_minor_revision(Bounded::<u32, _>::new::<10>())
+///     .write(&bar);
+///
+/// // Or, just read and update the register in a single step:
+/// BOOT_0::update(&bar, |r| r
+///     .set_major_revision(Bounded::<u32, _>::new::<3>())
+///     .set_minor_revision(Bounded::<u32, _>::new::<10>())
+/// );
+/// # }
+/// ```
+///
+/// The documentation strings are optional. If present, they will be added to the type's
+/// definition, or the field getter and setter methods they are attached to.
+///
+/// Attributes can be applied to the generated struct. The `#[allow(non_camel_case_types)]`
+/// attribute is automatically added since register names typically use SCREAMING_CASE:
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     pub STATUS(u32) @ 0x00000000, "Status register" {
+///         0:0 ready, "Device ready flag";
+///     }
+/// }
+/// ```
+///
+/// It is also possible to create an alias register by using the `=> ALIAS` syntax. This is useful
+/// for cases where a register's interpretation depends on the context:
+///
+/// ```
+/// use kernel::register;
+///
+/// register!(pub SCRATCH(u32) @ 0x00000200, "Scratch register" {
+///     31:0 value, "Raw value";
+/// });
+///
+/// register!(pub SCRATCH_BOOT_STATUS(u32) => SCRATCH, "Boot status of the firmware" {
+///     0:0 completed, "Whether the firmware has completed booting";
+/// });
+/// ```
+///
+/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
+/// providing its own `completed` field.
+///
+/// ## Relative registers
+///
+/// A register can be defined as being accessible from a fixed offset of a provided base. For
+/// instance, imagine the following I/O space:
+///
+/// ```text
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///  0x100--->+------------CPU0-------------+
+///           |                             |
+///  0x110--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///           |                             |
+///  0x200--->+------------CPU1-------------+
+///           |                             |
+///  0x210--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           +-----------------------------+
+/// ```
+///
+/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
+/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
+/// them twice and would prefer a way to select which one to use from a single definition
+///
+/// This can be done using the `Base[Offset]` syntax when specifying the register's address.
+///
+/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
+/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
+/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
+/// into code:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// // Type used to identify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// # fn test(bar: &kernel::io::Io) {
+/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
+/// register!(pub CPU_CTL(u32) @ CpuCtlBase[0x10], "CPU core control" {
+///     0:0 start, "Start the CPU core";
+/// });
+///
+/// // The `read`, `write` and `update` methods of relative registers take an extra `base` argument
+/// // that is used to resolve its final address by adding its `BASE` to the offset of the
+/// // register.
+///
+/// // Start `CPU0`.
+/// CPU_CTL::update(&bar, &CPU0, |r| r.set_start(true));
+///
+/// // Start `CPU1`.
+/// CPU_CTL::update(&bar, &CPU1, |r| r.set_start(true));
+///
+/// // Aliases can also be defined for relative register.
+/// register!(pub CPU_CTL_ALIAS(u32) => CpuCtlBase[CPU_CTL], "Alias to CPU core control" {
+///     1:1 alias_start, "Start the aliased CPU core";
+/// });
+///
+/// // Start the aliased `CPU0`.
+/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.set_alias_start(true));
+/// # }
+/// ```
+///
+/// ## Arrays of registers
+///
+/// Some I/O areas contain consecutive values that can be interpreted in the same way. These areas
+/// can be defined as an array of identical registers, allowing them to be accessed by index with
+/// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
+/// an `idx` parameter to their `read`, `write` and `update` methods:
+///
+/// ```no_run
+/// use kernel::register;
+///
+/// # fn no_run(bar: &kernel::io::Io) -> Result<(), Error> {
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
+/// register!(pub SCRATCH(u32) @ 0x00000080[64], "Scratch registers" {
+///     31:0 value;
+/// });
+///
+/// // Read scratch register 0, i.e. I/O address `0x80`.
+/// let scratch_0 = SCRATCH::read(&bar, 0).value();
+/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
+/// let scratch_15 = SCRATCH::read(&bar, 15).value();
+///
+/// // This is out of bounds and won't build.
+/// // let scratch_128 = SCRATCH::read(&bar, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let some_scratch = SCRATCH::try_read(&bar, scratch_idx)?.value();
+///
+/// // Alias to a particular register in an array.
+/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
+/// register!(pub FIRMWARE_STATUS(u32) => SCRATCH[8], "Firmware exit status code" {
+///     7:0 status;
+/// });
+///
+/// let status = FIRMWARE_STATUS::read(&bar).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register!(pub SCRATCH_INTERLEAVED_0(u32) @ 0x000000c0[16 ; 8], "Scratch registers bank 0" {
+///     31:0 value;
+/// });
+/// register!(pub SCRATCH_INTERLEAVED_1(u32) @ 0x000000c4[16 ; 8], "Scratch registers bank 1" {
+///     31:0 value;
+/// });
+/// # Ok(())
+/// # }
+/// ```
+///
+/// ## Relative arrays of registers
+///
+/// Combining the two features described in the sections above, arrays of registers accessible from
+/// a base can also be defined:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// # fn no_run(bar: &kernel::io::Io) -> Result<(), Error> {
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// // 64 per-cpu scratch registers, arranged as a contiguous array.
+/// register!(pub CPU_SCRATCH(u32) @ CpuCtlBase[0x00000080[64]], "Per-CPU scratch registers" {
+///     31:0 value;
+/// });
+///
+/// let cpu0_scratch_0 = CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
+/// let cpu1_scratch_15 = CPU_SCRATCH::read(&bar, &Cpu1, 15).value();
+///
+/// // This won't build.
+/// // let cpu0_scratch_128 = CPU_SCRATCH::read(&bar, &Cpu0, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime value returns an error if it is out-of-bounds.
+/// let cpu0_some_scratch = CPU_SCRATCH::try_read(&bar, &Cpu0, scratch_idx)?.value();
+///
+/// // `SCRATCH[8]` is used to convey the firmware exit code.
+/// register!(pub CPU_FIRMWARE_STATUS(u32) => CpuCtlBase[CPU_SCRATCH[8]],
+///     "Per-CPU firmware exit status code" {
+///     7:0 status;
+/// });
+///
+/// let cpu0_status = CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register!(pub CPU_SCRATCH_INTERLEAVED_0(u32) @ CpuCtlBase[0x00000d00[16 ; 8]],
+///     "Scratch registers bank 0" {
+///     31:0 value;
+/// });
+/// register!(pub CPU_SCRATCH_INTERLEAVED_1(u32) @ CpuCtlBase[0x00000d04[16 ; 8]],
+///     "Scratch registers bank 1" {
+///     31:0 value;
+/// });
+/// # Ok(())
+/// # }
+/// ```
+/// [`bitfield!`]: kernel::bitfield!
+#[macro_export]
+macro_rules! register {
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $offset);
+    };
+
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET);
+    };
+
+    // Creates a register at a relative offset from a base address provider.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $base:ty [ $offset:literal ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_relative $name($storage) @ $base [ $offset ]);
+    };
+
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $base:ty [ $alias:ident ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_relative $name($storage) @ $base [ $alias::OFFSET ]);
+    };
+
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            @ $offset:literal [ $size:expr ; $stride:expr ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_array $name($storage) @ $offset [ $size ; $stride ]);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal [ $size:expr ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            $(#[$attr])* $vis $name($storage)
+                @ $offset [ $size ; ::core::mem::size_of::<$storage>() ]
+                $(, $comment)? { $($fields)* }
+        );
+    };
+
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            @ $base:ty [ $offset:literal [ $size:expr ; $stride:expr ] ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(
+            @io_relative_array $name($storage) @ $base [ $offset [ $size ; $stride ] ]
+        );
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            @ $base:ty [ $offset:literal [ $size:expr ] ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::register!(
+            $(#[$attr])* $vis $name($storage)
+                @ $base [ $offset [ $size ; ::core::mem::size_of::<$storage>() ] ]
+                $(, $comment)? { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            => $base:ty [ $alias:ident [ $idx:expr ] ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(
+            @io_relative $name($storage) @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ]
+        );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    // This rule belongs to the (non-relative) register arrays set, but needs to be put last
+    // to avoid it being interpreted in place of the relative register array alias rule.
+    (
+        $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident [ $idx:expr ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+
+        ::kernel::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET + $idx * $alias::STRIDE);
+    };
+
+    // All rules below are helpers.
+
+    // Generates the bitfield for the register.
+    //
+    // `#[allow(non_camel_case_types)]` is added since register names typically use SCREAMING_CASE.
+    (
+        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty)
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::bitfield!(
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis struct $name($storage) $(, $comment)? { $($fields)* }
+        );
+    };
+
+    // Generates the IO accessors for a fixed offset register.
+    (@io_fixed $name:ident ($storage:ty) @ $offset:expr) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+
+            /// Read the register from its address in `io`.
+            #[inline(always)]
+            pub fn read<const SIZE: usize, T>(io: &T) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, $offset))
+            }
+
+            /// Write the value contained in `self` to the register address in `io`.
+            #[inline(always)]
+            pub fn write<const SIZE: usize, T>(self, io: &T) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, $offset)
+            }
+
+            /// Read the register from its address in `io` and run `f` on its value to obtain a new
+            /// value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<const SIZE: usize, T, F>(
+                io: &T,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io));
+                reg.write(io);
+            }
+        }
+    };
+
+    // Generates the IO accessors for a relative offset register.
+    (@io_relative $name:ident ($storage:ty) @ $base:ty [ $offset:expr ]) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it.
+            #[inline(always)]
+            pub fn read<const SIZE: usize, T, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE + $name::OFFSET;
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the register's offset to it.
+            #[inline(always)]
+            pub fn write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE + $name::OFFSET;
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it, then run `f` on its value to obtain a new value to
+            /// write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base));
+                reg.write(io, base);
+            }
+        }
+    };
+
+    // Generates the IO accessors for an array of registers.
+    (@io_array $name:ident ($storage:ty) @ $offset:literal [ $size:expr ; $stride:expr ]) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+            pub const SIZE: usize = $size;
+            pub const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from its address in `io`.
+            #[inline(always)]
+            pub fn read<const SIZE: usize, T>(
+                io: &T,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            #[inline(always)]
+            pub fn write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = Self::OFFSET + (idx * Self::STRIDE);
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<const SIZE: usize, T, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, idx));
+                reg.write(io, idx);
+            }
+
+            /// Read the array register at index `idx` from its address in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_read<const SIZE: usize, T>(
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to the array register with index `idx` in `io`.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_write<const SIZE: usize, T>(
+                self,
+                io: &T,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
+            /// new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn try_update<const SIZE: usize, T, F>(
+                io: &T,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::update(io, idx, f))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+        }
+    };
+
+    // Generates the IO accessors for an array of relative registers.
+    (
+        @io_relative_array $name:ident ($storage:ty) @ $base:ty
+            [ $offset:literal [ $size:expr ; $stride:expr ] ]
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub const OFFSET: usize = $offset;
+            pub const SIZE: usize = $size;
+            pub const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            #[inline(always)]
+            pub fn read<const SIZE: usize, T, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+
+                Self(<$storage as $crate::io::register::RegisterIo>::read(io, offset))
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            #[inline(always)]
+            pub fn write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as $crate::io::register::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+
+                <$storage as $crate::io::register::RegisterIo>::write(self.0, io, offset)
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn update<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base, idx));
+                reg.write(io, base, idx);
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_read<const SIZE: usize, T, B>(
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, base, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub fn try_write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, base, idx))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned if the
+            /// access was out-of-bounds.
+            ///
+            /// Note that this operation is not atomic. In concurrent contexts, external
+            /// synchronization may be required to prevent race conditions.
+            #[inline(always)]
+            pub fn try_update<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: $crate::io::register::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::update(io, base, idx, f))
+                } else {
+                    Err(::kernel::error::code::EINVAL)
+                }
+            }
+        }
+    };
+}

-- 
2.52.0

