Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5211B21ADB7
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 00:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237881; cv=pass; b=Zk3Pvym29ZM1a72NrvhOXiLrkbnbXILu+KBzYVxkL5P44neRogbWIzxWVf6IrxP+rBKfx0FhFdRqpeGpHobLYVHkhEgEoh9kn7Zwk/BBTg3igtfSv0qm14OTcxOOvUF1zzEc/ZkJ0jW8krPxuLNevmqWWlsl+JXQuokXcT5+a4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237881; c=relaxed/simple;
	bh=B/4xcLoYpCf4oy51IBJ9CMfuwbAGNjelRBl/GPnocWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfHL6fYM3Jp7Fgljc1YjsuRZK+NULa+cE9st1soYXe4q0wcMrLFWbOBRaS3ZeL5hxdmpOi+pOQbj4aDg2098LKLPQHjOGG78DVnsEtniB3Ih3vEpaqlIH4bhWUz0tw8AcGJATJK/6/gp8XH/CDBRCFMjKzmdlWyidncoviiWLJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4p57+6t; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4p57+6t"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1273882d901so149434c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 16:18:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772237879; cv=none;
        d=google.com; s=arc-20240605;
        b=et2+Em3AO3Qoh3qz4z1OLgKyn7DYGBi8nemmnsio2D/gZvPV76RAXaor7rhONOgy7m
         xoQXskmepG8UsGfjcJNcN+qz/+WhDyRiDJnHlzC57DPhNurR+l78b6RSe+NVF8jZIIQ1
         RfXyMMQTCfuxFbPm+nHNT3Np/sV3gr/wrJCs3DcibhwiHCsPgj9/DHoNHAVy1hSJw/6S
         M15vF9z/dQhj3cRubM3P0K5co3qlAozlCp6Y2NB9h64np0hq16AS2pBrrjeW8psd9SRA
         wabH2tMLEtk37bC1hLgW4pp/4OEjIyYNl9sxzkmOhKILpuihGFTWSwltze5qJxHbeZ+A
         JXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/4xcLoYpCf4oy51IBJ9CMfuwbAGNjelRBl/GPnocWY=;
        fh=/98PPfwgpcduVinkIc1HnWCnk2NS5a3gd9THiHza4Go=;
        b=RbzrfsJs/Z1pKWxwgU/7bVvXIenMP/k/QzWpq7ocionYjbNvXsDOwnIZuaYopxXpk8
         +tbs9gCiB93uY8CqlWio09sfJCrxEgVAd1M8g/xL35+pIouWDHBxekDgduGu4BpfhxRT
         2V2CX/LIfC384nfHln+VlMYwjntPjVSXGf+dTQsam5V1Ml5JOlMKaw8Ey722v5yGpfX9
         lJY7L1MwQTtNqAtxVtiS6ZZYMKWupb/swA5UQt0xEK+ukEVztzblAVVJiKcXQIow3KKA
         K7xkpRgP/MVLi14HtoEi8ywkn7EbZ0eRbx6Y3nGtmEy5RZuBelILapS8E/v008+7rFYf
         Hrkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772237879; x=1772842679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/4xcLoYpCf4oy51IBJ9CMfuwbAGNjelRBl/GPnocWY=;
        b=W4p57+6tXjNZkc5+B2eBtnAD5cPIquO593j4HWJd6x+3x7itcJFHjiQc89LoN3jsjI
         5i8CMbcDFt/4RSA/Y6Vw7rkRogzqvG5zYbx6ZFpkrApQkxd+r+hv1ZX8Bd1yY5paRXCv
         C9b21W0VFW6TG8G1LfeffWEpPFrC9kTrEX83C2+A4AI1ACnYM194kIo5MDl6P/GkavSa
         fVy0SBxR1kQEMhdGy0gPwnL2V+/WS7WgGaOohP5u5SEe1/kKt6iMiKdPkU0U/qHOdtIt
         TNrorJVVtlGUA5+8iDueh/JUF0S9kdNb8ptiZeG2V16umGB4RdkMcikMyTxp+od4V9PW
         orIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772237879; x=1772842679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B/4xcLoYpCf4oy51IBJ9CMfuwbAGNjelRBl/GPnocWY=;
        b=KFBmnIJ46NIzQCUg2ob1QbHCw2pRgteGLdEG39KoJe00M3HCy2WheXGK7jY/Et2vaC
         +Qd5iVc9EtiDOd0QS77WCUQ9GG0Hlx2pU1HbEaFdOjlHjY8FXlcAEqy3U2B4LMIHD0/Z
         7fPPANrZCpUhFXJJ8Ny++CR2/ziBynpOrX6gNrXk6V0CO9F0RDZcCvpuGZwO/0FMpWB5
         h4s4ULn6H9J4qDYsk5VuJDbFEB2yEAfp81Il2E0R2VX07EJ0qifzCQj+h6B1zTtFIR79
         ZdyFEValUlO7Wx6QmiJIIhgYLEJbyU3+iTUDhu4puUAddNG5OVZ3NCl/9NTJQ8N8dTZj
         0OxA==
X-Forwarded-Encrypted: i=1; AJvYcCXkSMXDuHIuKiFG5Ud2dZTCu+fsHtgUamrsaOPcrOcbCkT9PqatzjbKASXr+RJB4EYMWTtv1XS16yQGDeU/FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcj55lpGqeeJAjzF4J+Nlluc3hiXGLmqfcjp8d6r+wvC9LhxCk
	+145chl1GNXnUsY/LwELe3fzJJ6wO2vH5YkxAuy2wkPHqm8jwvUYzdO42v+5eMEW8HfKd6fA+BS
	GQUxpnAj/nmD148N4TaAE2doLQXwzYlc=
X-Gm-Gg: ATEYQzxVDLgxpuaaiz8W0ZrLt7oSyv0N6gSy5XnriDSKJe0+cpm7XFBwJ6EICOPZ7nF
	cSOfmHvxY9wZprH1S1Yc+tFxJEFyrQIgkerRgt7Wolj/QKEYglj46WqRx/HSMUM4tyrAswk3ROK
	vZjFW84X1RKPRItoEjdELI1w4CXlYao+QuzDtWKzOP+Dxhnq29FjpRBVbFYFrBM/EAjfxvwjlWt
	09yHi8zwa8JBlB7JRCfADn6xL8CtmxQoxPrxR+etNaffmVLPAXG+0qFAwciAryZwOjNSDfjV8s/
	L0MXGmsSd0SOss0EX5Gh1opW7Up2cArHqb8qZDOd/dpcsGp1gsa6Td97PXkp5x4CJkHWeKf+vRQ
	qGEK2m3qfeo2BFrsmHwd1Vpalg5XD
X-Received: by 2002:a05:7300:fd11:b0:2bd:d8e6:90a3 with SMTP id
 5a478bee46e88-2bde1d0db9bmr1000466eec.3.1772237879328; Fri, 27 Feb 2026
 16:17:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227215357.667257-1-thepacketgeek@gmail.com>
 <2026022704-xbox-comfort-2493@gregkh> <aaIrV3m41n-0mWxJ@deathstar>
In-Reply-To: <aaIrV3m41n-0mWxJ@deathstar>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 01:17:47 +0100
X-Gm-Features: AaiRm50ahetLquJ44L3MgdqAftfCK6kSEdY-VxcEemQ3L8Byhs3Vhm7SuOeo8Ys
Message-ID: <CANiq72=sCt_NKtv81V=M0UimXzCOJxkSsGSerfd-J4Epnf7uZg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: console: add abstraction for kernel console drivers
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Breno Leito <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 12:44=E2=80=AFAM Matthew Wood <thepacketgeek@gmail.=
com> wrote:
>
> 1) Should I submit the complete implementation w/ dependencies as one
> series?

It depends a bit on the case, but yes, one option is sending the
entire set. It doesn't hurt if it is not very large, at least once,
possibly as an RFC, and then you can use it as a reference, e.g. via a
link later on, when you submit the subsets.

Another common approach is to provide a link to a branch with the
entire set for reference. That is also useful on its own -- some
people prefer to fetch a fully prepared branch to test. So I would
recommend doing that even if you send the entire series once.

> 2) If I create and include a minimum-viable functional example using
> this console abstraction, would that suffice?

That definitely helps reviewers, please do so. Sometimes people add a
sample in `samples/rust/` for that as an extra patch.

Nevertheless, maintainers will likely want to have a "real user" as the goa=
l.

I hope that helps!

Cheers,
Miguel
