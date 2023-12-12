Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1UaX9Vv"
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664B4106
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 04:43:28 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dae7cc31151so5453813276.3
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 04:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702385007; x=1702989807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEMrj9esbToDvp8yzL8r+0YBG4xPa3d6CH7aOoS3Tjc=;
        b=G1UaX9Vvhb8zFgKraWSBUbbCYsJ4LQkk+ZQrFLj18ESM5qPDeeCOHy6emmkh+6hbpa
         O3faouaM6s+cZgdp6mFM/ZOCDIEsXWXIiVh6RG/LG5TDuaZrNX2Y6xnrXQI1iPPm5ahZ
         f5NtOgD22FGFVdjCq7Q57PmZce7BmYt6dbVJ1cJhOudOmjy80pjdNWqUS6AQ9wRRex0I
         Z/BETxSTroj3KmJ6QW2POP2u8L/X2aSPCfjkbwPtAKQMHXSGAyVgcvcM+MDKiUFywiIt
         JuiwP6k+3Z50GSzGu9CpuVe2UQmSeo1Twg0uuPx98ahwx9kC5LkuE+a7Gv/9eSnOjYb2
         MwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702385007; x=1702989807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEMrj9esbToDvp8yzL8r+0YBG4xPa3d6CH7aOoS3Tjc=;
        b=OWY5yixGKfelCEpSk3zqfK6TwY4wON7E8JG2DNlOd/XqTW7LWP7Nzo/gJEmi8ajgqe
         hW0hkUipX/G6iJANd+fsFio4KJU7ZrWBkV7hyCo2aCqcl4BFnLXNQE6qHq+t/8mrECqz
         IzRktBVwmcpB91UDdt1PST0L0UJCyyIEXFMiXAaG0YCKN2cmTq2zJe6EYoSRRxr4c2Qi
         bwh59cnNiELZCni1im2erv7JwjngBpTRUBhui4Dp/47Abxniu9XRcj42kQfiTBqaikyD
         95MDt7Sb9BCdF8kXxA8LLso6R/m6B2uqQKecCmk0oW5lE2pTDo7925k/B8vZP44AefYt
         cYng==
X-Gm-Message-State: AOJu0Yyj8ELOXmHY+oX7M4wXXFkxGNcUfAxPLyIYkZ2Ek75YCpUol9Eb
	mo3SfJVA695iatrnuq8PTN1Gh1EJ7vlr5GaOVng=
X-Google-Smtp-Source: AGHT+IGUiVB33PvkcVELWdz4TJAxCP7oe7rKiolbAVjMD0G3pzuehN9hPcO364XjuaMAV7/o5qUrw/nsaYLyMYuF8eg=
X-Received: by 2002:a25:7795:0:b0:db7:dacf:6fd0 with SMTP id
 s143-20020a257795000000b00db7dacf6fd0mr4395098ybc.88.1702385007469; Tue, 12
 Dec 2023 04:43:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com> <df0d8a01-eac3-43b2-8498-e237a0fe6eb5@nvidia.com>
In-Reply-To: <df0d8a01-eac3-43b2-8498-e237a0fe6eb5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Dec 2023 13:43:16 +0100
Message-ID: <CANiq72n5OB0X9sHoNf-htRY9z93gzdg-BqdrOUDTqTEvUytoNA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
To: John Hubbard <jhubbard@nvidia.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 4:14=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> "make LLVM=3D1 <anything>" doesn't work for me, and therefore I suspect i=
t
> doesn't work for at least a few other people, as well.
>
> Instead, I have to run "make CC=3Dclang <anything>", which works just
> fine.
>
> The docs should consistently reflect this, yes?

No, they should not. `LLVM=3D1` is the "right" one for all architectures
(except s390) -- see Documentation/kbuild/llvm.rst.

If `LLVM=3D1` does not work for you, then that should be fixed. Could
you please give some details? For instance, is it related to Rust
(does it work with a `defconfig` build without enabling Rust)? Do you
have all the LLVM software installed with the right names (see what
`LLVM=3D1` expands to)? etc.

(Cc'ing Nathan)

Cheers,
Miguel
