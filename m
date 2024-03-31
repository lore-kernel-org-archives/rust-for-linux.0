Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B760290A
	for <rust-for-linux@vger.kernel.org>; Sun, 31 Mar 2024 19:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711914698; cv=none; b=bDi48UYUqArtX/vPd09HKgkY4OUuIJwxATszeb7gLPfRoSk1ka9y++fZIY7yOW8eRm7CoXSwQLg9f4+4ONn1hVzg7CmAXRUHoH3OJAW+ySzgWgtWR7cTP5g+mbYzudSSUPGyA1ETqSvU2/oM+5dLcLnL7JRVZtM0yB9QTDOxtHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711914698; c=relaxed/simple;
	bh=EZhtKd6L/oey6PIp9nGypGwjU8TQk8R4S2UCZHo3MII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTQ5V0Cf0S6/iOoW4x7NchMnng26bk8soHbNR2vSiznmWvRaVXftQBwXy1XFHiRs+IcEzpfS/9GHerAHjlcQQxXyCj7q41WyrD3eUH0KNPDLwe0s4FQshsbtIx9Te8ETmFF075/qSpB8EnqtncHrj66szx9Ss6IL/ZQfMMy78tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ge62Uv98; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ge62Uv98"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5a467dae51dso1397603eaf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 31 Mar 2024 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711914695; x=1712519495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZhtKd6L/oey6PIp9nGypGwjU8TQk8R4S2UCZHo3MII=;
        b=Ge62Uv98aL3v+Bp36Si9AZaS3W9aN/gdj9bN+/IvOcArlyslzJ8X06gCImmQ2EZrLg
         EO3Km3xGUA2iwX421Mc89as99NISaBLsVTuy7bvB1glOlRj2PsRzA+NpbSyhFtcZHH61
         T4CzUZfuB0+jBnQhV+0JILA2lLfRv9bCrS/ndJTrEgs1Ip1v5Nla6TnZjBcO7Uhl/rcS
         aPgugSiSAwkbNd16hY7ZSzaxE0j48n5Rdm/8BgVf7k3N1Hn+V19yd0BI6pSv42r+elPt
         PnMzUaH8+ZGd+AYhn7FDeHqbYcON43H+nIGhHSuMKxbJAJJqPAD13MloCAqpZmXEOKdq
         Om3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711914695; x=1712519495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZhtKd6L/oey6PIp9nGypGwjU8TQk8R4S2UCZHo3MII=;
        b=cVhREDWr9lV0rWpLfFlQxQp4eDUyoCV4jpPcflhVMjiUcHsCIIeZUefhnoyCPfZTfM
         c0Jbb/hGEgA81iLTIwjMSVTt3NjU+iozLQIwedkptAM/yPEAvzr3LAdT1U592ZDjw8ZN
         lCDn4tP05Hp3x9TC7ZELyFrKmY3RvkVlhmoJuKBRb8gb9el6/AktLU594pB3ytc0U/Wv
         doCPgYoYibONb+kqbec4gJCrtbCItGQ/r8lf3I9dKKr39Pfpxi9Xn6/pdFWHlXHh6mzj
         iB7rFDQdLcFMh5qHAD90jh+g8ZLUfcKnDLnZ5+t0v31I5RWgBWekoqd/iSClZMUCKD4c
         alHw==
X-Forwarded-Encrypted: i=1; AJvYcCVcyUuDSIplVGU9Gc6l2DxEwAsnEQjACKyC45sxY+ijXunz/DmwhTc6ahJYFpKyyMZcuJ4zvp40TP3I5dyerYpWAVAtxC5lnbNeaMNRQ9g=
X-Gm-Message-State: AOJu0YyirYW/6maVHhXkeAUbhPiqgy/B4oyn6OGZRjr39DDtjipz/aFJ
	GjtxczxQ/UqJuNw2NGnt1qGqGPs1su4qkpAKgToFCSzDezFuIZlV1TL+JTM1enFzL42Onnd/Ay4
	SJT10CfdZHMf/yRWvlA3OsJznr34=
X-Google-Smtp-Source: AGHT+IFVUnizxdNP4qC/55m/4dAFX/3fHpMoiaTRm4YC+496djpeHzGtabQtjTR9t1bH9MDKQqeQwS/IYMMJJD+RxXo=
X-Received: by 2002:a05:6359:45a9:b0:183:6350:bfb7 with SMTP id
 no41-20020a05635945a900b001836350bfb7mr10798521rwb.7.1711914695587; Sun, 31
 Mar 2024 12:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324010915.3089934-1-tim.chenbw@gmail.com>
In-Reply-To: <20240324010915.3089934-1-tim.chenbw@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 31 Mar 2024 21:51:01 +0200
Message-ID: <CANiq72nT-xT-=Au-xv0DkrEvNdQLXQNCMaT6br3oD9AYLUv0Fw@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: rust: Fix improper rendering in arch
 support page
To: Bo-Wei Chen <tim.chenbw@gmail.com>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 24, 2024 at 2:09=E2=80=AFAM Bo-Wei Chen <tim.chenbw@gmail.com> =
wrote:
>
> Fix improper rendering of table cell(empty bullet list).
> Rendering as a dash with the backslash escapes [1].
>
> [1]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#e=
scaping-mechanism
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1069
> Signed-off-by: Bo-Wei Chen <tim.chenbw@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
