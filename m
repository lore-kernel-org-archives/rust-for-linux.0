Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011002.outbound.protection.outlook.com [40.107.208.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B99215F7D;
	Mon, 23 Mar 2026 01:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230085; cv=fail; b=mHpuivEvatP3VirAb7jPSnJTesetMJHwVpcHkMrc1R2YH82NbmpvFv+TyHjxduQm5TCah3229SzhwaLnEniwLmnQvNSxawvcbZw2sCixpRb9iAW5U7EMiHLjyMthAhz+jKgD18rKIDyrqnAgk9U6IFo+yJNZZ3zPLL0F60OstvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230085; c=relaxed/simple;
	bh=8IOmA4MHxZo4ZLX5CLXlCKNb6FDe9eEPS2VgN4BYecA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=F1Pjy2JXBPFSP9z5CK7bDoYNC9FhwmiZOLtVMxaPwG82JRTo++BA1YzL5e9KWQOL6WEdDJ4yR7X9SEyQzRiXuB/xrTFhXEktFBemlgF0pi98DUoCWReBjT2ARIkDZaVZWtYZO7S2deHt1UW3kMZjC+U6+ovaYJh7fAwv2W5pyv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kq+hI90D; arc=fail smtp.client-ip=40.107.208.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kq+hI90D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lf+v8Lzs2YheRK0b1TiHqk7WAKjSTIzsbb7X89ZiBb10JaI0b5EMzrvuDprZQIpPsV2qpw9hpb8IBTsSfF36zfzMFeYXr0zfRmWcT/fJiCjqfOiWAjeYTKCUDbTBhGrzBcG61xR4s9rwHIQvVkYrr/5z1L7rp42xiuaU5lKv+x2DjDlMoLA2GfY/gC4iB0ulzrIrfMC8G+pqeC/N9g+PnUN4/Vxgt1vFsA9KS789v8XzX3z4/q4y2osmJzkJrdPyciIqD3I6wqvH0XMU4D5gB7MsnEvXcJn6GhzvujjbpA6sP0bHa2KXJk1XTVmRWvLoTaim1hQ73Qo748ICfb8JKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IOmA4MHxZo4ZLX5CLXlCKNb6FDe9eEPS2VgN4BYecA=;
 b=X8J4nydXX77A9sZVATFrM3QR+9hA1yYrqHLcVt8vFLJbzb/jNi1L9rYMgfEbULTLXyUib4VG3yh45CZ3b3YZW7KbYh8BaaSCjqkr5hPXURAAFp/zzZLFNIrvp3R6dhjE/mlIoZ9h4vLaHdntibAq7At2nu3IY4rfs7hesMd8OGhQOsaD1mFlJohC9L8OZ+o0dujTQgDeulTxNxWPn7cGZ5ilQgE0dtVH0n7Je51GZBT14390w/gIdsFLIAwX3P2YjvlIdT5GFa7z81+KYFt40JMFUDQV8aO7w22aL9QhU2MP3nwP0h5b1/LD/ohjniGxqSX6rPdSK6w1pkQoO5roXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IOmA4MHxZo4ZLX5CLXlCKNb6FDe9eEPS2VgN4BYecA=;
 b=Kq+hI90D5QUXMuRRnyHXKsdWSYNfBjz58gW5ID60SDO0fsPV2v1ezg8lFDDQB3T+bcrHP0BMoZ6bFcJjNx/carIb/B0jAJBx2RE0fwVq255Wjr/NjJHo/itDy8EgbqMAqkr4MJ/N8ByodDiN/2c/VdDIHQaozFMzKTKLAUnFbq+H5als6s+rRsW6fg1EVQp9eZr2MIs1ujQ6lBqUaMteuRUWRiHZ2LCR6/4tuX8Rzz3201KSK20JEx3KCdIZFx+DBVhbKGxF8/gRJzmQSzDdNGd8VIP6LT/OQcOB496QhxpTDyw1bKglaG7GHLWsMRUnhdvfd5j/9rFKQYM2+b70CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 01:41:18 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 01:41:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 10:41:14 +0900
Message-Id: <DH9S2K15XDFR.RVUP2LI6EQ3P@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] gpu: nova-core: convert PMC registers to
 kernel register macro
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260320-b4-nova-register-v2-0-88fcf103e8d4@nvidia.com>
 <20260320-b4-nova-register-v2-1-88fcf103e8d4@nvidia.com>
In-Reply-To: <20260320-b4-nova-register-v2-1-88fcf103e8d4@nvidia.com>
X-ClientProxiedBy: TYCP286CA0335.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e33d264-3ac9-473a-f4c8-08de887d474e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	oH/FOfOUpwwezrGNKS6n1cCljkZEJcSoUWqhKjOcPfhmdYZMvDsUmlQHwEYvgB15/EC/lKzusUEeeJsA25sH8aE5pVECvVlNc1IldgEoU/TqCUmVLmnM1ZUbJzOOxndLU+G/evXT+6C9W11F0N5iGfuM0rGA4hs4FV4m5zGaa0rYnEceAmT65nmgq6Fxfr6MfvaSd2cm5eDRbq7NKXaKXS2ECnYSpx0vODypNxqamCxrLxqwah0pK9Gh/8eSgqaYmBlQUpPdOjcA+dpr9WE3FlYWe049+dTzGpn5Dl0T23tRTQ3jqkczSu0axWFe96MnkjcEtFnLZsDabUd1dazB820K9Z35JBQRgLlUaENbxFFnLnCY2EiKq7eqfPTHYM4JRHNEy3OIWUYv9a8sCuQvoeFKY7/R2meCqQbzPM0JitJygpZ5AQBj8XHz/CWFGrIS96gtYEB36Nosdc/vWh1pw7lUa2SgMBzwofLPebZ3D+yh+om5gktHr296wyaqJUdHG6qEi7FwR9rOxCcIkvlBY9J7BkYszP8qdfMlpY6uX7CScyDKE5PE6Bk14yI55Qf6jh53t8qspqnVFoztO3k732E9JQkuOvjATy/tvWv8Hsuj2+mvwQjtDalFJSdv899bk+ezwhEcbDidez2/UXqclwPnRlaS+Hi9SQfcHAQ7jmeYQNVjA1OgstJqLITDa3/7Wj46Kls7ofdyOAabe/PM79Cm6e4N8HzMADwOQ/E0YjXCffFIgkREHKiuKtyZQnuCm/oyOtb1QprTo7kYFZ3Ofw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFc3TnFoSXRjVThUR1p3c1hqV2QyeEhEZ21qRmpOZDlrMGVwTnBObGQ5cDlZ?=
 =?utf-8?B?Y282RnNmNktDc3dJV3lFNHh6SC9IL1pjYUM2YlYwVklWT28xcTZ1YS9iOWZx?=
 =?utf-8?B?dUY4VWw2eitQM01XN3pUR2l1OHkrSEpRNUdOelRaWW1lS1Y1dG9CM1N3L0s1?=
 =?utf-8?B?YXlBL0xmVkhKWXp0SmVFWHNPdnA0cy9sRmNUcWM0U3ZpTmFsOGhRaHFFaEVH?=
 =?utf-8?B?aUxZYVFkSFpVWlZaUFhid1pCeXF4NEl5dmZ1VXNGQUtxdStjaEVPaktIWStI?=
 =?utf-8?B?ajQ3NnlEbkFLd1prcUZSbWFPUnJzVWphQ2JEa3p1NlRoNUE0aGR0Wmp5Q2Jr?=
 =?utf-8?B?Tkw4WmFTbFEwRkV2VmZDZUxab0RBQndFdlI4RU5HdDlHZFhDUDRDdnV5emJF?=
 =?utf-8?B?NzBZV3Q4ZVlJeEpTQVBDUysybWVqY1MvTjc2L1FtNVRycWNrUWdVTktLcGJa?=
 =?utf-8?B?QXl1UWp4aDZreDg3SWxLTUxzdHUvOUk4R3doZ09HTjlUa0Z6SEpqbElkRFRZ?=
 =?utf-8?B?SDdWdWZ2dUxadTBQMDZrRDZZL0d0VGpuVnFBTXhCQTEvTDdJRUpyQ1djZlFS?=
 =?utf-8?B?RmdsVDZsM3hweGtDN1B3cUdmK1FrdnI0ZEJXSE83M045UHozdllNRFkvU1ll?=
 =?utf-8?B?QTNWNzdwUnBvNys4Y1plYS9iWHBlWkV6UlM2VDhLUGRmVyttajMrQ2NDeHZU?=
 =?utf-8?B?bEtNajNsZ0IwUDlKUWhaY0V5Snc3TlptOGF4L1JBNCtzUFhSWmdSby9pcXVt?=
 =?utf-8?B?VDNHL3dPL3VJNU9uQTZ0NHBOWHp6NGRCdWg4TS9mbFovWEY0Q29Ud2xydVVw?=
 =?utf-8?B?QXhXb3YySTE0WkRVeVVoNTBpWFJUQjA0UUlmWmZnWlhGeVRCQkxubEY0NUVK?=
 =?utf-8?B?Z0JVbWRCR3Ara2l2NFppVnVyV0lNZU4zb1VzQjNjVmdQM2lpb2g0U2pEZStK?=
 =?utf-8?B?RW83K1R1eHJ2cWlkSU9nckZ0bnYzaHRNeGF2b2t5SnFpN2tjdldDNG9TU05l?=
 =?utf-8?B?MzYxdm5wSG93cGp1UkJ2NXdieVhCV3Z1d0t2Smt0L1F0aDNyRzc4OFVZRW5R?=
 =?utf-8?B?NkNjUFFCN2NxNjN5YnQycEtkZzY0Kyt5dlhtVHRVNXE1aU1ITGkvZ1BJY3ZV?=
 =?utf-8?B?NDdyMDJacG9aUHQ5V09sTjB1eElmeU5OaDVYZ1ZQbTFuaHBLZmFJL0gybldi?=
 =?utf-8?B?ak1rMDV1R0p0dm1VWVk0NjdqR2lLTDVsc3hkWjc2ZDRiYzQraFZtQ3ZXb25Q?=
 =?utf-8?B?bzk3MSsyVTZoc3IyOEpzdHpndnJaNEZ1YnZqV3BwWjNsYXpaeXZSc0VGT0sw?=
 =?utf-8?B?QkFaOWpET1YxWk02VHA1Q05YeW9pUDEyWUZDTzZUMFRBZEloVEFTdFZDaS9w?=
 =?utf-8?B?OXltdXpLRjJrSjVsTzRQbGpnU0E2Z3J4b3dvaldYbWJUWlBocmorWCt0eFVI?=
 =?utf-8?B?aEVhTTd6V01NT09JQmRhVVRFNlZnSWVuWW54UFYvUkpVYnBpSWdZVTNkekJs?=
 =?utf-8?B?bkxsdUtHeGtWOHJnVDhuZE5LWmRJZTA4cjIrZERXUVRJMnV3TkorTlVFd0s5?=
 =?utf-8?B?MHZvTnZvdFR3Ukt5R2c1WHgxS09uTWJvc2VBYlNpK25MTlRjSjV4ZXpXdmpl?=
 =?utf-8?B?ZHdhSGZZMGtnYmh6d2w2MzZ3N1h5MXowOXkyU3RhYzRHY2FiVmJsblFjalpI?=
 =?utf-8?B?NnpOTFhIUnZhOW56eXVmU2tJd3ZyUW5nRmg2ZjV0aStDb082TzFWRlArczdi?=
 =?utf-8?B?ZDBLVExnTithVm9tQ0pUOGFMREVjWHMrZkRQUnNqelROeGxRZWVjM3dOMkxU?=
 =?utf-8?B?MEYzZDBhNUplWlAxZlNTZW45MTBCYVRhazFySUdFc3F0aS81dTJwZ1BHTVVR?=
 =?utf-8?B?K01mL2JQeExQL2lDZWVodmhNNElFVisxK1Njek5tSGduZHN0ak54R1l4S1VI?=
 =?utf-8?B?N0ZkamtPdDl1NDM4cWxuWWs0TTdreGxSS0tHL2VmQjhneDMzeGNsVlZSc0du?=
 =?utf-8?B?TDNhR0pLaWViMGVTSDBrc0ZWWlNDSFZZcTZiK2xnUHp0K1BlSFBRN1p0Rkwy?=
 =?utf-8?B?bzU4QlFrd2Y2U2s2cUFvZ3NLMm0wSlY5RWZyT2FTZ2I1bGNlZS9Fa3pDdmo1?=
 =?utf-8?B?Rm5jS3BFV3hKV3Y1TmpHbElMdUN2V0hwU1hyYjg3WldVbGIveGp1T3h4REhF?=
 =?utf-8?B?QTBlNVRFSVI2OU5ocjZhbkVuSGNjTHFWTllNcG9WREt3akxJc01XbjJaRlN2?=
 =?utf-8?B?M3dhQzdJZEpjWktxNWVRbzl3bjNpbkhQYjdraWxiVThXZU9PZk02S0l0d3ZR?=
 =?utf-8?B?WnNTQXcybnBSUHpJNXJYb2ZzSzJTRDFTdnJZM3NHTnd4d1FqOHQwQWhqT25W?=
 =?utf-8?Q?sJXulUYzA7z5HniTMHqrZ4NT6aCHqjrNVO+AljNWImLek?=
X-MS-Exchange-AntiSpam-MessageData-1: 0ZDivH8l56LOGA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e33d264-3ac9-473a-f4c8-08de887d474e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 01:41:18.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cc4BZnWDo4ooSsMwCiZnvptIFHS9UmzAQzxuKAsazsdT9WBiDYtJ0DTRONV/vve7ZOMzS9xrlFliu2cPt4GAmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362

On Fri Mar 20, 2026 at 9:19 PM JST, Alexandre Courbot wrote:
> Convert all PMC registers to use the kernel's register macro and update
> the code accordingly.
>
> nova-core's registers have some constant properties (like a 32-bit size
> and a crate visibility), so introduce the `nv_reg` macro to shorten
> their declaration.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Modulo updating the commit message,
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

