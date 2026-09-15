Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2D43DEA2
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494977; cv=pass; b=NBp+OvrVsZmoPCTVVLDkYE3oSvdNhDnXichXek0xfM7c4uD85F878R67C2/qyDYDSQTAoTxxOhjSsvV6wok0bpO9aCp/+0YF2fARI6WhMlbKhfIZtJ9ZOmDsonQ4Kx0I4byxqexIEy/HxbBt2TOcAlS8rwVSBq6UtT78KSYdGCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494977; c=relaxed/simple;
	bh=P7a2zFFMvnl7AMMV9J8HoSFvOnO26MuCDolXpy7oTxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brygQHRPp00YjfJh2QVFxN6raT1WFBwnrnKkgdJzLR03YtX8YfIK5Af4knF9cej+mQbfY13AiXZMa40CKxNq1qMbULOlNPs7URTo8EF9s1XoUdiG1d1JCIXm1rgt8yvuaaHUU44YQBTUa1F7lLFKIOUarVdrv8lbqc1zeMMwnn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a6KqVcGU; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a6KqVcGU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e397f74so707066f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 10:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494973; cv=none;
        d=google.com; s=arc-20260327;
        b=FDvyYIbQOjrC/lFlVIOF4aIrik4Wmc0W3XLGEaBDPvmoyMB0qCKVoZvEDhLUNBdCTb
         6bJq8j+vb1hTeIYixj6x+NgT4s9NPzWC56jcVe8+t9zq19Eb8i1wJam8R9149rQkCb55
         PSxyfGIhSy4zx6MrInp1kt/0qJnvCKdbyzYhRHqYvAvUhcbYtTrlKliQ5yhLOGVtYIdb
         byBT9y9W7kgkguknxx4uzDiS4XOGIICJSGkWnzN9PuobukrENVAXdgCPsf+xWl7K46tM
         VIUALLo00DSK94rnovDDUyIeDfNjJv3d85r75Q1B7FZEOh2WENZcjKO+LBMpnFMwmS14
         PYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        fh=oFkcy5ILAJqn+DX7aVkbQ9jvLCAYVXdJSqbRCnXo8V4=;
        b=l33HPl1xeow4gWUBVkWgK2l2xxfw+JpBb+gB8U7m4ueuTERVqOGKGywhFIG5iMtOHu
         B94udGEzEJ+aqJGl5y0J+Y5zR/E85EePaX3wlASn87KJ8v6UZZg4XGpd/89Fqe4kk+P+
         Q6qLkOcWpBRZgZnXhHObQ7q/zJ6fu1YlcT3ZdwQPz9tpxFZcltrUof2PV9OELaYCJW+a
         rfcgKBb3dFsc4X/rdlGMlCE350dJDrwwXsuMreqxCa6+cw5fKxmRu07A0tMzbGJWuflc
         7bX5+J4CjPb2nn9+F2r8RfqJrZMcqULwaxDESMRP8SM4Rtk2xhuZhMBwNr+337ut7g3M
         FRHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494973; x=1790099773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=a6KqVcGUw2fLFtF1Hm9cc5yrvLvRY7YxPEhLHNJIfcavwgt1rbW5yhhfaSMX9+BAED
         DGIeBSCgb1PlyB68lxCyUYa/zeD7s7Lo+A6Qmv93dYvmxfOjOqiT4T0+b7iIrlo89kl3
         YmXf3optvEP5cx8oa/c2vYZz/Cpd/9YBfStzMILEteq521PB7cv0n4n8ZyMgrCmgFcCE
         lMSUEJYprCL+/e4j6Ny2nYOmfUuoU2z79ZlpeYGa4QTjMUcNXGJrHFAK5pWg2+Dyb0Pk
         ebFFkqcbAhZKuXXO3iWlS5mmW4BKwKJfkzmb/CfloFnTWbyEEabpV3Xv4BxGONXxY8dZ
         5NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494973; x=1790099773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXjIVxCi/wI/JEAgJbDGbjdOXMojQ1soppHskXz6ugY=;
        b=jehu32N+Mmg8e5Sey8np/RQurZ6I1gTrVzAol2BMmDqb9DS6PvjPsbguUyCpl2WxsE
         mVX4Xp4kMIw/OcvwJil9pQYk23WU2T8k0eh84v0ueTkEe+yLNtWk11U5az2351N4AtAi
         WQHu8/25x9QKR22e3anunim5+lczo+UEgsSFEw1qWV6JbZYSvVmj1AIls02lyt2fo3Oe
         cpaC0ZUxG770DMxmHVDV6sHNzaJYdxRt7txeEMRDMcGNOXxaxjYctAEEnAcx3rxCmMik
         SPlVp8ItjZFg3X9zI9p6Ofie3lDooVanuN13OYV2qyiuNLCwa3KHuOB6BDD8FJB4ZeKN
         XNtw==
X-Forwarded-Encrypted: i=1; AKwUvBxAlUsuUaX9bdotafE+jg+o1K1r37VkkT5tu97GaQTyla6OLTl4Dog8bmlaft3Bvs3BG+X7SIMjAjUTPOInAA==@vger.kernel.org
X-Gm-Message-State: AFuF++njb7x/uzVib7RpWGoTVLUuVMxx5B2izsBjbR1+sljT6cD1Pv5+
	wz74ecIzG/lDlJSXFKqI/WNqoScA02+Lstk+HdI5W5gbZVswh5+GbAIo6RgltB/qBmpbeGYsLTz
	cDYbHw2/3VJtIhgB+UG6oLpvpb+Erz6kVjydDOJwK
X-Gm-Gg: AYBFou0vaWsYnwQGZtYVDOxbMhipwuZ2WdmhPq1nI+QAwh0tjwAXw58iRZ2ATLISvdo
	/xGTAghjXfGiqw8lPkqAN/+rYidgA/+Iir1vOhq1lp/wOV1dyeYrxYEjKGB35Pi+fLBit+xBmXr
	y+8u0b2GCjzg3V4paaX0ZSwIXEYLm0rCrjRh+cCJPscKuEweCM9J7q1IydDBo5DGAcUaMIHFY31
	7iJuSz1SEez38e8wi4tWzfYB7Ncc79XZZL+oB1KwnJEAvp+2hdU5tf/rBiL1HXEHgtm68I+gCkU
	5eyiPiOuLu42KqQZrdCCIktoYQffibrGPIpYRGTN1/iGN4cwNyShZxcfgraNYikCVh8ASoausUW
	cl4oOR0R9LwE9OjvTHmNdRC+RwqavwkFY3y5PNczr7JoyRxYMkLq+FWC6gbzRHKT5VGI=
X-Received: by 2002:adf:eec3:0:b0:487:13f:4968 with SMTP id
 ffacd0b85a97d-48705b5d792mr5756089f8f.11.1789494972051; Tue, 15 Sep 2026
 10:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org> <202609141056.6AE2C82E@keescook>
 <aqkZvtAKWYf9-1ZW@gremlin> <202609150943.000EC9277@keescook>
In-Reply-To: <202609150943.000EC9277@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Sep 2026 10:56:01 -0700
X-Gm-Features: AcwNN1WPMMWK_d5_qt02ICUH5UNGl72dPPgrM0zv_mQxUiZh6yRKMNR6HBnx31I
Message-ID: <CAKwvOdms6QWc7RMW6hJb3qzgmpK+aw40C7b_h7eG161ie_Y8ZA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
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

On Tue, Sep 15, 2026 at 9:49=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Sep 15, 2026 at 11:44:01AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 14, 2026 at 11:00:27AM -0700, Kees Cook wrote:
> > > On Mon, Sep 14, 2026 at 10:22:13AM +0100, Lorenzo Stoakes (ARM) wrote=
:
> > > > Module finalisation on allmodconfig builds consists of a large numb=
er of
> > > > very short-lived jobs, and the make job dispatcher cannot possibly =
dispatch
> > > > jobs fast enough.
> > >
> > > This "cannot possibly" sounds like a weird LLM language intensifier. =
I'd
> >
> > Again that's my writing actually, probably best to stop assuming LLM no=
w ;)
>
> Apologies; whatever the opposite of the Turing Test is, I have failed.
> :P The AIs are winning: humans are suspicious of each other now. :)

Is there a term for this yet?  Cylon paranoia?

--=20
Thanks,
~Nick Desaulniers
