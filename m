Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B13A542B
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526884; cv=none; b=neYurXiVlVU4jsv+stjLjGVCtvmUeQ2ozvbR9ydIqgxs24W6g0w4hyPnqKxLnQzkUU6+xXM9nXCcXo0iXXKLhMFaAjSnQK0SEObR90Y3muYWK2nuV5u/m2nymlcxuiMO/tWou22IF5NrAKcw1PJaeuL2a1iEKhJWyYP/aWz3Vm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526884; c=relaxed/simple;
	bh=SWVYMckbacJh29FSFJBWLNf5Rf5W1hqFhU59RjFNOgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl2vnyhIQRax0R7gYv+HtKopv5QOaEU7/14FgBGLOAHYkkLUXIRsczdo2Fv1Ps967O9vwiPXZKak5VwMeFGCNdjdjKSu6OyD0s4pMbRx1aY/r+Tl4hlnp+8NsBiq81FlZRScpNW7lyhCRKy/GVHvgFWYKMOcBU+VBUygSU+BASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEdJJyvq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEdJJyvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49571F00A3A;
	Mon, 20 Jul 2026 05:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784526868;
	bh=40nBpOZze2riv2zUWEZQVlKjpZfLyhH/eQeG3n0l3JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JEdJJyvqrgXpzhXIJhymr33FXdbGONzfchN25EvLZwyysmg5VXsHuRwdOi4SqqaMX
	 cxPScqcjHI/ugzl7jdBV7NDah541JPMLonT21v6P+hWbBF85LwWZSGyFcYzvjZrT8S
	 BEAiUk4XcqClIifVXjJ6LO6JMGcim3doKn0/QGFrJnjH1dOCbM9geB0XseflxXZYbL
	 5X8fOVt+cCHlOqHkjoHII/Owqb8fM4KDkq+nGsZXygNm/58dgtomL6Epmms5aUwY/8
	 vQ/4+gR5kBQQrR+rRCdOM1UWugAZOktLQWH6UprKLFXll/NoRVbQmB9J++ykxHaORL
	 Vftzyr57mHn5g==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id BE1DCF40075;
	Mon, 20 Jul 2026 01:54:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 20 Jul 2026 01:54:26 -0400
X-ME-Sender: <xms:Erhdarql61v3Xz59-imjyZ0GbrjmkYsEBeXywcCBoVIKuZn6f3Y5ow>
    <xme:ErhdakLqOM0exNk8RwcgoDiQCj04pUEsgqbjJadLDRV3PEwLRaj9MaMRc9Af5DLeb
    -ePqKFKkT1aKRU3fRavaDB9r4nHdRu59qq7u4D0cgPsm0lORlbFGA>
X-ME-Received: <xmr:ErhdavAlhyphVm4nM74w4m3NIX2vJCvyML3yt3U7wKavnIkGvqsBj9TTuippIQiBCNiJOrpU942sh_EktRyEiew5iwgt1oz7qA>
X-ME-Proxy-Cause: dmFkZTGVBsJIK88tZgMW/toICatrn7zGwvuRVO4cOqPY6v6p5fp9qQ2OTgpY4WAPlaV8B4
    vP0SVA+v8yQg88EdJAXiPfjCe+kSaHHoaqDYkWlVdNFfofjfCIbIxOjaiRbMV6Im7H1lPM
    r2DioXt5vHsBC9EEI6uAFOIkDaO1eqpcXlEN0TpGaiHVC4bw/jhassAQxG50I4bLwSNz6r
    Z0QFgG/z9iJUDZh196xBMhg6aXlrzNENQYmjJ3QbSBACJR+IsQvdVzRqwPlB7YJowphxpR
    B6xHHQKREj0ere3aS2RE2doKO9N3+sItNqBsP55eT3sOtB+y0dX9L2HObFgaSbcmTeJhF+
    TPulJVNUNEeUq1MAb1LDBSYtsapv6g2vTClGbERSji2nHEVYnaavqSG6ohzWq0MefJyEqT
    nKbi8hvOjnsQhN5ON4EZH780QQeE6/YSdxA/YIwS5UaA4JcYMq3WKKnsR9qoe6fSi8INDE
    469V3IF/PatoBOslOaBp07jxDu2JgRFiUxiRHsfqFJTXO9y79tMz+fUq0zn0ioH7I2jF3+
    SVXc+Am2KgIKqdW/Sqhq/rFb0L6cbZJDQP1+K6QwrURe8ZRFYWLKiuoGt21aF7fl1kfEf4
    kB78+e89z20YPyjHZjVc2q91SogJWDnvk5f9mHQRWSjZ+A6DYujo5SFcpmgA
X-ME-Proxy: <xmx:Erhdau4SR3KX-UGdq7nDcQve5UL5VOkFxTzp4T2oRt8d8Yirl2MJrw>
    <xmx:ErhdajEhrCraT6RDhvyyBTnB8XbfDoC2-bAlo9MABOhLTd9ocqbq1g>
    <xmx:ErhdahSmgCRST5nUXrx3Q2uNEqpJoFZixICQDD-yWxYwkNpEX8yffQ>
    <xmx:Erhdale0GXHL6_rzDbov6YMxAVSMlk0GxTly_ui3M-GnAB6LVQ1ChQ>
    <xmx:Erhdavi8rZ_6WPJxR3jR3AmBcpLh4WVg7oX0POMp8jBzR2reWo8-Q5l5>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jul 2026 01:54:26 -0400 (EDT)
Date: Sun, 19 Jul 2026 22:54:24 -0700
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org,
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, paulmck@kernel.org
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from warn_on!'s
 flags constant
Message-ID: <al24EJhLfbSoooSQ@MacBook-0RXW5>
References: <20260720035510.4048145-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720035510.4048145-1-tomo@flapping.org>

On Mon, Jul 20, 2026 at 12:55:10PM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Fix the following dead_code warning on some configurations in an
> atomic development branch:
> 
> warning: constant `WARN_ON_FLAGS` is never used
>    --> /linux/rust/kernel/bug.rs:126:19
>     |
> 126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>     |                     ^^^^^^^^^^^^^
>     |
>    ::: /linux/rust/kernel/sync/srcu.rs:106:12
>     |
> 106 |           if crate::warn_on!(
>     |  ____________-
> 107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
> 108 | |             // and `srcu_readers_active()` only checks the active reader count.
> 109 | |             unsafe { bindings::srcu_readers_active(ptr) }
> 110 | |         ) {
>     | |_________- in this macro invocation
>     |
>     = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
>     = note: this warning originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> The warn_on! macro always defines a WARN_ON_FLAGS constant and hands it
> to warn_flags!. On configurations where warn_flags! does not reference
> its flags argument (the LOONGARCH/ARM variant, which only calls
> WARN_ON(), and the !CONFIG_BUG no-op variant), the constant is left
> unused and triggers a dead_code warning.
> 
> The warning only surfaces for callers inside the kernel crate itself:
> uses from other crates expand an external macro, so the lint is
> suppressed there.
> 
> Rename the constant to _WARN_ON_FLAGS so the underscore marks it as
> possibly-unused, matching the existing _COND_STR constant in the same
> macro. The name is still referenceable, so configurations that do use
> the flags are unaffected.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

[Cc Paul]

Do we need a "Fixes" tag here?

FWIW:

Reviewed-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> ---
>  rust/kernel/bug.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> index ed943960f851..2fd7ee25abcb 100644
> --- a/rust/kernel/bug.rs
> +++ b/rust/kernel/bug.rs
> @@ -123,9 +123,9 @@ macro_rules! warn_on {
>          const _COND_STR: &str = file!();
>  
>          if cond {
> -            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
> +            const _WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>  
> -            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
> +            $crate::warn_flags!(_COND_STR, _WARN_ON_FLAGS);
>          }
>          cond
>      }};
> 
> base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed
> -- 
> 2.43.0
> 
