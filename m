Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803951A9F96;
	Tue, 10 Mar 2026 02:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109913; cv=fail; b=qBt595/+uZGOm7/mGwuCQCl/b5cpkuXer4feGX/97aAYN8nnakVJwJqZZMeuZBab31gO2o0xDWMZRu/8tVUAoJo744AW4tZFL8IVmg1VpvU66TnI1+Yq01m1xf3bkBf0OSy5A8j6tyTkc2soKdjT4Z7uhbpH2Ji6IAtL2PLfQVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109913; c=relaxed/simple;
	bh=uCagsGeoOXLLibuTs04DcphZUSK3OQ0d34KQJs2ub3c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UMo1hd/rPwVI5tYBytcJEUbxN65Va9bFf4JRRF364oRaM1U0/khw/xoxSyPapNdq3rJ9pgpLspsscAYoOEc3gIEIyrK6EyuDZd6cjoL89FWzoh3qTWwhpAPH8PR+FyEFurSsSwjhgFwtRRL3d7oeBkGD77KcSQJjFtciQr1f3kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cnoye8HP; arc=fail smtp.client-ip=40.93.195.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cnoye8HP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mK96lV/bLkRQCS908NnDM4jv8DgpWUZEkTJUVnfvlKeJrGuuEDLO+oMbP92i4ZU+ni/Bul+feo/mLoE897wSqzVg2ggWxw9HgvgbYxXOXXFm6GYgO0bCcYEld1BnEOxpi3Irbs52UZu8mKOXXARjegQJS0DokDGKq25Pv+1GaxMSGVMBHxJvvr//pr3GmSCP6TMJQ+iSD8RGq0j6q1eSgDNLJlx4IEaq4WoQbkUp93rFIkFnEG2M6d80bBtJ177yrl79PH++JQCLrwnkyZd4NGDKzvyYuBRnKFnKz2M+m0MK26FSSrawbClDi4kDWcdaCGC3s2kPu3WCMUU/YJcpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTZ3rCrUGka6Nbf7+J96MODSlDGxkaeFtgoJXgG7qCU=;
 b=L9dWcj0GM4kR5dtK3TeYDkkIOaQBJg0ksMI/L5k3K32BtASPeZZJGtPrCjv6pT98mlhACy+XrA9yprVwE2LcqAkSo/EUyla3kiK/ajnMmAQ0NIu3pB8ov4ul+MHJsRd9v+/x0D1oLmPxi0usG4E4A/N2ghW8DwHSOKeD6ccoYEZrVwFB9Hb915Xn3Oqsq+Ugzy1D0HUCG1vS06Hu51J0bJzWdLuWQhRWUlfCCo4OCeuhkVLhrZ+wS7EDM3HvpOE627FtBPSv6pxmZUCPJeK32g4qzxxq6pMRDSdEO7p6YiQr4tFh1MbNV4pdJkmiq2A5JuVxrq/W2uZ3rNxEHJM0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTZ3rCrUGka6Nbf7+J96MODSlDGxkaeFtgoJXgG7qCU=;
 b=Cnoye8HP6giuJgqQzBWYVriuhrawtoCU/7VYqJVNZo5ejVg8pM3+ebUt/fPzYXmEtk0ogI+jcxAkZmCUy4JpINHIGqEdPrcR57knIfjkxoff1uwzxM+n83w0FE08tNqNx3K1kgIjd57aPOBYo/toHsdbZkxv2VFTFY62RFpTF36G5lCBaDT5rV/PCwTkBGjrkPsX7VPxsQUzA7otRfgI27HBlbSahNW6tMXScbgu2yhmBm8iaH15Qra4ehaZuXILYfjfraIHdTs/5+bA0L9ME3QObreUiOZfrBzeXFvOaRH7ayAhucs9Oa3gbel05YFwGGh7eYv4Df3acXJbyDVoAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:31:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:31:47 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 0/2] rust, nova-core: use u64 variants of SZ_* constants
Date: Mon,  9 Mar 2026 19:31:43 -0700
Message-ID: <20260310023145.120037-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0056.namprd07.prod.outlook.com
 (2603:10b6:a03:60::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 822d2362-561f-4cb6-d54e-08de7e4d2d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	uJY+usZsi2lWX0biqBqpafCiImFjGtZo/c7JBYDK82JOD9IHBeyF2mvzIxD9lZCYSK0dY+RoWjYNZjE9CTiwtrsXew9BfoIvGA3VFhGEbq/o01E6bGPVEqUrc+Me3+aCez7eQhOcU5gsXm5sqqx11CteR2IJ1lbF1EUzMrE1vLAB1UWN6lTMxYxrqXqtIFEaT7mTvoWCrYTFOrNkx+sbUd/E/HsKDd+y2vauQTTRkcc3ad5RD4EwOBZHhchZSl0R98EE8TX5gA0GQisWr4LrxNUkduzqCnot9SW1ECs1ArpI2toDFbtlSXNz5K8SHmmxgoqFiSKlBBldSTAG5kj7sF++/DeunGWx1PnAm+dG+asvIwUuyIEUOhqZny2uS4gdkpMGfSTfKx/h0O9BmK7QybOEoAultdYdvCJ+VSc61FrEwo5LRP0xAdcx0BAL5UMLtKFi/t8B+aRTr9skzdG4EthWLmQd8bqIq2oFindEjqgEtrv0zeXRD1txK41v/LWxyCTCTDqRMcaBwlDuMTWqgGdG9j2CpSxJ0gWMYhl6sq+uG+SdYh7iRK0v/jKU6DSW6yKTk73NXAyBIhGh2T9AA45HKQmzqR38qg5avBn8mIR9JPAABL4DcfKIxfp1HqsVXMFleEyqGnbyZa0/nn7EVG4jPQpANsOONHcC9GxOdfXTzpHKqrpWftmrVaeAP2FeVNd6V9b6Dd743cdYMZDV0d1+bJ/sDMqdVXuSsiJiIjOBIxgiHE2GnfUdlU60njLL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sDr3IVM1aSCAxTrZF356kY7RUuRzl2OaRN86HihX/NVZ1yBmNVOlKoOlQjJo?=
 =?us-ascii?Q?ypBtsynbJfI2arBEY8IL4qiLxnyqvbm54/QurqCDh3eLDsx7IzdFGFVfRHPL?=
 =?us-ascii?Q?u8EmSQARQNIz6nGalrD/Q9Ovwh6Bnr0X+yqo5BDWledc/5xrfaZ81f8QdYXM?=
 =?us-ascii?Q?IIenSbdcoMy/iaZC9lDzqES+qPs3c/gAMfVUsm2o1jtFakPIjwwxc3mH3nIp?=
 =?us-ascii?Q?O2FmMH/iVeHvXwMGtvt/aZmWjY0uB7YGvW8+myhLjy2oYszeIgTqNUJRPq7V?=
 =?us-ascii?Q?lmbNzpfERVqevDCNeIH+nxfjEBeP9ez7NP4lwJ9HqbIvsJRZ3iF9mNgyeERK?=
 =?us-ascii?Q?qjM5V200YAA2r9zO3vVk06hlfaRjNGLDxChyxncxzBNiHi10QxaZD8ezS8YP?=
 =?us-ascii?Q?lg4jFzUMxNtAQfglRPuQXK5a7gA3+CFQzw1sb+khHC67fgfVDoxEPLTJavwD?=
 =?us-ascii?Q?Ld7jhyNj9bDxH3z3IMRKpnVaRqPbqMnidn8w7uaOF4IALB2GW3yiwXR6vxdR?=
 =?us-ascii?Q?WGzCSMC0xeqpD9s1t9HEIrdTDDbSGtJIHEPMD2ooSvOt00U2SX57Fjwrz3TL?=
 =?us-ascii?Q?4g9oOkuYAbdvvRrBdjl3HE9R0iKS/s/Npi75E09yHvmBnw1sJOE8IeQxX35U?=
 =?us-ascii?Q?FcwSkx/Vw6C2UcOeavmYjoDCvbXso0WaffJd4VXao+GQQtg8IFn1EdA2BoDH?=
 =?us-ascii?Q?1ysEMGrgzolwBZfrMQUhTdYchFa0fBHBNhg9ywaSxy+VaL+Ydj4et6kA5k09?=
 =?us-ascii?Q?mDbisfMXl5rDkMzpDvsAUjzh/l6uundml0CPSYp0KDH0KEyLe4nJGFtvHR3C?=
 =?us-ascii?Q?A+8FWwnMRYRziKC7UkQi6/hRLKLSVg9MhiX1IyfPeHshrfM7i3/I/dUJow0E?=
 =?us-ascii?Q?zWXccmfAlGVu/YZStartFyfqVV5sKX8mZ9+E9ZA9pWLFycxlPPGBz1IXWraG?=
 =?us-ascii?Q?AOX0JzSqSW70EXEuJcn0ZVhizwp4cbXQZrEBrTVRicQjHY4npx7wemsuN3Iy?=
 =?us-ascii?Q?CC+pHGcZAXqJs4n6As3URCp+kg+C2fhj/xYOUSEiz3Mk3+177ipfBGQbDbbl?=
 =?us-ascii?Q?Dp4sy34tf5PxEd0/hRllRgw3YjvcBttEZMbNTR9WNHDR8TrOaIjDMPAndP4u?=
 =?us-ascii?Q?bXT9LAddBit7lj+44DAMtVVIr6a7HVBmFyBvFrid+5fT7fwZjQVHM7E3hXgh?=
 =?us-ascii?Q?nnIZV1HpY7ixPPG8l1+StoJNEDJYInY8UZY3sHGBBiuNxtB7dmAo3vQg6Flw?=
 =?us-ascii?Q?tgOqQNtbNLJgzlIUD8W1Z87OVwbB/VU9/C1YMkvnz2sixVKtwABUkeZH45H5?=
 =?us-ascii?Q?v5EbkfDBuqQeINy81hTeI9Hoxw8GRUvAHjKP4RbZ/JCenlJs4SlO3+ZJNOdc?=
 =?us-ascii?Q?qJZOV/w20xo3hxWaXmuYlgnddu56b16cKH5EshDQXgSPJupX5FfQJifPKsuR?=
 =?us-ascii?Q?xtWB8s008uLFo6FD6GkL4xsKasD5viKgd6lDuHqkbCK4y/J0s5jICHO9Vgo4?=
 =?us-ascii?Q?UVQp8ZsqVVwAemk3RlyHakMWWQko5wdJzBtbzczDUJwrAYx/JmzmVI0AkxVl?=
 =?us-ascii?Q?NoN0ot816VWhQegPx3GEntKX40SqZqYfdonDSuj6PL6fs4SpaUb/0yfFA1aY?=
 =?us-ascii?Q?U9Kiq/dDt/ytAkPRdy+5/Wtsep8wJkXcCDpL+j16/f5vmELLHfg+MEvHlyaw?=
 =?us-ascii?Q?lmQvzMGj1R7IuPt66AGB561qovoRNyiZuUDN8/OipcHnz/OZm+Cmpj5/chyb?=
 =?us-ascii?Q?hoC5bcotXQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822d2362-561f-4cb6-d54e-08de7e4d2d65
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:31:47.3862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzdVQaIU1NxzUumBIgVlpkk9SqpXqB4c+QkPShpQMob83UnB7+0IRK+2A2elP4/6cWgWFG6gUbUkZ10WPgJj3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142

Hi,

This is based on the recently posted Blackwell/Hopper v6 series[1].

Although it doesn't really depend on that series, it's better to apply
it on top, in order to catch all of the cases, some of which were added
by that series.

[1] https://github.com/johnhubbard/linux/tree/nova-core-blackwell-v6


John Hubbard (2):
  rust: sizes: add u64 variants of SZ_* constants
  gpu: nova-core: use SZ_*_U64 constants from kernel::sizes

 drivers/gpu/nova-core/fb.rs     | 19 ++++++------
 drivers/gpu/nova-core/gsp/fw.rs | 23 +++++++--------
 drivers/gpu/nova-core/regs.rs   |  6 ++--
 rust/kernel/sizes.rs            | 51 +++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 27 deletions(-)


base-commit: 0c794102e44c20df9a655b28245dd037f197cd69
-- 
2.53.0

