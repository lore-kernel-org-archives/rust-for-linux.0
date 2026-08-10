Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8737F75D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 05:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339490; cv=pass; b=Bj8KjIrXpcpBDeRmUaqdcHBcc279LJQOoK7pjYvwKXkIQRNuo2zrqKZcv7t+5BJT3vRATkFKmEFr+XSMT4HhyoyDGiKuk16NHEXvjPbP3w+pv6MQCqMRdJmQ7WtXdGO0bkJHxSQ3b4Kz8EiF8dMDB1EO8xMQJ8CDNa8CPCXmLrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339490; c=relaxed/simple;
	bh=bZvxI371yzjLmrtA1r0PYP9BeElhLFWaV7GbH2Bg9TA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjZvL1tCIINQUefNeaLyVhzqkTM2oP+SQEHBdje8Ui4q1b/MuCQKrcYsvbHgT2w5rJsnKN67K3EcL2YIHhyqkK7vi5sDFpxBlgUDDo87PzvYaIO++8lTC8BYMfvGFA9paYKDxuN4CWazRjNIv7vn8yPucHSqrwc8eyp/hJ4GXQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVU4NqAr; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVU4NqAr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-392af6bda98so103994a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 22:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786339488; cv=none;
        d=google.com; s=arc-20260327;
        b=sCYYtKlhGSmTL+xmH92/P3tRH5W828qOdebN7rnlphxR6nAUMjnRjPB/tuYR7XRDfK
         XewtFWoU1jVyjd0TP0TJV1rDHz9vomdDuAsTno670hzS9vrYZJh/slQKpxAtQJCkJkMf
         hNBMFyPn/gAvksuo4SQbgcMpz9+TN7ufH7o3ia4guMpBrrx5V6xdNO2b5ScuQ0xSpj2R
         d6yTRORiOv8uZ1Z7CIPRjB/EhLHyHdVDE8QLJNpIZsG4m5UIYts+K0OsTWd9vnl9aO9r
         YAKN7itLz1I1R7bO0zfWQR6D/PyzyQ32+eDSFQ0d2oGbG5GYNFtQzcssuRQOZ5DwCe74
         MMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+9qb+gmHgWyqJTPB8ymjSF9d0A1Q/E/OrWgDvL7X0M=;
        fh=+9y7p/ZdjUWBCgJPBwvN+u5c62zPS0qhGZJ+qBCQuTo=;
        b=YFv0rRbmszWDyJQAMvESTa5jw1iSD9B24aqCz9cZ373Am4OHMLRPNM5/tMQTcfYWcJ
         Cpq9rND73zflhYnLnJ+gou5sjas2ImlIZzJLNFXfQT+GrNFnxk3x1xIWn5QqNJrKmOp3
         JRLEq9ytJK7zZY4IVYUyDPofaNHWs6mZCBMHMpUduVJwQ7Vb5M1DdGQRwChwvAx+6lvE
         AeRPrObb0n6sAzdCXObQV1wTn1uvNVaSIXwHMK8hlFMv+rfmQLzYpDWUE+ZMKpnU/Vq5
         m2so6xAuvoib9Yr9VEopf9msyPscD/X9YQrK6sPybZezA3tcXeNxqTCEMaQFdugit7fG
         KBBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339488; x=1786944288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+9qb+gmHgWyqJTPB8ymjSF9d0A1Q/E/OrWgDvL7X0M=;
        b=cVU4NqAr31Kw5W1S+1fgN5Bew2PaPa5phCu6/CHsft9gRkF52oiH0GeZsLO7JhcN2L
         jW7xyFWzotcOo8gMRuEpjceL0V6PUyCYy5I1UQJZT6ugR4YeZc+QIUIFQh+nUV7Zc6WQ
         GT0ubLp9Ev9Pc6HOfMMfkntFyGAm5AGuOTD6lDodhIReWi2wHnVV5xoNqBP87vVWXO/R
         TPodYof/1vdtyHzNDbWzg/r70nYbuzbvxP8XAjNDljeyfiIjWicg2LO1ITfKeNEtiwuB
         Qbqu2MYhbHalp8OvxHAwTVGixCMliUbIH5T0iGdAsEKTdwlqVbLnn8DPZlXac8j/jx4F
         8x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339488; x=1786944288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+9qb+gmHgWyqJTPB8ymjSF9d0A1Q/E/OrWgDvL7X0M=;
        b=N0ZvJeYq5rA3oZOj00Tq4mvhFvp3Q+aalT+OHnDPlVTyc/2LtfkwXQgkTidmNgffBH
         hFH2atMZvMQyujJVyZAB9CkEsukyMsH0vYqbcRf7DvyDQwki6LG/VRY0YwLT8uQajrYD
         gVk4JqSJ4QxZaYKvMfhikLyYDeFaYlLSzLulxN6PdNQsF4ogfhLuiAze5z3F4kb61rkk
         rNfo+W4Vhxp7NP9+TXuy/eesHZGaTz4izb0FWgUA6H9c1uP0AZekhOIGQb9d9tgHeBJd
         RgqY0lzNW+uZOLL3E95jqsi2Q2g7F1yqvzr6j33eJK6BrYVz3vHgeqTGEEtaVU2dsa2L
         CP5g==
X-Forwarded-Encrypted: i=1; AHgh+RoxmCy2YFOHt6EUMLs2c/PEoykBesH3CpsIL19GyNkbwKIokEasNYMyk7PvlVa6xyTAJBgCgGicBpeLU9A5/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/yiDCyEE/8tw5I6PPxlGHoVg3jg8yOiEmKZLY0+rsEbOo0EI
	uLdJwccgfsoyhPn5gQ9x6xNUVCuBmn8n47Ip5n7i0hiF+hwel7/UeohL60ccPnI5x7q4qnedeMp
	xREnkaglX0bggQkc9V5dmxQbcDudoIBBwNLHi
X-Gm-Gg: AR+sD135iuZ7OElzlabGFowhCeYSwzLJ0D4LDWpSxeZRhb3pRN6eCAFJ12Luzb/rV32
	hl0C73nO29uoJPzfNX9PG1ysUgCwyl2NAJqn9dYytdpju4/480YQuWpjkzIecomnkPJLxyUzThK
	96PVQivQBpPB7nFU/808Nn70sz8a+h3sj3/zvPdOsbaMCgyMqm37nxvaz+WgJBRbDiRDYgAoZjH
	cqxKo3SeMInHpu8pTY1SGSLgCtLtEa7Ps9A3zY9xk57Og2kHhVDaD4AMSd+e8CHAb9x7L/UmE74
	WJdwC4Vr3MIS/Ap3TSQnwqIChAhazm8Nh4ANtWC6mMJlXoEcBuYbqbnrCrcHPlAlKnTBXLMrnUA
	XgxY7xcGFHoDTWL16CRdyM8wDe5rCwqVIHnKo/roo1qh2BgOwvL7OdisKUAvU
X-Received: by 2002:a17:90b:278e:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-3903c721be4mr29129032a91.4.1786339488193; Sun, 09 Aug 2026
 22:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807112427.1039056-1-tomo@flapping.org>
In-Reply-To: <20260807112427.1039056-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 07:24:35 +0200
X-Gm-Features: AUfX_myFE0XC3jbpMGRLKGxOkMimhm0MgaPuDpOhudzagj1zX_me-0Do3LrTYK4
Message-ID: <CANiq72k0iFw84GTq+PUUnFb-+3NfeSJWoGFOua9Q9Q0umceU0w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bug: fix warn_on macro build error on UML
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, david@davidgow.net, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 1:24=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Callers that go through `kernel::prelude` have `CStrExt` in scope, but
> code inside the `kernel` crate imports explicitly and may not. Using
> `warn_on!` from such a module fails to build on UML, which is the only
> configuration where `warn_flags!` needs a C string pointer rather than an
> inline asm bug entry:
>
> error[E0599]: no method named `as_char_ptr` found for reference `&ffi::CS=
tr` in the current scope
>    --> linux/rust/kernel/bug.rs:83:49
>     |
>  83 |                 $crate::c_str!(::core::file!()).as_char_ptr(),
>     |                                                 ^^^^^^^^^^^
>     |
>    ::: linux/rust/kernel/time.rs:427:9
>     |
> 427 |         warn_on!(self.nanos < 0);
>     |         ------------------------ in this macro invocation
>     |
>     =3D help: items from traits can only be used if the trait is in scope
>     =3D note: this error originates in the macro `$crate::warn_flags` whi=
ch comes from the expansion of the macro `warn_on` (in Nightly builds, run =
with -Z mac)
> help: trait `CStrExt` which provides `as_char_ptr` is implemented but not=
 in scope; perhaps you want to import it
>    --> linux/rust/kernel/time.rs:27:1
>     |
>  27 + use crate::str::CStrExt;
>
> Call the method through its fully qualified path, which resolves
> without any import at the expansion site.
>
> Cc: stable@vger.kernel.org
> Fixes: dff64b072708 ("rust: Add warn_on macro")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-next` -- thanks!

Cheers,
Miguel
