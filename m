Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134E1870
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727286404; cv=none; b=b7v13NMr1zVToWfPFyG6RkfEGqjadlaSob/pMcZNJP4v3pnJDmKnruYUa8ZA9Fb+vh6ss1337l6o8EYETOuuvfjks6/Mfoe+IyxioRLHeO4ozk0EHGZ97GQTAZ2Wrq1ByMdXEqMLQkPubkjFCvfpcWiGhU5HcEeQ4PgQlWreuw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727286404; c=relaxed/simple;
	bh=M0I8Ig3rWuZiRXKwtw6xWqst8IlFBQrwd0ojV3Hws8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4P0XX78LpRAtfbXUwvBK9ZtxWSk/oUms73cF9j0SwyERBKjvjAMlIyFdY2T8mqZ4tO8gVhkJ2MeXUH17HDkslQ/04EG6rG13hq1iCeo73qYKsLAsgCspj+Mo5WfYIdjivAtohMWhzuioyfq05CFWaFWCdyhL2ixmDwQxB3kAjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DxAB4quA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DxAB4quA"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso17261966b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727286401; x=1727891201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q7bFD0zsvjm6ZC77c3M7GAfUg/FjJi2MmJVwp+M6KhE=;
        b=DxAB4quAZ5VdKYBItJt/W5a5XGW1QTHwuRueDF8Af38DgCnGC8jdHixHxRt5cp8wp8
         gY9SHoAw2BiveZSjqie92N7CMh93mBh1/Ur3J1LBtfMeUUNd5Br9x6wcoBNgGzKiDNDy
         FQ5jFQf+luYL50HRhuEaWGSz5WiLt456tedPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727286401; x=1727891201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7bFD0zsvjm6ZC77c3M7GAfUg/FjJi2MmJVwp+M6KhE=;
        b=MPwC9H2ZHXZfU5PRVTdx9TDU2sk8XiUFW2q8KVX9hZKJcZA442gRp3Qp0IG5wH1fPQ
         UWQc8MP8fHBsiiAsQdZKT+CacFgI6zCLJTrPkiuQrvQ5Z+sIaJ4lmlFkvOIlpLOF7YCf
         K5wvSYX5W0FDnw7ehvDz59N9XmfA0otFC+ODKnEFyZBidmz/VTsddQgfa0peU5ZnZumw
         37uGjvCZYGy6Mq28FvVXRw79hhQOXfEXwieJCM7BIdtOYK5Qv/3R2xCEfQ9Q+ubZm19b
         T85O5LczsOdUp+BmhT11Hx4eFvyhRafwddOPhyDyxOM4t4R9lshZ9trWV2uT16JfzMrb
         cv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVV2kH7T9AAiTQSPU3d38S63SpQmsC9uNL49IGrgipQnVP7MwPf4O+in/VaatbLxFQxMwXB0caSWhr7LpzZjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIRumNn9sQQgUFHl8Mu7gHjBFFrtVL2Tax6k6z2nEGw/+ddNKP
	rBkbQ2sOIxpJjhLblEIYflnufIb6ul/JkEvpIm5TQbOjWQPPB69hMMfuVWAFyC9KsjLLAB7lYl8
	wDYmuJw==
X-Google-Smtp-Source: AGHT+IFs37IH3q/kNp9IB/K6VQEWuJ/glPJrwMOkWJmQYuyNcWFo6Z9AgiQWuasjpILugTEYZ/VASQ==
X-Received: by 2002:a17:907:86a2:b0:a7a:9447:3e8c with SMTP id a640c23a62f3a-a93a0341d48mr279106466b.3.1727286400740;
        Wed, 25 Sep 2024 10:46:40 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f34291sm240733066b.14.2024.09.25.10.46.39
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 10:46:39 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so15367466b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 10:46:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXw+wtsL1xq613w+U0IBDpAE1X6qU6IYJDhHM/DXLYTS9W5LfEsan5Sq+fguUh5s5vQsN22EYJR6LLAQbffPg==@vger.kernel.org
X-Received: by 2002:a17:906:f5aa:b0:a8d:2ab2:c9b1 with SMTP id
 a640c23a62f3a-a93a06b92camr365210666b.56.1727286399053; Wed, 25 Sep 2024
 10:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924221023.197610-1-ojeda@kernel.org>
In-Reply-To: <20240924221023.197610-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Sep 2024 10:46:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjuMrUMceYX01T0SBz4E0yL4Kh2Jb_8qyKxJwwitCG6Zw@mail.gmail.com>
Message-ID: <CAHk-=wjuMrUMceYX01T0SBz4E0yL4Kh2Jb_8qyKxJwwitCG6Zw@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.12
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Sept 2024 at 15:11, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Rust changes for v6.12

So it looks like now the only thing holding Rust testing back for the
allmodconfig case is the MODVERSIONS support (assuming modern enough
tool chains etc).

I'm inclined to just do this:

   config MODVERSIONS
          bool "Module versioning support"
  +       depends on !COMPILE_TEST
          help
            Usually, you have to use modules compiled with your kernel.
            Saying Y here makes it sometimes possible to use modules

in order to have the basic Rust stuff be part of the usual allmodconfig build.

That gets it building for me on x86-64, at least. But at the
maintainer summit I think you said MODVERSIONS support is being worked
on too, no?

On my arm64 box, Rust support is still disabled due to
RUSTC_SUPPORTS_ARM64 not being true (which in turn seems to be due to
SHADOW_CALL_STACK support, and that needs rust 18.2 which I don't
have).

Anyway, just a heads up that I think we'll have more "unintentional"
Rust build test coverage this way.

                  Linus
