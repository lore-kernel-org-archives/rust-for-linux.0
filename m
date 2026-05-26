Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D92D40800E
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807791; cv=none; b=L8uOYtfyhK4hm2LkDOcoCj7QaxLUnrsB5ZeE/Kr/Qdf07Wgz49DrK6JKGDVSYWDX2PRRm/+ip07xYQiXIYHLvh2c4fy9VxRWVG5Hb5y5cz1uviUfA4Iug6s70zVSke+UEp4lq2Wj22A8xie57joNPxhXbI4X4Dx6XS6/bq2A0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807791; c=relaxed/simple;
	bh=ICDwcl9L6q9y1CfG5kqdxmin//l8F4ZI7JbykfR+QdI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2NtdpLBnOEQ3+yoj6hLNJg9iNt4g/7t5gTF8ZOa9/7Ek7DrhGKvEvXBK+pcVp0etX2mw2KKc+Uft02E+jqU2jYKw2Nl1ETf/fQYHmeAFjq2cqNwZ9UWd9GQzwXZtGGaQgbX3MREMGaVLCXi9JYwkz0Jm3oCl/QIbFdK/pxDiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHEVSqVP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHEVSqVP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4906238c62eso21706005e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779807789; x=1780412589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iMitWWCqZ/up88QzDubBPwbYtpSjPJrOVW3+OZm20A=;
        b=VHEVSqVPE3LUYaTfqMEH4MUhkgMFH0k1OXW56RMnLenGst4NjifcJsyUmpxykzW6UE
         N0yzRQbNMNXQa41BDt38fMdJGO8Mmn1MkWI1g45tPNbyy/kb91AcTyuUVwVDdcd3gKha
         PXFFidwj9ujhfimfRWqzleVlPGA+5kvR+bDZMhIDC1rX1K8AbJOlUKDML0T4ad70SH9j
         PH/o5uBzTxa+djBwkr+jPEDTQkCxpj6m9Bx5qNWQgOV+z0zwJyt3Dp4hUr8rLuephxV3
         Z98DBYUkS8A2UQENZIQoZAguZvnW0+8rNp6UliiMCN7UGNCNjK7JYKCUs4AJ9eMZKhwQ
         paHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807789; x=1780412589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iMitWWCqZ/up88QzDubBPwbYtpSjPJrOVW3+OZm20A=;
        b=duJvI6d7MX7EQ+r0J6y8KMWq83WvuY7NXpaRNcYxo4vFgRDz3MOZ3ZBdsXYljI8Ltp
         MVTqAsZs3IYbXgWS+YxTG6Apxnh9cxkGmskIPjT1LT4T3X6S69/Xe/cwmRHg/t+XpbaE
         Lep4NoJ7kD7rg0DEWjPNTW5rgnMagkK7BkKM3t5/4AMioDOU7aEgN+1CkQEkKAPwdMI6
         F6R/jwfSoB6+7xzbRCUFyY7YXFfttqF/LSWLfsz4xXs8zABOjtiYd4Sr9eXIIOXdfUF6
         SYK6fvdUVEqe8qfSQ+qGYqjkCR7dBFpC+xclxy+aBQ0SJXtafb96BJLNpD+7uByfYqi5
         DyXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/t3cu95Sj/oAMMw+xyilRtWgrdjAFxZEpkFb2YCWmP6KwvCbLSfnrpDTCNdwwWq/tjjne+DYahkZQODCcZVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGJr+a2vCRYbnOS/WjcNf77/qjfZk9cyTA+FsUYSpMdeeowv9
	wJm/IUUtWVNBWBns0taHKmF6xrTCyWQGOAzwSYJ/8irb1B4LBleffApu
X-Gm-Gg: Acq92OHPNX71JGuak5x7Y+ePvl5jNI0KxbZ/0X9DOBl+xH2uKUpzLHlteCmwA3TsoXy
	spiA7Np+tXoxDCStymIsq/9/vTBfleNTRBYfP9MiVcYARGmjkZSYQM4NSTRSAXbXnw/FyF6peDn
	tW0huXqkGk76eeiKlUOEKcYMI1G/1n1XoLwIHtwgr1jdPOcz/hz8bkG/THew/04SFK2mg+nsH3E
	xU5PzXuWbr1mxmJK0xV078VH8VO+/mAymRlOuYzUguQtMjwuUUwiJPkkahctzkqNycBt9/M/Eb3
	Ty8TH3WxQCKZb38hXbKnoaP7ZWQT1MjjV+KdGlnChByZ75P3+LqMqUmxP4kVhrjwlJ+OEXdLjDJ
	r2sYufhfJnPBshBHzFPgcBKsOwUETDYJOgEUhb6wgfyJm4I1AMqCcki+/pKwI9Ly16JNrplbHzD
	q2rFhfyaNEjEEUU9FMMJ5xDxYM0Uh9vnTEKBDjfUtx4Klcbq4wtlfRznj24fnU2Ui2
X-Received: by 2002:a05:600c:4e43:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-49042ae77b4mr334732975e9.32.1779807788363;
        Tue, 26 May 2026 08:03:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f682sm354998435e9.13.2026.05.26.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:03:08 -0700 (PDT)
Date: Tue, 26 May 2026 16:03:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Aary Milind Kinge <kingeaary@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2] rust: devres: optimize type name allocation and fix
 truncation
Message-ID: <20260526160306.15351508@pumpkin>
In-Reply-To: <CANiq72m5MnUJRJTH=Li-GCYEDoHLcPbKKNUQ=hJUKxB=tNLQaw@mail.gmail.com>
References: <20260526094329.533943-1-kingeaary@gmail.com>
	<20260526115825.1480768-1-kingeaary@gmail.com>
	<CANiq72m5MnUJRJTH=Li-GCYEDoHLcPbKKNUQ=hJUKxB=tNLQaw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 14:37:44 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, May 26, 2026 at 1:58=E2=80=AFPM Aary Milind Kinge <kingeaary@gmai=
l.com> wrote:
> >
> > The unconditional 128-byte const array allocation for every unique
> > `Devres<T>` caused unnecessary .rodata bloat in production builds, =20
>=20
> Wasn't the string deduplicated?
>=20
> > terminator), the copy routine now appends "..." at the end =E2=80=94 co=
pying =20
>=20
> Did an LLM assist this patch? If so, please add a tag:
>=20
>   https://docs.kernel.org/process/generated-content.html
>   https://docs.kernel.org/process/coding-assistants.html
>=20
> Moreover, this should be sent to the right maintainers and reviewers,
> e.g. at least to "DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS". Cc'ing
> them here, but also please Cc all the "RUST" entry.
>=20
> > +        let mut buf =3D [0u8; 128]; =20
>=20
> Why is there a hardcoded literal? Please use constants where possible,
> deriving the rest of the literals from that.
>=20
> > +        let mut len =3D 0;
> > +        while len < 128 && static_buf[len] !=3D 0 {
> > +            len +=3D 1;
> > +        }
> > +
> > +        // SAFETY: `static_buf` is promoted to static memory, and we v=
erified the null byte. =20
>=20
> This should explain why this is all OK, e.g. why it doesn't go out of
> bounds (a local-only reading of the loop above would appear to make it
> so).

I'm no rust expert (or novice) but that code all looks like run-time
initialisers rather that the static data you really want.

Can you generate the '\0' terminated C 'string' by including an explicit
zero byte in the rust one?

-- David

