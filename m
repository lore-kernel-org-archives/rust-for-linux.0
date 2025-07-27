Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685586329
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753611408; cv=none; b=pcg0ZdMzrYkg4gAJI0OdJpGs8tAjPS7oG/exu+bh6uHMsa90UVk+Mcy0pz54ugugF1YOEqfUS8aVDmLGMz+zg3LZEywGvx2/jMZga26g9AmCQe5BLtCrf8A0bAHXPkY4+fFWUU6w6Jkl7TW2/+Kw5ikiDBnTAzqUDfPM0ra3pWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753611408; c=relaxed/simple;
	bh=7gXF/JGd7cdYSztftJD+wHyryWPRVHXOyQ2/0gQV568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH0dErPOtGxHvLwQhoOolaxLcwJSWxyaeaPPqw2SDA1EH+MVSqJBMdCCOV1imHopCPZ10MypRpJLYCv4nxyAyyqZnsirHEqmJ35JHay5CzPfCTW26BbIBjFGyydS5y3wiJ+C7Qg8GdG5m6YqZ/RmvHypOSST0nX8QFHGV4YbjhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JuVwO1SC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JuVwO1SC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso3312434f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753611404; x=1754216204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gXF/JGd7cdYSztftJD+wHyryWPRVHXOyQ2/0gQV568=;
        b=JuVwO1SCQq61r9WlCtKr4htyBKucXYq2rE1R5v5HBd8C2m29pgAj+vA60Z5E1f9Of8
         nS0g/FucqYB05zvhGKDsRZsI6WXgvK0fPA1ZJ5MwMwEnTR+6zJzDUaZpXSjTKaiBAJde
         gO5HESaWYe/QiUa7nX8hLKfFjK40NxdhAbD5HeO3IIySM8j8UQ2FkDA5YnSH30/MQJ5O
         Hk94ihTYuIWVUxYQO41VhTH1XOZT+XPrRs/iS2NCV87amZjNpgCOmpWzNtoO5s/IuxQr
         YM6ErlDzTW9AR9lQZPQ7qMQNziQkmEpaB2C7PU+ISqryagz6D1348YzTBO1vknNVsFub
         OFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753611404; x=1754216204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gXF/JGd7cdYSztftJD+wHyryWPRVHXOyQ2/0gQV568=;
        b=Pvxzys8Fp/jLqmCYN20NI/TGlDskfbT5O30G8h+FFsMdZpxt901PwhzP0q2Ld7i3Fs
         ps/ZcaQab74netYcbsrkTZDqRlmjlGcOOIoEDPWI1MdRwY+rJrVGaWToVRjdvbugfpmy
         HFmUtbVGgSjr7g6Ts0nl2xGK03PQxr5B+42I1aVcIEZ6RI93wBg8Ifv274sF6hYe2e1Y
         Rfhzz5usnercC2Hrugv7CrqhsNN40q5MW7QA3JIgID0K6JIEKbWHnD4sQPsRDBEzHH+l
         W/8wtkWUVK5nJgCYepdVSgsc8cbOewUsPE7Fa4HtB0Lw9Ff/LnNAweR0gCsps27WZVXM
         fD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl4r38pVDPdHgXLKJRSMW0n33Sug2L0rvz7lbEkiTuaDGoRT9yn8ah1qdjD2zNm9aJ3dLST4z0f41cbwYyUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Gqx6D86glgz6C6x0hlGhuf2L0eanu9IBzJiDe+OWREkXqH2M
	tn9P5l7mRSzfEXZgIYwCrkSvo08NxG/h6dBtvjn+t8y4tlwwhDkQ9aMkhRoanxBB+Vb90iBrQr7
	QiQqqiBKllpAizT35WLQnrpJUN8wx8utbwbiy2SyH
X-Gm-Gg: ASbGncstihXa2yQ3cuqZTYmYSLX6HgrtXXTC1WYofS9JbHs0Q2/8J+mF0NdSAis/AiJ
	iDQ7NkC2g7KdnoSpL+10QhF41yvxtx0U0nkZwJdxtM3zksNNDohwY74VfruLaUG4a8Dx7RS96cO
	ZIs2/xhGP9L8VuPX/ZbE0TqTyEHXryI31Kha5SvgCMNwvCCQAjyz/+DRDb1NPk/2LKDwBPu+aZs
	WxDQVDs
X-Google-Smtp-Source: AGHT+IFyrg1ejKvUxd9ZtQSI9909R3ixl5LPHcy5aVZC0U4Sj9RIX4I7zArgs9AtLDU/QcoqDxdQPatS2VjlhudegxI=
X-Received: by 2002:a05:6000:22ca:b0:3b7:791b:649b with SMTP id
 ffacd0b85a97d-3b7791b67d5mr4008222f8f.11.1753611404412; Sun, 27 Jul 2025
 03:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727092317.2930617-1-ojeda@kernel.org> <CANiq72=Y3i-WeygLix6j-sPZwE2QTOkaZDQOrED1aCiMoH3Cqw@mail.gmail.com>
In-Reply-To: <CANiq72=Y3i-WeygLix6j-sPZwE2QTOkaZDQOrED1aCiMoH3Cqw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 27 Jul 2025 12:16:32 +0200
X-Gm-Features: Ac12FXzQd6Ubqwcqmg__eYKdobRTIYZ7Qw-ApZU0mG8XcaNSXbzlilcOMmffJUM
Message-ID: <CAH5fLggeVq83ZPWPE5Thv8LUNrp6pX6sifGBFFbe20W1neWJ=w@mail.gmail.com>
Subject: Re: [PATCH] rust: workaround `rustdoc` target modifiers bug
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 11:31=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jul 27, 2025 at 11:23=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Closes: https://lore.kernel.org/rust-for-linux/36cdc798-524f-4910-8b77-=
d7b9fac08d77@oss.qualcomm.com/
> > Link: https://github.com/rust-lang/rust/issues/144521 [1]
> > Link: https://github.com/rust-lang/rust/pull/144523 [2]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> And most likely:
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
> pinned in older LTSs).

We also do not even set -Zfixed-x18 prior to v6.12, so there are other
reasons to not backport it further.

Alice
