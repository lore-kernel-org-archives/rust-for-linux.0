Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D9128807
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714420354; cv=none; b=hlrICuQXD0IhSKW76tUzLTjzsU6OB4Y6UGj1lALaHqeDjtskWcyHiZZ+f5UjbmOML58EJj4KrrHFqmMsPiRhI+xeCp2er2LLJ0/FGFKdTUruGTtDKyhSI9aCq0zpMOviVx9AzA3QMTFdp9Hvq83O27T5vMjoV5UwtuooBrH6Mic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714420354; c=relaxed/simple;
	bh=fdca0RlkORZdF+PPSAuhPcm8mtLkg7EDN9m1zREweUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4mVHL2eRzNIeAmRy3TlQnC6BDHpCZUaFTYgU2JSoMIIqEOQIO94j47IwBbixfBuoPvnI8BHKKWhLnLv5/yjN8b2wklAlpaA57e8JoGa79yrr0yt7wR+LYaMTyeuD6mBscQME86TR7p65CdjiFxznIemnAJLuKi8fLr9mDm5GAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0ghk0Vz; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0ghk0Vz"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-790eedf44faso140885485a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 12:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714420352; x=1715025152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+GAShiSaedMf+VUbupnukjL8zR214KtdHyo5Lo8ybI=;
        b=Q0ghk0Vze0E0qS4/8ONF9qeYIwIRi0jBxP9zWTXKJxLmGbiiF3ypsn0YCE7bPARUP2
         11OUTbEQriJ2kr+uUWAxpZv+dMn202nZwHu+RyEUFvUW9Sz1OVnJ3QY1VZy9IXMiBfXH
         4ScDMFinNjOEXvMw+Hre0vZCYprAr3csbsDNTAHRKwDS4LP3AJCsKE4Y49oljQuZBVgl
         A++q3Rjwenix0xcjq9912g9jGtoeGs4w51Vt6IOtFCE5HdwPO3Ap17y96UOZ8nNiqWxg
         L/O6UO26ygtBIVo6rRJu86ma703Rt5ho2BrD4VH/OjERGGe6yXLOXIw3SGkvac5fv7zb
         pCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714420352; x=1715025152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+GAShiSaedMf+VUbupnukjL8zR214KtdHyo5Lo8ybI=;
        b=N6SKI6eyYMynVoHBzgYJS0iwNVjMVz+Kojps3Q3VAf4LKcX5IgQ/YuKu7oWPw/e2d3
         SLrrb7pK5AYFyW2LKy9GGixfC6f4X9H0SCJKoJq83Jt1npKAL6eVs15wqBAxbOzYug/t
         PlnPvf/4xBVE6vAI0R3Ecs6KtRou/jdafcAXKEDryLP0UN5w6kworLP7zj4ARDLtwVwE
         659JE1Rr06PFlW4su+mTLzbDclNAqcN4fkC9N9uXP9zugv25zE8OkXALrGO2iDcb4A00
         i+rHDAnNfpx21DEiYAkVgPLeinCm4CXlJONhatx3yyOkHoAOFyRCOt8cf7eX/G0S+i19
         4HLw==
X-Forwarded-Encrypted: i=1; AJvYcCUs5UlZEJ+4F4fjcgmdd/l+eCMLPRwYFsHL10ytvtQGW8v1uRyBJY8eThKDlnIv6CDmZ756AdyH7Hl7NLHSXxo1PU34D9iMokyode+R9e8=
X-Gm-Message-State: AOJu0Yy2ZB2e+qEYdLUe5Tu1+plDA9cj2d/fw5RzXC0z1LFW1bTR5vaL
	2jNo4WluQOcdzucr+sm6e7MZji+UVlmFrWIm8dTOvo8KQIlK2+M2BygWKA==
X-Google-Smtp-Source: AGHT+IFMm1gSCOuO888GWCB6OB9W9sa5MxTWR85XKH6AsnT6ZonMkVTwJlq8tH0J4lhaaJQlU8XZQA==
X-Received: by 2002:ae9:e64a:0:b0:790:9976:ddb5 with SMTP id x10-20020ae9e64a000000b007909976ddb5mr11236812qkl.7.1714420352312;
        Mon, 29 Apr 2024 12:52:32 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id v8-20020ae9e308000000b0079065de3c96sm8609363qkf.81.2024.04.29.12.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 12:52:31 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 30D751200069;
	Mon, 29 Apr 2024 15:52:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 29 Apr 2024 15:52:31 -0400
X-ME-Sender: <xms:f_ovZtTYNg0u0bpRhrvVnwI6IXoCaWKLOFONBfUhSysV_hJXpHCdgA>
    <xme:f_ovZmzmjuo_G04X5zO_PDU2CsLukVqtjgb2F6lh0GcNi7FXM5FTe_lSqZUngA4LP
    IJRI4_mXBdv23JTGg>
X-ME-Received: <xmr:f_ovZi18zUwMfJjkGCl12IDfttj06uujOY5acuY2dtgVqxSGcg_t9yJjiWmBuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduuddgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:f_ovZlC5bRXQlBUZX3Y8Uh1X7yqa8tySsPhUWs5Ld6uXdBHiQY5EnA>
    <xmx:f_ovZmiLOSao203iB3Sw0u13Vixcctw7dsE5406N3q7mzUQMaMSaJA>
    <xmx:f_ovZppnhi6BAq0-n2sjO8oxFUHj4o48a55F1DImoQ_LFLXzGyd7NA>
    <xmx:f_ovZhgK5BDPH_pceHs-9Dkl00STD2tKYHrkTkK33uTr0NrSiFDgBA>
    <xmx:f_ovZhSp-jgUvp7R1QCW_kvXhTccp87NMmh8KLZco4Wxr5OlqiVYjrE7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Apr 2024 15:52:30 -0400 (EDT)
Date: Mon, 29 Apr 2024 12:52:08 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <Zi_6aDHO4B_iY9zF@boqun-archlinux>
References: <20240429192435.2235-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429192435.2235-1-dakr@redhat.com>

On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> passing a dangling pointer (instead of NULL) to krealloc() whenever a
> new Vec<T> is created through VecExt<T> extension functions.
> 
> This only works since it happens that Unique::dangling()'s value (0x1)
> falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> krealloc() hence treats it the same as a NULL pointer however.
> 

Good catch!

> This isn't a case we should rely on, especially since other kernel
> allocators are not as tolerant. Instead, pass a real NULL pointer to
> krealloc_aligned() if Vec<T>'s capacity is zero.
> 
> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")

However, since this commit is not upstreamed yet, so it's suject to
change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
this patch into that commit in his tree.

Either way:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/kernel/alloc/vec_ext.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
> index 6a916fcf8bf1..ffcf8a19f715 100644
> --- a/rust/kernel/alloc/vec_ext.rs
> +++ b/rust/kernel/alloc/vec_ext.rs
> @@ -4,6 +4,7 @@
>  
>  use super::{AllocError, Flags};
>  use alloc::vec::Vec;
> +use core::ptr;
>  use core::result::Result;
>  
>  /// Extensions to [`Vec`].
> @@ -137,6 +138,15 @@ fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>
>  
>          let (ptr, len, cap) = destructure(self);
>  
> +        // We need to make sure that ptr is either NULL or comes from a previous call to
> +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
> +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>'s capacity
> +        // to be zero if no memory has been allocated yet.
> +        let ptr = match cap {
> +            0 => ptr::null_mut(),
> +            _ => ptr,
> +        };
> +
>          // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
>          // `krealloc_aligned`. We also verified that the type is not a ZST.
>          let new_ptr = unsafe { super::allocator::krealloc_aligned(ptr.cast(), layout, flags) };
> 
> base-commit: 2c1092853f163762ef0aabc551a630ef233e1be3
> -- 
> 2.44.0
> 
