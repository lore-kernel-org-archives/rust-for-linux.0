Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B6C7347C
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722969048; cv=none; b=RP/VE7ohRIT5s77Ud0/WxyWpQQE0Hh1Jo/gVDvLoht4ecW/z2uKjJ4rvsgCmy+30LhOxReB1eR4W4YAVlmzG8hq/4CV0xy7r+62UxI2HxyJdJagNjTGxuQX48bme3S3CjQNpTx8Z8mPIIHSKHHwR+jzKcxQxYO+4JRrMg7I/GQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722969048; c=relaxed/simple;
	bh=oe38/BA3I3GPzGRZcA4tK3QobjJz3lxhxxE69sqobgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4Tf3CxfVa5ePuoZflAHOz4YqfIWLrZiCrTqICGh74OJRlDB0hOU4Gd/5Xi1rIc29ok89aQxLXdSE8o2rI3oUYjidDtejZOsULQ6GxYD+EqE/4nF8iNCa53STG3rZI6RygStWGnKDEWuMZbi7fhJeeVJiEU3SlkEFRDak8wl5zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=qH0UmKmr; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="qH0UmKmr"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-66ca536621cso10777637b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1722969045; x=1723573845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJcjEsELElj17ftf1H3NNxeE2XuKAN8uQ1oS0Kp4OuE=;
        b=qH0UmKmrO5pSotYBPE0TwmSSmkwcMGNZskTXkb9M3FQUgEbjfdOBzyIYU7tkLkSFSl
         YEu/LhvO+ZMTJ1BvJw/yXVa51+oBUWC6Xjx+kSnCWbJGEuG+Amde+MAmQ6NCNMua6vVF
         bkeDK48LgmrEjo6HOiXg1Q2cVM7H8sWWLDitdAqdUXyMBt/hY7K0gY6VXhSGFLPZP1Sy
         i1b5u1TPYUp6tro/yDQ8McWPObz9DHtd8jLnLmbsUdqsSrTTg08GhryfDQDep9kOONwo
         hk2mzyd24++j52RFlHUEsK65VKNUZ8pXyTebG1HjGfaGdNcceCy0qwEgs4AzvqVyUOQt
         EHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722969045; x=1723573845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJcjEsELElj17ftf1H3NNxeE2XuKAN8uQ1oS0Kp4OuE=;
        b=HpmGWFJomWy15t1gGLRADE6DMs8YxLbMPITZgRijVfRUfimFTGuwCWfwxXlJQ3CC8N
         6gQLisgPdrwkolVGZTJMnT9882YUUQS3TmxvKOJ1JdJMqP7h5rKkBMDOwhv9MDRH7kuF
         aqohRx+FNyA0rj2disY7UHof+e81na0he5BGIOBhJjIZ0StEve6jXXnRzfX+x0iViwEm
         dKdCe+4FrSGRKGwvc7vCsQYzZeEHwjfnyViGV17IzZW1OY95aN1Unkr3KUD6QcFMlxKB
         +KeUdvj0qRl4jK5rrQrdj87aZsh5fcCnPzQucvYxqF+S/PBal7/oC5PIrmus9I0qk8tX
         m+nA==
X-Forwarded-Encrypted: i=1; AJvYcCW62kFhx57TPOPVmTo2ngDR96/EgOCW/4x/eXLIgx1Av5WuQl8Cz1gefIwEVQhvwxXhdTxQ9KkeHg22E/EcmIQ16oORuGmquNW8iHj9GPM=
X-Gm-Message-State: AOJu0YwtVcw+n/5eMpP7NEbCHUHatyBjxWAL5QXPsm4PUJ1u/JBpqPls
	BSEettafUEjoGvieS4PuvP2rZk//OTMdM4LeCRvNCNnjU5BX3WZVr3r68hXx94bGNiXI4DfgS6W
	vFKrc+J0PMd+CBNiWCV5Ffs8OT/0hKw9orPO6rg==
X-Google-Smtp-Source: AGHT+IEi5wEKcxYijrCG9lZ62HVarFC1N/dov62z2Vvk1px7mbW2C3yfR+rXHXlo0cHub/OfafmZkMejgkYcoEw+XE8=
X-Received: by 2002:a81:5b06:0:b0:65f:9e35:af1a with SMTP id
 00721157ae682-68964590c97mr153755347b3.41.1722969045434; Tue, 06 Aug 2024
 11:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806150619.192882-1-ojeda@kernel.org>
In-Reply-To: <20240806150619.192882-1-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 6 Aug 2024 14:30:33 -0400
Message-ID: <CALNs47swnK6je1o+LOLUFCDEZJmQmZx8vZ+7MPvUbNKdFr_Q_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: add intrinsics to fix `-Os` builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 11:06=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Alice reported [1] that an arm64 build failed with:
>
>     ld.lld: error: undefined symbol: __extendsfdf2
>     >>> referenced by core.a6f5fc5794e7b7b3-cgu.0
>     >>>               rust/core.o:(<f32>::midpoint) in archive vmlinux.a
>     >>> referenced by core.a6f5fc5794e7b7b3-cgu.0
>     >>>               rust/core.o:(<f32>::midpoint) in archive vmlinux.a
>
>     ld.lld: error: undefined symbol: __truncdfsf2
>     >>> referenced by core.a6f5fc5794e7b7b3-cgu.0
>     >>>               rust/core.o:(<f32>::midpoint) in archive vmlinux.a
>
> Rust 1.80.0 or later together with `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy`
> is what triggers it.
>
> In addition, x86_64 builds also fail the same way.
>
> Similarly, compiling with Rust 1.82.0 (currently in nightly) makes
> another one appear, possibly due to the LLVM 19 upgrade there:
>
>     ld.lld: error: undefined symbol: __eqdf2
>     >>> referenced by core.20495ea57a9f069d-cgu.0
>     >>>               rust/core.o:(<f64>::next_up) in archive vmlinux.a
>     >>> referenced by core.20495ea57a9f069d-cgu.0
>     >>>               rust/core.o:(<f64>::next_down) in archive vmlinux.a
>
> Gary adds [1]:
>
> > Usually the fix on rustc side is to mark those functions as `#[inline]`
> >
> > All of {midpoint,next_up,next_down} are indeed unstable functions not
> > marked as inline...
>
> Fix all those by adding those intrinsics to our usual workaround.
>
> Cc: Gary Guo <gary@garyguo.net>
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-Genera=
l/topic/v6.2E11-rc1.20doesn't.20build.20for.20arm64/near/455637364

Should this link have the `[1]`?

> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile             | 4 ++--
>  rust/compiler_builtins.rs | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>

Also submitted a fix upstream https://github.com/rust-lang/rust/pull/128749=
.

- Trevor
