Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA0D24C67
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DJZfdlVv"
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFB691
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 07:06:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so31363a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 07:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696946807; x=1697551607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snHcN93gkfPlnwzR9HtGrNjopcC++Hr98wY8FskSEf0=;
        b=DJZfdlVvANys9URU2brHpA6aKsue3PL343CI23THDgwzku2VoC9BlZYjQ1WJRsmh0P
         uHoSIZ6Fv1jP5/vVbiH+Jb9LOz+ZEgi213KVQOHHVEAfB8c0t2RlchQHgFC2H68fz6ua
         UgPrmzmLp7XQ1pKfjpCbR3emuBENrN4Iz1gCPeXfRgqAKkSF5AYoRTGO0yGqk5U77Kww
         9frwvYTU3jvQCfrM39ydrgL081CYiwd2mvSh8vXME40gKE3pATx76QoDUQrSabh6LliS
         Exh/uKEsVd01SzMrYjVqtGRADTHl/NtJzBuYwR/xAMCmgqgWjJ/4XTTantIrKeIxVIJU
         34Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696946807; x=1697551607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snHcN93gkfPlnwzR9HtGrNjopcC++Hr98wY8FskSEf0=;
        b=YBwg/IgS8M1kUtIFOPSUbOx22zfgEwzB3+elTSnkZVj0lOivbkaD35CsfiM538SieA
         rblt4HLtBa+oQNHAbmB3TpIjUwEXECGqCQbDvdfzHKQHVZvwvMr4ZftNJtDd6AutfpWq
         t3XVjaMxs0GqWMBvZJjekXI5qC1ICycJou3MHf7ftgclfNx82lWoS7p4IscE5EK6ygQ4
         lyyWJBDR8MORicE9cdtIXP6gjgY3jjZF1EwTJtvKCA6FS8hMkgfrO5nzHBsC1pYxBAZ2
         L3tptt/2NVAIsKtilEPnWkS2u5lBxWvzcXq7kN/5UZR18PIh97D09xrCFkkXh/4F6TrL
         1F+Q==
X-Gm-Message-State: AOJu0YxF38v1+DOWNtya0gWiXbaz9bRfUEUNhLBDd0WPL9hoIhgvYHRr
	zTcWLPWSvTdgDg6z2RfO42jLltJ9PdQ3/sWZWVJ9JQ==
X-Google-Smtp-Source: AGHT+IGhgYC9o04ElLjNHbZ2u4m63PnEKaWZIrLOPVKNcvIDlwHFQ8lnBKo+rXdUr2VXtPbhF8tikcDCOfD5JiS8q1E=
X-Received: by 2002:a50:9fa4:0:b0:538:5f9e:f0fc with SMTP id
 c33-20020a509fa4000000b005385f9ef0fcmr532198edf.0.1696946806732; Tue, 10 Oct
 2023 07:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009224347.2076221-1-mmaurer@google.com> <20231010081220.GD377@noisy.programming.kicks-ass.net>
In-Reply-To: <20231010081220.GD377@noisy.programming.kicks-ass.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 10 Oct 2023 07:06:32 -0700
Message-ID: <CAGSQo01=NRosJCzRCWcqZfvdHzH+d6dThN02SpvkF2EHsFXD-g@mail.gmail.com>
Subject: Re: [PATCH] x86: Enable IBT in Rust if enabled in C
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 1:12=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Oct 09, 2023 at 10:42:54PM +0000, Matthew Maurer wrote:
> > These flags are not made conditional on compiler support because at the
> > moment exactly one version of rustc supported, and that one supports
> > these flags.
> >
> > Building without these additional flags will manifest as objtool
> > printing a large number of errors about missing ENDBR and if CFI is
> > enabled (not currently possible) will result in incorrectly structured
> > function prefixes.
>
> Well, I would also imagine running it on actual IBT enabled hardware
> will get you a non-booting kernel.
>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >
> > Split out the IBT additions as per
> > https://lkml.kernel.org/linux-fsdevel/CANiq72kK6ppBE7j=3Dz7uua1cJMKaLoR=
5U3NUAZXT5MrNEs9ZhfQ@mail.gmail.com/
> >
> > arch/x86/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > index 5bfe5caaa444..941f7abf6dbf 100644
> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -81,6 +81,7 @@ ifeq ($(CONFIG_X86_KERNEL_IBT),y)
> >  #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104816
> >  #
> >  KBUILD_CFLAGS +=3D $(call cc-option,-fcf-protection=3Dbranch -fno-jump=
-tables)
> > +KBUILD_RUSTFLAGS +=3D -Zcf-protection=3Dbranch -Zno-jump-tables
>
> One question, -Zcf-protection=3Dbranch, will that ever emit NOTRACK
> prefix? The kernel very explicitly does not support (enable) NOTRACK.
rustc does this via LLVM, so its code generation works very similarly to cl=
ang.
It does not create its own explicit NOTRACKs, but LLVM will by default
with just -Zcf-protection-branch.
I've linked a godbolt showing that at least for the basic case, your
no-jump-tables approach from clang ports over.
https://godbolt.org/z/bc4n6sq5q
Whether rust generates NOTRACK should end up being roughly equivalent
to whether clang generates it, and if LLVM gains a code generation
flag for NOTRACK being disallowed some day, we can pass that through
as well.
>
> >  else
> >  KBUILD_CFLAGS +=3D $(call cc-option,-fcf-protection=3Dnone)
> >  endif
> > --
> > 2.42.0.609.gbb76f46606-goog
> >
