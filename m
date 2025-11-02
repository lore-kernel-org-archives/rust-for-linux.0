Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CE1F541E
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Nov 2025 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762122054; cv=none; b=rWPQ2CvLY6Hf/rxoPIk0tPBnlmRe0FW9glbuSZLJvs1kb9n2Xhbkg43lumFQsa6CdCEXk7ehm1jVoKgnoJd4BEUCQCi/USfeLtX6YcJsr9P6SGjxCDejCdzV8kYPud7yETeT4GcRutEH5/+CM3VlJrQ0W1wmOlDvnGPzlflWxHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762122054; c=relaxed/simple;
	bh=WT7V+mIh7biSb9hoQQKTPcN5LrBBwROnmw3huldzWHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMZyaqXAt0h3c+3OVEd6ZayiE1lTQTvuBRJ3/I/MMp4biB+miz3bHn3TMhVMGUu+ufpNQHxewuAKPjytco2OW8y72wOPrc6yXU+x35n+Xr61VTdyyGKZWSh2eruzxBTJRHMFcxPQvyVxHEkbWIyZNvlzabf/C2yzt2iq5X6P0U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9oUVqV7; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9oUVqV7"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-340ad724ea4so298905a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Nov 2025 14:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762122051; x=1762726851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldh/rrZAKoIw8nkk3grHKnCTpuj+wVkO9BtM8FlPSJs=;
        b=X9oUVqV7P1rOUBrqf086oFJ51nz318w3F3ADuNBXg/gWop7pmvDi34Sq9j/PWbDrmx
         cgRUQD0YzJNi13LkMEYb++llpAt0BteLJpoyTbHfeABNE3AyFMPjkJG1rbI06lxkniZP
         NgSnoKp6tLGjLAL2Q0MVtOZKacBQwyXZriOu6K5fqSdtW1GlAVJQiwgHYJ0gM19XOnW0
         qDZutohzS7lzLziaPN0GCwRN8Mh2/Obky1ZNSOL5c+U10tAQTs3D28oeShHE4N9qY1E9
         /KOfiDqtCyZk+Ko8JMN0QEuCCUnYnFMfCDTueaZxkvUrdMKltok28ktEbeLYXnNwOIlR
         e7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762122051; x=1762726851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldh/rrZAKoIw8nkk3grHKnCTpuj+wVkO9BtM8FlPSJs=;
        b=q32qM/lw2alXntQ81Wu/vguesiSDIG4oY/avHCaOs3uZGuYU5RPkKSEGNC7fej+qsU
         lXp0EWSehO2BU9aaEYcfMj8OZij0Zza+aT7p37HyJ+qYr8vJSQLg7gVDBlScW8fQZkhh
         TslIlVhuyYC+MkN6BgEjZoaM1GJoPYiIoM+6vrVfLD1FtRu78Ee0vVyogCBykXzMkdlX
         huzOsmq+2127f0WR5cjX8Ht0oRc5O79MI/ecnLhmE7mKsmjm2pEtac1Prtskt9K/UK2U
         xn7kV7JYAeL5AzfvCtRrH9qgVbbENlpsY2fJykNp8nKY6YxpdQ1cWRRlz76OvwfgCLuO
         XXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgD6XNJXXRPAi/fEPrvXrgRQ5csV2TBymEUcUrHjR+5hVw5oIzSUdpyRRYin8pLT9CiAysW5AS3jouXwdGKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8rnwKhKwkZlLIdMd8z/lmJvuXNuD9WjM1NiSem2KE23K+xgqZ
	sTAN2lgRRwhmObg+4Mdwt8S0PHayI7F3+NPizpTBmGwNQnf5AO4ryx0f1p0uuABrjTvOBPg1uqj
	RKIFqFRA3m8S28ecQwfY45ZVMrB9MzDU=
X-Gm-Gg: ASbGncvOT+Ycp3mlbsRdE54Fe09mCAliYoSj3vCT69WLLnPH3MCtuSjmND7A4x0q5QZ
	rlIdyEO+m5sRrbEoYLjaYctZxhKvU5z1flsIZX8YSVYImAWzyIyLJxCLG33q4YkA19gcNHKZl1J
	xPBfPzhTP17lIxSRwBoiK0GTgKm55XSLvyPic5b0ImTsNwwo+J3uVhbHzTzskDM8RSe3rHX2UDf
	gE+AovmqZW0O6ePlX3dgACan2HNT8hOd8sG53TbZV6LzAKkh69ljHoydedWiEMkCXEPFYtwClh8
	Ombojp5DTpRAR9DpIgv+lAWYqqP3S4V+pMHS5HEGX8r+5z2/9wFObAuSDGo0WvqMOJSKTtKCsP9
	Koy0=
X-Google-Smtp-Source: AGHT+IHryhoTOrFuU+nX2/XXVf7kh67HIj6pJAwGZM07cNYk4Ch5KXgJowgB3YhvDy4LBmrqXMtVIjcCmU0HL6FeUno=
X-Received: by 2002:a17:903:188f:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-2951a4da98fmr50067215ad.9.1762122050659; Sun, 02 Nov 2025
 14:20:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029071406.324511-1-ojeda@kernel.org>
In-Reply-To: <20251029071406.324511-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 2 Nov 2025 23:20:38 +0100
X-Gm-Features: AWmQ_bmo-1G4gStAz5BNMs8sUlqk3doCuOqq-d5OyHMqc8oaNkX_-Dz-ZcwIf5I
Message-ID: <CANiq72k-7f91kNrAAnwFoRYyFYjRB+mo3PCRFzTkn7E-7xrCNw@mail.gmail.com>
Subject: Re: [PATCH] rust: devres: fix private intra-doc link
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:15=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The future move of pin-init to `syn` uncovers the following private
> intra-doc link:
>
>     error: public documentation for `Devres` links to private item `Self:=
:inner`
>        --> rust/kernel/devres.rs:106:7
>         |
>     106 | /// [`Self::inner`] is guaranteed to be initialized and is alwa=
ys accessed read-only.
>         |       ^^^^^^^^^^^ this item is private
>         |
>         =3D note: this link will resolve properly if you pass `--document=
-private-items`
>         =3D note: `-D rustdoc::private-intra-doc-links` implied by `-D wa=
rnings`
>         =3D help: to override `-D warnings` add `#[allow(rustdoc::private=
_intra_doc_links)]`
>
> Currently, when rendered, the link points to "nowhere" (an inexistent
> anchor for a "method").
>
> Thus fix it.
>
> Cc: stable@vger.kernel.org
> Fixes: f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

Cheers,
Miguel
