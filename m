Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2098A2857F1
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Jul 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615612; cv=none; b=dWZ3dHqrY9oFQC/GaO51Ma9r7olmaLLUCwBqWmPYw3kPPWOEpxLm2aFQ4HNZtULN/ZIBji8bAQuoYbz/SpQYLrEzCDxMyy1mG8a3SMcjLVfyducbza8PpHxNjhkybZMvi8WWoSiTqOiIPjzWo8UlgnEVuCqTPzHrnLbPPYETfjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615612; c=relaxed/simple;
	bh=KykIkmM9eLteMUVLTsm/o94BJ8e9CpiqfyoLjbdjFXM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=utcRopCsyKvx+n2k4dDYf8gUpr61CHkEKYLEbGoSs2hH6iM8Y2LbhgaZAipzr2oc40gqfCK5ZYrCX3MNE+bCT1raz0ElMXOwFQGcCviDnbeQV8J+xMKNZhff02X8ONbSSd4IRAZ6SM5Zvgguj8UKJo5se291r1sfz5mfKYaiTW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j2A+4JAL; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j2A+4JAL"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so3569105e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Jul 2025 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751615609; x=1752220409; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FWV6N46YCWcyFKoNN7ytQeutwvqMPF1aOuLppT9L42M=;
        b=j2A+4JAL/m4PA27zELaw7cVrAH5L0fSLqQk6Wmbvez1uHwdzHyVG//deDlkyRYHOGA
         Ef4dx+5vsTcylzAAHI8hy3YEFO9s099bLru0Et/EXGl7bRxgHzEBF+I6VEr+whiHrYOY
         0LksqWqitChwetPVQNcUJc9S7ioj8hhVRbji6A9SmRVsaMFmXhTMG+ZNSdn5qJqFRFQJ
         IsB/NpxrMu9ZLOjW+/NMWZcI12mGkLORs0OLCeLGkqNjscKkGYeAad+RDzpmZU5tP/+i
         8+ULIwD40FhvuHEp06JAQ6JSuBvgNcBe8ymr/fZ8maZrdFbUDPRBJ2aSpieACsP+hTeG
         JZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615609; x=1752220409;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWV6N46YCWcyFKoNN7ytQeutwvqMPF1aOuLppT9L42M=;
        b=kk/i8B0305YtcOZmTsghgSTY+l6gjUgw8gKnc9tmIxq2lrQlw3aVxFY60mCbY1eapx
         X/chMr2dV1GSGV+YObVj/6FY3ID6Mmxd1JeETmPJpoeAE81fDdvyV0Ahn2xDI+93Ukg6
         XCs4EsMiSjGEF8o/BtxqcChos5Y8ANbni4IcLQvZmaI8DYDN6ZUOa2n4J9VNuMcx7PMt
         PY7NDKl0co/gaEpdwGNtilnMJIBa1rroXJ5J9LFZyugWkj+zdsOW4OeXuXjdFuWUyrRV
         Q5anh9zLzXFyqoj+75+uji6jDobKrBgUOPpUN7mppWFNPqVC9Ps08eInfaV4j6xqHZm3
         xybQ==
X-Forwarded-Encrypted: i=1; AJvYcCURE8on/O51SU1ozKXkmtlWjTF6HTk0me2N0F1x1/Psi6D3YGRRezKr7fh0BT5OnVqT1pZeGGjtimQ/LhIO8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo0A1lrl4UHhzOe6P95pqcuG74jqnrc1JAP+b78ZfuFCNPnjRy
	NU/Pi6zc+mI193iIwztWMo/ZrS42HNKwYKI0qFwWvQqAU0E1GHzWDlrq//4mgJCsArYsuPC+BGW
	T4mD9sKpHkZQ8c7x6mw==
X-Google-Smtp-Source: AGHT+IE0bh3U7cJQpUshyJ2zCxCWKYVhS/atQp5WI6Mvd4s8SgWIQ7QsV49DdQFGizF5VkFqrdrBYInDOCz1+0g=
X-Received: from wmtg7.prod.google.com ([2002:a05:600c:8b57:b0:453:65ee:17c9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c3:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-454b31085e7mr14720135e9.6.1751615609724;
 Fri, 04 Jul 2025 00:53:29 -0700 (PDT)
Date: Fri, 4 Jul 2025 07:53:28 +0000
In-Reply-To: <20250703-topics-tyr-request_irq-v6-4-74103bdc7c52@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com> <20250703-topics-tyr-request_irq-v6-4-74103bdc7c52@collabora.com>
Message-ID: <aGeIeJ8_Wj_QvEf5@google.com>
Subject: Re: [PATCH v6 4/6] rust: irq: add support for threaded IRQs and handlers
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 03, 2025 at 04:30:02PM -0300, Daniel Almeida wrote:
> This patch adds support for threaded IRQs and handlers through
> irq::ThreadedRegistration and the irq::ThreadedHandler trait.
> 
> Threaded interrupts are more permissive in the sense that further
> processing is possible in a kthread. This means that said execution takes
> place outside of interrupt context, which is rather restrictive in many
> ways.
> 
> Registering a threaded irq is dependent upon having an IrqRequest that
> was previously allocated by a given device. This will be introduced in
> subsequent patches.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Same comments as patch 3, otherwise LGTM.

Alice
