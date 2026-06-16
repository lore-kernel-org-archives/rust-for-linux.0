Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC8D34CFBA
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 07:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593939; cv=pass; b=V3piMfrbtOwlY6uJM0+/FOhiddTjxT5Pfta50l4+fQ56fCCMj3sU84jWMLG7rSLip50gkXT7H7RgWY0GhdIu7Ql44vBQ/bD5AOHwKZ6F9Ec0EmIw1cl9GmxERWdnXWzz6nmycj6I6B7PrFilbg9WmschGleniZ9EwrJ7CiT6/pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593939; c=relaxed/simple;
	bh=8WayqcKce4MRqZ73XVGnGSEyBWDaDJHOt5dSAixvHtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6cZXjpWLsaSQkZCWRZKKHITBVJ98DEZQgHFrGcE4ojNuzqTy/2RHQ1T/SLayLq/c5VWVsSFym8AJeYfRo3K6wSJHvFG6rXAfR/XawcqTQbNY7s8E7ayL0G6tUeSLWDCkFizMpUZ7GF0s7IOdp2nVnSRoNU35ktE9ulTHFSYUb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QXBf/GzP; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QXBf/GzP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4601949975dso640759f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 00:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781593936; cv=none;
        d=google.com; s=arc-20240605;
        b=C241lnWeSKOHHavAxi2vx1+BFEyainB+QQp6Fu+QJa2k2rodV5GrKYEfmSjH0KbFtL
         BMGoCKK25VxNZX2RX5GG+dZM7FEwEz+fkHMy37bFav+l+yYIclDHz6v7p0nUM43dm7xB
         nZjC4suLf9v12EosvoElKo01rdPt42P0RtJAB5AqcT9xRskZKO9ar0VpzlDUGbyWUGd+
         mIyBDKNyQ6RiKGD1O4VJjeKZ/piCUJFi2xjiP8z17oIhVs4kNkm5VhA9Clo62C/mbTF4
         yaYJZDHYYFkEATmWezeUensAYn+qVTyxC0bwB1ys2giDOBVwFfhiflB+ZeTFkpugrJRn
         lSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KYBIXpOEYG8frmvKe904XBI23XV0OVADn0wkD5EsaS4=;
        fh=NOQPgJKA1fac5Epmt/rS7pH6d5KcKXZMz6u2UWmr3mg=;
        b=H35CijpjQFhOSZqDsaQsGzKqtf09yFkL7iL9lsOCw/EiUHa7JZMlOtkKWLAtD4t2wp
         LDv7A5aNW5QqmjMX5Db0Zw0hmhPmz72Z45dsxd8AvDPZCqTHBrRAwezrhBFkRNnJGtAG
         VwV/qEh3KsX3/NCikhl9Fen+4sck8nGaLkftowTPxeFDkMtlfIKuZT6TaVv4GpJvopg2
         JeacN3Iwixis8GZ7cWujf/QIZgFHFmYFQEis80m78RzrE3Ys3TNhWYIqKFNo4JKNMVwX
         OMVG9p1S3ZMruymTectIGKRgtYVc9fkPPZRSrJtw+VbmdPjBiNb/t7Dwbcr55bXsuEvj
         i73Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781593936; x=1782198736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYBIXpOEYG8frmvKe904XBI23XV0OVADn0wkD5EsaS4=;
        b=QXBf/GzPo5GpjG4iTjOd00bjkvHp4OZtpq1UW0ljv2tiEnUb+E1qwKzPU8RSacjExw
         +bdhL8tdfEaUWNTiRCI4kd8Wz8HyVmC/FAsx6v54ziah7C70BMPyxW7eYgFPyayEt3h2
         YKSmkfbVFK2KzdhHBq644iGLeb9HpxVv6NXIx8GyF0zW8Bv/AekA5NmR0oPYHZsNssyK
         sob/fMS2qwEtJhzqCT0mcFgqKexY95cCTJID9l3/hw+gdEY4QzzQZkvLxcJ7fn6dU/Sc
         tmDylzNon0bXOZMklsCcEMtWyIAXhXp7VyuXNIGHNcOhZqkPth9Ebs+rCQBLeF26Zp4i
         0Osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781593936; x=1782198736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KYBIXpOEYG8frmvKe904XBI23XV0OVADn0wkD5EsaS4=;
        b=XdpuxUrtTM3D36jGLrhiWtncZS4T4JxWlu60oacECeaiphdBduz2CF1uBcSKDw63wY
         DyiC6/U7hxFlXKpm+TTpUfqSPTO8/hp98Zy2ktT8WAysUWtoHWRbpX7cPxayIfW57ui6
         BpC5sOFnsOLoG4AX9d6Q66Gob1LkSInPxZaAnmJ3Qu67HYWEtoD5NK9DU8Acbh9pV+lz
         clTJuCJMut322KGFQwOxaajzg92ZkWSV4eoH7+NOG4acc7hBgR3rJmuYo0kaef0oVedo
         B5wRlutFfmnnus79UuPc6NILUPKGvM6dCbmM5pvTWnY4fa9tv9HCQlcI+hKMVm75Gzjl
         PTGw==
X-Forwarded-Encrypted: i=1; AFNElJ9uPcG6kvcHqUgZU0ihdQtYR+mcg5kRVQKe7QOX+KvymufOJr+iVc/MszISLapMppotyFCnOZEvW76U3CSWKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywq51yuTjIgGUZ0vvHOQEG+AHXhWyyVv7K9lF7o55QsXAcmLqm
	Kh4sBqf2/+54yJdoFIk7Vj/MtSyoJ6fxRmwFOQbL6QrUSC2IBSvwfVyvC2D1L0j4c0Bz4ov1YU/
	p4zi54XXN4LgLJgDAFMqRUyxxybFi27VaPyHXLj4n
X-Gm-Gg: Acq92OGMMZRVGdRys209CuspoWFpVp2oueVGCn6tRvvUXo810i+vcx3T9Vlwgr4qHp/
	r6wDeVj35EDBi5jNboCy3dmf9bMHRVhPpXaUXhcOpqIy+U6kVnQ0R5iXwuRYiBrIopoLLIhqua+
	TZGvgcKIFBO2C4QH7ZwdXiETd9DXADnb5GBBWOgau0cbhR3aFP5lu3P3/tL2oB14JU348BdPEiC
	9kipR4tmzYJyUqbM2v5ka9bJxFOvECtpAxJUmAmwDln8Df0z4Hvcp/jPjGjChzmINk/JoPX1p5P
	FauvYsGLiqlGOHvEfgUyc8lFtUa2TIuQ5KLyYQ/mz8RSmRVq/ZRdxkdDlRGQBXmZA5ZCog==
X-Received: by 2002:a05:6000:4304:b0:461:a169:f757 with SMTP id
 ffacd0b85a97d-461a169f7bdmr2407010f8f.16.1781593935169; Tue, 16 Jun 2026
 00:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610035544.3333022-1-georgeandrout13@gmail.com>
 <20260610133241.374115-1-georgeandrout13@gmail.com> <aipm9QeAyhah1Vkh@google.com>
 <CAESH5ocW9Ks82fu=Unm1EWR-_=CfqUj5FGRiROeQe8zuU5oM9w@mail.gmail.com>
In-Reply-To: <CAESH5ocW9Ks82fu=Unm1EWR-_=CfqUj5FGRiROeQe8zuU5oM9w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 16 Jun 2026 09:12:00 +0200
X-Gm-Features: AVVi8CdCmI1_HDfaT_4AIYY3feZASF2reD5T5cV9ZkYEztzN_Ksidh2wu79Aulo
Message-ID: <CAH5fLgj=AELiEH2TvXKCvpudAtAqAFG_OAV5WTkFOfmaeeZ87w@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add ownership assertion to Node::add_death
To: George Androutsopoulos <georgeandrout13@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 12:26=E2=80=AFAM George Androutsopoulos
<georgeandrout13@gmail.com> wrote:
>
> On Thu, Jun 11, 2026 at 3:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > If this assertion fails we should not continue. Either use a full panic=
,
> > or do a warn_on! and return without adding it.
>
> Thank you for the feedback. Would you prefer we go back to the original p=
atch
> suggestion with the assert!() that contains the message, without pr_warn(=
)?
>
>         assert!(
>             core::ptr::eq(self, &**death.node),
>             "attempt to add NodeDeath to the wrong death list"
>         );

Doing an assert is fine, thanks.

Alice
