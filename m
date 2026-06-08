Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E43B8BA5
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929252; cv=pass; b=GnmQLyuSkehzoH37EpBUL35w31HR1CSGq/shHunsUnAfdq7pzEZMMIvnQCaVpWO95uoFxfxlmozBT+v0ZPW5VAC9uduHQ0OzkHlB9zVqknakjTknoXTBGOM9bp1rvorR6Y8fA68EiBkFBljHzJ9+J+vkYAUg+i3diAFGod53sDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929252; c=relaxed/simple;
	bh=Nu9gT4m8blyiwVmXxsXayYwJxb2QYg4FeVDGBWBknB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oe0nGltRFg0N3V/0HpXVItJ7I4++7nA4b6+DmrDBc/UShvLen0uzqbc0fXWm4TuGZ54sQr+JzCeojHW7baG5s7RCCotqfBxZsyqhou4MX+f1+HnP9vs7wdLG9DoXdEbQvjLQHnCW164X3mjZO+NxC0XGCWuTIGd7srIppIuqCYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XWVqY8l0; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XWVqY8l0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490c1915793so27480695e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 07:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780929249; cv=none;
        d=google.com; s=arc-20240605;
        b=AU0SJ3HGrPWemwnAIn++lpBGkRt/+OhpGwOZ4qd3KE2BwoyBzg6ZvNo0N1MSQ4fyYe
         D/Z9+fp1318mhXh+UTHoKtm/vCZEP5Jej790X/yzolfL0HVPuztwnMtjbhfuJ/ZtGG32
         F5v65Urx8fNQdJo1Rgt8cVtN59e7IOi4/y3eso50Oqrc1uTeWJjhmlBK4LUvhfbPAIRQ
         6tG4lBPkLN7r5VpZxxI9BhNn4hWQvfakLI7QX7BkAUIgKvGSadAiLO0tVfp26306UQAy
         yl0azcOl55t3WOcM5jcdHDJC8grPqKzRhX0wihrSwP7+5qOrCqOqz+iNvA9IfeE4ETqM
         i3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nu9gT4m8blyiwVmXxsXayYwJxb2QYg4FeVDGBWBknB8=;
        fh=6ZK/aI6C6Cq7KXW9Fjc3JbTXhC5PkC+0DGUZ3UA2/j8=;
        b=eMT+2PNIK4kQrGNUlouQQJaD3Gci/bWmRR2ZBt8XOLcNrZWROHXObTQFdufxMo3RZ5
         mlHVtWnn+pkxloLg8kfQZ7z9dk1PPGt33V8lOHCiTI4/FCz67yW0IQNgonZX1i+pGhqF
         QfMrwabMzlQPXL0SBseqifNysgLQ3EL95EKUYtL23i43hbYncvsHHq7eHu6yObEtJ4KJ
         PkOM4n8SJxshcERM9ywr7EocBwBUyF7ElT8NAXRsSLkfHbrqQO/E3fNKiDKk3v1b0/oX
         x4ubaPT2N6ndUzgtyYjgwtDcs0ggP7Fj5ltpTSs+DY2yQv14H4uoozmvxnyY5OEKu84b
         qx1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780929249; x=1781534049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu9gT4m8blyiwVmXxsXayYwJxb2QYg4FeVDGBWBknB8=;
        b=XWVqY8l0tRvfsqrZHDoORDpWXwTcLjBGaRdlavEj7Nbsjj2eZTvJNZvODRXlVkLKvv
         XJW4T63vxLQppa7MA1ebbEzB08Lgo+7bn2xlpXxu9+aTbiuZcNY4VZ1ZYTxSX6azzuqJ
         aCYzYhZAdE+nEtlvLLyp4CGDDEsrMzCeSC0Oow7Tr+7R3Bbc5gGLN8ceV+xf0hyE3Jiv
         TmgXOtguT2c3PI0/GmLMatgArIOkvFfMhrllecCvl+8GmtJQPp/8lzTT3slrSn/inPCD
         cGDRED7m6LfL0V1TvGV1VcUgG3Lll9HBdGabaXtLb6uySoCu7TSC2Tp5dqj9+sPoT8oB
         OxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929249; x=1781534049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nu9gT4m8blyiwVmXxsXayYwJxb2QYg4FeVDGBWBknB8=;
        b=mtIAMGOJgXMQiBboSxKBZO+bPpxlh/eYyXgDWIx7C/CtRGljCdGuo/Iq0CFjpggg1O
         sXyupEcYVdrtdtGwyeXhbt3JDi0K1lYsplIOf6pYb3eCzfP5WdKHE0wZ8uqbj1XlqPet
         rPQbcxglYnCtq9cyuKqO1uCyiBgl1CeisKjCnbVYyitKwS4qenG0faciqMWOQfbMelmI
         eC/dVZJGSgVdk0CY/i+kXV/obQK7QYxVAEM+JdLPQkC9za4cc9ZsrU55czVD/SfPz0Jf
         I5i7UH85PB1Eh8Ilzb7pydERpPKo7VXXat4SkhcGZzvwBlOWze2ELpPOKEIPGedZTcgl
         f/dg==
X-Forwarded-Encrypted: i=1; AFNElJ8gZLQSuSAqaNa2XlPGfcF7clqdBnqAgZALP5smHsnDPSX4+mgqv90YoZ4HVQyxiuNDRfRtS7HoDyXqlt0CAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYmvK0Ta/k66XWloNeCkcw+Vx+208xMBOpt6893qxx/UTMTg5p
	v6JLNM8+omOEZmSmtqNUrN6YgLX84yIMSw8aU74C2jZ6+kzFf4YECxHauBxiz5s4nEG+ssoiOLO
	Zuv3tMkGI2UmsjgqQFqMxX/ea2yxeu24I5lsPQyb3
X-Gm-Gg: Acq92OE+gKgVViOsyTkLcJvGymzCIYV7P2fb/VcBri5nfwIMOS+wuFIiy/wdXD72sIT
	Tv05EAvSCfARkBzmypNVKFejXBeNvoPsDrGvQWvAGuvdvdEwbTbOnxdKjWiaoQLoVniDGBuGwaH
	Q9Y939xdWbpKB07FTn9PXzK/KN79V6cxf8kKzzC/YA1H3twy3e7PyDim/jBRKhypRRVqvQLo8ki
	mEPsptBR3isTc+5t6otdSm7N6msQeAEUO3m7tyOG2NDzgTuuc7dRXVH2VOfXZoGNaZVwlOoDy2r
	YbKToV2Ls2iAhrV7/H+AVtc6OQ6a1xno1kiA4emO+W6SnYPZgw==
X-Received: by 2002:a05:600c:4708:b0:48a:6fd4:d3d3 with SMTP id
 5b1f17b1804b1-490c2604735mr256052815e9.20.1780929249175; Mon, 08 Jun 2026
 07:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
In-Reply-To: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Jun 2026 16:33:56 +0200
X-Gm-Features: AVVi8CcIi3cKwwTlTgGgsJ-Xp1G8rF_ywOhnIyJiVEE7PRinMqnnIB7P-Avy38I
Message-ID: <CAH5fLgiZE-RM2tEvGYC_niGr4u7XJ8YM4PYSaE-avmxgG-m7bA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: binder: reduce `as` casts
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 8:39=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Follow up on the treewide Clippy lint series [1]. The Rust Binder driver
> retains local allows for `clippy::ptr_as_ptr`, `clippy::ref_as_ptr`,
> `clippy::as_underscore`, and `clippy::cast_lossless` even though those
> lints are enabled for the rest of the kernel.
>
> Fix the Binder violations and remove those allows one lint at a time.
> The first patch replaces Binder pointer-to-integer conversions with
> calls to the strict provenance APIs now that they are available at the
> Rust MSRV.
>
> Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-0-f43b024581e8@gm=
ail.com [1]
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
