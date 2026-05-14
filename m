Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278763914F0
	for <rust-for-linux@vger.kernel.org>; Thu, 14 May 2026 23:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778801063; cv=pass; b=ojceJKbiLH+sVFizHhm9UAyRb7kc2ngoibE+RIiGvpbgKEisnYpMfpARvSFUCwgMvFS6ponR/6DXoNNlEFmy/6qFZLTw06JE9CcAOuycIUVTLRFllg/c5liSzI+mq7vE6KxcfzC8mOoYVGp6R/LMQTfSwr9KCZOZq3gJr2wWfmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778801063; c=relaxed/simple;
	bh=m8ZYJsMvzzzpQCdZHcn3IBPYg93Sd/wlXf5WcdxvF6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kuf6/pWgawulq/mrexTefik6HwKTtAtDnWrtYRocm+4zrewnv8bBv9SyMmwRhwgFNDI9XlgqdhvMVOILnOUP582YsB5L7zBWdLnJHoAutwKBf0JKCZCF/9y0HaVCxpYKZo1R6NLBPmmxG1j/eigb98ZrnWHIsCqIR1zlquli4zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhQMOaWY; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhQMOaWY"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f13ae64db1so333507eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 14 May 2026 16:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778801061; cv=none;
        d=google.com; s=arc-20240605;
        b=M2unIvcr9FcCB9Uy18qVHlQYfL19D0c1JNJ38UtsL7cbp0JGes0ca4wnrANB2tGcB3
         6EeT70aK3ql9GLnAl2rCrFa6D9LX0ntrQp7lC63sMrk+iCVg43DNHsgwFh68X6RZGtut
         QIl+tDPKbW1nVzSW5zm5pLla1vL6I9AyN6/Bblulbc8OyNwliJRvQLhL6WUGVEP8Q5vX
         heIVcpd2KumGahJ0CifAazIoVR9Rn/s1/M/uPmUhpBWg6yuueaFZWZvMJaCmpuFLyojP
         q40oRrq8FI394+KKBQB6zW6VOPQVV4AmvMFJ2IhcboEBP0j/pER14txR1CQv8mW94J4N
         F4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iCrvG6gDvT6q/NN1t3exob8czfIU3adNxBT+Aa2Lpbc=;
        fh=JYdUScy3U3cWJJDiB1i0i364fkLH01h/A3GJf6Aktjk=;
        b=fRPpZJzG097bKzQfyYBdeLGM0KyhzPBC74jDPH9na2onxnF/O8HTUuCZQnV1KRr7Wb
         Fm05TjLw3oNd04lbfQz5XVoHbHctz4uXuNeRQrv2n9ThzZ9OTYNoV0NqBNq9SPs4EXl+
         Nhlg8XM6M/5DraMdXJ6lbIjI64zZNb5m/UWl5Il0SOCSaP9+eyO12vljhDyS7GBjL34z
         CFKZA+AKQFXbJsnwQkTtHgBFc/QX5ol45KUIoaXl/kT6miZUmQa0/maKIdwb59eAQS+8
         3JDjIQYcYg0TtsOuefRsAfxh/OCDlGELulcm9dqdTaHwg8bVUWA8IA4syUnuoYw6YGuU
         tIOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778801061; x=1779405861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCrvG6gDvT6q/NN1t3exob8czfIU3adNxBT+Aa2Lpbc=;
        b=qhQMOaWYCOcH+b0Eu1NY4VA9oE6PXZUu8niTeAPOpINO7O9T9sH3ygljvm1j97UT3J
         ge8JacujbRxXeSsUcp983KZnKwXdqnc8Pghk4bASxyS7FeHFFZgyDwrzLtYL3JDwV4l+
         hJWRQG4XtGw8NqX+S/a+v4+nq2/X34rxTARJYD97pKFhjYSeNb3hOPe2a/PK9pGQRT36
         oX3ybUvqUzzV1UiDZB3kDH4DaTWbsVdrBSH31gZPMlgcC+XRr7FqtEIsTGC8KYPw8Mlt
         rD92/J/oORPH54s7TixQp3SY2QM/aC0VbgaLLNdt0rjeMM7FZ78jWsusf2HKQSD9DFfA
         Pk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778801061; x=1779405861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iCrvG6gDvT6q/NN1t3exob8czfIU3adNxBT+Aa2Lpbc=;
        b=QZawGDSsFYDu50TcpV+cu1O/VQMOJBqc3BnxUTl35IoY4Z6KwpHBQSccrUEx4Bfqax
         FqAyZkEPoE6jMCJHuxNKizVbqwcxhakEuYdysOIOvVq7TRBufNlGKrYimmSDJq7fPGsI
         +HmB35V6ijHdw5EUwL+NWHJt+Y+w7s3sBvek6jlYRCVPvu6ufO054MwKEgVlesNJi2RS
         FXQ5AYQceJIAKheTvytt9CmL78k9f/b+tY9lo5v8Hpl1t5hc9ctIMJOXogbqsar+fOwh
         1t5kZQkdyFctzUaJHZERmRfqHYKaAPNiOE8SQGA2MSS/701v2EIqxEbN7epwSi2CqIlu
         no5w==
X-Forwarded-Encrypted: i=1; AFNElJ8kI2OBNbZWnl53KTnGAlQflbxF78aW1efBKB1WR2nYYem5+Y2bklvEXcUempAjpxsH0Nmu1nkJhiPkYRwvKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKfpLn6PbgwX1RFLAP2NSIyPj4/2a+eXAlfcW5u7PdCpUQiChV
	UTTxZQ1p/Keq/g9jWTIg7gqoY3QMfJHr/i7omr1ZiN5UCWlQCV57NUJCTRcoN1cdTnYNupD2fuH
	9TUDZoiG3MTbBLuzM5l87p7wsmvmVM0E=
X-Gm-Gg: Acq92OHZyrsC5njd5pJFh65JbHVGw76CcnGyW+kOSOq3GhKag5QDzGsNV6OkeA/sTBW
	Ad2vfiL8QlV8lKWOgoL5gPZ8XaKOc2kD4UKvdemVTXoDpJlSl+iqzg1SqOgVXoms+e0PYDYbibx
	6a/5XJ5DxEYb/0hUL5cXfY317CYipf+UcS/m7Ltend/WoRAI1uk0c+ueFr3OWaoMQaE1bE2wki4
	5LiFeTjlFbDNYYrOD26JtAVS+UR93AE1Y7xeNgCTCu3a405FhOyeN+9okm4dvbrt9l8q1/sSjS6
	pglaG3dPvPHn4OKdxra9RmSvyIyRRgnvCaeWYdby0g4Ks+EciG2pIVHn6kmvOTRbxklR7nmfe19
	8vZfkTGSa6syLGB9gJ9wJJgCx9HtURCfOJg==
X-Received: by 2002:a05:7300:a903:b0:2ff:bba9:c76 with SMTP id
 5a478bee46e88-30398706533mr344093eec.5.1778801061172; Thu, 14 May 2026
 16:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
In-Reply-To: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 15 May 2026 01:24:08 +0200
X-Gm-Features: AVHnY4L53ARsjRDewJnLSnNGXHTdLumYZ67gHz05fYQmwiowdxVQQXO0c_1LPyU
Message-ID: <CANiq72n7jO2dbW=y0qqkL=qwu+nEt9DS9dYsLhWVSSLuJk+LEw@mail.gmail.com>
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:02=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> When KASAN is enabled, such as with allmodconfig, the build fails when
> building the Rust code with:
>
>   error: kernel-address sanitizer is not supported for this target
>
>   error: aborting due to 1 previous error
>
>   make[4]: *** [rust/Makefile:654: rust/core.o] Error 1
>
> The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
> saying Rust is supported when it is enabled.
>
> Cc: stable@vger.kernel.org
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> Link: https://github.com/Rust-for-Linux/linux/issues/1234
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
