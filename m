Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92F143725
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 22:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731192981; cv=none; b=KASnjIhqgZjMsmXZMszRVLdOpUtadZP+HRFuRwf/O12gH+yylE3yKOq9xrWpcGzU9nbOGFLOUgjtRlxEx9zIrvJUm19f69n7tmFqWUwNRm+IgWvDFn2rs7oiBoX2nxKpb9Tpf2n8YrYuTGQuZTJXNgyQuR19sHbUO+2thz2YkM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731192981; c=relaxed/simple;
	bh=P+D6x1BnxiLzSb8sxPCDveCp6Rs+ti7XVuSAKimttNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlNtktQmcYTgRf/dAwrdCW0tzQ0F6o85aQcc28khrE0rHDv5pOscvsGY2D/hcAKO00NAGeZ3cT+Xs5tDCKYyppU1xpWGRIOQcjdJT3ZtFoVMsIVs20UZHjoDf6WI5FXPkJfgDbgY6cZzAmJdo7s/ZgLhUpLudqKPHVoJoaSx5qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ce9Sj5If; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ce9Sj5If"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cbcc2bd7fcso22237516d6.1
        for <rust-for-linux@vger.kernel.org>; Sat, 09 Nov 2024 14:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731192978; x=1731797778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2S47meCWaQQ1uv98U0ntjdCH75dPCt5PUycqnq47Tw=;
        b=Ce9Sj5IfVhslkoQdasiPqOxBrIQsaATLVY1EkejcvyHvpOGfNL8/NEDNLxIvmSlxFm
         v6+himD2R+NuGnggTJfVl+ohOZkD03WKD8aSOSikps3wc8lLEdpQQCWeqaZFLAaqLxJW
         VwHP6VKHGNQ70kbEQx+WrsnT3qY3wlPAC6G6If11mxmJElU6n4sa+BdHxW6/VlIVSyVz
         j+Wgz5Rg4q7HAfRvJvyvjL0NISKnaC/XFC4FobPG5iTmN9SiVOUZyZAjmKkNktPVTgz/
         NoFZO2ERha+DnrAUw9oeELRqf/+1w82jxFI2nLg6BZZ6x4u9DfuhZfiv7D64+5qDPiS7
         sWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731192978; x=1731797778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2S47meCWaQQ1uv98U0ntjdCH75dPCt5PUycqnq47Tw=;
        b=OyLvsymfKxXsiO5mcCVDBragOh6PtNnrkqpQbxnfwfJ+2hmGEIIdSkedQdqqKZVRje
         KszpOWx/Vwea6/LDV+f6wU/wZErLPWYq7wPfThznoBEkap1NU8m08Ycplt+eGOuo0fiL
         LExF3Et47OLrEX0btxJebuhwnXriXJNb4/IAKeINO/6QQl1VPjXR/OqKOtqCfo2Lq0M4
         8bYbDIQpyTnNFT8MNUjCm8gOiJcCGV8YGqSPQeEOntwwNcqwbUUA2jSdwgVq7LbXow3M
         lO+/Iz2evS0qWFH9O+3zQb2vLahL26Jo1RJUpF5Ad/C+a8qNpZx95oMZZwPdYBWq6d2D
         B72g==
X-Forwarded-Encrypted: i=1; AJvYcCWWpZnqhIQUZLgLGJB+m7/pdbBYGPZpTZshkqeUlpKfK9bBtETqzXZDf7wELNAVTsBbTk8r9ffWTvItR3s2ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2F5YWSm0K/VpsUbaThxrfGbNbvZEs8uxcodDnkBsw4Zyy9o6
	g/lLgx+WNAr1I/JBACBmZu3JtDi2bJlLm2mI3KYcDDauzp6ORN5l
X-Google-Smtp-Source: AGHT+IHdpih8V6b6J31UOHSAa10QpABOgusM2Fgbf5lcuCY7yKEPqAT1PMBsSH667r9wtxAu5871UQ==
X-Received: by 2002:a05:6214:3217:b0:6cb:f16f:65d5 with SMTP id 6a1803df08f44-6d39e120db9mr109641736d6.12.1731192977770;
        Sat, 09 Nov 2024 14:56:17 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d39664284dsm35517126d6.132.2024.11.09.14.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 14:56:17 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9F83E1200043;
	Sat,  9 Nov 2024 17:56:16 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 09 Nov 2024 17:56:16 -0500
X-ME-Sender: <xms:kOgvZ5SPt0y3sg5zkYuF39_e3jhU0LutEvNTlz-EDE94NMJKJDiuyg>
    <xme:kOgvZyw2jZEZZ8Ff_ttGHfex-LO5-vsHyZ8eO0Gmm2Y68PI1GPhbYNOvOhTdJ9lNH
    eSADwOcE84v-XcNJg>
X-ME-Received: <xmr:kOgvZ-3wu-cmsdsbq6ITdk4YzSsF3nK0N27tuHhjuD4OfOXzV9bOkXEcuYNpJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtdelgddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecu
    hfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homheqnecuggftrfgrthhtvghrnhepieektdffjeffvdefudeiiedvfeekudefkeejvddu
    teefuefgteekgeeludeiieffnecuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorhhgpd
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudefpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehjvghnshdrkhhorhhinhhthhesthhuthgrrdhiohdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgi
    drghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihg
    uhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrd
    gtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhr
    tghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhs
    sehumhhitghhrdgvughu
X-ME-Proxy: <xmx:kOgvZxDv2WpRolj2GaG0NXAKok3sI43OdxljKjOp8OaGBdnim_QKeg>
    <xmx:kOgvZyjulsqgXcCakP13fYEBE9Ivp3AA1gVCmJFExEwBHmfMy_1MKw>
    <xmx:kOgvZ1rzAZqrUG7Y5rVG8EhOk11v-gQQHQMJc8FRsIXvTc-ozZWaPw>
    <xmx:kOgvZ9gKDSkxXUIkJmH5b7BFGBL8uN6jDo1NqR9h5teaRA4GEy0SvQ>
    <xmx:kOgvZ9R6HIrM-i1eKeuuLxipeddfSfbIIBmk8mUiwiSQibykSKTtGaPD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Nov 2024 17:56:16 -0500 (EST)
Date: Sat, 9 Nov 2024 14:56:15 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
Message-ID: <Zy_oj_k-qUPLSVEr@tardis.local>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
 <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io>

Hi Jens,

Thanks for working on this!

On Sat, Nov 09, 2024 at 09:30:07PM +0100, Jens Korinth via B4 Relay wrote:
> From: Jens Korinth <jens.korinth@tuta.io>
> 
> Add do_once_lite macro that executes code only once.
> Has two rules, one with a condition to replace [`do_once_lite_if`] in
> the kernel, and one without.
> 

Instead of a do_once_lite macro, I suggest that we implement a `Once`
type similar to the std one [1]. "Doing something once" doesn't need to
be implemented as a macro or relying the static memory allocation. I've
checked the usage of section ".data.once", it's only used for reset
WARN_*ONCE() state (see clear_warn_once_set()), so we can have an `Once`
implementation, and mark it as `.data.once` link section in
`pr_*_once!()` like:

	macro_rules! pr_warn_once (
	    ($($arg:tt)*) => {{
		#[link_section = ".data.once"]
		static ONCE: Once = Once::new();

		ONCE.call_once(|| { $crate::pr_warn!($($arg)*) });
	    }}
	);

With this `Once` type, we can do other things like waiting for some
initialization to finish. We can put the waiting as a future work, since
`pr_*_once!()` don't need it.

Thoughts?


Another meta comment is the usage of `AtomicBool`, please see the LKMM
atomic patchset [2]. In short, we won't use core::sync atomics in
kernel, instead we can only use the atomics implemented by ourselves.
And we currently don't support `Atomic<u8>`, there requires some work to
get that done.

The other thing of using `AtomicBool` is that it's not the most
space-efficient way for `Once` (if xchg() is used) on all the archs that
support Rust in kernel. RISCV doesn't has a byte-wise swap, so the
implementation has to simulate with a 32-bit or 64-bit swap + mask,
that'll be totally 5 instructions, and each instruction take 4 bytes. As
a result, if the `swap()` is inlined (which most atomic operations would
be for performance reasons), you save 3 bytes by using `AtomicBool`
other than `AtomicI32` at data section, but you pay 4*4 extra bytes at
the instruction section compared to using `AtomicI32`.

The solution could be: 1) forcing the `swap()` to be a outline function
call, or 2) using i32 insteal of bool for `Once` on RISCV. Either way,
I would like to see this being taken care of, and you could share some
results of the space cost from the solution you finally use. Thanks!

[1]: https://doc.rust-lang.org/std/sync/struct.Once.html#
[2]: https://lore.kernel.org/rust-for-linux/20241101060237.1185533-1-boqun.feng@gmail.com/


Regards,
Boqun

> Signed-off-by: Jens Korinth <jens.korinth@tuta.io>
> ---
>  rust/kernel/print.rs | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index a28077a7cb301193dcca293befb096b2dd153202..9c7434b221984ad325138e5dc90ab4340cd0be2e 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -414,3 +414,37 @@ macro_rules! pr_cont (
>          $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
>      )
>  );
> +
> +/// Executes code only once.
> +///
> +/// Equivalent to the kernel's [`do_once_lite_if`] macro when called with
> +/// a condition expression.
> +/// Public but hidden since it should only be used from public macros.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::do_once_lite!(pr_warn!("warn once"));
> +/// kernel::do_once_lite!({ /* perform_complex_test() */ true }, pr_warn!("warn only once"));
> +/// ```
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! do_once_lite (
> +    ($e:expr) => (
> +         $crate::do_once_lite!(true, $e);
> +    );
> +    ($condition:expr, $e:expr) => (
> +        {
> +            #[link_section = ".data.once"]
> +            static ALREADY_DONE: core::sync::atomic::AtomicBool =
> +                core::sync::atomic::AtomicBool::new(false);
> +
> +            if !ALREADY_DONE.load(core::sync::atomic::Ordering::Relaxed)
> +                && $condition
> +                && !ALREADY_DONE.swap(true, core::sync::atomic::Ordering::Relaxed)
> +            {
> +                $e;
> +            }
> +        }
> +    );
> +);
> 
> -- 
> 2.44.1
> 
> 
