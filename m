Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B38831
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732659006; cv=none; b=VYN2+gpsMO/zhQOQJreWek1wAoy0Xq8dR+PyIW98/D65DdxGiJ9nlyciziUJncTm358yuN1V3FT2iiYDjWhuoy8uyqx5U3zPWgkuhDAFOx+diYLeSvGbCRt0HHXhKTJKM5y5ggQAemkFByAPCT3q6hdM74bsO2LZ32h07lJ52Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732659006; c=relaxed/simple;
	bh=gD/Fl58jPDD02j64XV/US3xuNiNDOo0k69sMnhhKohA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0SAkuXKJpEUNX1dF/HnpXm5QKsD0cNOJMImCuX1W1Nd7Z9i6Qi9nuK2OuM/ya57UnTsK/JNw4EWcWt1MuzdSFuP1torJl0Q1apkQ3kEDsqOomcDAwmdyoJsKQSd5HqdmD5+b7jsKD4kSv7KaajQdk/G3+lrpuTibZ5b5tV2tB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XQ3C0bhF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XQ3C0bhF"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so1094a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732659003; x=1733263803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTHMkYV876MVEV7+UBcdVp/IpT8KJSz6LBKIAJTo1ww=;
        b=XQ3C0bhFLtHdyWeNSP9Dluiw5QDApkc7gnAdBZLxk9T8TiL6k9QuKSDAm87UPDM2XY
         oifh9LMFZLUDACeJromyi/em2asLh5LUc0GCTiBWyAnemRVXnuzPW/fNs5wmeFFk9Ft1
         6WEK9xGX+dlJpO3rvIdeOHFHrjmQ8P45lODxWS+MwYKMWKJWpZiO+pboFxJFeP8FkIn6
         aEinyKfisajHoPcmaX4lsFdnTVOUj0LwWwHfdKwCOv3A5yj1XmReiImpCW0HrUkTui8v
         GkCrpPT9o88ndjKvZPuK+qRvH3Qf0BPBX4weeubYlf78hQ9PqYWQRXr2MWM0WU4zCsck
         JTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732659003; x=1733263803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTHMkYV876MVEV7+UBcdVp/IpT8KJSz6LBKIAJTo1ww=;
        b=BZuWMDLo1KZ17yBTJOoi/r9ZU2olsLVPOBxs1bmrRWseZ9Ogigm5/FLNTfpQQY+7Vt
         L0TaHbZlHm1UnbDdrPovYR4jktlRKinuYjfpEGbyG/O0vnWZU7ko23bOua9Rj2Is/nkR
         KuVDvXs0w0M+OVMTfoUS4EfaQ8L7lUxWKzDd7qXyDNmj3R9dEeaTyd6P0V/oXWMiySdZ
         rcY4pQ1SoDZrZ2T/ob01Zrdj25Jk53BfnphelDRSk/4q9CN+BJ+hIk8DqBSlqSD6Et6t
         gZNn36iv9tViUY6jZ3nYDOzTcnfSLlYrMGYhzpTYd4dtuQ6jjvar9+RR0ldp4/MGJcIA
         14Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXwrZh9b2KnxXG/C6lkEiiwm3/bTJgxD/fn/o9F9kAHeK21AsFw1h1ZvBhxhMkHbx42cPbBcz0lOIjzGGpN3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6NNXZHbm4o1Q2ltyJSRHN9605f1UGstwGQ+htO7h/lAvbUxuW
	UGU7luWRwelCJJaLgfz0rBfz9Bt5cMHF3hloGXsxWhKXU+qZdcLpKqly2JUVoEsGTs0RjbFsWl+
	ccBuFW29FtmoOr/sbqd0L5ZeK3i5V32iwqZBM
X-Gm-Gg: ASbGnctDMhfuaHHlF9trA5vriulthfycOdtUboSFfR1ClQroW3+pNKqa0loaRcSnsxw
	Z0Q5BFkPPSJDFb47gw6H4jSOU3OYB+jU27y/3yTEmVMyDajDVhuhQPLaOjfM=
X-Google-Smtp-Source: AGHT+IE2cdAOzjSAFTZV8v2SjKZv2gEDrSa393KXeU/LpDA2nLaDQHfynGcUNHb+iTrSQ3oWWXDj511vbJbEcsHiScM=
X-Received: by 2002:a05:6402:1774:b0:5d0:78d0:f845 with SMTP id
 4fb4d7f45d1cf-5d081159fccmr24776a12.2.1732659002867; Tue, 26 Nov 2024
 14:10:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-2-7127bfcdd54e@google.com>
In-Reply-To: <20241122-vma-v9-2-7127bfcdd54e@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 26 Nov 2024 23:09:26 +0100
Message-ID: <CAG48ez28kzjrvMN66Yp9n+WziPzE5LU_Y320405Q=PoOzdzStg@mail.gmail.com>
Subject: Re: [PATCH v9 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> This adds a type called VmAreaRef which is used when referencing a vma
> that you have read access to. Here, read access means that you hold
> either the mmap read lock or the vma read lock (or stronger).
>
> Additionally, a vma_lookup method is added to the mmap read guard, which
> enables you to obtain a &VmAreaRef in safe Rust code.
>
> This patch only provides a way to lock the mmap read lock, but a
> follow-up patch also provides a way to just lock the vma read lock.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Jann Horn <jannh@google.com>

with one comment:

> +    /// Zap pages in the given page range.
> +    ///
> +    /// This clears page table mappings for the range at the leaf level,=
 leaving all other page
> +    /// tables intact, and freeing any memory referenced by the VMA in t=
his range. That is,
> +    /// anonymous memory is completely freed, file-backed memory has its=
 reference count on page
> +    /// cache folio's dropped, any dirty data will still be written back=
 to disk as usual.
> +    #[inline]
> +    pub fn zap_page_range_single(&self, address: usize, size: usize) {
> +        // SAFETY: By the type invariants, the caller has read access to=
 this VMA, which is
> +        // sufficient for this method call. This method has no requireme=
nts on the vma flags. Any
> +        // value of `address` and `size` is allowed.

If we really want to allow any address and size, we might want to add
an early bailout in zap_page_range_single(). The comment on top of
zap_page_range_single() currently says "The range must fit into one
VMA", and it looks like by the point we reach a bailout, we could have
gone through an interval tree walk via
mmu_notifier_invalidate_range_start()->__mmu_notifier_invalidate_range_star=
t()->mn_itree_invalidate()
for a range that ends before it starts; I don't know how safe that is.

> +        unsafe {
> +            bindings::zap_page_range_single(
> +                self.as_ptr(),
> +                address as _,
> +                size as _,
> +                core::ptr::null_mut(),
> +            )
> +        };
> +    }
> +}
