Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05D321ADB9
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906261; cv=none; b=WORJxeoLinKY3nttddlXu6pYJNxPaCHEbZgtqCq9lsxyM6BUnzGMfXkZZaGBdaSwhBKZkyHQBfVBmhT4OeaWuXMwz8dVFn1zWtkHVhZCLnLqvrChFt/IKpRno6jYFM1VhIPHhjsBt0yTHyrA4Uf58B2RlGtsLxe8/o7Q5m55cdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906261; c=relaxed/simple;
	bh=5PPAq7zQ+nHCI/xWeUgCbm+CvBHJb1ncJO1VqxdJOEg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LlD6o/mbvojKJP8XYJbUSZ+GgdtND/XXVeFYna40Kx0TQrEdFFSJ7YndZFicBMkx91KO49EwsZ6PnF7TsGJ3UkXk/lPbDOOcXKLTKVOt/KyqyP7/uN8zwdSdnfP2Vr40ILz4R7BltJ2pGITcTip8iuBE8QAtVAQxLcsZXQz20X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zUn3UluP; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zUn3UluP"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b8dac70703so2132554f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754906258; x=1755511058; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgUyq597PLhdmrHv4R9AdRxrC+BasBMYjIqsUBUMvzY=;
        b=zUn3UluPzQNPteWnZvcm4AQHoSK85AUZ8y3T0igulw459OjyC3ovc9P0sp9iA80Ynf
         JW5FWP05Ztzo4ph4b/xwsNw7i2xQtYrKZV39IK6osBrmNDPVNuqDcNruufGLVEAc3noC
         A8lQkX63GoFsTJJLy0n7VFN7qeDJLR4Rw3VyUgJQJ0UozZOUk+BOq+Ooi515HoLxvQpU
         cVxeMdoJmAGiwy0iIUvgrkztE8lDyQIJiUjxrxDm1xxQIVw3IzdqVFXL2Bovv0XBwmB5
         DiSIxk6p8FIV+vyNVsdXmCc5RTE3Js65W3NhrnJm8z3HQpESfLoc5c1pRCQso9KGHs1z
         GXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754906258; x=1755511058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgUyq597PLhdmrHv4R9AdRxrC+BasBMYjIqsUBUMvzY=;
        b=gy/Gj9WN6F7ZrdUC4ZNb93DwTdchAhpoWAXNbQpGZtL6EJaRedUHTKTqBzXAh/4sKL
         JhHoAorwSVWBwLJKUvQwKewx+BYMfTNjrO3LSMjGWIqzYkcsoJDm8aSNGaJgcSGQgXLk
         F+DOk6J9qWnJ2Q/S1vUGjG5kCT2oMXQkor56B2Ff4gl9JAEggORuloEtMAqOUaGPWPFu
         oSBiOk9ZDbjBUp224GtHvAmYlowELl9H4K5wtWkWPSWXfcd0a97QU4CGGExy8qnplDye
         ddoqPF+7BOboHm4hNQm7y12qweSRcIJByn5Uo91A1v7oUWlsAGL4ROXzUDZDArFkBUXz
         ShUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW59h21Es17WtIgWsnfl1alsEVe3SiD6b4F/jxfaPyHixQU7c6TSd91KLyI1jqO/wttBzUs5eNk30Kn0+vtMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKp5jgro02aIua8lvyYRWYYPsCK/QRbmkBS9VZ4lbDtSYdgDRh
	ANi2vdzLVydFMRFKggmqdH2T5dAIdR3EbqLrd2ouT75kpiZ52v7oEblVq5lmOWORbHB/qQLeY5q
	5FQmtxRKlN6lY2QxS+A==
X-Google-Smtp-Source: AGHT+IHSeW9L4d6bbbYYcWTlBn9UOJ0o3JKIgssvda35McCGGelkKcsfXIZYlo6usbn103QEqGqi8VHNojgSTxg=
X-Received: from wmbfp26.prod.google.com ([2002:a05:600c:699a:b0:459:dd37:a6bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4029:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3b8f97bb949mr12320547f8f.5.1754906258085;
 Mon, 11 Aug 2025 02:57:38 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:57:37 +0000
In-Reply-To: <20250810-topics-tyr-request_irq2-v8-2-8163f4c4c3a6@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250810-topics-tyr-request_irq2-v8-0-8163f4c4c3a6@collabora.com> <20250810-topics-tyr-request_irq2-v8-2-8163f4c4c3a6@collabora.com>
Message-ID: <aJm-kdPgCL09Gqr4@google.com>
Subject: Re: [PATCH v8 2/6] rust: irq: add flags module
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

On Sun, Aug 10, 2025 at 09:32:15PM -0300, Daniel Almeida wrote:
> Manipulating IRQ flags (i.e.: IRQF_*) will soon be necessary, specially to
> register IRQ handlers through bindings::request_irq().
> 
> Add a kernel::irq::Flags for that purpose.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Joel Fernandes <joelagnelf@nvidia.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/irq.rs       |   6 +++
>  rust/kernel/irq/flags.rs | 124 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
> 
> diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
> index fae7b15effc80c936d6bffbd5b4150000d6c2898..d6306415f561f94a05b1c059eaa937b0b585471d 100644
> --- a/rust/kernel/irq.rs
> +++ b/rust/kernel/irq.rs
> @@ -9,3 +9,9 @@
>  //! drivers to register a handler for a given IRQ line.
>  //!
>  //! C header: [`include/linux/device.h`](srctree/include/linux/interrupt.h)
> +
> +/// Flags to be used when registering IRQ handlers.
> +pub mod flags;
> +
> +#[doc(inline)]
> +pub use flags::Flags;

Minor nit, I would drop the pub on `mod flags`. Then you don't need
doc(inline).

Alice
