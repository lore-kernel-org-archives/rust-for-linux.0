Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4BE2FD1BC
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347176; cv=none; b=qGozzr3wKoRrevejxIzotc+xkM0sB0nqA0v0UObBngUWbY9zuiCaDdBO5xZrIdfw7tLj+2T/YHvrc5teMLfYVN0rNWRimq+JM0OS0GvFM6VLBOr7AZTFw+GS3Ifo5FmX7qDEc2GZtiEP0kIaVHP7n21oP/Od2nOyNJ1kXRKZY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347176; c=relaxed/simple;
	bh=7e11H1Sl1fNF6/Pen2WxGe/Xr1qM6aJthuzJAA0/Mog=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JRfhQPdqXGpwrWJkYAUaVn91Hg5BPwLX0sDso85EgL99zB3oHZvED2T//G3Nchty4W//O8Yt92CMXwhpbTJopcdqS2VwJ2+V+tlkEgZaytnzSJbRss3xsbKdv7Sg3WqUTQDoiG4ft9fg6zWeokwP99Pi4JTeob8dciqt5UTGUWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YSSTSHrY; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YSSTSHrY"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e2d845ebeso23951045e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760347173; x=1760951973; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q8mp6Sl5lpIMsBMcZe0Dwu/oRU1yIEVK7dE0nvjB0QA=;
        b=YSSTSHrY3NH96/uSeY/MlaR/nwwhMmGarHJY3Ud8u6STJkkEN7tJ+Zk5EK3BHfeKQ6
         RPy8McdCnU4jLi4HI8XVD3mqY0aJtlUB0TDKRUbm9tp6kQQG3+poAYe83c6ZDwc6/KtL
         zlRRU9qrPof16XFru+DmWM2xp7cgm2sRyREbSsF+eDjeeiiildFkdleGT45Z4ME5A+qw
         QgIumFCdMXsznSL9cn+QzvZlTwrWG4/OdoKLcYG0uaUPFWR8D6QWf+PJxXaJabWJp6Z1
         yNUjs9Er60uo2acZDRVbL98qgzKw4uY8wgTmd8PVjA9DxzH2lH8+wTlG2NLBFr2GqneV
         GEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347173; x=1760951973;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q8mp6Sl5lpIMsBMcZe0Dwu/oRU1yIEVK7dE0nvjB0QA=;
        b=JO6rPPPb1GPK5pzBCjeQMZCGav8L9WyR4G5LG9EJMKJ0lYhCBGMg/mTVa/0bqgvU/e
         fHjBDKT4FiTvME/9Tu6Ank/zLhK42nbgjuemZLs+5If803uh2uZgPlTkpQEpkfU/rFZF
         f5T5uDrlASNytop8YfHJUzwm9W1aSziU1ndEoGWD20Q+02+IASuPCa9ug3AgXNm7vzhc
         8DzA36AFKnKWAcTtCjfZV4vm07Bhiq5ZeVe9A1YXn0xBms0T80PCQalXfppFytvCWeLS
         zGnF54HP9u7xbX3b9RPNkn7c+tSpIpRq8xCxgsWyimEoXnKhnPN9xGoivOuFxeTost1Q
         LxJw==
X-Forwarded-Encrypted: i=1; AJvYcCWPGhFF747aM3eBKp1KDzcgLISRGej8iNV4ZcwVl+ZHcpwqneX/vFzsLUJyE1pBkHHq7D2Y1WeK9C7uQNjTWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo4WMhaWhuEHYNV7T2y1HdubqjvUuIE3FASvvRMweKShG7uD7J
	s65KEdxU/d5wLXbwJleTbUFWR2Z2LMlyuDKITlVmd5kqbzURwLLs548nv0+Ojg7u/MApA9lXJQk
	nmeQM2ZJu7or/bNKH5w==
X-Google-Smtp-Source: AGHT+IGyE1/ItkqoGr313xqMor1adj+/d0l73A5B2xL0EAcjYPfGXqLNzPt25q8he9xrFaEgiN5RRjL9JA9wkiQ=
X-Received: from wmcn14.prod.google.com ([2002:a05:600c:c0ce:b0:46e:2897:9c17])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83ce:b0:46e:394b:49b7 with SMTP id 5b1f17b1804b1-46fa9b16597mr144514005e9.37.1760347173573;
 Mon, 13 Oct 2025 02:19:33 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:19:32 +0000
In-Reply-To: <20251012213230.1139674-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251012213230.1139674-1-ojeda@kernel.org>
Message-ID: <aOzEJAdNHatrW_Gz@google.com>
Subject: Re: [PATCH] rust_binder: clean Clippy `mem-replace-with-default` warning
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Sun, Oct 12, 2025 at 11:32:30PM +0200, Miguel Ojeda wrote:
> Starting with Rust 1.87.0, Clippy reports:
> 
>       CLIPPY     drivers/android/binder/rust_binder_main.o
>     error: replacing a value of type `T` with `T::default()` is better expressed using `core::mem::take`
>        --> drivers/android/binder/node.rs:690:32
>         |
>     690 |             _unused_capacity = mem::replace(&mut inner.freeze_list, KVVec::new());
>         |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider using: `core::mem::take(&mut inner.freeze_list)`
>         |
>         = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#mem_replace_with_default
>         = note: `-D clippy::mem-replace-with-default` implied by `-D warnings`
>         = help: to override `-D warnings` add `#[allow(clippy::mem_replace_with_default)]`
> 
> Thus clean it up as suggested.
> 
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Thanks. I guess I never got around to making use of commit 47d8101924b5
("rust: vec: impl Default for Vec with any allocator").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

