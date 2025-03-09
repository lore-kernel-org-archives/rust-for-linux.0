Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CAF216E3A
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Mar 2025 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741549772; cv=none; b=BOhA+KsqNqr5TTcrPyuev2ZXYPwTQAsscRwUNbPoS6M7E2Y8TtH+FgQM/pZSlf+1EvO/bBf/PapydZfqibaWJaae5cEku2ecF1Vf3xz2m1hAbOTAWTZaxIYhzbmOEoUEk3rqgf+16Xn5BMmf1KgIKVLOxcVf5HlUexLZmK8D/U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741549772; c=relaxed/simple;
	bh=8GwCHxeJW0x16QY6dp4QQYxT7748v6idGfn8r31wpXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKWZv2FpsSx5pzDKQ99Qi/Eg2wn/a14SXuk+pq3ratW25jId2rQNyVZexKMLuhL6TA00f3Kw8Y4yRSt8x/LiMVXHyr6r5aipkS/0hEfoIK9cbERB3n7ywhamCAq3UOJ5emV4gIR5Y0EEe/WGJy1Wsw0TG8Gm0NVQeUC+nqSuYL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIkY+XTV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIkY+XTV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so1032419a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Mar 2025 12:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741549770; x=1742154570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YosOPeOWn15ZMllYXpF7xfRTRClXTvqkgVW/uGMYeJU=;
        b=VIkY+XTV3YEH9/5KPc/6JaigRDFMcDe0k6wKRe1mIBFJvrLq/7x9Qvyez34odh0cOj
         LVJjheaauiE1lLffsbwoSCwNwEFy4jGJ6FRqegY7Wg8yzgG0ryW5O1esXzukr3P1lXA2
         3s6slG0yDxb3nAUZRlffiS+i9M6pgWErMedRBfqpbapolv4cxykiHioepaNq9fL0PK5k
         fe0f/4pxQFUkwvYraoEa3QFAZPveSREf0HyHi0XnolgPu8CPQLXlUaY11/Vtn4pFLDYM
         QFHJbJce14ZeJriHlVYp1HklKdy4QM9UZVUr+ctRIpyoi/vfAKknkJqMLl0b7av1ZxoV
         B32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741549770; x=1742154570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YosOPeOWn15ZMllYXpF7xfRTRClXTvqkgVW/uGMYeJU=;
        b=Y2e2ftQmM4WF4kwcCZ52287jctC73LtKsXXeG2V+Ys5YGVK0OSgvOFnvptaep5kaqF
         uVHdpvi4zYCFner/ijexWA941DlGY1wKUGcabxOT8Hat5Vg1eKUGViY6jHfoG3tFhOOL
         Pf4jRRQ0QvjZsxYf3IoGHrj3ZsGElQL+y3Ulo9/emnfzxf63FiXC4xD1evalUQlZf5s0
         2taKetTEGUOAQt9Yv73R24hEk44C8k+ZsZec144pECx/6TBHaMj8cNDQ5MlghuQanKR/
         nUxFSUGW665k4ZbGY5Vk8hpxo3DsM8La1bOhykBVSUTvNjoTPuEG+UMdT4fkUzi4iuOd
         yMKg==
X-Forwarded-Encrypted: i=1; AJvYcCXhYFQolhgFCfy+FCVDNH+OfEQOjUBImXAi/Som/25snNgx6wCs6W6RCE51BNNv+uy7IYDb5QO2MT/rE8Nh/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHEvnKMCJ0++l7YgG0sUf3xjxx0VfSwBoarmt85Tp2aWYxsdna
	lyWv0L/Oy+j8QOIk3ZyEWvPcwYW7wUEa/25dQFpLm88JldTe3h/9r//gN/2zsdh/qMVm6eeVi+U
	TKRVdIGvELnVwGAJskyuTPShQpyY=
X-Gm-Gg: ASbGncuRNWUZfb530U4FR3dnjIEg7Qpv4FwT7hZovWAXvTBPm/Q/okUHwoA4fEAJ/qw
	CWWGBNE4QtDKxIDhnoUZJCMUxKsVPUXDE1cghNp4DBryi67++FSz2DlEtlImdkjb6seQR7RjVpD
	MYnv+N2Z49U+D/LN/izmJnwvXi2A==
X-Google-Smtp-Source: AGHT+IHyGa+G0ULRmiHvKjMUjL98a1mr1lb54BucaQI4aE1ALiMHJI/5OJtRDHeIAIdOr1lTDWOByJJgJuOsUfcwV7o=
X-Received: by 2002:a17:903:40ce:b0:221:7854:7618 with SMTP id
 d9443c01a7336-22541efb708mr36018525ad.8.1741549770254; Sun, 09 Mar 2025
 12:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207142437.112435-1-borys.tyran@protonmail.com>
In-Reply-To: <20250207142437.112435-1-borys.tyran@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Mar 2025 20:49:17 +0100
X-Gm-Features: AQ5f1JqcVH5VZHnq6bAPzPo-RAINKDnTcmiBO2Kzb_Fjzr4rRiRRjKnJh1rlDsY
Message-ID: <CANiq72m2VmgsK3ecrUPNk93_gwrC1oc4eFu1QzcR6cAtngRnFg@mail.gmail.com>
Subject: Re: [PATCH] rust: docs: clean lifetimes markup
To: Borys Tyran <borys.tyran@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 3:25=E2=80=AFPM Borys Tyran <borys.tyran@protonmail.=
com> wrote:
>
> Clean lifetimes markup e.g:
>
> - /// ... 'a ... -> /// ... `'a` ...
>
> This will make lifetimes display as code span with Markdown and make it
> more consistent with rest of the docs.
>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1138
> Signed-off-by: Borys Tyran <borys.tyran@protonmail.com>

Applied to `rust-next` -- thanks!

    [ Reworded and changed Closes tag to Link. - Miguel ]

Cheers,
Miguel
