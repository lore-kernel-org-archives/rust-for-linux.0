Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625220317
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717437172; cv=none; b=H4vlyMxqroD1cECFRQJtCmP9xwT7EJkQCjksv7gbtAFHx9TTpjlRor3v2usEAv15k2w8bWhtLgMCkiGXlbEN0Q3970c6qJzz4eM/l9dr2vDh94pkg6gQc/vzo7W3zm/XAz+dkr530Y3WU6vY353S+QPmCyo3Ecv+u2j73SkANtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717437172; c=relaxed/simple;
	bh=m0FweyHdPSFpIkTfVZW//pFgcOZYHKV+wSHlMJh9TJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBX9uUrSFh1nwOQDlW7fRB8uPA0t6iHuSm2FSiEUmzoGGoJiovigR4P+NuwuHx9lpFdIbR+BsmKnAHAE8yG88yXcDwg8+8ixOEOJp9XUeIQdNeBQXY1jpLfd5nG/IL593/Pu/eLr50+ZtAGtwxeJRT1KOFGMyxL5DXheKDTTqEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HzZ5bNhx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HzZ5bNhx"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35e1fcd0c0fso220485f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jun 2024 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717437169; x=1718041969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPGBLbNhfIBiQu1H48kkSjUpEcH7DNN2Yir8GhdMltY=;
        b=HzZ5bNhxn5aGtQkw1VuBDyFvsombNwZoKhNq3jUBc9lsSZ9nbpefvKWd3uj528Cjae
         diNPSTowrSLSMz8xrHqxZZr+ljdmWil969mX2nEppJW61aDcDfZBFQGoKonQV87umNvc
         yxIrJTtn7IxRNbsN/Npu/XfunGnhB/nG1JRloGrjtBwOpLvdQVWXbs7pku8HpmSgo8Qt
         5Eht74+1RlWgRg9b4c9J2fRJbm9K98LYtYNfhw7kNJMxtW8uWL6JVCKCRf48aUerv3/Y
         nshXBD8yaT1iC6Y7RJ3tUvCq72enV6JXXIBYCqXlLdh7wAYW31aCEJWAvJIzK+LLOE+K
         Znjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717437169; x=1718041969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPGBLbNhfIBiQu1H48kkSjUpEcH7DNN2Yir8GhdMltY=;
        b=CZ4cxJExJjKtsGo3VjPsj8P5AnZWjvhgRxZG1rN2OrIjmZEStgBOUvkerdZcrwM9ac
         Dr3w/T0UEZl+d7RHOeJTREAK5X/TmRDaYpaHv/F01otvTmwdAQnpmGzsS3dHp/LseLXg
         UVO+9OecwTVwAHQlmiVAqeJ6whCZCEHuNKnVoPlfIndPkCstdS/WgkC8HTJDmpVl4RJZ
         tIlNtfH2gAoDnLVYeW/STcz37JuuJjS18sWK0xo1Cto/xo5BaDIJx2H+ODBWrq8CtUXw
         Twok0P26d1rkmIETgaHh71q1sW/Fr666KY6AN5aKV7LoC0VEq2LskdRrmR+/HTF3erSG
         yzBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdZWMp9PcCQbE2MmNV7ee/IqtMmIZB86lrnKAJ5ftDJNw3+cXHjT4ark6c51AAQhyMjYtMhI7OK0LQlrMsaViNdfi/yBZWbG6fb+zJH+o=
X-Gm-Message-State: AOJu0YypvmQ+Fe7fc+cKeQW1V0X15ccrX5OxHn2y/52dhMzxEFWJ00NN
	i+ZcNJglVxuqBtpAeXwQV8YDE86SwaHj8VyUtHhOD/5heoryO4eiXW4ZTF0qFtCbJEcnmvxo7ZK
	3n0q+BaiftusZ67eZai1ivA7eSUwvXYfK1eIy
X-Google-Smtp-Source: AGHT+IGT7vuNvV+/UZ3RyhLSvxAihEQitzlypLgGkLqd3nrZ7SFySLqLiMieU6ERiozMYwiGcYicOPgQMNPD0/zrwB0=
X-Received: by 2002:adf:ee46:0:b0:355:7ab:2a86 with SMTP id
 ffacd0b85a97d-35e0f285ab5mr6799341f8f.28.1717437168661; Mon, 03 Jun 2024
 10:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603-b4-rbtree-v4-0-308e43d6abfc@google.com>
 <20240603-b4-rbtree-v4-4-308e43d6abfc@google.com> <Zl4AVUqq8Hd-a230@boqun-archlinux>
In-Reply-To: <Zl4AVUqq8Hd-a230@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Jun 2024 19:52:36 +0200
Message-ID: <CAH5fLggfMNcuu0KD13_K49NBXXWD133BB6uc5ph7xQi0WTxBZg@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] rust: rbtree: add mutable iterator
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Matt Gilbride <mattgilbride@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>, Rob Landley <rob@landley.net>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 7:42=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> On Mon, Jun 03, 2024 at 04:05:19PM +0000, Matt Gilbride wrote:
> [...]
> > +/// A mutable iterator over the nodes of a [`RBTree`].
> > +///
> > +/// Instances are created by calling [`RBTree::iter_mut`].
> > +pub struct IterMut<'a, K, V> {
> > +    _tree: PhantomData<&'a mut RBTree<K, V>>,
> > +    iter_raw: IterRaw<K, V>,
> > +}
> > +
> > +// SAFETY: The [`RBTreeIterator`] gives out mutable references to K an=
d V, so it has the same
>
> s/RBTreeIterator/IterMut ?
>
> Also `IterMut` doesn't give out mutable references to K, which makes
> me think...
>
> > +// thread safety requirements as mutable references.
> > +unsafe impl<'a, K: Send, V: Send> Send for IterMut<'a, K, V> {}
> > +
>
> we can lose the constrains to `K: Sync`, right?

Either Send or Sync would be valid here, but almost all types that are
Sync are also Send, but the opposite is not the case. So I wouldn't
consider that to be loosening the constrain.

Alice
