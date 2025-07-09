Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911828D8EB
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059345; cv=none; b=Lp/tSy3G6oLDG+54dyNNU2ktLsYWI59GqM86JB8tOTfUggEYHhQC7Msve9qVgax4k7P17sbUqIj75DqKDvXLge+XEHZc9/+VP9ZQOnbt4eu3fthLed3hNf8ygPblF5CLu3zwamr5hGDt7KTAP6Cjrmvf19ycjGztZauzkpzPWT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059345; c=relaxed/simple;
	bh=B7deMPbFN2CYKI2YUT400xYx0Qqiqi3bB/h0pqy9rXs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fvyfs4mjD3ACX61pVIIp2o944AWz+QXjoH45lDx6jlkh0SW/hdMlUiDR6Fsxtj97XLrmIbXmqW7/HC01biKHRnyNaqW4ZW4w8IeqKvKv7pfs1iV4JfgT+HMcA4WsAy6Gk8tl4li7kR039sMEPTLE5/yKzfeKgxECCunCBtuN1Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JXQCsxf/; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JXQCsxf/"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so2338107f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 04:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752059342; x=1752664142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5bjYpJSDclGoTb/1hN2DNKLtiaNHhBK2pMEgZTCoG3M=;
        b=JXQCsxf/J0PYGqtV8iMwRtkRy7oP4SeEcLXXE6IAjlNWmTNp1ReZFcw36w6yqBN7Ze
         NrTZsQRRvyBEUvddu8fy4nky5slBWVUKjQdLSWyai28INjoQvEN+nk0nBVPvFSSVEtOR
         wR07ICISVZ7SdCLrLqAKxwMxBcfeXghIhyER3BWUxmUNkFt5f6oMOf4Widp8Pjklh9oi
         x04tkNdpJP6jebdi+LMsAK38KHwdFug8A5sR7dh7pVxOMuB77TgJCbEVFOpAVTTDxNpP
         5eF3z09/9Vw3nNFR/I88R8U1tNE0BYBLXdKY7gItP5wItn6grS9wT0RmmtwN16TIpLCR
         IgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752059342; x=1752664142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bjYpJSDclGoTb/1hN2DNKLtiaNHhBK2pMEgZTCoG3M=;
        b=FUfTH0bgJautwXYvb5VH5NUu/sC34daB1U4zyL/nIgjef2QcHSh2Y7cOdixVILQhNg
         JNqXXjmu/367zTeQnKvcGWIm1npRNh6gt6swvHbmj0rmab/VPOhfyYvwr9dSqartgb68
         cW5V1q8yVX4AfWaxNujbOquJft3lYhSdV0ykU4FbwaCqJpemxjuv/8fOgU4ShWC/OwQA
         s4uvEYPaalUayeM5R5RyJ/SFlTYtVuKbW+FRTqXeR/PfRExuk3LyDsmlKY4GNPqokkRV
         l1ypoVkwt3zE/dbWk3PIA2caC9PQs6oRFzCIfkrCPZAg669a8Cp8n8L8jbeREY5PgSRr
         RuYw==
X-Forwarded-Encrypted: i=1; AJvYcCUl+jnBhVGnA9YGyg+ELU1WYF6ewXQZndtdSUrAzCUzqE7Pva3x1dI4o7XJqIdcuu3vjGa00w3bfBhlfcDXMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyntwBiDnYXEGBHIEUbcIjxhAtS1028mjH36to5te7Bzasu+pSU
	6W2iQ1+oz1K7oFk1mo5GDpoh57rzt75pzUx2N/I4j7V7Z08I105CP4v0PR9t40Eo1ZpdHUxTCCr
	R97WIya1xWhhSLyAVGA==
X-Google-Smtp-Source: AGHT+IHpIwEDwkwkHsmPKAoctj+/lLKs6GIuB+wtVk2MK/CSAVdldJRNgjT615TKHY3qGM+iPQEtTxicyM6LY3Y=
X-Received: from wrtp9.prod.google.com ([2002:a5d:4e09:0:b0:3b3:b082:6e06])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2002:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3b5e4577c86mr1377851f8f.46.1752059341982;
 Wed, 09 Jul 2025 04:09:01 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:09:01 +0000
In-Reply-To: <87wm8in3c0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
 <A6L7hDRsDyJJvX_NuoUG_Zb-Jy_BMdGLhjsq5xUSRkl6hpItQD9ZvX5ChAr9QIFH4eeDBpW-Q-582Tt4Nef5SA==@protonmail.internalid>
 <20250704-iov-iter-v2-3-e69aa7c1f40e@google.com> <87wm8in3c0.fsf@kernel.org>
Message-ID: <aG5NzRx7dIWzTwdf@google.com>
Subject: Re: [PATCH v2 3/4] rust: miscdevice: Provide additional abstractions
 for iov_iter and kiocb structures
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 08, 2025 at 04:51:11PM +0200, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
> > +/// Wrapper for the kernel's `struct kiocb`.
> > +///
> > +/// The type `T` represents the private data of the file.
> 
> Could you give more context? Please describe the purpose for the type
> and intended use. Perhaps give an example that can be compile tested.

Right now, it's basically a `(&mut i64, &T)` tuple providing access to
the file position and private data. That's it.

Alice
