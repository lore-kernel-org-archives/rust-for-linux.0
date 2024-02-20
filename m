Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F026A8A9
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Feb 2024 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708444482; cv=none; b=u4NAbcLq0CW9aVOF1EBb44aKCySsWhRSQne+sF+0uAdW2/PnU0rtdPNqZeeDlLNLd2m5FFVTu/VEWyi4wAMAM/WHKy51VvuFfbj5LdkOnMYoFJJM47uV12SypSRx6+XSeJ26GP9qMWhR7GNRtwbCGem+7ci3wKtsLxCD7uD2Bsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708444482; c=relaxed/simple;
	bh=wY2G8SyrLcP3dvZVVRkXsb9b9s1PCn7dcSy3Mcdr9f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWR2GeJw/fFveH8FdUcp1uU5/BkVj5feSb9FPaSO5M/qY/hXFyi5CUrF16hu5J1UAaLV/wuL0LJvort6OMw0Kauly10XnBXM/J/f7l6ReL+r1Xt4XNOWDKoWXbYv3WjMuWQkYVqaUuY34smF5kViyEcGLDkksjQJCKnzqn8/2Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZl2mfUX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZl2mfUX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e45bd5014dso905195b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Feb 2024 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708444480; x=1709049280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wY2G8SyrLcP3dvZVVRkXsb9b9s1PCn7dcSy3Mcdr9f4=;
        b=kZl2mfUXyoXquNIXG6M2fJs3nS+RVSE1mCAdZ0o5mJZf7Zrb0DvNz5T2zzbewxFSRc
         CO+RDfPyPrvQA2u27/p1u9V+sRdFrRze47s4QFGZXO6kB/kzBNIGy+Re7GW46YfO4WeZ
         Veii8EnNoK3o2qj+A7tRaIuY+Ew9lfrCxyQK3LuXgCkknPdaJv10fzRSpgJMrRfT6+Mp
         mI0Wwh0Y0uhZU4O+u06zTi+YSbj91aC4Hq4XZVPbKWSqTtCZCRsm6ciJMgiQwhZhnj08
         5PriC4ZYSNv4R1GV/gA7oV+n5pibcYk+Hg5DzGn0bDffzsuCpDzQ+Kk7hBn1C9ht+JqI
         ZRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708444480; x=1709049280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wY2G8SyrLcP3dvZVVRkXsb9b9s1PCn7dcSy3Mcdr9f4=;
        b=EowamjgkQFEp5zUoSyjfcqRx+iaL6RbohF3gtRRIf7fRY/AMEV1py8mU1AtbSlkLqJ
         cB5B0HuVaGAph86cwP9vR/gOTDnkAd3RwKYdN3ubIf+FoMJLr0ucB73SmIZZ+ON+9WO7
         ztejdlkmzeF3YuudGZ2jvUXV/unKjYTKME3Uc6B/CGHCob2QKUyvq2jBrIiGZhepiDQ2
         JS1SQhEtHt509p1BMykBnKRAyUnYxPQWVmJ6TX9P2VAHKpSAZXMdT92gTot5XiwPAW7h
         5FPt6YOQzBN2Zutc90g08T0zz8uWobelGc0IlOzv46V8lB7c3Jq4TTNTLlfHqD/sL9ae
         XMBg==
X-Forwarded-Encrypted: i=1; AJvYcCUmoVswgX+Tyj01ymLVD5HtcK1jKxq5+Ol5vHhxO3EIoTk05t2fZUFfRaqHyUi76Qa+ScJnQvBMhgBk1Xo8H9ho/J/cHqgCu8GoyOQPeQs=
X-Gm-Message-State: AOJu0YznaSbq2d68rm6jbR8xW0mOa6WEWNCyqwc6Yu/HGifU8UzpqJuj
	dwdstJ/Z3vvh6iKB7fdS8Hl0FHWqXxsJn1pgvOaeWxSdhDvaJMzTo2rUqUc39vzEHm6w3ajbuU9
	v/c1baRF0khp/xNp1iE+o3f9P/v8=
X-Google-Smtp-Source: AGHT+IEkcYiS1esQsYns7CFH/q9yeqQzWKbqyIS8KekJwjeja+rfPOoXs7iaR5GeuRhPms9cu4tgTO/pMZX3VidZZak=
X-Received: by 2002:a05:6a00:3241:b0:6e0:4556:4a1a with SMTP id
 bn1-20020a056a00324100b006e045564a1amr12018747pfb.33.1708444480284; Tue, 20
 Feb 2024 07:54:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217153315.56128-1-mcanal@igalia.com> <CAH5fLggPRcPc-5C8JY5FR7jQMbdNoc89EU0_QAqhG=6HiySZ=w@mail.gmail.com>
 <83571d1e-5710-47d6-9a6c-2a0bb5ab5e5a@igalia.com>
In-Reply-To: <83571d1e-5710-47d6-9a6c-2a0bb5ab5e5a@igalia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Feb 2024 16:54:28 +0100
Message-ID: <CANiq72mvqfu2akoMGOj-N0tUOAnvTMOBN1dYA7CZxcJqpd6Fog@mail.gmail.com>
Subject: Re: [PATCH] rust: Add `container_of` and `offset_of` macros
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Asahi Lina <lina@asahilina.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Gilbride <mattgilbride@google.com>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	kernel-dev@igalia.com, =?UTF-8?Q?L=C3=A9o_Lanteri_Thauvin?= <leseulartichaut@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 10:57=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.co=
m> wrote:
>
> Thanks for your explanation, I haven't thought through this point of
> view. Anyway, any chance we could land the `container_of!` patch as soon
> as possible? It would be nice to have a common understanding of this
> fundamental macro. I would like to send some patches with the DMA fences
> abstraction, but I would need `container_of!`.

Would you be OK with their version? If so, I could take that one; and
if not, we can discuss what to do.

But, in any case, as Alice mentioned, please feel free to send your
series even before that. It is anyway a very small dependency that
will soon go in.

Cheers,
Miguel
