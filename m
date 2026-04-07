Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F363A4F29
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549935; cv=none; b=GQxEThgEIgVmhvoAm1XzFGK8eWXfUpXRvx2dV5Z741aU7aFJtWfx9htHIYOrOg31exlB5umy7kygIobtmf7LSrFlNI4YL0JqZxT81DsQxQMA0oYeypZ98RpAUj3a0M5dmyMRuVEIfm4iL0RcGKlC7/yYKOTel5+VLgFe8ARrvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549935; c=relaxed/simple;
	bh=LYLUvQ6xlebBuBriqu12wWfifjSTa7w0u2O+gQdvV7M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZgsF2/wkdQTf5MvAyHjZ6sitNjU1CP2cq0DEdHUf+F8g7kzKJpZdlNx6FHCdS37f3JOMivYYsKu5FiIbWHwGw4dBv4vjD5VBZu6q42uRlMF1JuNEKNVNILkWCa02cTVZWB0zcBg4s9YgomjxyU1m3Iimg5dqXzGugb30YU70h2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m5gb+JXb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m5gb+JXb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-488b171f1a5so10399295e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775549931; x=1776154731; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWaO3VI4y9RdO2vps4CUeyI90TS3EWtVsq/1g1UgIiA=;
        b=m5gb+JXbNvilWzPK9+nzS0zXYMXNTr0dE41nyUGMg+JyyUfkA1nfRjJEHSStA1ISNB
         RMZcL66A2Ar/+NGDRiWLBtLOLNGWT/S3bM3wfShZTLxyCyj/PpSm/x2UMKdFomSOsi8x
         zJ0QlbYN98TYkw3H4eV9qaK+SbWc2uARMRkSb0qHMp1cwHPhg2xaV5xbp62tjurE0b8x
         uGXlDbETuLQhM4fvApKnBKo/CUM1jyNtSUyOdazlb/ms/vofC4eW5pI1TSeVyWg1VUkk
         wWfQCl2uKncyy+4CQ4r4PFNo3vaDuSr5ghaXLGpEbkIkIk7Tx7+zh/qOOuGKdqM+g4CX
         rltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549931; x=1776154731;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWaO3VI4y9RdO2vps4CUeyI90TS3EWtVsq/1g1UgIiA=;
        b=HWNYcJGOxvbdRjMulPlfH/GwSn36vMgOPjxESu0GEjyvDmFl1l5zPaAzO0XX6WywW+
         BNflVxgEPAWSolcX1E7pH8CUnmWJnh56JAF60Hs23tiOJ1gJsNSc5jFlUfljC9T52dH6
         ZOprwp0WKcMqCScsIB3cB5wDGe3mGLtKsZCTljC/5O+rVVi4xcDC106N9GPj7T6D8Kag
         5on0rsXlSxq+4CNWqh4yrhFoLjoNrFWmkrTTWHDOJmoRKBJebtvPVb3WEPXSBYPOlVyQ
         lNfKKRrrzbbM9qXId92za/dFjD9ymIASZykhLvDq5yKr84V1f1/gU9UJPviBlrwRMoep
         1xug==
X-Forwarded-Encrypted: i=1; AJvYcCWIjxssieIjOmqgzI3O7SDUr4C/ZwCXfnP8thpIRsSostNGlUTHoyL7YJp3o4uXWN9Vl2frqnxuFPWNrAS0Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtm3JD9sFqiy5LIeXZeDToAWDHBENSedhfezp+pYsx6853L9pt
	1wJOCGtcT/UcqW14TDt2zXJvCenDu6/W+ooQYjRNH41uRGaq4jfOjRC+cnvgHinvsPF01zQd0H+
	m4UXy4xVGs5ip3gzOcA==
X-Received: from wmoi18.prod.google.com ([2002:a05:600c:4812:b0:488:ab5f:9e9e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:621a:b0:488:b675:360f with SMTP id 5b1f17b1804b1-488b6753785mr59149105e9.27.1775549931147;
 Tue, 07 Apr 2026 01:18:51 -0700 (PDT)
Date: Tue, 7 Apr 2026 08:18:50 +0000
In-Reply-To: <20260403220751.15374-3-t1bur0n.kernel.org@protonmail.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch> <20260403220751.15374-3-t1bur0n.kernel.org@protonmail.ch>
Message-ID: <adS96lmBZBcsX5mN@google.com>
Subject: Re: [PATCH 2/2] rust: list: fix SAFETY comments in impl_list_item_mod
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Apr 03, 2026 at 10:08:24PM +0000, Christian Benton wrote:
> Three SAFETY comments were left as TODO in impl_list_item_mod.rs.
> Fill them in:
> 
> - impl_has_list_links_self_ptr!: the HasListLinks impl is safe because
>   raw_get_list_links only compiles if the field has type ListLinksSelfPtr,
>   which the type system enforces statically.
> 
> - prepare_to_insert: the container_of! call is safe because links_field
>   is valid from view_links and Self: HasSelfPtr guarantees links_field
>   points to the inner field of a ListLinksSelfPtr.
> 
> - view_value: the container_of! call is safe because the caller of
>   prepare_to_insert promised to retain the ListArc, and Self: HasSelfPtr
>   guarantees links_field points to the inner field of a ListLinksSelfPtr.
> 
> Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
> ---
>  rust/kernel/list/impl_list_item_mod.rs | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
> index 5a3eac9f3..2d1f4723a 100644
> --- a/rust/kernel/list/impl_list_item_mod.rs
> +++ b/rust/kernel/list/impl_list_item_mod.rs
> @@ -86,7 +86,11 @@ macro_rules! impl_has_list_links_self_ptr {
>          // right type.
>          unsafe impl$(<$($generics)*>)? $crate::list::HasSelfPtr<$item_type $(, $id)?> for $self {}
>  
> -        // SAFETY: TODO.
> +        // SAFETY: The implementation of `raw_get_list_links` returns a pointer to the
> +        // `ListLinks` field inside `ListLinksSelfPtr`. This cast is valid because
> +        // `ListLinksSelfPtr` is a wrapper around `ListLinks` and shares the same memory
> +        // layout. The macro only compiles if the field has type `ListLinksSelfPtr`, which
> +        // the type system enforces statically.

No, `ListLinksSelfPtr` doesn't share the same memory layout as
`ListLinks`. It has an extra field. The cast is okay because of the
repr(C) annotation.

>          unsafe impl$(<$($generics)*>)? $crate::list::HasListLinks$(<$id>)? for $self {
>              #[inline]
>              unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$id>)? {
> @@ -274,7 +278,10 @@ unsafe fn prepare_to_insert(me: *const Self) -> *mut $crate::list::ListLinks<$nu
>                  // SAFETY: The caller promises that `me` points at a valid value of type `Self`.
>                  let links_field = unsafe { <Self as $crate::list::ListItem<$num>>::view_links(me) };
>  
> -                // SAFETY: TODO.
> +                // SAFETY: `links_field` is valid because `view_links` returned it from a valid
> +                // `me` pointer as promised by the caller. `links_field` points to the `inner`
> +                // field of a `ListLinksSelfPtr` because `Self: HasSelfPtr` guarantees that the
> +                // `ListLinks` field is always inside a `ListLinksSelfPtr`.
>                  let container = unsafe {
>                      $crate::container_of!(
>                          links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
> @@ -326,7 +333,11 @@ unsafe fn view_links(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
>              //   `ListArc` containing `Self` until the next call to `post_remove`. The value cannot
>              //   be destroyed while a `ListArc` reference exists.
>              unsafe fn view_value(links_field: *mut $crate::list::ListLinks<$num>) -> *const Self {
> -                // SAFETY: TODO.
> +                // SAFETY: `links_field` is valid and points to a live value because the caller
> +                // of `prepare_to_insert` promised to retain ownership of the `ListArc`, and the
> +                // value cannot be destroyed while a `ListArc` exists. `links_field` points to
> +                // the `inner` field of a `ListLinksSelfPtr` because `Self: HasSelfPtr`
> +                // guarantees this.
>                  let container = unsafe {
>                      $crate::container_of!(
>                          links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
> -- 
> 2.53.0
> 
> 
