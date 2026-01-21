Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013003.outbound.protection.outlook.com [40.107.201.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A37397AA2;
	Wed, 21 Jan 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987012; cv=fail; b=fGMBseKiAKec3kgeaZ3yc0Ga7ikq/2f+ghWeNbvwr13y81Bfoi8kdRKTCXqLCoYBOeN1c2gIDSBMd+h18hPQEG+yGGX8vx2Z1tmyNU+MsjQHs9cJ0uSE29CG2J5qzytPBz5ZKY0ZrTdSN6KcijewzmwnvHAdQYeFfz8Z5hMIuo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987012; c=relaxed/simple;
	bh=SUtOcDt49HCw7s5KZOHI/dysteDPSfJMKafKU2WqO2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G4Sy4a8iyJioHfbqW5+W/LvBxrE3aRuaZut7+vWbI/87/pVQKyQJPy8+zELcIq9M95zz7fRNVTUXVv4WdQ5rfeb9tC3Ry/a8+iHrSI+dK74vFjteL624S2HAx2UGkHp6zf0vlC635S28ondALAKQGgUe9X63PzNYmJdwcEZTnqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uxef7EtQ; arc=fail smtp.client-ip=40.107.201.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uxef7EtQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+Bj8FpFNpRUzJASutlLSplGrYEHYb7KBSCxihI3pKh7i4n1CYI6Y8hI103+1KYrZrWRzdPQ6A6VGzuS9UNVLqbMWMpwmb5iNFlz6y2aPRIEh4+VbE8qvXudCVt1cDCfXfwSjSias8kQa4ORdQ39bPv6/b3Iu70/GM1Ka/8QQQwH+JUDPKSIHq5LIVIJpf9BLvSIhef5ZvjniqxiYqDLGlo1w8KZs2TzgqAHc5R/ljfIvkvZSA64113eZnkzgbkYn/i4nd03Iv58MWIYlTdsE9SyqoN4jiTzHe/2z5DQcXbkqrQ6X12doPrHuDDd1BWRR7IHk8qJ8nk3EMEP4xEyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m2nEbYK8/wKYgfg+unbJMcbi1yb2WKXA+CZqDJfylY=;
 b=djhH5LJ2RgvuYaS/u1LEYPyn+QtByn4AThrBHB3ayLGlA4UyrcbhKqpQZFZapJmnIHNKgpaew07FOFCiNhpwMSk4XD2bpwcBB61MCz2mvLwtC7fQ+ocQX2diFuYnchUA5i73hGeB2B4JX6Dh2R1s5/Ks1DLUD6NgRdITnWVPZjSZaVB2i8mUa6mj+egbXBhUjCMOp/bVj7skbTeuE/ePCjv1SPT5kPa7OmWKqQwXevpV6ve6NeQJmRSDsjIw2ZSBZSpjnJFmBVB9I6/lLqhrnOAZu4AUxVUCAJIXxHWtNBsBxCqkSiB9avUiXMzQoetwpe0j0/K0H6DiTq7SaLXxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m2nEbYK8/wKYgfg+unbJMcbi1yb2WKXA+CZqDJfylY=;
 b=Uxef7EtQttMb/Q3wwmeLg56NeOd8dXTJhL9Yz9jZ4zwmDBEsQoYmZEtL6nPnr5WZJKTPVowlY9Q8CRDn7TotgLEp7WwmcqCxLCIHBcBP7+cjW+Yf0cXZRPmLPI6k26Q/daDCLobomk6hcbRDErVJEy5mOVyETXCeT66wKLCEusEchTevbuCcakeuW6vvTyLX+inoWY/sJMfEIttRACWhAIqegb6D5yEv/W3lDiopoZR0yEnzLYM/W7ElE4lr2qls5fJN4BW7UX7fcpKnYle2r9G5ucNvHwsQ/NEblAOaWUO1mkR4Z6Mfi3ipDzYxAJewEQOu2DrAUNZ/XCtQq8pd0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CYYPR12MB8938.namprd12.prod.outlook.com (2603:10b6:930:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:16:43 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 09:16:43 +0000
Date: Wed, 21 Jan 2026 04:16:41 -0500
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
Message-ID: <aXCZeVqkDrBWr1uq@yury>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-register-v1-3-723a1743b557@nvidia.com>
X-ClientProxiedBy: BN0PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:408:143::16) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CYYPR12MB8938:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d67b3be-04cc-438e-3dc4-08de58cdcb49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M4OzkMCwdOhddcwhg3BtoXnh/gIrbpc86RF5/of/M1x8lBA926lUEOe81IeR?=
 =?us-ascii?Q?A4Wnumib/u7JDPY4EF3Lk+y5PXdGDrKtKCgIcZjOaJsEP57hfMlE7Mng96s4?=
 =?us-ascii?Q?0NNMcqugfzw4lIhjqogf7TOBjr/DHsDl2s0uEob5jucPfNZT5vnxN/adWdMC?=
 =?us-ascii?Q?2yaI1IG4vcxd2nb09LMxh2tYallYQgP/+ofLNAcx9XBJ9egw2ksymExCbJZz?=
 =?us-ascii?Q?irLbmCKZG2gw8oj/0YQpKa2+M1APnJtv8sJdFqKvFk1l+m5lzBa4U3gRrZdF?=
 =?us-ascii?Q?99itdTEEzj1vA8nmQ+nXcw6ttHxUgjTYPiBJEpZaoqIhqAm80aysOvC3uGs7?=
 =?us-ascii?Q?01HWW8tDbvAnZUnd8Bb2rGxF+5nWp6ums0+3wQCkENE3WgwRs7473ygoDGmD?=
 =?us-ascii?Q?zvlgIy3hYGDrwVF/na/dJdO3pO4bfDLulFT0qhKmmV03sZsuU/JrAa2xLI+s?=
 =?us-ascii?Q?k271mKw4iWn1fgdF8TvVTdxOsqdmgXxGPdQcZJ372qRGjQL7jHqobH8TnH30?=
 =?us-ascii?Q?OzC6qlCWXtpbKflr/+PgXm/DDjvvqV5N76jPcUIafHiJEnDAJCDXAhnJAp8I?=
 =?us-ascii?Q?Zen0BbaXYZz2br0QcW6ENBefYU08Bzkq5n0QXf+P699mdgPlsSn8bJUdO3Rj?=
 =?us-ascii?Q?+SNFsrsINcAGKcqTcIf4dFZp4dx6NMfOohsfHVVomdaJVDLsnOB/ssgd7Nul?=
 =?us-ascii?Q?r1nZS3PB+OOSTYSyebKpQkhYXKGx1Qtl7zCGHzy3ySvcPnCw1Q2CrElkFLfj?=
 =?us-ascii?Q?RvKMuxk7GOJn0cCz1xCBm8ICoRZfQhnBwfNx70ZMfQgdUSm0nbSekBWuZlmO?=
 =?us-ascii?Q?fRRwdomX2CoouQCH0Txbz0zcbfZ8laMsrUr/DiWx4bigebSn6XnPpVyqcztu?=
 =?us-ascii?Q?eXM5RKSa2KQae/TqgUMeZOBYHy/++YL+rQlGHpW4I++mf1xU5FQ1WxPJmW1q?=
 =?us-ascii?Q?h1CYIAKM6BE24cWpLY0pR/iN5hTcYl6TNVP98pp3z8c8EnCKIR6Uf/kYpJaK?=
 =?us-ascii?Q?j2rut3sczVeL/fYnBYppUuBrcOxrDqxQYY3wYKS+HjEWp+i5YEuWnbjqsMZ5?=
 =?us-ascii?Q?oDt1i38PdZAEHjznP6nmYGY0hbttLjGMAu8cPhxKnNzJuzXO5FnZ07sk0UwN?=
 =?us-ascii?Q?8hDN06PpxOIpc//DuuJ7zPd0hpWJ38Pi5/27B4aJPSFONI1u2fVutGboYGQA?=
 =?us-ascii?Q?M6xCg+BHbLyt37yNssiPpNyb6mXBz/V30qXWr8EQLCwScjDhytGRMzGKAkcf?=
 =?us-ascii?Q?4spOgc0YS5unIzPM5wcR2CHeeTiMWxsB8QW5z8pIBP/6SRgT0ZNcFsEcFb0o?=
 =?us-ascii?Q?HXEEUZcmc99aIJvyRH0nDSRUFl1f07oBDBF9iXdafI+c7YCP4l2Ckh7Me7YN?=
 =?us-ascii?Q?V9qfB46T7LXXCyPYuYFB6XOJwtKkt150HsszYa/i3v+P4QyGYM1ZaPdj4zK5?=
 =?us-ascii?Q?koqmQIS+TfyeE/muArVYeogkg2IHansK4HxCfNAngRZVck8BCiZRLPB4DmPL?=
 =?us-ascii?Q?NC0uHkB+N2eAVs9i4GusUDAs0oHT5r0Dt/9BUgS2fyiQa2Av9owI5fHnfsBg?=
 =?us-ascii?Q?IctqV0ik9i5SCuwSaqY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0UB/4pMa5P13bGhepirLlUoWqyRP6BRXmOS6wJcRl7fmX+HS2SYUx0Ctwz4d?=
 =?us-ascii?Q?LIj7tEmMSVnzcW+ccr+D8IuUp/UXJexr8I6OVprEeHcoLd11G12Sk5hJoywn?=
 =?us-ascii?Q?83aTJpG2KWj1BWKSj4K5iaf1oFVsZCJby38/GOBqSBHgTmGEX30mNVr6CGg/?=
 =?us-ascii?Q?Y0qdtPUqwMMCjTV34HXlKk/GfEqgTLSTHDuRyeWThxLU+4ot1QB25HrFT6qW?=
 =?us-ascii?Q?mwVSCnP0lDcE7jIHczuubiuIFJf5rTYj/aktKHkvfPmaHD+vSAcDcWJksISG?=
 =?us-ascii?Q?ZX9wQWsTFO+GnGOXqPhaf7glzSrqBCI/y666AobfpU1DNxJ4/2O4QsRnusUX?=
 =?us-ascii?Q?+GRP7u+dT7PqIGU9daf8bATKgelnEGQTINcyzDNk17Y108TlEdMsptKMqv/1?=
 =?us-ascii?Q?fvQxElWTAhXsPbRHBWzOD/Oo6wt28R53ePU8Tb1F1fxMyOUL2jGrArS+EhwX?=
 =?us-ascii?Q?DAVnV0eewQId0RunJNjHb8o5AIY47d32yHfIkS4Y5YY7aipFbc0W6XFs1jVU?=
 =?us-ascii?Q?ElbFuW7GGtGCgW68Pxo3+9+qq5U1Vb9wPlUs8tRzT1VwmXy/WSqQPhdlzjju?=
 =?us-ascii?Q?AMYmN3P6nsjAF1U7eguXcxatu4h0859dDDLsC2g6eKtNjEAj1R/r3h69r/rX?=
 =?us-ascii?Q?TKzR6jHj/OkRKsBf+TTrpejLWTAaSxPiXlKroD4uuqVuW21gcN6WKoGjUr+1?=
 =?us-ascii?Q?syfWGfdh+bZyLlRqspEO4yAWCAa/50jsZ3yA+9yjMKRBW+XEXncTRxQ5zaOv?=
 =?us-ascii?Q?xwfJvPrwBbdDQWf7cEF8wo2H6UbGp7Ng8zyrzjOyvznDLhg+Pc5dJj4Fkn1B?=
 =?us-ascii?Q?129Fa7/t5wck1YCaCnOUijkphXjyczwVSvp3AjWCCcCxMD12hDqU7yoQ3icw?=
 =?us-ascii?Q?IQDYTY1Gzqb47flylBRrObn4fyZZI0VuyH47AEXuK32XIKtEvM2JSiD13a9T?=
 =?us-ascii?Q?+Y9e01h9dR2OnvX2RU/081ZoXnbam26utaoqM4wTAolqTVqwto7zNwHsTQxb?=
 =?us-ascii?Q?FeKdA0gjigOIDFnw4GOhjSpxShV+r2YHld8rXv4ZZtEq693uIgI2lPZ+ktZd?=
 =?us-ascii?Q?o55cb1RreQi+xPEti03oNabrjZVQASkMCCWc0EHZZB5hs7o7jAXxSSdMpR7N?=
 =?us-ascii?Q?Z548P6IHJ6KXhscVcZ50o+M++NvneYrqlBMGtIazvssLSLsIu5Jx8TEzT8TO?=
 =?us-ascii?Q?OEAfFhxCxit0AmXR1P/kJnAJP3PLIOO/Cklg742zQMtqql8nMJUml/3DsjTa?=
 =?us-ascii?Q?Oyf5qKQkEjPrRI3jMucK/KUAj1fVXc8/0dnn21WGJoaafyrg6c0KKkbITFGq?=
 =?us-ascii?Q?ne5y6LHrMVd1+2fHkSGb2YkfZODO6S/NMUQA7oGCswaSG4MH6Z5lyRa0rtUg?=
 =?us-ascii?Q?o7MxK2eaqqApORxN9RDJJz3m83GvOaprOkw+Hhn4vAMSv7RRWHUVyStTYsdZ?=
 =?us-ascii?Q?E6Tjqa9CiR2qA2MGp0q5dvL9b+GZzfXZLpI4fm5FE6Q1P6+lxgtzOTE1npDt?=
 =?us-ascii?Q?q/gBk7aZYgM1PoFb6+cA0IYFNjkRW8JIKQqzQ8jp9NT8SE+aZm3myv5VSJEc?=
 =?us-ascii?Q?Fajt5djihG9sd1YE/OZCNj/mvV7Jjs/DNa7RqnIo1G6PkUGNARFr0x6ASeXf?=
 =?us-ascii?Q?YQn/b7WGPASb20tfGmiJcLTuMaRJNzmX9SV86JK0vs2uTq4j9H0ZvyQoAbrk?=
 =?us-ascii?Q?MLSyTHrTcWeWxnnivXP8kFe4TSEIc9wG5bTrOSTjvKOiWsq6satZ5bO1paq4?=
 =?us-ascii?Q?gN6z1No/cw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d67b3be-04cc-438e-3dc4-08de58cdcb49
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:16:43.8239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JgTzfpgHzeaxVdtG6jvbwdYpB1Qf72cx35Jvlds69Svf0njJ/iGsHOUdFvhcCT8CIHEuB18JH08pp05pRGbww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8938

On Tue, Jan 20, 2026 at 03:17:56PM +0900, Alexandre Courbot wrote:
> Add a macro for defining bitfield structs with bounds-checked accessors.
> 
> Each field is represented as a `Bounded` of the appropriate bit width,
> ensuring field values are never silently truncated.
> 
> Fields can optionally be converted to/from custom types, either fallibly
> or infallibly.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs      |   1 +
>  2 files changed, 504 insertions(+)
> 
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> new file mode 100644
> index 000000000000..2926ab802227
> --- /dev/null
> +++ b/rust/kernel/bitfield.rs
> @@ -0,0 +1,503 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Support for defining bitfields as Rust structures.
> +
> +/// Defines a bitfield struct with bounds-checked accessors for individual bit ranges.
> +///
> +/// # Example
> +///
> +/// ```rust
> +/// use kernel::bitfield;
> +/// use kernel::num::Bounded;
> +///
> +/// bitfield! {
> +///     pub struct Rgb(u16) {
> +///         15:11 blue;
> +///         10:5 green;
> +///         4:0 red;
> +///     }
> +/// }
> +///
> +/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
> +/// let color = Rgb::default()
> +///     .set_red(Bounded::<u16, _>::new::<0x10>())
> +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
> +///     .set_blue(Bounded::<u16, _>::new::<0x18>());

Is there a way to just say:

    let color = Rgb::default().
            .set_red(0x10)
            .set_green(0x1f)
            .set_blue(0x18)

I think it should be the default style. Later in the patch you say: 

    Each field is internally represented as a [`Bounded`]

So, let's keep implementation decoupled from an interface?

> +///
> +/// assert_eq!(color.red(), 0x10);
> +/// assert_eq!(color.green(), 0x1f);
> +/// assert_eq!(color.blue(), 0x18);
> +/// assert_eq!(
> +///     color.as_raw(),
> +///     (0x18 << Rgb::BLUE_SHIFT) + (0x1f << Rgb::GREEN_SHIFT) + 0x10,
> +/// );

What about: 

        bitfield! {
            pub struct Rgb(u16) {
                15:11 blue;
                10:5  Blue;
                4:0   BLUE;
            }
        }

What Rgb::BLUE_SHIFT would mean in this case? Maybe Rgb::SHIFT(blue)?

> +///
> +/// // Convert to/from the backing storage type.
> +/// let raw: u16 = color.into();

What about: 

        bitfield! {
            pub struct Rgb(u16) {
                15:11 blue;
                10:5  set_blue;
                4:0   into;
            }
        }

What color.set_blue() and color.into() would mean? Even if they work,
I think, to stay on safe side there should be a more conventional set
of accessors: color.get(into), color.set(set_blue, 0xff) and son on.

Thanks,
Yury
