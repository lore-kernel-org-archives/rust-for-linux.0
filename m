Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321151D86FF;
	Mon,  1 Jun 2026 04:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780286488; cv=fail; b=g8mLIGJR4pameb0xtK9pAjAmbljvb0WeNraAjdS8Vq5pOZG9orqZAxb1xHinRyjK4CwPcg3UBwlV+5KeLHHOSS1+YrxKt/sZ7bjS1UNAuAxCqXlHm8NxWD3sqxfydacESHGwzrdVM1DkNfArCxpy0oda8N+rEzmpLRVMaKiYSzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780286488; c=relaxed/simple;
	bh=4BC3ba5QudX75g3xVIlvslYxviJQ2B5FITNJmA7iorc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WN9PtvgW532lzo65ta2K9L0PT4t/CwokhSDfqSQ0AHNfQJpVVopH3zOGPsC054ut5i5yktQWz8vhciHg7uYXEFAvnNQgJ/2gPfkdGTOcTb0pWZVhbdaXbN2kUC3gmnjW/Nxa1EGR4SthQJbUCNHiZK8ELN5NWvleD6RLKdroYEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cqtIYyIJ; arc=fail smtp.client-ip=52.101.48.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cqtIYyIJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0k6PLvtfJPyH2NQAYVvJ/guwHrDDkGiDD82YDLPWamg8hB2inr5jAPoZ8mx4Zqxe2oejX1ZbR8uinGzbKc2ChH5XIIWqSfnDUasmDQg6+DPSw+6eBbUuUzUST1EHOxtbibcThpp37Sg+IRSUrAAvyqYTae+qsfeAFzLIsrjU/v8k9WQI6+fXBH3ot0NzXhnVez+LHk5Bfuqv5LEbQ4VCk7djRV53PEvNLmeWRW/KUuo57ZRkcr0KWytol/uhVtC/ozg8ZnaGuC3c8PpgxafvhFqve99BlPMLuMkDyAx8xAiKFPenZkPK6vB19cwPvVU/5tiZEtKV7lPgiaGETJCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BC3ba5QudX75g3xVIlvslYxviJQ2B5FITNJmA7iorc=;
 b=DD4F52oDxaQwq8jRpdKWYw6BKJ8zpB9uUn002JI268BTpAwjQ1LTv9iA8GKl1zepvtxnsrmAuBPnlWP42hLhh7b8Sv9VXU46XNDQXKhIJFGnggs1u0Q6K0AcN8iMTJIe/QkDzzjKaBzxD6jaa0TZR2lF/qgEvTKWnyWYmEQovs6TvbDkjh7XVQZfvQHCXQa7Fkc74l/tfxicopdIskimK3Kwizev1rV8b9D4TWVYv4IrTJPvXBqJWxFuuRnBT9yyk8UQye2vF7SSFI+uFR1fPJHvNZpx5cvNXfLeVqhgS+Mhj7V3oIlvrqZm7h/VSUk6uuyAE8opA1NuT5momtC/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BC3ba5QudX75g3xVIlvslYxviJQ2B5FITNJmA7iorc=;
 b=cqtIYyIJRgQdQpFUFWevkSQBI49lJzpwEx+jfKBqAIR/K0GrQUL21SFK4M2dnEYMuSnW9Y0QbM7qgwqy0MINk5SrQ/50XsNueDb0pwwLo61Cy4PbHhl9xWe/WAbaG89vQ2bjSJ1VeblZPLwjZjQ8c7VejQ28pkn0BgK16oW5SfTiEduQhWetm2dF5P5dRI9CBRLh/VtSpWjYhG6HpK/iGgFs9ivVlARJJZvkwm+GJeGjxYSceVZm4pebqsQrrXZ7kNSkKK7HCUg4Ubrn1NK3kzc4XSZLaJAQRbFRzRuU594iCgVOU8EzxwfhxNVqSRd4imvro++QcD0sd2bcvWiILw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 04:01:22 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 04:01:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 13:01:16 +0900
Message-Id: <DIXEVWY799LY.3IKIOGNHMOZWD@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 01/22] gpu: nova-core: set DMA mask width based on
 GPU architecture
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-2-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 7757ce08-4162-4dc7-4558-08debf92709e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	en9jts4zRGHgcZNAnOwgCLECz5ZsPZFLgFvgueRRWqDYwvTgu4ozFvDnIQpEVPswy57fwib5tX6fV8aFeWYetNoRWLmfGseI5rIwYjvL7gZvhLDVrnPgtquJnPF50mLu4qRDcUMuVHyX65nAhnLI2+nRJynal/jVSJwFsoqFJB3uXWoKaHGzpZ6/4ZeckTAt+nhH4DQ13f1dK9awvMXSC5yC2MFax+mIHOXrT3HzUPdU0U1USsGSDAgdQfBtCIesbBvS5i23WW6J0mf6q4vEPfQkrA6DKL1Rb2C4Y2cPogRDhzYTYuf4xqRHUvpD2e+ICnHf/VtseJzx8ZBJPLDu0mgB+gUk8x+b6AQlVf/o7UT2STDIbODnIYxipQugoQVMeXG3Dfc3xIpbKq5QQkAlIFaWKKRU6xcC3opO45n/gFihS0HbrRW1im2/yUNlRjqznQut1uAMq/6T33ceUjETRE6DKYT7yIZJyP9JT138oR4d+XcVr/07IDsniW7jQSJIK0v0RPNln08+HEvq0OejnxkEHmaac1nuIWHMxa1bURgKiWFwdBEU2cwJtVEK4K2urk9dskL0SHWh8PDsdvCnxOAyG5vFzrHZKFKwq9UZCK1d2R5mOKkSrdWul1uY28dwVInZj79GFKg6HqhdUkVZd/nJKsuuX5bOxQzew1Yz4f49pMaX/MqQpDL6xGoapsC3V5oX90jAg2DMRxnwpE1PeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVJzL0gxU1lFVEJ4MmQrWjdzenRjdG9ZRjVFTlZZT1l4L0JpN1JWeWJTUnh2?=
 =?utf-8?B?a1d5bW5JMXhWbmswVDVONExldUVLajZQdVRNaHVidHBhTjNJRXpsRzRFZXd5?=
 =?utf-8?B?b0htaHdtT1FCUVN2NEZVVFJXbkhvZytmYk9VUGt3ay9FNWJEL3pCc1F3TUpS?=
 =?utf-8?B?MmJGdlYxcmQwb3FqaVZGdzVxd05CUk9FR1I1WGdvY0ZmektMS3ZtaTJ2VU5W?=
 =?utf-8?B?anFHOFMxRFpJMldsbW9pK3NjSndpMEJZczRHaE1qT1BaYmNGZmlTR2U0Nk1v?=
 =?utf-8?B?am9EOEZmVmtIQVM5QmJrTzUyRE1Xb0lXa1NXRmg0eEdxb2hra0tCYzVwNkRa?=
 =?utf-8?B?YXhpYTMzc0xqMGE3NXYvZUVNVzNtb1FtMHNOTzBNVkpJTDJ4MmJ5aUpqelFy?=
 =?utf-8?B?WjhIbjVUbmE3RlFBUlF1a0E0YlMyZmlFMDBsZTdKRnpuWmM4QjBORkpmRk44?=
 =?utf-8?B?NXhLTk9nMTB1OU9US050aytVa3RYU3pDa3dDa2NCay9VaFIxS0pXOUdyd09E?=
 =?utf-8?B?TnF5NXQva0lkN29yRkVpZ1dpVHI4YkYrRGIrSTBOUFlCdU9FYzhROHg2Sm1K?=
 =?utf-8?B?V2NWWmEwcTJLc3ZZKzhDRkYyaTUwRDcxT1hHM1lCcC9oNXEraHlRTmhmY2Uy?=
 =?utf-8?B?aDBjakdOalV1N05EVTFhY3RLbkVQRzFpakhlc0psUWlQYWhSZEt5b0poVWR1?=
 =?utf-8?B?MTNDSS9kcDQ1WUVIdHVyR3ZDZ2kxWWVvWjhySHpaRHFrNDNUeXd5ZHFpWk5x?=
 =?utf-8?B?WG1neWJHKzllMU85ZitUS2xhL0EwekJTRVZuQU51cDYzQUpaTDZSMXJMVjN2?=
 =?utf-8?B?ZU1YbmhCZlAxV1NHQ0N3aWk4WW10MW5ERlNZR3J5S0p0QVhUOFUwWlEvcHI4?=
 =?utf-8?B?SnErcFM3WHNTT1p0NmV3TGZCVjAyaitNNG5qYjQxckRpVy81aEt3VHVMNzdD?=
 =?utf-8?B?UlVscytqWTRxci9wZ3E0cnlNemkrYUtUUDhQdkFLVWJOZERheHM2YXdQMks0?=
 =?utf-8?B?TXBvU012bUt3RlNwSk9JdHZESE02dGVWUzQ0ZWp4Z0hZNW0zb0ExT1QzSWhH?=
 =?utf-8?B?aWxVd2duQ3I3Q1pud2JIYmNwUWxYU0M2T0h5UitHTWJmRWUwamYzYzhVVDlK?=
 =?utf-8?B?dGxWY1haQ0dBZnpldGNSS21uM1FmMVRYMnhSaGJLaGZ6bFc3cVcxNWRWUWVY?=
 =?utf-8?B?ZHd1MExSV1dkeDF6RTJoTFlrMUZpSE0wOUlIVE1qWE1zRGNOZ3NXYXlTREhQ?=
 =?utf-8?B?d2JzZkVFTi9jcTdjRXh4azZ4L3JSeExBVG5BTWJoY1RhK2h4czBkaXBsY2N6?=
 =?utf-8?B?U016OVRjV3gvVUpoZTNEZThlSUswelU5M2cvOHRoV3RlMTY4dEIwdWwwWDBT?=
 =?utf-8?B?bGhTNGkzOUVkbm5KMXE3b3lsTkNiYjErTFhhOFc3ZGtzTDVNcVVDTlQxN0RB?=
 =?utf-8?B?bFJWTDN4c0dWOUkzNjZOMTQrWkt3L1NMM3VKOC8yZDFHWjEzK2p5blEwRUhX?=
 =?utf-8?B?ZFdiRTM2bE1hcVJCajh6VXE4QTFETHZHeDVwN3pndmY2Z1R6SE9qMFUxZ0pl?=
 =?utf-8?B?RTd5K1BGa1JxbDRSdWlOQnNXUHVWQUk4R0NxeHk1VURLcnh4WmVLWVprTFQ2?=
 =?utf-8?B?YVBhbi9VeW5URHNZd1RqSEFxbVZ4YytURUVwOWNHQldpVGZFSnNGWlpNUVJl?=
 =?utf-8?B?VG15UGRvVThwZVBpM3g1L1djNGZkTWlVY05SRVJjanR3U0dPbVRQbE04bVZp?=
 =?utf-8?B?clMzdnd1SmpTSmxUSnFmUFVpU0JZNGRieXhJVXAweUhEekQ0QUw3d0lsMHBM?=
 =?utf-8?B?OEFxSzFsaEJ1TFpxeTZBOUo3bXU0aS9RaFpDbGEzcWhCMGk5UFpHTHlkMjFQ?=
 =?utf-8?B?TGRydCs1TVZCQi9QcEhVK3F4TWlqT2NXVUZyaWM4dFoyUXRUL2t1UGphMnNt?=
 =?utf-8?B?anZ5TU83YWtwNEdWWURTOU1ja25ZcEl4N0xtSksxYjkrV3I4Ri95MFZDR05E?=
 =?utf-8?B?VStrK0NSL045SG92M1ZNUjllZmJsbjFFc1pXTmtiZ3l1TVpYRGI1ODJXc1ox?=
 =?utf-8?B?NDZEY0tzbUhnaHg3ZVpXZk14aVFrWUxwUFdNazIwNjdRdU5YZnZUbWZXREk1?=
 =?utf-8?B?NDZjZlNyWERIRGpMa0dNbHNFUFNwY1BiZ0FQMi9qdklzUGNaMWFKVUtyYWJO?=
 =?utf-8?B?cHMxSjdUL2FqRXA4TEx3YnhBTXdsekZKa3pySUsxbzZ5UWt1cURHK1FWWkxx?=
 =?utf-8?B?YlBrdURIdUxHeWZZZkFPOUtuQ1pJcTlTQjlwSnNFMjZDTlRYMGl5dzBYMmtS?=
 =?utf-8?B?SXFXektheVJzSjM1enVUait0dmdEeVFtNEhqMDBlV3AwQ1BaYkhMUmRFV2xB?=
 =?utf-8?Q?TMJ8nhozSPoQfboLt0I8owcMr2NJfrAimuAO21ZUJASP6?=
X-MS-Exchange-AntiSpam-MessageData-1: SjcmN/oGeAHR9w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7757ce08-4162-4dc7-4558-08debf92709e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 04:01:21.0502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDNf5LRxwZrS5K8HX75D3z7WWp9CWr+8HODSZxto4eab+8Ctp3pCJxmCb6lB5eqMBIM5wUpbIC9biayFQOh+5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Replace the hardcoded 47-bit DMA mask with a GPU HAL method that
> provides the correct value for the architecture.
>
> Set the DMA mask in Gpu::new(). Gpu owns all DMA allocations for
> the device, so no concurrent allocations can exist while the
> constructor is still running.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
