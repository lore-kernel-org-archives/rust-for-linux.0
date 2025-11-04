Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB5EC8F0
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762240057; cv=fail; b=r6hREvIbiMr95C34+oWlJItCZ4/3rgUqigqJ6ohhvDYJ8xlTrHXJQ3kBerwx1LytgD3NC6hu+VzB8BPrU0QljkSTg2f7OZmN95qd5KxIUkowYkFuuswq3C3dFfTB7AjQfqskFL6kn5Bwm1ACUFTur0VEkLxZCZBdy2+drUt+x4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762240057; c=relaxed/simple;
	bh=qtW2LnbsKtMq22MNqF8rp9jvV2OD7eyPWd6QhgHI2Eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q6ccLFg2xymCHJs9BT8sO4A+PSoPYyruMUQS9mIi9A9zPC/R6q372yrlb+zc/2xgtFF1GkdK9Sqdb4iUBInUiKyhTEyZyZG495yv7c8pSlMU/NC2QuNzSDK7TMrsxmPDYV/OHcjt0kX5OiPNACTKYP4KL1ZS8pFIkdo5SmLls+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Hw3VGPMH; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Hw3VGPMH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYczej0ZR7jtMTsGjNyu0SnrYpuFy1kOPw/upfR4kmgXa0aO6wNTtnAi+oPoOU7CVe4nsDorGprZRmf369IHSrGd9cIbOIhzxzuV6hoJVq3KSPbB8wtYlPHAYBOPU9ClW/hBMdeSDDF+cIHM41V3sbvAPO2ajLHcjEfd97OrPHrXDveYiWg/qQO/pocr39luE2qBEWxMUyysZbkY+sUNU2/dcqDAy+rNBzIbOEKYsAUXrveQ3QnanAhfQyci8JQj7vHJDBL9gmp1V1IX3wJ3eit4K9YGbaTYPF6myPJQXveGEAVOK4GqrzTkpxJ00rgZqg/YaUkErpuZwzFYJjk1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+phrrwO5S5HY+l78/HTzcnRyI+Ns8Uw8HRpAfL3kxcs=;
 b=AhDlsUowk/DZLYkthJuixPDwk7jK0acQAYpIZEN6Iic/MJsdrSVlaGa7dROqW72nXjGOowrQgmISR7TIiXXXWQHTKZJogKyAw93WwyhDnGK+rq22R+cv7VJQt43um5ZEPhufEYpkU1AgOlZORqs2CwEa2U4///TCfLdJcoZewFx38JztPsE+ysizQ+2vL3/+QtqkCC/Kt/zQfj/R+wmlE/wsOMk/oeBttyg7YlyvsxVggiTOdnK6XwJXq6lhFh7t2ruNtY7RCPGLHRVkpep46PwMu+4OhnY+/p+LYTm9ZOI313eFclon/BkVVRnztkegxykJUlNTO7EqDLNfQdRIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+phrrwO5S5HY+l78/HTzcnRyI+Ns8Uw8HRpAfL3kxcs=;
 b=Hw3VGPMH/y58IVl6c2/vCsAlqvCAaKVlJhYfA0PsCR5bRnHrcoXqFZIdvqPmZrxgSna3bnhvSf/GoLN4707xKLiYcYzFjdVnnWxjq5kUJsMhW2dvYuJM+ASAWdXWbZxlQPMEbvXBIo9MCHlCnv+8P8MS0yuNzMCiyfQ96bJ+N4VQbyDBaLiI3urKilPoJSB3qNEHmEy9Nw1+YAZNCLt2VY/7fveDviWmr42zYZEPERwT35Uz2+U0iBqG31hGaxIc/8T04+eBIu04pBVGFyYy5fpgjbLb4v90oDlBOrlJlggwxNm2F3tH6mH8f2xU8YBpnFjzGe7iTXUyFdSuoGxjZA==
Received: from AS9PR04CA0177.eurprd04.prod.outlook.com (2603:10a6:20b:530::10)
 by AS2PR10MB7106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 07:07:30 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:20b:530:cafe::23) by AS9PR04CA0177.outlook.office365.com
 (2603:10a6:20b:530::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 07:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 07:07:30 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 4 Nov
 2025 08:07:23 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 4 Nov
 2025 08:07:23 +0100
Message-ID: <20a1d4f3-1fa3-4789-aa7d-385d33ea9324@de.bosch.com>
Date: Tue, 4 Nov 2025 08:07:13 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ABI mismatch build error for 6.17.y and rustc 1.91.0
To: Greg KH <gregkh@linuxfoundation.org>, <rust-for-linux@vger.kernel.org>
References: <2025110452-diligence-share-98d3@gregkh>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <2025110452-diligence-share-98d3@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DC:EE_|AS2PR10MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: a211964f-7bf3-431b-eddc-08de1b70d219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkVDMGE4bkZQT2RxOXo2bUhCTEErbjROOXV4ai9BdFBJV0xXSm5qTjM0ck91?=
 =?utf-8?B?SWVocmZ2eEQwU1hqbWZBUkEvMjNrTkdkcUtrV0ZkaEVzM05mWGVjY2hUUE52?=
 =?utf-8?B?ZVY1SEE0UHpPMTRCQzg0WUhPa2pUM01kV04rVDNWUDBpRU0yZDMrQmpTSmJk?=
 =?utf-8?B?UzZST3lBd21YbTdweEZiTzRDTCt0WGgxQy9aSjgzZ3ZoWDdTQWxLZjFHY0g2?=
 =?utf-8?B?N1VNNWdTdExZMzZBMEJHS25mRzViekk3N3hjOEtScFB2OVpHTS9oVjhncVZ3?=
 =?utf-8?B?blNwT2p0aFFOL3M1aGU0ck80akg1R3hxWCtZZk85MVh0ZWIwRERIV20ya2Vp?=
 =?utf-8?B?Yk85LzU4dkY5N2x3djFLa3FqQldQbTVHRnJNamUwUFN2UFpwWWVxSDNWU1JC?=
 =?utf-8?B?NDVyNUoxK09rTTVldGlSUG9ZcnY1ZEhrYnN2UmRVMDdPa3R4WXBVZnR4VSsv?=
 =?utf-8?B?Tzdaci9HL1VXRkUxRDBZMjByT1hiTkhUNmNUNVBPeFo3ZzkrVmVkODlRWFRO?=
 =?utf-8?B?dk8zN3ErV1FPbjIzWXcvVTFOMm52UEM0SmFoVXdINnd2ZmE3Z29lQWgvaGtB?=
 =?utf-8?B?TTBwMENZeWUvdGxpdUxxM2xuTVFtYmN2WVdsOEVuZm1jK0xjWjNnaFhxK2Ns?=
 =?utf-8?B?OHc2THdxcktET1NrR0RoQStRUXZvN25TT0NmZ1ZudVJJVjFSZjhXZXRqNjBn?=
 =?utf-8?B?eVVsOUFaNEN5SC9RN251MzExa0w5MWtrY0s1RElnU3pQODUvZHhWQkl5L1Jv?=
 =?utf-8?B?OXVwNHptK0JEWUhBS1ZzNUxBMUswUUZueko0bHpjWUcveVlvNVQ2cTg0S3Jx?=
 =?utf-8?B?dEl6MjJra1dwTlVnK2o1Q3FERm1CTGYwbFZPWkQrZW1HeVg5cEgyWWxGTU9s?=
 =?utf-8?B?OWtHb0ZjajBvYWJoSFhsOEg3UWIzemRWYnkrSXY5akwxT3J5cjNJemRnUlFp?=
 =?utf-8?B?MElaQzc5Q1lPMHRZSUs1NTZ4UWMyK3NhaitvdThHRUhGdjU5WTV1VFBENWZ5?=
 =?utf-8?B?NEswVWlHZUFVS29kMEs3SVpUU0FCQ1p3cWIvcExKazNzdnduUmc3MkFJVUdB?=
 =?utf-8?B?bWdYM3I5VVI2VGdUd1RVT0FjcUFTZTY3Vk9xTWJGR2dBZVl1T1B0TGx1ZkVp?=
 =?utf-8?B?akgzdldHdFhjYW01UDlQbmlTZDN4cDZOMGZZalVKR00ydWh3cFRLdmwweDFt?=
 =?utf-8?B?Nk1jY2V1UWNmL2VtQXJTZzM0M3RQNTFsTlJ3UTRMOVNldzA4aFNoQTg0aVFT?=
 =?utf-8?B?Zk9IUzdoQWhBaFpvVFAvWmNMcTdoUVorMnJEeUM0RzQyQisycHNQelZJUHE0?=
 =?utf-8?B?REExU0p6Um9qTmJXbTBrZFp5cTVCT0RIUks2Lzh1VHhBV3JZOUJKeUFvQ1hU?=
 =?utf-8?B?VnkyYVhYNVp6eG5vWmYzS0txU3JnWmhjTjNSaXZDNmhYMXkwb3BPcE8vYnRk?=
 =?utf-8?B?bkg0Y2ZJaVpLOHBhUCtnOFV2elFtdGZzV3EwbXJpWXFqZnBVTXhaYzhxTFpT?=
 =?utf-8?B?TU5rOEhzb3ZwOU9HbTlmUEdDYnRMUGR1TFRZRzZhd05LeFZqd3NZUnJyV0Ir?=
 =?utf-8?B?dVM3aW93Q2hnQytHUVlCTlU5ZmlvUmJETFNxdFVWKzhjdzVPcW16YU5aMGtN?=
 =?utf-8?B?QjVnekhlRWJQWG5aU0lxNlZ3M2ord0E5SGc2ZnNaWnJiblN0U0hHU3h5clIz?=
 =?utf-8?B?UDVWa2g1eDU3VWh3OXhwRHJUcm9KT0Njam9mM0djdWFieHNVVUl6dTBadXBs?=
 =?utf-8?B?VzVsdDdGU255QjRrVm1LMlREV2Y1eTBkVzZrdW13Y0FTVzZUaUVxSkpZVHVT?=
 =?utf-8?B?bE92UC84aEgzNTg3RFZncUFtQTlOVU44SU1xMUNSOFhzRkZoNnVaSFNEcVRo?=
 =?utf-8?B?MGNrMVRYcVBIVitWK1lleUQ0LytqR211aDFGMjBFQkt0N0Q3Qm5sU3dqTStH?=
 =?utf-8?B?d3BUNFFGVnF2Nk82Uk83UmN3MEpvNk16bElENjlZM1lobjFuQXdpZko3djdl?=
 =?utf-8?B?VEpyNkprNUxiZjR2QnJBNE9RMjhlWmphd1FlTnlBZXdndklEUUw2Z2d2NEZ2?=
 =?utf-8?B?dEdZV3cxaUpaNkozVDFmREhrQmpkQlhwRldQd2hZekJiUnljYk9mYTVuM1lt?=
 =?utf-8?Q?JUfE=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 07:07:30.7609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a211964f-7bf3-431b-eddc-08de1b70d219
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7106

On 04/11/2025 06:27, Greg KH wrote:
> My laptop just upgraded rustc to 1.91.0 and now I get the following
> build error in 6.17.y when doing a 'allmodconfig' build:
> 
>    RUSTDOC TK rust/kernel/lib.rs
> error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `kernel`
>   --> rust/kernel/lib.rs:3:1
>    |
> 3 | //! The `kernel` crate.
>    | ^
>    |
>    = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
>    = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-address` in dependency `core`
>    = help: set `-Zsanitizer=kernel-address` in this crate or unset `-Zsanitizer` in `core`
>    = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error
> 
> I don't see that on Linus's branch, but maybe I don't have the same
> build options enabled there.  Is 6.17.y missing a patch that is in
> 6.18-rc to resolve this that I just can't seem to find?

This one

https://github.com/Rust-for-Linux/linux/commit/16c43a56b79e2c3220b043236369a129d508c65a

https://lore.kernel.org/rust-for-linux/CANiq72=0JJz5XDHGpiyQBd9AmPCr4veJ=2oJywyyqQB8iMxqvA@mail.gmail.com/

?

Dirk




