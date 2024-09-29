Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660A21F95A
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 20:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727642203; cv=none; b=DwK0BA7oX8qEUCL/SNHPSjhJZACIpkCqTmKlltMKRCEQiO9rK6vb8IuBjLL5miLYgFDYgVLnbTPXBsVlxwOFsZ8AXpiIHmoQPDTtbOlqhYm0R1rL7ruErUEkWLPBULTJW0yLmLgSCY8jV1SW/7YRQmjssNfBb+3ijufFhMwQnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727642203; c=relaxed/simple;
	bh=yJvKHFVaWy+U/hapM0yQzvNmizf07/FN1eL92Wgn+Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4L96CfFXQBtbSe97cqIkzaCkv4G22nI9juEZLF/Ar0o5KsHqx74EY+iQMHP/dEkoKWsONzPJ0LaTwruxWy8Q+3cniSdLyW0XeDoSh8bNlWosM0/5vB2IAef3ZCuBTDU08V+D7zXPBrhjvtB6OjYT6MPXxSiZDB1w2JEE2wGud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=RJf3Iif9; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="RJf3Iif9"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6c3f1939d12so30094677b3.2
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 13:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727642200; x=1728247000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVnHMnmiF+13daBSttLD+aIXUDJcxVgtv3MA41ELUOQ=;
        b=RJf3Iif9Spw6qAqkijtvucZ77XCj0wBbyMDahCjzLCafo5+WX+2IwfmbMcQn2Vif3C
         4CLXqc57GWQ3BZausJoOs9yA/euW10Qr4s5EpWQkSzJtHsgp5K4+P/bOGWx7/17OSZVA
         n4oL/rw+qapRXH0JTi14mPU+nZ8L3yAeQ+GwNMIkNxgyulYV0AMQ2Z//+kPANVl/RLba
         Vqbb8CkJ71cKvgFp9oHyVWr7K+vn8LxolOFP0msLdEl12Rqa02lc0d09NU138oC9OUyf
         CLJCSO9W4Nm8xSk1UGc8ecgqOcO5hZONpbflr+WBatCp4cinw5K0uPFB9XVZj5JRFpiz
         u9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727642200; x=1728247000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVnHMnmiF+13daBSttLD+aIXUDJcxVgtv3MA41ELUOQ=;
        b=mBGjxRqf/J4sCcOAg7h41UTEeEpE2BwljV6VIzE+7doH9bdoQfmc1h0H7uYD2C9Ygn
         yWAZFe+31esFrg8IwR7LI9xaDPAk7ct1G0fn0lu4I8FULZvROO1ajv/xdHW4MiTKvmmG
         IweYC8u+55k8aNLQdgzqpM+JtkEoQcsQUQ+5GegygkJbitc5A7qpDRfEqJtuYm0T2LBh
         XkZ4yOCkHYPXMJgTm+ARNgKfMS0hO8VRsJMXfW2Jc1WqVaYeyvJYetiXPMolaWMTr7KL
         Ix4I3HwsTz2vvWvMQjsn7suTV7KlXIuog+OdZNNjfZG4rylCRHDP1T1j7CENQS1gUG6u
         GDfA==
X-Gm-Message-State: AOJu0YyNZjNKeyXHmLsLvBpz7Mqo6uz8qO3cUcX54m5vPJ2IVotpKyca
	IF7WbROMQYwNrIeLzfVfLs/7SxCNWwzntEejNg/OC+EK3qi19TGe6oqEeYA+PvLeiulLZeKx8V+
	Hej1LSAoCLAGsOQBkb6/tJUE+CAuAGh2aKfw49w==
X-Google-Smtp-Source: AGHT+IETCze3KtAe+nbUVqoRMjK6sAQNLok2M1rHft7+nawFMwPHyIKRFgxqTTpRzDf2ozXAHljC8Nhw9SfgrzI5dTA=
X-Received: by 2002:a05:690c:2905:b0:6e2:1062:9b90 with SMTP id
 00721157ae682-6e247619bd8mr54586977b3.44.1727642200296; Sun, 29 Sep 2024
 13:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916213025.477225-1-lyude@redhat.com> <20240916213025.477225-2-lyude@redhat.com>
In-Reply-To: <20240916213025.477225-2-lyude@redhat.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 16:36:29 -0400
Message-ID: <CALNs47u56oVYxwNq+POgOu0m141gwG-mEoRBH8hzevj6Ve-Vag@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rust: Introduce irq module
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Benno Lossin <benno.lossin@proton.me>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Valentin Obst <kernel@valentinobst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 5:31=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> This introduces a module for dealing with interrupt-disabled contexts,
> including the ability to enable and disable interrupts
> (with_irqs_disabled()) - along with the ability to annotate functions as
> expecting that IRQs are already disabled on the local CPU.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>

> +impl IrqDisabled<'_> {
> +    /// Create a new [`IrqDisabled`] token in an interrupt disabled cont=
ext.
> +    ///
> +    /// This creates an [`IrqDisabled`] token, which can be passed to fu=
nctions that must be run
> +    /// without interrupts. If debug assertions are enabled, this functi=
on will assert that
> +    /// interrupts are disabled upon creation. Otherwise, it has no size=
 or cost at runtime.
> +    ///
> +    /// # Panics
> +    ///
> +    /// If debug assertions are enabled, this function will panic if int=
errupts are not disabled
> +    /// upon creation.
> +    ///
> +    /// # Safety
> +    ///
> +    /// This function must only be called in contexts where it is alread=
y known that interrupts have
> +    /// been disabled for the current CPU, and the user is making a prom=
ise that they will remain
> +    /// disabled at least until this [`IrqDisabled`] is dropped.
> +    pub unsafe fn new() -> Self {

It could be worth mentioning that you probably won't be calling this
function directly if you need an IrqDisabled, linking to
with_irqs_disabled instead.

Either way this looks great!

Reviewed-by: Trevor Gross <tmgross@umich.edu>
