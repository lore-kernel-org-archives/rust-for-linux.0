Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DB932B9B4
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055398; cv=none; b=f34kh6xbgPbKJGnZUvbTJ+ECBJDl9G9Sm9FStFVGEUWdiHqGFtHPaHBUCRUg6jWnBMNBNsmn5uxYLoxkepWwj27/GTxpwsAGeQVx2BB6/0ItvpkUz1Tiye8jiWqs/blj1N7RjPZYf4w0Sn3GLi3xS0HgnoHNB4PnAf1NGJ5nSv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055398; c=relaxed/simple;
	bh=7G4waim0VeJfYc5UImM1ILNYZsWnKxbZqSwSOW0PnuY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fn865/y4TDoGBoKm1Um5juwaHT9cHgwnxNnd1+I8Zoe3UBjdaPPmlp+kefEdIrUfvnhMWdUWyrwc5hF+99CC061vGPeCx2LWeco0G8WzO2ul5kNhuMndlLOq4tjAnhMSuqk2Q7rY7T/nVE9udT5BHxJYyIVlklAK8bCzU81RGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P4ieSrPW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P4ieSrPW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-470fd59d325so29228325e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761055394; x=1761660194; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=shyGPfyT7UZA3DJZBC7WKsd1LwTAS0uHQ5zFBJIRGN8=;
        b=P4ieSrPWVKoIm/lC3yWjg90PbSAHzu3T6Sau4hmFsN5Jl9CtRaakSvc7ZkOI6QTOQe
         XKgoscI/r/u0QTnA7/0AkCw0Q/TLP0eduwPoMFecMAbE71mpni7DRRuzM8H/a5eXOv9a
         rrpU7GG2nl0LREd8G0LXkWDNCxyF+MsYGCAsWojwBdraHihmkAx48xnyea76gWYHprS6
         cWB0mVcViBFFvnr9x6hSSYEIGjRSzYvkCelD+okad2MoycQl8oOWJIqIZpObxJ24SEDc
         pFG9P9g9dBAmKUUHgGVfpaOdGCSi8UyNmPSCoPdN5knzuXF0+0c9hN7CZEjIIAfbutbe
         iQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055394; x=1761660194;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shyGPfyT7UZA3DJZBC7WKsd1LwTAS0uHQ5zFBJIRGN8=;
        b=jC5er3vwf5LmnOnqtgUI8U5rGiDz4M6RcRfykjTwEgZ2nXVK7BbvkQ4h2+pN0N9i3s
         1hrvNFgnu2rSuzbyPxNwBvFHzVkPhuxtzKUzqzNErA23NLRn+eVd9g6YTOdNuQoIdxmx
         qHWi/sdxRSMScYoV0TXx59TJSGcO1Y8xs68/ZWIw4P3F2B/lIBqKMnKvcLQbjwBERXPS
         asfJhpf5orR5gFTMEZkdLentOxJRkflZZ71d/8Qt3AIzZNQwpCDCK5PMNJnF4JqKlqo4
         CxHzaZfcl0diZZp8ScA+3zjXEoPld5mg2u/MJ3tnaxR0koweU+3nK/t1ORsmvcvUOmea
         ED+A==
X-Forwarded-Encrypted: i=1; AJvYcCVM9KnC0U+E7wVOas9bJ7/dO6t7rfJsh85wS1+ANUKVRWaXPimouZFA7jfTfFNPT1K5D+KNs4NATpZlf/oqYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytHn/CDFdL7LK90FmapiojIiLkgpSsDk2RSW9f2ssmw4JJPCem
	FgI/mGpaZVYzN8PvjVCXU6TRSWwwL1GJYJVyWClGzwxMOreFnDWx8uybdgnrv0hsL038oRkG4A1
	9XCoBGLgVucI05Bx1Jw==
X-Google-Smtp-Source: AGHT+IHLLpKviw22ar27K/HuMjAHYEeLK4Z0OurwlILZBXJxSn9ItdjvEht0eB96eARzWNyuDiLwIyb22ASCFMM=
X-Received: from wmc7.prod.google.com ([2002:a05:600c:6007:b0:45f:2b4d:3c2b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:681b:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-47117925e39mr133621965e9.36.1761055394121;
 Tue, 21 Oct 2025 07:03:14 -0700 (PDT)
Date: Tue, 21 Oct 2025 14:03:13 +0000
In-Reply-To: <20251020222722.240473-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020222722.240473-1-dakr@kernel.org> <20251020222722.240473-5-dakr@kernel.org>
Message-ID: <aPeSoet6KY9kxzqX@google.com>
Subject: Re: [PATCH v2 4/8] rust: debugfs: support for binary large objects
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 21, 2025 at 12:26:16AM +0200, Danilo Krummrich wrote:
> Introduce support for read-only, write-only, and read-write binary files
> in Rust debugfs. This adds:
> 
> - BinaryWriter and BinaryReader traits for writing to and reading from
>   user slices in binary form.
> - New Dir methods: read_binary_file(), write_binary_file(),
>   `read_write_binary_file`.
> - Corresponding FileOps implementations: BinaryReadFile,
>   BinaryWriteFile, BinaryReadWriteFile.
> 
> This allows kernel modules to expose arbitrary binary data through
> debugfs, with proper support for offsets and partial reads/writes.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

> +/// Trait for types that can be constructed from a binary representation.
> +pub trait BinaryReader {
> +    /// Reads the binary form of `self` from `reader`.
> +    ///
> +    /// `offset` is the requested offset into the binary representation of `self`.
> +    ///
> +    /// On success, returns the number of bytes read from `reader`.
> +    fn read_from_slice(&self, reader: &mut UserSliceReader, offset: file::Offset) -> Result<usize>;

Maybe this should just take a `&mut Offset` to fit what I suggested
under the uaccess slice patch?

Alice
