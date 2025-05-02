Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A9B1D95A3
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185576; cv=none; b=ixHKwvybjIzMJoPBNoxZtj3NleQzpiw9agO1uACoVqnqDHE4tjitWubt1Cf1gKP1bhj+bRAaI+6ZCixHk7niTrAk6SMa6Xntdglu8mnT99XNAGZ/7ouhwbaAJ+0jR3v69VYzAUg4qRc34nZscEmj2h34W/x3aE592kQi+opWPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185576; c=relaxed/simple;
	bh=7A1HSBrvNQWxj/2gNm3WkF5r1onxQz5OycCMNYENKLk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T6adbVl5FmVLgu8O9FpGGsrxBRzUIw1gO7vLQGdd0Yt7v5ugEUNN4gOX1JXnNM1aQP9GfAdCroJ8JfTYxUS5LBvDFbse2tOp9gsBOZwzj0g1hctkz8s6G17o1FR5T/oIe+K6vhhiCLBDrldThdEUR91uKD4LZTumZ9CPj6oCBFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lTCliXWO; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lTCliXWO"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cec217977so9878305e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746185573; x=1746790373; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehdcrv2mT2VKoMiW5G3gmtm0EefPx2m3GmPmUMuFdMY=;
        b=lTCliXWOi2e1WQXt8r929+0SvTVRGxfKCo+4niifv9Ra6CrTQm1sU92lkE+DZEh0lr
         TPiQ9bgbyobl9foTBNH9+FhGqzZVcjLdZoWYIbIaVEcf8UchA/f9VOxNRGCTmTk6bUWv
         UeIoXZrD9ORyUkxzblrlmSuAsJHhKjpO1AJ7LMEMM/MLlzagFVgvixY6pYAHCl+pimDb
         /WXzQaAKuVzf+FkONh5lwj3dlvPRzKTOZK4s+ijC+rpdUBxTae4bPWJx+abA74J4PfhZ
         +KzTdrIF1e/PspGmM8v13UQqYpOyJ/sfpMUEpERqJjDV5VRqP846MlbBiqhzHxWDuThY
         4shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746185573; x=1746790373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehdcrv2mT2VKoMiW5G3gmtm0EefPx2m3GmPmUMuFdMY=;
        b=tquEIMnSBEybmql16H/Cl8rS/B2hEFm3rhtX69LEHtZuKCRz0tciZSeu610Eh8yH7b
         ZRa3ADOnwj6C1E+a0TzRrnDWRyBIC6KwUVoVEcoJ5rdBD3TRc3i1oT+hszGAKSrkxHrk
         O1+oXSs3fGAxqni08mc1EN+DBc12DFQ3ArREhQwaUnKAezY5Sm0/c380ZPGBm/ltfsJu
         2zmS+FfpH+OxbV9bnL8OHJwqdBoD3xBRlnQr2SoiMyLYvbhK9+8lBUMmx23bdW6toC/a
         cKoqBtqxamp+UT7Ki4Err6qvu8OHK2YZWejx4CCEkwr+N96vUy/FzwakxM4/+qgNvK6k
         IA6g==
X-Forwarded-Encrypted: i=1; AJvYcCUP8G6/mXDh6JSx+ORxKt6xh0H5Yc7uZDk4lRdnGX6CbP0AforJ6Mizkq+aSKwei8en6QKWoPqG4NKgK6a3cA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+MOh+w5V2T38GTGa/qsw6Oh1SeCivhNyBP3pSh+J623cMnzkb
	5l0cp9T/nirSklFHQRF3wV5kRscQkYBLsyw3R6X5yY0s4irY4Zg9zwZXOcyHA/zQ4OCIyKXTpGj
	+lHOtl9bf1d96Yg==
X-Google-Smtp-Source: AGHT+IGTFJg1P18OgzK6caFU87y4YhrHM/eoMM1Nq1UEWOnC7eYMyFOfE3yruvrd/4zA8FAvrqLG7/6uMPFF5xQ=
X-Received: from wmbfl26.prod.google.com ([2002:a05:600c:b9a:b0:43d:55a1:bffc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5247:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-441bbeb0f11mr18023905e9.14.1746185573652;
 Fri, 02 May 2025 04:32:53 -0700 (PDT)
Date: Fri, 2 May 2025 11:32:51 +0000
In-Reply-To: <20250502-unique-ref-v10-2-25de64c0307f@pm.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-2-25de64c0307f@pm.me>
Message-ID: <aBStYylT7wy9JiDx@google.com>
Subject: Re: [PATCH v10 2/5] rust: Rename AlwaysRefCounted to RefCounted
From: Alice Ryhl <aliceryhl@google.com>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 02, 2025 at 09:02:37AM +0000, Oliver Mangold wrote:
> AlwaysRefCounted will become a marker trait to indicate that it is allowed
> to obtain an ARef<T> from a `&T`, which cannot be allowed for types which
> are also Ownable.
> 
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>

>  // SAFETY: All instances of `Request<T>` are reference counted. This
> -// implementation of `AlwaysRefCounted` ensure that increments to the ref count
> +// implementation of `RefCounted` ensure that increments to the ref count
>  // keeps the object alive in memory at least until a matching reference count
>  // decrement is executed.

It looks like "keeps" now fits on the previous line. I would reflow all
text in this patch.

> -/// Types that are _always_ reference counted.
> +/// Types that are internally reference counted.
>  ///
>  /// It allows such types to define their own custom ref increment and decrement functions.
> -/// Additionally, it allows users to convert from a shared reference `&T` to an owned reference
> -/// [`ARef<T>`].
>  ///
>  /// This is usually implemented by wrappers to existing structures on the C side of the code. For
>  /// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) to create reference-counted
> @@ -410,9 +408,8 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>  /// at least until matching decrements are performed.
>  ///
>  /// Implementers must also ensure that all instances are reference-counted. (Otherwise they
> -/// won't be able to honour the requirement that [`AlwaysRefCounted::inc_ref`] keep the object
> -/// alive.)
> -pub unsafe trait AlwaysRefCounted {
> +/// won't be able to honour the requirement that [`RefCounted::inc_ref`] keep the object alive.)
> +pub unsafe trait RefCounted {
>      /// Increments the reference count on the object.
>      fn inc_ref(&self);
>  
> @@ -425,11 +422,21 @@ pub unsafe trait AlwaysRefCounted {
>      /// Callers must ensure that there was a previous matching increment to the reference count,
>      /// and that the object is no longer used after its reference count is decremented (as it may
>      /// result in the object being freed), unless the caller owns another increment on the refcount
> -    /// (e.g., it calls [`AlwaysRefCounted::inc_ref`] twice, then calls
> -    /// [`AlwaysRefCounted::dec_ref`] once).
> +    /// (e.g., it calls [`RefCounted::inc_ref`] twice, then calls [`RefCounted::dec_ref`] once).
>      unsafe fn dec_ref(obj: NonNull<Self>);
>  }
>  
> +/// An extension to RefCounted, which declares that it is allowed to convert
> +/// from a shared reference `&T` to an owned reference [`ARef<T>`].
> +///
> +/// # Safety
> +///
> +/// Implementers must ensure that no safety invariants are violated by upgrading an `&T`
> +/// to an [`ARef<T>`]. In particular that implies [`AlwaysRefCounted`] and [`Ownable`]
> +/// cannot be implemented for the same type, as this would allow to violate the uniqueness
> +/// guarantee of [`Owned<T>`] by derefencing it into an `&T` and obtaining an [`ARef`] from that.
> +pub unsafe trait AlwaysRefCounted: RefCounted {}

Adding a new trait should not happen in a commit called "rename X to Y".
Consider renaming this patch to "split AlwaysRefCounted into two traits"
or similar.

Alice
