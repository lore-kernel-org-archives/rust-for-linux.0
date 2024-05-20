Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF80135A7D
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716218680; cv=none; b=qxsF5TQDAkTAQ64FrUXy9WZpcmSYa7twFApD9iFJ+KKOK9f1P6sTAMXmPzzZA+ofQ//xKCfPttkGY9pb4JT4P8GUTFeHLbGh55acWIW4+lqdY0kmJFIOtcHO0rgItztbfpA4oH6uGJ9kw09gF/aMbjnnzsOc9lZVpUZx2gB9y4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716218680; c=relaxed/simple;
	bh=/bYutIsSrxoty/i0tqxvH1agSRzviA7eI9qMo7lmngg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aNG3mrlKtjilsaeqn0m97X8HKKO5N81rEeWK2qnq3oG2z0Mivd/rjwRljp09r/pi5y5kkadAJq0zW6KHt/6hJk4BrkoXcz/1OHB5WeodrRLMqRdXudytzE8l6mzDsqHPYTp7SmwZSCTPBllakNXbiaV4mWBUOTEAigICsVpQ5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OJeKyHNl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OJeKyHNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716218677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MPzD2EYz+Tws56HwE5fNBA/4Wwv6n6zB3tlyojChHUw=;
	b=OJeKyHNl2DVIgeVhu7rQDR+A3Iai6lsZY1OtXW9yIjYSo2WaV2YsIxGmQpqiFE1g450MDi
	gNnUgHRcw9Xp6Qn4S4PO9ZTwcMs+9btd64mWKJzQesAYOUNS3YxtFBr215rw55PIFcb0Am
	EUVUv9Yr88eRACuJErHgM5cabdX6Is4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-lBXKcyIGPdiflwy3X4CG5A-1; Mon, 20 May 2024 11:24:35 -0400
X-MC-Unique: lBXKcyIGPdiflwy3X4CG5A-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-41fc5c5cc95so51288615e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 08:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716218674; x=1716823474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPzD2EYz+Tws56HwE5fNBA/4Wwv6n6zB3tlyojChHUw=;
        b=LOTESzzwmhLCYFC/zbD7yvOY3tavm36xW7rDTJv2e+jUnTuajQ88C/+xdND1ehDtu+
         RR2wtJZZgU4QF+BxL1f+xUWpF61euJgrEhyxMlfXr0YaqPC5hcmbJsiS88UKgAUHQwf6
         CEmk64NF0u+Xx9pn8e5pyPT/R3rnAtnEm3T/bR+SH0qlkl2xpkThfheFOAAWygZfB53w
         UMQpDDMLqf26/RNbrD8X3JL6uiovn2nWhDCC7/tJ6az20pgKg+Cqfs0p3Ov1bZBc9Itq
         XJIBBKzgPtIcDOcAkHRbQy0jGMN71cW3t8hjZ56oVSMIq278bLyJ//1UfCJDkF4VhdEW
         8nyg==
X-Forwarded-Encrypted: i=1; AJvYcCXgcXYjXUrtpoczp5Zxxq6qwFqeOgu6wJGpaHtVFUUOCyBQz/otQzSwGcTw5MU2gVev3E5htRenlO3EGFvar08IBH5bBtL4zDiYl6NeDHY=
X-Gm-Message-State: AOJu0YysC0zfmbCCBAx+//D39ezRMCLdWz4x+cdGPboqcPv15KDxkAm1
	Fn+SKSgafuTCTolW366nplcbCArWmiTH9JMGql8MacqM5Pp0m+ayPpeHUDuBQKtofDjgjZMnewX
	qKFSECNepR4DV0S9NMFA45s3mBIGa3ldfH6qnUbs8Zf84bJWo9HjhFZl6/IixYz9C
X-Received: by 2002:adf:f746:0:b0:347:3037:188d with SMTP id ffacd0b85a97d-3504a737594mr27533415f8f.34.1716218674179;
        Mon, 20 May 2024 08:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFybBVRF9qV0XR+xTmYzrgRY5zsNr68gufSFbFaQHscL73I++QGoGy2M8cBG9NDuhAutpTMuA==
X-Received: by 2002:adf:f746:0:b0:347:3037:188d with SMTP id ffacd0b85a97d-3504a737594mr27533388f8f.34.1716218673765;
        Mon, 20 May 2024 08:24:33 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:d829:d5ef:3adf:70e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bc8esm29279979f8f.15.2024.05.20.08.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 08:24:33 -0700 (PDT)
Date: Mon, 20 May 2024 17:24:31 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: avoid unused import warning in `rusttest`
Message-ID: <ZktrL5YcHx6kKtLR@pollux.localdomain>
References: <20240519210735.587323-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240519210735.587323-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 19, 2024 at 11:07:35PM +0200, Miguel Ojeda wrote:
> When compiling for the `rusttest` target, the `core::ptr` import is
> unused since its only use happens in the `reserve()` method which is
> not compiled in that target:
> 
>     warning: unused import: `core::ptr`
>     --> rust/kernel/alloc/vec_ext.rs:7:5
>       |
>     7 | use core::ptr;
>       |     ^^^^^^^^^
>       |
>       = note: `#[warn(unused_imports)]` on by default
> 
> Thus clean it.
> 
> Fixes: 97ab3e8eec0c ("rust: alloc: fix dangling pointer in VecExt<T>::reserve()")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>  rust/kernel/alloc/vec_ext.rs | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
> index e9a81052728a..1297a4be32e8 100644
> --- a/rust/kernel/alloc/vec_ext.rs
> +++ b/rust/kernel/alloc/vec_ext.rs
> @@ -4,7 +4,6 @@
>  
>  use super::{AllocError, Flags};
>  use alloc::vec::Vec;
> -use core::ptr;
>  
>  /// Extensions to [`Vec`].
>  pub trait VecExt<T>: Sized {
> @@ -141,7 +140,11 @@ fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>
>          // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
>          // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>`'s capacity
>          // to be zero if no memory has been allocated yet.
> -        let ptr = if cap == 0 { ptr::null_mut() } else { old_ptr };
> +        let ptr = if cap == 0 {
> +            core::ptr::null_mut()
> +        } else {
> +            old_ptr
> +        };
>  
>          // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
>          // `krealloc_aligned`. We also verified that the type is not a ZST.
> 
> base-commit: 97ab3e8eec0ce79d9e265e6c9e4c480492180409
> -- 
> 2.45.1
> 

