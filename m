Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CE31EA7FF
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762338765; cv=none; b=ElEA37nAyUMFVsJVs/PZPBKtkTdnXqYwLsgmEb8MSyWFp4gvRFXO67xX6D2GwpsQgFxEif5g2uK23wjAGyvseyWptfcQib05witHfVj5VFcx8j1q4mGpXa5F10Xz48Qetd0hTO4UxRN8zrm5rBN6aDDg1+0oLMHYsqy9X9WDHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762338765; c=relaxed/simple;
	bh=RJJkFgDUzsohMzURq7bBvP8hhRhZDrjeEdAaUgNPq0M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pwyRcQDOdcYFB9/TWof/ZmgkQ2KmoHAeHemNWTBwx+puhuQ0dyxhCXdioSD4vVm+EpR8bVo7I77rP5tELed+eT9XYlY1vie+5ZeHaz1K8kDq1nFyFBbftm+e04wayMJAcWWl1i432ntb+oTP38mCAme7trWg2Ojz0Dix6kCl4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J5xaqVJP; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J5xaqVJP"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c9024a1dso1951462f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 02:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762338762; x=1762943562; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uoHKeLb1/D8vm7upwGqReAmXlnf7/QEZR0/joGtrdt4=;
        b=J5xaqVJPK0auopz5CaXMu4CwRzd//Nn2ss3oYI+HYwOEEq1DCs2NQVqyggAkXjFT3y
         VAIsGPwgirkw1lYO1aCiAQt+WlafZV7GxGGiW9jl3MvsE6Mzv9GcimeeaqxDH6PFYVlh
         hkpTsq/bMQzRXp+EishM60z2DfkXnJtZVcoSYq/pwigRAsASDGWiNuZSgazgNZLBjmq4
         RIiwa11Auw+6L3L4IbJ3h7ry1mH7IKulX8oVV8y7G01IoXlRL2I6q2V/n1jIDX3Nft52
         00FpQukdhkNAAm0SzPH7y3Ek4ZL+9voPAyxYwBa53W1uUSTFxiuB3pBgZ2w2FV1sk+Vc
         hkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762338762; x=1762943562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoHKeLb1/D8vm7upwGqReAmXlnf7/QEZR0/joGtrdt4=;
        b=AGQ5b58sGHoErknqlk+Xo6dxtjls407IzHQzKT+I9t6iR0jXqyy8jcB6pIS+A343y/
         Nx0Rvz8/IuMCcKL81Hb8KFsNwsbPIKvwNH1Ag8wAGiOGC1dCFmjG2Ls/TwY6dZvAgJc8
         d3l5Hfv5Hyeo0u4FdjvsV3puMwPiz5YOts2EEfzwz9TTXMeEW9k6FYvf+j20eFebHIsR
         WSEG22JKFLIdBfeDVC7GX30RoKQe4z3jt+rLtsGv1jGRicf3Y2NynZ9wpLGt17KEC9DB
         LSwba3stnBlxVp4a7ZGam4op+u4ypmbYR6g1prK53UWZZnZhp91fVID2nGRwq3/iJRc6
         +3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJlYzPIxEpypveVMl8GKBIEMf+rxXG88raXoIkP9lL/h8DoAwVjKSJCgSjEnPGkmsGg4hXUEjLaZ4T7sO/Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwymMNW6f2+b5j4S6kB8jjeEncVUcvZ8r1VX70/NfDRHp7PjR79
	QcHQK93OPIeQdFlS5O5TmU0rX2sk0kU4K3Se8NeGSa3zyPzDMu+9w4eKmXqGRGGfMnbHjmb3Hkd
	UU3lscd17IyWqxVmAaQ==
X-Google-Smtp-Source: AGHT+IGQvjexQQnGBe4X3mAAhx3zD2HAIGjQBKLOhXGm2WhLSVAErdov0yzu+f/A5My7UIuywpmyLhNrm11IGoE=
X-Received: from wrta2.prod.google.com ([2002:a5d:5082:0:b0:3ec:e12a:e26])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4205:b0:427:167:c2ce with SMTP id ffacd0b85a97d-429e330a4e1mr2328011f8f.42.1762338762021;
 Wed, 05 Nov 2025 02:32:42 -0800 (PST)
Date: Wed, 5 Nov 2025 10:32:41 +0000
In-Reply-To: <20251105054731.3194118-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com> <20251105054731.3194118-2-fujita.tomonori@gmail.com>
Message-ID: <aQsnybOPSkRUEA_v@google.com>
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly once
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	jens.korinth.tuta.io@kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 05, 2025 at 02:47:30PM +0900, FUJITA Tomonori wrote:
> Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
> would be possible to implement the feature entirely as a Rust macro,
> the functionality that can be implemented as regular functions has
> been extracted and implemented as the `OnceLite` struct for better
> code maintainability.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

The OnceLite implementation LGTM, but I have suggestions for the macro.

> +/// Run the given function exactly once.
> +///
> +/// This is equivalent to the kernel's `DO_ONCE_LITE` macro.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::do_once_lite!(|| {
> +///     kernel::pr_info!("This will be printed only once\n");
> +/// });
> +/// ```
> +#[macro_export]
> +macro_rules! do_once_lite {
> +    ($e:expr) => {{
> +        #[link_section = ".data..once"]
> +        static ONCE: $crate::once_lite::OnceLite = $crate::once_lite::OnceLite::new();
> +        ONCE.call_once($e)
> +    }};
> +}

Wouldn't it be nicer if the macro syntax looks like this?

	kernel::do_once_lite! {
	    kernel::pr_info!("This will be printed only once\n");
	}

You might implement it like this:

	macro_rules! do_once_lite {
	    { $($e:tt)* } => {{
	        #[link_section = ".data..once"]
	        static ONCE: $crate::once_lite::OnceLite = $crate::once_lite::OnceLite::new();
	        ONCE.call_once(|| {
		    $($e)*
		})
	    }};
	}

Alice
