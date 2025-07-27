Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF737263B
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 07:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753600577; cv=none; b=N8HfMV4kmaHPVHj5KuzLAqexbSRATBiRksX3wr084FZYWKnar5oHknU14IxO4k+pcZaeC7Q6/lVbP5Kmv8ta8Qp9ruVmx0L04G0fNGJVpinZME+gsqmne4esAND0SFMCuZUXUo55DZUpKQdXb995RrLNkWqfZ4Ul1MMfxFFHzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753600577; c=relaxed/simple;
	bh=WxIS3k4tG4PBAzt6QvpOD6KjEtIZ8/MPp3hgjsTlbLE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rKr2vruuRhTqlNCIs80r75RKcL7ZgB5oT9PqXWK+JsoWv/XIil3gLpa2Kfq9bbiAERQ6lYIz7Tkl2XktG8UJCdndy6ZHhLwCLDJ23ahxTDrdgAQXppdOcb3cs/NtWcqC0Fgsfc3/1nZRqaE2ttXSardPdiud4S5j9OK/2IhPOlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BU+ceU4t; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BU+ceU4t"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4562985ac6aso25822235e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 00:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753600574; x=1754205374; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5s0d7xTMqboAeQUy1lb4rWAvQTFKv28WU2Jjc6lc4pg=;
        b=BU+ceU4tRe0hVEEOEuJhS+8dud8V9uecJFIREG2FtFBtZBpaGT0Gx/oeMzrDKwiUn7
         GaDuvYcLQeG+hlG2s/TFSZS3Dy6fYZVjRTXe0P/CVCp/JN+3MajaiIEHyAJ5x5MMqLZZ
         XVkZJMeje21zqx0k03LnN6J3ZQ2t9Z99/vlHg/8OCVHTZQ0lznpqy/m/S3NFdhSVGN9P
         4/WFhQzxKEnZO3R/0Eluxd0hbmwHTwGduQlW8kSUfHvM6qlVjqYwxAb91ChrxH+5tWX5
         GMAqFcgQ7ToGLWHP691F9PAcHgdoMkw98QC53HU6FXmbaKiUNEaYdJUx+Xm0qnTa7oCK
         dUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753600574; x=1754205374;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5s0d7xTMqboAeQUy1lb4rWAvQTFKv28WU2Jjc6lc4pg=;
        b=wHUM3ZwLxIuT2jkoj4h36dIrREmv7c2oeCceWYGiy2rbWev3oQvcJQDuwQeggbWDV5
         qdgcZa3pqL4aMOmlf2zMrO1UxQeKKmC9LkJUVQhYORnWLFM3R2Y23q/jJyVpF+dhYZK8
         WsZbjv4vu8nvoZs0kVMKAgbzilNSj0pN6Czo4zp/Z1IrkrNnyQsFRd6ot1qGTrZ8qRWF
         UBUkygpR7k4/8y7CgfsybP2bcRYj/nz/o0FpkYQDd16XK03tc3YVgRyZaggTRofT7VlW
         r7szgHJBqdilADCP93ea0z8RlSQYJFROINwFwlQUKJa9D5/c6Ej7OLWEtlBRI4FWx66Z
         e5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX4yjkXomQm7kLWGZQHk2pRg0HXt7jAsLpj8DpoAoNq5JTVin6NakHJ6eBUAhPTWvw8xt5EYvIkrFR1trx7+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygz74ZiBGF4/YixA0xnk0Shwp8onVtRiTtji/Rx9qrWbkGZMda
	v9ImLJY5TthlmoD6/K+jxD0Yz03L5qFrqRZP3VlAITKyoBQoy734kF+goDvtMJGs0/6ai3PopTD
	Wj/egRcBx6F0eE1DH5g==
X-Google-Smtp-Source: AGHT+IG18wt3J3Ec6FFHchIY4tklf/q9QZjeL8R6loGFvknBQEuHb93kZkOGgSbRnJe/bNXntYDW3To20ZXl7DQ=
X-Received: from wmtf6.prod.google.com ([2002:a05:600c:8b46:b0:456:365f:428b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f15:b0:456:58:1114 with SMTP id 5b1f17b1804b1-458785288ccmr61331425e9.9.1753600573839;
 Sun, 27 Jul 2025 00:16:13 -0700 (PDT)
Date: Sun, 27 Jul 2025 07:16:12 +0000
In-Reply-To: <cover.1753423953.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1753423953.git.zhuhui@kylinos.cn>
Message-ID: <aIXSPI3cNfrJITOE@google.com>
Subject: Re: [PATCH v5 0/2] rust: alloc: kvec doc example and allocator unit tests
From: Alice Ryhl <aliceryhl@google.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 25, 2025 at 03:02:19PM +0800, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> This series includes two Rust patches:
> 
> Patch 1 adds KUnit tests for alignment guarantees in Rust allocators.
> Validates kmalloc handling of standard (128B) and page-size (8KB)
> alignments.
> Confirms vmalloc/kvmalloc reject oversized alignment requests.
> Ensures Rust allocators respect kernel allocation constraints.
> 
> Patch 2 improves the documentation for KVec::as_slice() by adding a
> code example. This shows how to use the method with push operations and
> assertions.
> 
> Both patches are co-developed with Geliang Tang. Tested on x86_64 using
> KUnit.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
