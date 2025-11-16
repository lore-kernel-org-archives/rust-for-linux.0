Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F12B3090E8
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763332485; cv=none; b=HSkKDUpO3nHYhZeGGhM5/mNzDHJu9E8k59Czfc60UN9fQ6oCCMt3Llg/w9zaP62QN+TD+DG4GPJzuJyZI4OSGIGRbWmFFgitHZi4mStTlRDLDn4wMu3cRDqUY+ETpSceJ4s8QG6a0WbyEQX49HIfczNysDSYee24hr7WmPiRzu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763332485; c=relaxed/simple;
	bh=ezs41PvvbUYhoMWe+F7GFRbjRiWXvoZDwzny/HAA4vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sq3XaiN7K04fAfIb3fULrLN6nd61KzMkZyHcthEZuUwXYoBdisYNSciXCZoRP0UfjL+m3oFyHpFOhoaD+xYr0YYhH4xTO0YiZjLzmgUXs//ijqjEVOGDRxrAaO5FIJPJkzvuyzskGYZ1ezfoHGEG3fBesMUGVllt2lnPD11iPAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzxzMzy1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzxzMzy1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bceaaed0514so22396a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 14:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763332483; x=1763937283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G32a162Qv8avJnYYfRsUl09AIRbMH7+j1OUcya4VEwk=;
        b=BzxzMzy1dmKFi8jvTk9hq33qrKnJQ47iXfb2CxAMpHVmt8cTtl+WYHaiMihg3lMEjv
         xw4FfmVcOESNIEN8y0chMcxnM9ittzyktAHfYI9gQgLQb84y8dMQtHuGHi9mBxXdj1yA
         smu9CT+yfm68LDtAFkHbBM/fg5SIzKw9xp1ZX8aJ47D+ZWglEL28U/4QZOdmVsgUV1h7
         mvNQREe6hqA2a4N2tYnbeC/nSE2kkh3Q6ZEW5tsyNwUr03jNkvaDNwlA8OwYkbFnXYgY
         06wR+kYUx1aPzQJ6jASv4XQPC+vnpJUgFYJGp9rSwYtYhxKs7eW7+KZyKTYstHbVtbWR
         cL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763332483; x=1763937283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G32a162Qv8avJnYYfRsUl09AIRbMH7+j1OUcya4VEwk=;
        b=cKNIJf1kSkWnomBMhLAdRc2HUGM1mhReWEDDpokGu6OXiQqwiSfBlCIKaRQzcs+ipB
         N+sc4AWPnDljs3NBHznWHOPpiQCxSVyw1xqSiRnAnouMfsPt/1WFrHKVRWewXqaADwU6
         xljNxGs+nd/w95FWrvqQ80v+LG3nT5NfRZI3pMgHGKqRu9bPCKTe8pLVIEmDc4zbQLJi
         G3uXv6CXE4bGv9hHDfwwHYoRe1SFLReJVeSj0JpI/1h0CACf9wbn6oyRmmY47MWDjQC4
         Y6LweOgA7z7UHRABTCEry4kuLJ6aVbiESR2s43IOxQDWhSQ3q6ZXE44jfQVT+pUL6sNh
         Mp/g==
X-Gm-Message-State: AOJu0Ywx2QRC5TVnNTzkFzlOprPkjSoRB2a8tICjpRH3TZUS15Sp6XzA
	I7DoWEuBrLW+IqlxAAwgRGqQnbWZb7SHbXqJ4l42svvfTk/i7GF49wXSFSwx55vjBSIBWjh8Ppn
	ROWOfRoDNHFQJZOuj0j2+5lqWuXMIXc4=
X-Gm-Gg: ASbGncs9ehQpqnMZzM0YGMwzbJwym16yrgfOVZcaPUMmsOaQ5L4FnLb5ZOWUXA0ppgF
	UFOTFc3mIa3hXzOUQ6SoECJ37LYSzgL7Fa2Tzyu26u0tWJ4s63Kizs0BL2/Lh574cTJ8SeHKbbo
	kHMlHUTWyZF+zThyHn9Zl4LjKcVgQFs2TOoaLuUEmlw3DW0i6JDb26hSungTAiODOt+W47uwTDe
	EO7oLIZqZgl3+Mt2iZlZq0Mwgshl4AQvq/0sq5YqvNYT56AhDJnbT9G5XNRCWfoZtwIsXWODgj4
	hCr73CCrFtdKqHOf09WY858Q/2s3FTQ68NarByuk1o2dleSbK8yRo8yGg+RBgc3+E/dO2YQnoWW
	XIK/nrVHFO/CISQ==
X-Google-Smtp-Source: AGHT+IHYI3GU7AzMf6L22y3szsnjMbWFR3GOCwozbTlrtNPUQ35qA1tBE0tsJW0cI4sXFp4CDfuQKcxySab4+5EjqEE=
X-Received: by 2002:a05:7300:1907:b0:2a4:7ea4:3ebf with SMTP id
 5a478bee46e88-2a4add67252mr4347646eec.3.1763332483424; Sun, 16 Nov 2025
 14:34:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014123339.2492210-1-vitaly.wool@konsulko.se>
In-Reply-To: <20251014123339.2492210-1-vitaly.wool@konsulko.se>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Nov 2025 23:34:31 +0100
X-Gm-Features: AWmQ_bk9vJFmRXe52TCGPTi8MtQ7DE-8wu3N8ebtTtaKmDLz_unImKaJvJwmJQA
Message-ID: <CANiq72m67LnE4P8D+yfN3fUfK-NnYDqk9gTvLok=mMSi+bO=1g@mail.gmail.com>
Subject: Re: [PATCH v5] rust: rbtree: add immutable cursor
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 2:33=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.s=
e> wrote:
>
> Sometimes we may need to iterate over, or find an element in a read
> only (or read mostly) red-black tree, and in that case we don't need a
> mutable reference to the tree, which we'll however have to take to be
> able to use the current (mutable) cursor implementation.
>
> This patch adds a simple immutable cursor implementation to RBTree,
> which enables us to use an immutable tree reference. The existing
> (fully featured) cursor implementation is renamed to CursorMut,
> while retaining its functionality.
>
> The only existing user of the [mutable] cursor for RBTrees (binder) is
> updated to match the changes.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>

Applied to `rust-next` -- thanks everyone!

    [ Applied `rustfmt`. Added intra-doc link. Fixed unclosed example.
      Fixed docs description. Fixed typo and other formatting nits.
        - Miguel ]

Cheers,
Miguel
