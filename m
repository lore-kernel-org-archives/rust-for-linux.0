Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A387B1E1DE9
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 08:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559150; cv=none; b=KK44oo9kByRUUQIFnb/99FXMsqRxJlGNooeXqoNS294mnTDHP8IOHF29otNmkQcpsOqIyi40Ix2zw/Gg8tsOXOv1wOgCyzCzSMMl+Lx/FKh7sS5paaun+XHwZAC4AisKvnfz+pgoPzf7lT8ReH6Efww6GK+m6IcZhqE7UeO4Ay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559150; c=relaxed/simple;
	bh=R7o25Gmhow4Z8lEDeZaJUPCmJA/D+pLPP+WdRXbdRN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYMuup+ist8BZUb+4ykHsU4GOodr1FLu83ea24AM0vuh5/jCLpuKGcNyBYheTxMqcyGLLzqRkJHLb3D6AUG7ij3UvtNsCVmQYA8WX4FC/fYWEVGdlhlL/x+BiV5vCbeadigm6kEDSpyimpc5sK818oIJutTcR37FpFkAv0Orjjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VlANETbM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VlANETbM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so3398536f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 00:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740559146; x=1741163946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v1HmoRqjrqqsg5xrU75YJMSiVDiFQ/P7qFYUH2blA8=;
        b=VlANETbMkSaDtEM3N95AgVM9uHXm/o0F69qs3J9SVEEFd62/r8U4QfEjtmyYOM/LwG
         MIPYc+9467z6t1Trim5VYAcLNp5ZgZXKnuCa5ACfzOg6nf8LGy7SDVo6L6ayp6+Nr8Pl
         QB7PhLf+sP8A/Yc4XZ+Cz2pUfY8JwgZLTl1TEskCYQOOp91VIfdBcEcgJnLJ+6wrb/sf
         j1RzEazWapnSXKEkcokcyXAOzwMz73hGUEYcLoeYblwR36z5K/lqkGSR860cIf+kxbyM
         ckK0AvQwf6Bsbo5lDrYqGbGg2308KfEfp+1SXK3B7QleLV/lZmf1YlulTMxhKzxHqyvz
         cuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740559146; x=1741163946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3v1HmoRqjrqqsg5xrU75YJMSiVDiFQ/P7qFYUH2blA8=;
        b=bipe2KefUeMQYbqnMtMIQ/qQ4AfNKizqBoYOaThZrSTBkjIg+3sDu/gS12z6Fra+E7
         FZo/yVLbqLj3JLkWodMmN+172z5EDADs4K4f4kluyEsFryUPmK2nBB7rhtSnMeQDUrWB
         G8z1H/CDhgz65jiCz9v8ZHDq32yUTAfodJBXlDe1TNIBgFBYU7eHXW1a+cpgsvD9FfYi
         m5PWBLCqOQTpy2UGBuH7QBiXq95RRKU7aEau8QKZ1XkC+iXafTwtyA4aTu0PI9cB9ctG
         yVQzp1XICSriYdEFyC3yLoAF1XdfMsMTevkhsu8Qk13jYsOsALHZ/79bHMOz+RnRZ+qg
         acIw==
X-Gm-Message-State: AOJu0YweXO9rLLSnvQv8E/Qe5OVuEpFIR4Xey2lrxFH18Ho7f//+P4dX
	t1zbZQWOtn30sfQ4K0a1/sH9ZUiAoi0kiL+CBXzeURkONqPCe5/wkDWIlvqieAlPixEx3KbOQCS
	5tKaX5w8V3WvuFUuK5M8D6YxrGU33uc7lYeS/mg12tuWTd02nDg==
X-Gm-Gg: ASbGncsnSOFDXwUJoyLgWZtKR+B6ap6//HXPMlVvhwQrP3blyUQPh9F/Kzxos82a9Lw
	6zWr3837Peoh79j01eIRXsbx10tDg0jQMjPhdFzucLL6YsbexZ3cdN3uOKIVQir/8kAN+lPonvB
	w70en1AvnQgxI3Jug5z9BzhBovmfLQ/ToQOxV6WQ==
X-Google-Smtp-Source: AGHT+IFWtgwikgZyNRQh/bt3EkyBmLyTlQQvW2Pbzy/KXQM5t1igagm8AQOFPeLD62G1j7aoeerCLVV1JYNFoG7dFBM=
X-Received: by 2002:a05:6000:18a6:b0:38f:2678:d790 with SMTP id
 ffacd0b85a97d-390d4f43039mr1702221f8f.33.1740559144919; Wed, 26 Feb 2025
 00:39:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225213112.872264-1-lyude@redhat.com> <20250225213112.872264-3-lyude@redhat.com>
In-Reply-To: <20250225213112.872264-3-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 26 Feb 2025 09:38:51 +0100
X-Gm-Features: AQ5f1JpVJkDPdU7KsO2IK1L8WWCkkhoNT3HcxpZZ2FpHX-G-e_JTJoIZFjJ49fg
Message-ID: <CAH5fLghwkK4S12eMUm3bgMXvYMNf_1Gi9ws9q-53OZPdB+QHQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust/faux: Add missing parent argument to Registration::new()
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 10:31=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> A little late in the review of the faux device interface, we added the
> ability to specify a parent device when creating new faux devices - but
> this never got ported over to the rust bindings. So, let's add the missin=
g
> argument now so we don't have to convert other users later down the line.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  rust/kernel/faux.rs              | 10 ++++++++--
>  samples/rust/rust_driver_faux.rs |  2 +-
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> index 41751403cd868..ae99ea3d114ef 100644
> --- a/rust/kernel/faux.rs
> +++ b/rust/kernel/faux.rs
> @@ -23,11 +23,17 @@
>
>  impl Registration {
>      /// Create and register a new faux device with the given name.
> -    pub fn new(name: &CStr) -> Result<Self> {
> +    pub fn new(name: &CStr, parent: Option<&device::Device>) -> Result<S=
elf> {
>          // SAFETY:
>          // - `name` is copied by this function into its own storage
>          // - `faux_ops` is safe to leave NULL according to the C API
> -        let dev =3D unsafe { bindings::faux_device_create(name.as_char_p=
tr(), null_mut(), null()) };
> +        let dev =3D unsafe {
> +            bindings::faux_device_create(
> +                name.as_char_ptr(),
> +                parent.map_or(null_mut(), |p| p.as_raw()),
> +                null(),

This function signature only requires that `parent` is valid for the
duration of this call to `new`, but `faux_device_create` stashes a
pointer without touching the refcount. How do you ensure that the
`parent` pointer does not become dangling?

Alice
