Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B6D184540
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755246077; cv=none; b=q4shrAIElFGKO18VS81L51XXhTt+7e59bp+wra8frWGWe4imxYgTC5VPU+gcrbZNdulD/Ax+iI1wkkCoTs6hrR2u4XaOWjsREM048DETKjf8BcFp5zyNwa6QrOCbXy5GA+OOCiQXOJ4TcFbnQV9t2nlRpj4NeQHv7SRrPGI/ltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755246077; c=relaxed/simple;
	bh=hSfxyTbyhJVUsktaRzvTdGGxGaUMaidseyMOAWvH21E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j5/8AOm+8puWHOzCNYep0yWeKVzhkgTATQd2v2RujLLQt4ygBL7oNEsxODI/HYgQ6y0lgphtSSilgrOihFtNMlSRWt9KdbMXevU292r1pOQ66cztPSB8eDNcVBtKbUVVdmDH1X9P679lpsHucThK96dtVOvB2DG1GPNpiiRtf1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kEjJsjXD; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kEjJsjXD"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1ba17bbcso5877615e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755246074; x=1755850874; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vcSm1OtREGPb104alZ1yzuEUCvwCzNvElhs+/6tX29M=;
        b=kEjJsjXDVSZ0XGKZIoPLMZ8Nd2o3r4RVuTUOTm35nzbBh43JW/HHonuatwlN2jTmck
         t4Pbqy9j9Uxeuni2+Z0fQG7c1OjXJNfowze/AeFN0Nn0IeHJD2iqdeAdJuGKGwI2E+N5
         zPcdKLPdDj0Mx5aZRh7lcI0aOfqEIH1AQYuPpY+/EyHUMOaoxJyTio3JjsbnXUuZ/zaF
         pnpd+hdneYid3xeZWihPFJxoCak3a02djxo4gv387dO9kBley1gdESrJjRkICwpD12lQ
         ZDQj8kpqXIynqkGbqcIFziwPR/S7Eh3w9juCNLq3526dGXouP+kyN82cBjDt5Jv22wyY
         rJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246074; x=1755850874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcSm1OtREGPb104alZ1yzuEUCvwCzNvElhs+/6tX29M=;
        b=DB4TSk/jwbHcongzrSF7mLP6X4VW7IJI/kWeY1dWJujD6ULoBwGp6UdAa4nlUcFwGj
         ecjQ+JBIo0cspUsEl8N20CPkFvuSE3W5SJxoWn+TqncZbgMJLzr7oFNEMhsRjknF3QFN
         q/m4jqYhQnPhUK0xEP4QK2PIwdGo2ekA3kSsAT0vO1ReEr/Epd0IFHG8duBnirwpqux4
         0GlQU9vUdzKeF4i2Zw0GgXpj1NXknk+4DEbAYsbULGqge9x8y5rjEpTvt7OxlkPv7zhT
         2lMH6Q21O1N5dA2zMsN00ITMU/yYhI8hAREtodEclZNKhE4lrJioqnro1LdjMjmBCc/T
         pXNA==
X-Forwarded-Encrypted: i=1; AJvYcCVIi20ixESfmtkOd2ENm37S+Znx3gLy2ajjfLKjZ+vyx5cS81+VNuKnYAFX8oy2QvMceBzKVWb15bDDOVvvsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2xX62z4v+Ppl9kWhl/CLB4/qr7XVkvfUOLKmibZr1CS8tK9+K
	fiie8XpsJ4ZxFn47XPJo1rnz7cY5f9+m8r+JVGACtAxsiyIeW2FtLGywEXRzgWr9RDqPNOwEOJl
	5LrELKZeZdJ6tZ0dYcQ==
X-Google-Smtp-Source: AGHT+IFutm5xxBBsC59USuggF9xEm41gGKiB1W5K+wZvTnUgdqDAaA6QwhiqihbNCQ9esv5k56Fiq6NBFva5rrc=
X-Received: from wmbji1.prod.google.com ([2002:a05:600c:a341:b0:459:da33:b20c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524b:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-45a2183a65bmr12532315e9.19.1755246073966;
 Fri, 15 Aug 2025 01:21:13 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:21:13 +0000
In-Reply-To: <20250815-rnull-up-v6-16-v5-18-581453124c15@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250815-rnull-up-v6-16-v5-0-581453124c15@kernel.org> <20250815-rnull-up-v6-16-v5-18-581453124c15@kernel.org>
Message-ID: <aJ7t-XS2mXFc_Xc6@google.com>
Subject: Re: [PATCH v5 18/18] rnull: add soft-irq completion support
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Breno Leitao <leitao@debian.org>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 15, 2025 at 09:30:53AM +0200, Andreas Hindborg wrote:
> rnull currently only supports direct completion. Add option for completing
> requests across CPU nodes via soft IRQ or IPI.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

