Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38F19DF55
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 11:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782428; cv=pass; b=Eod9g8huY/7Ixc7XAXbzIFsc5EEE+SgS+OZQLupWNzusj23GIsWtYPzdRtrq7w5dcy3Wvwsp5xr0cetBKf/mJcXI1bCCZ8wZjSR8Wbz5GDHdQlIl/DVX/JiqpbTreMUtE/ON0aokKMlqsYivhP64w8MnkS+9O1+6ZT/IVL7v8qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782428; c=relaxed/simple;
	bh=pLX9nF6wyLQALK/ZUGoRyTb2nZxeHbaEKDsHeK/exyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTXBB1qv7qk/IcDydoJQgfo0EVIHePVRO+w2RU5lQBNjK4ptAuN3k51kf5wl0tDFN+i98WweJBm3Lt6hG58igYzY6NAQkW5aJOMbAPHPeKvElyeMmixEXhxiLySiOOg3eUiQA9HTlkFSFYCfeKLshyl+J+jaYkeOnd86uC20PJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4FfMunL; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4FfMunL"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bce0dcbceso88561eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 04:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781782426; cv=none;
        d=google.com; s=arc-20240605;
        b=H/f8l7+FWqz8AX1o1z8dGdOW8XdQZG7gQhTowfcPyhv/DoYMb8kCg5oBhrk+WjfwnI
         5lUKVbqJHtUlkgvklk5vBuYUh5tbRGL2BMyfihAueH4YapJOtQZ75NmZNZD3wpRco1wP
         G5t8+xs7RfJUe0QMp5umxXwdf1KuO1doR9F660l8TbPeun/tQoNdJ/PmfL3oCngI2aKH
         IGUVkGTA2GoXiKBm8+K0l6dPMiKCR5spGscEuKHMwsddwl8nScdLmGpvjg18tH+csXPk
         ipAMoGl5GmqT8VQnvvOe3LEaXGX1ZrJCO8qe8t+ZIosz5HOs66S8T+9ySYQgZqLKrJt5
         ZMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLX9nF6wyLQALK/ZUGoRyTb2nZxeHbaEKDsHeK/exyw=;
        fh=5hiwnZryhlLPeREIH8XhYqFa9/mAaeMnyA63OI1jGHk=;
        b=DhKoenI0xiGDOc4S+t+bKt3ieWXZTRUep3WX0XbL2O3faxVj+jh66Zh/mlKJBMFhLw
         SJhyxIxPRdmjlWxJpkd4E1nYfxqrE1HYdvQTah1HttNB+Jk5rnX6ghNCNw24amN6nQTf
         Myy+0IoRkCdgGe7PakK4Lp2py7cGd22ZJNP7UO4VZc451sfVwWbrA2eY79VFUBtDXREI
         soxC9oKYu2U1WH5FKoLiq29m3RvG6ZvO3/H4IwJpJYi3NbjYefP7Ofd4/TfZ0tABtJvC
         +NiFzNEzNxEsGCle9seb+UhtP8i/brcepyDjLB/YkR/1n3l0cHOaBqt98rfK2wTq8hgK
         i3Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781782426; x=1782387226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLX9nF6wyLQALK/ZUGoRyTb2nZxeHbaEKDsHeK/exyw=;
        b=S4FfMunL7MHuHYQ/1jFdZgTgnn7n/n5wwPULrBRsA+Uf8Wet0B5vovInntDYW1js3K
         WCuCHzMTlMzWD9imzUkBNCNpYjj26PDxgTqu/p1jschos87MSSMKt4ipI2NhXanQF3fX
         91RMGi9XveEPeDmYwEOs0/Ets7S6Qp7/eVQYkn1H/CCvp/JyNT4kvWZPbj+Q3KU1wg3G
         Dx9VzU/ne0A2NXcASBIEBfDaFTbUfNVCyF6DVFdlHtpwed5SrZm2BQZrC4bxHIy7KWeM
         jeW6r52/afQ0qBLrnUt/HhOxuIUU1orBZAT027KScQreWDwsraa4wjlD+lccBdxvJYUQ
         +GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782426; x=1782387226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pLX9nF6wyLQALK/ZUGoRyTb2nZxeHbaEKDsHeK/exyw=;
        b=caEvEZ08wRvNPbL4JNZbVFkzRWCrsgG2heXWfYAdDPi04q4Scf0vCWzEsIDqVId+EQ
         8XrVFRBm97qZ5ySYkR5tPsH2nR8TotX7aY70nTFQE7wQSCTG2d3Rr3NQ5GwT64IX3kRj
         ja/XJDLK6MLFFCYPR1As1AJ4B6Z5h8pmfl4jBo0C/8zIpe1YJV/dFLszYFfXDX+wlkNw
         NqNe1S2ey6YFoae1Usa558Syf8zrEKUHVIYIjL2l267tAzoXAFRQrm8TGdktkBmwIYR8
         Chh+G/A7OSX0NHRLqor6TKUB3VrT8cIAJsw1FHGjNH8iYrkpytbbEcMzDQipA6PhFUcf
         +H3A==
X-Forwarded-Encrypted: i=1; AFNElJ+ldu/QBh9dkx/qai8CAsZLcdzW/WMJ06iw8fji7Sz6xOSTVZJP0ypqa5+09hJAKWXdimFCs6T1JfJQ8UXF3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YztO8yD/PBYT2uP/iFDCSadtS4MoLdQnguJrkLOx8b9L8IuXFiE
	euR7xKT01ffxqkmCU8mhMit+2AGTRAz5h/p8tOzdGz6p0l2O/npBhLVGl+6mSmJKPd89wESyURc
	GHppUg9RV4+AYiUgnE7xCdFzR8tQdsdA=
X-Gm-Gg: AfdE7ck9jj2NUDRkMIPP2ZPYH230FlEKch6z8x7+wJDMWONgLR++oTdqlMKhM3rn7q7
	YrHcvPQ+ptoRX4jkUefNao53NWZNHym834IVm+XkdiQKaoMD2MUAH3z8ptfJEcakQlkZJDfJk9O
	JL/tKYo6hVfgLaNlT4jhLMVYiBhHFJsPn+K7jAM3rca9Fg/1/3s6RJ+RcD7BqMiFFmCl6BESrcT
	fMF6gC2/OhZnKP6d9szNi9pN0YaC+sP+3Az4S49sn348WQcM1B9n/iEKQoIVUUNWGdXALIAatTa
	fhZvILXVjMBDPwJkuTliK6U9GZvxBaVR6oboYlDZmzPid1JdRFAlmI1N+q8/UbClrrkeUG6rtpc
	P6ZM1gjRm5dS+
X-Received: by 2002:a05:7300:7c16:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-30bf098280emr1006464eec.3.1781782426603; Thu, 18 Jun 2026
 04:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617222030.15189-1-iganschel@gmail.com> <2026061856-rare-envoy-d585@gregkh>
 <CAPE_3zLCOwqa8Yb21oAb8i9AHW-UPqW=+9848fUtuTKK6wAZDA@mail.gmail.com>
In-Reply-To: <CAPE_3zLCOwqa8Yb21oAb8i9AHW-UPqW=+9848fUtuTKK6wAZDA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jun 2026 13:33:34 +0200
X-Gm-Features: AVVi8CexWNgW9TjIyYG6gd67RhjGZYJsb01u0dXy4_cp4AOjk5vrhjHHhLkdXdY
Message-ID: <CANiq72kP5cTg=M-L6UCf_P5huUsZS7F13yDLF76mRC_YTG7dGw@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: check context manager before creating node
To: Keshav Verma <iganschel@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alice Ryhl <aliceryhl@google.com>, 
	Carlos Llamas <cmllamas@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 1:19=E2=80=AFPM Keshav Verma <iganschel@gmail.com> =
wrote:
>
> Thanks, I will fix the line wrapping and add the appropriate Fixes tag in=
 v2.

Please consider (depending on the hash that this fixes) whether it
needs Cc: stable@ too.

> Repeating this with unique ptr/cookie values triggers the warning each ti=
me.
>
> Since this is easy to trigger from userspace, should I drop the pr_warn!(=
) from the check in v2 and just return -EBUSY there?

If it is something that is expected to be able to be triggered from
userspace, then printing is a bad idea, and at the very least it may
need to be `pr_warn_once!` if you somehow think it can be useful for
users.

Now, for things that are truly logic errors, i.e. things that in
principle should not be possible to trigger from userspace unless
there is a bug in the kernel, you may consider `pr_warn_once!` +
`debug_assert!(false);` in that path. But only if you are truly sure
that it not meant to be hit.

I hope that helps.

Cheers,
Miguel
