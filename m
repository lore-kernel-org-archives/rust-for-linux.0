Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C41F1BD9DB
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731083677; cv=none; b=NEiKuJWAjQ29NV8pgS+p1JwBgaDitQT6KUv3GKhvwsMhJ838GeMBfgwi6q+PxMVuJaMLCNUhA18caAkePEVMm7NjFBjGRty7E/stlL0oGo9KdyQ363YKuPUvisreMJlqghn/50W+nQccQluX7s/9j2itHwzWtIP6CwBuwhtZrUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731083677; c=relaxed/simple;
	bh=D5u/vD3uvMhMZ6EYhYrD4l4MK7NAu3VAYb+fGjwWlyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J50OivL86sqlAIFSVNJWvl39Iz4P2NibHRVR/1cgDsOcj3H3Vu7oCxlN5iwCWONIM70Dakv3SZdQMXkEaTm1sDGDz7B4td2czJInMTPY0GqeohfKrgGil8DsvZFyOHL3JwZPA+bZs6DFW8DkAUzqE7DNcsn5R4ZbhLWGK/6Wkzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gLtJjh3p; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLtJjh3p"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d49a7207cso1645554f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 08:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731083674; x=1731688474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPuIqjeBprrU0J+GkxS4l/VU+CCSAhgqrohKY6laxzw=;
        b=gLtJjh3pGj/BzhdXjEN6OMGIweqoYdnL1ieCexVsTCr4Ai9nJJABUm3kZHGIM88Ei7
         LxsLfMX42Za/26WOjSGKwP3nqqqNIa50eEtjWA4hQYXKG4Cvm+MlwS3LDl7igF0KfNSK
         uffByRnworZaxZSMkR1BpAsC5Xn7F3dDWZA9byll1/G9AwZxpXOtxDNMA6AOuvzGWGsv
         tfrnbAI2JOrv+qxjsebdujCwQD0J0aWLxAtAYk9bfHTYH9Nmzx6rGi1ZG/oSTOytg6dV
         bEY4nDZcuGswDmFeeM8ZSHWIGKpkhVwmwgfDXu/7JfLIeQNTGR/n/60QIt9+HJGhbdtQ
         9/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731083674; x=1731688474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPuIqjeBprrU0J+GkxS4l/VU+CCSAhgqrohKY6laxzw=;
        b=OyEf41Cm9dWWO/d4oGCsntKo029JKZg0xXllN5bx6KvouAL6dhnHzVvurGLCek2lHo
         Z/4h9J4NllYpE1ex8bg1ftZg41+xn/uX04KpJEVijt/g8XyiLeaeVWALLd86H6w51xM5
         0UGp//DlmRwyxGP32NjJ94sUVe3WUqCeoac59tkYChpkuzk7t6g+Oeu5siCt+uuTdgmr
         Is3y/zL7H/AVe/djmK2NmyazZ7G0GN0W98mDbMhpE5safvbd/SE2C+fv0KMDdsg0tn6o
         CNMqTAKuIcvgqG/KOuVOwxgvN8kVNtwjRICGPX8k5HBDwkP1x6tsudHzG4ZF/5p7ghH4
         h+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT2GCTPZuV4jla36KRWXXMarcE9yFTAVux4/UQopLWV7lgrGnpUqyOW348hf/a2ijiRdFluGr0cyI8cUFy3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuv/COeZVcwVWptmltI/LmqQQaEarQH9UGGJwQ7qOvY3bYAS6m
	MNs1ACQx+jbjQY0h3LSpMhvNbJ8lfet0pPyxyD1ZdU4As/bDGOpX2Q9R2N4nXOBdFgP6/k6Fb/D
	2tn9xqkkkpPZd1LxlUIT7IU+C0xZNTgdbGhfV
X-Google-Smtp-Source: AGHT+IFUw2c+p2PWfAQ3x3JAvswZaqCaTsV0sdWA+jFKXnNx4xBqHlvUc+YWOjjaAj/Z5nIXZOYpKhe6nFgeml5S7z8=
X-Received: by 2002:a05:6000:78a:b0:37d:4a68:61a3 with SMTP id
 ffacd0b85a97d-381f1885e7emr2579449f8f.49.1731083673857; Fri, 08 Nov 2024
 08:34:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-borrow-mut-v3-0-b7144945714e@gmail.com> <20241108-borrow-mut-v3-2-b7144945714e@gmail.com>
In-Reply-To: <20241108-borrow-mut-v3-2-b7144945714e@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Nov 2024 17:34:22 +0100
Message-ID: <CAH5fLghF-B3eGnN3yQ_eZRWWMQa-CLDZea6hgFM3uS=n-GNyzg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] rust: types: avoid `as` casts
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 4:46=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Replace `as` casts with `cast{,_mut}` calls which are a bit safer.
>
> In one instance, remove an unnecessary `as` cast without replacement.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

One question below, but either way:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> @@ -333,13 +334,13 @@ impl<T: 'static> ForeignOwnable for Arc<T> {
>      type Borrowed<'a> =3D ArcBorrow<'a, T>;
>
>      fn into_foreign(self) -> *const core::ffi::c_void {
> -        ManuallyDrop::new(self).ptr.as_ptr() as _
> +        ManuallyDrop::new(self).ptr.as_ptr().cast_const().cast()

What's up with this cast_const?

Alice
