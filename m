Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012068.outbound.protection.outlook.com [40.107.200.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AED33EC;
	Wed, 18 Mar 2026 01:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773797549; cv=fail; b=gIGzRxvXrlXWhjxuq4d2Yrb5aSbdlC4gk8WpiH/Wy1R4q+v0ixrGYh+2ugfX36pCUHBrDeZ+3kaTDNwOL8C3OXaObwpB1TMeY8mQqodxWV/jCc3DprJNI+zNF0k3+VzKsW9+QXsuQbDbfWiE4NYtynyH0KE021PI4IdGlfmWTQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773797549; c=relaxed/simple;
	bh=jHJI5YEORdG4DqscCTyr1hWKSmyEIFuaSjjvLdG3wrI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WeJMwDtmEkINhPZUF36wqe3EzicnfoCC1ZWb2LlRcIjqr9sA2yA40v5APowHCcHUX37pO4RcINFBWDf66WgjiFJv8KpaCTVivhJlYynMP9WcnbdrnR64OUDq+T6bPc2rd1VCGRSWRtWPg9uSJrjwc45aTvrj0nM5i/LxsroaGS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WZRJd0cb; arc=fail smtp.client-ip=40.107.200.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WZRJd0cb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOQ49fE0781rNA/UAvHyVLtHdBgjF0UT7YqWrvRiD7k0dIYGfFOPECEvo+a7k+c/eMSD9or78mRkfi0veTRBPR4ueNHrx0XLtlyzPt9ieSqIMg1S9RKib4LNVnLCVVN1qfaxk79yKMLQEofnSa3q8AnFG4yRkfACAY96Sa4a028EwNoaSVgP8QXIxv4Piy/Vwj3YTAv+qRvzkefmq4TQ3H2xUWPILRpm2LLdTfAGvF/EgYExmO6m7Ow/bkne6G43oB6PsskL89efOP6oXsXBAJgOkN4UsACCzJoTM7b4Bes9HZ7XX/OrGptjRC9rGeFh62kzpriFBbXO/n+riZv9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHJI5YEORdG4DqscCTyr1hWKSmyEIFuaSjjvLdG3wrI=;
 b=EzJEITOvf05FvtkvkM7UBqA9F+k7IQhQh+SC048LiLt1q3OnWkKX/FNUiusKoaHo0xEc8+VMXnVQuIHeapLI0mrC1mn8Ig1/pkO+PnI40RlTEHNirnobV7rnDVUKoow8QtFA8ztELa/xu+M1DhDTVcqHGekhI4Bb5ElFgtqNAby6zkzUC5+S2kQsEWCsWJ9JDu9sfVIi00/c4V4enUgtOJDiFA4Nn/WnIhWguNS1sUPL7t97okvClEqLPyqINnkO5NrMu8rL9y6yjGwwKVU/uhl9kC57mYLun/JE+7GyxxMoROFDVT4o0yDjXdjcEDy8z3Bg6z/xnaXzFtXWU8xMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHJI5YEORdG4DqscCTyr1hWKSmyEIFuaSjjvLdG3wrI=;
 b=WZRJd0cbcHVJajWl182XbPPjSu0zVsD/RAz/8a2rt88kijEFFgM30y7GfhdcquJM1he/y3DtMW8CEaOft8kRGRjLKqndk+yDd2no8cuzZ3WPzywXQiqa0xeaxPiMg2dIt1DY/vKO+78IqgnbtbxpzXhUGe7IH+GDZz8Jvx3RjXXvz3D7QVvvNwWSP6VXVCfqOSgPsVWhbp5s2d9/x22wsgqMPiF5a+IcVYIzUq4XuzpVbJpBJp3TlBOeRBfyF2z64CUGx7HWd/HMcZZb09QY0HGyeUYZld+EK44FVWODqTjovK7ucb8EJxMTvyuAgtuV9k1uhCCrtVdm/bpGquFKdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA0PR12MB4351.namprd12.prod.outlook.com (2603:10b6:806:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 01:32:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 01:32:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 10:32:18 +0900
Message-Id: <DH5IQZZIQAA9.39599EOWMZTO2@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Yury Norov" <ynorov@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v9 00/10] rust: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
 <DH2Y4I8G5FYD.23JGR91DJLAH5@kernel.org>
 <DH5B3YYPZPJ4.1947AVOXY3QHO@kernel.org>
In-Reply-To: <DH5B3YYPZPJ4.1947AVOXY3QHO@kernel.org>
X-ClientProxiedBy: TYCP301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA0PR12MB4351:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cdbe78f-dca4-4e59-eddb-08de848e3416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8wckZddheRi5I2H8xTdwXJ2XpQ4cfui6ZhAj7C+fTRVcVA+pJ4fPh5IVfssUts1+SUd88yLli7OCtYJadwxhahQ01Nq1sLUBzW3KSJRHpvkYVVXah4wL6HYjOeedYczXJ5W2n7Jj52Rn46q+E0sYCLp3o7q/R+sCizeAs+onE8I+ZFKv5AKpA20aNm368kIkHFFJMoqjO8pKs0Zg94OUX5dCmWRxaWKzrPfSea5zf8em/W6Pj0IMEzKE4IgJYGi4cji0CjT6yG5eqH5WHkaE+wy9EWRBSOYb8yOuaKE5CbdRQyzZSo1otuxt3Vh/3whSMcpXJYsXcF5EeAB8YNAQ7h4dtfjbge+K++09oSFPlkb4EFjA2AnQTReI4ked2BKKOXBHiD+kcWR8TxTKOmlQ2xLl2sT4g81qTADzHJu6eydxE2nX+7am2F+CKewkn11/OxEpBLND1ae8RBGH8Ywyz1hfEsB+YbKpezleHuvpS6r8dX8Yqb72Ro4M6uBKHtcB1X0qJLIQRQ6kTIMrVjRfQ4PRdroBf1clapK3z+REkpUe4nn6OuO2LRxT8U6P4+9FXPQHa9GP07AzKXRRH9WVbqdmMlKohB+ckhwJbWd08s2Jv7F3tddDAN86OMhKTHdhTNvoSrLsOSEeEjOfvUhBjRVqLiH7BWPRr84BAe7F0RxMR8yGLN56ieigj29y4pwZv7x6cwF0XbE1QaRXSkk70gooYX9df3Zt8auHefjwxSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1pwdzRLeFNUSnhNQU1PY242U0VpN2ROcmpRazVJaVRWdGk0N3piUExyRExP?=
 =?utf-8?B?SEM1QkdScGFwOXJjOGJTRGwzamRiSlhzYkljRHN2SzhhNGJ6Z0ZUSndUcEg0?=
 =?utf-8?B?ZXUxWXYreFZlb3dUT1RSYUJLY3IyUWlPd2xqNXRrbjRkczYwV1dIMzRyTnln?=
 =?utf-8?B?SmtXVlczYy9oaDVrQkhjMk1mRHJMVHppbjZLa1I4MURvQ0RVL1JVbDUzeVlB?=
 =?utf-8?B?amQ5eWp1cjBIZ1pQbXRPeFV6U0Y0S3VQakRkeWhvUHVwWVVVUDk2ZnhSWnBj?=
 =?utf-8?B?UHcxbGlONGhteHJMOUdlOTY5R29nNi9jR3JhSUYxZE9haHVwTS8vTlZHclJ4?=
 =?utf-8?B?bU9ERUlPMlR3VUY0L2tNaHlmUWJxS2dEa0tPVHpNdkdYNTUyUDlhMmxzck43?=
 =?utf-8?B?dnZRNGZxdTEvdUFTa0l0QzE3ZEdQb0sxUExpNVlwWW1NZklnYTJaMkR0bFZV?=
 =?utf-8?B?TWhGbTY1enFXRktwdjZibkZCRGV2ZGRPV0VVM0t5VkluUlMwWjJRUFNNUHVp?=
 =?utf-8?B?K1huMnFHT2ZlNGNKWUR2TXdOWHA1b1d2SmJ6MXpnVTI0SU15N0hzNHVtQXI5?=
 =?utf-8?B?eUJBc0RBQkZOWUdtNVVwc1dYbzZ5eUFzdUx3dXdHNGZFOHRQNnlPeWVMamRU?=
 =?utf-8?B?SS9ISWZlSE5wZWl0dzd3dlExYnhxUlNBaW03TG83bHRhRGRKVW9KaEM3cXcx?=
 =?utf-8?B?QjlBM282bmc5WnJzaGtSUEZ0TFBCSCtWNUtRTVR2bW5OK2ZpNlVXbmtxMlo5?=
 =?utf-8?B?WHlKc1BzbXhvY3JZemdTc2VEZ1pZZzl5VTM2WjQ2K09tajd3bTRDbnRiZTNC?=
 =?utf-8?B?U09XeW1kaTZwV2hUcGwvNGV2U1AxVWkvbGZiVUdoK3IxRTN1eWZsaHZXb2Fj?=
 =?utf-8?B?ejA4VStOYnFjWnNTSHVWMXRWNng0K3dWeHBTQ0MxMEFxV1NKVHJrVWZNUisz?=
 =?utf-8?B?WkZiWi9SUG42S3doQzJlSWV2YzQ1QXNxcU8xTGlmNnV1dXdyQWxoenFYRU54?=
 =?utf-8?B?ekY5ZEozNEpSa3dpYWVVcVlIcEpPcDIwVzVldWpLSEhtc1RXQkNRSWJJalpJ?=
 =?utf-8?B?cVVrZ25kY2lzSTVLQy85UG9WbUNSRFlJRjlENWVKeVZsT0szeEVUK1ZLeTlU?=
 =?utf-8?B?SkQzT1dJcDAzdjdrTEh4SWl6bHFwNDZtZmJyREJ4Skw4MythNkNxSGpiakJ4?=
 =?utf-8?B?TXYxWjVYREJYM2Y0N0tON0Y4MmtzUzkyZERPcjVPclhmMTQxUm1vVjZzZU5C?=
 =?utf-8?B?cjdDWE5tN1lYeXlyQlpDTGY5UVp0YjhhYzE5T3N5enRQckxxbDUrRUU4VDM0?=
 =?utf-8?B?Zk96VDBKS2lMYlBuUmNXTFliYStremZJVkxrWTliKzVpaVp5UWlKRWpsK0FH?=
 =?utf-8?B?QUxIQ2g2VzBneVRIb010YlNQUEE1K2xpcmdHUUhYYUJmRVN5VUd3cjhPK05i?=
 =?utf-8?B?TWtYZkRoR1Bta212OXVCRFQ4REw4TDF6N2ttSjZuS1l5L09EYXJCYkJuR2kw?=
 =?utf-8?B?YVVkUmlaenQ3VXNmQ3k2TElVMVJCRUVOK2lnVjk5N1RUVHlweDc1ZXpDV0ph?=
 =?utf-8?B?U2pBTnJsMGhqU0ovZlNYVVlaNUV2MlVvcHVua2ZuVGhadUdZUlRlRi9mbnZ1?=
 =?utf-8?B?UXZ6M0JHY0ZqTlRlTUR1alJSa2lFdGFHSS83NFhBT3VBSk1tTzkyelU3OTV2?=
 =?utf-8?B?Y0oxL3NYNFJCYUhsY254TXJXdjdUY1NZbTR0VjROdjI5ODJCMnY0MCsxbUFG?=
 =?utf-8?B?azlJYVpQTkdHM2hJVjZRYzV4OU83OGRhY0dXZGFwT25DUTdPci8wWThoWlRk?=
 =?utf-8?B?QVEwak94RUR1bmFpVFhOdFZuMDRRY3MvaGx2dU9CY0g2M0RZbERrNFpzUUVZ?=
 =?utf-8?B?SU5TbjN6cmlwQURwY2p4eER1OE9xYlRadithcTExbGlKVEVtRXkzcVNhY3Nu?=
 =?utf-8?B?WTJmQ0ZJU3lNTENFRDZtV3diT1ZpYTBOVVh0eWZmZUFacXp0UHJGZThsNHJr?=
 =?utf-8?B?eThkd0JlemhsMXNPaHlWU0FRQ0l6Z09yaEFUYjE0dnhLSmNadkRTN1BKclgy?=
 =?utf-8?B?eUt6ZXFwdCtyWUZqUmlTbUsyYlR2NkE1Nmh0Mk1taEtMNWVLeGZ0dStwS3JY?=
 =?utf-8?B?b0xqNk9IcjdTUWNncWNJZjhRNS82NzZ5WXhqdDlLS1lKQ1BnRnBBL2UwSE13?=
 =?utf-8?B?Qk5iMVZEM0NEN3ZUam1WcTFDUHN1ek5wUlgwYWhHZGkrRDNpWFlzL2pTRVUx?=
 =?utf-8?B?RGVNNUNXZEdCNlNtQiszd2NjV1lWR0hXR2NFYzNzSy9zUVRTQ3BnRjR0djdx?=
 =?utf-8?B?bVg3alBGSmZWNmUwbFJxcnArcUs5VUlpUHpNVG1ncVI1ZXJ5emtDUXNDUFFO?=
 =?utf-8?Q?V4o3f60NC3FyZyYCZsxVOv31lR2/rSMtq8hWAwhXVxbrs?=
X-MS-Exchange-AntiSpam-MessageData-1: o8DMxPO+ONBxqQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdbe78f-dca4-4e59-eddb-08de848e3416
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 01:32:23.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFMDZeGu4M082UlvjmNBzDq4iG8DLG3f6zT1CHSGyagblTJepUfYgUxRWcUH2OfvvV41Rg3g40ToUq9WUT325Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351

On Wed Mar 18, 2026 at 4:33 AM JST, Danilo Krummrich wrote:
> On Sun Mar 15, 2026 at 1:57 AM CET, Danilo Krummrich wrote:
>> On Sat Mar 14, 2026 at 2:06 AM CET, Alexandre Courbot wrote:
>>
>> I've now picked this up in the topic/io topic branch [1]; it will soon b=
e merged
>> into driver-core-next and drm-rust-next, thanks!
>
> Now in both driver-core-next and drm-rust-next -- great work Alex, thanks=
!

Only made possible thanks to your and Gary's input! :)
