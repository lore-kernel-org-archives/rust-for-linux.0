Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA224C93
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rwp+jxjw"
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD7BC6
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 07:34:59 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so31955a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696948498; x=1697553298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjmuT6KaUq06+aqXLtqrH5SPglMZ98Jy4h+1+Q+YBNc=;
        b=rwp+jxjwezPH6xO+U28gWAQU+uhegxu/Djt8hX9aIUxehewzifrqnG2VAfL8+TmMHZ
         U5Ge8RDily8shnrmAia4uUBOVK9oz9rSwakB4l2HNBnwe4fsgRIxejQ5CjyEO7YADwpS
         2MKjWenZzT6kEY6qgWn08JS7/5rR9t4t+IyJ8OFnNqp/gNIFMGrnFCjQZje86UzmKR6t
         rwgQWR9F2iKAynUw+6zPQ/ZrmqtNoAM1m32120tf0xvJeA2fvL6lmaCJKsToxGhwHNUR
         dzMOOzgiDqVItY/qt0CPAt4VVM0DAc9NxUsVt38oq8qDOdsr2IMFtWN1ZmLBtIy0ONqI
         ZU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696948498; x=1697553298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjmuT6KaUq06+aqXLtqrH5SPglMZ98Jy4h+1+Q+YBNc=;
        b=JGxOIdvJRxLDTJoCdaFqnLhCDX6/LZpybw5Mt/mkZuTPexxzSjNniLViUwnEfk+VsE
         mJvvYNSRJFkAly/90c3D5x5472Qq8QSY5mMwIzvrZZZSFwArggqtsiE27dZ3Pt2DPmHq
         WHSDRWYc6qE6prcZT+EWS3t4fHbhuWa0AVxqSTjDUcesZ4iM6wvcnLY6LmwXbCPWgEwc
         aYUDntA35TnQTA4l9omtJj2uSMEfSssl3roYELwFTwHGld8zBpKRDVE8QOvAKqguZlbL
         +ZM3TAAxGW30XlWoYaP3uiJ2Cr973sVPoqft2jlEWkChJ2morMpImoxKHs1/7q/rU3kL
         SIIg==
X-Gm-Message-State: AOJu0Yymxu2iMCsdI8yRGte7WMRsNyLOs6MOKJIbOnlHPefkNH6ywngK
	DPdhDjYO4+NYBSHhhW0f3yQNyhMmG51Dj1rzW7el2g==
X-Google-Smtp-Source: AGHT+IGYWhYUER+OacV692wanKb/B+qx+kAYv970tOXlJ1xcZWj7p+K0CJxIFI02U0udBGaY0Mku7FKrvWKPcsayFWY=
X-Received: by 2002:a50:8756:0:b0:52f:5697:8dec with SMTP id
 22-20020a508756000000b0052f56978decmr579701edv.4.1696948497945; Tue, 10 Oct
 2023 07:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009224347.2076221-1-mmaurer@google.com> <20231010081220.GD377@noisy.programming.kicks-ass.net>
 <CAGSQo01=NRosJCzRCWcqZfvdHzH+d6dThN02SpvkF2EHsFXD-g@mail.gmail.com> <20231010142448.GN377@noisy.programming.kicks-ass.net>
In-Reply-To: <20231010142448.GN377@noisy.programming.kicks-ass.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 10 Oct 2023 07:34:45 -0700
Message-ID: <CAGSQo03wwtjzba-W9Vs4gOW3Jin=dnC937hNijxgHEd-jDev6w@mail.gmail.com>
Subject: Re: [PATCH] x86: Enable IBT in Rust if enabled in C
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 7:24=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Tue, Oct 10, 2023 at 07:06:32AM -0700, Matthew Maurer wrote:
>
> > > > +KBUILD_RUSTFLAGS +=3D -Zcf-protection=3Dbranch -Zno-jump-tables
> > >
> > > One question, -Zcf-protection=3Dbranch, will that ever emit NOTRACK
> > > prefix? The kernel very explicitly does not support (enable) NOTRACK.
>
> > rustc does this via LLVM, so its code generation works very similarly t=
o clang.
> > It does not create its own explicit NOTRACKs, but LLVM will by default
> > with just -Zcf-protection-branch.
> > I've linked a godbolt showing that at least for the basic case, your
> > no-jump-tables approach from clang ports over.
> > https://godbolt.org/z/bc4n6sq5q
> > Whether rust generates NOTRACK should end up being roughly equivalent
> > to whether clang generates it, and if LLVM gains a code generation
> > flag for NOTRACK being disallowed some day, we can pass that through
> > as well.
>
> IIRC C++ will also emit NOTRACK for things like catch/throw and other
> stack/scope unwinds. Obviously C doesn't have that, but does Rust? (as
> might be obvious, I *really* don't know the language).
>
That's fine - Rust does have stack/scope unwinds with the
`panic=3Dunwind` strategy. In the kernel, we use `panic=3Dabort` and are
unlikely to ever change this approach. There are a host of other
complications that come from unwinding without NOTRACK getting
involved :)

In case you find `catch_unwind` - this function only has an effect
with `panic=3Dunwind`. When `panic=3Dabort`, there's nothing analogous to
catch/throw anymore, and `catch_unwind` becomes a no-op.

Are there other features you expect might trigger NOTRACK?
> ISTR HJL had a GCC patch to force-disable NOTRACK, but I've no idea what
> happened to that.
>
