Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7871DED77
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734535434; cv=none; b=KWJ5yNMoxZBj1uZuwfThTOl/uyz8rcneYsb7nmdcy7xq2F1oQYvKg1nWa1syHMVCvWgVVAgdvfattG9F2wFbyAXk4JQLbJ2pQW0NfOjtCePwzhk7Oj0yP2/3gAlocqU9uobZ8xy2ZbufEz41EHm4dyFznPzkY03T/Zu8F/yXi3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734535434; c=relaxed/simple;
	bh=DNq7Lk2bYTwQPo0SyeRicIRJd6aEhFuglBb78aJKmKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WP64En4oDd27KgOTx1WDiP2pdbzPIPfTDLfBaLFeZUUfE8MTDEyuKjZpl7QSzvGFmNRey20vzYn0K7O3wCSSfrdyAygO3intd1Mu5Ofw3kATr8WMGvSJ0nsguh6jnurvZyZr7/8jfmuqZ6d+jcVIdGP3DDwJzn1aUz3s/rWLg5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/sQe6DQ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/sQe6DQ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fbb47b65d8so450508a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 07:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734535433; x=1735140233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39NWRak2WukJLh5clXHV6ji1ik6VX+myteen2oHPd7I=;
        b=e/sQe6DQ77eRstpdsNA4Q0+TJ7oroQaURi9mgKfdJRqXfpwSJSu0ajkanqRZ11GnYZ
         tIm6DPeVi6+B0DeXQ3n7qUez0THc+Pqqt+Ns7BK5nlZ3qtztGJ6/E+WUiUxnNxGtYZXw
         MaF/0bhBrsEls4nXDr6wEYa42DZg2Nkro1kj6Q6T2h2hhDNtRhXnhnZpFfWuiYz20IoE
         C2W13gHzXtIUP87gpnIIBzlnGrcw7MUWXMNgN1P6lWnXKKK8HhVPWRE/UKnFnIG4+nGI
         OSiabIT3YS5jryQX+QCuN9ih4612YkNxwbPv/h98zemRf0AhHabkO0CDwNXJywwpfw/G
         yZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734535433; x=1735140233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39NWRak2WukJLh5clXHV6ji1ik6VX+myteen2oHPd7I=;
        b=JY4LWHStSkEbYpUcjvTpJ8vHmifvNSk/YZ5XV0F6dkl3XRkb4BN6etLDXq0PXrBwml
         bafp/+YNdWKBDOEf4p6VHt44d90haVJ2rhvEEySZNMjVBaXeBklPXxSnlQYwV7mvf2dF
         QePegKovbofE5BqoVczE5PhDiyewr2kWmyxBB0xTIndbXYSCDK81i48XBKe0HsSPDBXB
         nJ5prsWuOT5zFG/4Zv/fiU8gbhgvOwAdp3W59SNhTjPS9dRZ7cDaDP9BTzROcopuV5Py
         ZueeKNouuFf87WZEMu81JnpfT6/I7saxJxNeFJE2jEBP1RooqG7fas2Qh6qoS6UBoGA7
         0nzA==
X-Gm-Message-State: AOJu0YwXCnxlgs9xIOH2SxJY8EuHgx0dh+6MyzC2aZ08e0Inq2APg1uj
	KJb803iJc3WlhRa37ewPRdmuJu7W8mPzUj7XtSneQbc/+oFH5PteTUvIAdWLyVC9yLVW39EnnQn
	sjyNWQTGVZ7hM1mal/uHzs3SX+UM=
X-Gm-Gg: ASbGncs3Qd/c+oVnAo6NPvqkC6LwpIL0JN9Rs3n/9S6LE5VSeuRFagXm2gjJqOJQDPl
	XCcwH/7wuiVi52qny3Tl03R0ePFnAHCEmbKa9jA==
X-Google-Smtp-Source: AGHT+IFyoegCW8xq0lZVuOL8Z2XxGPYmqHljtBjf9YS80pXvEPQ17mCtRBh8WUf4R9drcL/q2bFLrPg8tkC7GefXrSw=
X-Received: by 2002:a17:90b:390a:b0:2ee:3fa7:ef23 with SMTP id
 98e67ed59e1d1-2f2e93a6740mr1785144a91.8.1734535432579; Wed, 18 Dec 2024
 07:23:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZxkcU5yTFCagg_lX@ohnotp>
In-Reply-To: <ZxkcU5yTFCagg_lX@ohnotp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Dec 2024 16:23:40 +0100
Message-ID: <CANiq72ky6wPLHRnZ2pUCthZ0oDOXBwC+bCbqdYYu_YoTcQ0wqg@mail.gmail.com>
Subject: Re: [PATCH] rust: block: fix formatting in GenDisk doc
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 5:55=E2=80=AFPM Yutaro Ohno <yutaro.ono.418@gmail.c=
om> wrote:
>
> Align bullet points and improve indentation in the `Invariants` section
> of the `GenDisk` struct documentation for better readability.
>
> Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Yutaro is also working on implementing the lint we suggested to catch
      this sort of issue in upstream Rust:

        https://github.com/rust-lang/rust-clippy/issues/13601
        https://github.com/rust-lang/rust-clippy/pull/13711

      Thanks a lot! - Miguel ]

Since it doesn't affect the rendered output as far as I can see and it
is not really urgent, I have put it in -next. However, I kept the
Fixes tag -- if https://github.com/rust-lang/rust-clippy/pull/13711
gets merged and we start using it, it may be an actual fix that could
need to be backported eventually, so it doesn't hurt to keep it
around, and if it gets autoselected, that is fine too.

Cheers,
Miguel
