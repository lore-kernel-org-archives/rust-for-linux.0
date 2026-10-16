Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084C49BB63
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176124; cv=pass; b=bWzFge6RW5dSv8a+tHfH5hiNTS0Fp+4EeC+ko/w5of2b+GuEFu1SUMiJQDvBTmdDLR8TwblvqsgZPZwX96vpDuh449Ju43BwuFKb7etcmohh1DKFGIwwf2vVsc/OxdnFs077+8LjKJ+1+DuKxoyLDZQ+HLAP2eP+jEfhtKN1zJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176124; c=relaxed/simple;
	bh=CMHgJrH9XVdYO4T4rQoWxXZzZma1VoOICvB9CRktih0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZNfJQIRa8yA72qokDMsj/ktY4r/VgW+PxouKs6HwuxLlIVf4jVQhZd+9DoIaUv/7MpCN/7JWocRLc04sNTFF7iMxr1AXzasJDIdJuf0/1/33ozslFdZbWrK2XAzA4eiw1JBM6d1bHBW+XmSKnofXnWdjEBgOpz73NtoVp1uYwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ccfFf5Ra; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ccfFf5Ra"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a018493d57so9145e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 11:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176121; cv=none;
        d=google.com; s=arc-20260327;
        b=VV0e7QyH0fBHSUAx8OSR00sBUu69z0UlTYvUu19AKoD53l4borkowJ1zegA7OJmKWX
         qnKuQ4YA4RVOJ9U9hXSTK0DEq/gRCNkGOLBGWa+u6DqpsVdBaoaeUAKdLLtEX7ir8XbH
         TyMc5Wln9vSfO2aTG42ZaPiltnPzalwAAbis7SIiSM1H9QMPtOizXbs/QoNm3IL1tr8O
         VFlkJxutwoUavSbDaroTr7oSKjqfia8y38fY6thMZzT9bH66Q9VZ0gMKEjjt7ygQZSZ3
         A+iowakKN4yXlUuu8c9KhnS4gkKCfUV6cnzXsgDye5ohFAJg2N/jKg4LQWA/1sduHgRx
         Hdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4MGdpuHW/L5Zmmr4IQf9JmPKDG4lNfOLKsaZahdnDXI=;
        fh=7k9yYghDoBPXH1fwFZLPTfpx0aq/tKDxSL9kAUTOqmA=;
        b=Kd1BaUVkB7j/eyCJ8MJyRGeCd6z1PEwKO0fiNYwSJidE5CwxVsYJ5qdV/LnolZ6AHN
         FMZvIKkrdtQqyf5aiGLf8NjBw6gGX1c+28NO0hqtnMGrdryLQbJGxUssSYnRupwp5XZ5
         6GIS/KhqhDliNn+jXKnzQMkKYe7bAJ3ikxCx+JHpSQ7SEL9Ggj4mngJ9462+4gooqkhU
         RH82sGVABgFj0gf4AzxrLYbqroMUK5NfnzYUehOnxU1Fzexjop9fl7i/dF6a3lXrd8GH
         GpuQmi5EXuIxBXaaBVQYEkf/CWj46mh9NGLHGZdfWC7FfB3n+MNp8IuD+DQc61xusJ1N
         cUdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792176121; x=1792780921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4MGdpuHW/L5Zmmr4IQf9JmPKDG4lNfOLKsaZahdnDXI=;
        b=ccfFf5RaYmHUw+upk/3xQTf7BTM6YNxO4FozswEmV45ducckNecEzl+w6dtcArzptf
         O5tkO0ZFdoGyneotoWg82ZKVF+V8hJ3/iLpJgBxjq9ADya0LucwrdE7EDrTgcW93RWi4
         bMTL5HV8I6oU7E5vtxLcGOViyzaFClbd7T+LVm9YFdmgjO9mgcykm//lpvzVaz0ur99m
         ch0fUSKroo+HT+ksSsPcqJzEI8Evxr0XFri6wuoxcaXKOPWTs2Cy1jhrN6oqbd2eDi0Y
         WtktJSzfkZ7EVyfXJlVYqQqdsbZeG71Pe9l5edSABfIb16qCzk2E2WcPj58P+vlLGUBm
         BbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176121; x=1792780921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MGdpuHW/L5Zmmr4IQf9JmPKDG4lNfOLKsaZahdnDXI=;
        b=jCaZ54HengpIOF8/PasNl+dBe59b5OLBzhcO2VYg5TGAViqwmPSS9l/mnm57qdsbTk
         WGXLohY/ml3gtkWJ4lq7njjI+6WHkRW/pZ91iW0OiYdDlO5CBhq1P94TDROamG3TC6u8
         Xr5qzsOIbITg4KHYuqU5pPe+ba0vsk1biyIGcAiZIdCyaOgQ6Fn/Oj/WUMbNciAsqPMl
         0eKJLkJl1aXsLFPcXqTwT/MTVJrOBVoHPBEvIcQynptxrifnu4M7jeW5akzPRqJoTl9i
         eHmKhOPvJDMteZUGYV+a8xzCMwQlGRAJ91TbAjB625FgkvLZttH/Y6Pd/x5rU+dL9Pt8
         Ybrw==
X-Forwarded-Encrypted: i=1; AKwUvBxO8YdLVunw2ee8BkjIsxWCKeuJfvLg6Lb95z1KnSJqxoIGXLnEytuWnA1v/V/ElB4Vjs44qgZtcwTPldjc2w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKYYLdCDTpTUSfBcjnQFJAdZAofjKB1NJnGPO6SXKYRZUBAXxBF
	B7vK47eozmFGk4+d95a8tuvCSZzTivfzWsUf25IeaLlowbJbzUMmmWgPrlSGGUWeL4DIkEeY/c7
	EJ6Gge1mWCGRzeUWO0xRf04RNXmCs5s864ElWp0rl
X-Gm-Gg: AYBFou17NYs/sjtr2aKTb0BIT0fmdoYDXfmK/ATqJc0ap5bUcAYFSDypWUqEFtJv4hp
	M16K9O5vlAuho0HQXB9QacHdsnESHD2FCeQQuJEt3XNmC0oBypHgUjJrBS5qFEhuMnedVjZ76VL
	zr0n8A0GYnUHxgQ7wJf535NPCEf4LhLpvDJ68mXnbNs6Zt74bHpUxH8ozXZN8UuqaF0sjwdI6Ks
	6cc2aG0YZG89xsK5e5/GdPU0WID1n+IpAhieJ3n8eRYixnEQZvbVNsG8NkJb39atNFxfyTurwUJ
	n/xeC9ThJ/3+JjQ3FCmrd4G2q4ODFn5pKw4PEEUwhin4incbeTw9J7OnCZQnmvbzD/nXfUukkCE
	XIIzXJ2VcP6p3O0m9ujXOcA6iPfh37y10DesgvHpjpQ==
X-Received: by 2002:a7b:c3d1:0:b0:4a1:d373:5759 with SMTP id
 5b1f17b1804b1-4a1d89362c4mr66215e9.8.1792176120903; Fri, 16 Oct 2026 11:42:00
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com> <20261016-binder-memcg-v1-1-d659b8ae088b@google.com>
In-Reply-To: <20261016-binder-memcg-v1-1-d659b8ae088b@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Oct 2026 11:41:47 -0700
X-Gm-Features: AclHuK9APEBKrgB4cPVdNX9-JhNjIO32BvrHhv1beJHZa-WfokICUu6lsS8CM-4
Message-ID: <CABdmKX1L36W0aZmhmOgTJTJwoMA+t4PG4ok3++G6Ggfg-RvfFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: page: add Page::alloc_page_memcg()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Pages allocated on behalf of a userspace process and mapped into its
> address space should be accounted to the process's memory cgroup. Thus,
> add `Page::alloc_page_memcg()` to charge newly allocated pages using
> `mem_cgroup_charge()`, and switch `Page::drop()` from `__free_pages()`
> to `put_page()` so that charged folios are uncharged when freed.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/page.c | 17 +++++++++++++++++
>  rust/kernel/page.rs | 50 +++++++++++++++++++++++++++++++++++++++++++++++=
++-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/rust/helpers/page.c b/rust/helpers/page.c
> index f8463fbed2a2..145758a8a954 100644
> --- a/rust/helpers/page.c
> +++ b/rust/helpers/page.c
> @@ -2,6 +2,7 @@
>
>  #include <linux/gfp.h>
>  #include <linux/highmem.h>
> +#include <linux/memcontrol.h>
>  #include <linux/mm.h>
>
>  __rust_helper struct page *rust_helper_alloc_pages(gfp_t gfp_mask,
> @@ -10,6 +11,22 @@ __rust_helper struct page *rust_helper_alloc_pages(gfp=
_t gfp_mask,
>         return alloc_pages(gfp_mask, order);
>  }
>
> +__rust_helper void rust_helper_put_page(struct page *page)
> +{
> +       put_page(page);
> +}
> +
> +__rust_helper struct folio *rust_helper_page_folio(struct page *page)
> +{
> +       return page_folio(page);
> +}
> +
> +__rust_helper int rust_helper_mem_cgroup_charge(struct folio *folio,
> +                                               struct mm_struct *mm, gfp=
_t gfp)
> +{
> +       return mem_cgroup_charge(folio, mm, gfp);
> +}
> +
>  __rust_helper void *rust_helper_kmap_local_page(struct page *page)
>  {
>         return kmap_local_page(page);
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 1c0796ea229f..7a36b7dd6c9c 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -10,8 +10,10 @@
>      bindings,
>      error::{
>          code::*,
> +        Error,
>          Result, //
>      },
> +    mm::Mm,
>      uaccess::UserSliceReader, //
>  };
>  use core::{
> @@ -195,6 +197,28 @@ pub fn alloc_page(flags: Flags) -> Result<Self, Allo=
cError> {
>          Ok(Self { page })
>      }
>
> +    /// Allocates a new page and charges it to the memory cgroup of `mm`=
.
> +    #[inline]
> +    pub fn alloc_page_memcg(flags: Flags, mm: &Mm) -> Result<Self, Memcg=
AllocError> {
> +        let page =3D Self::alloc_page(flags)?;
> +        // Note: Charging the folio with `mem_cgroup_charge()` only work=
s because `Page::drop` uses
> +        // `put_page()` (which uncharges the folio before freeing it) ra=
ther than `__free_pages()`.
> +        //
> +        // SAFETY: `page` was just allocated, so we hold the only refere=
nce to it and it is not
> +        // yet charged to any memcg. `mm.as_raw()` is a valid pointer to=
 an `mm_struct`.
> +        let ret =3D unsafe {
> +            bindings::mem_cgroup_charge(
> +                bindings::page_folio(page.as_ptr()),
> +                mm.as_raw(),
> +                flags.as_raw(),

I wonder if we should we mask out __GFP_ACCOUNT from flags? It's not
provided by the new caller in the next patch, but it could be included
inadvertently in a future call elsewhere. The VM_BUG_ON_FOLIO that
checks if the page would be double charged only happens when
CONFIG_DEBUG_VM=3Dy. Without it on production builds, folio->memcg_data
just gets overwritten. We'd probably catch that eventually in a
CONFIG_DEBUG_VM build, but not sure if we should rely on that. I don't
feel strongly, just


> +            )
> +        };
> +        if ret !=3D 0 {
> +            return Err(MemcgAllocError::Memcg);
> +        }
> +        Ok(page)
> +    }
> +
>      /// Returns a raw pointer to the page.
>      pub fn as_ptr(&self) -> *mut bindings::page {
>          self.page.as_ptr()
> @@ -376,7 +400,31 @@ pub unsafe fn copy_from_user_slice_raw(
>  impl Drop for Page {
>      #[inline]
>      fn drop(&mut self) {
> +        // We need to use `put_page()` instead of `__free_pages()` to pr=
operly handle memcg
> +        // accounting.
> +        //
>          // SAFETY: By the type invariants, we have ownership of the page=
 and can free it.
> -        unsafe { bindings::__free_pages(self.page.as_ptr(), 0) };
> +        unsafe { bindings::put_page(self.page.as_ptr()) };
> +    }
> +}
> +
> +/// Error returned by [`Page::alloc_page_memcg`].
> +#[derive(Copy, Clone, PartialEq, Eq, Debug)]
> +pub enum MemcgAllocError {
> +    /// Allocating the page failed.
> +    Alloc,
> +    /// Charging the page to the memory cgroup failed.
> +    Memcg,
> +}
> +
> +impl From<AllocError> for MemcgAllocError {
> +    fn from(_: AllocError) -> Self {
> +        Self::Alloc
> +    }
> +}
> +
> +impl From<MemcgAllocError> for Error {
> +    fn from(_: MemcgAllocError) -> Error {
> +        ENOMEM
>      }
>  }
>
> --
> 2.56.0.212.g129ede20d9-goog
>
