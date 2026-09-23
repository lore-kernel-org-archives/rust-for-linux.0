Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC54078F6
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153408; cv=none; b=qSGRrM6NnC1BKgHud4yCjDMA0rjzE3e8LiPPNfaDaNXC0Py6TIdu0mMVADwuglWBn1W4uCExzBdVA8K3kLc6bcpvdt8TfU/zSJu3+IEtfOd5xFV6BVCEZWnC2OpL+FCvoffCTXHA0wKG9VdJkI144U5mdgDhcDQ9aOf3+7yFnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153408; c=relaxed/simple;
	bh=2XHh08DSWyQ2Lla9nNvrGWSyFGkMaNolE/nGXFIv2Do=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=inr2ElYEa03NOkXSyYd88haTtMm/4R1jx5bxRsM1B3LPmPY6natQ1DQHDQfI/xUXsiSVq2M2scO6fWxGfO664QyPMsff0hW5+iLyWrJKsZblOTueLqcHml4x3onfs4+1I1vRkxm5G/XvCvy7PWwbm0yH956hm2HKsM49WdpJ4jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sAQ42flg; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sAQ42flg"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a9b5240fb3so809378a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 01:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790153404; x=1790758204; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/V4JJZVNuiDLsMZrmNpJjlcNEhUviMYM4KAzEYYNoVE=;
        b=sAQ42flgNn5Fe4xFAC7IwQ2tN1sInq1uwlWXEylFisRb6+OLbLWh2HD4h+0OlN8seJ
         HXn7E6VHEOiK54GV7Gs90bE8FsvklifCIdb0FDgx4+SvaOky92hdhncG1+eDjdRcBU4l
         treQrIW/COp0eZIoEapx/oJMaZd/hVf42qBs8y2RxRwwo0bJ+S9rGMaskyDfVGtuHpdF
         iA9MrENCwBQmQ4mriO67Z9ouXw1LjtYUoLYom2Mn096Lf11yE770cF3GM+iJUGc+U7JT
         2S+zn6KGAVEjQGFQjZS8jF6lSH3wU9Xx/B3RUtxtIZ8BKlXvXWLdkvWx7pZy7dy5Te8a
         oXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153404; x=1790758204;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/V4JJZVNuiDLsMZrmNpJjlcNEhUviMYM4KAzEYYNoVE=;
        b=IwxFQ3Iqbim1xoe57B38Hd5chzRTAgBDo3N/I9pnOtyq2jrG12HXWW4ATKMzsmKIR4
         cmY/UI6xeGweqqZt+F5y5d8s4QGI0OqUv4eOViJIFE3ngOFiJvDMfDWW2WC1MOuaITZL
         Bkyvx0SLlYRvTBiUaSYJyUT2fvdzvlqBKqEzuvWL/Z812BfVEkdmXTncOz0jvN9DUX5l
         Af8uuJsUWtIKJD4lSzC7z8xry9jnh2pGNpfuET8wbibL8svohyicnQ7FZgdSo1aaJLo6
         o3FIIA3LVd6ycmnj1ZQlxWyrLrwj0RGmnbMhdgygwtgZpnwF77hUv7CsSk3/MkSX/q0U
         mO6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwWQ3pR8asqjDlNyfV/rNRV8ol641+ljE+a/OWwmCgSv5YxKwQIoAzC2A+3dEyzCcxX7dI9vnxsH3Pap5egQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kodyWA+/tZVaD8DfDdOBB1SNvXCadt0NHgbyR8G5nsdQT5wOec
	KNmgNVVDkUSkVce/qlXajjyGByDnEG6KzmH8XiI946HH7qrbib6dkJWlrrmrwzzLeAs1Dft4F0k
	a1Ydesh1AMay3xRJiIQ==
X-Received: from edxs21.prod.google.com ([2002:a05:6402:1655:b0:6a6:6326:bdd8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a0cc:b0:6aa:734b:1a1f with SMTP id 4fb4d7f45d1cf-6aab3b5bb34mr1568561a12.25.1790153404051;
 Wed, 23 Sep 2026 01:50:04 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:50:02 +0000
In-Reply-To: <20260915-tyr-interfaces-v1-9-5d28f1f75aca@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com> <20260915-tyr-interfaces-v1-9-5d28f1f75aca@collabora.com>
Message-ID: <arOSuojQNLcO6m8r@google.com>
Subject: Re: [PATCH 9/9] drm/tyr: wait for global interface readiness
From: Alice Ryhl <aliceryhl@google.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com, 
	Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 15, 2026 at 12:57:42PM +0200, Laura Nao wrote:
>          io.write_reg(MCU_CONTROL::zeroed().with_req(McuControlMode::Auto));
>  
>          if let Err(e) = poll::read_poll_timeout(
> -            || Ok((io.read(MCU_STATUS), io.read(JOB_IRQ_RAWSTAT))),
> -            |(mcu_status, irq_rawstat)| {
> -                mcu_status.value() == McuStatus::Enabled && irq_rawstat.glb()
> -            },
> +            || Ok(io.read(MCU_STATUS)),
> +            |status| status.value() == McuStatus::Enabled,
>              time::Delta::from_millis(1),
>              time::Delta::from_millis(100),
>          ) {

Does the io.write_reg(JOB_IRQ_CLEAR::zeroed().with_glb(true)) line after
this read_poll_timeout() also need to be removed?

Alice
