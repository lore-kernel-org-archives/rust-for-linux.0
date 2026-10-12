Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A263750D5
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815900; cv=pass; b=j7Q4hE0PS5vPw/a4opzcbCz4rFWN9l+lhTyoYSNQBMgQGV3k0F5l53YqXRfJiv1+xsoWq3jeQBU9Zn8Tzx+Xoby+ZXdYKSrxCxW4p/D+LUGitz5o3CkALPZG7G14gW5MGXnQC62rsH7d07NJ9pt8FwIUE0/SP5doIrpanUmNVW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815900; c=relaxed/simple;
	bh=Jxmt9KjzM1tHZnS+/rDQVag7Gv7qwGz5Mz0R33A9/8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSJ/X9hoN+2/5KnvKjL014amcX097tIgCFhpfIb/j/ot+OAx/UTDRCdBYdmJnXjlGQouzX4s9k9SbyENJlQrRBE3Eq/Q2R3+KGEm2ysj7veSa5VSVwwhIQqm32kI50mYoY6YGscHO0JL6ozOfvudv7YOHVxCBabDzfLx4s9PAz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kxrpma0y; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kxrpma0y"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6767d92cde6so1551130d50.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 07:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791815897; cv=none;
        d=google.com; s=arc-20260327;
        b=l0XLAW9a0ITyhkhl+Nlva6Pjoa0d2yYuw6qritUrIrL7JBdQGM5S+znkyBiFUSvg/n
         0manZ9xhBHXemFcJxhd2VyeqpyIfwBuGAUzgVxuJoAK5MEAv63ZvDps5tPx2IfFx6+fM
         ALKdz45VP41CW3Kfrilhf5BW7IFckIBDZH6+yiTPY0AcoWs4MTmaSQW4AnsAm9XfWpTp
         kUB699PvjUrz2RrcUBDh71wd7N+HCzf0S++l0Zq10F5QHSGYmJi3RZe3wC8Z+sVsDKhO
         cpC+LAWWLc85jtU0QuE16TOkX//bBQVxJ6frgut9G04vAKUjeFjiO0H3ByPiDRpst/f2
         pm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        fh=bXZhPydrtYG3D4stj/zLoAxmMdqRF86MF08wV5vCzg4=;
        b=Ya6v0VjXFP2NW53WZmnV7s31w2OxyNpCdKM0KG5q5+hu86PP+sOXQeTtJihyGaBmLd
         8dp7ft2FywQUM8QZNHt7vuClYDFoYsaYORh65+NYJQKH/gWN7jAWAfwneABQ02JVbXBX
         zeBodpNuMKogM7kqQRsL8FIHIZAqie4OPQjzFRAFAGitBH/XHNljqiU3BdA4SHI+CWtK
         /k72nL7PMtMP7rIzN026M2uoKA99XlVCPdDEJhxkECxHPxIXSP+sXcF4Wfiw4o2V8q9P
         W2O0PmKazLAivDKa8dY/gDao9438JjDJC/VFyaPbIdmuz7P4v40w5nhbBHdOEa++ylZJ
         +H+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791815897; x=1792420697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        b=Kxrpma0ytHecy0j5OkVrxYU5EsioaK09WTFxrdXEB8XsG0QPh+WCko42bmjYIOAXY4
         E1ftWSpb/s9R3nYuo+xGXQ4juk2uUzhUp+XSIpVyzH6vRZ0ZJAbrSVtUxpPT3FF8ZRHv
         stbcOZ2BhbahADsQN4w0uqUkBStfhtKAfYNVA9L+4KB2+0SRNdVvsdB5rIB+ahRp+RX1
         jeH+ssxIWCVyIaAbfBq4fCY3AdvqYktfc//n5i4Zidpe6IDyI1qmqdkYDodVONalrkAh
         qeFlhbXX3y6VO34YHcKFh+5RpZZ8VbKsjA93SafOQnfnC9/QaTdGv6QMbtCqqgBa8ExL
         YHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815897; x=1792420697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVL8xl8gBi6bftcNOZS9JlnRpMYOODIaKFnti92zlBA=;
        b=12GoRTTzUgpKP9uP58/TZhBY3ohM8+yoL2/v2GQx0bb8hZ+c0k3Kvk3RdUuH7hSblE
         oEwFgiy+Y50ivEJg/ziu9OaA2kk8D6Ntg2nJdtcUIuLIhi3NsHDipqKrQlL4bJb5qL8m
         opJ5PhyTRXxDsZb1iDYbo4LtSskEa1RJos6KrLYBBF7AxPbbK1bgi6BqXIGeZc6zxwsP
         o9bOWpIiJdzaybilemZW4PoLyUNVLJUwuw+rDqKqfXuFXyohz8NA3x/kpbisJpebwrbi
         H2aM0aE7eORm8cJsase6UkAhUtCGO6aqMFAy/7+kX2yr0Zp+wLLJziMzXNz1GjRoAsUK
         k74g==
X-Forwarded-Encrypted: i=1; AKwUvByd+87wr/yhhTsiupocqUzseq6H++NaBo+8zltCUhTNYCYbblVF8mL+vdTQ0t2HehyYMKOUWWQ/9KCXywuLhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLgQBQIYTGuNMCncIhY8GI6wORMAwVWzcR6UJB4G2qgPPhI0Poa
	O0MOFp5sFFbCfxqGek6O3vQljAkd3HGhT1fDPkSKoJWiQRDPHZkhNN6sHDYAFF2SZlFGNg7NroZ
	MAdmW03QKTEuc6yUvZ/DjIcrqYf8+zbZTH8xoD1We
X-Gm-Gg: AYBFou2ViFwxYJ+8Bmjc6NHRUjkrK96GQb6AGANyGq/5bdht66KkXa/bEmnDbt1RDmg
	NU8jK8OxlYcgCEpPyIRacSuIiDFh0jZ55H4SftGyKSB6AV6JweE2wOnbZwtAcOOzwdHYhY/memH
	g6ZMexwUbdoPN0pBu0+IFQY4s5gaTS1+7lO8IBLbHt3UAA4UtTIR5vQeaCrBr3ksUOFCxsfP3ED
	YCC7t0Ax1PZOT20IyadYUxnPAMoFFNYqhX8Z/x7Ud4Kn6v6kx3ItrOrBeuxMwd3PhB/Y/ZPWo21
	DBbR51uN/CMPE8tjofwz5LRnv27PAZj5ibD1cSxKEcd4zqNcRPU8ye3NPaKKrijtl09IyQdtv9/
	dsQWuXM17Xw==
X-Received: by 2002:a05:690e:4852:20b0:677:ae5f:927f with SMTP id
 956f58d0204a3-6793630f86cmr2427106d50.106.1791815896536; Mon, 12 Oct 2026
 07:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
In-Reply-To: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 16:37:39 +0200
X-Gm-Features: AclHuK92MyXxJeDrxPQQFA26o80Qq00iYKL0aWA4ivRbmQNLUfwOPJLz7iq1CKA
Message-ID: <CANpmjNPRtT6PLf6qAiuEaX4hG1GBYD-=w1A4y_-i8vSv0e7Q-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2026 at 16:18, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wr=
ote:
> >
> > +Rust code is instrumented as well on architectures whose Rust target s=
upports
> > +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).
>
> Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
> places, although it is convenient to know in the docs (but risks
> getting out of date, of course).

I think any future patch that enables more architectures, can also
update the docs. We have historically maintained the set of supported
compilers + architectures (if that set was still small) in the
sanitizer docs. Once that set grows large enough, we can omit.

> > +  Note that ``rustc`` rejects linking crates built with and without KC=
SAN
> > +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>=
.o``
> > +  cannot currently be used for Rust code.
>
> Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
> the patch (and in fact I don't know if we would like to actually
> support it even if it works), but perhaps in the future we can relax
> it using that.

If rustc's sanitizer instrumentation is similar to clang's, and rustc
doesn't introduce other ABI divergence due to sanitizers, then it
should work. Same with KASAN + Rust, so this would need to be a
general Rust + sanitizers decision.

The only exception is KMSAN (which I think is not yet enabled for
Rust), which does affect ABI.

> (If it doesn't work for some reason, and we want it, then we can ask
> upstream for an "escape hatch" as we usually do, since things like
> this should normally have one...)
>
> > +# The minimum supported rustc's LLVM supports all of these options.
>
> Just to double-check: does this refer to the LLVM version of the
> upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
> support in that minimum `rustc` version (LLVM 18 major)?
>
> I think all the options exist for a long time, so it doesn't matter,
> but just to confirm...

Whichever minimum we could ever see the kernel compiled with, which
looks like LLVM 18 in some custom setups? But yeah, all we need is at
least LLVM 12...

> In any case, this sounds all reasonable:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!
