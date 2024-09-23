Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04381946D0
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083224; cv=none; b=ASuL+SYmUDAGsPntiZCT5qTDW9Owdl274H1JEr3YueHI0xWLqAzYnMAPjvicIw5V4lQhdhqOdR6pQiE216OpMG+UDsxZmseUz0CaYX6yOOz1wyXq2yJZ7QiggQyP8RnKZH7Fch+2xZRrYmTdIJ36kebHy3c1UuMNXI9rfRWzkKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083224; c=relaxed/simple;
	bh=LUJqCBYoA7r6i35cAvMvjpYb006fDJvu//QTM+gRFsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rluFkb7U6DaW9PjmHhzJukuyHNMpUP+jT3LSXaJ9pG11N3UjTiK9muQaQzGr/yYfKU/MkNdCkf0HtziNbnD6E/IlVKSe2ApXGWTAfTkIB+aABi+cE65Izgnl7bOiGjF6bgQgGAZB7cKzhHuonEX3XTUVNWnTSib5dUv0T1UvfDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r7OSHg5/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r7OSHg5/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374d29ad8a7so2731660f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727083221; x=1727688021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5v31aSV/t4R50GVbVslRfoyEWN82f1OJViIijZKvS4=;
        b=r7OSHg5/C/oy6x8lHlgrc7QrD2CjdEmOhOY+0oewQeehV/eQYz6T73eOHAIA1K66L4
         hBEAmUXZ7OEo8MUJcy/uMmOl6THZiGLBSTWIpDLqi8n9TlJ/mEJ2+qIwpHEuJzKCALCk
         Yxtq2BEbI5xmzTCRaeuhObikLJtRusJ8kjPYZlr51Yp+U/us/FtgXKVUoJqXhUnVDZUk
         VvGaMTIbgtr6w9sjWpOdflvcPVSEqpU8VlhbeotrvgAwD8oRZIUpvyxb/AsRbVzD9d9f
         i4hICIHgQ0KanuUwyzJ/PKoX92KyXmJjxAfzSuRU8Lod/sROrvhdWFVDiEPZgdCdFsDZ
         xqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083221; x=1727688021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5v31aSV/t4R50GVbVslRfoyEWN82f1OJViIijZKvS4=;
        b=CNyC1NcJpyS307fThRthBC3POThoFTimy9nl6er339Y78YOxyuvgzA4QtqSfVHZkSi
         DGWte/vciW8o9jzJqj8sRwbY3Kg+M8dDUcs3PCJv23aB88FTPw4VPLssIwClV4lKX3L5
         tadF5CKA1HiiFMpAf4DmpdVhSMjx92f+CEK7E4qJ82WOnnzHEbSdsgBj9UyHGh45xp6O
         iUXS10Scv1DyAJQYJu/RW3outCqz7K30jBQIrjDmu8H3nO/y2QkBY0G/kEiVO2GXor+F
         AznuhQk26Qk5020QieQcPmo1rWZ62zkKmo6apUmMuJQ7nXMWWRDNvMJIPZQZfYgMeXjq
         sQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhrhOtM3cxaJcM6iQW0dNwttkpnqUp4fJnbA39lqtc578pjTXaDJQ9J5J3qbcdf77haGU/krYWK0MJ+w2J2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVZvCxz4hqwtOoMFyjPESiNArXXtqMDJi5lfH3C4V4e19SV1W7
	SkTjYRk3GjSHypuP+66PxMna5k49cXoMW/WlWG5N/zf46Xrs8BkPqtOEM0iorWHSz1BtinmrZFi
	Ik7l8L4Gckkk6BgjhKR2JdDfl8GYkyCCidXme
X-Google-Smtp-Source: AGHT+IGchuHW9JDX+p0I4FINfy4vGsmRp0oMKE6SuKZxKhlImyu7vfUQ09lWmPWLgKJNZnJaUmXsVgSh/rP2sguvHGE=
X-Received: by 2002:a5d:64e1:0:b0:374:c847:83a with SMTP id
 ffacd0b85a97d-37a422521cdmr8004007f8f.8.1727083220872; Mon, 23 Sep 2024
 02:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <20240913213041.395655-5-gary@garyguo.net>
In-Reply-To: <20240913213041.395655-5-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 11:20:09 +0200
Message-ID: <CAH5fLghjBv3zypCSEgsttFFzdgjcztPWC_7wb6V_7C6EMBhHmA@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: map `long` to `isize` and `char` to `u8`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@redhat.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Finn Behrens <me@kloenk.dev>, 
	Valentin Obst <kernel@valentinobst.de>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:33=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The following FFI types are replaced compared to `core::ffi`:
>
> 1. `char` type is now always mapped to `u8`, since kernel uses
>    `-funsigned-char` on the C code. `core::ffi` maps it to platform
>    default ABI, which can be either signed or unsigned.
>
> 2. `long` is now always mapped to `isize`. It's very common in the
>    kernel to use `long` to represent a pointer-sized integer, and in
>    fact `intptr_t` is a typedef of `long` in the kernel. Enforce this
>    mapping rather than mapping to `i32/i64` depending on platform can
>    save us a lot of unnecessary casts.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
