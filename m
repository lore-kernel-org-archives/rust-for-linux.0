Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623404418D8
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880205; cv=none; b=VCLv3SriBYeJRyPi1OaE4+B/MmvmeFIaNBQgKEVveevnEnAS8UtArHPzI5ao38KuGdqyKQpMaAB/Xnf5FnBx6oumVkJC3g7CrxWL3DCVf6hEhuSaruWtA7S2METfOITBwHREEYbmOqkdXwYXqyhagfIWNPekpmC/AojrStIyae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880205; c=relaxed/simple;
	bh=pZ8sWmgn5Szz2S9wM8ZeSlEMU+2Rg4zjY9JZiOFFGZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YHHFVShtOzVJImYL/m7Wk0zODYCxdmvFv/4I7T9FJvRyzdC8oOQMuaRA+VB7MB4MLeQhsIgQPGhqtMtySYNlhijH96APk3YMmTc59J2fmbbwdbYYFESOnv8Wef3LJz/1/S6146nsBeK1Z0roQ+xh/zxyRamqOJA0YjRIdUSSf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivv0g3zJ; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivv0g3zJ"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-121a15dacd1so240406c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767880201; x=1768485001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNqmz5VIJro5vLTRF9gMBu7RK4uMDgE6f1BI3kJZrQw=;
        b=ivv0g3zJwtN5MzveBkQAQsgztPWMscD6T159X0ZU1pLR8vtY2McFYeLuCKLKMNUnVf
         5sm1pFtxzERhmZk3nX+Hrpgj/MMJpZ0+r8rmK6RwZzNr7o2udgSW0uk7ZofvxTUleNhk
         rm/lWiZHgEJrrZuIvAC/KzCUlSbdRj4aSihUo7yO8ICv0mOixnVaz9rZqMva8RlIfL8E
         RQjgMVhlkVcWw8TZPm0x/H8J1AxRBrRwFxS4L6qeiM2mx4w/bzi5XgXi8UHE4nAOTjt7
         J41zxkGrSpXijqAfPe1R+Zi2AAMFuNfuEZGr0TPEBGqre4YhzD0Xlbp10wa9Fu58SG30
         UbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880201; x=1768485001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lNqmz5VIJro5vLTRF9gMBu7RK4uMDgE6f1BI3kJZrQw=;
        b=eb/DfRNTVnJajv1tSBbAmX0QOJ3A46oaTiVt9l/3EJekL2fUXBe84GzvgH0lYsrGtM
         G3OAuRXF9sFP17wUujq5UrYEq+fhlZ2Witxl96EFvo4YiRREU6vB33i+rQqlQfS2oWkk
         0fdrKoHTG2vfh6cbr+rB8Gf3Z/k7STp1HqzhKIvlWdK/DQwo8Li+3co0bGxmAEZnQpej
         Ud0ACJZrdKCGWRQDxVJYtG3BwNJ9rUC9w2QDr9wDFYMGtJf4wTJJt1dqdoVNt5wtXyLW
         niYpADAMEsMQ27kBu0bNRrJwKrC/C5Xf0qoY4vj+TgQvA81TVY2BG4izrKb4aWlpmbVJ
         jECg==
X-Forwarded-Encrypted: i=1; AJvYcCVxfG+mElIeoWoVmjsRAk/5Vlo6hlw7CU38nAQy0eibtBTcA+OzSsMNJYyXfj6TXrxwVN+wS5bWlin50T4W5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxocNPufZqWa8SqIk2+F3ZtpCX+rFI31ZiwxRlwdkkcU09h7O57
	DTbhaYS7Sf/yQW5jGYZfrG8IKQu8+IdyTfOk54XsYtNqkA1QFTYvUu4TYmpeuUrE77IWYBwXPAk
	WZc0kSAJOj61ONmF2knXSFeX2odZGtDQ=
X-Gm-Gg: AY/fxX5u5PajbWA6GKUHn21z5/DF4fqdIjzJtwAVBTovXNdNiUV7cmgYXfiTkPvFMu6
	vk1yGrWeClfqNBkRhlwkrydG2wdlK4NOpw0bT/8Hu/NPCLcZ4SDOl7XHOSNGZgomiv2QcdRz9Pn
	P5obqHRHPehmn7aMgrOAYtiPQlOlrLRjoRaGT0D5nIm7KufL5rkA7FeUhDXxpIhINjC8oxv89WK
	OXNoy8mqcTueu29Bz1m/l45/SOV6eRVMmJYQpc9N58pAgENVePUqQtLvEMq1ZgPCxBLvVykotWA
	UGeSWjau+CoFy7LVraxLlPwSa7sM69E0dPLKku8HHRwTHBpkLHxOD4QOPxSsYilY+yFA1wZ/Lx2
	0OcSN/43JlaL+
X-Google-Smtp-Source: AGHT+IEf9VXNdpjywRFf4w/O/Nbcw55l9wMQR2XTrKMp518i7tM67NlvcL8MZSEGle8gb0yrWDNNafGEgxFZDu5ILjk=
X-Received: by 2002:a05:7301:2422:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2b17d23c5f4mr1920286eec.3.1767880201324; Thu, 08 Jan 2026
 05:50:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107143738.3021892-1-sunke@kylinos.cn> <20260107143738.3021892-5-sunke@kylinos.cn>
 <DFJ6P0ITWD1O.2PAYKPU63UFFC@kernel.org> <b69749e0-e66d-425f-9d95-2d1bd4104e19@kylinos.cn>
In-Reply-To: <b69749e0-e66d-425f-9d95-2d1bd4104e19@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 14:49:48 +0100
X-Gm-Features: AQt7F2ojznbjt0eB09XGOEyPyR-nyV2pLf2UI9BlLq3Ug1ABy33etzDn1uq85Ks
Message-ID: <CANiq72nbBKpa_n8i1pwoC7yiurDYJQtY1efRqkvtXMZ1sXSfJg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] rust: add RTC core abstractions and data structures
To: Ke Sun <sunke@kylinos.cn>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 2:17=E2=80=AFPM Ke Sun <sunke@kylinos.cn> wrote:
>
> Yes. Dirk suggested doctest in another patch series, which I enabled. I a=
lso
>
> run clippy checks and QEMU tests for every change.
>
>
> =E2=9D=AF cat .config| grep DOCTEST
> CONFIG_RUST_KERNEL_DOCTESTS=3Dy
> =E2=9D=AF make Image CLIPPY=3D1
>    CALL    scripts/checksyscalls.sh

It may be hard to see without syntax highlighting, but the code is
commented out:

    /// // rtc.set_range_min(0);

So that is why the example "builds". That `rtc` variable is not defined.

It is also not well-formatted.

Please manually double-check.

Thanks!

Cheers,
Miguel
