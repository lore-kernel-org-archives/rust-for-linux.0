Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963F33342C;
	Mon, 26 Jan 2026 11:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428002; cv=fail; b=oGZA81cBqsMgZQd/PuxWMZFcZ3ItpZjeZrv3g56NfOWl5kYesqEl1/j2tLF39QE4KZ/apagjsbvQHQ8ZAvGpXwoB31GTjqC1gQlRwi1XAeTYwkYXTy6P3IhLh5+NePWB8g6fm2bWDOGdXsvwoncbDcqcJX2d/mTMtqUOaCuRXmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428002; c=relaxed/simple;
	bh=+dU+LHvv0pENP3lAe5vBD+0NrQUxH14bd3VExkxdtmA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ks1j3dEzDpwBM6BAP5n1TsvyzOWaEh8IhUdM8Q+hgInvi0C6SMW+6kwhgW6TJwRmpm/2u3OamUe08l/BPn4IYukA5r5ye57nBGZli8niPEElkB7GeGNySCMmVR1zQEMlS1+ABGGGEHBc08Gb3S1zPGPBp9HY74t+grdd33GhMK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B7j4iCRK; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B7j4iCRK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjghQwgF+nMAIXPFynvaiPbrmfJBs+oBUEUr/XnEi6zZWs+bTbOMfSj8IslizFYyuIg1wCcwcq0u8szQuy0Nxk0Kd/VxB1st1ny2WP9oWQgmlNlZyvo9D+Gb0N6mFDOiL5Xm0sEC4/8D/IV5XuiexdbqxtSoFiwyi05bGlY3wLpCPDbi1cZFfSHfKvH5IQTV2JJk1cQqAmqSMnetH7U8xK8kq3xvLCftC8LTcsld5J6H0eBeGPp4GbndA2BYiHt/K6/pWx2znkRvqzbetLjRsx7QFFm6IQVkKhLnwbyDjJex+Ji0ZUhLXH3MWZ3mBRQaSw4KBlsaMXFKN9/x1J5t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AcOqtWmApdpo4bq61uGCq7BxKN9AFv/6hFXxb44bTQ=;
 b=ZwoZZf0azxONC0ZeRlVsAK8FwBU0YdIjGhyVbk+L3UdbveBJMJDPT9G8t3U4kLTH+wJtCLlCZq/W+Y0VdJtKSipDUc/ZCjB1qUDJ8ltKY2E2YxqoEJgWsADJEK/IIpG/Tw+4v3zKByxF+wko4V8v47RpK5oodQjf/5/SIDulHO2w8Z84c4SfzdSTf7hpPy06a5nVJ7UbBDPFHH+g2k55QJhp+YuBWw2qlhSasU6rhkYM5nx1U9upN9CpM9n88DMJSb14yRV8ARpEKEInLSjRhFCSQszZFfH6hTtPxPaJClFmlzB7w4/DP0walzM2mfE2ASTZNTm6Ri0Vm7JjtrRJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AcOqtWmApdpo4bq61uGCq7BxKN9AFv/6hFXxb44bTQ=;
 b=B7j4iCRKhKtARLpgxldAheqYxe+2uDXzZDeMc0C5peAHwYDvMhvva3AKNRWnX2XpErQvljByrCydO6NYyNcA/GeCN3Zhwe0SQOpBbSyDLAKRT1oNIx7wonDAA83ji/GH4/UFtc2KHsJurDEHGEmZ3ARhvdWa34kKHPspM2kxwn4jDT3S9ivJfbUskFU9Thpc3LzeECixvasFZYHN1bVD8yqTGBNfP/V14F86SQhwB13LDz/iQyhRBUyAiMx4HBLPW4mspYfpUmnq1RRK5JhBOXSCBwTIcDkTE+6wRoRWYOJS0PkRsffZ7C4UAHJsgqjP9OG2EcuuE9dbJEDLqFGzMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB9522.namprd12.prod.outlook.com (2603:10b6:208:594::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 11:46:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 11:46:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 20:46:27 +0900
Message-Id: <DFYHVFT3E1SH.3JFDRG481P2YA@nvidia.com>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
 <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
 <DFY76VCL7KO7.29FCRAOOY7FVN@nvidia.com>
 <DFYCR05BIXCK.24C5YRIM7KK7Y@nvidia.com>
In-Reply-To: <DFYCR05BIXCK.24C5YRIM7KK7Y@nvidia.com>
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: 05383d64-02c1-45a7-7371-08de5cd08eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVhiTmRBTjcxMFRKcmZYTTBPajZ4RlRwY0JwZDJuUmlQeWhUWXBkZGdLWUpn?=
 =?utf-8?B?bWtQYUlPdGNCbEQxaWFacnNuZzIyaFRGV3JBVG1OcHlJNVZyT3lxOW53SGo1?=
 =?utf-8?B?cnFpVlhFM3pXenVndzdwbmtyVisxbThqaXArZW96eUpwNlpZVFRUb3UvazR0?=
 =?utf-8?B?dUlJd01jTnIwV1JpdFEvUzBOSXBBR3JhczlhdUE3bC81Snk0M1RMenpKSkhn?=
 =?utf-8?B?Nitnb2YwekIwWnRvYmloVndKWWR3emtsNDRFekMvTDFScjFBTCtjL0FmelVj?=
 =?utf-8?B?WFg4cU9EcVNnbVEzbWRxSXZHcWVNNWw3T2pUNXk5V3FBOC9jYzBPYTlETzl5?=
 =?utf-8?B?NUtmNWVZMVlFcC84aTk5T2x5SUh3czFPMFVzUEdzcitiL25lUXNoRlNIdVJw?=
 =?utf-8?B?b09oMi9KT1ZGUGFFNUdXcnhLZlRWTzlSYW14Nnc4b2VTSlF3WUU4RXpFQ3JX?=
 =?utf-8?B?NmFZRGpXcURlWXo1Tmw5UnpOMFk5RE9FcDBGdnZQbHJlWElYNGZJa1JTVlhG?=
 =?utf-8?B?L25Vdzh5a3VPK0dYWnExYWljMUR0bTVGV0tacG94dFNiRFRnQkgvbWJucmNq?=
 =?utf-8?B?K0p3RHZkWDljYmU0WSs5dmQvdFdEbE1XRGF4bThVa3oxd0lDSDRVd2dFZFVW?=
 =?utf-8?B?L3ZNcDRnSHNsaDlib3hPM1NKT2NRa1hBcVZyMnc2elNaRDl2VXY5d2g3RFZz?=
 =?utf-8?B?S0tlcXRvWVZYaGwwM0lIY3F0cGU0dnlpSXJGVzV5WkpRZ1dlaHhuc1dFdFZM?=
 =?utf-8?B?bWFtZXgrVUNDckN4aFhjclJrZnd6QitHN1ZVYXE5QzBrOUVGTnBOZGdXSCtp?=
 =?utf-8?B?dExOa3pUMGFBVWhqc2hNVlEvVTBGQ2paY05jRlVqV2VjM2U0SmRaRk9KU1R6?=
 =?utf-8?B?bFZIRTRwOE84Ui9TbzRHRDQrdVl0SWszTnBrbGNhYmVKSkZ3TlkwL0M3dXFC?=
 =?utf-8?B?YXlVRUZUeHhXMkZUbHAxOVcwS0UwT1ZBb1dtd2tsNEVmaGlJR2R6VnhjVngr?=
 =?utf-8?B?YzN1R0lzOUNrbnlDS3VyL1JXUGN3UUlmVTM1VFFjTWdaYTgwK1FJV05ES3NI?=
 =?utf-8?B?ckZXdURTL2o3NHFoTEJNMTJSeXkwcnJhcDlWcGdXQXpaTDQ0alkrSlh1c2h2?=
 =?utf-8?B?WnlGTk9xd2tUY09kY01uT2RsSzQ1L1FESm5xU240RTllbjVrQnlyVFMrMVAr?=
 =?utf-8?B?cUI2QU1semZORHJsb1BWakgvQzBkQU5qL2ZOeHVPa1dVS1IzU0prVmZ4Y204?=
 =?utf-8?B?U1VlVFQzeDB0ejlQVVBMeTg4YXJxU1ZqMkNVVWxPeWZUK3JDTjRrRUtLQ1lK?=
 =?utf-8?B?RHlJQkdRU09DRHh4dFZkZHkzeWFrVnkvMXRQejVBTUE2Wlc1amlVditNQW5V?=
 =?utf-8?B?ZS9UZ09SelFmZmxpSjdsRUY0dk5UMG56Sm04T1VDQVd6U3lqWGY3RTI2dEtj?=
 =?utf-8?B?YWNmSStVdUZocDhWNmYwaXQ4U0hqWnZRRC9DMGdwWFpkblNsMzE2WHVCcDFV?=
 =?utf-8?B?Qzd5dVorQWxNMmszUW01TksySG9lMFIzTGVVc0UxM0ltTGtzS0hxNkhkeUJy?=
 =?utf-8?B?QmtidVpjSnVwODVyS1pRQWgxejBOVTZ3SS9qenE3YlFTeG8rcXhYZ2FiVUs3?=
 =?utf-8?B?TnkrSm5GTnR2eW1mb2hkSHVBZ3A0VndrYkJmWkpMVUdKYnBhbHZtaDBHRzB2?=
 =?utf-8?B?RE5lVjgxQjRQYjgvV2M0UGdUaVJDWlJOUmowUE9IVFhNUWtsQ2NxK1QrN2V4?=
 =?utf-8?B?R2dWN3IvUitKaDFpMTI4b1pMM2ZYWnBqNmg3Y0NSY2hBNmVuU29wWjJlN0R6?=
 =?utf-8?B?RURVVGd2d096aU9uUDEwOVhCdGRIcUpUYitIbUp2ZlJuM3BzMzBEcEcwVUxn?=
 =?utf-8?B?K29FbUZNa2tjbzFRS05wOUNOT0lFWXdvbVhMU1pLdlVmcG8xdkJtY2w5dnRG?=
 =?utf-8?B?SDZqbk4zZGcxTUc4KzFieUtabnQvSy8xSGNLQURBWFdlbUdaU3lNVkFNVkdF?=
 =?utf-8?B?RFdZdHdXTVVPV05Na0czZHVFUXBXQUErT0ova0JsR2dyajBXMVF3MU1rRDZZ?=
 =?utf-8?B?Mld1WXZvRy9aV1cvMHFHbXc2Q2tKcmxKL09YZTk0TE5GaXZaYVBiRzFaVUhZ?=
 =?utf-8?Q?Y8C0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RldXM2thY1JRNnVIeHEwajJ4QU4zbDd4YVNqRldjOE4vOTlxL3lhMWFFQWRi?=
 =?utf-8?B?VkRrNlQ1YVViU1BVQyt4YUhWWVpHRHFwWkdjTUxCZkt0Y2J2WmgzVHNIY0l1?=
 =?utf-8?B?Mm5XWjlZWDNFZTdBazUwZTFTc0RzR0FHS1hBUVB4YUpCY1RuRnhVVm4yNk16?=
 =?utf-8?B?RnlSSnMxK1dUNFhFREQ3WktkNE9mMUlsZFBsazZVYXZUWEJ1WGxrSXVlcy9w?=
 =?utf-8?B?VDVsc3A5c1ZHVmQ5eHZmVDdkSmQ3NkJrN25rYWxMeXlaN2NZMDZvd0tyU1dp?=
 =?utf-8?B?emJyUWp4TXdvRjVzUVlHaHBSZkpiWkhZWHNReVZ2c1RENUwvRjdHaElpY0Zt?=
 =?utf-8?B?ajlZak5FRnN0OEhzODNJbStwN2J5aUlSQ3p2bUFodlVOOTdDamJVVjY0Wk5H?=
 =?utf-8?B?NHNjMzNsdVpmSDI1c3k1TFIzdzZkL3hVbTI3RGpCd0ZRRTdiWjFBYTEzNXlw?=
 =?utf-8?B?bnU2YjhlNWRMYkJrQmtrcE5VM0F6WmxLRDhKcDFibjVLZVRDMUdDMXFtZGlF?=
 =?utf-8?B?SVVici9FOEtHZWhjazhGSjhqZ3dzRERVYUJnVWl1RjlnUjl2YitJeVZCZFNi?=
 =?utf-8?B?K0dEcGl4R2o5STNodVhTeXBJSUJYdTFhR2JUc1VLV0lkQXFzS2h3WmNVSjBB?=
 =?utf-8?B?Z3E3RHdtMzR0WGdSQTlmaDM2WUQwQkxLenJJQVNNV25mZGZ6djQ5Ulp6d2RK?=
 =?utf-8?B?Skp0ZHhDZDZWMXg4NE9PZzdLME14SWU4dUhOTHlVUjIxUVJNdkliWVpWKzFz?=
 =?utf-8?B?UkxjUXBZK0Vyc3R4RWs4UmI2YlhDM1IrU3lsRUVOTStkOWhOaWpSSm9RZ1NF?=
 =?utf-8?B?U1hvb3Z3NGk0a1ZtbDRMaFhaZk5PVFJZWllreXZPcVNhY1J2dE9YVXFzU3Zt?=
 =?utf-8?B?M3dQZ3Q3d25jQm96aEZ2VDRIa2pjYzdHTC9VeHBvNzhZTXltVEVON2dNOE8w?=
 =?utf-8?B?QzY5Qy9HWENBeStCMkRkM1FnSXczZ1dDdnZjVlJUK2YvUDlPeUpBWDN2bDJT?=
 =?utf-8?B?a0VadjdNZ1NmMjdzWitxY0dBbHArM3dJanNCbHFkQWEvdFlRTzhuRFoxdjQv?=
 =?utf-8?B?K2JSNjhkbnQ2cnpCVWh1QjJTQ3VSNUh0UitqRmpxOTY0dDdyZldsTitDWDBX?=
 =?utf-8?B?bEllb05jSzNUMGFnakc3blVsUjEwajBDY3NWV2Z3WGJWYWdSNWgwL0g1MDlN?=
 =?utf-8?B?azRXL1lrQnFvTzBHL05YbklvOXE0dXZvcnF0ajRBRGI1ZlZ4MkJkSWpPMTgy?=
 =?utf-8?B?UDN1ak5VRzV1cmdQZjFJTlB5NjY5REtrSVJUY3gyc2txelJwbk5ZSGZYckg2?=
 =?utf-8?B?WjY5U1JvdU1NTmRWdFE4Ti9yS1BoSml1SW9pTjA0bmJtSkwvbXF2SGt0K29J?=
 =?utf-8?B?Y0o5RGNVN3o0b0pxU0JldGk1clp1SVhNSE9TQUVYc09oOWw3TlZqbXN1OEg2?=
 =?utf-8?B?b0NoVTRyY1hkdnkzZXdnSDBxWHY5YTNUNzdWN3hMRG5qTjdWZkhIbVJwZ09B?=
 =?utf-8?B?WStKeGQ2OGpZakoxRy9Mc0w5aUJjZkpkSUcyeGNiQ09HVGtXWlk3OVNuV2R2?=
 =?utf-8?B?c2IvbDlXQnI3TTlCZDNMM0dZRkZ2bXE3YWx1NjlBTk1XMjFTVjIrNWFsdEwv?=
 =?utf-8?B?THJkRkNzV3BsUC9jNUUrSk5vQTNYYjR4dndwSjFheGtVa3M4K1A0L3BvTWxu?=
 =?utf-8?B?UEs5NEFyekYzWHdFdFpPUm92SWpOV1NESjlNRHRPcjhWdmRHekZZMFVGTXVE?=
 =?utf-8?B?cCtwLzBsbzdOVEduMXk2c1lkZnNDbXYxTzQxbDA3V0c0amE0Q1pGWXNucXJF?=
 =?utf-8?B?Y3R4U25Td0djMk11SFBJQ3RFWGprRllHdTNxdnpLU0RTVk9ERWJCdU9JT29o?=
 =?utf-8?B?d1hpUVBwOWM2c3Q5QVJaVE5uRUx1MSs1WHZManBPMDRDcXU0MWNQc3VQSGNC?=
 =?utf-8?B?dktpQjdJQ3FCMW1TeEUzQjd5Q2VGSnR3M1pZRVFFazI5TExhQWR2ZDhBSUtV?=
 =?utf-8?B?ODlYcmF2TzFjN2EwQVlIMUpFSHhYYmRRKzNXbDUrbHI4bXFyUTd0cVUyVmVK?=
 =?utf-8?B?ckhrOC9NT1Z2OWpjTzJrT3licWUreHV4YUVGMjF2ejExWHRUWlR4YVk4eGNG?=
 =?utf-8?B?REp1bG0zcDcrTEtHV1hyVnN6SmoyczRvRUVRUjhYMWVBQWc5UzJXemFUNWhC?=
 =?utf-8?B?QytZbTVSOFJmbEYweXBVRnovMjZxa3NNTWR3dDVIYWR0bEd5bCt0RUpobkxx?=
 =?utf-8?B?dmJwdTlyaTN3dndVbnFiMXg5Z1UwU1dyTXYwQXBaSWdqZy9veUUvNmcwZXB4?=
 =?utf-8?B?RkhFT2xXZjBFdHdKVk9FaHpXVFFkZU1OVGJuSy9rb3FVbnJtbXFrVHE3VnZI?=
 =?utf-8?Q?KtZVwPHgOoQFjXRa/6pYkRpyMLseqjrlqVZ51W38RAgDV?=
X-MS-Exchange-AntiSpam-MessageData-1: MiylUKDmeD+efA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05383d64-02c1-45a7-7371-08de5cd08eca
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 11:46:35.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rRIoWSc7ogPGlbLz5h9/0XUMOM/1t93wMq49GHpkfzBNzALnQriIqrlJM7yQEww6px5FgM6X9P8F1IB7dW62g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9522

On Mon Jan 26, 2026 at 4:45 PM JST, Alexandre Courbot wrote:
> I also only noticed now the proposed reordering:
>
>     minor_version: [3:0],
>
> I don't have a strong opinion on that, but fwiw SystemRDL seems to do
> something like
>
>     field minor_version[3:0];
>
> If we agree to align on it the latter might be preferable?

I have tried implementing the alternative syntaxes, and I think this is
a case where the original one was more readable. The bit fields are
better aligned and easier to skim when they are put before the field
name.

I'll keep it for v3, but of course remain open to alternatives.
