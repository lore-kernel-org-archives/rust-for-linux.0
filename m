Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B491E1A07
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Oct 2024 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492266; cv=none; b=OVl6PwqAfdccC2kLp0sDWvoiHqtAeA7yiNwa7b5YJTkbubCsnHGrMny9lfrcZn21KnJqMSifYI4mt481IS4jy4KVSoAz6LyfDmxpF//+Y4UCA0dsBzgVdhb7oE3f2WkbnAaMmFsmYPK2+fKdIebyaVGOTDZEf/tqa89u8ZLrbAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492266; c=relaxed/simple;
	bh=f0RFDXhULnyY2BY/Mw9GxD0uAf1hjmfoqcOSDpu3B3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cl5exWQk+n3p4+KL8lX61te7dN2PCsp2DvqYWzPlFDAuPH33UX3R6jUVWqBON7GX+0OTXgq4x57lheROTvXvEhwYPeluVZtlkefEhnRoN4fWOghwk4CRAAmGWEuH1PX73QlEDRnvODzko3iMpq4PeIckhg5wbVxi3THk82nBcJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vlm4kDYZ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vlm4kDYZ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4603d3e0547so5791cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Oct 2024 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728492263; x=1729097063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0RFDXhULnyY2BY/Mw9GxD0uAf1hjmfoqcOSDpu3B3I=;
        b=vlm4kDYZx3YSTtwbXuTFQTWk/xfP6Jdo4ZaVxe+9LpbL35IkiB+KN40v1F3/xcR1bR
         wjeU8OZ0supROHona17NaptKwYuI70u1ppPB2bV3GkdI1NLHCcqCihFz16j94unYfEDM
         yWTjRwDQnLdVw9FNZdrIpPJjZClUhpJAL+0VsIpGUOnTywoh+WRpuVgCAht2LcoJm26J
         dulLyQH2hRc7IrAOTKSeEFOlCiFCIqX6XMrcIV60Tpl7XrI2A8NAf8RRg74FDDyyR2j1
         57fFBqr/5qwnkeoEe/ObDWSUyV1TfrGUV9TGnRnWo4U9rrzdKjZRXa/T0Nn0ytdQOw3I
         oSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492263; x=1729097063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0RFDXhULnyY2BY/Mw9GxD0uAf1hjmfoqcOSDpu3B3I=;
        b=G5xJsCdmAjHbWpHczspaovJ7MCBAxW1cm1DoLrajvMQ1h9IQsUhFmxScxB9xnDQbXD
         TsA8+byK2v3R90+u0mN60TiHUIatIcMDZzDQDfsXngmLXj5RlNmthuYxoHe8FakHlRVd
         0oAWQkAqm/TjQ02NeYqLPmXIWOVCOLwAxObx8tjDh1aCkHbRYGonifNADssu+UAZ11y6
         x8ENg8bkHagububNHcaQmYfyTNvlYVT4MZm8zzKJFD55UHPwJKI+CPrPuuaeNKtsHpbg
         xoS1tcQ+86C8eTckzkF5Q5ABuCPYgk6ZONjqR091BpemFWIhMoXOpUFOgJ+5tviK5471
         qPEw==
X-Forwarded-Encrypted: i=1; AJvYcCU/4j75WpZsmkKvC/KmZpjLUaGFDA5HPbjY5FdtCjUyi37cTl8Q9lcU8XAFXQHZ/YkHok0Te3p2M8k4y65Hlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2hSjJFdULul+vYN0O7oy8LSjbTiNrD1G1BCclenvCMUQqv7qu
	iAOq5/KICqcuvdy/5fVmp9uzvMKJ7vYkm/JLLmDVATP20Xg7WHGk2Rn3aWygDkvbEoztv7pWEDz
	05OzpF5nO8IaHhF378P9Q+a/scIW+lg2mJ7Xf
X-Google-Smtp-Source: AGHT+IGXi7403SDIdlxuIn/gfNtdZd69ttkza9TvN53TAGxffeRgQIzror4uI050ZcHFWqWlwYkRoIIev0/cUOq0cdo=
X-Received: by 2002:ac8:6312:0:b0:45f:6a4:4262 with SMTP id
 d75a77b69052e-45f0a153812mr4783561cf.22.1728492263209; Wed, 09 Oct 2024
 09:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-cfi-fix-llvm-gate-v1-1-32d47459eee4@google.com> <CAGSQo03ZOppScZT_1DuWYsnveKvYHdc-K_djHi=AB4CKjAbgyQ@mail.gmail.com>
In-Reply-To: <CAGSQo03ZOppScZT_1DuWYsnveKvYHdc-K_djHi=AB4CKjAbgyQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 9 Oct 2024 09:43:45 -0700
Message-ID: <CABCJKuddiLtjG1TJ_CN+F8Z_7+oOOfZNAFd0=qy_HW4wMMJ3fA@mail.gmail.com>
Subject: Re: [PATCH] cfi: fix conditions in HAVE_CFI_ICALL_NORMALIZE_INTEGERS
To: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alice,

On Tue, Oct 8, 2024 at 10:46=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> This makes sense, as some folks have a Rust compiler they know has the
> fix, but build system detection for it isn't there yet. This lets them
> override availability if needed.
>
> That said, we should definitely be sure to get this back to a
> non-configurable toggle once the LLVM version detection is in.
>
> Reviewed-By: Matthew Maurer <mmaurer@google.com>
>
> On Tue, Oct 8, 2024 at 10:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > The CFI_ICALL_NORMALIZE_INTEGERS option is incompatible with KASAN
> > because LLVM will emit some constructors when using KASAN that are
> > assigned incorrect CFI tags. These constructors are emitted due to use
> > of -fsanitize=3Dkernel-address or -fsanitize=3Dkernel-hwaddress that ar=
e
> > respectively passed when KASAN_GENERIC or KASAN_SW_TAGS are enabled.
> > However, the KASAN_HW_TAGS option relies on hardware support for MTE
> > instead and does not pass either flag. (Note also that KASAN_HW_TAGS
> > does not `select CONSTRUCTORS`.)
> >
> > Additionally, the option is configured to have a prompt and gated behin=
d
> > EXPERT. The previous method for a user override of the option did not
> > actually work. This is expected to be temporary, as I intend to add a
> > precise detection check for 6.13 - I did not included that here to avoi=
d
> > adding a RUSTC_LLVM_VERSION config in a fix.

This sounds reasonable to me.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
