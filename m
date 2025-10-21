Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C03338586
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054021; cv=none; b=HC4FHNtnJERbL6WoStVGnBZuiaKgM0qpRwUpizDKUF3+X6yN74I6mcKxRi4Xkq6gqZ1r3KK/UQ1Olqrrl8bLmOdwRZuDB3COYnLXyYdVXr1u48iJDknq9tAp46xrNv+q0u3oBRC2vcBra7koAt402KiSxvs1xYerkix1aktLHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054021; c=relaxed/simple;
	bh=yCknDotFZEruiBosDMAm3ohbAowsDur9hp3qhsJ7LEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jOQUnYAQfaQ9pmcgc80TmS/6KkodMaB918E/zXA6R0wrO53Z4EVQs6PsJprqqwLTxjWYDEVYLsLxt4foUJJXc+DqCL+AxUtD+wKBagAkl0ftNtePCEAgtC+qpnJSkrZ8QYEI0qdEj7jlaPSV3cC4Bz4JpcpEcTMUmZCWdmwK+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xv7zzyab; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xv7zzyab"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-472ce95ed1dso20323715e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 06:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761054018; x=1761658818; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OrLUW4qM+cn8czdjP/Pa/kJCbfN7pvqfFBtXogaAokg=;
        b=Xv7zzyabgXefPJyzLd/TMox8FWzDGyOcyZdERxUWzaAm/Y/3Qmadpq8xT6lmx2lAfK
         zWesBtPwUDm66q6m271xCNdFTOAu2n9SToPvn4ZqgTP/jD85TMdFxE2XunFZjYSAB0UL
         zbd+RnpAo0spmPLZqE26ZoV7CihN/iQf6lueSmOHyXp2OWDO86T6h9GRp5tZFIJ6EtLh
         cEp/8LRYF20nbfoD56phD2wT893dJ9IirtFbPdGgd0kXHMWrp5x/g6MsmCAgFgfTyUql
         VvO+ru4+CnxXXR31Ng0X5kIZzBdtRZcHIVMkdqqcUAFxSl5BTT+uXLVyrZN8cHabxRco
         NY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054018; x=1761658818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrLUW4qM+cn8czdjP/Pa/kJCbfN7pvqfFBtXogaAokg=;
        b=GXZzzGQrvmo49yh28NewEJPwT0tk9jK4K7eFfl/9iqwVZcgn58oWHJbyZZa3B0jLXK
         S1iVUJXBeKTvIS6pu4Fwb4GeC9+jP7Yau0Udm+QUNE+sDnAlVkgi4BMU987y+f6s0b0W
         lePX2VNMdUjAIDTRVNjH9O5UTZ07ltVtZMnSTPSujqoITOcU9iGIdYUFHstSaKwVZAbD
         BuzCYiPLWwgusKFmebImZJpIKYxctwHqBUmHgJ8hcvg+2pkEQSvAEN0aPtWTsnws33iD
         Hf6kEGGgs3NmPx1NhnWleYnWpb/BbGQntBG70JksBaoQeqNngYs79jl37KlEK2Gie36l
         TvyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxSraJWhmr3ZsnQryq01FA1E7ff612FuZoK3u8k4yqKg+Oxp0A5oi2bKk2j1LmUAI5IS3nhEmRvgZv9PVb+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yztz3wMbKILVZCJcJQtSdRd/qHfuVaYo5lQqh54K1sWSChqRgEU
	OWSMvKSbwIt9CQbuYWrFMlC+j07V8Lr79wCKd8WyWgozxMtW+nbMRLmneqLYB0axQi9M665ANUc
	KNqGZyEK9U7zZydy4tg==
X-Google-Smtp-Source: AGHT+IGyXHuIJb9pEC+yUkjKZFKKvH4sB7PMpDG624E6gHyNbBCvNk3e8BAAYh/eBkRuMgY4SrmZkhQaFvx3kuw=
X-Received: from wmcn15.prod.google.com ([2002:a05:600c:c0cf:b0:46e:25c3:8f69])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5287:b0:471:1337:7220 with SMTP id 5b1f17b1804b1-47117874810mr123853485e9.3.1761054018123;
 Tue, 21 Oct 2025 06:40:18 -0700 (PDT)
Date: Tue, 21 Oct 2025 13:40:17 +0000
In-Reply-To: <20251020222722.240473-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020222722.240473-1-dakr@kernel.org> <20251020222722.240473-2-dakr@kernel.org>
Message-ID: <aPeNQQ725-Vdxh-9@google.com>
Subject: Re: [PATCH v2 1/8] rust: fs: add file::Offset type alias
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 21, 2025 at 12:26:13AM +0200, Danilo Krummrich wrote:
> Add a type alias for file offsets, i.e. bindings::loff_t. Trying to
> avoid using raw bindings types, this seems to be the better alternative
> compared to just using i64.
> 
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Please consider also changing the instances of i64 in iov.rs.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
