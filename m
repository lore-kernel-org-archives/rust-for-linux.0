Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D859442
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Feb 2024 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708287826; cv=none; b=HozmUn1GQLfHqfAlyrwGKJx0srxC7nlN2w5Uaj9nCjjwJ9Gp1MoUI+3+iGSSsSeMZk9p10Xf+WrazVaGHB1LfArjrOJ5bhZVVrumLqM0bcFVWW2XXj3E3FB6Yq5eIgBUqFdcKEesmga/Gs7/rLVxvrkcX1Ju70kddx73zCVZUZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708287826; c=relaxed/simple;
	bh=stkjmuffPT3hYqNnngWonLM2weEe/fkhz6v+IPWxnxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWDDaV/8QmQsq4YyhcDEyWC5KGfvDsUubJ55IeI9xM/f897KK+Qr6NspH23+6oPJe6Ig3oGKnoaU+8bm6j0O/s9uUKIDsTTWNMyOi4kV8lh4wB6z8hTWvF5UyvNtQg/+Ax0+FGpcqWHAkYmvEbsnBNwoMpK4ybqM0UNhdKiOHhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRvX/7Xe; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRvX/7Xe"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607cb7c44a7so34261787b3.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Feb 2024 12:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708287824; x=1708892624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stkjmuffPT3hYqNnngWonLM2weEe/fkhz6v+IPWxnxY=;
        b=kRvX/7XeZgeg0DP9XfLj46T3+CKzyircnb52plxdNHy9sajA5jjg/+KLx5J67LWyk7
         VjKZhMdAuM52yJPk4DeTn85Vjssyt4COivOe6MrqBaJhXMtuyTwpxcxzOUlCaEF9sPgK
         lqe/p1alw5UVwvLRTd1mPoPMjjYhK5XNXAudz2hLAl/fxnr7jFMpeJbgsAyAkZBvGfOx
         d2DL0/TWhRSXcSLRLKuWXJKPBN9FMTLPAhISJv/IPhyYTMZgDW7ps/anoi2r5wrn6koF
         m6UrsILkVZDTvjyyWSMgECOcPdUkNj9H/PyElqzPAHgK/0i+E9ZaFxedDzyGGOgEJgB3
         vSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708287824; x=1708892624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stkjmuffPT3hYqNnngWonLM2weEe/fkhz6v+IPWxnxY=;
        b=iG+ipK/D6u+vx1c/n/AiflfCKeQzJYoLv651TsCxC9wMxjGoFp/6LFRdGvkIUMiB0V
         8rGWEj2WQBZgD0xnpJSm2LTF+h8oB/3hGQrrPeLa37MHHxHEU9QbbINNrROUC68nqVgh
         tkYKxPwxeu+Ic7zHf9urC8hlfEQojfE3gY+i5c2oizn0d1SpGxm1cJ/dAO6t56rrYrd2
         uE+dqemdt5V5/riZcGeQAG+Y2+o+h/DOtLh1Uiq0I+vtq8B/kf7/6s+M3Rdw+7wTkARp
         4jjyD2/hCSjFr8gQEkFz52wBUmiCliiy+fEYGmzVse5k5vdOIL8ZMZdFodZPd6akh0UV
         lO9Q==
X-Gm-Message-State: AOJu0Yw+TKwFtkYTGPSgdaUoGFZKxqDS4a1rGY/aWH5rrynXaGQcZAMc
	2IDX/WWu0aVqOg4zt7LWCOEyRq6NWwJJpvNEHSPtqwvuIKsbWL3faeXrqVyQoFk4MMe2As/H+TH
	CENjEB/LQW5HzUwyhrQuOGTnRM6A=
X-Google-Smtp-Source: AGHT+IG79+fso5zRiUlUBPBOwGxEEFD8gubKfY7SLsqc3M76hEaNtqhbafYMezBMabrvYIYh6XDHdVcqtKaxmE5FnYw=
X-Received: by 2002:a05:690c:d07:b0:608:2f27:5c0e with SMTP id
 cn7-20020a05690c0d0700b006082f275c0emr1536022ywb.8.1708287824232; Sun, 18 Feb
 2024 12:23:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216152723.993445-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20240216152723.993445-1-mika.westerberg@linux.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Feb 2024 21:23:33 +0100
Message-ID: <CANiq72=edQFxnb7o3qPwmRKh+JA9ngS8Fvv-BpmFYso8jyQzpw@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: Order headers alphabetically
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 4:27=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> As the comment on top of the file suggests, sort the headers
> alphabetically.
>
> No functional changes.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to `rust-next` with `Link:` added -- thanks everyone!

Cheers,
Miguel
