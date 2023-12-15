Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64821944D
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4A4ht8jm"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4b2cdf382d9so156448e0c.0
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 02:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702636087; x=1703240887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFkrN1vK3BylaBocXztGHMiijGax/EL/4gaHlS2BTvM=;
        b=4A4ht8jme8JDkdqLMhO+eAuWQPted3jVl0gh2bPWcADF3jlNsGJ+uEZEzuPXfVvnk1
         OsKgQdwRr9Syv9yYInmliQDGz7ibeB3CIWBN7PiIZVeBs3kR0HrABwfF9SwMLzTVsZ6h
         O5rKsHz4rEyin4B1Xbzq8P/Ik9+o4Reh2W5d1E0xPtB645KWAmfImiLFwMuWVEgW3hy/
         YIZhrPkm3uFPG+8gFlqVmbH3mKv2+ILG1yaao3kQ3zWxKeqmuiYD6QrAnK4uHQMEe3L6
         dqFWRHuPIeZ6tDgfcdMXGGfz/rg+e4cLjXBuWfNjHQhpeEwG1fTFzfJNVagaHrjmwKs6
         MzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702636087; x=1703240887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFkrN1vK3BylaBocXztGHMiijGax/EL/4gaHlS2BTvM=;
        b=Jd45pf7CsrG3MQJlzGxoudD+K5ItoMD60JUHP8R3iasilQg8jpsLj+i03mjOxaMipb
         EmtQlp7cbodqW16BY2OEaWnR85pp1o5+aQaNhEiZ3SRuhEIFMOxn4iEI8XJcFrdpL+oR
         dTyS50qaaywEpBZT95Jy7DAilxdHbyg/r3J4iqStNx+c2mukRUNbnPyt+J7QR4G41U+M
         MZgOVbsoFf5kbcrMGUFWvxZXgnshUI+29vmrJnmgYwe9ko1BZtV2NoMooAiCRzcWRZri
         E+V2CATuPsYknl4mmegTkhaEPgiZlmSVPpgeYUX9Yh7rL3Phzj+MDno9U32ZLbw34aRA
         YiCQ==
X-Gm-Message-State: AOJu0Yx/gMCQiEOtZryT0H2U+aqizRsbm4VVqVTbt3WT3hiD8vlP/iR5
	P0lycIC9zkPv48fhGERoMz8omHdAQVBsw0Q0ZY6V4A==
X-Google-Smtp-Source: AGHT+IHrgzg5Xy8glhNabG8mQDgwQ4Syagis5L66d9FePm9gDh1kQJ1PjnOm/F0wHWssEiQYB+/rqg/OdCr/s913HTI=
X-Received: by 2002:a05:6122:448d:b0:4b2:df58:7de1 with SMTP id
 cz13-20020a056122448d00b004b2df587de1mr9223620vkb.23.1702636087417; Fri, 15
 Dec 2023 02:28:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZXtebif2S1CyJRik@boqun-archlinux> <20231214200421.690629-1-boqun.feng@gmail.com>
In-Reply-To: <20231214200421.690629-1-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 15 Dec 2023 11:27:56 +0100
Message-ID: <CAH5fLggriMBLWVx5i1efHdiNveVutvRfcA6mydNV9egzEFnnxw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: Makes `CondVar::wait()` an uninterruptible wait
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tiago Lam <tiagolam@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 9:04=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Currently, `CondVar::wait()` is an interruptible wait, and this is
> different than `wait_event()` in include/linux/wait.h (which is an
> uninterruptible wait). To avoid confusion between different APIs on the
> interruptible/uninterruptible, make `CondVar::wait()` an uninterruptible
> wait same as `wait_event()`, also rename the old `wait()` to
> `CondVar::wait_interruptible()`.
>
> Spotted-by: Tiago Lam <tiagolam@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

The diff is a bit hard to read because you swapped the order of the
functions, but LGTM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
