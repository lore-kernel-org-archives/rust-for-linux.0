Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853122D4C8;
	Tue, 27 Jan 2026 02:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482544; cv=fail; b=SQqkIFqmq44vm3b8HxTSGkAzbaPl6BCFGDQ+bYcgIJFZKcY/q4qH2wS1t1/lQIqo27GpKF+76ZLwJmoStueSD8NzXAiJ4HgeaaLYgJUxFnjYGLPEtpqe5z+SR+0Lp+qqkr1BiJxpW6R3n3d94LcAMbX4K7vNaVM02bbtuCLSmr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482544; c=relaxed/simple;
	bh=gkP+qbPZvfVg1je7kreYqTyw7b2ifX2Go88mw98xZbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k8TwsFScYwZhPFWLED+GgJMzTIZHEgkSfgvkzX8721C662S16USBOKFEbH8/GmQuiZgzpyWipx1Dwc3KxYiWOH9IW841Yxb7eq7Ht7gSgGQlizxR7QRdrlea/L6ZisTaCltjm5zjtTjeLUT0BLWfhOAc79eFEPR/JQx+IQwRDW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gtli4Mt6; arc=fail smtp.client-ip=52.101.61.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gtli4Mt6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB07AMed9jcBaotiJCM4OUrguYKFveCFxOA4kfYbAGw/jhlY3sxgRZ+sWx3duUcEnlqZ5ULenEFBQ0yBGv5+fz5GueGDvh2Qb/tX+kIX67/eBHssqtmlWcRuSRSAP0Gx7GcRNoA20+nBLXTkCxxglDYgTVperWNfmPwjGQpA5BlJzcdsG3rpWT1aGho5Q8I5t/Nd4CcZXySpYKZhh7TK02g3cy85wwuYAFyV69AKkKj1Zfb5jSTH9B/UhOwsYdtVNMHEVxbuF1dtZ6tfq9fGuDFpn+lt1+PLKjJYtiefvfSd1w29b6vJVbAG+o6KHn2XSk79XLp5R0zApOoyakFj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhoDuHrLJGq8ZxEQ/YeIRBMTZHYaMlEvSkKvSJdsPU0=;
 b=bBpS+lbF81lqrsnaezZ//MFv4tAetFp/OarexA8YtvpG84Xdc/4AiF50frYAHWW/LHqa0SKdSU5jYJO/ipvovm/xAIdCxgAdqv34Lemca0QgYlliWimLczaUjjZ4L8MxN69nBlNI6+W79Bf/um3P46HjWv+PgqCbebI1zA2E+dk7fzGb/2ZHTTS0x8+J9J8ZLyP6TNOcYqYND/eCck53sz2XB2jkjKSYOuLaRkLDc7QFCuLbBFUBuEP5wkt9VTa9sfYtnxfZ3pqkOXB4x7IyRuJoS9Waw9qA4sNWkT/5CACgAquNe9vYJuZII8bwHTPIeiE507ks0Q2VlUPu9jcU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhoDuHrLJGq8ZxEQ/YeIRBMTZHYaMlEvSkKvSJdsPU0=;
 b=gtli4Mt6jpxhyovDyA9GsAwtWkdLYn3LSHg+WD4NXP7n5VzEvcITuwgcitD6pHkbdja5TuqOLrfI2on9JzS7T4XmGr+ipMCweazbutf/kYC28WMDyw11AeGP68oIgdnBOFgV0Q2P49Dcy6z9rWBh7ZC3bkWetpjgfm2+TSkv3X7NnZ6v7zn0gCibKbkl1ojYOLEPw18/D0hxOXDaiYYNzcMzhieerxp/41lP36HePClKI9krllwFxGtzR0PhtUYIQzVmUtKcclG/qsrVnT5cZea5S7RoEUaPDQB9S0M3AdIwqOLuDBi9VAN3JTk0oiFoi+dk7Mjm7MV2xra8Gh3zUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by PH7PR12MB6585.namprd12.prod.outlook.com (2603:10b6:510:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 27 Jan
 2026 02:55:39 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 02:55:39 +0000
Date: Mon, 26 Jan 2026 21:55:36 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
Message-ID: <aXgpKOHAmvZuMVSt@yury>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com>
 <aXCZeVqkDrBWr1uq@yury>
 <DFYK76F1W6QC.CCHFHL1BSD6K@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFYK76F1W6QC.CCHFHL1BSD6K@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0455.namprd03.prod.outlook.com
 (2603:10b6:408:139::10) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|PH7PR12MB6585:EE_
X-MS-Office365-Filtering-Correlation-Id: d009560e-175c-4ffe-70a0-08de5d4f8d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SSowWZ8UV0DYkh7g8nSh84j8jXIDf9swW6h1Wlyty4zrQBmp0NVmM8f1AqxJ?=
 =?us-ascii?Q?BA5Thc6GM1r7lYi/faBLjnu37XJ4ljpFW9A4lpOl1Mx+qTz2p1u+D7mV/zHu?=
 =?us-ascii?Q?A35lZuc6fIV5L5TZ+fm/VbY68QGTEsj+Gqwaiddf+Qg0u+CgE+SYEYI49uIz?=
 =?us-ascii?Q?pp+jjFedo6ceAJCmyfKBvKRTLoBZCYSWXkZdXCpP1ZAJ8oX0ZuSlawSTSG03?=
 =?us-ascii?Q?1HuZFa/zRl0xs1zfHaaA5+m1TVGFsIlLfejCSKsB4AD9YuaimlfImWpit5se?=
 =?us-ascii?Q?PNUCYZTaSScsTV5R5NwrEPUdZbwfuUMgBVQCAU/MCufJo0G9fYDW4PeG2ruw?=
 =?us-ascii?Q?9pe1BDu1AI2Xsx5MTVPJg9wpDHyoSqvxx/sBC3qgzsCp1+Jj9L+3+UoA9Biv?=
 =?us-ascii?Q?9vD4yIpCQhrgbfyv4O3AjT/inO924IzSWCXKIZ/dJeUgfh0AZo00cNvBrT78?=
 =?us-ascii?Q?hE0P6rseZRgwcJ+cGhUBFrSJKDBKtEV4uWAEFlXpWM1pKQjEQsPSix4GO6rh?=
 =?us-ascii?Q?3PzC+4CJ5/q/CUdt1XGaiWbTmagLGHkH4PoaGRoDsJDE83qBrkdwgbhNlpOE?=
 =?us-ascii?Q?3ZOslJuAnX6qYTWqwo01qb0kR15xmKjA8I/ACjaiC35+Q++0ybLd244yEtmi?=
 =?us-ascii?Q?OojGIqXq7BBRhBKJDKMq/enLWOITpyCARgfvzAIyKGkl4WAoMQG16xGHrI2/?=
 =?us-ascii?Q?3nivC4PHd+EnovO2Ou41mzc66rIVwE5bxqE8FK+wt9z7REC+RD+5wqo8xd1v?=
 =?us-ascii?Q?e9+AyIy//We39VlKC1HTc0bQSKPWXOH0cssIj/4+BApUgpmJTVdd0MgPsSVR?=
 =?us-ascii?Q?x38EHh92l0TivGOW3QbuG4E3Sw3wf3X36Xynm4Qc5BBomPapFmlqNzjpcLxD?=
 =?us-ascii?Q?ebhPk2TikFw/0ac2vcaCXc/Oa8BjP2dsdserg8V6cb9/+Nf2x7zFUM22ShON?=
 =?us-ascii?Q?1724kkTqONviWspz5URSBlKJQ+C+s3nz5eInhmLAFPKEm0ROOl6pOgrhgPOB?=
 =?us-ascii?Q?GSHiV2/7TmfHeWRDeEritb2XX+rXmnhsX6waNLC7XmYEaoongs0tHoQaZKFY?=
 =?us-ascii?Q?B4Qk88w2AJVmW2W/gPhzauS62l4jPQbny84KMqNxi25aUKOUIH6jiIOIAfvH?=
 =?us-ascii?Q?v3KACILdu2FBzwveLcMq5vwqzt7O6Q9jxAaxf6cHqcU55I1lI58Ec9fXdXnU?=
 =?us-ascii?Q?ZdvH0aK2m1ov2FOrlZRTZFf5WSZE3wOY/ekuFfS06BwWiFKoXeq7jSGxjGwI?=
 =?us-ascii?Q?ksI2HvHZ28+uIeN9iaErgBf5sY6+GyihZ1MDeNeJJEKp8wZehgW/pADaLWOP?=
 =?us-ascii?Q?XrzeVqv2lmfSg3NF+yeorH+RoeMCZTMhoclBRvPAj7u+rbFHa6mSW+LdBk7s?=
 =?us-ascii?Q?JlgigqPWHP3RWKF1u/S7+Qo8p89jbuyelrfeOTUoFfORiwxkaNGpwlrD/+a+?=
 =?us-ascii?Q?S2bl3M2mmYwl3tZOzMWJMpAO3KMEYsRWoFXJ4AAI5Nzc9fPGMxFk2FdlRgva?=
 =?us-ascii?Q?ApE/ykMO0H+r73DHoMFuVqk4yZMjwmvCFSL41C+twMfOMp3gzvEjurkGu23Y?=
 =?us-ascii?Q?hjorOzlSmn2wkXdTBk4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hn6d8uzyB7cD/gTptjcExsh6qoFJaMul4/ahU+8DJOMcYdlfDE0+GQpxEOow?=
 =?us-ascii?Q?L0Iq9ZX1Jag0Lo9MOgq8F9/8tuMCNZIDusYs3V1NemL2qePdRyxl0p4YD7vi?=
 =?us-ascii?Q?0SAPqw8jvuCUk+cnok9BA7BaxhPhyV+hhhHapoxt3wIo7656Yg5Ck8lC4Asz?=
 =?us-ascii?Q?WUyj0IIRq5CnEv5oJxprLKocyHpZbBZahRynT4R/vqzWqhJkcMEvimzWeQOq?=
 =?us-ascii?Q?b5pvZPG+i+YU8CGgmO7Iq6uxHNZdFRqMg0bJXYlF4dXIabZ9mmevGLULZZGX?=
 =?us-ascii?Q?wNh5Qe8bjJSxH6ANHUDPr0/6sKsmV8bE8VgJ4eDkEYXCmaH+YGW+2lXrNn+w?=
 =?us-ascii?Q?eLVXYQBxC/cji2neUaa6zjw+GV/p78ExzIQRKrm4VrOIuh3DEiPWSvqqKcNw?=
 =?us-ascii?Q?hDE7pQBPbXkKvU7jmj1VE1/cGeNBOa9M5m2nAcQ3qIkXCNp6mVd8R8r7nkep?=
 =?us-ascii?Q?upHaluoXQwt4GDqWey3KbkejbvJD3wGm8cy9Sk4ynpIAN6XtUB8cnxby5+MC?=
 =?us-ascii?Q?UJVSBqM/9bvsN1BpCgodL7wGqOaV9XQtfXZ7l/Q+uPAbAEbI7Zfcb2HwDMks?=
 =?us-ascii?Q?9Dn5BsmRyGt5zsbvOQuhGOkwj+48WnXf3lC77SoGbTOVXH1NAyjM9WrYruh/?=
 =?us-ascii?Q?oYWsJrum9Jl4xhogbYNZQTckY4Lagw+wc4fea9zelML6xN1tb2q79TUck8+T?=
 =?us-ascii?Q?7x6QOALNz5A5bmbT/6TmJ5HDsyiqHllxN6e/TO9MKZdZ6fcLQeh0IEWwo8fZ?=
 =?us-ascii?Q?FnjZ0UKoz634l/bH3qAyoGD2+UvLBdaBw+CaTR2HjENTbQJFDgRlEbuuggcE?=
 =?us-ascii?Q?YVS16/2Qp8cy3J9w+UjG/QGJA0QdirFiB5rsVZtDhF7OTEkW10J+djjH8ixC?=
 =?us-ascii?Q?J1322n7Gw4tSG5mQphjiC2d3dGG0p9LoNU92+ppsZP+JWDaBcYgMP5+sPk1L?=
 =?us-ascii?Q?kxUikVBekd9oAI74L2AEsUDQX27FAk+XKL8HYISj8/d2CTp+K7E5mXASbx/o?=
 =?us-ascii?Q?CDHUgd9776Jt6PiD9OQ0GjfRJyJQ5eDVJ4/1fjJkLOlvc6V1aR6UGDnLAjUi?=
 =?us-ascii?Q?nLxM0JR7xMBJ8LWSHK0jP5tmI9HPkPlWenFyxPJqDGaunhupjJpl76zvdw1W?=
 =?us-ascii?Q?v2IyiTzchhmhtV0X97iJ5KxejqbcO5GaT76+X7/rnpXsNWv1P/c2HDyvSvNb?=
 =?us-ascii?Q?4ENes2S8R6mWja2Az77Fwi7wEbHMn0pN06dIAnE6X9Y5ojKAgTWC3yrsVlKx?=
 =?us-ascii?Q?Ce83xtmdWcgvgYHGY5gWl+hXnNNJivfcoqv8VaLt2wwrhnq7EdQziK0mOddQ?=
 =?us-ascii?Q?15av2/3wjEVkAZcjk8yjsN7UHTlrKuT1PMaCM0EZE9xOtl0scAwO6R1rdvFQ?=
 =?us-ascii?Q?bNJBprVjJnq3FYgy6xulwnGHzMUw9IJVvTm5Eq9tCKFg7MUjbxkjOyfSYnBl?=
 =?us-ascii?Q?lArMf2QcMBOmOPmhQs3WjHuT+puKOT8uH5KUgMXEjUhXLnY4a7ETtB56Rwo2?=
 =?us-ascii?Q?Z7qxdFEOd+05w8mS0BF6XRWK09WcFYqAoNloQZqhg7Iix8XzLrDSfikU8Xud?=
 =?us-ascii?Q?tbwvcirbeUWpX9eLDNdgYl3e4SOHjU+O07eWF6Q5EuLXpDHFLQWDwKHyD+D2?=
 =?us-ascii?Q?Is2VYdCMEDRIB4bmO4cyPToMfNG0oV1GCzl5+pbgPVL/mQTZKxAvnXzkJt6d?=
 =?us-ascii?Q?McOORavmAssylU8w/PieE9Oj4oEfgBjK3VZx2pXJhNTX6e9ghP7I3JXdAp18?=
 =?us-ascii?Q?ixG4f+MNT9a9dekxyJNBQaH7UQldctSButkTCvhP52qXsn0oacd2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d009560e-175c-4ffe-70a0-08de5d4f8d3b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 02:55:38.8673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXYpBJ5VwraSaUY1jqt12dzHyXb4vexHOp7R21eTTuiGg8sQIzKrVHtanD/r4V8i/nrClk1km1edUIo9MlkSWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6585

On Mon, Jan 26, 2026 at 10:35:49PM +0900, Alexandre Courbot wrote:
> On Wed Jan 21, 2026 at 6:16 PM JST, Yury Norov wrote:
> > On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
> >> Add a macro for defining bitfield structs with bounds-checked accessors.
> >> 
> >> Each field is represented as a `Bounded` of the appropriate bit width,
> >> ensuring field values are never silently truncated.
> >> 
> >> Fields can optionally be converted to/from custom types, either fallibly
> >> or infallibly.
> >> 
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >>  rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>  rust/kernel/lib.rs      |   1 +
> >>  2 files changed, 504 insertions(+)
> >> 
> >> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> >> new file mode 100644
> >> index 000000000000..2926ab802227
> >> --- /dev/null
> >> +++ b/rust/kernel/bitfield.rs
> >> @@ -0,0 +1,503 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +//! Support for defining bitfields as Rust structures.
> >> +
> >> +/// Defines a bitfield struct with bounds-checked accessors for individual bit ranges.
> >> +///
> >> +/// # Example
> >> +///
> >> +/// ```rust
> >> +/// use kernel::bitfield;
> >> +/// use kernel::num::Bounded;
> >> +///
> >> +/// bitfield! {
> >> +///     pub struct Rgb(u16) {
> >> +///         15:11 blue;
> >> +///         10:5 green;
> >> +///         4:0 red;
> >> +///     }
> >> +/// }
> >> +///
> >> +/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
> >> +/// let color = Rgb::default()
> >> +///     .set_red(Bounded::<u16, _>::new::<0x10>())
> >> +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
> >> +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
> >
> > Is there a way to just say:
> >
> >     let color = Rgb::default().
> >             .set_red(0x10)
> >             .set_green(0x1f)
> >             .set_blue(0x18)
> >
> > I think it should be the default style. Later in the patch you say: 
> >
> >     Each field is internally represented as a [`Bounded`]
> >
> > So, let's keep implementation decoupled from an interface?
> 
> That is unfortunately not feasible, but the syntax above should seldomly
> be used outside of examples.

The above short syntax is definitely more desired over that wordy and
non-trivial version that exposes implementation internals.

A regular user doesn't care of the exact mechanism that protects the
bitfields. He wants to just assign numbers to the fields, and let
your machinery to take care of the integrity. 

Can you please explain in details why that's not feasible, please
do it in commit message. If it's an implementation constraint,
please consider to re-implement. 

> >> +///
> >> +/// assert_eq!(color.red(), 0x10);
> >> +/// assert_eq!(color.green(), 0x1f);
> >> +/// assert_eq!(color.blue(), 0x18);
> >> +/// assert_eq!(
> >> +///     color.as_raw(),
> >> +///     (0x18 << Rgb::BLUE_SHIFT) + (0x1f << Rgb::GREEN_SHIFT) + 0x10,
> >> +/// );
> >
> > What about: 
> >
> >         bitfield! {
> >             pub struct Rgb(u16) {
> >                 15:11 blue;
> >                 10:5  Blue;
> >                 4:0   BLUE;
> >             }
> >         }
> >
> 
> Oh, all of these will name-clash very badly. :) At the end of the day,
> it is still a macro.
> 
> > What Rgb::BLUE_SHIFT would mean in this case? Maybe Rgb::SHIFT(blue)?
> 
> You wouldn't even have the luxury to yse `BLUE_SHIFT` here because where
> would be conflicting definitions and thus a build error.
> 
> >
> >> +///
> >> +/// // Convert to/from the backing storage type.
> >> +/// let raw: u16 = color.into();
> >
> > What about: 
> >
> >         bitfield! {
> >             pub struct Rgb(u16) {
> >                 15:11 blue;
> >                 10:5  set_blue;
> >                 4:0   into;
> >             }
> >         }
> >
> > What color.set_blue() and color.into() would mean? Even if they work,
> > I think, to stay on safe side there should be a more conventional set
> > of accessors: color.get(into), color.set(set_blue, 0xff) and son on.
> 
> This would just not build.

I know it wouldn't. I am just trying to understand corner cases that may
(and would!) frustrate people for decades. 

I understand that this implementation works just great for the registers,
but my role is to make sure that it would work equally well for everyone. 
Now, for example, Rust, contrary to C in Linux, actively uses camel case. 
So, the blue vs Blue vs BLUE restriction is a very valid concern. The
same for reserved words like 'into'. As long as the API matures, the
number of such special words would only grow. The .shr() and .shl() that
you add in this series are the quite good examples.

Let's make a step back and just list all limitations that come with this
implementation.

Again, this all is relevant for a basic generic data structure. If we
consider it a supporting layer for the registers, everything is totally
fine. In that case, we should just give it a more specific name, and
probably place in an different directory, closer to IO APIs.  

Thanks,
Yury
