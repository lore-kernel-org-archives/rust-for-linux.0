Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62B435209B
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Aug 2025 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756217782; cv=none; b=lpocntWP2hZcW2CR2yBBHWzVs8TS4jTXim9XSjRk55wuWxwSGwc+YY5AK8ZKkPJ/Vss3k98CE9GPZ8g8WxlYxaD6HIZNIIW5EWJy1VyXssyy6Nn/N52wIT8vfRP2ZcOso8rKH6TOYhwhGdqpyxj1UxTAKkmuPMgETQ8Y0ZzwCWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756217782; c=relaxed/simple;
	bh=JYtA7MEWCu3TdUJIF+w0avlMYJ/YPuqPGJjyXpfrxtc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Om+9Q4fTcSYKDsbr8GYeeUFr8scbnY6od/jfuwlfJlY5oSjWA2FoEKhGRBgVnxt8i5c85Pye3DXFYgUo4yOoFai7UfLcBaYhY3e0QjpsJ7CNYo4G7uFLncSYfN9CWcpQA9woA4m0zcxQmazp90DYDkI2Amf5V5cDH/rloxZHAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O44CKmw4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O44CKmw4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a1b05d251so30825975e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Aug 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756217779; x=1756822579; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=akTDslNNUt2vx6jD7Hx+KEsBsqdN8X+XJe4gjrz9sWA=;
        b=O44CKmw4vvGSirfw195VsJC7idJltIe/Rs9i07buxOcOK3icHq3F0MzrcWe03bxO/M
         uMSIpbPPBtcGqWaitWFgDOivsqhYY0+uTbJcN0rjzuQMuN8dkENG3G3H6cGa1RyfmXra
         LddS4D8CcgRLf6hVxQeVlbIgdM3QSkoFqRtQPAjZDH4YslxlPGsE6EKp6I+ApaqZmjzq
         VvJpX8JTtakNos0M13fxuRukrsYzsUy/kdjjqRFic4vX0nG2g6cVMxmheufGp6j2DZlg
         SamrAPYUAD50nKelQNH8Y4XsusCbDB5qnmaB/3uzf2b3nfDhT65Yy305Jl6Z4ykEUaes
         RYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756217779; x=1756822579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akTDslNNUt2vx6jD7Hx+KEsBsqdN8X+XJe4gjrz9sWA=;
        b=nnQeXf1vKgPR52bzPpULV+02crkKsIV5duHnfHKi2IzC3nZ0PV606iUnMrjD3yTIQB
         JrCBLQVmnwlCrm3uw9in1zLCsZYRww64ZTxkNy5mSR8epfSqWkGSg8c5zkSiGFK/Kav8
         O73txMPKb0iWtq0FRiB+35wGea/QDl9Nk5hak0h564+k+ou03+w69AtNXOFcl5ootzhd
         En8ZgVbi1vDUzNDulLhrIYkd9mMZUFolTx4iWAYQ7z+PWMRUFq2CcoNMbWftD2suLv/w
         Gnhl9TWDPn2SfMwJ/gOaNpODHPRA9z95uxzYKk2+5nWslGFhV3yCrnI7euusHvbBHPUM
         l2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXIdduA+kM/cBHjR27T9///Dgn/jY9LmrqoxMLOkX/1q7YA59L4gZAh3u5JFVaSnwEZiAKmRU9VZC7bp074Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ICDKrqwOXD81nsmL9ZOfoSiZkMHE89lGL1L9yS5m9iMgTS9m
	PQo0VtntrpDbCJWJGT6A9oZ9Ci/YOCfr/af7eWakJjUMp7t7USwUnOc3KIfBWicPWSlCIIqvqpQ
	Lu0XyWPkTO44c2lH7aA==
X-Google-Smtp-Source: AGHT+IFZIZ2k6945Ou0vzkjWaYZ4q9OleRLMRgjFBfxsJlmVNGaiUhf2eyNUXj4adlW1xLICcEBtH/iw1aKkE28=
X-Received: from wmbez10.prod.google.com ([2002:a05:600c:83ca:b0:45a:2735:ac9a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:350e:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-45b517b962bmr134768595e9.19.1756217779205;
 Tue, 26 Aug 2025 07:16:19 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:16:17 +0000
In-Reply-To: <20250825132539.122412-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250825132539.122412-1-dakr@kernel.org> <20250825132539.122412-4-dakr@kernel.org>
Message-ID: <aK3BsV_s-xMQLF4d@google.com>
Subject: Re: [PATCH v3 3/5] rust: scatterlist: Add abstraction for sg_table
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 25, 2025 at 03:24:42PM +0200, Danilo Krummrich wrote:
> Add a safe Rust abstraction for the kernel's scatter-gather list
> facilities (`struct scatterlist` and `struct sg_table`).
> 
> This commit introduces `SGTable<T>`, a wrapper that uses a generic
> parameter to provide compile-time guarantees about ownership and lifetime.
> 
> The abstraction provides two primary states:
> - `SGTable<Owned<P>>`: Represents a table whose resources are fully
>   managed by Rust. It takes ownership of a page provider `P`, allocates
>   the underlying `struct sg_table`, maps it for DMA, and handles all
>   cleanup automatically upon drop. The DMA mapping's lifetime is tied to
>   the associated device using `Devres`, ensuring it is correctly unmapped
>   before the device is unbound.
> - `SGTable<Borrowed>` (or just `SGTable`): A zero-cost representation of
>   an externally managed `struct sg_table`. It is created from a raw
>   pointer using `SGTable::as_ref()` and provides a lifetime-bound
>   reference (`&'a SGTable`) for operations like iteration.
> 
> The API exposes a safe iterator that yields `&SGEntry` references,
> allowing drivers to easily access the DMA address and length of each
> segment in the list.
> 
> Co-developed-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Overall LGTM. With comments addressed:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +impl RawSGTable {
> +    fn new(
> +        pages: &mut [*mut bindings::page],

This should probably be unsafe due to the raw pointer. Or could we pass
any pointer here?

Alice
