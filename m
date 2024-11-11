Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3630014F126
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333269; cv=none; b=mEBIaJpjP8i/ki0jn6ZhOwjUwS45SbNb2/QQUmzhmEzl1jMK7kAOqt9Orh6qEXo+eY00VnkDvv1Z7ztsMdmR29wvw96/cCeMeB3X3H587xh0/XxH4N7mNxarmCwONazzPh/iKny18IplCXJMO8g9fOJO+drCrm59dRN2w0Cy3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333269; c=relaxed/simple;
	bh=5Vjbgx7ixgONb8LShSrJxqI9bfz6j30HYJI67+/7lG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkLG+e21G53WYguNhwS7NiWQlstAwLM/RHjXbTT2BzShn1SzTlwQO70LZS1n4AATZ/W0MlRV3mltHJ2G5Mh8wnBiiRGWPTRAOPGcLTEtX7cjkqHHH5BE058czUXOpbU3sqFWJK0tEFyI7CkGSchpXZyLXZ2bOvcrV5xiY7+lGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n0EDRp8V; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n0EDRp8V"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ee4c57b037so3254045a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 05:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731333267; x=1731938067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Vjbgx7ixgONb8LShSrJxqI9bfz6j30HYJI67+/7lG0=;
        b=n0EDRp8VXJNNKa0wHDUs1iTrmWpaU1R1mrMAsW3UMrQMSjU/Gu9kK/PoGUkdmDsDUy
         3l+XL2I3B4LPPJ+6q0bUhqNayVWPZvbgQgd9UoP4bnJ2dCLHYl1fZewpWBA9nMaxs9/Z
         qaxwF+lrFpE8rUOxaeURh4W8J57+283lhdJfXhphkNM8v/ZOWuYLvZCfkUGqJAFN6Wqm
         mS/u9IGi9jWGJejxUQimQ2gQkG4m29IqJMskBsHNaVD1wWx9AePFkxJkcBIzpG2gcQNX
         19kxXARIeq6wNzstdjJneQiSaoZ8ktlFF2acldHvI5S5pVRcv2wR5MNqBJJTjMktK85+
         AhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731333267; x=1731938067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Vjbgx7ixgONb8LShSrJxqI9bfz6j30HYJI67+/7lG0=;
        b=RAHHBf5RJsnM10VWQNP1FJQEmK6qsgauFr88GeUcof4O5Qes0+JO+RLj4EFPEzYuAb
         NAE8LOsN+moGq7Xq4geOXLwKPiwtS3JaV/yuIk7bjaF6Z8+kb23S3+Fv9H7wvtU051f2
         7CxL7EmYv+YTQVHUwxAI7woQrgEWvqyNhHqdUknHI7l4gs9Ft0I3lihl5hNniQ/IahLG
         E4caNGdWvlP05pnb/+MFHONhIfQp5t/TCxhFvdTwlOP/p0j6bs3K9AOXy/MtpvUSqSqa
         qVsilK1dQfnxb0NDCDahRTlXYW1FKHlS6numO5YIX1pMic145TDC9LW5qKsjhY4+XAjT
         gmqw==
X-Forwarded-Encrypted: i=1; AJvYcCW8+S615L4X598cRe3qJb2F7G+sZansrz1m7mvmADMy1/y8PW0zORrL41/aCZXtz9xQ9iPDZcn70qThxI1VTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+hNCvF/bQM9P0GYu5/a1A8tDmzariduI5j+3QP4jJPK+5K4H
	Hm3TRoWISsaOMNUrlTxdThR9JmsEAqzt+eJCYQ+urCp/KLQhTLhYh9sLPYsvbpojcfyze46vTp4
	dCoSipkkZJReOtC5lxJ+qrbQ9Xs4YPc0liYfh
X-Google-Smtp-Source: AGHT+IGeAW+Yv/wO9lwFsK6rnkz5dzZNVJlKI88KA6w3uJ72SSct9zJH2xDx9tQ5lGqYmVWQwXJ9VeNlLGP9aLnpJ4s=
X-Received: by 2002:a17:90b:2250:b0:2e2:da81:40cb with SMTP id
 98e67ed59e1d1-2e9b16e27efmr17962190a91.6.1731333267242; Mon, 11 Nov 2024
 05:54:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_2AD25C6A6898D3A598CBA54BB6AF59BB900A@qq.com> <tencent_1FC0BC283DA65DD81A8A14EEF25563934E05@qq.com>
In-Reply-To: <tencent_1FC0BC283DA65DD81A8A14EEF25563934E05@qq.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Nov 2024 14:54:11 +0100
Message-ID: <CAH5fLghPWwPQVtMjz=x9XgnKKhyv6ASGFpt2VLb1Gb4YpGnRMQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] rust: align Debug implementation for Box with Display
To: Guangbo Cui <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 2:53=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wro=
te:
>
> Ensure consistency between `Debug` and `Display` for `Box` by
> updating `Debug` to match the new `Display` style.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Guangbo Cui <2407018371@qq.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
