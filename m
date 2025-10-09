Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD1F2C21F1
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Oct 2025 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009021; cv=none; b=r4ywnpChJUb+rBs97/5awsEhrTQHQgu3USY4LMylgX1ghKeEOUsKgujI0wTV+j6LVKXnWf36PKuELPzm4zPK5jqE871Yg7bMkUVKaWa4GGkZDhYGS+CZMfkrEjH0zaCdfn7hGkWfSCkoKbi2J/c3T4Mz9lzkKO+A8yDCt6NgSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009021; c=relaxed/simple;
	bh=53+4wMC+Onj0pcyyb0tfum8mda0xbfemyz90dOOvrPc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CP9gtlzxdXGSDhLqpmfH6bbTFVrzexhh6dSxJl5vACsi68LTDKFmTwUiglcI7Q49k1++8oKVptzlWWTZuyjH+w4J4wxtoZNg1koEuQexZ5umlag30lsuKvEWbrFUDroaCJSiVQSda8VBp4zVKEDL1QmJD/8fbKVAvCOkjO7xFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jIYZsP3Z; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jIYZsP3Z"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e377d8c80so3530865e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Oct 2025 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760009018; x=1760613818; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=53+4wMC+Onj0pcyyb0tfum8mda0xbfemyz90dOOvrPc=;
        b=jIYZsP3ZMtzVqywlXndbqPqKh3siGpvb4G4NLele1GQsI5qTVbkQfx8+aR7LfGYB4E
         vMoIaVwS7AyfJnQznILuSCjqJ7my0mepXBKTGfSIhxpwASrtN7nJC8jVaE+FF+1Z3eEU
         S2WjHnga+XjcBHMlu7W/FfcbCpO62aVHo7UsTAALEey23RoqgOew5Ad1gPeC77LerDi0
         Xqtdh7Wt3EBtTsWriWQfL47dlFC8cOCu3MKPQv7W6C2xlAavto1OO04U3h8t1APRdUJq
         UvNk8AatoKnTdU+yrwByNV4h5M+OwecuOeeRUoy2UYttdMe+e8ycVrQiX6SIUBrPXQS4
         Yavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760009018; x=1760613818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53+4wMC+Onj0pcyyb0tfum8mda0xbfemyz90dOOvrPc=;
        b=F6JWslgcu3eNZd0+7OQ6wUzwNTRT2xk+70IGVcCJImJLsbxTyjlNR+I7d9XbcemBLr
         gsr7NYhJG9rjW5xB4q07ZojXbl5lh12P4yAxMjOaA27IEgkZd4K85ZsVGN4eVB8rPPEz
         3zEhEOtgSIJRH65+kpuPZpS8e+MgPBtOjSJ6wcge1zoDh/CMYjS1riDQF4UaHWX3rwQh
         8ScaIrv2brsJrynuDOZm0H6JG3pn2x3Z9C6XtpEMX/c1aFM5NYCnk5G4QcLqyDBKJQrw
         hlGLm/vhX9kFaLPayjV+ckJNua1MeZnvk/zCSYMYf7vSq7C0I3ogtWI9iI80kL0sXeof
         8A2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8ThVICjH7Z1sbAtFmSZ6u45UD7eSrKzrpyUYRcmKU3CuqESZEOBar/X4N5VZ5vERBKeEXFaW9WPWAAJLMEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypLmjzDCeyNeOrf4SA09t+ges7ApNuspWMgWknFu/1KsVhaqtx
	HWALfbTBJF1efYqFPBb9DO3kQE5GbEmAqd761znsJMVArPObeC30M+bcq7tpgEGBqqXaSFDWzpH
	bwAWx9v1de6fJppUI9g==
X-Google-Smtp-Source: AGHT+IFjXIT5EP3KT1wMYJ4PufzJKQ9ukEXL5xHmneDlYICUhOq5Et5M4EP34H+NtT1tIG0ujZvZF/13qZWJj6U=
X-Received: from wmvz5.prod.google.com ([2002:a05:600d:6285:b0:45b:7fa6:f2ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8586:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-46fab89b7abmr30193915e9.34.1760009017907;
 Thu, 09 Oct 2025 04:23:37 -0700 (PDT)
Date: Thu, 9 Oct 2025 11:23:36 +0000
In-Reply-To: <20251008181027.662616-3-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de> <20251008181027.662616-3-markus.probst@posteo.de>
Message-ID: <aOebOPvpi1sYKOuM@google.com>
Subject: Re: [PATCH 2/4] rust: add pinned wrapper of Vec
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-leds@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 08, 2025 at 06:10:45PM +0000, Markus Probst wrote:
> Implement a wrapper of Vec that guarantees that its content will never be
> moved, unless the item implements Unpin, allowing PinInit to be
> initialized on the Vec.

> +/// A pinned wrapper of the [`Vec`] type.
> +///
> +/// It is guaranteed that the contents will never be moved, unless T implements Unpin.
> +pub struct PinnedVec<T, A: Allocator>(Vec<T, A>);

Could we simply use `Pin<Vec<T>>` for this purpose? Why the new struct?

In fact, does the utility added by commit ac9eea3d08c2 ("rust: alloc:
implement Box::pin_slice()") not satisfy your needs?



Also, this thread seems mangled. Patches 2, 3, and 4 should all be
replies to patch 1. Right now the thread is deeply nested.

Alice
