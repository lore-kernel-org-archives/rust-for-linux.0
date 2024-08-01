Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC2C161936
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502990; cv=none; b=knnsepFqR1qKlJm2R2KQqUEIDmVs4etUi20swpZRuWwTozguGCU98+dhq2KtNJcLSh+XWBTlVK2ThajqTezd3rgWeIovcxj/3DwivYWkfe6S5rf5+jovJOUNvF+z/NkH5XzxhuDuLv/Nld6A23ILPioeJrwDH295LmEuW3eKatA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502990; c=relaxed/simple;
	bh=3xs7xgvJ/ONhnh43H4LdGjo7+Y24b3EIyiZ2SWjz1Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCIMWBZnfBhAQIHkwQ0vNnFRY1FwYjVla67JpryKwhNmonEoa5JOKr1FFHr01txRNdCDnMHsvptHP9cflPjOYAOItQrDpp9otNJ+wN3CbbqAaWc37m7w8nYV+uaF+wkf7wtBX42b2Liw5HElM1f6gxgD82gj4O0gF1bstQDPuPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Igzvm9hv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Igzvm9hv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428243f928fso31777505e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502987; x=1723107787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xs7xgvJ/ONhnh43H4LdGjo7+Y24b3EIyiZ2SWjz1Qw=;
        b=Igzvm9hvtlipIDMxSI3A7raeETCRxGuC3odauXw7qz2/WJZZymvQAc6qB0EMWQU5cE
         tIf3ZKBupjTPsm7R4L2Z5MJLjThKYdc1mfMwg4Gj9IVH3S1WQ/4Lg76B7j8Ma0KaPNXj
         b8yOF+XqjxwILGqYIsvMiCWD4fFJiUN6ZuwbibA/WZA26ZFqd4e2TlCzwVEd0AfJikjz
         RYkPr61b0qbgUKy0XjZfO8HeMdoLgE5ePzSnS5mbtyUB75qOawzsJ3S9655QkKv+i9hR
         36bUEjSDIhZz8Rg9bZZp9J5Y2y+ABYYCsiL5sW7NkmCL2/NCESto2G4lqDAqYpAWZQcn
         jXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502987; x=1723107787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xs7xgvJ/ONhnh43H4LdGjo7+Y24b3EIyiZ2SWjz1Qw=;
        b=OLx3h7laOiSzCGMWKNQIJrx/5BS7OKrE6BJt7WVDynFyxkUKUJdmIgpsVKo7r/vbID
         B8d6976dMOvrYFRxx8zjLxqiqa3APDCkQjebVQbswe5NPMNwBpeVxOJuoqIzaUB5G55/
         hmcgMSCEoSoe+z1VrCG8f9BTJsS2//A0x/vZAhdDzaRFf+BkDYXeQOaDsqCIzNyrOzan
         0qvmlf2j+Ehkp2tFM39B2VvbbxImJTpuSan4zfXr3G2O386YWQU/fr3gDQY/xGCqZC0o
         UTUhzAULDENfzlLXsaoHOWbdU/erfNPd5eGvNZembE7FSyKf9uQowomlHvyXIjb0qFfC
         ytDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWphBby5CKEDfozZa40ZCAhawGczeHsjBwsJOELv47pZ1AlJwHdsPMDEJX2ICiuks0MXDCLnHaJ5/rnGfhyr05lL20Y90008wtuyG4CcoU=
X-Gm-Message-State: AOJu0YxgnIF23JVQVV3q6ioKqyoiX2xoP3KbY+QMafjVD45lrEGv4yk2
	CPpPmpz/LnmDKKq82tH7OJYRGKi21hE/wHufUsPTXA0PiYugbwTpG8wap8yXtAqekY9zgPSv0Zp
	BvmW4NwH/mkxbv1Q2/w64BhcwdwLxG2dBT5jk
X-Google-Smtp-Source: AGHT+IFMKbPhev1pQbCoGwkpCVbTUvuV6UuRjh5+1mv4Dcxtyi2gl8tnKx9GqoaBnp3ls7IZoo/JGaUoUdQLNK+xSGQ=
X-Received: by 2002:adf:f107:0:b0:368:7e54:baaa with SMTP id
 ffacd0b85a97d-36baacbd019mr1494681f8f.4.1722502986680; Thu, 01 Aug 2024
 02:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727-b4-rbtree-v8-0-951600ada434@google.com>
 <20240727-b4-rbtree-v8-1-951600ada434@google.com> <CAH5fLghFv8uYGbfjcjtxCET54xG06=Ck15fmoZQJF1L9S=sStQ@mail.gmail.com>
In-Reply-To: <CAH5fLghFv8uYGbfjcjtxCET54xG06=Ck15fmoZQJF1L9S=sStQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:02:52 +0200
Message-ID: <CAH5fLgj=Kyk6qFGOxOXsA9bM7dMYhFO+NZefW+UyiKUkL1hyiA@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] rust: kernel: add `drop_contents` to `BoxExt`
To: Matt Gilbride <mattgilbride@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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

On Thu, Aug 1, 2024 at 11:00=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Sat, Jul 27, 2024 at 10:30=E2=80=AFPM Matt Gilbride <mattgilbride@goog=
le.com> wrote:
> >
> > From: Benno Lossin <benno.lossin@proton.me>
> >
> > Sometimes (see [1]) it is necessary to drop the value inside of a
> > `Box<T>`, but retain the allocation. For example to reuse the allocatio=
n
> > in the future.
> > Introduce a new function `drop_contents` that turns a `Box<T>` into
> > `Box<MaybeUninit<T>>` by dropping the value.
> >
> > Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> > Link: https://lore.kernel.org/rust-for-linux/20240418-b4-rbtree-v3-5-32=
3e134390ce@google.com/ [1]
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

(We may prefer to pick this from Benno's series:
https://lore.kernel.org/rust-for-linux/20240708205325.1275473-1-benno.lossi=
n@proton.me/
)
