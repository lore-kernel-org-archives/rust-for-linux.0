Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149578B70
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Feb 2024 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707401582; cv=none; b=YuvlfTq6yXeEAXLbd3w3LbZaEo49DsJrQu9nEDWJnUgGUHPA1vaqRYHE7LdAJbNOS90v98yjQ4rodo3oij0kYsJK/ApRpRzYNzqPB7ExK9Y6VRSi0SHsPTeK+bw+KcK4ArsE6cBf3nlLx5CAWeae+KnX6IUn1rr9LDlnqS1uSuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707401582; c=relaxed/simple;
	bh=8FiXcO4YBknM68MAy2XQmn2iOGYzS66hc6OBpR3Wb+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfSTAAZXNlNjuB5cChA3Jxmzz5Xc1lO+c/z0f8bQwclGxbA3ydtNn589sTc0XM/0ISp6O+nvY/LQ5z8APYAhjPUzYMqPd161adKmeIMP6Z3AdywH3K9U/eaCOArFI2qjEtkj5KY8yadTmN0hKjW3LXgrZDftEpbh0/U/lhGQeXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZUVlWNXx; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZUVlWNXx"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4c0232861afso670499e0c.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Feb 2024 06:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707401579; x=1708006379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63xtu4Y51K1k0XIMtdvcGVsuDCjTkj9dOeWaIMHJ3Ac=;
        b=ZUVlWNXxWZ5HpgLsTPJI+O7Kbg4aM/MN2132VyxLoKtUX8wv0hI70sAiPqV7epD3dZ
         TY/A3YrPth+HXVM7MVv2HZY2uwoRLvYZ2qDNz1QVX5jWbfzMflIrLWEb42lu9k7PCfhX
         Dpq9s9umsblL4rVnY2ARvjW9PXhnXWchoXwYDfaKSL8X4lr3U0hJqUmlvojOTKB+pUUT
         EuFqfL5+euPkqoP74AMrj2vTr69tzsYkIXD4sYLhIPmzi0EmPZ4dL914ickqDgF67Szy
         yh/SjLJsXRTGdchKb44TNCQ22R0YnXWORwDlnvQ92DntVQ3pqegkel0kjRQFNyGy01BB
         luNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707401579; x=1708006379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63xtu4Y51K1k0XIMtdvcGVsuDCjTkj9dOeWaIMHJ3Ac=;
        b=BiIOkHy0fSPBJ7QrQlZaDzPKm507sOOGqRLkYdtYoe2b32RiYRLOEzslxc3sna0BoZ
         TzdrCL/c6VEsm5Dnbkxi4QGFuwpODORPqFNDAI6/83nm06Fm1w0vJP4Ghs71yxgxPAFf
         nkybIcjvQzCpgv1d9qtlvQ4RiwXjKUXXdZasQhC04tti2t3yjixnVBDDZ+qrWv0ZZFap
         04FHz2mkmMYoqh5L6KdCgUJGDt4uXABgysjZRYfcewfOT95C4ZMMiAhcOxCYXQzdrX9v
         8j/lHsAZ7CqenePoRrFwh46aDpVzUQDFoJi7emroM67kRppd5E6vWqqE5Q1JyYYtOQUs
         BRww==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8d2p3+vBGdTED08g8ZqG3B47KPv65m5ZhzKjKgVbgfk+t0VUK7lLKALUnFXkyPfjKC46AKkSGNoQvPpTyMbWPfoULNh9SWyxaNdFezQ=
X-Gm-Message-State: AOJu0YyCVWK8J8neWnuiwng5EIWNDGxStMqRV8qTWn8Gd/Sno/chBE0y
	Evuq+G+YAPywPq/cg+tUiGtBkZLdRsH8bs7ScJp9hu8nSUvBx5KvtQu210i3yuIHj+XcFE+fZvw
	w6zLjEZvkx1ahdi+f5IoImUA7gs8cVP3H4dmN
X-Google-Smtp-Source: AGHT+IHRIxDWiY+hO499KIfcBiMXI8uEupmgp58zOyTpKkSFIk9pRhRbYoq93ffdSlLJEAko4To9vrwuCPD358UY1FA=
X-Received: by 2002:a05:6122:268d:b0:4bf:d147:63c1 with SMTP id
 eh13-20020a056122268d00b004bfd14763c1mr5938308vkb.6.1707401579571; Thu, 08
 Feb 2024 06:12:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124-alice-mm-v1-0-d1abcec83c44@google.com>
 <20240124-alice-mm-v1-3-d1abcec83c44@google.com> <CALNs47uPgvYXxEDmwb6GKa+cw597_rDD1zaSPDa9k9D-6_qZxQ@mail.gmail.com>
 <CGME20240208134629eucas1p2edf4cb1e50e3bb578297c33b79701574@eucas1p2.samsung.com>
 <CAH5fLgi_iU3nDE-gJ56s8CPznWvC0T4P5M0dVx1zO61kmVGNgQ@mail.gmail.com> <87v86zrr45.fsf@samsung.com>
In-Reply-To: <87v86zrr45.fsf@samsung.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Feb 2024 15:12:48 +0100
Message-ID: <CAH5fLgh2mqX7O=xWN6=wyd_4=_R63Ko-wh0bb=rXvLrrj=W-pw@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add abstraction for `struct page`
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Kees Cook <keescook@chromium.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 3:02=E2=80=AFPM Andreas Hindborg <a.hindborg@samsung=
.com> wrote:
>
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > On Thu, Feb 1, 2024 at 7:02=E2=80=AFAM Trevor Gross <tmgross@umich.edu>=
 wrote:
> >>
> >> On Wed, Jan 24, 2024 at 6:22=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> >> > +/// A pointer to a page that owns the page allocation.
> >> > +///
> >> > +/// # Invariants
> >> > +///
> >> > +/// The pointer points at a page, and has ownership over the page.
> >> > +pub struct Page {
> >> > +    page: NonNull<bindings::page>,
> >> > +}
> >>
> >> Shouldn't this be UnsafeCell / Opaque? Since `struct page` contains lo=
cks.
> >
> > That only matters when we use a reference. Here, it's behind a raw poin=
ter.
>
> Why is it behind a pointer rather than being transparent over
> `Opaque<bindings::page>` and using a `&Page` instead?

Because `&Page` would not have ownership of the page, but I need
ownership. We also can't use `ARef<Page>` because that has a `clone`
method.

One could introduce an Owned smart pointer and use `Owned<Page>`, but
I think that is out of scope for this patchset.

Alice
