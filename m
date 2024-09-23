Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1151C45
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083274; cv=none; b=f+XTtshGR/pAzh+SSp3WYYI5gKzLNyn9UbbHWlUEjpHAYsyU4rzvvpXBD0fyYLXZ0CAQQt3V53Y+pwfebVDyU9MMCbl2sbteqT9SDj48cLdxh0sIYzC8dnT5T4NEejbXeKHqAR/V6cTCquee0qSQ7Ize3RXByQ0IKmOGt2DjBHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083274; c=relaxed/simple;
	bh=LxBrHlISO2kuKwfwhNISskZakbzDD+oYAmZ0sQhWXSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/VJCPuiisDFwDT8xyoWX1ErAj/JZDZ2VdmVALXvHkLhP9O4vV4FStMQaNQFD48ZI+nKjxz9LxxhU9l+EWQ0I901jYEMDdlvEY3HWFWcuDfkjadodEi1WE09rp/RXV2gbxJSOsKB2h22/lh2qvWkHcbY7gA54Q2v1yuH5MVyWdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mNwNw13U; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mNwNw13U"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so36964255e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 02:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727083271; x=1727688071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxBrHlISO2kuKwfwhNISskZakbzDD+oYAmZ0sQhWXSk=;
        b=mNwNw13Ug5Wp6+t/7QPVFfm8Q30+to8CA5bW8ZcotTkYb2ViF+QVRwzay3UWpPcl60
         Q0Roitjfh6EQuLLO3CK+TYtziI0FMZ2VtgTPOXUyixcaAepkTD6gBATFG5fgwhHgKZOV
         7RBGT/aevVSq1r0/lFdgWPj3r4HqQ6R98JyvHKoP8GzHrR7lNX/hsq81waNy2aYnOY7j
         RKI4vg+hqRspf6jkZY8xNV2Ri72pwsZcFQp0GyeIzeHNOLdnwx2MiKbGO3mhP4ogYG/2
         oVn+SvXIoZYbie/Fgyb6ZANalMakaS29ph+JYMtSKnDLWTrAJGQVmjq/wcQ8nRsmC13S
         xmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083271; x=1727688071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxBrHlISO2kuKwfwhNISskZakbzDD+oYAmZ0sQhWXSk=;
        b=W+4C49pyifjZEZDzuMZXnmJqrZV8x+wmLv9mfgN7llISIgaSxIlrAs62UeLAtLDB+h
         m47S+Le0kGtRt9YhYn7HeR2eD2lergr3iIaiYvQKgZXtv54ZMmn8uhLg33s6dU2sZQCF
         Tf+rxSbKydoaSDRLuyZd+t1vvx6F2bZrZzK5kaZ0PDuExHxB89WQLqmtjv1clZ3C1oPN
         usaBzroJft6YcPWiDFnO3of2nOq9tfE0B9FSK2EYVUZPUWr3s7QlCtVcVhTB31yvY1ng
         KRj6vl9M1kJL9RECxc+AviaeM5rEn9pLtix6rUyPKRjWtR6MQnqERtxC04B8mzh6KAom
         eeUg==
X-Forwarded-Encrypted: i=1; AJvYcCV9m5JNaa26hY52epT2wkfMyoCT4m86MAkaVJ/ZOwkkNCaRqwrFmGJy4wNSmhSgqSKO6/X1/4o4tQwrTUXdqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQJgNRG5LKATpJZku/xXaovkT1nSVQgigG4nCFLrmnc9f9NL2
	iQcitf4yvZ1c4C8oTPIdItiuKWLRagRM0DABMujRg1TiJO095c1f2gbcos0EZF7ivJ4TQRTOQuP
	bX2IAm6bIKunSF1ltqK9YRgrcNLJUI1V1kAbC
X-Google-Smtp-Source: AGHT+IGh2uBO6Az6rd0NWhkmsH/KJ87sqR0Cr2RIfdO607udILgzlAHK22VzSdBn8SUe6CW8/XLjmFFf2HRoND8uD6o=
X-Received: by 2002:a05:600c:6b18:b0:42c:cd7c:a196 with SMTP id
 5b1f17b1804b1-42e7d5c8614mr87512705e9.17.1727083270926; Mon, 23 Sep 2024
 02:21:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <20240913213041.395655-3-gary@garyguo.net>
In-Reply-To: <20240913213041.395655-3-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 11:20:59 +0200
Message-ID: <CAH5fLggVa-qOtZuB7XHtW-BfhWqjFD9qTt7_U6aajzK2Xo4BPg@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: map `__kernel_size_t` and friends also to usize/isize
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, Finn Behrens <me@kloenk.dev>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Currently bindgen has special logic to recognise `size_t` and `ssize_t`
> and map them to Rust `usize` and `isize`. Similarly, `ptrdiff_t` is
> mapped to `isize`.
>
> However this falls short for `__kernel_size_t`, `__kernel_ssize_t` and
> `__kernel_ptrdiff_t`. To ensure that they are mapped to usize/isize
> rather than 32/64 integers depending on platform, blocklist them in
> bindgen parameters and manually provide their definition.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
