Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020131.outbound.protection.outlook.com [52.101.196.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8E0548EE;
	Mon, 16 Feb 2026 01:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771205803; cv=fail; b=eY4gFJYQhvdWSy28hPxiwo7H34Fgk2I+tXvlWT+rWo17eI13iVNhcX95JuAvZLPJDqSXhDxaqcvoHBIT6McfuCNBWFmf/iZBu/gcWWbdP3r8JAxbkdLM4XtUGF/aNmRQsD3OJ2oRvCsPMkGD2seBHpNgx5GgKijjE5LX+IA7t84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771205803; c=relaxed/simple;
	bh=L9N0Rifav+OuJBbjZfCaqr+avIycrsAenOHA83F8880=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=UDNyMjxinBZrD9qLKBlupRUZlKzGnKcvxD27ply4eKbXP16eDC5ekg+zx3uOSHRVNlZM5mFh6aHfyfTuobtUPD7IVCa0IcHUNBTejbCSkv6hXpmMWYusGJy15QvvBZZmIJjXV6QuO5t0cqKHx9DIMQ94L7F3C72ufQ3m646aPw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=M5WrkuZB; arc=fail smtp.client-ip=52.101.196.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="M5WrkuZB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/p5V7jOw3qNccwi1QLVpjtpOaBuFR2pgFsXx9z9ogrE+7AdWKLs9+Q3LWyRGog9prJ6ZJ7+3i2Zj7sUHp4y7nMEiN5YTGlEDLXaMb+wibD0dPyjr0IQptd+LpyARgjW3XMIXFlIzEpYncXWOR7CvG7snF7aRtrBkdJgSuhLm8G33zg2dazVvb/CzqbEpsAl8APfOUfP5oAHyuJdKXfQqZJG3xj30ApRIajLQfczmUXIL+S5ZZqOJyKB906Nwogsz8j7tZwKExvhYrPQOLY5equfwJN5iF0m/D4tIS2uqlujEE+egEZwjIjBQuLsi8PrqhnlkCbMXHrOfk6/8zRPnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meM3CyzTxaf6J1DAiOttMFsj/sCN+REwtgpdtOzcDr4=;
 b=wfdrQSA2emdwrktGVIP6izFveoAKfHdYQD6U0+s3AqFBvRUbHtwg/wJj2ApzcB79UA1fLiM1aHjkiw6ysbhWjFIhY69CaN4YXymZdR++UPs3wDvz999cqUDHX1XAWvvlwvhV9/q1AnS4VNvJMyM0nkaZtMZD6k/lPfOx3kUt84Qp6HvFW1IKVf0L+kJd3uvU3+m01Z3oiY7VHtlHZD+R+aNTwFA76cj2gjbnfeJ4dohyVtCy+JK3Dge+OXnhL2a6F8jLPcsI1N5ZEEa9EpDf+PetMckQH/ysVSoepTncw4KYlpwAl4crKmhOY23na+/wTlLszCoCGiUmEPMF2xIwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meM3CyzTxaf6J1DAiOttMFsj/sCN+REwtgpdtOzcDr4=;
 b=M5WrkuZBwwN2oyFTtOzT5rz6pGjdHghdOP56HaULOEqULKXvIcPbGa7Q7mDB56P1pFPFryjKX/gIFPNoxsvKDpDqFNadldWpwZ0HlbKmpAa0AEDU/aiX01VeX9VJdSlvCqZ0lFVoIQ5PWGBvJyZ6iYlzRkdtNyqDS9HUFEu2jAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6978.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 01:36:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 01:36:38 +0000
Date: Mon, 16 Feb 2026 01:36:38 +0000
From: Gary Guo <gary@garyguo.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens
 <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
In-Reply-To: <20260215132232.1549861-1-lossin@kernel.org>
References: <20260215132232.1549861-1-lossin@kernel.org>
Message-ID: <5f29715dba04c5a66195a962ffd1fb69@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0430.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::34) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a2557d-2112-4db3-cdc2-08de6cfbd434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ceHR1nGloQ9uhigMR5cOffTmFYQMdgqQRWj758c6AAzof98JujkWOXacfSD?=
 =?us-ascii?Q?CPSSRGyaf/iheDza2eM3F8DqQ15cXmmq+fxQJln+wHM1McPD/UPX3uBQsrkp?=
 =?us-ascii?Q?JSg1rBWoQ4Ft0b0YxskvJcCxjQ8BkPu/6aa1+qLbHAhJRp1dPYtRqiKDSI6r?=
 =?us-ascii?Q?GNXsciczHxaFpgtk2QG2scWabdfJfNYsPErU12IwzTAJQel8OgGCpYrVNdlR?=
 =?us-ascii?Q?vUn8wRQui2ZLsxOynmR/P9JHu5qu/Bg7zFKo0m92wBvZ3/HdWv6j25XBDJqd?=
 =?us-ascii?Q?fTCp4H5WLEIk1ffEGHEEbkOcVIVcvKCPnoQDEZBTh2qv4zosBI2+AtS/CT13?=
 =?us-ascii?Q?v/A/N/km88APcnKUZ0IwuKrFFSRvO8oPEQ5FXWM9j+QigOCYzUBGiN2+9gNF?=
 =?us-ascii?Q?aXzHa7il93LudY7s5L3CjOM4N8jdmSfWA6KygzaxigHGuX99iE5ngMPkR1oX?=
 =?us-ascii?Q?nxYkUUI0H7iCywAYRaeqCJA6VN/H423O3psGL4CcmcNklJFhcrSjY0+hHUN2?=
 =?us-ascii?Q?bzaWzVAFLzzowz5Wut+bHD6GXGRpm9JfhJECmgAW9LgOoKrsKqW0I8N2m6ld?=
 =?us-ascii?Q?FG7fFvLjpDdMSkPbyeemIB1u6CNzttXKWmhLfZuu9Aryx7nHHl/Vw4CmJ8xe?=
 =?us-ascii?Q?RZ34fPBpJLLlW0xMGfwgjUemLRavVDurz7p21rZ0iGxHgZnO5AdTNrLAvmrG?=
 =?us-ascii?Q?gduGfUdefxJAIay56cSQsDSbaP0IstEMBQy4QCkKHK7vLVSXZHq+7CkHlgww?=
 =?us-ascii?Q?IwEFM2tYgxZJnOS6Th6I9WXOngqFHp6xMpvn5aYs80FzNhIOxQUkzXjwZ9p5?=
 =?us-ascii?Q?T9DYChLOB+orqABzqx1429OUdh0pjzH8a/jFhSBfRLa8nfLLEC3BZgbFXlts?=
 =?us-ascii?Q?pXp992glQdIcGh+aFeHNqJoHKlWfCxYqbAmtYp/WlPtiC/Cn4FZI6/oM8x10?=
 =?us-ascii?Q?pf2ZzU2n7WA+HmlFKmMiCY4N8y/HYODmyog/52gvwyuQaiUAm4p1J4WPrwyG?=
 =?us-ascii?Q?AngKtsBZhOQi2zc/CMm27cEgVraZXjHYI6d6YJQ6U5LnLmidf/5Pi4zz2F8b?=
 =?us-ascii?Q?3fpbmaDCNMY2tFbdOjgvkGx/CaxHwwrqh1xbEKagyQ45Wk65KI2BitvzxwZS?=
 =?us-ascii?Q?VztJ+Nl+DaL/shfuJsvt3YZZ2zTbZ+9u4YaUFedxvASZ0Grr4vz2m2BS2miR?=
 =?us-ascii?Q?LySOgpqPnpOW57wl6s65fmc2HggNwjFYBtL9yx6q4GvL+Yx5Yaf/yAUbKhK+?=
 =?us-ascii?Q?DjxgJyg5YdQT43TYlnUpXaV4uzylrT6wENbQyOXkkFgZjw4gQxq7UODplIcN?=
 =?us-ascii?Q?ltsBqZdiNc9K2A4DDWKxNxRoT+Cyp020hErPG16iQ7+GmJ+rpAU1PK/6xiuL?=
 =?us-ascii?Q?6Tq05/C7GCvSdn0QZrqJQPcS3ML6bi2Uk62h24a3rgmuIBwONL+LROCw2K4c?=
 =?us-ascii?Q?2lwXdrNWMLGpNf4LUWPtvw30lTohmSb+aY/lUY6/IUAMrHshN10z+MtqlVMg?=
 =?us-ascii?Q?MgLZH8l6OcZgyfz6n9keBdbmrog+h+utDQOVOxa4IVbFYW2IHZCrL5uQ4gMs?=
 =?us-ascii?Q?Idj4sQapdjRHtQutpLI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nR24TfE+enxc49sfqgzTlaEggceSQMHe4mUBNv/IObg2blLYrisW84cZryIg?=
 =?us-ascii?Q?umymIUU716n7fOGbZU9cilqY1BycH8oqoyID9sXIVYKjwJtNIHlr5N5VMauL?=
 =?us-ascii?Q?RbYZ/Fz/Mys1zIJjpvQgmwTmljM23c24PSu7A7iZTfxJDoV0lFArWJ/gDpua?=
 =?us-ascii?Q?s4BpvpKfLyXICTFnY0vP4E6992hZW2mWliFeShLhEkk3RhZsf6LZTS4tILLJ?=
 =?us-ascii?Q?aVEb3AJCI7vBiasGAoTziLZ87GCE5EcKeOD/hKUxOG9mwlMm9gy+nn1T8bwR?=
 =?us-ascii?Q?g9pvttpzMQhvQU5d9NgvxxX4O8FiVbvbgbQvV+bB2aurw+/8wex6jCWltWOb?=
 =?us-ascii?Q?hV9goGNxVnhvsbjsRnyoZbZoD4ggJiEDeH2xwiluEmw49v6aEFMAoMayELMB?=
 =?us-ascii?Q?GpT8gl9jFWqzmTaiEqX+f9QV9by7m/9LwaX4R9wKoOA+0TJ+PsZl3ply9T2Q?=
 =?us-ascii?Q?61N6GBv5/k0Cphm0xiWBu/wk0PaoTNeWEzDPeHZYdEIqy/pD/5WzduaA1IOn?=
 =?us-ascii?Q?gZxVIy/GfmeAKVx4HzRM4YX9ajoesuAgBHfHQi7OXcWCnGg3XdHG+zTteLNx?=
 =?us-ascii?Q?/pdOUkPzWI1fLBv1PhAa6HnWiPnolqf8nmw5qrBjpB/A5XWt+le3WyHiTiBI?=
 =?us-ascii?Q?2JzmAeAUf8WpwLUSkHqpcyuITS/QEVEF4IdT42V3CZ5cFrjuRP1QurnBfsxJ?=
 =?us-ascii?Q?zvdc1eXYY4kxCjHPVvGUlaCovCbBIfXewrIz3Mksj3YPasPvhwu8KeUHPzUx?=
 =?us-ascii?Q?pmHSD4LVh8FFiPK+nEqvWja5iD80mLcaJTQT9WnG68TjRTFTnN72TC8UQdxx?=
 =?us-ascii?Q?BYGbnsJme4k2QPBLd5k6H5CkNNjOfUzvhEh2Huywr8Oe2awC5C4a72MJDAsm?=
 =?us-ascii?Q?aJ750WaYYD23AzztYjobslfkRpzvgMQ6fFjy4CmFchoDDyv0tlV/OrlFxxy4?=
 =?us-ascii?Q?6ar3SR/7P7W8tHr79Mp78QLvcoj577MxfXACyU3uiYQT9gKS6mO7VenNAEyO?=
 =?us-ascii?Q?feBHdAI7rMLwF91yw04fLDVlja8eWcoCTr0W6hMD1EAab+KzKtrgKrHsmerB?=
 =?us-ascii?Q?aYiwZx53dTSOYT0YdjJz4FEERNQcqOY/sSWd/oQwCtORrmjcFsq+Zg3qtha1?=
 =?us-ascii?Q?WVctIepAd09qTpInlPbi1OqUCNt9ElFJIbgGDqfUCuDCjpCJZHak++f1JrKE?=
 =?us-ascii?Q?lytnyZo+E0/C+cmFhbyDTw8EDDWIqTB5vqLOh536nipTxdbykiIJGm+Z3bT+?=
 =?us-ascii?Q?Z6aGgrf84bAG5xMWuEjEamGOSAVADPtmmBFEv/fSBMT+wyw+gtcjO6+T44D/?=
 =?us-ascii?Q?xwQhKcPvQ0jhs0AJ0Rxk0cpbwkv2JW8xCxZvOiZMqPcGf5mvtpff/DL+WsD5?=
 =?us-ascii?Q?54UfE5UsirfONeBj+jQEduyPJMDELYYx4sMr61Pl/hmlZXmOKeGGOk3xZdui?=
 =?us-ascii?Q?6zA96OzfNeuwUd6tuCbQgYsGSD5r20i+PQXbSR66J4IRQkRuvPGbrM4IcJRf?=
 =?us-ascii?Q?FZ9Z2AuTn/pyVerpI8H0lpZ9uTyIDoDPuVhINaY7NpQfVwA/SyWFPiFqGU7X?=
 =?us-ascii?Q?LvO9BIcsaP74hrea1R8BmaYvFYFAizg8G58VDsNPLi3a19Ath1BymmRTzMaq?=
 =?us-ascii?Q?fhnoRpyJiIO5S4E9vB9SE9kVHxqdZBH0ul7qVaR87ZOYgFT1QbRELroxA7mE?=
 =?us-ascii?Q?14LS1lNX50omOH1ZprJ0MRL98Hp8qeUqQ1o7zuOVUIVx+MEl0B+4xr1CKqPt?=
 =?us-ascii?Q?YywTEqIWrw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a2557d-2112-4db3-cdc2-08de6cfbd434
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 01:36:38.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98zyV6LI3teC8ftWSaGmSV6VYlj5JT4MdTCW3JuvyIsuECWES1nDUsnQWY+8H0FITQW0FwSzS9e8vRC2kqmmRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6978

On 2026-02-15 13:22, Benno Lossin wrote:
> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
> warns about the `let_and_return` lint when a comment is placed between
> the let binding and the return expression. Nightly thus fails to build,
> because the expectation is no longer fulfilled.
> 
> Thus replace the expectation with an `allow`.
> 
> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
> Signed-off-by: Benno Lossin <lossin@kernel.org>

I think it's worth adding a comment (or reason) that this is no longer needed after 1.95.

With that:

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/pin-init/src/lib.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> index 49945fc07f25..fe4c85ae3f02 100644
> --- a/rust/pin-init/src/lib.rs
> +++ b/rust/pin-init/src/lib.rs
> @@ -1143,13 +1143,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
>  ///
>  /// - `*mut U` must be castable to `*mut T` and any value of type `T` written through such a
>  ///   pointer must result in a valid `U`.
> -#[expect(clippy::let_and_return)]
>  pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
>      // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
>      // requirements.
>      let res = unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) };
>      // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
>      // cycle when computing the type returned by this function)
> +    #[allow(clippy::let_and_return)]
>      res
>  }
>  
> @@ -1159,13 +1159,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
>  ///
>  /// - `*mut U` must be castable to `*mut T` and any value of type `T` written through such a
>  ///   pointer must result in a valid `U`.
> -#[expect(clippy::let_and_return)]
>  pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
>      // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
>      // requirements.
>      let res = unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) };
>      // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
>      // cycle when computing the type returned by this function)
> +    #[allow(clippy::let_and_return)]
>      res
>  }
>  
> 
> base-commit: ca4ee40bf13dbd3a4be3b40a00c33a1153d487e5
