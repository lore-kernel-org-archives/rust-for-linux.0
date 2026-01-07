Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A5334C1B
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767816522; cv=none; b=QxR5df1Pj3CUQn6pt1itGYfj5E8nHf87o+Q9FwS8PH7dxnhP5HS+hBduQBFUQ53V9U2vxdXD267CgOAe/sdvPguMOWIGFaocwMkqGrO8ZsLYQsS26kFZd2TVme5iJufWS51b64+HYsKGYsP8LZSIfoyFyM5OJI2Jbk5V2uQAycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767816522; c=relaxed/simple;
	bh=ok7Ydb1TgqsVfQxq41TJL5sgd3VP1MyynPlhuBIvS8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHunCSFGit/V/FC8tURySA1bWMSPfjQRKYQwXay6wRfgOg6r2liAjL+sBaLwjqorrGY2lmAOd0iWrtmICdPQKyKf1J0DoYfByRl2f7ziZp1JRZjdBkFcq9B+Gt2pJ8WAPXqqiiCN77GMc2+F1y5za3eucxhttzZt2MM7umHhB1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifL7SSqI; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifL7SSqI"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-382fea4a160so10926081fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 12:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767816517; x=1768421317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok7Ydb1TgqsVfQxq41TJL5sgd3VP1MyynPlhuBIvS8Q=;
        b=ifL7SSqIpNtY0pbPLvsSQF/r2Qkvs18rXznYij3dg6rZvYDvHc/bWpxm4jhyI8jcf2
         XmpJgKQhXJunrd2O2P3XuTNOMqN+HnlN2miYk0R7ee4k+lfkGAr6UBIwAK7Xz3HjmghX
         l/jqM/szcUJrajarWvbQKEQYRPGPl5JQNq2w6GjthX1XNjoJDAJMIioDm1pWKHGaJoRo
         uwZXlA9olhSTnP4CHGdAbHl3v9/0O1qk72PAUZ43j/2NXiw+xEC5N/68+tS9W/VOkmHH
         8+xKh7JKnjoLzdFEjlruJXynNat/fwJbPZ10X3I/Xzz2dXt0lhh4jbp8rTB1pZha7ELH
         JsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767816517; x=1768421317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ok7Ydb1TgqsVfQxq41TJL5sgd3VP1MyynPlhuBIvS8Q=;
        b=riLjYdhKamnfg4GrIohJCfjnie+8JRbpKQCFvXWFYKG08GVr7lPj9Lt7/K0gvS7J0M
         IEsAkZwxJsKyGaoi2K7+pQ86ci0U9J+8zZiVy49R21hsmQl4xcCAICvlebqHZjtaCLd3
         cAcAKvW0N7QNU7Whhaypb0Mx80jZD7r0+6tulHuqjnM7P/vWtY7sDwTeuHcPUBM52ukw
         L1BGVqKWQMO2RHQw0N9WjP62moq1hLCKMJYnoGJR1b8TXAN0o500gyismCTjXU2Yqedk
         d5iR9fcOxtHKQopq3td0RvO/lD9V4bQM+qqqbOM0cfAxnR96FKcz7J/FDrPH4D294Q/V
         BBVg==
X-Forwarded-Encrypted: i=1; AJvYcCXgg2IPSVLnuLkUjU7nwHojG3UTJELD/zJFJfLH2/Fr1C7eBhTIOl7iiAHrche8gIVkUGD7oKWaGkljwC+Yow==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp3c4+gTP3zL3arqFeBjFFfsz3OR94H1GAl8XNrMqsgZk5IC9N
	BpeQl2QLVTf0KasnvuFaaZ6QFS05oKQAhtBxH/ujXnt5gkgnfCAkXRntoInv84EXRqPsQWfb9gs
	yX8glQdc5zIeNS448X8sL0mXdWhqUpJe4WCvJ
X-Gm-Gg: AY/fxX4Faa1hFpoFKETyokp2yqupW8vRoqAIuS/Wj+d4y1v3wbadv3K7danbpRcvJhT
	0SZrmljHL1oQ9DXKMwCn0x7D8a/U0P/c6oLhUqpLYqGsXKsp3KavwoU7Ox5cdkQL8biK4g4KDgN
	XJmugRIak75eDFxZT/sMcGebiNi9o2W4594xk6L1QRxgj5Sa5UX/aY4tgqoaaJUpl17vomxXd8o
	rwbDREkX5o+TyEkimJIOIrqMVHwz00ilK3V7Ze4jlZXylgA3yCgqaeK6iBsqn81xUXi/h/u2fVY
	W1psUU4APwt9cOsrsqp/RImXSTdJiKHOyyQtqfk0KAf/3RGfzaIu+b3qmaYPUTe32G+Y2odhLvR
	qDP3SSOWPReVZNFXY
X-Google-Smtp-Source: AGHT+IGJHOpLOIetCkELKOkBMr5VyQDz410u9pPHhJmYuiYJ2ONaLvItl9rtGLos7frmyXFeBZvZFnWQNVhfLh0RiG4=
X-Received: by 2002:a2e:bc29:0:b0:37b:9bfb:90a6 with SMTP id
 38308e7fff4ca-382ff676c6fmr9224511fa.10.1767816517065; Wed, 07 Jan 2026
 12:08:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-6-9e5ffd5e3cf0@kernel.org> <CAJ-ks9=VO1nypKFtOaGWxOUqzzJ7-Wb5qLd9pzQuFCSfk8PkZA@mail.gmail.com>
 <87bjj5gr7h.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87bjj5gr7h.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 7 Jan 2026 15:08:00 -0500
X-Gm-Features: AQt7F2pFFvGNXoPmr9VIx3k6Cgm6ITdkbC1Gw9syQWiYVr3MYyA8xgr7O5YfV1s
Message-ID: <CAJ-ks9m6Pv85Y-Dfxgf7HxpKdrXsgY4jdpkFX+oYfrLevvd3hg@mail.gmail.com>
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

On Wed, Jan 7, 2026 at 2:37=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Tamir Duberstein <tamird@gmail.com> writes:
>
> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Simplify the implementation by removing the closure-based API from
> >> `Guard::load` in favor of returning `Option<NonNull<c_void>>` directly=
.
> >
> > This is not sound. The returned pointer can now outlive the guard and
> > mutation through that pointer is trivial.
>
> I don't think this is unsound. If we returned a reference instead, it
> would be, but we are returning a raw pointer. Dereferencing the pointer
> is unsafe and requires proper safety comments.

You may be right, strictly speaking, but it is most definitely a
footgun. This is a special pointer that requires more careful handling
than other raw pointers.

> Best regards,
> Andreas Hindborg
