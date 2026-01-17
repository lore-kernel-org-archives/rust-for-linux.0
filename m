Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FAA50095D
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768677390; cv=pass; b=MtDU/+kkSSjMWc2Dcln7Ws3W+4Bthnb0m9Lh47EHpUvIUfq91yvf4QyT/MTC/SPM/qgsAEQleIC75mT+jdX2XfFj7lJKsa0PIze/TsXZbrVOiVdRBucqYELjCzAbziVlo+sbwrBkghmBHIeKblT5rGIU51YZ0TxI+ddBk6pJsUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768677390; c=relaxed/simple;
	bh=4DiBHHOMa7rmNgN5mBKP6uoKz7QQoEb1LYZUGypSC+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ms8BC7MDwuCaR2ntYp4OImCrBLcH60SGh/TOTwgu3m3QAJY1yIVauXIR/9+cpcj0LwSiX7fDIt/WyMtdtjwaYkCHV/Zc2oWmf/YZkXxX14321ngrOHhOuqd+AoGbh4qXhtVY1SFGJuARf+UpwCfQOujJAI8b+aUli2vXDz1rDIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzSBzU40; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzSBzU40"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b1769fda0eso341828eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 11:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768677388; cv=none;
        d=google.com; s=arc-20240605;
        b=VCeDrBt6Wi+S224ttDPdhW/5X20Zt2kqutHP5llnK1yGA2zTmQ9mENM7vC532mXfZu
         RpZtMuqA9jKIOvduBoZtXP86OXMFUVKbaNbC1sGpMCqudBGcvoDHW91HTdUwaSnrQ5Uh
         TNznAbP516Gi3IUUEzaotCwbIzwbQKgko2kEYjfIW9yhIg7H0hy4OLAUnOc8NvdvRnOo
         Hj38SLEjZt/2GaYQ52sMQfWgvGN6c02cMOwV4V7nsxzMOo6CUoCUOec6ssLUxo3yC42Y
         i8EOt+mFUFVh3GbOPXPkhATUSL02iUaW9U7e+57228ZsOswvTeDpDnjEA0dxFQDX/wA1
         8GDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o4bXnfTc3bulKHpYnirejgVvoTinSjCSxxeuBe8eFKQ=;
        fh=1P0ZvsqNYYSgVyxz5U29WvD5DY+oRc97aL4OUXR6Z5c=;
        b=D+CcT8pHlaIcBeVgTKMkiHwCIZJTLvgKi4W3/sMFOi2x14xixvxdjQBGpta4fERmcX
         cpc/RhRymJbW4ar9O/5MKemMxaJCOgdDbFSuiW6hpVf/8GzyYP/z7WhZyLhfNDgcTX4I
         RbP30coNVhwphsgns/aEAYKIQ0CPEOzhSukSfPZa3RK5loT01VEes8Jug/+GDNEGHNx2
         GYk6M1FJmYzzFRJvsp/piWa0n3F5BmsPFyayZ0g1tn5n+sGX1pjhayCZOu1SWFD1ugzQ
         pRnrtkQ1gy3KYkEkiCLOYsKjpJ0TTNBD1st2I2AGgj7LIZkUqWccf+/VDX5FiN/YG44O
         zXow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768677388; x=1769282188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4bXnfTc3bulKHpYnirejgVvoTinSjCSxxeuBe8eFKQ=;
        b=OzSBzU40CIBXUQViJ4oh2p/CWdkuLzz2Jl3gzUL/LwEAV9EMCdsBj3z5PjFVnW6+4v
         KIk9SJxthWVRYbWZLk8cVdOBOzlfREe6bfaKIWlZozShzVCc+75e0Y0jSkj2y4oQmsuU
         rutY9aT1YQUsUCRYXaHgAL3S5/pU1ZFeZmT2+tuQWlQFEM3HneQxZWTM0qeBSkb1s7Em
         RdtdswUzmKpgbNn+iyyrsjcz18xLmpeEV1teg2qdXky6Q8wqMQ6QcnucROcxoJNd7ga7
         rcFboCKdKsDNHxwxkhfvNT1di364xxDN+flEjBfaMPJTFtLDyZEyZmkpxRHWymHK16E4
         HwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768677388; x=1769282188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o4bXnfTc3bulKHpYnirejgVvoTinSjCSxxeuBe8eFKQ=;
        b=TSEYRCKhBSIojIOZb1ffvOY3ODDCnnOv7FPno0JqCuTyFQ4T5YzmS98i3PE9Sd/Z+5
         CzSFVa/jZWT4RfyxmQCBzr6cCUVneUMSrICxSJ7Xcs/4ImeXZca7M/sBQKFb5jANIUt2
         kN3LQnY6SV+xS5TdBg9qhx6U5XhFHTgxjwZarvUHUIv8ugSlRvYmCUFAE0Fnewz9ZR4p
         62USil/WgvpnOWqd2zxFI4d7rlMsm1aEAI1KD5mpyQTPWXTF+yhPPZeQnsfQOmyjjMQ8
         5WD73KVOpXtTQ69sw80q9Ps+OJ/ib6d5wg6AK2w//r53huLr3OsuDd26NqG9UctYL/IZ
         ZllA==
X-Forwarded-Encrypted: i=1; AJvYcCXfosFlp7vRpZmN4xMCMCWNqWycCvn9A8KnN2X6CjM7fx5THlYt2F1z5kFDJTP1K+3zjgBSZ8b1blPq/B060g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfbsU4Os8Mct2b4KMLdSiaNx4ZQVjrIA9cAIvle2SjMVKzlKuC
	7O6fUE0dNIwymiV3ojm8T1EEHRTw3XgEs6vk5TxtSfQ2btN6kBUSHKVD/81a++7L+AYjxGkl2Cj
	wMqo/rzq8dpxFAibHBDP2KqBW8/BhQN4=
X-Gm-Gg: AY/fxX52FwKTLqikA0/ONUsmBad+u5IZleKOmWN7YZRf/GvJwOXicpAvDIPYI04vcgp
	DUNZ9tnGXbUk+xmPE6ISHOeIQwCMN6PzCmkOK+DIwJwRkNIXgHQm67ihp5/1pXKRpw/vl1nZhq7
	fJZafBnvUjDksSamDRcGX2e9PVhKXzyVPtRgfQjMvIzazlseHNn/lzWsDp6ev11IdJut/ozmlPQ
	1UFi44k/KGHmQbFeI9yr07Vk/puDukysUCkk9R55QwBiir5ebA/Fe4bKLIJg2tg6n2/lUSXEaxy
	KIRnB1NQDILLb53b5x2K1ynY03poXyg92EEaoV42AXYmtHYKDwmc/gnAEI+ghUpBXAHTmqZldNM
	PsEKJ/XYfoMCvpohrr7wMGps=
X-Received: by 2002:a05:7301:3f19:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b6b380ec55mr3009906eec.0.1768677387428; Sat, 17 Jan 2026
 11:16:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
 <CAH5fLgjP6O0KTsm+dioy0VUm791zrktLTkAtQsG2uN3JSQFUVw@mail.gmail.com>
 <DFQJEAPGK791.17H92ET2Z9B8Z@nvidia.com> <CANiq72k-69Q2iZ4zwyUZ3QOXXkiUc1zSDeO6AuhyDWnsTWv_Pw@mail.gmail.com>
 <DFR0O5DP2BNY.1SI7IWT0J1YU4@garyguo.net>
In-Reply-To: <DFR0O5DP2BNY.1SI7IWT0J1YU4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Jan 2026 20:16:15 +0100
X-Gm-Features: AZwV_QgJfh9WGHQiq1mPb2Sh94nEXv8IGPJ69vM89MQ4Z0k9SyG0rMTtRIHqH1Q
Message-ID: <CANiq72=2mspecUmNVr31b+hAr4Q46Qg3UbiLKkis4D2WjJzYJw@mail.gmail.com>
Subject: Re: [PATCH] rust: ptr: replace unneeded use of `build_assert`
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 5:49=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> static_assert! creates an item and thus cannot refer to generic parameter=
s.

Ah, right, thanks Gary -- you were the one removing that limitation
from const blocks years ago!

Since we are here, I wondered about whether there was progress on
allowing top-level inline const so that we could perhaps use that for
a macro that can do both (or just use the inline const syntax
everywhere, but `rustfmt` may employ three lines...), i.e. this one I
had linked in our usual list:

    https://github.com/rust-lang/lang-team/issues/251

But I see someone recently created a tracking issue and even an
implementation PR (without commenting in the above issue, which makes
it hard to notice). It actually seems close to landing:

    https://github.com/rust-lang/rust/issues/149226
    https://github.com/rust-lang/rust/pull/149174

There is/was an early experiment on omitting `: ()` on const items as well:

    https://github.com/rust-lang/rust/pull/149738

Cheers,
Miguel
