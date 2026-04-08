Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD62D0C97;
	Wed,  8 Apr 2026 01:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775613238; cv=fail; b=VT8ED8VjJn+SBhusXb2le6FpsZm+TzV4XPpWxrg8LxZkwP+j4vTwrDxJzVGsAcXXtSK6uDzxr8SNxQf9aqmE+p9YtiQDnm6F9LDz7Gm38LFjXj0+Rkva4PBmOpAnCT5t40N0kQbiyuBNhpi38DSv5DPZ1J39FkfYNd993G2Aylg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775613238; c=relaxed/simple;
	bh=MVgVCI2CTlvF0Io+nZ6ftpNFsa7YeTWkg/SjSgD93W8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=B2hqCjT48J07BJDbX+uXYST98QSP/uJcoRFs7uMilVXbD/fMTfcMSsGJxEKO+9Vr09aPlaJJgcjg57djc99mI3fqZq9v0hhuwADpjlvR5n9WWpbcI2eg2HYzxA/8DLj4UO+KRXBlTD1cs++FtR2KHh03xr2mhGJiNi/WPCljEhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=po1zJQbw; arc=fail smtp.client-ip=40.107.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="po1zJQbw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF0HX88PlbQKi1929QLDl49ygexuzyTsOOi6MiTJrdv719g81E3bQB+O9Q6onoIW/L/pTD4RiFkd119Cg3Y3mIqmPFoVlSwLrqTALxXl/AcclutslNC0hgNrPFFbBdrT39wkQwJ8OqvZx8lsnPA8gwvJ9CxaKvbWmE/Wl+UfFPTXCZw5joyYneoDk4M59yNRMOumrg68Atvj5JjEYv/ZtRjEsKhQr33AXr9h9SfBKV8k1oRglOFVypX9pblomjxZKmGm/X4SRW9cgFOdugGzBf92dX4h7eiSdGXTUZxDKOgAxJNqVSIugKfxgYCWBa6c2LJh7+vDDIWj5I8eriAzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVgVCI2CTlvF0Io+nZ6ftpNFsa7YeTWkg/SjSgD93W8=;
 b=r76bmi7HnY/uwTBZY7Nan9flnzxaKk2fH4jJ5VILeOvKAnxx1OX4lLQ+y7C8jwp1RyfKJoa17btwVqvrtAgBFAI31IRvNYPQWBdvhvtbjwu7wjUh07M78QkyszeT+ibvIn2KAMYOqUH4eE4+COz7wyVxat6pgl2WoLMMbWdLxMtua0Px/LBr91ueWWbEp2nt4hj+0d6n77ol51GGlUsVnpyFAjDPIWBU4Yyt5QQ1QSoL/6vS+IurrLcJ4NvycNoCvq89gofJnQZLGj6SI1z3+GPJuwjEfqq0zVYF3s6ByqtmUuhtHBUZmxw7ec1G4pE+Z2GzGxo6n4Dj3KzI9c+yUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVgVCI2CTlvF0Io+nZ6ftpNFsa7YeTWkg/SjSgD93W8=;
 b=po1zJQbwIrMxtTx8eRhFCEuj6/OeP+hLImlCrSC6zT7Au4rGD6uC4IgKZtB7gnAtKzhUiIOSoBMrEOmcGuXwB6iaNTMmIN3MCZ5vb2/UWZc3CeQleKwF/wioVVUVnKMRy3xLJPkDuzXe91ZF4KmAcnSJJo+TGrl2mvqR7Oz0/dArPOTXgpaDBgcaKJ3b6CWoinCDL5YYYJwcaYKgdFmy0BuLU13671KrEYVZMpcQQ8BZ2KvK1Stfjmk1FO6oIdF3NxVS5pF+nweVT+/MQrRd5gya4MlhtENX10dfT+5DzAl1zFfmjjTXXaDooTeReUpWr6obAXc/jBw7Oe5CooGCow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 01:53:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 01:53:53 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 10:53:49 +0900
Message-Id: <DHNECWUPID7S.3C46WAVH8ESA3@nvidia.com>
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
Subject: Re: [PATCH v9 26/31] gpu: nova-core: make WPR heap sizing fallible
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-27-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-27-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:405:379::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: eec34fe4-dfe9-44e9-5c1a-08de9511afd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UILqLnzimX1wELMFlzPoQxFxXCl60sD0KKYv/eRJZhQnd27K0TPdeAK961PWfmKx4iMcKi57Bfd5ioncqvTTQ7yP6Z8qbF0F2d4HvDUT6lTvbOkNk46GMuGlX2kLjcsiZS/yaxIieq2xjejI6XSlfQClmyUevsTUyiYhRmAyqEtyKGw7sWhwydMkKhYJFI9go2bJgg2fgUR2X6+nFsqBmTNPX5B2d3FksDnTTdIIHemT+FhPklIGMZ9doRfLqx7Vk49gYZil/ztcNi590VtoAjqJoNvrkTXC9Gy2jARrgoH35HD3Jod1rykhLwq0KNEeHLuKl9sPlQa1BQuyAY0qkIwD3avrCTI2js9XWOgYacY/rA6fagtPQDAb7iN8KAtIfvmW413WMgzGb8O0xUUDw1qKOq9HRmaGLD/jYut+vf5fEnqyl0SAbS1qEgGcOdBzuj3asQHHmDvaG/vmvEzAqHBXh9v365tATwaseIbuNfnWslpTINnLfAqSVl9q/PiaVFTw8ySfbwoL8LhLZcHDyDGTUfGgdF8+LdAgiw7qEpj3dfnQ5yGznqJBGleo375WR0t6FV/OeXc/IuMlQt7KWsDqLPlgE1G96BFGxlxPlrxPj9+IgCWzZv6fwPBfAKayICBaqgKzSVj6NYyeO8hwRm1+SCacpJQkslF0vr2GuCzKSzBVIjd6cv9pOoMWTcsD2Hy/cC+BAYIj5uI0JwZUZbrJvt9gGDiIZT4PGsZroLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlNLbkR1Q2F3dFJYUkhMRW1Pd1JSZW9PbFhrc1dMaGVWT1ZYOXNpVGUxUGZx?=
 =?utf-8?B?RHNpakltcVMvTlNQVEJjREJrQmZDdHNuTjJhdFpoNmJLalNXcmlkSThleTF4?=
 =?utf-8?B?ZTkvb3dEaVVMU04xd2lkRGswZHdLMStxNXJIMlIzdytaUHkwWFRRWER5Rndx?=
 =?utf-8?B?OXBQbll3ZUg2bzNpQzYxc2xIN1M2V29aTmI4ck5FUkViM1paUTlYY2dCaHlp?=
 =?utf-8?B?T3czSCt2RkVtZ01WMktGR0dNNjlrMkpmclpoa0FQbzBIcS9NM2FoV0xUSHVh?=
 =?utf-8?B?emhDTnhXNnNiaGlMWVJFRGVvQWxMbDU3Zjh1TGZQRzNxZU5wT1VVNmlDVllF?=
 =?utf-8?B?L1BIMWVHKzV6MFhqNDRHeFRtRllkdHlERzlZVFBSejhkNWtuT0xLaStLVGQw?=
 =?utf-8?B?bUx2NzBtZ01iM0xwQmxmY1QrR3ZZOGVRcTRnVzMxdEtHU29jRVZZOWZuREE0?=
 =?utf-8?B?QXpNeWwySlB3T3VEZWJJSSs4bmNoMFNOd1BnaXY4UkJGZTNrOE5qb0hZTm55?=
 =?utf-8?B?ay9OTmdOWk5IcmRJcGpKREtVcnVmZkRzcG5SaGYybUhWNFRQSGtrSWV1MThW?=
 =?utf-8?B?ZTZjU1Fhd0VMTEUxZTZhTTRmbytvcUZvVVNqTE0ybS9iRmhJRXQ1VEJaSnYv?=
 =?utf-8?B?bWxqdlBub2ZVeVZHaDF5R2NBNlpsNzhnRDZZVFQzeThlYldTZE1jNEt1eXlB?=
 =?utf-8?B?UVRkMFhNbUQyeEFGcmhvbFVMSENpY2VaVURzc2FlWGpScExuVUxoNTFCMmdl?=
 =?utf-8?B?N2swZWJaYkVmaXI3Y0t4b2hRR3ZGRzBqWkRlbmEya2xrQVphditndnZ2T0Rx?=
 =?utf-8?B?MTh4cVBPdE0rUnZCdHdjWjdJN2pwalVDbEtDWGxNODZJQk5xcjBqTXdlY0Rw?=
 =?utf-8?B?NmNJUTJoU2ZFRlNNVzFhelZuU0Z0L0FrS1NCUFdjaC9pU1BmQU5yK2U1aFpQ?=
 =?utf-8?B?TzJudm9ob2tqQXlhcW1vS05KbjZQazVBQUtXRHcvSlorVlAvWERBYWpGdmRs?=
 =?utf-8?B?V3llbjdaMklrWDZPbEdaSjdkWWRWY21yRXphLzU5clgwNWIvMDRGemlaZzBo?=
 =?utf-8?B?WjFKb0dBNjNZWm8xR3pISEVWdHlpeHhqdGxqUFAzUGJIUFVBWU5HV2FRZ09q?=
 =?utf-8?B?VUlNZTBHWFJtNXNRYm9iNkZ5c2kvTmNkYU8xenN0bk9RSk9nRzZrME9CczJM?=
 =?utf-8?B?YTFRZkhQenFKM1hMU1FZaXRZck9LVzdkdkk1SDZud1h5MHVuRWR5QVY0SmJk?=
 =?utf-8?B?bm9zZ1QzSkllMXRJVlA1VEsxNUJGRm9yVU1YUkQ0M2V4c1J0eWlIQWJqU3V3?=
 =?utf-8?B?dmdtckpDSkFNdjBWT3R1ZmJvU2lYY0s0VU9aNlJHUlFYS2dRdjF5V0U4WUlz?=
 =?utf-8?B?YU9KSk0ycVAybU9QNVhVOXpTOXIrR0VLL2hHZnJ3cytCWW5JdlM1M3NYRWd0?=
 =?utf-8?B?eTRuYlpCQkJaRldJRGdKOUtNUUt3WTV6dnAvcmN3OW81cWlXdkJXcFNXSDJU?=
 =?utf-8?B?UzV4MlFuejNCZTJhYktsdk5lTzMrZ1ZlczJsTjVtZGFsN3lZWC8vL1E5TVpJ?=
 =?utf-8?B?SHJuMm8zcHpMZUxXSGhhUzNLTGVsSGJDYjljNUw0MzFFWW5SZER5dk1OcWcx?=
 =?utf-8?B?WDR0VnU1SUx1SFh3TGltMndjZUdDN2p4UTh5SGNEUmc1VTAvM1J4cWNsd2o2?=
 =?utf-8?B?RVFxMHN0b0xxL0tvdEtzeVZCYVBQSFVWMU1yMDNRQ0dRMHJQVU5EcEJDbjUw?=
 =?utf-8?B?UDJoTFFjaFlmYm5QUlVBY0FkMk95RjZZVzkxc3AwOEpnaUVaOVNYblhKSFFQ?=
 =?utf-8?B?SkhuZStreGNQSlUrMCtQNHdpSmJmK0JibnR0MllZNVZNVUJ3UFU4TTZDVHZX?=
 =?utf-8?B?S2pia3pFUkdZZkwwMTVXZjBTVW5SYmhEd0V5V0NYc1gvZlFZODRyV0lON1Jt?=
 =?utf-8?B?c05uYmkwV3dBTmxNYWlacXpPejAvbXo0aXdYdVM3ZURYNlltamNwSm5GaG1p?=
 =?utf-8?B?V1M2RVYzZXJMT1JsT2ozczFtWmhJV1ZvNUtoNXBUa3ZRMy9uMkR6RG55aHRv?=
 =?utf-8?B?YVY3RllDYW15ek9GeEg0bnB2MnB5U01JQkgwU29taXhuYUtKb3U3eFBxZ3BP?=
 =?utf-8?B?cCtGMFNycHpDaGJzeDdWWkVxbmhZWGNxUm9NU1dFQ3pHNC8wY0ZXQ3QvajY2?=
 =?utf-8?B?SkdUNDRxc3d5VlAvYjBTNnBCRko3TUFiVGhBT1RvZXlMaUFtRDhZNWtnOU5i?=
 =?utf-8?B?ZkNZOG8wSzYyUlZIY1dnZmwxbm5tQlQ5MFZFa3FGK0xpbk9Jd1ZIMjU3dXE4?=
 =?utf-8?B?YWZZc2ZoZGpqV285UEYzYjFOeWx4OEJhazYrYUxBcXFVejZ3M0kwR0ExVjNL?=
 =?utf-8?Q?0DMbboaY6EXSddWoitXrKvpC+564qADrF+vaG0cnuqIzz?=
X-MS-Exchange-AntiSpam-MessageData-1: qvqSCsTCl4a2yA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec34fe4-dfe9-44e9-5c1a-08de9511afd6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 01:53:53.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeYart0NFgm4AYYUiAcBoIA9P1AGxioBvdyWbDTJy4bv09AgOR8UllCHdD6e2lLiECbv91gUlWrzebQZYPw/IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
> Make management_overhead() fail on multiplication or alignment
> overflow instead of silently saturating. Propagate that failure through
> wpr_heap_size() and the framebuffer layout code that consumes it.
>
> This is not Blackwell-specific, so keep it separate from the larger WPR2
> heap change that follows.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

This looks completely independent from the series. Staging it for
merging when drm-rust-next reopens as this is clearly correct.
