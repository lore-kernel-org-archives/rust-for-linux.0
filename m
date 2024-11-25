Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF6C17DFFD
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534946; cv=none; b=koKIM+bX9So6dvY3FYotx1CdnDXz2xKWaDK/0KUjfyR68tDOIK8sZkjmd8nTVwAGT7cEoHOTrvL9+ESxDQ3iibsza1bDyOQZNnYK5qWfFsZ4599gs7sn9LXj4SQdkI3R3NrQAIwT6peLxjpNjGE7j9o+Pxl1xeXqFCzcOcojeCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534946; c=relaxed/simple;
	bh=lGiZL/wfSqMpbtxrz+HjSi4Ph2BlBvD0OqZ+W8j4GzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYoyg7450dl9BcSw+VYZrY00xHzEDtSy4xbXCE2JrbWQ0qNstJ2M2gtXQ7IGooRb0UxDm5Vg19e0Y7NEwfT1Jvb9hOvdVOFH2MZSkIFHGj23EId8uHl7OrMi/p58xBo+plyF+4V0dD0iL30qfhllN+lKhDsSu4tB/eoEtQqa1WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zDIfH8Bk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zDIfH8Bk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38245e072e8so4381633f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 03:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732534943; x=1733139743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGiZL/wfSqMpbtxrz+HjSi4Ph2BlBvD0OqZ+W8j4GzA=;
        b=zDIfH8BkPQQVoSoW08w/moDJhowlPU1fUMTf0qMNqLFojbce6IZRhDQdzWVT5MNlAg
         yVSJsNAbJB8KCfIG7o5gwY3/FN0IqN8DaguVZeW+f7kcztxTfllRSryEvsvavwxKt+Bu
         qrREObcW+hu/h8kfVL7ddfJoFZgQWi1SS3+fjyM/P6JDRpPHHdLHN12Lt+XvJcV+1VMC
         +taZM9Mg/XA9D8ZMuAQArhe/W3YjxtY2MuHNW7zRCF3xJU7bQaahB7rfEWJXP02plJPB
         fj/3P5rRPt1BZAMTRuRu70gG0Ss081kQknoj5LSa3sKrjO9Xjjf4tFfjGQ1nivIq9QOz
         MOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732534943; x=1733139743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGiZL/wfSqMpbtxrz+HjSi4Ph2BlBvD0OqZ+W8j4GzA=;
        b=dz0Mys8q8ois5xQLQfwYFRTXlUUDBIi8wv12ITvibQUWrUDTLtoP3FCJd4t+ZGXpVb
         WWS7mC8vfncuNukY1+PTS7S/ImKtHA5EZ+EF6+OiC8+UtUF35ZWXO/7jyY+C/xYybMTr
         2dTum2IYUMxqPvHrc706v9OSPMRdqetZqhKigtqZrb4qVq6PXVMlvj4B0Y0tr2ICHVPV
         GU3yrg3PrBHYoWd7KDQsq4HPgeAfsuR/TtT6XOX1O+LC1rqyOkkJWeeJYY4xvL86G1W1
         Ozn6SskRcesJCwDF7iLl/6sKU55dQoM4oCdCmm+3biiPKbnziD8Rk0KQhQ5NEun8f+l/
         5zsA==
X-Forwarded-Encrypted: i=1; AJvYcCWoUP5eOtjA4xpfoXz+VOcUtuDFecZ+9ExkOfdfzh/QlE3z4Dx+ORcRf6OTJFdBCJ5ViBIX/43lpabdl7/BtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3kpjID7zxGfXUOBTyWsc0J0btxZhSaQlw8NErxFapyibvbhA
	DLuw7EpqtorSHmsJYFt3URL0eFQiMWXiXgGHzM7SoHFWReMhvVJ4UM82olUYn1neeqY6bjnMlsR
	hmoS/EdnscP18+AgJLAn2mmy+IKPGwbGRrUq9
X-Gm-Gg: ASbGncu0MZHcPzHP7Odm/OrPeFuUzh3BntpV6xAgkLDxs0TeKnlNUuitnyxKDK0hiTM
	2OQlKUGivF4FzSJSXBtbVu7hGMTtsbBhoX6E05Y+dsY0xarIuVV7gXN+IAZiZcw==
X-Google-Smtp-Source: AGHT+IGf2HG0twCOn59k3mKeQUbUfcq5Ju3XEcMU+kkIHUhs2x3uVXkjQTjmXcwIFhCDrQDSXythsEDI82q60fBZ0/0=
X-Received: by 2002:a5d:6d8c:0:b0:382:51ae:755c with SMTP id
 ffacd0b85a97d-38260bc6d05mr15535282f8f.46.1732534943369; Mon, 25 Nov 2024
 03:42:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123104857.49385-1-daniel@sedlak.dev> <20241123104857.49385-2-daniel@sedlak.dev>
 <CAH5fLgjEnugoWErZn2ssE-x0eQW+SyuNFsL=_AwKtV0oQS0ewQ@mail.gmail.com>
 <CANiq72kJpQBUTEkEyNgSt4iYe6dDcAvCkR82A4ZSGeEiEdkuwg@mail.gmail.com> <e83d6617-ef4e-478a-a274-766b0834ccb7@sedlak.dev>
In-Reply-To: <e83d6617-ef4e-478a-a274-766b0834ccb7@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 12:42:11 +0100
Message-ID: <CAH5fLgjj5z8WdY8v=q9m7b6diDMcYrc2R486hxDXHNAnb+sp=A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: modify `from_errno` to use `try_from_errno`
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 12:31=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
>
>
> On 11/25/24 10:27 AM, Miguel Ojeda wrote:
> > On Mon, Nov 25, 2024 at 10:01=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> >>
> >> This changes crate::ffi to core::ffi, but the correct thing is to use
> >> crate::ffi.
> >
> > Indeed, this seems to come from a bad rebase on top of the latest `rust=
-next`.
>
> You are right, I was developing this on top of `rust-next`. I get it
> that I should be developing on top of `rust-dev` right? If yes, should I
> also include the base commit id because of possible conflicts?

No. Developing on top of rust-next is preferable to rust-dev.


Alice
