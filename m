Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51660381A0
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707484020; cv=none; b=tUe4W9wR6mwJTKDbxpJrMS/uEFHZUX69qDVB39VZc5gRcfS3UNQNvg3wqjNFgzRD/Ri3MtKFaDy+A/gPYYxdYJ1I/vq6iW3wv+bqf6KqGWqaXcgSv9drGZNGOEYtdCn6EAVoHqkLT+zGRYZ8OXe/93h/8v+BVafLcqnX1zFnm94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707484020; c=relaxed/simple;
	bh=Osx1MwrfwvLxJy9upXGkHqimngBod33AzJBkO19MTUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvinHyvFR03nQHiccKg3MdSXDuSUe0X+slOkjl5+dx6whZ37VvMQbA9neBJi6SI6YnJ3lAWnxTJh9b3hJQ5f2WY4x6suhGe2ZTxiAJnN1hf4pw3+HNyoO7Xb9Dnj66mfBA6T8geK5cEOauTfaWkVtJEAwHZUKHgsV4JlEwIiIc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pH8/63oQ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pH8/63oQ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-783f49812aeso35224285a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 05:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707484018; x=1708088818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Cdz5dVZvDPVC+BewWJMsgYajolCToKYQ11a6wmFWQw=;
        b=pH8/63oQAOuf0bQOVF4TiePSzwkCQxlIoZ6SJKbtkOMV6VDt4x13pbcmoMTo1qugir
         hiXUn36rs5RlD+LPAMfshLqKXA4MC4wuAgQdM334eAakdnY0wdiCIo80c8UAQqQeAg+q
         keApu+PvPYHRVoJzrxrSiPpqqsd4OqGWSEzKnfgDe5YNZ8Pj8E9bzApwFYD68xEhn6es
         JqmmfULTyMIRrdFIrU5Gde6yiyuXamhx71wkhIcH57dg5xHOFM/r/yGk48aO1qwuzuOM
         oPixXwWjYadQDfOhc1NQooVRbRjrN1KN5853jadffNbjUXBn6Yzw+9EdKp6BeG2x0t8X
         mV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707484018; x=1708088818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Cdz5dVZvDPVC+BewWJMsgYajolCToKYQ11a6wmFWQw=;
        b=vwjypRcrqyt2Ug6Th30g7DnWzWUUcoGTOY8I48y0+p/XThgHN0RIp3XzzHzmAnn0av
         JF0pGv55khSf8D5iO13MRGOsaSyIW3qzSePLpG54o3EVfTLDYWVgMMCd98YEhS8DDGw3
         a0J0/nzZ3RNLHD/2Ds6iak3mh+Re9/XxI9/mG4EjCu6IcYNAhi0y0HOG9mlQMfcOTUYR
         iYubyCtqyjToZsyu3TiulKi2XfTOTLhWy7Xz7oqTp++bs7p2vbujHHbSE/mshVsNNzrH
         woLzE1tQeB3mQcy4E7ThfT0JfN77FAYpGUJi+PABfcBHrYDKzh723Vikz+6ygnXaf9Re
         Zl5A==
X-Gm-Message-State: AOJu0Yz72uJCxNoxyelf8+6jOzrrRJJ0g0SKi7RvU6P9/tgqCd59PuHd
	lcYW6bWIZxL1QVMPZeJTgTqhm3JDIHsP1wTUznqDDhDUKL1mPq+0VCxtz261nEOyksZL/rIh8pM
	asHs5rAYtFNvAw0dvkGwuMwLGJ08DhCjLRM+i
X-Google-Smtp-Source: AGHT+IEQu9dTK0CI14m6+DU5OUbcWbY4tpyQL+7mbuO6ImeovHURd2mrTNbrTKdI9lXOvlKtapUMxXVQ21CWT1is9z0=
X-Received: by 2002:a0c:cc06:0:b0:68c:ab0e:718f with SMTP id
 r6-20020a0ccc06000000b0068cab0e718fmr1475668qvk.48.1707484018052; Fri, 09 Feb
 2024 05:06:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205-b4-rbtree-v1-0-995e3eee38c0@google.com> <20240205-b4-rbtree-v1-5-995e3eee38c0@google.com>
In-Reply-To: <20240205-b4-rbtree-v1-5-995e3eee38c0@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Feb 2024 14:06:47 +0100
Message-ID: <CAH5fLgiRTYmVaGRVU97C+ZHqBxRxp7kmkdRyHT97w4HtWgiZ=g@mail.gmail.com>
Subject: Re: [PATCH 5/6] rust: rbtree: add `RBTreeCursor`
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
> Add a cursor interface to `RBTree`, supporting the following use cases:
> - Inspect the current node pointed to by the cursor, inspect/move to
>   it's neighbors in sort order (bidirectionally).
> - Mutate the tree itself by removing the current node pointed to by the
>   cursor, or one of its neighbors.
>
> Add functions to obtain a cursor to the tree by key:
> - The node with the smallest key
> - The node with the largest key
> - The node matching the given key, or the one with the next larger key
>
> The cursor abstraction is needed by the binder driver to efficiently
> search for nodes and (conditionally) modify them, as well as their
> neighbors [1].
>
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-6-08=
ba9197f637@google.com/ [1]
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Matt Gilbride <mattgilbride@google.com>

I have looked at these bindings many times over the past year. They
look good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

These abstractions have been very heavily exercised by the Rust Binder
driver.

Tested-by: Alice Ryhl <aliceryhl@google.com>
