Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427832B9B7
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265428; cv=none; b=iLVxln3iUEiO9quSNpgPnYAtq5p+qlKrcgVQM/K0jHBXzSkENJ4I5EcYhTR94DBLaGj+X5X8EPgAuloemdjHiYeD0YBeUW5cQmNzzLg7fBZSdIOHwrI7BEEULWux8lw1uaaFKIwBkKkzNx7lO4tIWLhhDDOCbj39qqzaIks85qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265428; c=relaxed/simple;
	bh=VRTO9VLPhQlmmKHuNsz6zCQdkPAAN++H8Ww1T347Z8g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CM04uXH9dcCnFA0iLghmWjsUlSey4dBn3hBotsmEMZELV9amGJdBSNe7TnmICDR3yDD+iNw5uhD1QSCwBpgnFupYUV0iF1qbGEC5sxsYZ9omh2Mp/SiLT0k/T2tyY5YcsHzio7OCybgXhBj0ZWxO3VBN0or6JdW46t55GeACAJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nYRhsFWx; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nYRhsFWx"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-429cbed2b8fso1308642f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 06:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762265425; x=1762870225; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uHiF6gVRggMwdW4185v0BZjP5S0/Kd9beDPiXd+72wI=;
        b=nYRhsFWx6Y6UheudCEV5CShE+KTSpVlwJem561YqM87CDzhJXEpqxjRO7RG4GCZR63
         2StT2wxvTrWounc6JJxptYmh6n4WzZZFi+3gYF2lW9DaF81wLwZmWm5j6XePHtsPC3w/
         Le0VwkBM344MiSOPevjqBTp75UpC0r1OKYV8Qx6SYwZiJqvnLw5qWfD0apWs/Cw7HbsS
         lfkWl4EpwRQc+X8F0vxcrXzQ9sb5guO0lq27t5lFEWNOl97mmFUrVCKYK4t6d0HVxl4m
         Q4skb73UFUmGoQg756XFI9JZY47ZHKHVJZi3okih7r/IuCTbSGTSLUu45otFmTQcy6cF
         Chog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265425; x=1762870225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHiF6gVRggMwdW4185v0BZjP5S0/Kd9beDPiXd+72wI=;
        b=aP5/X2TDkY5lwg+LwsPGfwmPRqOsrm2Bzu7E0dSNyBWJqMoD5ERZkPSeMuXAex8AiO
         AfOFWnu/GvkIMGkBexasNeHjfE6rG/qsTLixWEbvMca23/PUrt0GYzcDsoiOv+S1IjnM
         OrtYKe1Tqi/ZbvqIPsti0MxBD6V71xcDaJ5TTF23XksY8zWfG+sYmMgysETeJ3xnlIgI
         flubm2ZFQS622WDLVRr+EFeUCSxxxC9ZK/5EOp2OULPMuvTNETqU+qtdw0b7R9DYUMla
         6UxJSxCIaIgC6JPMLXpj37PtAKaU3ym1gItzpKc/sJOFdxlHVwCRdE6Cxg/P5kB/ZOFU
         nYYg==
X-Forwarded-Encrypted: i=1; AJvYcCV98Xuj9uao0qP9Y2fgnEf78hjgs2s/OGRPQtG0qyeL2zjP3jCUiRYMgaKRK9vzo//7m44nWf+pYzIXL4lp1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy52iTtepRgZhaNjGoZK0/Rm8GZrJPj8M8cPxff5pmbKm2i/G8M
	9HxPgJK+BqKCFHis+Trpjw/Ry0L6KUtOhNNPAjtN4bZyfR3cvGRPaxoD93ChgU/f6BzNTa68XzD
	S7ayxiSgqTUhShliQXQ==
X-Google-Smtp-Source: AGHT+IHIwmXI3MPGoEUnmBEYUJcN7uH42vRSMIjYBHF1ahKbv15k1Q9IgZeQZ2sJYz/5+8Cq7foBcYqR8APALiQ=
X-Received: from wmwp20.prod.google.com ([2002:a05:600d:8314:b0:46e:32e6:eb8f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:4390:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-477333af9f8mr89301985e9.17.1762265424861;
 Tue, 04 Nov 2025 06:10:24 -0800 (PST)
Date: Tue, 4 Nov 2025 14:10:24 +0000
In-Reply-To: <20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com>
Message-ID: <aQoJUAdFFBpQiEZU@google.com>
Subject: Re: [PATCH v2] rust: enable slice_flatten feature and provide it
 through an extension trait
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 04, 2025 at 12:53:18PM +0900, Alexandre Courbot wrote:
> In Rust 1.80, the previously unstable `slice::flatten` family of methods
> have been stabilized and renamed to `slice::as_flattened`.
> 
> This creates an issue as we want to use `as_flattened`, but need to
> support the MSRV (which at the moment is Rust 1.78) where it is named
> `flatten`.
> 
> Solve this by enabling the `slice_flatten` feature, and providing an
> `as_flattened` implementation through an extension trait for compiler
> versions where it is not available.
> 
> This lets code use `as_flattened` portably by just adding
> 
>     #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
>     use kernel::slice::AsFlattened;
> 
> This extension trait can be removed once the MSRV passes 1.80.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> This patch was part of the Nova GSP boot series [1], but since it
> requires attention from the core Rust team (and possibly the build
> maintainers?) and is otherwise buried under Nova patches, I am taking
> the freedom to send it separately for visibility.
> 
> For v2, the methods are aligned with the final names of the standard
> library, and the extension trait is only visible when needed. This
> simplifies both the patch, and the extra labor for user code.
> 
> [1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@nvidia.com/
> [2] https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/

With the below concern verified, you may add:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index d0ee33a487be..a84b9e3171a3 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  
>  # The features in this list are the ones allowed for non-`rust/` code.
>  #
> +#   - Stable since Rust 1.80.0: `feature(slice_flatten)`.
>  #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
>  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
> @@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  #
>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
>  # the unstable features in use.
> -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
> +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_flatten,used_with_arg

You should double-check, but I don't think you need to list it here
because all uses of the unstable method are under the `rust/` directory.

Alice
