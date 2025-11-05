Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F032C95E
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 16:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762359584; cv=none; b=VUWpe+S7joqQJ39aHqqwQ9QmQotQM3EQFy1tg/szf/2kubCtRGXGFM8IysC8vFvAbTXsxRzg+o0s6N4Yc49CvdnVbidSjaOlRbmmxEJ+T3/O/pxgm03F2lGLFRyQLMR9WP+CosYqZqlR/cHaSfkdMxN/KAnnKhSX0ts8UdQkOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762359584; c=relaxed/simple;
	bh=dbCDPBiNBhFIXFVa90JYIObrY4bveChuN5qtF9bWh4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpJsUKZyfou4xehQig01yxsoiL2C1UhDsmWBJd61hVHu9MqffcIDPyDBMZvBaTsPrfr9hN8/v1AxgrKv4tigg1QDYgoOjw/kyTs6pafrr6ArRt/JglHAKoZ63d8F1Z0AEp91AIvkhJIW2dPbl9W4gDw9lOZgZu8sNkb4psyUT0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6VBaEp1; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6VBaEp1"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ed75832448so12748591cf.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 08:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762359581; x=1762964381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clQymDoQR+usvHkNl/CVhyGiibN8/xiDUK+NJRWeKvM=;
        b=L6VBaEp139AbYfQ16aEdkVct9Kak2S/b2Uk88NehQrNflk9VdjZB2LwuPJ5csmr++7
         Ze0bd5o0h5Jj3POWq25aTaY585Rmex7mjhqV2cVbyiFItx+Ly9udMjLfu6l81ZtH2QLi
         giu+0JM8Ly2lGZEc4aZAJLm9pQyyLiWQYsy1UuraXKTFJDEef5U7TumIUnbwxHAtIB14
         jM+LnXHkh4OoPr/rXHnEuObrb2Qa3rpArg59EPpzOeU4AtZ8aFMTuNsCVt0B2hvsbKXj
         yxw94nfX2izGnBLM8lzAUcWHBY+ZnoS5/c5i4Zu4bBf+7MCxg5WtY/5huY+kd8QMkOaI
         IaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359581; x=1762964381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clQymDoQR+usvHkNl/CVhyGiibN8/xiDUK+NJRWeKvM=;
        b=NjTJYp9AMUSF9f/AL+XobYT0AEtcgrfwNpnaCLNlAwOSPZD/JfytPzItlHpIHsZqKs
         a+IzI9TSV0kHuyUARfyGZn3VEQL4kY0arFhhrw6+9YmEcg1dnqzCJuzt3/Tq5XJRWK/M
         PXnu5ybkvWnyABbZylfm9Lc4QBdKoFTuqf6EORfnco/TFuEm9ew81pT0XIsplfgIi/uG
         iYsZlTqWY8xoVu4loxj5kEtB5pt3ymlVWDwO7zH2Mk66l1uXYUi9mqGgmjbKxMt8rulI
         Y3BsKnvGZ7k2LrCQ4enAFNwt7lr0CrrbF2FNa/fVqnwYyZFfZNgV0Stdj3H7LDYge2tK
         /mVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkABGGLhscRFXB9hIMJu39ZsYUlcO6lCbu8SYaVDXRH6SlRh9HA66mIwMyohNagmffCjng3YxD/ygF/HugJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0oGS27qJWyQCFmACcUeYSr2Bjb9Oj14kdBRjyhF8iXIm4UTG
	9aBnrhWnIDPEc9dybhHjZm7DTBjWOIMolDFy9KP4SQn+bYR7pykLcPdZ
X-Gm-Gg: ASbGncsmjfNRvakW5o11f3CjTwUtV3Vl92EZ+8Hx3eKt61WF9pCex7B7kw7zz6DCCEp
	ujoM+RSNB/BgpYBL5pPfLBPC/9DE6Rt5NmBeDJh9VkAmPV70mrU2EIzLvT2Wcg44THtjSsk7Z9/
	wJDDUJxr7LnEPXQdKlcwGdDlnzXENnhnCyIOhENSrfdWrJ0/J7q4/ujODPmA3QzB45tXfneg+IK
	4iXfK0L4+VF0N53pnd36ngORQh7/1Djuy9gNxKQ6kce68n5L8Nx+mGCy86nVi9mU9XsaIk2Ui5u
	yHxBiaJ1dagRCm+MbSAOMbhw9UWq6Q68XO0hgWBIq6jP6LbybER8uVKTtUO63i96eeOzCYFLqi8
	5kIHzA1gSMipq3k88Md0XwhsDmtgmlRkBJCoWu2XiKEhIo+UKxQPIbt0cTlQ5dmUTaopubUUDIH
	DJct5Jcfm3v9L81LOfM5SNsTOyzQ/YKb92ykmnWfJmr+OVfvMHlhhHg5XLOs+osBphhoHJJ12MM
	vdvhpPWyw5XPiw=
X-Google-Smtp-Source: AGHT+IFeIwDlk5BhcPTwGQMc2c+6Zov3XxhAO1xFzBK4/C4sUxd5bsaeDEdAS/nrEvGAnEZ5XArZ3g==
X-Received: by 2002:a05:622a:249:b0:4ec:f49c:af11 with SMTP id d75a77b69052e-4ed725e1bc5mr55291791cf.46.1762359580922;
        Wed, 05 Nov 2025 08:19:40 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed5fc126f5sm39361651cf.27.2025.11.05.08.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:19:40 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D9CAAF40068;
	Wed,  5 Nov 2025 11:19:39 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 05 Nov 2025 11:19:39 -0500
X-ME-Sender: <xms:G3kLacpftsojFGksscI3MZwS-CeMn-Kq_7YZk4HW2bRSPWWto8xgXg>
    <xme:G3kLaeevH2E-q1AJa11LTinXPxhtN4NSHLtm-jcAGV3oTikw6tsB-QvAvH1Jm7ag1
    1joNQnFpJd2tiPQloEIZvT7AIDg1e8NpdpLa1bkCUgZ8bjjNiU0Pg>
X-ME-Received: <xmr:G3kLacmozBX8jnX3YXxYgPKBTVtQz9q5qaLcVgWB0K6_rq9H7bKVIzudeNApr9cX2N4-OXLHHbJyx6rHN8tzwFdgLPxctpCr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeegfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusgho
    rhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:G3kLadawwkFGei5VcSOMtYP2jALsGBqd0LAfX2AeMGFn-8AQOAhuLA>
    <xmx:G3kLaZ4lmMoimITB3nhkvN_WjZJ6P_PciFsrcfNiVzGwMiPygjv70A>
    <xmx:G3kLafDJOtFoIAphpjYTMg_DErXdHUOQoPcwu4rlfAhqqTQSWiaBEA>
    <xmx:G3kLaf-oTvphiKHFl0_1ic74NI2XxEoCtiEhSTjLb6qTFxnDXRkVFw>
    <xmx:G3kLaSGN0X7F-SrMJcBsDr83JI-aPqaMkAOpED_LcFpHdP5otjvvwT5F>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 11:19:39 -0500 (EST)
Date: Wed, 5 Nov 2025 08:19:37 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <aQt5GR019t07U0Nk@tardis.local>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <20251105054731.3194118-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105054731.3194118-2-fujita.tomonori@gmail.com>

Hi Tomo,

On Wed, Nov 05, 2025 at 02:47:30PM +0900, FUJITA Tomonori wrote:
> Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
> would be possible to implement the feature entirely as a Rust macro,
> the functionality that can be implemented as regular functions has
> been extracted and implemented as the `OnceLite` struct for better
> code maintainability.
> 

Thanks for the patch.

> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/lib.rs       |  1 +
>  rust/kernel/once_lite.rs | 71 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 rust/kernel/once_lite.rs
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3dd7bebe7888..19553eb8c188 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -110,6 +110,7 @@
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod of;
> +pub mod once_lite;

Would it make more sense to put it the kernel::sync module?

>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
>  pub mod page;
> diff --git a/rust/kernel/once_lite.rs b/rust/kernel/once_lite.rs
> new file mode 100644
> index 000000000000..44ad5dbdc67e
> --- /dev/null
> +++ b/rust/kernel/once_lite.rs
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Support for calling a function exactly once.
> +//!
> +//! C header: [`include/linux/once_lite.h`](srctree/include/linux/once_lite.h)
> +
> +use crate::sync::atomic::{Atomic, AtomicType, Relaxed};
> +
> +/// A lightweight `call_once` primitive.
> +///
> +/// This structure provides the Rust equivalent of the kernel's `DO_ONCE_LITE` macro.
> +/// While it would be possible to implement the feature entirely as a Rust macro,
> +/// the functionality that can be implemented as regular functions has been
> +/// extracted and implemented as the `OnceLite` struct for better code maintainability.
> +pub struct OnceLite(Atomic<State>);
> +
> +#[derive(Clone, Copy, PartialEq, Eq)]
> +#[repr(i32)]
> +enum State {
> +    Incomplete = 0,
> +    Complete = 1,
> +}
> +
> +// SAFETY: `State` and `i32` has the same size and alignment, and it's round-trip
> +// transmutable to `i32`.
> +unsafe impl AtomicType for State {
> +    type Repr = i32;
> +}
> +
> +impl OnceLite {
> +    /// Creates a new [`OnceLite`] in the incomplete state.
> +    #[inline(always)]
> +    #[allow(clippy::new_without_default)]
> +    pub const fn new() -> Self {
> +        OnceLite(Atomic::new(State::Incomplete))
> +    }
> +
> +    /// Calls the provided function exactly once.

I think a few more comments here won't hurt:

    /// There is no other synchronization between two `call_once()`s
    /// except that only one will execute `f`, in other words, callers
    /// should not use a failed `call_once()` as a proof that another
    /// `call_once()` has already finished and the effect is observable
    /// to this thread.

Thoughts?

> +    pub fn call_once<F>(&self, f: F) -> bool
> +    where
> +        F: FnOnce(),
> +    {
> +        let old = self.0.xchg(State::Complete, Relaxed);

And we probably want a // ORDERING: comment here to explain why
`Relaxed` is used here (because of the semantics mentioned above in the
comment).

Otherwise it looks good to me. Thanks!

Regards,
Boqun

> +        if old == State::Complete {
> +            return false;
> +        }
> +
> +        f();
> +        true
> +    }
> +}
> +
> +/// Run the given function exactly once.
> +///
> +/// This is equivalent to the kernel's `DO_ONCE_LITE` macro.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::do_once_lite!(|| {
> +///     kernel::pr_info!("This will be printed only once\n");
> +/// });
> +/// ```
> +#[macro_export]
> +macro_rules! do_once_lite {
> +    ($e:expr) => {{
> +        #[link_section = ".data..once"]
> +        static ONCE: $crate::once_lite::OnceLite = $crate::once_lite::OnceLite::new();
> +        ONCE.call_once($e)
> +    }};
> +}
> -- 
> 2.43.0
> 
