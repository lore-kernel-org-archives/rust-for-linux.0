Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A6813BAC7
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715004708; cv=none; b=r4vKAXPkAo8oOXnp98EhuW58WyvMMIDro2svS66h9l8Q0m2ngBguf+tJqZTlHU4xu2jvFZCq5u7u27yjw7tb7LYDCvBgR/+gziEsEOMXOkBIeVVuQxkSupPjRmPSovKBjFSXS57wn6bmULWzYsgcodhnr2RwnBBof/5kyIun/60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715004708; c=relaxed/simple;
	bh=TbTgFNueUXQK+4WQPlQNUf+fTxaW9/MzKrDPCvS1pPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkIaZRYVicq2ilTmJ9fJytj5p/P15itg2hvIfUHXlCigxFKZVQhufbdWqkbomuVaPxQj6HpkPgXUPt6ecuAepYf/vsODfvkIj3g51Graa8eka93Z5RQu3v1rT4TnsQVy4GiO4DmDvhzYSFhUNShCG8VEcqnsnfza+8XH3Alvg0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Buhs3kr7; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Buhs3kr7"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6202ad4cae3so16942527b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715004706; x=1715609506; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejWvZyh4B8MRsPG+o4/dORt5ZcaM10EgFpP0QFwDMhg=;
        b=Buhs3kr7Wz0sOAZbdv5rNngMKY9vG0yDQ83EprF/z3jmMc9Vhll1Ll/TsNWPZfC8w3
         +TE5he8raPz5slRp8qWg/DfQawzQug/EtoXAX3SqnjfFqNj7L7LVEVD9SVwmFVga6gTc
         lhT+zt9EptKTRslzIMonpu6ZWvHOg8LNrkjHpj/SI6ALsUlxKeOUxfPdDZdgqCgWfNHp
         7Gbzv3ocyjsbKOCbRAgPHjYql39i46i4CckYX4XO8kFnpPbRAj4wk6/YEQ+8dC2umFzs
         5ZFVrVoAt+zwmL+GxdBSKAsd8oAEC5fSsMOW1H7H8SkpK1B7LMA34PHzftVsToGMteWH
         lRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715004706; x=1715609506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejWvZyh4B8MRsPG+o4/dORt5ZcaM10EgFpP0QFwDMhg=;
        b=lsySAOX2aEkrrytc5SNsj9fuUhgdaTJFZf4KxCUqo1ni/GGGcqwNm2Hy3P/9e3yJ2p
         smFaovVek4hhlG9mPHzbrOJ+4gNyFD7E6YJs/qT8brJ1qJZpvBYFdZBMCV2Vw1qOwngG
         4Au+/1ImDPEm/MfJLq/mLj7NNth/Pgy6UcOglCmyr6P0j4u6/SjFFnbd9uoMGzCHpTD5
         7g5S4LND6kh48rzXdjGMqZIR2AuDL471Kwnwhf3ZvAVS0W4PaRHtTOhoMbc0M0ZnyEr0
         L+12ffwSJtXJ/KelCadJibwT9pzKpGPZhpetB6vQg2WJU1TkpRgpk4cV/QNPEcdQI3MQ
         d36w==
X-Forwarded-Encrypted: i=1; AJvYcCXah39+pQsoazAlIh6af70zB9tUYGiExg9cj47uBu9dTz4OuY6FKfowqQw6T8pjxKreCLfLvqLFX8g3gsY+oLm4eQjDgYnxMcbjhXrym6s=
X-Gm-Message-State: AOJu0YzEJOBYVnZARTSWrrawKlgwlroyPh5oPuY+CQLRTLhhQqhMhbck
	pnSqsn0V1vDkKnJ1Cowkb8rZy4mcQ8LB1ZLFC4FSJGBpay4+iyrB3lseou42zC7CfFoBnN2WOqE
	qbvfHoOnCEQHxAzYNL9xKgRJFdXXndA==
X-Google-Smtp-Source: AGHT+IHAOMeFUvRTHfq4K3N7/prTsQBdq3dEC3Q3+UiFNMsTumqQN9yTKNryXMA83uIlr6qZ6Q5ehyeJWUAVercQs+Y=
X-Received: by 2002:a0d:dbca:0:b0:618:8bd6:abc5 with SMTP id
 d193-20020a0ddbca000000b006188bd6abc5mr9349900ywe.34.1715004706115; Mon, 06
 May 2024 07:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501134834.22323-1-dakr@redhat.com>
In-Reply-To: <20240501134834.22323-1-dakr@redhat.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Mon, 6 May 2024 11:11:35 -0300
Message-ID: <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 May 2024 at 10:48, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> passing a dangling pointer (instead of NULL) to krealloc() whenever a new
> Vec<T>'s backing storage is allocated through VecExt<T> extension
> functions.
>
> This only works as long as align_of::<T>(), used by Unique::dangling() to
> derive the dangling pointer, resolves to a value between 0x0 and
> ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
> pointer however.
>
> This isn't a case we should rely on, since there may be types whose
> alignment may exceed the range still covered by krealloc(), plus other
> kernel allocators are not as tolerant either.
>
> Instead, pass a real NULL pointer to krealloc_aligned() if Vec<T>'s
> capacity is zero.
>
> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Wedson Almeida Filho <walmeida@microsoft.com>

> +
> +        // We need to make sure that `ptr` is either NULL or comes from a previous call to
> +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
> +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>`'s capacity
> +        // to be zero if no memory has been allocated yet.
> +        let ptr = match cap {
> +            0 => ptr::null_mut(),
> +            _ => old_ptr,
> +        };

I still think this should be an `if`.

What happened to adding the sample/test? It should be straightforward
to do it...

Cheers,
-Wedson
