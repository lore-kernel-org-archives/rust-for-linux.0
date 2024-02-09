Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362F2381B9
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707483979; cv=none; b=qQ2JtKHqhvCc7JxOQGf2G5NzQPfQPs5ypdG1FvUJZzr+5mS+NZG/ndp0+EhavqajlRDMUbEMzoe27bqfQgD6ADVZQicxClxGwNuKSYAg8e3gRQUQ4Vd0O/WBidmZR97Cdhg4vef7lQ2hj7ZiSCzaeOy8vGl9ZmXIdkA/Y9JQxc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707483979; c=relaxed/simple;
	bh=AEDphcx1FQNsF9qiJV4SSq7U2Kx5za3ZeN44KAWA2FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oipHgVfRkmjXFaXXILmLhLnCQdKRaPHxhGM5/1lZJNEmbuwVNaOZ+E/WZS2qdFaqLgIiH9sXzBv6v1Q5ZX9+Z+VfVqmPhcGf2zCY/EY+wpMmKaAwxUF5Pa0/AfTnzjBCP6cx6bD65Xzu2e9T2/d4DxbN4UDM5SiwWWW2JDy3BL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WwTeX2LR; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WwTeX2LR"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3be9e11ee59so377202b6e.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 05:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707483977; x=1708088777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXQlm8wYk42FKH3UwHT+zuLEtFefXsoBAX29Ffp/+rM=;
        b=WwTeX2LRlGkAll4d92KQdo6om0ZG1QnnW35qmWGLT5l8SkaRCjReuEmQD0Yir0csNh
         9O2u1XWyGCQbLwHKSIVJjkfVLvz+TCJiq48t2E/yuL8EPifFItx7qTGiiOiLb3WCOACe
         m/cpk236SOUUY962yS6bx+jRf/hXjNEBqPxFTfjU9sdG4Av2i/E60wXDnpsz9KzkRgkr
         eRoKKmUDoyTpMAG1gKNIzB24rtoiQzM3H0RX0X9RZGPVS6UzY/a5JOMkLsIe5S0Quf/R
         uLYtAwiftINrihMpICQ0Mcu+LrDHq9ZXedsaW08oFMuJ7lkBc+UGuvfvtewBHxty0jX5
         OqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707483977; x=1708088777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXQlm8wYk42FKH3UwHT+zuLEtFefXsoBAX29Ffp/+rM=;
        b=cczLQxCEqbls8FFaud60Hpk1u5JYjLh6EQKtEBE4tR/Sv8SSl42bVOd8dfzHAGEAZx
         MFOOLWNPB61I4a4225vQuHAmVXfEij3M10GPExNwZL56gx+Q+nKHCiqYjhQNbIphVFTf
         3Rt1hk/itVdDpS+jr+isLaSIzi9gB+31LV3Y1RPUBNlKdVU9RABMvM5gSC/tEtdN2j2m
         uQjpu3FKn1wU6nmpBYQGr0BDyRWpnFSjkrfF07j8bq677JmG7EkeAeBJMTHrEaHbeSh8
         ZlV8acyyYS4RhtVuNSND5LL6rkkc6Qy/qeukgif4g15w1FBNP4/CfzAhCWnseXK3r9o2
         IJ/Q==
X-Gm-Message-State: AOJu0YxedMySfzCJRjZT6+7Y8u3x2i6yinB0pMXGhGSpqV7zdK1bqrWb
	tBFlHLDK5D0FeLTeqQd53QbCbqS7vEfiflqrck4ZxGBoXuY5wkSYeWsFxEDAERTr71LpNs4zlam
	IlvCNPYRyLbY1sCZF1P2RVqkopcG0wBePM9jn
X-Google-Smtp-Source: AGHT+IHBGxtcRS1vlCmy/DgZiXUssK0zz/bFjoE872mOIvHoPK85pPVC+hWEMgfrO4ToUrj9QAK2sQhOuAm86hlvwP4=
X-Received: by 2002:a05:6808:1b06:b0:3bf:c8cd:460d with SMTP id
 bx6-20020a0568081b0600b003bfc8cd460dmr1728600oib.1.1707483977082; Fri, 09 Feb
 2024 05:06:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205-b4-rbtree-v1-0-995e3eee38c0@google.com> <20240205-b4-rbtree-v1-3-995e3eee38c0@google.com>
In-Reply-To: <20240205-b4-rbtree-v1-3-995e3eee38c0@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Feb 2024 14:06:05 +0100
Message-ID: <CAH5fLgj8eZRbiuG7MgRaDbZHkUVUfSXuUdEqUB4foysds2vk1Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] rust: rbtree: add `RBTreeIterator`
To: mattgilbride@google.com
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

On Mon, Feb 5, 2024 at 4:50=E2=80=AFPM <mattgilbride@google.com> wrote:
>
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>
> - Add Iterator implementation (`RBTreeIterator`) for `RBTree`, allowing
>   iteration over (key, value) pairs in key order.
> - Add individual `keys()` and `values()` functions to iterate over keys
>   or values alone.
> - Update doctests to use iteration instead of explicitly getting items.
>
> Iteration is needed by the binder driver to enumerate all values in a
> tree for oneway spam detection [1].
>
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-17-0=
8ba9197f637@google.com/ [1]
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Matt Gilbride <mattgilbride@google.com>

I have looked at these bindings many times over the past year. They
look good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

These abstractions have been very heavily exercised by the Rust Binder
driver.

Tested-by: Alice Ryhl <aliceryhl@google.com>
