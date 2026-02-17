Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B3D36EAB8
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771347327; cv=pass; b=FypFbKa4Ap+8axGhI65LZjLnqUwxzsl3YqWfBVG50PcjYkAtXAiZ0ABL2OXvX6Gyxm3/7zWwZMzflSm8UP8cMksMZGNWP99UQYfOgsysBoFunUWfXqd+oKJKQjaPwGDYFA0PVod9PNJ/BZi/Ua3aLJS0FjNkzHfyAB8FITcqHjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771347327; c=relaxed/simple;
	bh=sBmFCIoWaZ2j7z14S+ATVAcnlO28ckHXldqUBaTsEi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUW9gfS30+KJws6hgu4vzQJYf47hh0mg0Rb26u6A3gl/xJBSxXrdhGrIhR2alrTg8iSAe7dw2nSlBYgKwyfRT4Cq/PmQdWMvlAMeU2Kh5mjf7qdE0nMUhXQZ+7RYoGpjpGGf17LyKLaKE4RBYMy6pEHtsv4TpV/BNsHDrpdJw+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yRlyzAVw; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yRlyzAVw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a38c42037so23004a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 08:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771347325; cv=none;
        d=google.com; s=arc-20240605;
        b=OtbOAufDXxypwPpI9XGkWRVaLPVNNJT/VHaLtzb1L+gU38fDmsOdBAXUFzHxMsfkna
         nmIzeK1yKKbaWZbvbh0x0m6cgimjDsG12gf9JUNYPT5xQhH6hn3uDrC6ze4olRxb2Viu
         wSKY5UvtSNs5eLcg0IJiB+sfHsHgH90l7aSc47Yua0tJydSFi0CFeiGU0fjOI5Y0Ehju
         KZ75iVrvgeMx8tl8zv0RIrIi8yJ0WyX9ak1G3GKHXUzSkSqi23uY3BKNgESmYcsgU1sv
         CRYGVF57JVYzQZudjRZRCuE3ywlMJFV+K/7tAIw0H5GcwzrvTD2U0mfdzdJT/Qn0roMJ
         BLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sJ2rqxYuKMwKtIc1bHNkX7YmlF2LDfgfhBLsz256tX0=;
        fh=wlRttb2nfvaTHozAd79xjizrNo9QX9cCOiMzGTx73Jc=;
        b=OyLh84V3yNO7yQ0epr4d8AQQ8aQRRQfvR/BXxCBIjQuCdBSVTlKF9gKxm1D3BF7+QM
         nX2BeJdstuGUv6QD4ItqJxJnImdP0DDibtt6bJl18w7Q41XrU6j9pIsvXViQsQaoTbNc
         Wu/eNDAhhhlzCXKHsb6OLjEfBalmdfppIkRiOTHP9gndbX1PcDbpC8exTtTI/ZerJhG3
         RPXxjXpps4Ug8z7Kz2l9SdyK2n9ND/0Zj4v/muhq1aH5oUwsgGEp4GgXK4MoCWuyx4hR
         zxgl8gfAmsj5mPksTffS7LoETMpjQKohFH0w3g6/Sx66qpBT29h5jDdH6ra75h3hjqRh
         +18g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771347325; x=1771952125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ2rqxYuKMwKtIc1bHNkX7YmlF2LDfgfhBLsz256tX0=;
        b=yRlyzAVw4X6QX5IWf25oEupHdEdCscArql7+zV1MHwcsocf/JEN0hBKJrF2tAyO0dg
         DTUO7yveurNZxHBWchp/F3/1LSWBbxRL8sGVQ6zZCo85l0zE+61GItybsJx3nK/f0BNh
         lUzLI6K110XrQRdseWyNw62OkAH1A/45v9c3ycUcpTS1PwH82XHfXpoIRFaXNFi7naq6
         uufqyCmGVf5QBbsi87cLvLs9m98DkCWoeLEgdv30jUQ/KqlcBR2yub1zb5j4o004Ltsb
         n/0KydKTGDM8tI0h6BIKWNMTCeEazdteUNXgG3WFiRZh4zxZqj8mkK5Y7mUL/K/OzKxl
         sjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771347325; x=1771952125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJ2rqxYuKMwKtIc1bHNkX7YmlF2LDfgfhBLsz256tX0=;
        b=DWfnzRzyXnTlb1mB8G5og437D2K/Tu3kcLNpH5MX8eiqyXt84FFBk+HHBxse4pn0SE
         z1fZZPfCWXnZragNFWDhqW7+C7EibgC59Kks0WtU5tuWYFmWHc5dbyaIxMxImlGiUF3P
         mWAvaRq5TUxS1zjXQ9/YII0yGIWEbqkD58XG8T4GigMf2H6/tlpBZJNw0czdjExh5dcx
         9HVLyU7OjF53ndJpV/Ni8ST9jS5UE+0T063+ujeqIK4m7SlLplk5Azte9L5ikRuPdsBg
         u64tIU8CvBmOpoyXzvF3Lf48e+v3lfsjJepy1+JlWsJN0nMUm74kKJ00h6dHWaFFvy+I
         mRLA==
X-Forwarded-Encrypted: i=1; AJvYcCXaacfv13PRXBLx6bsWzrgGsA/rAyMcsExisoX+64q1Hw8rP7eCWlIrn/2JYpOtTw7zkh51yrJgA/QVBhb+0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvHN82LV323NQgh9Ttf+8WiG1D5q979al9ES8wGGt0V5FjuIIY
	VbXYI/88B5f2o7lJ0eEidLWay0ZxTllWe9WER1pwTLNIBE8Og7yXJzTE6A8FQQnRmsa1uJ0BQx0
	rrHcuR4Eea9g3OjKLrwcfrmUVQaoBIQxm5Wtdgsvs
X-Gm-Gg: AZuq6aLJ9a3ZWGWDQ2Q3sE9a8uPVFsJqTJYdh4xqAovk9ENFamGayHddnBs59JAH0B1
	HoFXhSNR161ujpZ0jxGQFppbliJLIKzt86/1QMHl3RtvGyaAk4dy6tWlUYgRqKh43XnMljWk4cU
	+KcHSd/h2ScT4Jk0fdJafsQO2oARLdWLUji1v6rSmRT2YQlQXiyO24d6p6XXGvtoXzi3KadiiqG
	4DBMGk16MXvz0fU2v7I+Qp7+ESc909txqr9qGxrdryMQdxcxBfG5UFwwkAXHg9PQYxTESkZUNKV
	LzStMy+a3uL2YsYRJIilfgFmiZuVmpL78CYJ3g==
X-Received: by 2002:a05:6402:b18:b0:658:1d3:33c3 with SMTP id
 4fb4d7f45d1cf-65c14a4fe33mr56118a12.8.1771347324036; Tue, 17 Feb 2026
 08:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com> <20260217-binder-vma-check-v1-1-1a2b37f7b762@google.com>
In-Reply-To: <20260217-binder-vma-check-v1-1-1a2b37f7b762@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Feb 2026 17:54:46 +0100
X-Gm-Features: AaiRm53xdNxP3D4hVKWPqXGAMAozDOb21HTNRGps1S3nOEwdUFrseEV130fDG9Y
Message-ID: <CAG48ez2mUQ-D3jpPbvdZzcOz16LMXRnzcudOZsfdoftBF5yvPA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust_binder: check ownership before using vma
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 3:22=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> When installing missing pages (or zapping them), Rust Binder will look
> up the vma in the mm by address, and then call vm_insert_page (or
> zap_page_range_single). However, if the vma is closed and replaced with
> a different vma at the same address, this can lead to Rust Binder
> installing pages into the wrong vma.
>
> By installing the page into a writable vma, it becomes possible to write
> to your own binder pages, which are normally read-only. Although you're
> not supposed to be able to write to those pages, the intent behind the
> design of Rust Binder is that even if you get that ability, it should not
> lead to anything bad. Unfortunately, due to another bug, that is not the
> case.
>
> To fix this, I will store a pointer in vm_private_data and check that
> the vma returned by vma_lookup() has the right vm_ops and
> vm_private_data before trying to use the vma. This should ensure that
> Rust Binder will refuse to interact with any other VMA. I will follow up
> this patch with more vma abstractions to avoid this unsafe access to
> vm_ops and vm_private_data, but for now I'd like to start with the
> simplest possible fix.

This sounds good to me.
(Userspace could still trick Rust Binder into accessing the VMA at the
wrong offset, but nothing will go wrong in that case.)

> C Binder performs the same check in a slightly different way: it
> provides a vm_ops->close that sets a boolean to true, then checks that
> boolean after calling vma_lookup(), but I think this is more fragile
> than the solution in this patch. (We probably still want to do both, but
> I'll add the vm_ops->close callback with the follow-up vma API changes.)
>
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Reported-by: Jann Horn <jannh@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Jann Horn <jannh@google.com>

> ---
>  drivers/android/binder/page_range.rs | 78 +++++++++++++++++++++++++++---=
------
>  1 file changed, 58 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binde=
r/page_range.rs
> index fdd97112ef5c8b2341e498dc3567b659f05e3fd7..90bab18961443c6e59699cb73=
45e41e0db80f0dd 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -142,6 +142,27 @@ pub(crate) struct ShrinkablePageRange {
>      _pin: PhantomPinned,
>  }
>
> +// We do not define any ops. For now, used only to check identity of vma=
s.
> +static BINDER_VM_OPS: bindings::vm_operations_struct =3D pin_init::zeroe=
d();
> +
> +// To ensure that we do not accidentally install pages into or zap pages=
 from the wrong vma, we
> +// check its vm_ops and private data before using it.
> +fn check_vma(vma: &virt::VmaRef, owner: *const ShrinkablePageRange) -> O=
ption<&virt::VmaMixedMap> {
> +    // SAFETY: Just reading the vm_ops pointer of any active vma is safe=
.
> +    let vm_ops =3D unsafe { (*vma.as_ptr()).vm_ops };
> +    if !ptr::eq(vm_ops, &BINDER_VM_OPS) {
> +        return None;
> +    }
> +
> +    // SAFETY: Reading the vm_private_data pointer of a binder-owned vma=
 is safe.
> +    let vm_private_data =3D unsafe { (*vma.as_ptr()).vm_private_data };
> +    if !ptr::eq(vm_private_data, owner.cast()) {
> +        return None;
> +    }

(And the ShrinkablePageRange is only dropped when the Process is
dropped, which only happens once the file's ->release handler is
invoked, which means the ShrinkablePageRange outlives any VMA
associated with it, so there can't be any false positives due to
pointer reuse here.)
