Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D31E7A38
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038468; cv=none; b=dn7Jmf/YG5zCLnyeo1VDxsCTtOPo1GnO8HMOC+YqeZ0yOUeCUHPB8DUXhgo5GByBTHGkWy8O3wAp+cq5QRkThkCnZeeQtjdBlXxulIzLy2e4NUR8+8EiT/X0lQXXrce40XURYC4wmMC7+HoSHQQWneN86UMBJMnCM2jusnOZ7fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038468; c=relaxed/simple;
	bh=cXwOnnPPtRayPwPAiVsgc6Pd/oGKw6lZ8vM5fMa/JMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfJ8BLb1KiLAtHvJJR4zWOHu8ymY6udXe8laqSqYRQG/N7m3fWU5zNasJXDxYPpVNOJonEylQhRvPoycaRGWPmQbhCWoZYjUdH21W82RkZqgLf/paeEg8DOpGi1zh/MVdc9Px0HdzoMOqIVWE/9ox8xhpzI00ppN7yT2qxJVSug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yvZJqWxG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yvZJqWxG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so17421725e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 06:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723038465; x=1723643265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg7Fqj4yxnRRstVzhSE5Ryqqe8IAda9IMrvigugwW40=;
        b=yvZJqWxG79yR3Xd+OdWm+nvQoVCjRRaNuRqeVk9TXp27I43hfuokZrBXkJmAbfGOYV
         CfxJhK27z3TgPVrZ058neRqs2nOLfeqFzdLMxOm/uhphMqQk7abDYfVhXl71bZv3wvWb
         Pdk7qSindaqWo3S0T7aZaOTEvWb09Zbk+VViAsj5DhR2DV5unAarCKMfDa0GUBF6mHNz
         vPM9F/GbgdyTPK2yXXGtB6cFJf3lApruesUOLS96eUalW0iZDnix/onQyYT36/iAn8rp
         3JyX8Ftb9QvVEErubwA8Z5E3NN8eKhYfWA5MRj/tozlZtqISFCCEAVbB7vDldVig8bF5
         q71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038465; x=1723643265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg7Fqj4yxnRRstVzhSE5Ryqqe8IAda9IMrvigugwW40=;
        b=N7mFDXlKI3c21GikAkgKU4HJ4Z7Sq5AMLm1do7KjPaAOWXoM/4tXAjvsmiButIDbwx
         n/MsXkNLdQZHA2SqhKcsvGLqzOiN1YJIcEOv3lYyRki6VI5FPo1iXgk4VmOdBwPwI3eD
         c5pHFXWVeQW5DNiXRYSqU69ZQJWRAaCJfSDd9kc91+1JMvw3LjJC3b5Q4k2ub4l/yUba
         1OglAmCDak1VNmN8y3xqCt9k+qlU7ubPmayZ82kJKLdOvMXeSBuUmfkGiiAgav8hblaC
         clhQTxLSqY+1F/jTqUKhu5VmLHtkY0JtHFb89wmySjjBpYAfMwhWLjAh6zPPRaGIXJ7K
         675Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpRyiBm9WVJ8nngDFpqKZj3Wa1O3soX2cWrDaBFUCoH1lcYpyGQuBVLlBvZUQWcuJsy6m7o8/S+y980Gyz4pLzppSE6Av8HNeILVqAbbY=
X-Gm-Message-State: AOJu0YwwvWZ2hlAYlwWyllhmrMGVccB51XSwQADX27HKllGUdFcZOuHM
	8uh4Q7wPok/gJaTgQINvc3f23vX1aM25jwVuDM9hGpCd+zpsvgg/P2UhI+xvZlXmg7RFeu3dFiT
	Nzx6SzQ6opMcomxRE0oYCw63VkAuJtzwcAKR2
X-Google-Smtp-Source: AGHT+IFzaWTlF/4BlvwqYPHLnWdT/Gmw2l5stRTgHWn8X6rjJf6wTFKZewiQ+LXH5HE/7PN7kTx4+9RQ/vAiGcJuj2k=
X-Received: by 2002:a05:6000:1789:b0:368:6337:4221 with SMTP id
 ffacd0b85a97d-36bbc1c7934mr18838226f8f.54.1723038464685; Wed, 07 Aug 2024
 06:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-19-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-19-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 15:47:32 +0200
Message-ID: <CAH5fLgjDHe5Sv-YA5mzA2Gj9Pxbxjp1GTDGZkdMKRH4thrWgcQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/28] rust: treewide: switch to the kernel `Vec` type
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:21=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that we got the kernel `Vec` in place, convert all existing `Vec`
> users to make use of it.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I have two nits. With them fixed, you can add:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> -        <Vec<_> as VecExt<_>>::extend_from_slice(&mut buf, cstr.as_bytes=
_with_nul(), GFP_KERNEL)
> -            .map_err(|_| AllocError)?;
> +        KVec::extend_from_slice(&mut buf, cstr.as_bytes_with_nul(), GFP_=
KERNEL)?;

This would be more idiomatic as
buf.extend_from_slice(cstr.as_bytes_with_nul(), GFP_KERNEL)?;

> @@ -291,9 +288,9 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
>      /// Reads the entirety of the user slice, appending it to the end of=
 the provided buffer.
>      ///
>      /// Fails with [`EFAULT`] if the read happens on a bad address.
> -    pub fn read_all(mut self, buf: &mut Vec<u8>, flags: Flags) -> Result=
 {
> +    pub fn read_all(mut self, buf: &mut KVec<u8>, flags: Flags) -> Resul=
t {
>          let len =3D self.length;
> -        VecExt::<u8>::reserve(buf, len, flags)?;
> +        KVec::<u8>::reserve(buf, len, flags)?;

Ditto here. Could be:
buf.reserve(len, flags)?;

Alice
