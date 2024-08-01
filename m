Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51550481DD
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502850; cv=none; b=Xunw2/ra/zPmg3Me9ctGR0gzZLMg0E4e0Ag5H3luKtQ44hQSAAEU73MkyfROZHlMWiDJ5irmegz/vM6hbnsKgR+jIfwu1XUgW6Y8u7cdCeG7yjgSHSiKrHzbQxRwSDbHbtvj4R83uW0n9soEx1IzwFdjXUjJmw/oMfvjP5Qb420=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502850; c=relaxed/simple;
	bh=3hQuQcN2gMGVSPwErmioh4yq+cgkg4q17a8dhn5NTF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtzFdhReKogGYapwUHU2IvXP5vLyAb5JDZd8phbzeI3Phq3miXC40MYmZfH86pzY9twEha1McOzczG+FXyM2FV7A/YforY/XTnFjXcnk/ZHWlU3sywYFv32halwT7W1rg/SNF2FTBOOrmMAIsR37RLkuGWI9/mdRcWNd6WreitE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UBM5uNOp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UBM5uNOp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428178fc07eso40933705e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502844; x=1723107644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hQuQcN2gMGVSPwErmioh4yq+cgkg4q17a8dhn5NTF4=;
        b=UBM5uNOpucnDWH/OsdOTwfc44yuOSOtAs0lSVdRJyYcNyWrqCD4qKlTcjnaE9PwWp5
         DFkdLYXZO2qCtHQnOAVbzEkEeRgUo/lPTVfsMuTZGBUJ8CGO5PI7wtdwuVWZ1/eDEFnp
         s1IlcDGgwuWKEXEVfeNXuuK77rMQSb88y+hx2bgVGbtOgzmQsDYFMUbM4iRwwsMTB85j
         3xfvKDUTJa6vkcqBgjfqI/UIB0t+lHdJkR10IRfWPaJt4H/k8EkG3PFkQ1SNgZIaa85H
         M/1vS5XPi5cboLeuQxxzfkrAEiuBJcqxcm8jBmyLF81Y3WH9VeVLPoPgew4nq76QjgAp
         l/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502844; x=1723107644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hQuQcN2gMGVSPwErmioh4yq+cgkg4q17a8dhn5NTF4=;
        b=L4ULIycd3WXsO9yi8Mdsssy5vAo88fVZLVc+hFxQsIgGtATO1Uhv4qJcnKruNieQb4
         ZxBHtqIBC5eDiwahbgyUn4XIOHt/kdboM2bJ6SRgyZ8LdUbTSBdGb1tKlJR/9+DK5TPE
         sdnba3SzB21ou/VJLbfdWzVjX4G8ouV8O6TIQ41wUTzBQRd6g/WXi9EBgm98ncC9iazq
         WsSVOszJTznxkWVQ8TcE9uYz5NnHMsMd3GKn27Ed3qHqqOQs3uvt0Qn7DzAL/IbAFXYU
         qa2ZeSPH1yuIhZdidF9BCZ538lEYSX2nsePR1gSqCZGZfPJXaNrAIxahftPcgvtYwXcN
         zssQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRw+SmeXfVFQFIIXyuFp3EbENWWV6QU/FINdkzLIclNeD5UeBk9SDWMzZ36UK282TBLBaAc9s2IS3n/nOZYkfiKQGlAD/ytlg8N0Z5m70=
X-Gm-Message-State: AOJu0YzM8BL/JX3FEnjILa8O+jQo2AwGHx1Z6kkHtwk94hkUJRdhhJlT
	tVdGQFINpDZZ5w3+0Aaz6iSWCIl9+02ixrH2VX8gvAVOAD/ZRu5dYpsd8X6AzSM7N4+Wpga8f7O
	0MPX/+E30fnUcyRZJKBAc9sfej8eJiSRo27r8
X-Google-Smtp-Source: AGHT+IEvv8uqz4euwoAFnEvyIjvzVDgT6Fm779QfgNrBvXN7M0uQrA391FvKVou1+/JSodt2L0kMaV9QJAyp4aV8NL4=
X-Received: by 2002:a05:600c:46cf:b0:426:5dca:50a with SMTP id
 5b1f17b1804b1-428afb4c28bmr15393065e9.21.1722502844316; Thu, 01 Aug 2024
 02:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727-b4-rbtree-v8-0-951600ada434@google.com> <20240727-b4-rbtree-v8-1-951600ada434@google.com>
In-Reply-To: <20240727-b4-rbtree-v8-1-951600ada434@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:00:32 +0200
Message-ID: <CAH5fLghFv8uYGbfjcjtxCET54xG06=Ck15fmoZQJF1L9S=sStQ@mail.gmail.com>
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

On Sat, Jul 27, 2024 at 10:30=E2=80=AFPM Matt Gilbride <mattgilbride@google=
.com> wrote:
>
> From: Benno Lossin <benno.lossin@proton.me>
>
> Sometimes (see [1]) it is necessary to drop the value inside of a
> `Box<T>`, but retain the allocation. For example to reuse the allocation
> in the future.
> Introduce a new function `drop_contents` that turns a `Box<T>` into
> `Box<MaybeUninit<T>>` by dropping the value.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/rust-for-linux/20240418-b4-rbtree-v3-5-323e=
134390ce@google.com/ [1]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
