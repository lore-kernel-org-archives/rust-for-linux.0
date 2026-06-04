Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C840DFDE
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571864; cv=none; b=PsUku2OfsxxaNxNiiw4hNgRKV1k9rF0juFq7aWH3tdIpYw/kAzyhY1KQQZLIPp4Zs5KzzaJb5r25ID6E9avb4wBq1ZZpHJXIWtFBP3R8T1d6/Dc+6XYxocyQlflj94SNI8S0XHc4/5Ng8EmXDzBXyDHpiBsIviuiwwZSZ4N0BhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571864; c=relaxed/simple;
	bh=RXDUQowYZh9h3j6qG/zfu8NnZV/DxLiYcI7PD6e6SN0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZtgX9K31RhVZTttKBHW80fk3jcn6U7Wj5F28lAc161koUTeqsQkl34bV+4EbyrgsUi2Q43kzIu1OMoUG3yNWF8biUPFdYMzoE/bhZgP2/4GfHeFJp8JaFiOg2T8cYo7HkJkp59cPQQNd56go3IAJCND1dDGlEtRN97iJ57INQ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BFrvfGuN; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BFrvfGuN"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4601c9b630fso256840f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 04:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780571862; x=1781176662; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vMPINAxbwMQr+CA+jaOG7PHibBNPmddYJIp5CCiKSfg=;
        b=BFrvfGuN9oSDubYLaDAS12jTS2M9OlRJFlUWVTwP6kmkTbVQa2dp/a8oxL4WYPzQRy
         bkxb3TVNVb8zWvUQVHOO7g46rXwpQCbzxoqgWm2WixoOeY9B7cRdvnZPRcehGmDZuAj8
         mJH1C6OIEyN6q/l+ds7kJaKhp7iTaG5kwhrSm31hED1jTHEv4IhJSRWYJEV/I1mNsFdJ
         9cKklyICIuWnj5fAfA8I2CKYwEu6YJraNEMv8491k7Hm99R/WsXYK60yo7mjoYk3wWzq
         xzcvpe8ywrG1BwVL4O1rgspzZXieoViS3Nf5Wd6OOn9/7R8aOHUnmr7sYpSBcJbdwA7X
         xuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571862; x=1781176662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMPINAxbwMQr+CA+jaOG7PHibBNPmddYJIp5CCiKSfg=;
        b=UUEewT8f2qEI+BrmOQzGcWFZH1LTp3inVA1dGOO1OzY2RZfgMOxeAMZKy8Lgp6oauI
         1QKDpjefx5ve/N+vdt7p6sL7PxiJJFHimzKkUH2BC3AWF0lPfsw7cOfp0OVqxhG6VQt+
         PUC9y0lvEyCgUVEJ6w3cfhC51aaW5WywAFVQhHCVnqrh5tACC5usuV5cxQBd3qTFnyX6
         PRAWJ1Ggvtzua8+wMO8E3LxAxYdLfj9oCKEqhk6QOPE3vJ4ha9ena+a+Wr2wi1FThbyV
         3svCBz5NBmZRWM9Dtdlu400/fDx1wnEcuBAB3Rse3+nN7ptP7Yw2oVfAfVI4+rjb9t9T
         rsVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QUZVrVOGJ2uEaetBqDebBBWdzYj5qhBiETNyDKH0tUg2xbGc2K8IXvZPI749qf1ls7LP6ylt9/rrJHvV9/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf7TRK+bCfNURgtu1LrcWK2dGyrgJ9iNZG3FLLfoXtTmbwVaFw
	p0EfxKhhEF1nmKMDi+XJBuP0AZnrw+/UMdkMJrsqDZeHsDacAPce24Kz+j9puX2tu5FbEqhXUqS
	CL3oUbxfYvgTtSGsNPg==
X-Received: from wmbz1.prod.google.com ([2002:a05:600c:c081:b0:490:af44:67a5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a016:b0:490:bc46:1a58 with SMTP id 5b1f17b1804b1-490bc461b57mr60168765e9.18.1780571861570;
 Thu, 04 Jun 2026 04:17:41 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:17:40 +0000
In-Reply-To: <20260526-rate-exclusive-get-th1520-v1-2-34cf034e1764@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526-rate-exclusive-get-th1520-v1-0-34cf034e1764@mailbox.org> <20260526-rate-exclusive-get-th1520-v1-2-34cf034e1764@mailbox.org>
Message-ID: <aiFe1NSoQDs1YOj_@google.com>
Subject: Re: [PATCH 2/2] pwm: th1520: Lock clock rate with clk_rate_exclusive_get
From: Alice Ryhl <aliceryhl@google.com>
To: mhi@mailbox.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	"Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 26, 2026 at 07:04:58PM +0200, Maurice Hieronymus via B4 Relay wrote:
> From: Maurice Hieronymus <mhi@mailbox.org>
> 
> The driver derives period and duty cycle from the clock rate read at
> probe, so a later rate change would silently miscompute waveforms.
> Switch to the new ExclusiveClk wrapper to hold the rate for the lifetime
> of the driver data and drop the corresponding TODO.
> 
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
