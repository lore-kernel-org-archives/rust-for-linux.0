Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4116139D12
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723621911; cv=none; b=XMA4cCNzZTXG7XAx3z8jyveRR6bvuqldezd+JV1Cy1X/MAGu5NK7ZScMK+JSr0Wnj6fhm+jbwQjUzadieDgtWdjfCn5cN5wJ2z8ltNQXY21AoJt9CcO+AFJpLFYrQ/YmDgrzus+waMBo93oES8uFd8hwLcvOrcpLrovHk9bd5/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723621911; c=relaxed/simple;
	bh=WDW6rQ/apBzDjXQSNnDaeNH9u9GWWkZywdFllnX/IOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQqN1lZXzKl69RnrCEgiwLrWZThH17reqqwRBtBdrq+in19u2NkJJ70eI1wtEYpjjGcp9T7ZnXhMgWSeoBAsUrVWQ4x7kL/DMu6jpdSbP42VJT1D9DZmwh3P2pXQv+gluUDySsSfh4Bh5+dUXdwvBvjdk50+yIAK3NPZaNXWgg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N635iou6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N635iou6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso11909525e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723621908; x=1724226708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT+zi+/D9eO+wh878fg/U/GNgg7iPwjsl30b4TPDHZA=;
        b=N635iou6uTv9OX7tD+53GwPt2gr6bcHjSFYt+5thA30IGCUAeJLIYcltUlUo2u71KE
         idYyuZ7JhC/llSV9f0AYr5vQjXn6Ez552117dKI9qOMR2xzDaiklEuKJTFW9737GvhLe
         hIaMZou51wPFGiRCe5rlSKbgCIj/sCsDPHbs0rL7kC9lFXEeRVU7iQcEXD+5c3YYjreP
         JFl3ZP5EdfGToZwMz/jQ/Ab1jRIq+wkY5phiHTEhFt4hAxjrP/NutR+XJOCdtWK2wzga
         oT+U3zQ8koOysoMcrc/ZgI4xsAyZaTjmdYcff4/szq31QJUyIzia/J8vS+NEXCstxJND
         VVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723621908; x=1724226708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PT+zi+/D9eO+wh878fg/U/GNgg7iPwjsl30b4TPDHZA=;
        b=CAsDyoAhmrKTNIqrepB6ZBR9pFLSyw21MbzN2Q0lWMhH6BhAuC6lJCit83e5EZxVNn
         EtjMGMNUcTPftuyZvIvVDrLP5cf+QFB8t7Jp4gt5KNlyZ2rwkMk/iqoYCZObeigHSvC4
         BwvfPDp2t7vj73EPT1kwKmkZ5P1CVTgNzS1ImIuEqptEfXwCkicJp76+3cRbQCvQD7az
         8kkuUykglZwVSihMlUW/0rYygnHmymwXv6rrGXamIN9S/MEA1XeSi68K2FCWHgugltyQ
         ITOu1wIiWyOr65EwW9XpxlRl3R19ZLshh39B9DClH7tFGjCyeQSetwKmDnNU2KVsM6Fg
         NEog==
X-Forwarded-Encrypted: i=1; AJvYcCWfbX24R02BhUIl7+ycuHC4KXOcGlJMB/L0sRdLIu4wiXLY6IK0o06I7XZdX4ytdLVMuYzIvY5vaxYHcznypKcS36VOmEUntEIvari1lmg=
X-Gm-Message-State: AOJu0YyeJ7xgS9qbqjuC5vOJz1QTvlRwmmVW0mHtXXPjeXKQr8SOnbYS
	0nKREWjzAJn+aB/Kv+Mxz5TcEK6q82WuEyRamA+u52yScA9dMbV9UO/nI5i2JAl2P7gf32yqoYt
	eD1lbL/vnFY2kbIuqtrkLvpstm49OcKqydHAN
X-Google-Smtp-Source: AGHT+IHNC/TFNKG7R4ZRJeXKfO788rQbS5/gH98Hg+wPjB1fBpqR9ujBShpY4AhPDFKtH2Hl4xoiX6/Le5LMbGM4xCI=
X-Received: by 2002:adf:e703:0:b0:367:4dce:1ff4 with SMTP id
 ffacd0b85a97d-3717775ae03mr1628464f8f.14.1723621907725; Wed, 14 Aug 2024
 00:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-5-dakr@kernel.org>
In-Reply-To: <20240812182355.11641-5-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 14 Aug 2024 09:51:34 +0200
Message-ID: <CAH5fLgit0hSFWi_Bv4DFK6vvhoLfSz=BMaPDBU0Z0oyZta9U9w@mail.gmail.com>
Subject: Re: [PATCH v5 04/26] rust: alloc: implement `Allocator` for `Kmalloc`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 8:24=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Implement `Allocator` for `Kmalloc`, the kernel's default allocator,
> typically used for objects smaller than page size.
>
> All memory allocations made with `Kmalloc` end up in `krealloc()`.
>
> It serves as allocator for the subsequently introduced types `KBox` and
> `KVec`.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/helpers.c                 |  3 +-
>  rust/kernel/alloc.rs           |  2 +-
>  rust/kernel/alloc/allocator.rs | 63 +++++++++++++++++++++++++++++++++-
>  3 files changed, 64 insertions(+), 4 deletions(-)
>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 92d3c03ae1bd..9f7275493365 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -193,8 +193,7 @@ void rust_helper_init_work_with_key(struct work_struc=
t *work, work_func_t func,
>  }
>  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
>
> -void * __must_check __realloc_size(2)
> -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
> +void *rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flag=
s)
>  {
>         return krealloc(objp, new_size, flags);
>  }

Why are the various annotations on this helper being removed? This
deserves an explanation in the commit message.

Alice
