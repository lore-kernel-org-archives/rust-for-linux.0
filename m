Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0B14317D
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918122; cv=pass; b=VdupTOwI/RI20V4W5iGgf0h/kJjxEbKN3SylJWhZGv8WU4sSZ99xLLxG16IYnXG18nj6KA9F7xHWMWPBqh0/mMhPB2n4Et4nkuexRiYmRvcq0Rk6wT/nPxBZXt7ewGaXc3TPXvlkvXfzU1rtI02OE0c7NvGrXgxwFWjuLUxDMZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918122; c=relaxed/simple;
	bh=QnGPTFkTS7VNVSNdb5eza81EvbBRnt2CL8duBXdXesU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjFn1qAtoMEI2Gy0hx25Uwi4gvvaPXJLfO/u9qdG3cfijHi+MsGUaMrhBAsh8q/K1MNnRaJPYzB5aF+Tyg6xOQLFIXrG2CwQcPEvQ2URSkMCNSiEHAakKMqlPjrKAGhRHd7qwRukiBV6qqNksM5clbRa/mk7ATPpvGqnStbSi7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IoWYW4XU; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IoWYW4XU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483a233819aso49892685e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 23:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771918119; cv=none;
        d=google.com; s=arc-20240605;
        b=UeyDgdDqloOj9wNuwyowUEafDtbOUWCsXMKWK9y3qqHBQkFGckTMFKVufOw6mxw1hR
         Kr6Upv5hA4eL+DgrmOdChxp+BGqrC86d8yIwPnCnfHRtNcEOYyt/3gS6ZICP1fT+b07J
         jAxXCHlCv5YT+Sg6Aam7RJqBNuhzVFXFDOZiuB7HN5yHlTfdtIAlmOes+dtuMAuUykjG
         4QAfQLyoDyryTn+6KU9iIAT72ISysgMCk3FwiOesEZwmqO/StErALdM6nBBDFV9EEjzV
         yUS4z3W9b4nvFK/4L6KRRLl8/ZM411oINRw255xPpj+NrVcwOZh610ikn0+U1u9yGA2+
         dO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
        fh=nBZBz9UThzMp+Wq+iw3GiPs5PxxwUVBx11taSEPi2QI=;
        b=UEBC5l8zt/5xVvPTiZUTEJunDRYDCtgozB/LWsI/voonvPeYxdyrDauvgwoZpk1Wi6
         Ok0jtIHGi+aKsWHjAv/E0FsQLcwthPAGHxgBQdjRTbpjDmBvllctWl7g0QjaPq+dob4R
         ye54Y5+7gs8CcZriYD7nWp3CYEqgKqDFUiNHySKrGkbiCTpQnmFrAC5tqJCZub1H9ibP
         VVI3d6mRh7znhYt3CZIanIn5hhUevc3iCT+xZvzeo6mWPQ84O/kDMxN1e8U+hX3KnExY
         W3mEbI6nNBPZh4/7o8MthGpAD73veQ5yv20o+Ilx5Uu2f71l9oFrkhKTCCNcSgVVtG87
         qZpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771918119; x=1772522919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
        b=IoWYW4XUqtgJSFlYZG2ss+RwvYCYbLo3S26/+xYQZxfT7eT94GEodV16hFjFnXm2us
         KnxLHix+A/LIqtO0szLCjz3G7f4IJeN3E4o/+v9d8QRvbJ41NbWw1xkUqp4+OcQiInQH
         1gWlKpQqhVsDk86BzUqDyGsKCmaSKAIwQnK/pNl65W9RHN1+bXMiIGy2nMT31uFru9nl
         Xtcz9cXJaZumSVvOPxBJUj16uu9LYDIc+2qiUqtw9fW5olJkWl3juDbKJ2zlBw8s70Eq
         UkjffzKm4XMwt9h/AtqEfD3LAzg8M5GZbgHaW8lPvoA+tWRlA3lV2qlrhik0475ah/Zm
         1fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918119; x=1772522919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
        b=IHzB+fXcz/a3BAuHfyz4Ht4Lbd268S44kpHA2Cw4SlGuyxYIaXiTExXt/fDdNhXbAu
         R7eHGCdVpAC+2GUbk4OgUfFK2EbwSoG6Mpv2QvrC5FofSynupQrcEZgTEdjIE7livdkD
         iJPZyyviDiWRVY/jnmtI8ymPs+zUC+lMCBS02kFMTauyQbNYYU9/4V61MvjjT4WnZQe1
         WFGtXYMVjFFrUb77iQKgVFw0FvCLXuNzk7t5ErlAXzcnQ88kGZhfzWbvr/TUJSRb5N8n
         gL15MiUhcdEJqCBmeBVLRrfr9YI/yZ5czL8trSaix3uEyiuAZyX8FyRHMw//JWjKhiWZ
         9jyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/myRpla6GFNRsQoy3hY+IywjokwPiaZYngqI75GygFrUvIGvTnc91w2t6UuiAucgGTM93sXC5kj/2JIVRkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFI/00DBtsYUTFjhtOqZ5SlWKVfFch3t/diLHYWPH2Bnesyayt
	r6HuOIovMVdFXcfhAkxUkEBm9P6BRF2Zgdwu9YAK1ddXYH7pRGzNiwKbl5Z+DZyk0gfNUQxwbJL
	3TvZX3wZ4mSE5Jrdncat0e9wbTrc3spIRxS0pqPS3
X-Gm-Gg: AZuq6aK65zRwbkMYt3kzVbFZvlMgDrC3kQkn+MZw/5Y9UvNaY+AcV9AOyqQHVkijwp9
	nNl3f855w9B2khNAhCT6Hz7b0IhIqa6mdx4wTUV4x+K3jgRAM3fINgC544dJsa/XaNLp0DqVLLU
	rrizm6BfrNnMbGT/wryTTV9AQyqZ71+es27nMoRYjQJEyB2ugN8+LHEnBVnj8mqfpu6L7bXbnyS
	jievnlLgL/Qhf+ayipSuw1/gnct6fPB5DCcJDz2eIBZbjqpWORpREl7UpVpLz8wnK8WZ4Wx9kGd
	0oJ3MOGm5FsGWTnD4i8SSx1Ft1phZRAgO5blGg==
X-Received: by 2002:a05:600c:8109:b0:483:8e43:6dce with SMTP id
 5b1f17b1804b1-483a963a003mr172969955e9.29.1771918119178; Mon, 23 Feb 2026
 23:28:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
 <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
In-Reply-To: <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Feb 2026 08:28:27 +0100
X-Gm-Features: AaiRm50cmDpg-9YGkfyHUtxGyx8jesE30IQsaptAynPPK_BJKBTapWH8sOvIRP8
Message-ID: <CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 2:13=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Hi Eliot,
>
> On 2/20/2026 3:16 AM, Eliot Courtney wrote:
> > On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
> >> +/// Create a C doubly-circular linked list interface `CList` from a r=
aw `list_head` pointer.
> >> +///
> >> +/// This macro creates a `CList<T, OFFSET>` that can iterate over ite=
ms of type `$rust_type`
> >> +/// linked via the `$field` field in the underlying C struct `$c_type=
`.
> >> +///
> >> +/// # Arguments
> >> +///
> >> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut =
bindings::list_head`).
> >> +/// - `$rust_type`: Each item's rust wrapper type.
> >> +/// - `$c_type`: Each item's C struct type that contains the embedded=
 `list_head`.
> >> +/// - `$field`: The name of the `list_head` field within the C struct=
.
> >> +///
> >> +/// # Safety
> >> +///
> >> +/// This is an unsafe macro. The caller must ensure:
> >> +///
> >> +/// - `$head` is a valid, initialized sentinel `list_head` pointing t=
o a list that remains
> >> +///   unmodified for the lifetime of the rust `CList`.
> >> +/// - The list contains items of type `$c_type` linked via an embedde=
d `$field`.
> >> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has co=
mpatible layout.
> >> +///
> >> +/// # Examples
> >> +///
> >> +/// Refer to the examples in this module's documentation.
> >> +#[macro_export]
> >> +macro_rules! clist_create {
> >> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
> >> +        // Compile-time check that field path is a list_head.
> >> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_he=
ad =3D
> >> +            |p| &raw const (*p).$($field).+;
> >> +
> >> +        // Calculate offset and create `CList`.
> >> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($f=
ield).+);
> >> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($he=
ad)
> >> +    }};
> >> +}
> >
> > This uses offset_of! in a way that requires the offset_of_nested
> > feature, so it doesn't build in rust 1.78.0. The feature is already
> > added to rust_allowed_features, so I think it's ok to add
> > #![feature(offset_of_nested)].
>
> Maybe I am missing something, but why should the feature be gated behind
> that if all compiler versions (>=3D 1.78) support it either in a stable w=
ay
> or via an unstable feature flag?

The rust_allowed_features list only applies to drivers and such. It
doesn't apply to the Rust crates in the rust/ directory, which need to
use #![feature] annotations manually.

Alice
