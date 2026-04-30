Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AA725FA29;
	Thu, 30 Apr 2026 01:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777513346; cv=fail; b=lwnftf8uOVJKipjngUAZR5EjgbFW7ahCX4uuh2kIOXM1pr/9TIZjxNMeAUL+70YhJOUe5ij1C3QTFfa+fgsxULf0e3XWKzqFdUhKl3QdvSqLmynL9jIAj5gLQ5rchhrKuzuBLeay+IibUJT1cKNJ9hy+b6IAZBIxF8jboWqe1vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777513346; c=relaxed/simple;
	bh=caidOWRe4h/q2/ohgHJahnVTnfdSqSnkhE11H1VcmZY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AThuMg0VMfGHj8pQ0K6KKTL2YfDDddntC4jBzm758V5mMWH/omLENPlFZEPN3Z+wP+XQn9O5c+RbH/nGbwe7fr57GQWvE1IEiEduL+OSlPWO82kZhgJr4izUiElbn78RibhcM+R7eyWYhMbo009XE0pVDiO6PdhnChqBFkEdZmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p3dgSC3W; arc=fail smtp.client-ip=52.101.85.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p3dgSC3W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmoRXgCu0RdFvHZh8m5OIBd5ztDlWMpngWUDLJ+VXRW0o9XE1M7NTIGrFcahl+3coinAF5Qsaxv4bpkZvIJK0g2nFzdvwQsKGhgkgUZ2ydyiMCHBGOzO38W1MWOjc1N0inCRp9ZWHOjHK8ARnanNDQgF41h5i8tFQn1cHu7eOgh7yCJ4YAOQ7RpYZT0eOiYow92zgsAik3ZvKqCLy4jRgwwLUYk3Q05mSn+YOYErxEmT8Rh7JLnGSLWaRIwaYwxW5hmCjQ9aRsqof3TjybiFIHUO3GMmFgPxB/XKt8LO3PfmnDunH9b3aEpoSlUT0LGV3zi+izUmRxQj36Xvb99+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOe8YOII+xrYfSeNz49Kj3U4SlEOTrCqHzwugyfz+o8=;
 b=l667NgYBj8+Rue77PA6xQZr2zsReihsXy2rfGw1g1b8P2JcTnwsmA8C3kQsSUW14Z+XY1Sy0I9bLDd13WAC8guCnPSNBwG60Nm7r+Jo/av7CS9RQIh91eRL3UhfpGT+0i+kQH38hPpvsKmoM6HS0qk7lFKh0ylt7jvbAza5wGfR3rLZxBg5PFqKSOYhW0TWrmxBoFBVHtnYcbjaJcA1m8iDROWcpBJGFiA+3jAKdlQ5ttm2oemeT8HSFV9OgXNOGrlHisgCN/12KYNUKORhm9SNjFj0AFOeD8PCTUWVAQBEd+T8tzIBhaitr+YnVqLlQgjeGNQk8RdzYt6vLa93j3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOe8YOII+xrYfSeNz49Kj3U4SlEOTrCqHzwugyfz+o8=;
 b=p3dgSC3Wadtnm6Ckh0Fs+krvA/ppTXgnIMHT/aZmhcp9P/ntC3j9XcErv+5RgsrQVMx553p8VQNxJyXiDczTS3QxK62uNX+HlEWKbAsILabaQTZ6mHGJdiWOSphO8JRQD1Ohsl9uZjK9kLxy3Z92SY+tU6ZgyrcXBdjALN2IglmmHSXCMl5o01+7qDPuLOaLj/hzcGDofTrNKaUvMW3EEGqdu9m47Xsox0GgLgXhez1JvhVgV3NouohWRdMJ3sNEkcRh2GHhuJDLgpY1JOV2sLlJz4+y/WNzAZfMlnq9w3qbyu2ExTNJo29xLG94zJ2yk//X8S25FrMaK/fGSVQ13g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 01:42:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 01:42:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 10:42:15 +0900
Message-Id: <DI63W1CWJ919.83AR9YQOE2CM@nvidia.com>
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
Subject: Re: [PATCH v10 00/28] gpu: nova-core: firmware: Hopper/Blackwell
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:378::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d095f2c-bc13-4198-1e18-08dea659b7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x0yf8HPRwHv+GP58wl4NilyDrVEWXlCcNIRbZcNdNrY7+1IWMwyclowpaP9iSdcOqpFSPKLQGL81hWHYqIwN8EOqoiFcRwAYp3r8uynZqBvLp0n5QBHknTspZj48Jjbm+AMa66qmlDreqV06+GQpmwx3mYnpkuMb2sUvrbP/Z2wzD5OJtkC1lrSg3C+beUZZ2pB9mYNl95D10Kr4OK4FwquNYWiVeYVsnx4H0TrnL6Gg/smLXuf5U4C5v9ih082aGBxdYO7Bn08+38FjXNEFl07OctoF+IynxOD+imBJaZrhtZMFG5zwC87rsrsYhwtYlSCvY08nC3LZveQ75zLQ8N8lUBeL5/ugGJWab+y3ijUyf4fOY4eW3YxvyjZnoYfBHB+PJARVikLFabxop8jpneTH9+7bULrqq/DZcaQPk/aqQMF0mLFpYnY6u/6dxdKpC6jMWnCNaMAhlkC9usth3hhWZLG8vpLZ3IxNoE05neyJF4jvZ3kdPhs2VQ+IjZ2jvGigxwRLASqsrd9PIqgVI7kt4FIsGg94/ESoknwHAa1DL0qh8YhLMLRgyeSBKUrdIbsOkiMYC5Ga3xnI4lHDg2T49zTZE0khJcJLH6zdVhacr3KQ41iWQnL2gM8akwIJeR3OAdc0Bkce0AGTHdukZclvYuGpbpnNdA4PaPulQE8VTlmLLDA9ebPUG4YjYu5Yj0FCM8Vb9mT0m1qdEBUeZncESaPKuEAQ6sWBfgaAUwg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3lzeVI1Zks4cnNVcUpHY1VYb1gwQUovd2JRK2lJMEVhTWxwTHFBV0NERU5q?=
 =?utf-8?B?RHFQV2w1dEk3eDI1bXJ4NmplVUFQdFJZOCt4NTBYSUxTdXNUZm5iSnU0WitL?=
 =?utf-8?B?R3NYb2orMCsvSmg0R09SOEdCU0kxQ2dtbENjOXBmSk9UZkFkWkgwUENBdDNh?=
 =?utf-8?B?L1hDRHlOZXBWOWxwMDc2VzVEU0s3ZFNGSzJRMWlxMDI5ZnVRNzZFQWhybC9t?=
 =?utf-8?B?RzhzNXBvLzVjc2RaY2daNUpxbk0yRVJqWFNIRUhsSnVNZ2FRSlVzODhPZGpy?=
 =?utf-8?B?c1pHczM4K1VFU0l3M2dFTEtNdUtsT1JhbDhuVjRlcGJsdjExZEhxY1p2NEM5?=
 =?utf-8?B?bGxBcVE1RnhydGJRUUxFSFllZDNUOWszR21MejdwbGd1T1NUK3g4TVdPMnRH?=
 =?utf-8?B?b2tUS1BIYkR2V3BIQ2twYXMyeVI4ejV6dEdnWmtTcEZEbG5pZnVEVkJFeFlZ?=
 =?utf-8?B?MUNEekNhY3djdG5lWVpma0JOKzBLMUcvWnQ4dDlmaTVhTXljbzBKVnR6UGNh?=
 =?utf-8?B?OWNlWElMNWx0c0h4ZzIveXZKc3dlQmYwa3pjRklqRlN0QWtobDFMTm8vN0tF?=
 =?utf-8?B?aitPMjVGOGk5bUFKb2JrcUdVZ0lRQ2RPRm52L1FSNXFub1VtZWZlbDQ3bEdz?=
 =?utf-8?B?dFNnaUk0RlZZWmlTVFp0RXhTYTcxOHl3VEtvVHZPMzJDVnk3UEdFdkk2VWZ2?=
 =?utf-8?B?ekN1RWk1UERGRlRGZkRQQndpWm95T0tUVGFyL0RPTlVFTFppTmtNNkYwZjBv?=
 =?utf-8?B?UlBVajQyYTZUNUNTYjNia2hDSmNOcm9STk5aSFV2SjBHSFhDSHZvbXdNUERv?=
 =?utf-8?B?VncvY0J4Ui9BbVVnRWFOZTcyNlhwWDI1UUVMNWE1Sm9TK3VSOVMyRGNQUlIv?=
 =?utf-8?B?S3QrZ2ptdnp5bkJlbTZNZjRldi9LZFFPbXUwajZyZFh4bHdmWFFKcnhkUkdV?=
 =?utf-8?B?aVAwMlYvL1NFVldSYUZkeVFYWjJ2YXZuV2lxV01Nb05sRkxxNURMOGpDVmZG?=
 =?utf-8?B?azJoZG5vV0RTUHNGeDdWRW1uR2pzakpHQTU4V3paeGZoL3dwd2x3NnpiVXAz?=
 =?utf-8?B?OVFXazVySm84VnFQbmlsVk9CcU9OSFBuK2Y0RkV4QlN1VjhqeUpsNmoxWGVH?=
 =?utf-8?B?dmFZVGlWN2ZHL1k4QkpIT0VvclIrZGdscUNidjQxMjUwTUtlUTNnWWcvRC9F?=
 =?utf-8?B?QUxpSE1pRTJTdFhpRmZ6TnVRMGtFdGcrRHR3K1I4dWZJakZ3N2hSWmdvNkQ1?=
 =?utf-8?B?ejZ6a0RHeTEwRkFubGIzcVN4TWI0OHo5WGxMUHp0aUYvSjkxM1YxK1R2ZGNa?=
 =?utf-8?B?NmVneXE5a2NvaFRIbkVpNndRdTluV0Qwb2ZhSXhMRkNwUTVRL0RPL00xUThL?=
 =?utf-8?B?UldjNW9MZTNsekQ1YU9SaTVqdnJnemN1RjhvMmgrc0xROTY0Y1c2djduNmNu?=
 =?utf-8?B?ZlBabHREQjNiNE9uUWVwZGVrTHdzZlhhOUc5T3c2S1V4cmhKVzB3S0lORXlm?=
 =?utf-8?B?bGdwdDV0RjlYOWhFOWEwQmd2VlV1K3ZxYll6cXdhY1ZSejQyUU9UM2xxQTZx?=
 =?utf-8?B?aE9LalIzaHZQSDR5dEFkZEdaZGkrUU5rY3NYUkRXVGNQOURJRVJFMXhoRSth?=
 =?utf-8?B?NE4vaHlWby9xSVArb0ttZVNPZHgvTURVZ3R2b3ZFZ2xnWHYrRGhKVVVGRU83?=
 =?utf-8?B?elhCdVdpWWxuQnNWMmFxUUs4SHBmYmdpMXVBUGJ1ZURuN0M0ZHFZd01hV2sw?=
 =?utf-8?B?bHZRQzREVjdUU0pZL3VXT3pkRzZCeE1iZ3lYaXk2bzNiZ1BaODlLQTlHK0Nv?=
 =?utf-8?B?alAxckozMkpiMjJ2a0RnZ2FlY3FHWWZMSkorZ0RjT0lGSjBpdGZwMkFVTG42?=
 =?utf-8?B?S1ZmMjF3M2pjVDdTdisvVTUxUlVVaVV6ZDhta2FYRVQxODB3N0hCQlhuNHJo?=
 =?utf-8?B?a1RLSXpZUHZnL0JCTnBSUEUrOTJ3OU9WcGgxOUpPVnY3djB2MUdFWFpNelJO?=
 =?utf-8?B?OVRxWVlSVjFuSkQ2cUxETTVtNFNWNGtMbTMxa3pSUHhuUHFJcVhDS0JQMGl6?=
 =?utf-8?B?aUFzWUJvRmVCZXRweXB6cURxTExVaEIweTRoQmowZHBXMEtKNFQxbFpQRnVZ?=
 =?utf-8?B?bytCd2NCdkxlLzNUTkhtTE8zalF4TTNialB2Wnp1MkxqOXhhaEFWL2NiMFVq?=
 =?utf-8?B?K0ttZ1d5S0JrejdNTEFoQ3pWQVNUc1QybGk4dEg5a2lPVjYzbFYydVZNS2pr?=
 =?utf-8?B?NFdyRHZnS29IQTRTTVl2TEpDcUFqbkFRUmtuZ1AybFNhbHNQaVU0WXo4MFJM?=
 =?utf-8?B?ZHlpZmhpc1RULzVIeG44QVpkbTRncnVXNVdqUmJCbmJER292Z2d0Y1BjWkVL?=
 =?utf-8?Q?euiAmXtkHkuiMHuCyJ5cyeiH5GvRQ7xbeDtFzoyLxpmgR?=
X-MS-Exchange-AntiSpam-MessageData-1: bETr0IHv1eZW8A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d095f2c-bc13-4198-1e18-08dea659b7b2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 01:42:20.2745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpO1zMtSP2ctbD9/DINLHjr8cnGGEZWhqoI6PUEyd60eDrN9+y5VZQ2bErLfdQLaf4Ibnnlfj4cUd+OayMAFhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
>   gpu: nova-core: factor .fwsignature* selection into a new
>     find_gsp_sigs_section()
>   gpu: nova-core: use GPU Architecture to simplify HAL selections
>   gpu: nova-core: Hopper/Blackwell: basic GPU identification
>   gpu: nova-core: add Copy/Clone to Spec and Revision
>   gpu: nova-core: move GFW boot wait into a GPU HAL
>   gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting

do not conflict with the Device HRT series [1],  thus I have pushed them
into `drm-rust-next`, thanks!

[1] https://lore.kernel.org/all/20260427221155.2144848-1-dakr@kernel.org/
