Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B291DF25C;
	Mon, 30 Mar 2026 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774847414; cv=fail; b=GEGSi+PaSEmBgh+NqGe2wf9g7kFzqBSXxf3Ugnxe0073KfkcsxQY+QecqxThbRPdsYIdxjzX6NkARLFzKlsRBpt8gq/YPhJTwR2nmKOmvpnZXacMY6j+EHqal4c7howFb7z1XwdSqAi3osi7obMISaEqYPR3qEtBsdCkENF58bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774847414; c=relaxed/simple;
	bh=+JxF+ygZO2Csg6MjlxrnO1VuwWnSXqxaInruRDhdiyg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hbEn8j8C1jwWmU618uXtEnHm0kmBQyS8ggyJ6s22+1ELarsCxWSqpr2FX+majkJFkIN4ME2OCBQLYEK0/Y4CNq3siBg7HClnpuSTU1+Ih1vCOVtpGxzggRVg9duUTgbKIeVsHoYA/hdoUPtG4AT4VHHUn2uSEh/5BrMUY80Jk9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ENUttESx; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ENUttESx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYexqN2fpjYKIkcqMgklpoGXiUkkpuKJl70BEiAtH3d1kVVdj2ExxSE8AdVNNRnNIGFPF2i7Ysyr73Z27UOrCQRMpQjwKPhEae6JcBD0H0lT/uk9apOy8V0NoJ9UvSW+5c21pPvbenGEdxsuEVj+W7fd27m87SEYTUYuyAIY8hrQh16aYTzYAtbcS/yGKB8e/IR+lIhJpQGfubqXi2FInKBrQtraMDGMD2hTSKTAsTyb8AR7yoJtDVddS0KYWW1ocxwiGH1WdxdAf0Yjh4R4k6ijGIzERd0tzcYVmXrAlhgAZA0GHuoT1EvQ4VIIldGv4QkVKLEOzoyOpm1i5dgpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW8cvmKOImU1lbkCAm282+vmonusZK+EGtvsOGCST3I=;
 b=O0q8TjEOjCjQDzhyhDWh9jgbqZrAVyMcqnQqB6iaw5q43SU5I4Oa/SOCRdMGFvfmNhQa/1OyHS6V4gXfiNa03rgzOcAGeR8OB58s4skABxFN22HxYByWbrolUyppJTZz/IR6N+jSl52LLLLVvXOrDZYe1rbK0WfGsdkKRFUynDzAg/uYsmClMNxbHsC/8dvMKj8YdTZ2JAT2gQlfen6SL7N4fZdcO0zPKiGt3XxaTkZHexcplw7P/R6do0rp6XgCksrpJz83VQWVU8oWd4iaT/EfMKRQtdWhHuhCc5ZJrrvOx+Om0u5AtZWyUNeOAwC+5amspz33MnSigsDCOq9ZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW8cvmKOImU1lbkCAm282+vmonusZK+EGtvsOGCST3I=;
 b=ENUttESxsCXJM0KC3KAmGvt0ee1snaW6C6m2AZ8fObG7wpIeXdt05h1oIoHyLGsHem2HotfHfYQYkPayXOmQ05yyBCeb6hP9yamJDiaOEXifX85+c13dqOM3B0wPHeUgZJmhRMEeXcrnsG3HhOccgZ49qOydjN1nl71zbLutJAIwmYHNp/MgifBjj/B0aowYdfWDgMGMSlB2mSE88fl6VQRXxsKkhfd+K2rcLrU36P5joLMtb7WvO0yKWU6GT1OuZpPmPJa1wcYp9QOvDKyY7+ZFMsGpr+pa9RjTFF+kY8QULbrMZ7e4Q8OO6z+HsKdbcWwTg0JAkOWRLlKUleN+BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8465.namprd12.prod.outlook.com (2603:10b6:208:457::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 05:10:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 05:10:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 14:10:04 +0900
Message-Id: <DHFUW9OH373D.3BAD8OO1IRHBP@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 00/31] gpu: nova-core: firmware: Hopper/Blackwell
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf46f90-dcf0-4b54-5907-08de8e1a9ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ovXeWj9G8THTcVf4YHTECncZeBfsgyR7Cn6A47yfOfb7h5Ae/xPIKQiT0WzQdjW+qP0wPQR/pyVk2EmJQDC+CkYTh4TZnzAuXaYvZEEcI/QplSylKu7D++dZoNGYIZZrd09/z4gPgTuR6lNZAR4QuRULkahcaRwUUjfBMLvHOp6cHXPrz9MOOF7UJOtaGOeJHOBgzSpFNSmnRl4X9OKviWtXMBetE8miH5bXVk/C394R16j24hgCJjykSIPKwZZGArz7jxF4AXqYGcm8EyTIs5F3ilJciQKM0GbNyS8K9KGcTiIIYG51ibO9VB0nu6jyLikF9YAy2Mw8TAcLUTJFRBoWepyLFo0sFLKW7VZMgM3LhOc2NfZb5Pzcpga/G/6epmo6AuCGEHwyLFFVxoKoOaG1PJgYTsv4wTeR7Dw0wutwwob/Glx5Ngj169GACA/SVuuTOxXfUlDTb/TpKSPW1GxKVwHhq5W3nQ1S9E48bT4rJW4bFI0bYjmfe+vdM3jCGiOpb44eoc4RKKzAY6zPMTF/G5OY9lgtuBn+CAoXIwl/j1v5RNowVN0+wxWKQZcumsUUeXcPbCkc0I1KallrjmICoaKcsoaIzsUCO7nXxQsomhADCZ3B+EVC9k2v86i95TFu7gqBD5rRqoISm6csF0iUHzVwwuuFWyULjl6zn94N1NynInYrdmD+oI06EUFbdvONYZVQzGhWRNjcZDkE3YBAX9+qqW2PZNDBFwfnZTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y01rZGU1OHZxcnc4M3lZN2F3cFlKNFNadW02WHh3dkZSVWRWOE4rTVBQQXRS?=
 =?utf-8?B?YXNZaEhmTVNKZGY4ZUlyNS9EZXY1Tm96QkJtdGN1aG9xb0VrTzRwYmNCcnFI?=
 =?utf-8?B?TzlJbUMyVm80TXdhZVpjVDBHM2pxNXc2Z2FpOW1oQTBOS0xpa1JkTzE0UWx4?=
 =?utf-8?B?SnpKcEZaZFNSdElUQ1FIaFUrUGsvRGhVT2FNYjBNV0dwa2tVOHlHL2Ewa051?=
 =?utf-8?B?b2VDSmRjY3lMUlMzeUZudzRSU0t4bW9JWWVOc0VmazQybGVZb2tDdWJzeUt5?=
 =?utf-8?B?a2hIV0xzK3I3Vmhpa1ZiamdjMDdoNWUrMnBaUGVTbndseGpKcloxeSthSlJI?=
 =?utf-8?B?Y3BUekNHbXBWNkRwMDJXdlhlbExKbHhOQ2Zmazgvb2xuSzkyU1dpZ2lYNFc2?=
 =?utf-8?B?UDVIWmpoR3REZTFvMXplQUhQQlhjOEV1cmRtc25xVmFaclhUc1pwbS9waSsy?=
 =?utf-8?B?alZWUlY1aXlwcEhxVXh3ZHhZS3JrZUNsVW5CTkZPMEdocTRDSUtaMUVkQWhY?=
 =?utf-8?B?bUNLY3NBbUhvL0ZoSGh1eE5vOTFhbEx6OWNDVGljenFSbitnWmk5dWZXR1VQ?=
 =?utf-8?B?c3BEZ3hnTEpFVjUyNVZodVM3LzUzdHFySDdJbnFoMWxwS2cyb3QxTnRkYXI4?=
 =?utf-8?B?UEhSdzcxQnNDMmZqNmZzR2hUUzIvaHQ1OVNhd3ZsVGRSbHNRNEx0R0xqVGlp?=
 =?utf-8?B?QU1qeExRUm54OGx0VUs1akpFSDYrdUlBVm1HKy9KcmlaaEV0TXRtak80emlF?=
 =?utf-8?B?WjJzVzNMUS80QnF3SnFxRWdveWErS1NlWncrZnBUQm5GLytGOGlzN1JmZzRy?=
 =?utf-8?B?aTlPNXRySkdWNzhUTVYxRUtSbVFhcTBubkdUQUFBdzNBRzlqRnh0QlNBbytD?=
 =?utf-8?B?QThqK2JDMzIvRll5bEVwTmNPUDREL2pvdy9aUVZRNVNpeUJTNjlCaVdSNGlZ?=
 =?utf-8?B?bkh3WXo4VXpXMkZ2L3dpYkhabTdjbDBhWnQ0TWM0NWc4WlF5QmNGcmFDTHhK?=
 =?utf-8?B?eXd0N1M5S3VnaGY0bGpSSUdRRzNmZmRlbEZqWFZJcnplTGZMKzhRRW5IdWRJ?=
 =?utf-8?B?N25EOWhtY2NQNWFHc1NQcExJUkpHU0NFYUR3bkVnSVB5Q3ZBYkNCUjdkNHhR?=
 =?utf-8?B?SElNVG56KzcyN1IzNFdNQU1tTXR3ZU9PMFo1WllpdHY4K29nY25SQU9tcm9h?=
 =?utf-8?B?eGhPV0NXOWJzcTJMelZhQ3dVTnZzU0VtbGZaaDIrcWFJb09QQlE3TEd1VGVw?=
 =?utf-8?B?bFY1akRhSjZxR1RVdWdiNEEzcG8yaStIdDJqQjNVYjZQeXhGQmtvT21DQi9C?=
 =?utf-8?B?VzBDb2lXVHRlYjQzMkpja0k3SFhzRWFFNjg5YTd1eDdlMEJvMWFPTzdMZGdC?=
 =?utf-8?B?anVLQnZhM0kxUVU2eEhMUURkSWhKVy9Fdno4R3FCWU1mQ09tbGhlWHl5Ym15?=
 =?utf-8?B?bUJ0SVNOUEc2Z2EvK21veEVZN3JzSHErL3hNOWhxb3JIVG1YMHpoaGt4d0p2?=
 =?utf-8?B?TWV5NGlaaERaQmlkK2ZEVmZkbVp4bDdlYTZITWZEOGh5WkNpVVFkRHJ6Uldu?=
 =?utf-8?B?U1hUNDdqYUJMMnJJR05XUkptdmVycGRQS3ROcEVOdnpvWlFZQUg4SURCTXJh?=
 =?utf-8?B?TkcrdVorZVJIZFNvc3ZTNThDSk5kQ0k1NEFJK01qQTlSM3lPU1ZObzJpazZ0?=
 =?utf-8?B?YTlRek1HTG1aUVlMM2tkZEVDZEpqNW5Hamp3UDZNalJDVWlwMzhNb1VTVXd1?=
 =?utf-8?B?R29WS3JHVTg2NkVPZHNrTnZCdkF4UGxiTlIxQmRtUml4aDZ2WlNyTDBJU0dS?=
 =?utf-8?B?V2lXbkVZRzg3WW9RcjY3UGV4N1pKNmxtZlZ1bU12aUlaMFNFbW1ucnBDUnVk?=
 =?utf-8?B?ZUFSRVh0ZnNTR0dBaCtldFpyb21pWlVOc1hpOXA4TUx1SEFRSmc1akd0SWEy?=
 =?utf-8?B?ZkpXVS91UmRicWhvM0J1bExRSE9WK0U3aVNlcDBXUDhIdU43SytkaWUvbndS?=
 =?utf-8?B?RlJGOTFXT1pBanczdFhYRXNLRUxjUUNrZUFQbUo2bFV5VEROa21QZFcrQkV0?=
 =?utf-8?B?SU1DOEZoSWsydXUrNWJYUCt3RzBzWnFyS1kwSW5WTERQWWV4UFpzMWIxMjdK?=
 =?utf-8?B?NTZDaExEUHhTeTRSUFc3aFhrNDNsRkV1czYzUXNIMnc2N3pmWHQvcXgwTFhl?=
 =?utf-8?B?eFJxSmZpbWxETVlEVytTS25ZUnVkc0ErelNVUUcrM0QxNEl1N215UzRKQUtq?=
 =?utf-8?B?c01KNUVpNkI0eUJITDVFTjViUG1rT3VHNlYyallJS0xWZmdWSWNOeHpwT2VW?=
 =?utf-8?B?aHdBMitzQ2hQdGs4NEZmNDVEVGQ4VVZDL1FmaHkzWlhHNlFtSU5vdmdpb0Mr?=
 =?utf-8?Q?gmbRQHCsH41+fBhwslcKpVDHH4bVffniTNIe3K0CP6ZiY?=
X-MS-Exchange-AntiSpam-MessageData-1: fZZ6mTVOyIcsEQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf46f90-dcf0-4b54-5907-08de8e1a9ce5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 05:10:09.0311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vA71Y5UsVPwLj+gdZInf0ndcRjjeN1dYMCSEI3CYvEFvhUBpb2pP8PR4nkRLE7eajh02LZuuKg04pSiyzzZ12g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8465

>   gpu: nova-core: move firmware image parsing code to firmware.rs
>   gpu: nova-core: factor out an elf_str() function

These two commits pushed to drm-rust-next, thanks!

The rest will need to wait until `drm-rust-next` reopens as -rc6 has
just been tagged.
