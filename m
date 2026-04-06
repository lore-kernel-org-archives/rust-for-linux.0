Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD524503B
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466500; cv=none; b=Zn4uXeaOR4Ggw05kFagUq0RoUqPUoZzW4HKiVCWXAOaOvaf/s/tMPoIrEHh8l1cYtMYEK9fxSC8FGWZ9eeiJUSJzUUdw1RUkSsOLTq9W0Huo0P3LEmtbF+IYce5rbNXwPqCS7f+dEq3zqvxeK2/6O/lpQ7s7zRy3DdD0haQbhBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466500; c=relaxed/simple;
	bh=3YZIVULe2x3GuZ5FghsA/nQqzGCzL7FbP1sL15aYCEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mai4sSyNtG1skLW3hw7eRiT4SkvuSP/XT9qGnaho95OhxtZEEeS9UU+eF53EgetTGWP6DVA4pStbLAhDYatsAGTIsd9vppxj9coYNbSEAJTW/GQq+JeBVG32hPg+FiNF1icIuvi5SSn5OBz0reZm0qf1ZEED3mSRquFdrnO7qZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1oIbDeS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1oIbDeS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824c9da9928so2785308b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775466498; x=1776071298; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2DC9+ivYheyMqrfOIx67QW7cPRjoGiCh9Shramalnog=;
        b=q1oIbDeS3FgNXEVV+W+7V7yVME+2y6Mx2H/cDXfYf70AlbMp+fGTbPpLZKwMpEBdTi
         og/hAhOfoP4iXzTHuI1wTPK+3R/4Bxk/0Ij2ANKa8FEsDCmRE8BrA/lxfDYHzxiK/9fM
         mpehXRhXXjvH9EWR8GgkJPQnreWBYdySSCl/cHkB+3lrKefeA7g4pehdRHesOTbBLj9R
         nZ0O5qmwtXgPo1Oiopd+ZQrB2sbM7IVHWol6QLsBkLUNf6eOcG3OwCV09KA0pEgTa878
         HTq4+AyjQBJbdT3okoQyKXwuyxKYCakdwBYz5hUAIq2lDeiM7ZQ7LspjyIMv1dX18c4t
         EQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466498; x=1776071298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DC9+ivYheyMqrfOIx67QW7cPRjoGiCh9Shramalnog=;
        b=q/lMhOZy+ZJRgaVCb2kx1JSHLr6cWqrESvupxYdtQBg5jBF/tlYDWPibxkTZjEJJz2
         t+LBNa7c+67dBfU1LdRc2MmPUK34DH1N6hHtccDygn9IPrbomeD7WoHG4Pa0MtKMYAxg
         MpOwqzxZZvZrV9+DHblLbrDBufPdwtzCA3+xPjPG2dD67LvH0OwkYGJqMJSfZyUXVm0j
         +1bPUSFei0EHocl3BwcItu2gN8Fz+HLp2+8EXgvgu4b4Qm47xIh2rp7tgbz2vIETf69Q
         pHGiRuvpAogb3ZyjGA72xCuu/7iju19AC/gw51BaGaCe48nsnAxX7vvanU2IJBsgf5BD
         n/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTYZiSRo9lACU3UuRXU9g9ieHSi26UMcEFPyZdqnfXZtYR4wPZ1BkPA/6tVltnzlxXBKHvT24+KTS1W0HxwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0v6C8BaQtjVmtoUIwafNpBEIPXaIbZz+nAzsR2we62IFSvvUD
	aFuLW3HnkYAbtv5c4+nYg3XZdNekDhQWNWsE/A243jflp2abxM74tpMu
X-Gm-Gg: AeBDieviO49xr7W3l5f/SCsIvwbbJPPYIyrgy2KSTB5wQKDMaM83aeNvYpyz7UDYVv9
	gllmOnCp0AhJkNBtfrBVwjnzqQiT2DyujvM3GsD3LwPSfM1kOSk/oAhdNELw9ZPFnZ8zj+M2GV3
	MYKUiY6mAL3AoGncU+oU9KE8ojYXiV/MTq7pWb2R8XOPlpU6wUPB/x6jnvZsV9wsk02FsteZsUL
	6QxliIHDdEjNdA/M4CP+s+hmiPRwrmTAsXdcQsPXJaizmwBWD2tK6UKzboYK2tktYumFHU0fSuG
	47llyV+x8Ce4y5HrJLprh7u4RjCHMds+kbt8JVKaNrj1/72PdH8N1MyvyPoo+UVOJAFmOKoFzz5
	oCdt9JEtkZu7re0/GaeUiBi4YxIHNGDpiz7f2pS44OJu/nbzleDwr6iMPHimiM8+TjNx4nK2ScA
	glrIZ6O4D+BFyOisiKjEsPfC0od4plckSN8bnqB0bo/Ynt754+7RNZNr29Deksv4zoJLo=
X-Received: by 2002:a05:6a00:4649:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82d0da8bc37mr11678758b3a.25.1775466498220;
        Mon, 06 Apr 2026 02:08:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9cf065asm12787649b3a.8.2026.04.06.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 02:08:17 -0700 (PDT)
Date: Mon, 6 Apr 2026 14:38:06 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V9 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <adNuUxsGl_Tm4Nd7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260404121610.1956528-1-mkchauras@gmail.com>
 <20260404121610.1956528-2-mkchauras@gmail.com>
 <CANiq72k1KN68wG_dh0GcTyfiXUyrVUErJ5D8AOaV6z6=sX4BAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k1KN68wG_dh0GcTyfiXUyrVUErJ5D8AOaV6z6=sX4BAg@mail.gmail.com>

On Sat, Apr 04, 2026 at 11:04:08PM +0200, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 2:16 PM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > When building Rust code with LLVM=1 with -j1, rustc was encountering
> > an error:
> > "multiple candidates for `rmeta` dependency `core` found", with two
> > candidates:
> > 1. The host's standard library from the rustup toolchain
> > 2. The kernel's custom libcore.rmeta in the rust/ directory
> 
> Please clarify in what conditions this happens, e.g. when building
> natively in an architecture like powerpc for which the target (...)
> 
> Otherwise, it sounds like this is something that would be happening to
> essentially everyone just by building with `-j1`, which is not the
> case.
> 
> Also, since you may need to reword a bit, please take the chance to
> use the present tense to describe the current state, and then the
> imperative for what is changed. (The past is usually used for
> something that already changed in the past, not for something that
> still happens before the patch is applied -- I hope that makes sense).
> 
Yeah this makes sense. Will reword the whole thing and send out a new
revision.

> > - Update rustdoc-pin_init to use explicit --extern paths for proc macros
> >   as pin-init also needs alloc crate from -L$(objtree)/rust. So the proc
> >   macros needs an absolute path
> 
> As Gary mentioned, this list may be too exhaustive, i.e. one needs to
> see it in the diff anyway. Usually what we do is try to summarize, and
> most importantly, explain the "why".
> 
> Also, it doesn't seem like the list covers every change anyway if that
> was the intention, e.g. the removal of `--out-dir`.
>
Ohk, will rewrite this part also.

> > -rustdoc-quote: private rustc_target_flags = $(quote-flags)
> > +rustdoc-quote: private rustc_target_flags = $(quote-flags) \
> > +    --extern proc_macro2
> 
> Hmm... why is this needed? The variable already carries the flag, no?
> 
Oh yeah. Will fix this.
> > -               --out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
> 
> This looks like an important removal that is not explained/mentioned elsewhere.
> 
Ohk, will explain this in commit message.

> Also, is there a reason why we cannot keep the `-L` here instead of
> adding it in every proc macro library?
> 
Will move the `-L` here instead of each lib.
> > +    --extern pin_init_internal=$(abspath $(objtree)/$(obj)/$(libpin_init_internal_name)) \
> > +    --extern macros=$(abspath $(objtree)/$(obj)/$(libmacros_name)) \
> > +    $(call cfgs-to-flags,$(pin_init-cfgs)) \
> 
> Hmm... This special handling isn't great, and the fact that it means
> hardcoding/duplicating `pin_init-flags`.
> 
> Should we move the proc macros too?
> 
Let me find a cleaner way to do this. Will do something about this in
next revision.

> > -               --crate-type proc-macro -L$(objtree)/$(obj) \
> > +               --crate-type proc-macro \
> > +               -L$(objtree)/$(obj)/host \
> 
> Spurious newline added?
> 
Will remove this.

> > -               @$(objtree)/include/generated/rustc_cfg $<
> > +               @$(objtree)/include/generated/rustc_cfg \
> > +               $(rustc_target_flags) \
> > +               $<
> 
> Why is the variable moved here?
> 
Will fix this too.

> Thanks!
> 
> Cheers,
> Miguel

Thanks for the detailed review.

Regards,
Mukesh
