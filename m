Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CD64B66F8
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494471; cv=pass; b=F7e/zWrJujtXEYYu15iPnozgNMR44QK9UFJMlJQLCQz+x0fpiLl2/FN96gv4cDuMixzeyW8z1b7fxjjLlCYQDKPXIBjXneCMShERF2dkowapUN+/YAq0A+75Tt8j6lNPD7KJYOa2U/+SJg2cRbN0b6WqAOf40Y4CRxSL2LK2SVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494471; c=relaxed/simple;
	bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPg0kU9J7/1n9C52HOlQeAt7+X+D8yQzeg6EtdezMq2VmqVYyFJErHhfS+l9g6LVzfNGqwCx0HPSzMfQjPveiFOrtluWJN3vy0YYKptrkXOJCH1RGVxoe3dURB9eBLgGw7HGWpdqzXrElgkjCqy6Yjl7KtKo+tRZXWFC+hZHDa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SC4kCaqf; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SC4kCaqf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495437bb891so8901975e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 10:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494466; cv=none;
        d=google.com; s=arc-20260327;
        b=Pi8lCX9HuJPZWE5Nb7UlSIJFVtGdjCh0OVKr8ArH1bHJS/Y4AjYYqgNgvCxpGXOkA2
         +OnK3jdiBM7U0CTxhJWNhORv1yrtxF473XAEGILJrWhGUMDlLwCcBxIgth4zikCIrBcm
         qPpovjd2J9ZrHlhS06CLUtVjkivjtL5jbDj+28V/f1gGTRDVlbsegLPKbszCuQXR3JTR
         GH1d6MgRLVrZud7h8xmBRrbzONVUMF8cDm2yZMbREDEOTXFbPv6xC8kL8q2h7fxF4zfZ
         v0aFa/H/Z8FK8adiq52DQquuoKZ3PIFC3ycwnxrnO5pCbh6zbcXRgWTB6k8qLaXYP207
         rXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        fh=dDoDPs2BLWRY7T287KzGYAIxsSVEjXqQm02RFk5KPqQ=;
        b=gCgiAcsq7T+MJE5qBhNry79ZYiY+PFyIFH9bXuQe94dz+vcdomY8tcd023HKisEMxw
         BTfYDZ9btM82lxVp9X9e7Ijfoq6G3rzf7Pn2punvET0/MczSTBlKPzy93ZCBI3PozrPL
         n+JeRkHNfXMNaH1Q3WALJAJqACz20wqnMxxXEyZ+WA+pctV9Zco3SFyV3xhmd3RLwCnF
         JAjJvqgpvsV/yKCNJlsseczckDNgkmvdCofaoc829HQpHtS+agfkYMukibZRSD3R4SB7
         otztr9A73/fXDkxdikc+FERk5rqRxKMoSlNVn1E5Oa3rsTRQLUtjdhwEYguJ1T+glJLb
         2lTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494466; x=1790099266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        b=SC4kCaqfVVRGG5CrPQH/SMlPkiIKeXl83D4UvgxjX69ghdnUrnuUqyHeshbHL7v3XU
         MciOzn7JIO9Y1K03tB70Y1eRi39OTU0IszyivUgKVlYAdjxNulv95mjqsR7bnCS8ldRX
         YSkgn4Qvd+FzLDnfI6RWmHgFd8RnJXjiw60CDK6CC3yZbf/T8tyHxKswzKVlpOU1Ifet
         cSas4HSNTNnIrGPq963ZUw9VRnXemCoxAdUi0BmmOeCPgGp1gPpG/dMliWtjlfDpuzkU
         U0Cp5g/97Q5+jtIPfWjlZAOjJDWvnugaRoFqaKUBCzD/GTkVXI9Yfcz6X/9gSZBRg0Ir
         vneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494466; x=1790099266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6Gw0oEc8G0Na/fDm4B5c157a2l4J+0QxPZsDNbgEew=;
        b=O6byUyM/Di4KyjsCzFAA2p4NYYsIpebrM3y0okMs3b2oP19TMRCF4dF0dfOzShM2zS
         mNSD/d6BL/QJlnHDQ0s2VBRHL7RoRFpElJVdRK4qQQ9s4YulLtgyGzo9LzcYbkm+EUYR
         xCbp4a5itLPN9K0bnebIYsqawrfxzh9+WrJsa8vR0tFoP8apVWp6ASK+4eW0D+W4X9x1
         t13c3V1TM+/hrxE/BOvKnEZYEuKaZ4VJFFTV4fCioi6xlQXTFhbKf4PuzZm/JGvqbR2b
         3KqDKnmF+8Nsu4lWtkC4guDakSKhA2Dmoz+3GdZ+gul9wDV+2ND8e3npG5LHnZo+rnhk
         AZcA==
X-Forwarded-Encrypted: i=1; AKwUvByXQBCY1xGfN5sUtMaUVS6Sgun5tqGlLV+Hb2WThtaEkdyK/uqIEV8f0341/aPMUv6s1vfUV+fkMaUK0SGurA==@vger.kernel.org
X-Gm-Message-State: AFuF++lmICYeeo5NZQJU0vxfUW2Mbn+CFa1k4hCw+KRHrFDTl73Mx6aW
	db5111nDTVYTVAfYeZ94yGacZC9pYQTmRigC0B1DioZ/frGzW//EgBKUjrKYvQGTkw6V3GyBnaQ
	8DPvr3vmz2uwj5gLB1RuAlGjMF4Ne3e3VmQ8x+i/e
X-Gm-Gg: AYBFou1Gb3WdMCph168kc5Sp+vmieIzH9jj+X878XVYquUm/ijzep9dQ1pw2DVWNbSm
	H0cdYaqJizkEl17hTrhXNeicunPBIz+fNSi9HkWfckoXMeqnZh4CXWe8pl6f1O7A0V5xk1YyM30
	ubo2NJVHQFoWe/0RYfl2TBvRdrTpUdo980zKuHP0UiyEkOYXFpOuCWnCcw+qlvP4xIEBognK82N
	7ah8/56oIPJ366E+ydce8w7FqEO92nuQP78yk+y2uI5ixjvJUR4+jM44jlhHlTKUXAa4T127r0Q
	sv7u6Cp0eRal0TOzNjeBTEDjyuU3MfEwmNi+bXBOUoYu/a+56J8M/PeSspXsVNH4F8OA4Cgb39k
	uLYnlr6Ah1jjtttQ91zc0l2wpPE1x5Ay31VU/mpnQtjbou1eIZnVm6My+JWd9mO48i5g=
X-Received: by 2002:a05:600d:84ca:10b0:49c:ff66:7d88 with SMTP id
 5b1f17b1804b1-49e7d725e6fmr51370615e9.7.1789494465544; Tue, 15 Sep 2026
 10:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org> <202609140844.FA7E848A@keescook>
 <aqk9gakQhxToLnDI@gremlin> <202609150955.A51C9F7A20@keescook>
In-Reply-To: <202609150955.A51C9F7A20@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:47:34 -0700
X-Gm-Features: AcwNN1U4CY7rpoxX3OGd9mqCs-kE5osRcDbnjG2lLmWDcf89pyFwGTPPrVzl7qI
Message-ID: <CAKwvOdmgeyqivO4pVa=30XDWpXvdRzBR8f13rfuPzDx=LJ1Tsw@mail.gmail.com>
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if available
To: Kees Cook <kees@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:31=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 03:30:43PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 09:39:07AM -0700, Kees Cook wrote:
> > > However, parallelism needs to be set. We can't let it eat all CPUs: i=
t
> > > needs to respect the -j make option (and make its CPU reservation kno=
wn
> > > to "make"), which we already have a solution for in
> > > scripts/jobserver-exec.
> >
> > The only place where it's invoked is vmlinux.bin at the end of the seri=
al
> > tail, where all the tokens would be free anyway.
> >
> > So I don't think it really buys anything at all?
>
> There are 2 things I'm thinking about:
>
> a)
> My main concern is the lack of respecting the -j make argument. In my
> mind, this is a blocker, because it means a build will now _always_ spin
> up max CPUs (not what -j has limited it to), and for CIs, shared compute
> systems, or whatever, this violates the requested parallelism level. For
> example, if I'm doing a long-running Coccinelle replacement in one tree
> (which uses half the CPUs), any builds I launch I'm asking for the other
> half of my CPUs to be used so they don't thrash my cache.
>
> This is the kind of "why are all the CPUs spinning up?" question I
> helped track down with commit 51e46c7a4007 ("docs, parallelism: Rearrange
> how jobserver reservations are made") forever ago.

Parse -j from MAKEFLAGS (https://stackoverflow.com/a/76517886),
forward it to pigz?

--=20
Thanks,
~Nick Desaulniers
