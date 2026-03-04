Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA9A351C2B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608016; cv=pass; b=pNRnOHDUp7nfc/F3Rn3M4Jb3jfDBxK6KHKaJnT5rltlZBYqNODF0FpgHp+GJ3jF33zuDRNbVIgHVkwcXIb4+ICEm79qjn6ZQfDHRVXJDhP/P/e130NKp8rX9Lz+jDpWOYZ9mDcHUAMcgRNvu0xXgYJZKHMdzAE6xcOtn4sf47CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608016; c=relaxed/simple;
	bh=Eq9qyHdKQ7LYi/t9tIfBeexRCTEngbuCUrZuJRrNrqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTBHsV/F8c9ORGzWQQ3RJ9PrsNbZxsoz1LbggVl4sr2/QbrEtksfNUJ4DMbQ/D9EYFunHARq0cvUG2xjYqYBLYeJKAWWoAnntLtp6mEEro8gzL3eQPQhIJ4XlvlDViFPnYe7aTmJ+QqW7s8DTlCIcQTIevxibjWhrRYofg7iyu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LWWOzqia; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LWWOzqia"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-480706554beso70400845e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 23:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772608014; cv=none;
        d=google.com; s=arc-20240605;
        b=Xz/WuLjvC+c8MgDyjQ4i+km6CpGTNWUNOpUaRtK/LGvAR5zXCEXQm9JcEfePA80b58
         YDdgMIN/cYxEubEdX0YtFuWeQOo4it3M39x9+vr0qPpe4F+WjbXq5VB8Gn8zGHiJUZsr
         oscZUHEweEOINd3BikD3g+CiQrBdFuafojA2BePydWc908UeQ1L3u5/S3bSkLOikPtpH
         R4kOPvL9XexGq4wfoh6rcvOwwOBjpDFbl8zV74bHMDiuVmOUwaApPmlCi0F68E7C7p1M
         U9Yr/PN0nH63u+lxXg6orSFf5JMIefxHtt/E5G3vQEEPAt/MkZ7HZeZYA7rA9kxQ7VsD
         ebhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eq9qyHdKQ7LYi/t9tIfBeexRCTEngbuCUrZuJRrNrqs=;
        fh=3/EaHNMwi4GZxB/t2YGMlj1fgpu4ScgxcmjchNgqgiI=;
        b=XlGaGL1UbdwYpnkgCHSMgv6kVxGiiAtGO781JA0AjJFBnirJrkT6HICZUDFU0oBxzI
         RhPrGP9/bTJZ5yXinvvJbfTUkAZlRYwYQibxNdC8uRWRPi57YHlBJC6EMleEw287kHqS
         yc3CAyeMB7keMoiPclrY3iQo9RXzBtavSQ7DOACDMJk7zAe8Cs5Q1DoVMi3cYsEKT+yk
         ooY2sTfooEYdhOI+xAmIh9WUS8j/AHO4lwU/WVdLZOiXHV3TzRwEqNXL3RZr+n58wECz
         2zuufixI79hm1WNq+5gmI+kK3SW+Ao0HIXLxNCbyxsw0VjzmwK2ySj/jL7AG8KIQlKLy
         g+Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772608014; x=1773212814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq9qyHdKQ7LYi/t9tIfBeexRCTEngbuCUrZuJRrNrqs=;
        b=LWWOzqiaR1HcgItpK5vzH6QeMz/GZm/qL6PjbXPR26oynHYEwFsux3CsxjoDxHddXE
         SsMxC4qNx0BjylL6gdPDXUKWJw1ME5WU3GZh+HadsYByZkdva+9KcuxlYp+od01fIJA0
         5T9DtYiIJGAlTnWiLfrDn7ZGU+zJ2qDeSEUuDB4gty3AElh4teW9j5Q+kG0pNIyEn8iy
         gA8DvsZhsFgh9GyBuo9l1OkM3c3KbHW0I9FqmLEFnKNxn6h8IgZEjPZ4yGqasIQTMPdk
         G5yoeN1o2aM3kQTaaRSqGUkIuSMFmprMYmeaAUGllPlAWr0Kp5hpg9UIiIafJQOpSc9u
         jECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608014; x=1773212814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eq9qyHdKQ7LYi/t9tIfBeexRCTEngbuCUrZuJRrNrqs=;
        b=EgU9aJk5JxemkDDDbU1ByvuvJFw1XBVocnp7lGv5KSTDinUktDpNFm16b6LxTBSe+f
         0n/OJXlVTvNKoT1V8H1+Jd3bMIBJWynT20BZBRzIEwF0R4u8WPeKrirlgk9glMSHxjJP
         fczPMH1O/uPuUTRUMwSaU/cK+zUESkOnYPNMtg6+WSZZFxAPdo70QHNen2D7NW3a7DPY
         i/r384kEpM/4pUrfLrBkMySzKrd1aVH3f3+mM6vkCS1mCDWA+OoEtw4D07TaDHQqFrQ3
         /0DCj1Fpfi5nOIRbu8a6Wnr0P/9DlltnKloQJWdgoyadzzcxijnIDLCci906rb8ctEzr
         zB+w==
X-Forwarded-Encrypted: i=1; AJvYcCXAbZW8X4fY/p78omcCjwJDVIdKC+VaMq6vAoUERJCz7OmRjIlKpHnIdgROc2luTSI6sjZOeVGVJ5TWqa6VVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlI1LzoG+WcAYyeeTRXSyh/fgwjCtzxpL9STEGJ3NqvQZxJnyG
	cc7m/serdBIYwPm/rYAJkDg2zkq8YHTh7mtrrwC9gBHkE8GbeyWTNtqEZZTFIxA8OqeeiwB9uB9
	qKyWJ0vGgGELbIcg7N6UrR0OTqVn3kZ6hblSr1iEO
X-Gm-Gg: ATEYQzxd2h6e3cLN9MQniI7JLJAwRDXBMj5u5ljC1nJSvx0FksGsW4kIk3YU+/jgMz+
	tyDXiZZu5BMPwFad7A6O81TPMQs4/cZXHXqAnsCWY12jGkmIRD8hNGi0mHtSimYZVp2ucxsVMY7
	grLShpou7mLi0AMh8f5LA+91BjfTxSxWrdlV5dfRpBPVRENrB45QQQH65ziWeAHlNh+xOZlfMBq
	sUNE4j6EWZ4BvfvKWFxdCKlv5st/4JUI+pncD5xPpdy7gU55D9cPgHFd1V/OuPN6gq6rJ7y3azc
	NHW/SdNNx+vCu3ulOjOBApkluP3eBq8Tim9MkQ==
X-Received: by 2002:a05:600c:5308:b0:483:43da:6c87 with SMTP id
 5b1f17b1804b1-485198b1738mr15878455e9.33.1772608013607; Tue, 03 Mar 2026
 23:06:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org> <aabGlKYNd0CrO7_f@google.com>
 <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
In-Reply-To: <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Mar 2026 08:06:39 +0100
X-Gm-Features: AaiRm51LTTpf0T7q1dEgZF8jNp-KJy70-qlcjjgy9Tni2I14wcBDMvhmeWS5iu0
Message-ID: <CAH5fLggJd-5odNbCTbcOdF=C_c674su8Fz=DRsLdfbA75LFS8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 8:00=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
> >> add escape hatch for referencing initialized fields"). Thus remove the
> >> `#[disable_initialized_field_access]` attribute from `init!`, which is
> >> the only safe way to create an initializer handling unaligned fields.
> >>
> >> If support for in-place initializing structs with unaligned fields is
> >> required in the future, we could figure out a solution. This is tracke=
d
> >> in [2].
> >>
> >> Reported-by: Gary Guo <gary@garyguo.net>
> >> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-=
init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
> >
> > Should probably be Closes: rather than Link:.
>
> I figured that we can't really "close" a Zulip topic (we can mark it as
> completed, but that topic was originally about the field accessors, so
> not sure if this makes much sense.

I mean, the Reported-by / Closes pair is most commonly used with lore
links to syzbot reports, which isn't much different.

Alice
