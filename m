Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C418A6B2
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jan 2025 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736162997; cv=none; b=ELHidjS9p3hyiZpNhsLFLzmsNQwI77rf6FIEr8IVtnHLliHKuCoYsM9RUjEz4qxd5OiFy3lVZrWUMH9CKYZSB77zf5ALdpIhQZE8/Qxh08RbeI04sKLB3mPdwx59pN6PYY84z21WVoMnj09tD2ykObMnLXkPEYuV40LGXphR5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736162997; c=relaxed/simple;
	bh=/ix8w6evDkpmvVwP9VPDJapgMSv7jkFt0DcdOyafdaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKR5u7zEoyuIJrt/L/8ILWoBy2xmj9INom83Q7zQRAJsZSCWOKNPcQpOxYg5pHdRB3cd2LWgDRdkDTjI5bhNSl9xllDE+kyw2vQUy41rKozdPxT0mO2477X6qgyWUNMWuJRksyBgf+mnxvMmZ54aS74gQYJn9rScsiYl8Rpz4Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h3C/tCDI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h3C/tCDI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385df53e559so11223352f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jan 2025 03:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736162994; x=1736767794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ix8w6evDkpmvVwP9VPDJapgMSv7jkFt0DcdOyafdaw=;
        b=h3C/tCDI/SCoMTPlynDGVXDfbOndu7abcQtC9rh5/bsu+1soVDqds+6oAFTKBkeVxN
         Fd0SH1tXv0Ihqs7nMojYfazDAShSLDgWuklTlwGTgbISmQVmDoW0UbG1w0E9QAKeiXbp
         Z1559itQXxYELB/TLna5Bcio9klUOE935IAB8Am2UzX1rmrxFuHs4dhWckcMoAPC8sF1
         0KoLdGWkyBv6vlNKO7srjnDZnYzHGsSFwqo6Tc0BRlppEzoDOQriSCDq58Boo6c+N32H
         b5JvUcS0FxRiAeRBHr2VBGgNzmgLag3JOSSKb+lXRWWzOiNqMlQ2kaX4jTk+kCDyfrEA
         OXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736162994; x=1736767794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ix8w6evDkpmvVwP9VPDJapgMSv7jkFt0DcdOyafdaw=;
        b=vdq8BAChu4zd1Kp0vPH+g/+XbcGPFzgW+tKozEnTozq+t5mNgPvqUaG+xAVVwQiox7
         dpSCD56D88+FRS96I1fykXdaBINoJsqkjEd+4bRuzozhXg/H4TTS009cq4F789uFqnLN
         Eib9Wg2/M3W2/RnUmZW7l4uwQeK4s6WHC07Cb/+tLQTbqIlTYKR/EPDLjv+CddV3AueA
         LRc27yqldq+AgxeWDAjrFxrcM6So73Hhm3cxJfYUvKi+qxM7zI8ChSc7GRSd5sxZ+x2K
         QQs/C/bCNlq06KuuhpynghQw3jOCYeY3ytSyFYJNxjnTzbVnSm3+918AIfVB6L0ZIiAQ
         aL1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgeNJX2Phemw8u71oEExOOn6KDCGFt/hHKQEm2sIM9Z5kvpVEvABV4segzgtvicH+SdXvMiMjSxyG1VLXzAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy+nK18qo1DwTeNRKyvJOlyUs5k4dFcBGrXR/kSx9hhbsbDuUq
	WFDuW6wh/kTwY7I+od702g2JQ4rB9L/z1XjK7KaeUvuNtrsz2j445PFEkhtXEvt+dCg82oCENkw
	eTtXN8k12hs6rwMzKd8Iws+TzRNKrxw+7hNSf
X-Gm-Gg: ASbGncttUnKaGHXAlTPAqm44zxby7bxaLc6yPO1B2h6Qmz6lsNBrFXlj2GUf9KQbRew
	DmDwO3IBr+uW5MQKJ/xi4IpprPQDj/PevUqAUh1i5vOr429dBSFSrWOsPd96FVAOYg+XW
X-Google-Smtp-Source: AGHT+IGTT0LIINTWIdyF9Q6iSt+9zlbm9FIaGUlaGzWUY/mlvpmOx1CHT0JCs3L/lCr045YwrYpusY5N8t+aTanjbI0=
X-Received: by 2002:a5d:6d0a:0:b0:385:dffb:4d56 with SMTP id
 ffacd0b85a97d-38a22408d23mr56344251f8f.53.1736162994156; Mon, 06 Jan 2025
 03:29:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209212544.1977065-1-ojeda@kernel.org>
In-Reply-To: <20241209212544.1977065-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jan 2025 12:29:42 +0100
Message-ID: <CAH5fLghR16z+2MVToPo8e+Cw2E1dBPSaNHN0jf8R8DuXEH__Wg@mail.gmail.com>
Subject: Re: [PATCH] rust: document `bindgen` 0.71.0 regression
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 10:25=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `bindgen` 0.71.0 regressed [1] on the "`--version` requires header"
> issue which appared in 0.69.0 first [2] and was fixed in 0.69.1. It has
> been fixed again in 0.71.1 [3].
>
> Thus document it so that, when we upgrade the minimum past 0.69.0 in the
> future, we do not forget that we cannot remove the workaround until we
> arrive at 0.71.1 at least.
>
> Link: https://github.com/rust-lang/rust-bindgen/issues/3039 [1]
> Link: https://github.com/rust-lang/rust-bindgen/issues/2677 [2]
> Link: https://github.com/rust-lang/rust-bindgen/blob/main/CHANGELOG.md#v0=
711-2024-12-09 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
