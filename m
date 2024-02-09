Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D33612A
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707484216; cv=none; b=kWENWIP6KLXVxK2WoAZRwm5NUtUYccELibhh/pYD/YEIKAiEbjqWIiflHxdGj1VD4nPTStEoHmc2H67rYJWQAOXzAWFF9/X6V/arVqODrzZ+Jh2IMu+N89WjJa49BcmmTWt0CxO/ZOHNRST9s77vukP88es59vqFlw933bHcCq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707484216; c=relaxed/simple;
	bh=RxLgmJtRrWkGZg+HZMG1tfMX6Q9WWD8CMQ/AGzP0BpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+mXuwNVqs2p3iEHi5OiJAeLCZpDO1DbAOTWpWZDYhyYSTGBx5udFDEBhmpWZCQBKbr3pbMjMbR50QXtj/mmHXLzOeyFxcIxUaGzSvUvht7O1jH+UjupGphnD0V6/v+LQ4SYJnc0a1LHjT4aa7RQINP6OKg6WW1byy2S6APZUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TdYFzyx1; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TdYFzyx1"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42ab4f89bdbso4891771cf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 05:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707484213; x=1708089013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxLgmJtRrWkGZg+HZMG1tfMX6Q9WWD8CMQ/AGzP0BpU=;
        b=TdYFzyx1zEzzE+4Gi/DLu6IWeSD2n1OwiyhzX+aGP57zQPZu2fg1tlRmEK0oVwSKZU
         f8ITh2wGap67kmVbjqm8xTc/G+zhseyNiUH8BXGonV0Vg2HGLt+tuokMa5sodsVlhS/Y
         G/vZDt1NFSNM6eIuS1vgOFlh9s2DseN0Y8f3vrFraiUluFemf8vdb8tGW1nYU7S/VEdK
         vrPr0lSMwgQeaJ9Y9fnRIgUeVrNi7CJ9rXvTJhUuMWxD6Ko2RQgCsWZS/rbXnI7E1n9L
         pagwsHqGxFFf0XKdzSvWH7I284TVwtPSxhrPAiPdy2xRLCswAZEzJL4IuWPh/z8eV9He
         ysew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707484213; x=1708089013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxLgmJtRrWkGZg+HZMG1tfMX6Q9WWD8CMQ/AGzP0BpU=;
        b=omMoDSgBoqrDwm1AqerLY5yo/Ta3E2G+NGtXQiq9wZ249KDNqnsiXfrAs5WU+sJLba
         g3xW7qbnqnpYnutqvSCS28OQSIh5o9nsPGXSRejADZwGoOTMsxqKDGYd0VxboVCye97o
         scmHg1JGd9e3+/21VM7cZ5QcDUy93jQ/gEVOAY9JtR5GlZ1/4GZUxi+m6mNaRGkLf6pr
         /eN3pFK1kMIfK+pkIYiMhCB3QcKA9/Y6Ep70yl1sW9MR2fNaSVxNEph7jT62B1JZZnXd
         2DuvEZEkslWiU7W52HcV9oyqtM1/kgpkMY5/xT4qyUEMcnHUCakqcUDEzcHR/hLRbC4B
         5wPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf24XOZyT+xA1KtPcJ/ZrNxOnsbtpJKOxI4YyBrCc8a5zZsxVirtc8UQ+Z7XDNtQ3QdU+hJ2AEJ9oVhesyAvfkTDzG+OOaujkpv0795A8=
X-Gm-Message-State: AOJu0YyRRM2NVuRXML+oyySn5c8eAFoSmTc29Qr9HhyckPIwe+NlUonu
	0lcChsjr3KWuldY7svVW+fSbHMhRFoyRnM9ALfqlkeHFS5gxrNutj+nWmFCVPle/bcravVRC04R
	1iG3g4HLujfQX6bO1uMz7UT6OgMrTkwFtWK9a
X-Google-Smtp-Source: AGHT+IEyvqfyudXBQ2ZuDE+QHXEKaJ6wdDJ2v1ESP26Wuu+FSPcNAhIzZeCvrbqS9qCYxLosg8I33Ibesz6f1BnMJI8=
X-Received: by 2002:a0c:e247:0:b0:68c:cc45:7980 with SMTP id
 x7-20020a0ce247000000b0068ccc457980mr1485127qvl.26.1707484213563; Fri, 09 Feb
 2024 05:10:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205-b4-rbtree-v1-0-995e3eee38c0@google.com> <20240205-b4-rbtree-v1-1-995e3eee38c0@google.com>
In-Reply-To: <20240205-b4-rbtree-v1-1-995e3eee38c0@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Feb 2024 14:10:02 +0100
Message-ID: <CAH5fLgj1cat5m-_MACOjBi=eGqWcXCydThNtvOTFM38v9XmhVQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: add `container_of!` macro
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
> This macro is used to obtain a pointer to an entire struct
> when given a pointer to a field in that struct.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Matt Gilbride <mattgilbride@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>
