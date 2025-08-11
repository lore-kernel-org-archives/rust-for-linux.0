Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E47C13A86C
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903823; cv=none; b=jt6byk7xKmFCmWu9smVemkTEIUYXBQE7vNzQny9Czb1KKmZXyb8VTSOevsKs52Hg1xQO2jlamq0GveDnHMLyiz/AUVXc9LYlSoxdwK02NlcJPf4Q4TRu48/2o37ZVGl/hOBMFzscNJMqe167alLBIhGJrwMfe1YzPXvRmgHGz18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903823; c=relaxed/simple;
	bh=TI9f8IhE/YnSR9G7JbimuCpS4yQxyt/7IkfDBfgTmIs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UfiCqI00vcXetSOvYNSBsLt1WJN7yONOiCkX2djxk4tOV7GNAphcaZWu6bcnHFFaqxjQLLgZlO+mlXXn7EGa90NaRzMXP7UPCVQNUUjMK6SPmZVJcnjHI5c4IUHstkEgqRSYPG1QIQ6ctbdIQYX5lzyJ1VDJtecXVkLNZ6AP914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Psd9wlN6; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Psd9wlN6"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-458b9ded499so27202105e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 02:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754903820; x=1755508620; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BBdk/xJhX5i3iBFI62WpghuGFqONRPOBjMMxUjq/dw=;
        b=Psd9wlN6d7mjl4+deXeD7XBgMnccej7IE77r45pEx1gVY9lt56a7qqdSfXn/cpuJdz
         AEaWjPnuubqF3cJavNafvG876/VzXfLRon2BibA9zoMKkR4OoBQjHnfG6Q6SOL9xFScE
         Aafq7l+DGBQGat4FcoX5MnVJ/CKpUSp+t/tOf8LAUTB+xhK3bkvsSxdpuq30I/JktLfy
         Zb5+8Elv/3VdOBVMM33WoNnpWBsW5XAkMR/5AXrDyNyYswzi1IXfj4ARg50bKmZRI0sw
         VjovbnWnju/HI1NyD+rsGvi7TmfLAyZh5LDjaOpJpbteew3LrfNgJiDcQIw0T59a6Pjl
         c04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903820; x=1755508620;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BBdk/xJhX5i3iBFI62WpghuGFqONRPOBjMMxUjq/dw=;
        b=Yc8OSYmW4Fiz8usOBuKjc6lE3AKWm2DCG4LliZXp6NtVDw9wgVebJBmP1MDYGhsjj3
         7+WnsCqTChPySqlPuRfBbxIa0P5OAE5eawhPvGI92PJjhoaQj8PbyMt3IpoNCa/q1bhK
         GMU1hFK98We122XpLirtUnubfamd4+33SRYDIv5rTT2VYc/LaRFrOZk1GL6Q/WtoBIeo
         +6lLMaTcdQ1LzKL3Lv0Sb2dZz0EcymhpM5VD5YP0NB785r9r0G3NkTPY3IhjNuDxf9pR
         kEONZ7bOyylr3e1fvRjwfIS/D1IIYlpBlQl6b3ZdhBWQl/fRMkwPlsA0ATc2IczJuI2/
         T5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWqLNnTcNjGAI+3ltIzwO5UQgdLKq7+xt8XktfMsGLSQE8LxxKnVNgrdtpGsgRruO8j1x2u9UysmTPr4z6N9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy+aNL7JaxYuRVSrzohzOQZ5h5invqMx/Mnsbv1Hn6ANn93pCk
	SvpTpCZNKi3HRxgJqbjZBF/rHVpkCSdnOUHkAFQuOd8d67B6XExwNeREcDMc4SZGUaq3yUHucou
	GgJWxsw4PY9edend9nA==
X-Google-Smtp-Source: AGHT+IFV0DbhESR0U/1WMKo3lbx1C2uXOqwJTebw3x6hCJRPidIsPe6K4uXbyymx8Jldw0TP0aRvnIOIll5+Wmg=
X-Received: from wrio33.prod.google.com ([2002:a5d:64a1:0:b0:3b3:a684:8f58])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3104:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3b900b4bcdcmr9512694f8f.9.1754903820347;
 Mon, 11 Aug 2025 02:17:00 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:16:59 +0000
In-Reply-To: <20250808181155.223504-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250808181155.223504-1-dakr@kernel.org> <20250808181155.223504-5-dakr@kernel.org>
Message-ID: <aJm1C7Pehrh8FIFa@google.com>
Subject: Re: [PATCH v3 4/7] rust: page: define trait IntoPageIter
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 08, 2025 at 08:10:18PM +0200, Danilo Krummrich wrote:
> The IntoPageIter trait provides a common interface for types that
> provide a page iterator, such as VmallocPageIter.
> 
> Subsequent patches will leverage this to let VBox and VVec provide a
> VmallocPageIter though this trait.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/page.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 631718a6ad7d..bfb5898ab4b5 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -103,6 +103,16 @@ fn deref(&self) -> &Self::Target {
>      }
>  }
>  
> +/// Trait to be implemented by types, which provide an [`Iterator`] implementation of
> +/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
> +pub trait IntoPageIter<'a> {
> +    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
> +    type Iter: Iterator<Item = BorrowedPage<'a>>;

Oh, also, I would put the lifetime on Iter.

trait AsPageIter {
    type Iter<'a>: Iterator<Item = BorrowedPage<'a>>;
    fn page_iter(&mut self) -> Self::Iter<'_>;
}

Alice
