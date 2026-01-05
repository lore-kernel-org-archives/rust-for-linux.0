Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B2C2C21F4
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627067; cv=none; b=SvXyPnLvzkaAifT2t/bcfnTEPEUqVo1HjHJKU6+DC2k2W35F5JsLkbzSEHUKlbpgDS8LZ9wdzlcNQNg2GQEsZhpqyblfUJhvqJSaLAG9CEzqebjSujLQ3NMmNFNDzlkgnhKyDbkZGT1dsZ7VoZf0FdaUauBpF1ZD860+9C98T20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627067; c=relaxed/simple;
	bh=ykhhdWUQOeJRcD/RO5goC2v+Wjm5WAIn1LvO9nCSBuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKTQ6/vBhsR52/JS6U3/pJaKWO21rvulRTKCWkHYuy8My7mQqqwH6fX6p5ad3P9To4aoSSc488Jfy7k5+Wu/YKhkLfm7dIjMTraOS/ltDd0W9B64aEsy1L7ABVyaywl3FLzQFG6LSpNQeMgLh0zWl51rf91pQNachrPJRCiNFfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUgUUTMT; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUgUUTMT"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-65b3d3ac972so7496822eaf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 07:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767627064; x=1768231864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykhhdWUQOeJRcD/RO5goC2v+Wjm5WAIn1LvO9nCSBuI=;
        b=TUgUUTMTkeJXIpZGopa8NakXT5ogmpdGKFCYoMaBYS73EoHPI07qxJUQMmbHWIYwPY
         Pn0O1yPbvfX+NJMIsYLJVEerzJD6mjviqsYT7IXLUFeFSXuwVhtkWmREnvbp4Xf4ZFZz
         GC1kmuCcH4fsufDoZQz5hjQlL8D8vtXpDNcvlpyDanM3K3XkbXQXdBmTAwcx8XNOAwZy
         HiA26W3jqqNysdFwKLjzBGnPqyDMmYnd2U1ggtbDZ+H8a2tOAP01A8mIaOGx5o+5PnDm
         anLcMIAOekhwHKPGOPdc0NLtLjmaUFnyG4+ew9YP4Yfvqv3D9ccAR4cJINdg8Yv+kOLY
         x70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627064; x=1768231864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ykhhdWUQOeJRcD/RO5goC2v+Wjm5WAIn1LvO9nCSBuI=;
        b=DTo3xkIVImvvl5m8gTOLJmv0TGHgX/bI64u7uO785nEPGvzYJ+XQXsh0k+ZIseEWZH
         AZqJ5GGbFIHDkG8Dwd4Xw5KiQ7AwjuEUKmcOWNAMFVctoSXmw99l/Bd3k1CGXoiBXIaA
         fLYCizL0xBXVl9hiTXOE5cjo6aywsohqLwJNaRcCHa5LrLO3gZtaBADhzEh7Lf9VJn1F
         gw6SjpWNR/LRhOc/AS2n+jLoyAIlZFNI9JQsnR9zAJAJeFu96BoEimQrW5m9RNfStNE1
         d/+u3MKjxhxKOb5E5awfAaPQ2zOLwPEnRe4iJlvIFeB4lSxl7wC6Oz3xuxx120UtqRjV
         WsKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEMU8lCJ7vGw+at1L6MRdiXe2R5D20cOVcFn3fR+U17NTmWqXd1GkceDVrda7J4I+4z/VxqcXqKy2Grjft4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzbNiEsxj+J0pmoMF6Ej4bSHyyI6cPHN9NsEMcvkJu29hbjhAN
	8gQci4D65on7zT3jN7rZDHWlCcsFvZ1M8GpAkOJ2GkkwPAWlmlXNBHWD/Jp6WenhIHcftwJrIn4
	RC1C+wi2/gFhov4aBFlIVv4OTY8E+xJ0=
X-Gm-Gg: AY/fxX6ioe2uc03q6eIPfobzy+QXcPAMjzYIBhTHT2O9jL+cr2wX4DwmhrkFWlGIQyi
	n8l3+kCQbLuYHhkjiwR++BIzXXu120919caq/n5nbVFA2wXq/+0MMKRZx/nw9HpV6W2by43n441
	azoK5cqwSr9YSX5yc5n6eZ2eIsA6/zGzjOpibm6t2tVEvLTI1dX2l4K28gJc3wyLS2moLnAgZzq
	heo+JhwOIJ7otsZs1sm5hXNF6vbSTlBX2IxkrS4HTtfkrMqmJ+z/6neP5Y1I3rCHeq0XmQ=
X-Google-Smtp-Source: AGHT+IHw4KtlfZWNYftCEC1STp9tmr4YQCUuPi/TyRYYxXffyAUepNQFQHqDBdlWUNNJ0/sVSXH9DkwU2Um+zYvN364=
X-Received: by 2002:a05:6820:2224:b0:65c:ff42:c862 with SMTP id
 006d021491bc7-65d0e9f39b8mr23433325eaf.10.1767627064354; Mon, 05 Jan 2026
 07:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
 <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com>
 <CA+tqQ4L1j=oy87e0DC-m9YA9wJ6fR+PKtVBcnWH9iitNsVqG0A@mail.gmail.com> <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com>
In-Reply-To: <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Tue, 6 Jan 2026 00:30:51 +0900
X-Gm-Features: AQt7F2p5vfWSZtt23jMXZv9hRZYO3RmIYydj4u0--NvPdzz5yQUaWPOwuBiAMlA
Message-ID: <CA+tqQ4KNPeyAkUbrhzbd1bGSCFSRjOYGNiAjHi+6F1OzBgQRUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:06=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jan 5, 2026 at 1:12=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
> >
> > IIUC, to remove `std`, we need to patch our vendored `syn` as well to
> > not depend on `std`, right? I think it is indeed a desired change.
> >
> > If you don't mind, I'm happy to patch the vendored `syn` along with
> > this series if the team agrees. Alternatively, if you'd prefer to send
> > the patch yourself, please let me know.
>
> What are the advantages/disadvantages of doing so? Performance in rust-an=
alyzer?

There's no noticeable performance improvement, at least in my setup.
Even though it seems desired, for now I don't think there is a clear
benefit, as `syn` is currently only used in the macros crate which
already depends on `std`. For the same reason, keeping the `std`
dependency in `syn` does not cause actual harm for the time being.

> In general, I would prefer to avoid patching vendored dependencies,
> but if there is an advantage, then I think it is fine to have small
> changes as long as upstream has merged their PR (i.e. so that we at
> least know there is a good chance we will eventually get the same
> change when we upgrade the dependency).

I think applying this series as-is and revisiting the `std` removal
when we eventually upgrade `syn` (so that the PR effectively lands in
our vendored `syn`) is also an option. If there's no upcoming upgrade
planned for the near future, I would personally prefer this approach.

Best regards,
Jesung
