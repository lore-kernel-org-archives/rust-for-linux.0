Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DD71CACE7
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732016766; cv=none; b=CGmBTb/3cFvUEO5914VHcLfvVDD/KJW6uhQI/Chzwe2p2zxgupOFYhcFjB4XUo/8n3fdcNuOJvOHh2ekS/gcG79gyf+x4V9DrC9hnpb84TalWrRudmeRLTfiGmhUFdlpkSnGLUAKg7OO6/TVztcSzL9WMDDJP/BIQG1TCfhFUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732016766; c=relaxed/simple;
	bh=gKLHoCFkMAORHYx5wuI4s2ZofCwMpO14Clkah9l9+3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTRqnc1Ezalzcq3C/odkSiCm/KwmWPtDqcwd6OlpHTFtugcKU+qDRo61u0USUjbabkqBhya85VXfsoF6NI8S7i+K/M/e+WHjxvxdmBIRfwjxyxOrw50XrpIxfsynERtdqH5TypCqP5rsqKxGJkwW1gBM3Rs96LT2dJt++K7KkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FhuqP7EP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FhuqP7EP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-431695fa98bso6780365e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 03:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732016763; x=1732621563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKFNFU0TxSRVfbmDrokfeS6Zi7x7KpPj06RucnV2NPE=;
        b=FhuqP7EPPESBm3wpXEDUX5SZuSsMvKtmcoLFBuW9Z1C6ubIwcqwzdgqR9jV5t4BfHb
         ri5ckHrM91comSN4/COqCvygjk/p3EmZcYOCM7PK8kACWaC/OGx8IYsxE85JXlynpSm0
         CsWkchA/yxu0UuZpFDf2xwbWMPkd2ptLrf6sEhYc7YnCObAccIdOY9l0bc61d52vo7k1
         cRs8YOgOXeUGwCrpiWZD6rnywiDhMvcBafXEo9D5+k4UMBolPjvPpeQnE5nZdIi5VX/e
         tQ6GhwuxN9wXS93VGvhoikhlzQYeJqsFeqr4bwx8RjY6N3eUoeKUkNFeGdmJENbEgBBB
         Cwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732016763; x=1732621563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKFNFU0TxSRVfbmDrokfeS6Zi7x7KpPj06RucnV2NPE=;
        b=qyjXkKSPz19lH2asKpXmQORi3u2YCo3yln/eQf9QjcRWk1N1exdKLBxfgLGmKYWz14
         OOOPjvPaEL5odhuB5mkWy+vmIUc/Qf8nFY7vqZyXqMRHOnw1vjnKJDfoqBLVArrSXWTD
         Kxqtflfg4YCfxapFvTLV57k+KmJuuLZ3yxk10PTSj2eTw04z3gnRC+/bh8JtPoMgWniL
         py6S6CIj2eXKfaryctROe1FHSY8qN86alvQ1rDj2jDH5gDmEFpvVL1HU5DeiMXeRObOI
         RV64qY+bCcRdBBOnAzkpJ2oMnLTHRkzB+ItFf4heyIIKD53g+Hwm2JC1ZROE8q6Dl2py
         Muzg==
X-Gm-Message-State: AOJu0YwsPHCKyAF7aUTiQFvxMRovtl93FHYXEUBqFDWB33wAX2h+wtQ/
	iSlhAAyQt0+FRVKTn7ihlBVa8gJYmHyYQ0iZle9AluTLdqXfTfyzAleNnt1hgoTSWatzpDe4c0f
	0lB6GgNBKIboF4wZ4uVl5yLaZ3ZUb+3RIP/6K
X-Google-Smtp-Source: AGHT+IGWejOR/TW8BG5tkq5cCrc9rUhPCdGE3X60q4JttnjZIq//FJLWmLVDtvwmRo/TQwBKnG0iQu0TvUX5ulQrW8I=
X-Received: by 2002:a05:6000:1887:b0:382:44e0:c5e9 with SMTP id
 ffacd0b85a97d-38244e0ca0fmr6477944f8f.25.1732016763336; Tue, 19 Nov 2024
 03:46:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com> <20241119112408.779243-2-abdiel.janulgue@gmail.com>
In-Reply-To: <20241119112408.779243-2-abdiel.janulgue@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Nov 2024 12:45:51 +0100
Message-ID: <CAH5fLgj_BW22yopAdOLpSQaK97eeUAQb4jfn=KgOqNgCJ4CsqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: page: use the page's reference count to
 decide when to free the allocation
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 12:24=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> Ensure pages returned by the constructor are always reference counted.
> This requires that we replace the page pointer wrapper with Opaque instea=
d
> of NonNull to make it possible to cast to a Page pointer from a raw struc=
t
> page pointer which is needed to create an ARef instance.
>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>

> -/// A pointer to a page that owns the page allocation.
> +/// A pointer to a reference-counted page.
>  ///
>  /// # Invariants
>  ///
> -/// The pointer is valid, and has ownership over the page.
> +/// The pointer is valid.
> +#[repr(transparent)]
>  pub struct Page {
> -    page: NonNull<bindings::page>,
> +    page: Opaque<bindings::page>,

With this change, Page is no longer a pointer, nor does it contain a
pointer. The documentation should be updated to reflect this.

>  // SAFETY: Pages have no logic that relies on them staying on a given th=
read, so moving them across
> @@ -71,19 +73,23 @@ impl Page {
>      /// let page =3D Page::alloc_page(GFP_KERNEL | __GFP_ZERO)?;
>      /// # Ok(()) }
>      /// ```
> -    pub fn alloc_page(flags: Flags) -> Result<Self, AllocError> {
> +    pub fn alloc_page(flags: Flags) -> Result<ARef<Self>, AllocError> {
>          // SAFETY: Depending on the value of `gfp_flags`, this call may =
sleep. Other than that, it
>          // is always safe to call this method.
>          let page =3D unsafe { bindings::alloc_pages(flags.as_raw(), 0) }=
;
> -        let page =3D NonNull::new(page).ok_or(AllocError)?;
> -        // INVARIANT: We just successfully allocated a page, so we now h=
ave ownership of the newly
> -        // allocated page. We transfer that ownership to the new `Page` =
object.
> -        Ok(Self { page })
> +        if page.is_null() {
> +            return Err(AllocError);
> +        }
> +        // CAST: Self` is a `repr(transparent)` wrapper around `bindings=
::page`.
> +        let ptr =3D page.cast::<Self>();
> +        // INVARIANT: We just successfully allocated a page, ptr points =
to the new `Page` object.
> +        // SAFETY: According to invariant above ptr is valid.
> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(ptr)) })

Why did you change the null check? You should be able to avoid
changing anything but the last line.

Alice
