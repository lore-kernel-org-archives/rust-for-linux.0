Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9578309F1D
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780003744; cv=pass; b=gIGIcJF5D+qjTn2H7FHqTJTanRioAlPtiT2T68wWWyU9AYDttMKvWjKkwxda/XGRaB/S5CvxcpY5JNow/5z+i22PX+9pzn1NB6RrKmtU7IDNVqtjMMdPmteP5uWok5EUoXolz9intzh9OVUIAicV8TrYm7wScMhx800ohWBHVIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780003744; c=relaxed/simple;
	bh=yOo0LzSPxI3eHEyT5vieeOFz8kEiBYDecOVKA226/0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J51QDbk6PhAbtt8mZBUzEggixhb4/H51KJv5aUPftwbWti60qcBtT1QGX+WlAsiA3kguGnySrWmcLQUCagCCCy7U9zY//SzxNbrhLtWmE3hIJb8QwdQjnCSN6DhgtoPkK/UOcKcbcsfOQddZYzAj+cU1CWEwPKnCWoKdeJwktjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQIs/aHT; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQIs/aHT"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30436e8f582so879975eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 14:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780003742; cv=none;
        d=google.com; s=arc-20240605;
        b=P+kNi0aQBAkbYc+/RvcL4vMzfnA/bL2E+7uya/zGvl9aoGdDCW4JpRQz3ZSwVFWOJP
         JjSBskyBjYnJLi7gaVm9RQE3iY1dNgqOi4Fco4xWmixvNgrJW5D6+FxGFmz4MqV5RRR+
         JvfjfsvcozWGdycbiiDsP62xIU9GylHSVgnlOCoTlVHJ2ZcEmgKsnjqZzwlqhqFskSWb
         dzYyfiNL6vbCKer7RGyIGHBDKBlDHtRyjCgelSjAxcOU1YQNdM6wO+0piK4gwRd2jBWV
         hoLv4aJloOA4YLIesgqpI4R1f94bx7RBwRu0twhF8/XK1x04MYbsgT+ud0Fm+WbD2azy
         tlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YPeL4+s0trpfDDnEExWJGaBipS3d1gPi+HTsBMcsUZA=;
        fh=5TPg0ksgGhdvzYzNO1UBJGZYzxKvMC2WgGBYf8bAgI8=;
        b=lqpDe0H9y9sjl+OeW2TP3R/zRHtRPnPAIikmMDuRM4Gsk51YyfIZzwzcuETAyRpfU5
         iYRAynJ2lDbVEKqRNu05AQI3FSSKL1EN9T/DWE1KvPxBHsOFzQ2IeDtQRXAguU1DVli2
         rjK5XH0w5SD982sXAkgpXYM5mdpJIkRaiI0GYbL6RIoLIlz1iu82sf76yU2F4nBmiIYY
         uQP61+AhJuFEJumJ2DSNYr/qnFs102fJ8EeGPBsTwevuoZnJ866PRE/vjlnCXQ/AUKH5
         volsYCEuwzofX4YFFw5hOVXVxlisf0KEFZNPxwRGKsvjJ3cI14OInHlCtt4lLJwb42DA
         MSGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780003742; x=1780608542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPeL4+s0trpfDDnEExWJGaBipS3d1gPi+HTsBMcsUZA=;
        b=TQIs/aHTjBAY9ieqWmKiY4do4XQxTCshjfKA+TW9Tgpmc296ANnMgeJc48cso+GamA
         KUEbndf4YntcK8qH5dXCXLxy0GgHbEWC0UTo6zeRtbGarw6SUXLQLPR3zCM9EJ8w8SW7
         15g62lJh42gS3DLZ0vZEDL53SBK3Vea4QigGvPU0PXDhuJjMdAIvuKYlgMjfRRSgQcmQ
         RT/feV4nm3HeNsQTqp/jXGFUbDBVsSsjhy+iBWD+XkIQudh4mKejC+hLCMypqotgUQdJ
         vGAsR9IaAfbP2SwHHsnrzBpKBd4+Cy1IgPnUtcg5dOLpU2AZ6mfIM+yJXiivS7o3qKp2
         /+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780003742; x=1780608542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPeL4+s0trpfDDnEExWJGaBipS3d1gPi+HTsBMcsUZA=;
        b=cQ5ntfJ0aKaTz0vKaFpxgxgAJpxtTY+j8+EAOQGyeHRQy8uUXSNuT6GV3aFDJ5crY/
         KK8jzOJE2ZKafk1ZxHX/WKqMzSTs5j/4slmvYmg5nK7UxOcB1he+tJoj06HOrJz2AC3M
         snR5pAyXmRozHEj7L7fGTYRKDYtUGCT7fOoP99uN5dJC4HsdwfueeDbyQ9X6PLxgAvya
         oHwLqU+a88jMHYFKqAK7jNj/XiHck2lA5WcVPibT9DWUxYOCurSbVUVO+mKTsbICtRfi
         SRkTPRjNHNS2kKefJQLTruHy3yQpetkN248UzkstMTK8lBXYAOCxsZgvq8sCMY4P6tIN
         LcBg==
X-Forwarded-Encrypted: i=1; AFNElJ+ps/m5ezLOcOEJGy5S74mBpzyyJ54b4GGXl4N+p46UteMe92ehxYs56sWmFOYSu4QwNk3B4CZl3pzBrMstqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1ZcqoRHrZuNA46AbIY+RsgIzKUjDhqUr7DGYurNIP4kBEiVN
	1IX0LibqZA2nnM9QJ8z+CBjXcCSoTmQp5uoeLxKn4Sb3qExXzznAexksS4O6g+kEkYDwKjE69Xn
	JYoU8vdaDxrBfJzWMW4KEkk3NxhuZTFc=
X-Gm-Gg: Acq92OEZq3Scbmx+S+w14hiZNjifyZxUvVfje3GDBPZdZCIBsggs5oJuOsRR1z2iZ+s
	+hXjI0EKytrDixQrOxTTGTy+JuRbHBVNTdooBeaoFzGBmTubYK194mIFHoqw310rDxdqU8rmGQU
	AHLKgZi917W1AAZ3Wl4kFmZhN0RUnwCBkX3pcciD7NBaTZ3VtXJUCMNCuSqTnbzSS9Uj6odSz93
	KptStYTdiGAW4a5gWYFOiXl2Vv5MACjo5bfnbcxDI2hP9oPbzHPglkS704p8g/0lfmum0lK7+e8
	KyrkfBkWsWLxIvf/WzYHAq0cw7jvwPAsTjH3/iIbVcgZm8bVntHVVU2qosjn1olQGV0DrbcdJmk
	s/X6stUIpqS893ZqBAy8LD7FRo3NCVGwIRw==
X-Received: by 2002:a05:693c:3112:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304eb1336e8mr49279eec.6.1780003741811; Thu, 28 May 2026
 14:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
In-Reply-To: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 23:28:47 +0200
X-Gm-Features: AVHnY4Lriq0-TRvu5SbXHNEPQnJ2jIS6rGHAa7S8Vr8Yms1j3a72ptP03LiYK6I
Message-ID: <CANiq72=dOmUSj5Hq9jBvHYpsgiG3G1mQv4gfmC_UAdmbfzSeSA@mail.gmail.com>
Subject: Re: [PATCH] .gitignore: ignore rustc long type txt files
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 12:29=E2=80=AFPM Manos Pitsidianakis
<manos@pitsidianak.is> wrote:
>
> When rustc prints an error containing a long type that doesn't fit in a
> line, it will write the whole thing in a .txt file and print messages
> like:
>
>   note: the full type name has been written to
>   'path/to/subsystem/module_name.long-type-11621316855315349594.txt
>
> Long types like core::result::Result<core::pin::Pin<Box<_, Kmalloc,
> kernel::error::Error>: pin_init::PinInit<Box<_, Kmalloc>, _> are common
> during development, so add a gitignore entry.
>
> Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>

Applied to `rust-next` -- thanks everyone!

    [ Depending on the compiler version and the kind of error, there are
      two possible spellings -- copying them here for reference:

          =3D note: the full name for the type has been written to
'...long-type-...txt'
          =3D note: the full type name has been written to '...long-type-..=
.txt'

      In addition, we could clean the files as well in one of our
      cleaning Make targets [1][2].

      Another option would be `--verbose` (but it implies more things
      that we probably don't want) or `-Zwrite-long-types-to-disk=3Dno`
      (unstable so far, but a possible alternative if we prefer to
      avoid the files and simply see the long types in the output
      -- I asked upstream Rust about it [3]).

      Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DcKXdmxEacuGET8=
fuz_v5eFGB50vnOnKZZJd6iEeAAFA@mail.gmail.com/
[1]
      Link: https://github.com/Rust-for-Linux/linux/issues/1236 [2]
      Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compil=
er/topic/.60-Zwrite-long-types-to-disk.3Dno.60/near/598310194
[3]

        - Miguel ]

    [ Moved the lines closer to the existing rust-analyzer one. - Miguel ]

Cheers,
Miguel
