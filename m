Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16DB30F80C
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302263; cv=none; b=X10dA7f6bbUjoS2QtJTl01glcRbFyIJEop7Zx488Zvfb3+spORFfz6CAdPaZhgV1VWMkwjb54nfnleiCYUop2F/4R4dVmuNDMD5Et2UVF7Tk/hO7Hjk6k1gqWO18utpBzUB5Em2PDQlvt5DRGyEx3CQMbItVdcURShtVe/mh7ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302263; c=relaxed/simple;
	bh=Sr2XyRdzXeMhkuNYfkb6Mn0UTZOqFz33nE8+nQ5o8Ss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GvehQ0O7cK5uidO6EBMxbPyxUiTdzNrDwhKFnbueirEl4kPXB8B5Dr+0TmCGp7a0nqBKqQSP6COxEkTFFzSlgPWvitaL0jzq08a+NaGLL7XmDqyrly45XRj4M69yLpS4vV7X8jsdJ68l2DqbFdxJtr6HyWLc/iZRejM2AK5R0wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eWLLkP/I; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eWLLkP/I"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b6d35430f56so156836766b.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761302259; x=1761907059; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bxoLsZ8nIFnPas/1M9DEkG+zqI+s5pFPa6Jdb9VgZ5w=;
        b=eWLLkP/IkR/LgOiTzbQ1JLrYcZlOm4LCKUJnbiejVk0dF0xwFnYQ2qyhRujHSQEDHN
         uehNoTZE9ZBuuGNfNdeuJpNxZFxy5eLBM+oFxtmr7bWvOvWUwOP53tGpUEL7qreesCR8
         cbDVtJpjpbL8dXOf3LNuLtq05SW0hjPmErXPzlZgHlAHOivGCd3Lu7fOs2Z/fRzev+eT
         jr/rr+SpuV9FOBXthw/P9VEgTXs4oqsQa+PYtiIm1jyGHhYbeCs3dwcwBmFAxwPQho0y
         2YRm/GsoxDOm21nqMeQbtfxItItB4rZ/+3ac2SC7go6qQbGZGHFkxpg4mPb/ClI15GPA
         RA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302259; x=1761907059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxoLsZ8nIFnPas/1M9DEkG+zqI+s5pFPa6Jdb9VgZ5w=;
        b=KmOxHESMWrezSBhJyIH7cSceJbmDX+Ce2wZsDYlO+1MdWu49OtUfptC5x0Nb1a6Kcs
         V9YAfTLD7b0jSZmEg1oBGcZrYD94cyvow6nyNKCeBx1eIfRnou0AstIQQJ5Pg1H0Y1nG
         hdzkwL6D+7F7iRiuFZi2WF0RrhScbdFrtghNPTj1+BRKKIZmcrLCsLkWhuSbZnGUQ1ID
         DV58A9jJuJGYuAAo2Bax7H/2qUuxxFErJEKRbvAyMdI7gEg0OYCHpavBDkhABri7qgYB
         PjUhiMjj2VzJF6Df7YNMsRYOGecv894SEFY50879WRsfMyohosccmJBbiVMP9iOLoXSH
         RiLg==
X-Forwarded-Encrypted: i=1; AJvYcCW3lx04SndyACKWAWAPRc25fLEdPQRZeBkdtz3e4R9i62RBGqcEIeDnujeUpiHmaCNUpw3XcFWAHwqM3K+flw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCM4c2eI8QQh4pvnxJPXqWzMYEY0uWTG6+7UnVaEecMADQfRNh
	3BddG0zr0S9dRyOt87fjWVSaYDHs0MtguS+Es6zxAhD95qT3PXqT5xJeUNoZ5Fy+vHmmU5CiZVx
	3yzFYlZK11SsjORvgiw==
X-Google-Smtp-Source: AGHT+IG53cNmqGsinKn0h9jaCGCn5QFBNWSJ/tDDHGbExfk/RNWZz5TkIUXXZ8YEkSofsYQU+YELva3WjgON5co=
X-Received: from edf24.prod.google.com ([2002:a05:6402:21d8:b0:63c:2d17:f4a8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1941:b0:634:cb54:810e with SMTP id 4fb4d7f45d1cf-63e3e586b6cmr5620231a12.31.1761302259027;
 Fri, 24 Oct 2025 03:37:39 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:37:37 +0000
In-Reply-To: <DDPPL8HKEERV.2JXDADIJPM6NY@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-6-dakr@kernel.org>
 <aPnnkU3IWwgERuT3@google.com> <DDPMUZAEIEBR.ORPLOPEERGNB@kernel.org>
 <CAH5fLgiM4gFFAyOd3nvemHPg-pdYKK6ttx35pnYOAEz8ZmrubQ@mail.gmail.com>
 <DDPNGUVNJR6K.SX999PDIF1N2@kernel.org> <aPoPbFXGXk_ohOpW@google.com> <DDPPL8HKEERV.2JXDADIJPM6NY@kernel.org>
Message-ID: <aPtW8cT5YoIGVIH9@google.com>
Subject: Re: [PATCH v3 05/10] rust: uaccess: add UserSliceWriter::write_slice_file()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 23, 2025 at 02:43:20PM +0200, Danilo Krummrich wrote:
> On Thu Oct 23, 2025 at 1:20 PM CEST, Alice Ryhl wrote:
> > I would love to have infallible conversions from usize to u64 (and u32
> > to usize), but we can't really modify the stdlib to add them.
> 
> We can (and probably should) implement a kernel specific infallible one.
> 
> I think we also want a helper for `slice::len() as isize`.
> 
> > But even if we had them, it wouldn't help here since the target type is
> > i64, not u64. And there are usize values that don't fit in i64 - it's
> > just that in this case the usize fits in isize.
> 
> Sure, it doesn't change the code required for this case. Yet, I think that if we
> agree on having a kernel specific infallible conversions for usize -> u64 and
> isize -> i64, it makes this + operation formally more consistent.
> 
> Here's the diff I'd apply:
> 
> diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> index 681b8a9e5d52..63478dd7deb8 100644
> --- a/rust/kernel/fs/file.rs
> +++ b/rust/kernel/fs/file.rs
> @@ -125,6 +125,22 @@ pub fn saturating_sub_usize(self, rhs: usize) -> Offset {
>      }
>  }
> 
> +impl core::ops::Add<isize> for Offset {
> +    type Output = Offset;
> +
> +    #[inline]
> +    fn add(self, rhs: isize) -> Offset {
> +        Offset(self.0 + rhs as bindings::loff_t)
> +    }
> +}
> +
> +impl core::ops::AddAssign<isize> for Offset {
> +    #[inline]
> +    fn add_assign(&mut self, rhs: isize) {
> +        self.0 += rhs as bindings::loff_t;
> +    }
> +}
> +
>  impl From<bindings::loff_t> for Offset {
>      #[inline]
>      fn from(v: bindings::loff_t) -> Self {
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 20ea31781efb..44ee334c4507 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -514,7 +514,8 @@ pub fn write_slice_file(&mut self, data: &[u8], offset: &mut file::Offset) -> Re
> 
>          let written = self.write_slice_partial(data, offset_index)?;
> 
> -        *offset = offset.saturating_add_usize(written);
> +        // OVERFLOW: `offset + written <= data.len() <= isize::MAX <= Offset::MAX`
> +        *offset += written as isize;
> 
>          Ok(written)
>      }
> 

This LGTM.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
