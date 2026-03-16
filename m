Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94DD224AF9;
	Mon, 16 Mar 2026 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682598; cv=fail; b=VEAqtrGbHyvIAxVREv7i9h7WrYjphy0EhG4ZGUv6s2I4WXik5Npp+PuJ87b+YYBFou9Pe2PwO0xqd7+8fJz4O4M25tggZ1sV/VyplNITiQ2FWmkikj9Nf0uwoTdqeBLmZT+qlZ9/ur1G+oHJXlljEAnXA5lUjeA2zuI3pJWDPU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682598; c=relaxed/simple;
	bh=RC41Xthx9oeykGzKew1fYlUwBaMP+2K9rTAl/loO/KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RkJtVblCq0VmgL0ypoL6qyN6V60aVlEoiGWGcw/EphDC7wmU91nBR+7O9mCWsZAnjuI25wIK9/hFerrUf9KOf5lEtN8sGcSNaPswQwomC/43xLr1F4rYy+/LnqK5axdKAnRCPCcT2du+z8Q9bXEq4tGfcOBN+JHRxr/bQ6SavdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q2aLSvTK; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q2aLSvTK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADQqzXPkTyVvrITURwifrGrsHkNo93fUkmSW15ZjVSbtRZURkFF7TxmmyeecuF/NiydurwjgoBYJP9WFjOaK8zLQBjcbsE/iGvy7YFo6mbBhBvy5Pg8Gz01hKLVECX1Jso9RUGo2ge1T5U6yt2XCPV6U+HYoiBfDeu/F8K+di4izMOxuE6oQOeAZ9GAng1aaU0e39ZuynyAht7ga3l2f9LsTQkDBAX/8KEBEnKxydQr9z/Bn+FmeibEDtIwHBR4Q0fAkBPcLzH0s17xMblorlRueeAjHHl1P8IwVccg9VeGT91w7Dt3l4txdkNZ7tUG/drnxOOFG2xa4cg6263is1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiLrovWc+dmXRoLvyXAbimzrdP2Efo4qp7V2JArxHO0=;
 b=Z4e2uFOYVcwtU5DO0ZDZ/5ZO3JDrLGmPMDERsBPKdaqV+xBUcgUhOgBUagt/qXlvvHHNj9q8ljhZZ/g64o1YsGghOr2XYZGwHKEdspqVCUF/++9Lz21UHMXJzTe7Buz0qOsIDWDTUlPehz6GRez/tY2cx4XmZ2ZDwZc4o+L488iGYEb5/4oG7lMfRm0uz7pcB+rVs7urepwArizmiS4gFPBPQWxoiYrimcaNg3x+ABQgcQXlmOo9vR8bYuh1yklWlTuVsSgnDWw6b1g2t9YHp0ceWOPlo7IgY4ScnF+G7stCz9cac4D9m4CYettawU0LjvER+WhmF4PT+AOjrbWFRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiLrovWc+dmXRoLvyXAbimzrdP2Efo4qp7V2JArxHO0=;
 b=Q2aLSvTKLztTZwrWzQBZPfaIUMq7HfMIozjAvoWKJ7SxPtgtzTxZSygjJJiRLTAjCq1B/FL9QHEVvmZ0ebWmW7zOPD93JtD6gE20KAniDQYKbfopVmJKPduvdlYHqWnxKnRhr+IAFmV4veHsVp3yCEXsbo0+VW/lMYbTlGSfTO3xPdnnkt+KGwFoibwhzX3Wg0/tlQuPXOFJlllVF5+xZJYp1vDihauvd6KHHuzzmW0NWf/7acGJdF5jxhg5kPHE9rm+j0oiKNsSNUnUiCcL+dQau90YNTDZbJB3iKk1J+Lh3Jb7SPvgJivLl6y7+ILAyo1czFStFhSLuFiJ6nv0AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 17:36:33 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 17:36:33 +0000
Date: Mon, 16 Mar 2026 13:36:30 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] rust: rework `build_assert!` documentation
Message-ID: <abg_nmPSCZKITC3j@yury>
References: <20260316150720.1646109-1-gary@kernel.org>
 <20260316150720.1646109-4-gary@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316150720.1646109-4-gary@kernel.org>
X-ClientProxiedBy: BN9P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::35) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|MW6PR12MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b6222c-eba9-42ff-d882-08de838290a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	yaOrRwERBloCoXOs7MXt1nlNiXEV+Gv32emsJYZfE8SfCgNjcePe6WH/UWKm2SfyTJSLjx1HcRAfI1sccv+8Qca4HpRD1/RgiH20hANx+wFblmN8TuLZEM5pwE0Oq+1qFHIxArNorFr8oUhy7YWEh7pX92DWpjxoICSrq1KMpVmAsjL3YofK8k5eGCSJNd37bUnBTHdM/eHCBVTKhr392pYzjYcoLMbxM52LZn9qMVBejv+5clBIvGSgELl+2j3PO3xQI/eapRnvPFA9k0o4jYuCQtdolCGACQRpESqG4MEMRTebhLMg+Cu0bKEWBCAjV82AYixA12w/VjO3WIrylc5OFtSGfFGw7DtEChhsG6YxrQRtpKn3hjFO5FQQ3sJn3nuyDzKYYbeZ+nZIs5tAk93KnGGOiQc+Dnm6H2oPwhgYqppzjH698VFzLKnM0KWBVmsVEGjdfmqWs+pX1jGDe5kb/09QotVt14KTlQGLnfONOTpUlWiSE1Fg5zh0lYSK5SopGd/y6OF7C8BDrsYSQ/G7A5PFPQNtT7VzlqcIKhO8pwVFDnDfSmAPJDUJd2hTBaIwJdqZFmjMMkb4IVnvz47rHMZ7Xek4cWHakGsy2IAfaNxdjRyDrFtLDoPW2WpusA92++qa/PvEauIi6ZfN+2gQaWYQqowP3xsdzSNNJkuTH7a6nFu1KvrpStb+VC/1m/K9z945HUJtOsrLVoMMZWJVkwaii+X/O+aHVVOchpIyFORKs7YxzS4eYnCwihBj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u1qzDgO79maTwA/OoYe0gLj2hMZDWp6HssSfiKErJseNJzJ9MRFEnnrkNtTK?=
 =?us-ascii?Q?xUQhNh/7xBblcDoYXX/j9mQwq7uRfXk84ODxNRQXHbtJa2u5dvBKEfsce2sX?=
 =?us-ascii?Q?Ie4rjbnIMXYQt8MS4PzwONXLZx1oGpBmao0C/aaFAAfNdFAtIT7A/pUP/DTi?=
 =?us-ascii?Q?ouvyZRc5Kv8a2ROwmTDNKjImNUQxe/m6JVQHxU2IRt5MmHOJV7aXIymMZXnt?=
 =?us-ascii?Q?msi4IfTkDSlT9iust0IY5+zq+uvHhre+6TtElYamDP444fgq+lQjs74YkdRb?=
 =?us-ascii?Q?yEyZMApr/gIBd3pLnJtJr2j/ij7CIbLZ1n5SMHtADsE53JKRGJoJjpqndhH5?=
 =?us-ascii?Q?g8dUCfvPtQfxGpZTNFU5g3J1f9jpvcpnQs/OvyIP9HZsNIAhDGcg24hnSRaT?=
 =?us-ascii?Q?iq3CzyU1QNacYia5I04XnI4qxap+qynA6Gja7DhoujIrrVLxmJhjZY1iL6Ce?=
 =?us-ascii?Q?8P3JT9xxDMbnjY9i3/1WhpMQwALYOynOeXXvZ/7PjSw+wZgO8b3sW5nD/wR2?=
 =?us-ascii?Q?bHPg7GevjPWvQUlSQVuTncr7aSypNgvIM1ZipqTBL7gV7FgPWm1d78uhbwWw?=
 =?us-ascii?Q?S2Ly2QICe6WMjJShgNsYZBv9Bwwn1EYvx3iOpMJNldKje7cn4JEltjX5AMU6?=
 =?us-ascii?Q?rI97v1cRdsKA1qCesS8I6/K0Hi+3E3R6uwifSqlXaMdFgLIi0/utWnMquHBU?=
 =?us-ascii?Q?P7qBoi4WD8Off2TO95h4nDpxrCN65rmT6Sn2/BQeIXyaxd2aFj772WWmB4uJ?=
 =?us-ascii?Q?beNxntNlRh3IbdNbsiWUtIY5sJDgtvIHBIgvnT+cG4Duc9RWtARJcibTv8+u?=
 =?us-ascii?Q?zI+JUBKmHz1nR5zlJzkl+DQKEzjYavFEg8ZhXr8Zkz9sbpYEQNrQqYOT664j?=
 =?us-ascii?Q?zufmADjog9NejpJYvfwcTRTPk62YCpF+uOCi2b37OuQDC/LyWOhGIERCIkJN?=
 =?us-ascii?Q?4f7fxC7lx6NMXBd1BhRSSKVEmyOSqkKabxDsYtm/YtW6wHyxbAreJQOPwVfl?=
 =?us-ascii?Q?sDsQE6VFsy6wo7jlUrqeyuGb/gsCLRXE1lzHtj08xyZtPdXGCjYj+ecEK4G2?=
 =?us-ascii?Q?c/ohUfhuKSv7ZoXz13OaoZAv4H67ZoH0rbsXBkvzkw539JbZpwO59/cCv0xK?=
 =?us-ascii?Q?wr/hx1dxI3W8Q8HGL+77C1O1DPVwOiQT+gqI+vrP03zRUNC7EvLcqqXxS402?=
 =?us-ascii?Q?/bv0SEIeASX9S7UpBgQQ1RvX9/jjqeQ7iktkSmyH9m1xNyqkrEKEKohLy+gm?=
 =?us-ascii?Q?KJqKuimZabeoPk44JSndT85l7pIs5W4U/cpS+6ECOh2thtWseK8e6JzdD0cw?=
 =?us-ascii?Q?1rrCfYzRrCONoRTXykluYhY2UN4VyYHtW4MDCfwfyQMNbed7u99DaG1b4GIW?=
 =?us-ascii?Q?GIVoyT9eVzAZrkD1JkM0mViYsXkmYu2514+7bCWb+nUJF6pNowUX/vKggCLn?=
 =?us-ascii?Q?fuzm+o8GE6V9D+0sUmMdS8V/jyqxao0pQJIn3pUlhl1tC4gfgwXby0GfKw6G?=
 =?us-ascii?Q?wZ0V7qvaMfQ2qh6aOW+fRcc9pDKncx4WhsgilIPrivdA3njdNpHG5qPNPDt4?=
 =?us-ascii?Q?YXJahLYegRWzIm0R/T2WjABT6/MdgkfsTV1YdUXGhYFGcbbaRlZLGaldqkCq?=
 =?us-ascii?Q?G7PXOD0CJCHfERXuIjbn8nh86c97DCuhSxGRBNcS1wVUf8mXNYIwrmOt5o35?=
 =?us-ascii?Q?YL5ch6CFyTEGc7/TE+RXRStOH4HhRmibZEtxdtcQl406CxpJP2RadRGFi9sO?=
 =?us-ascii?Q?zEuH41ZrkSU1I6lP8nObsGf9uPnEMrZaN0u1OIUPlnkTjnFVwL2z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b6222c-eba9-42ff-d882-08de838290a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 17:36:33.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FisKVi3AEzkQEyykVHktEeEGNjE7WzelWCkT/4/3wkYKDmd3ejtDFraKi7bCIg26keXB53eYUmjmV9giCqUOzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662

On Mon, Mar 16, 2026 at 03:07:14PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Add a detailed comparison and recommendation of the three types of
> build-time assertion macro as module documentation (and un-hide the module
> to render them).
> 
> The documentation on the macro themselves are simplified to only cover the
> scenarios where they should be used; links to the module documentation is
> added instead.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/build_assert.rs | 113 +++++++++++++++++++++++++++---------
>  rust/kernel/lib.rs          |   1 -
>  2 files changed, 87 insertions(+), 27 deletions(-)
> 
> diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
> index 51c0f85a9014..acdfcbeb73f3 100644
> --- a/rust/kernel/build_assert.rs
> +++ b/rust/kernel/build_assert.rs
> @@ -1,6 +1,72 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  //! Various assertions that happen during build-time.
> +//!
> +//! There are three types of build-time assertions that you can use:
> +//! - [`static_assert!`]
> +//! - [`const_assert!`]
> +//! - [`build_assert!`]
> +//!
> +//! The ones towards the bottom of the list are more expressive, while the ones towards the top of
> +//! the list are more robust and trigger earlier in the compilation pipeline. Therefore, you should
> +//! prefer the ones towards the top of the list wherever possible.
> +//!
> +//! # Choosing the correct assertion
> +//!
> +//! If you're asserting outside any bodies (e.g. initializers or function bodies), you should use
> +//! [`static_assert!`] as it is the only assertion that can be used in that context.
> +//!
> +//! Inside bodies, if your assertion condition does not depend on any variable or generics, you
> +//! should use [`static_assert!`]. If the condition depends on generics, but not variables (including
> +//! function arguments), you should use [`const_assert!`]. Otherwise, use [`build_assert!`].
> +//! The same is true regardless if the function is `const fn`.
> +//!
> +//! ```
> +//! // Outside any bodies
> +//! static_assert!(core::mem::size_of::<u8>() == 1);
> +//! // `const_assert!` and `build_assert!` cannot be used here, they will fail to compile.
> +//!
> +//! #[inline(always)]
> +//! fn foo<const N: usize>(v: usize) {
> +//!     static_assert!(core::mem::size_of::<u8>() == 1); // Preferred
> +//!     const_assert!(core::mem::size_of::<u8>() == 1); // Discouraged
> +//!     build_assert!(core::mem::size_of::<u8>() == 1); // Discouraged
> +//!
> +//!     // `static_assert!(N > 1);` is not allowed
> +//!     const_assert!(N > 1); // Preferred
> +//!     build_assert!(N > 1); // Discouraged
> +//!
> +//!     // `static_assert!(v > 1);` is not allowed
> +//!     // `const_assert!(v > 1);` is not allowed
> +//!     build_assert!(v > 1); // Works
> +//! }
> +//! ```
> +//!
> +//! # Detailed behavior
> +//!
> +//! `static_assert!()` is equivalent to `static_assert` in C. It requires `expr` to be a constant
> +//! expression. This expression cannot refer to any generics. A `static_assert!(expr)` in a program
> +//! is always evaluated, regardless if the function it appears in is used or not. This is also the
> +//! only usable assertion outside a body.
> +//!
> +//! `const_assert!()` has no direct C equivalence. It is a more powerful version of
> +//! `static_assert!()`, where it may refer to generics in a function. Note that due to the ability
> +//! to refer to generics, the assertion is tied to a specific instance of a function. So if it is
> +//! used in a generic function that is not instantiated, the assertion will not be checked. For this
> +//! reason, `static_assert!()` is preferred wherever possible.
> +//!
> +//! `build_assert!()` is equivalent to `BUILD_BUG_ON`. It is even more powerful than
> +//! `const_assert!()` because it can be used to check tautologies that depend on runtime value (this
> +//! is the same as `BUILD_BUG_ON`). However, the assertion failure mechanism can possibly be undefined
> +//! symbols and linker errors, it is not developer friendly to debug, so it is recommended to avoid it
> +//! and prefer other two assertions where possible.
> +
> +pub use crate::{
> +    build_assert,
> +    build_error,
> +    const_assert,
> +    static_assert, //
> +};

Solid wording, thank you!

For the series:
Reviewed-by: Yury Norov <ynorov@nvidia.com>
  
>  #[doc(hidden)]
>  pub use build_error::build_error;
> @@ -15,6 +81,10 @@
>  ///
>  /// The feature may be added to Rust in the future: see [RFC 2790].
>  ///
> +/// You cannot refer to generics or variables with [`static_assert!`]. If you need to refer to
> +/// generics, use [`const_assert!`]; if you need to refer to variables, use [`build_assert!`]. See
> +/// the [module documentation](self).
> +///
>  /// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static_assert
>  /// [`static_assert`]: https://en.cppreference.com/w/cpp/language/static_assert
>  /// [RFC 2790]: https://github.com/rust-lang/rfcs/issues/2790
> @@ -47,6 +117,10 @@ macro_rules! static_assert {
>  /// or implementation blocks. However, it also has a limitation where it can only appear in places
>  /// where statements can appear; for example, you cannot use it as an item in the module.
>  ///
> +/// [`static_assert!`] should be preferred if no generics are referred to in the condition. You
> +/// cannot refer to variables with [`const_assert!`] (even inside `const fn`); if you need the
> +/// capability, use [`build_assert!`]. See the [module documentation](self).
> +///
>  /// # Examples
>  ///
>  /// ```
> @@ -98,41 +172,28 @@ macro_rules! build_error {
>  /// will panic. If the compiler or optimizer cannot guarantee the condition will
>  /// be evaluated to `true`, a build error will be triggered.
>  ///
> -/// [`static_assert!`] should be preferred to `build_assert!` whenever possible.
> +/// If the assertion condition does not depend on any variables or generics, you should use
> +/// [`static_assert!`]. If the assertion condition does not depend on variables, but does depend on
> +/// generics, you should use [`const_assert!`]. See the [module documentation](self).
>  ///
>  /// # Examples
>  ///
> -/// These examples show that different types of [`assert!`] will trigger errors
> -/// at different stage of compilation. It is preferred to err as early as
> -/// possible, so [`static_assert!`] should be used whenever possible.
> -/// ```ignore
> -/// fn foo() {
> -///     static_assert!(1 > 1); // Compile-time error
> -///     build_assert!(1 > 1); // Build-time error
> -///     assert!(1 > 1); // Run-time error
> -/// }
>  /// ```
> +/// #[inline(always)]
> +/// fn bar(n: usize) {
> +///     build_assert!(n > 1);
> +/// }
>  ///
> -/// When the condition refers to generic parameters or parameters of an inline function,
> -/// [`static_assert!`] cannot be used. Use `build_assert!` in this scenario.
> -/// ```
> -/// fn foo<const N: usize>() {
> -///     // `static_assert!(N > 1);` is not allowed
> -///     build_assert!(N > 1); // Build-time check
> -///     assert!(N > 1); // Run-time check
> +/// fn foo() {
> +///     bar(1);
>  /// }
> -/// ```
>  ///
> -/// When a condition depends on a function argument, the function must be annotated with
> -/// `#[inline(always)]`. Without this attribute, the compiler may choose to not inline the
> -/// function, preventing it from optimizing out the error path.
> -/// ```
>  /// #[inline(always)]
> -/// fn bar(n: usize) {
> -///     // `static_assert!(n > 1);` is not allowed
> -///     build_assert!(n > 1); // Build-time check
> -///     assert!(n > 1); // Run-time check
> +/// const fn const_bar(n: usize) {
> +///     build_assert!(n > 1);
>  /// }
> +///
> +/// const _: () = const_bar(2);
>  /// ```
>  #[macro_export]
>  macro_rules! build_assert {
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index d590f7af54bf..1857e06e51f3 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -77,7 +77,6 @@
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
>  pub mod bug;
> -#[doc(hidden)]
>  pub mod build_assert;
>  pub mod clk;
>  #[cfg(CONFIG_CONFIGFS_FS)]
> -- 
> 2.51.2
