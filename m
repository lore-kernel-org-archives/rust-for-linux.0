Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF6632E6BE
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024515; cv=none; b=OMaLoowgldVnhTKmdPdauS9mkB03YORqBpivDxhZJTD/CgTqD7d3J4FJraUbLUasREFYGZ1FZbOtYmerP2ZwRqMoEGqbAAAPZnhOSqCT9zA7MG+SKz4rNCzT0UZIoh/tWqmAMMHy/RzwaTWngopIt9uva5508RMnPwPHrz/vR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024515; c=relaxed/simple;
	bh=NJOcAIxmFFBa6EJGBVDNDJBqoF/PQ3DHh+CXe40Cxcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKWAcGmyrBavpOvo2BKNSJpCB1ZZLCYrOgUpqJbkrWTKmjEneBl3pzyANyCt2AYsISKiNFUJdzk3045XR7lJeFjcBy8k6ykHQCC9M9fdLvZUoR15oCc2wmeLTI4KQT6v55m5iFzjAX+UoptKJ5DQY45hSdNXFwIvqVZKRI+H9O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmoBIQBx; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmoBIQBx"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2dced861so97447551fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 08:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024512; x=1767629312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ld1Pgin0D8pdwsBwu5whQB1olwItrUX97UwynrtaKcY=;
        b=PmoBIQBxgaac4lijPy+Efn1MpQi5gWoZbCCwlhkVo8gAXPdlJipZH2kkiG2Y/Nn19Q
         0s9UHnxTxhza04+FrHWlsTdhbVrSRm8p4hdOYZ7wCo2ESPoDJLmTCTpGIvkjPelVDFaQ
         GUV/BXGlD5LR3U5qbrMahvH67voH5XdMW1SQnDQTWW+yxzWHNWVSdCstzJ25NCYRSbMA
         2dtQdGu2Hpy2Vqg+UaztwedXruirBgdpZoYSbJuEli3u9Z3PcaUwzei7jBfArsQg9Pe/
         yOg4Y3BCg2l8z6QVIavlHrdilvmjUZYpyYEkX0wmNFr7eBm1y99ZHxZivxR0Z2fucVql
         v/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024512; x=1767629312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ld1Pgin0D8pdwsBwu5whQB1olwItrUX97UwynrtaKcY=;
        b=Ri8h3EYbWGIPkxcK81SigxPbUGTylOEgCBdeo9xxrzbqtIqoc8jw3EYWXbOhspWxd0
         pHdzXaVYkmZj4hy+4oDb+hgAoXycY7bdTVwD5iy5VnxQYiAnff1wJSLsPOGF8CjImFOT
         cougJApAt6UWQ/AenBPx6kWO9DBqCCekXpS1DpE1ZeUiNxZVVEOfhF5HEocRyltH8gkj
         Rk72NrexZPR0hSOYQD6yKH6Z015lgwpCTSDU80iulNHvlr6G5w3PB6LxfVBedvEaRIGl
         GCRC46fG1Jywi/jCCFfXi3JHlxOoUACg3Zb45+RUg5Q25rZIvqEO3Kg3Vkh5uyL4vGV/
         dd3A==
X-Forwarded-Encrypted: i=1; AJvYcCVuDlMpW54/LdRNUTGOEQQbm3Q6heLXIsPL9GNJn10PqVoG9bYYGtzd1X6ERh1PsQ4uEPN6YWhPNhYorRxTcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEO9BonTgG1vGPU1/XvDLyS1gtJgU/qEPcdxhFBTOOc/Txp/Fy
	1fHc8Gevx1eq8MnKWm0xK3aKUnvs4Y+9OYF9ni6BWjxVqH0OqSfsXoZosY0IwPX30Id8PbJ0rSQ
	uyXpxL4qtCRTssz/MEiHclyYOwam8ryo=
X-Gm-Gg: AY/fxX6kCtfiVG6zcBmJOBt5F9Liil2vnYlviycwniQjmZ/scIHkfop8RAZX+QrOLv2
	83UEM3oJvUdUBbQ4vo8G4DGNQWTA62QqhDnm1tDahm1t+n9z5krAC6fKWAnJxXUrgdNGWYr/lI3
	cQoNLAh6SVowMCbspNG22ujQFee+B1ybc5H8+dRzItKvlH1VBG1J0zPqbDhKFStZRf0n61UqIJi
	gx8vW8HtvHblO9Mj8lcibrjX/dDAmP1tOVy5UZTRox10Y7vsoXA0CrQSipnIEo+ArRDxRvIW0L+
	CZDmv0bCcWJFhqzI+iEk50W9IXOCMZkoHROVqrFg3yyzkCklIgoIzhf5YEuKOidOdvo78QFqCfv
	qB3E94FBDgHWumGAc50vtlXlINNBGlMLKwg52uIdYgQ==
X-Google-Smtp-Source: AGHT+IGZaeTU6DO9YE26Fh7x47jFJuoqrGBt7pJAL4seWpEn8v0DY7rIPdFFHN54teHJOxuIBpJn0TUtg292I42ky/M=
X-Received: by 2002:a2e:bc20:0:b0:378:d020:b6b3 with SMTP id
 38308e7fff4ca-381131adf46mr120771601fa.7.1767024512004; Mon, 29 Dec 2025
 08:08:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-6-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-6-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 11:07:56 -0500
X-Gm-Features: AQt7F2oFn9a_6dlnHNgBK8Jbq3KKJVrc5eK3lnokGZEinG-vD_ruRLa39ud9_Sg
Message-ID: <CAJ-ks9=VO1nypKFtOaGWxOUqzzJ7-Wb5qLd9pzQuFCSfk8PkZA@mail.gmail.com>
Subject: Re: [PATCH 06/10] rust: xarray: simplify `Guard::load`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Simplify the implementation by removing the closure-based API from
> `Guard::load` in favor of returning `Option<NonNull<c_void>>` directly.

This is not sound. The returned pointer can now outlive the guard and
mutation through that pointer is trivial.

>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 0f69a523b72bf..ca97134ba2bd0 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -211,16 +211,12 @@ fn from(value: StoreError<T>) -> Self {
>  }
>
>  impl<'a, T: ForeignOwnable> Guard<'a, T> {
> -    fn load<F, U>(&self, index: usize, f: F) -> Option<U>
> -    where
> -        F: FnOnce(NonNull<c_void>) -> U,
> -    {
> +    fn load(&self, index: usize) -> Option<NonNull<c_void>> {
>          let mut state =3D XArrayState::new(self, index);
>          // SAFETY: `state.state` is always valid by the type invariant o=
f
>          // `XArrayState`.
>          let ptr =3D unsafe { bindings::xas_load(&raw mut state.state) };
> -        let ptr =3D NonNull::new(ptr.cast())?;
> -        Some(f(ptr))
> +        NonNull::new(ptr)
>      }
>
>      /// Checks if the XArray contains an element at the specified index.
> @@ -246,18 +242,17 @@ pub fn contains_index(&self, index: usize) -> bool =
{
>
>      /// Provides a reference to the element at the given index.
>      pub fn get(&self, index: usize) -> Option<T::Borrowed<'_>> {
> -        self.load(index, |ptr| {
> -            // SAFETY: `ptr` came from `T::into_foreign`.
> -            unsafe { T::borrow(ptr.as_ptr()) }
> -        })
> +        let ptr =3D self.load(index)?;
> +        // SAFETY: `ptr` came from `T::into_foreign`.
> +        Some(unsafe { T::borrow(ptr.as_ptr()) })
>      }
>
>      /// Provides a mutable reference to the element at the given index.
>      pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>=
> {
> -        self.load(index, |ptr| {
> -            // SAFETY: `ptr` came from `T::into_foreign`.
> -            unsafe { T::borrow_mut(ptr.as_ptr()) }
> -        })
> +        let ptr =3D self.load(index)?;
> +
> +        // SAFETY: `ptr` came from `T::into_foreign`.
> +        Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
>      }
>
>      /// Removes and returns the element at the given index.
>
> --
> 2.51.2
>
>
