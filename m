Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0EC283C82
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Jul 2025 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614999; cv=none; b=QyfwcBRlZLmo9oOtTCURYSPCVO8DaUsA+xA/kKWbhezG/4sPwqfqKW8HekVk0+8vGN4s2ZK3rO2D7nDkSE4JkwBnybHA3ZvMke4r/5e8UuNPxsZyaZrEB9abSYnHAqCO5S0ZGwtRi7y4tsx7ijHtf5axDyG8QcJGbsLDg5QXUaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614999; c=relaxed/simple;
	bh=1BRiW96rUpghvx6qICZQHHMHu/XS/upL65W6e5iOCgs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VZ32xwgEUZxOyO1gGSgdyRBGSqUikU8+vKzQxKFAw5YoTAhYvUADgudUxRRufXUR6DF+pG+XzRz5y6wfO8ltDoIqhJdCWHD/pXXj8MMPyNHRT6Ho4iwe4I8dab+XBVufo8RCpXMdFyaTv94oER1YaUg5c5R0jqorTts8uSHNrh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QqKkNXTR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QqKkNXTR"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-453a5d50b81so4237175e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Jul 2025 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751614995; x=1752219795; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Trbkf5L2/nBS7LLO18/vGBZSMaVa1rVVnPz6wCKHNqA=;
        b=QqKkNXTRMqATY85UkFun18dUHYYJbcWiFyHsrStPz6Y5pD7VOHxgNj+99hy2ujjks8
         tx7x54lb6DtGpNNFznkk8EI2WpxiCmELOiRsBj4DraGhI63Tslyo/G9smTuQLlm2kivl
         WHjKGw5cL+Dm8d2uUjhIgWjZrR0BGm+qP+GbVF+U+V4DmxJjwp6wBPP/OxUvRCrgp5tb
         eL+S+rTMNWo0kQPs5YDHfKpuv3+HnazHTBSZXaGet0+QYEFBpsHD6cGhMlfO7eJwKzb1
         +BEtfpmRTH8b82O1g4oVkIqTDcd5iPr3lInrHeZyrsFfTCnzgZfaLhslwpUjiId4X8J5
         EqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614995; x=1752219795;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Trbkf5L2/nBS7LLO18/vGBZSMaVa1rVVnPz6wCKHNqA=;
        b=lVPglP/lp0DaCf+4iW97VioK6J8f1QMjh7WGjbS+3wNf5hhcbwWt8LWss0kQfHbCji
         zwAV8mqnzwjEgTYNQPcPV6Uvo8dp1ZMU8yWNk9r3QMIPvNWyL0t2qC71N4R29zg1Hy2D
         nntNy4upDXITPpjt4wQXf5DLKWpzTf92quvbTC84zoRd4P3r91D23wZNMDMebxsoEXwi
         nmOZxU/LTLdZHS/q/LALR3RARgOtxMwxZZ0QZxJ8FbI6BvESFQoRuGtwrtz7m6QQ7z0A
         rDkpkPGen4yv2j+cecy/jqPtecW/6nxocWPWjX9vmt+TrODhSoUOmxx3/byE3f7/iOBV
         Jh5w==
X-Forwarded-Encrypted: i=1; AJvYcCWJD3wBXdQdy2U8On3C4gbGUGDMTTYHcV8HWlNei9hMKvnJdjK/eTYY0suDJxeROk5zB8lVT2HMNtUflSTXNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIrjRZtRnW56qyZ+ulg030TDA/gcvb8+PDZqUHlLXkc2Ujah82
	4c5nkvqmr6+8jyeQRHIkAenjctcq2xfbg1Jhyj9HMA07NH6tZyDwuWaufJjowl30T5mitnTLRXa
	RT5PvIVyLWudikcIlYA==
X-Google-Smtp-Source: AGHT+IGvb0vLGZH3H8NELYBKZnOLf+QcL2G3KHfh+CH2+bafytEWalGS+i6LYIUc1+KQFnyWHN2Tzjq3rWi21Gw=
X-Received: from wmbeq7.prod.google.com ([2002:a05:600c:8487:b0:450:dcfd:1870])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45cf:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-454b4e779camr8985075e9.8.1751614995067;
 Fri, 04 Jul 2025 00:43:15 -0700 (PDT)
Date: Fri, 4 Jul 2025 07:43:14 +0000
In-Reply-To: <20250703-topics-tyr-request_irq-v6-1-74103bdc7c52@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com> <20250703-topics-tyr-request_irq-v6-1-74103bdc7c52@collabora.com>
Message-ID: <aGeGEth0mmVNLWwg@google.com>
Subject: Re: [PATCH v6 1/6] rust: irq: add irq module
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

On Thu, Jul 03, 2025 at 04:29:59PM -0300, Daniel Almeida wrote:
> Add the IRQ module. Future patches will then introduce support for IRQ
> registrations and handlers.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
