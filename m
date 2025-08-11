Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E53A125B9
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906215; cv=none; b=WTvdm+vfrXLFpRdDSQbOuxkxIUiiJz8BwIPJp7sU3nfcTMUee3eENdiX8Ppor22hSn9reFCL22sjROMjGUY2MfkB3jleLLrdtaq0YUIxR8qodn2OEt9Lke7mQrOFKXNC8G73Er+NE1IudNadtDyN/PwTZrGKifn/fgORu2jtmUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906215; c=relaxed/simple;
	bh=oFgFdsAMTf/qCY/7xWsxSAnmK9+zLrC/nC52m7Do2DE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VjWNO9Z77nS0R5R5iUOUT/aiOEK5z1WJOb4ZzdG9qALDrQT21Kzuq3x2aALbJpIHdS5PRpNQ4xkMnM4PmyszQvPvTTn6EosS3VnkIHHniCuAz30bqmS6MH7hJzirsFslHLnNGQo62BPS47CftyBPo7jv+0nJlYOy64Bn5qNzunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s7/pZTKS; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s7/pZTKS"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b782c29be3so2204626f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754906212; x=1755511012; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl1+NNQeO4OdoNvXCOAgTlcv+G1b3QMdpUJ6J7g2VAM=;
        b=s7/pZTKSI86bRFWrZ4CJ5x+6k74/Tn0ZXx40d1b/1jxwd0/N2NYYpEtFn2lKqC21UY
         XgELQDan8uilNyPX+o9DAOKFyWymD+BJw+otemNcXKTWMmbLjjSxedC39eCCt9ePO5T/
         DD03Qbam+nmQAQYLRcrx0K531ZvMswgTW5UQW09x2YTioEA0fRz0iACNeaMD4RaCE6mr
         moy/oKeSlL2qvvptUg6/+jBw3dWQZpm7rbSutY3fJ6qyRGJ4SN6BJDuVF2HTHzH4i6sq
         4a8vwhzmk6eGYmuomBDcoiWxiuQ4OniiepTQiH7HXKpA2hFil8O66rzaCUuBFWX7gtgg
         pZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754906212; x=1755511012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl1+NNQeO4OdoNvXCOAgTlcv+G1b3QMdpUJ6J7g2VAM=;
        b=DPVZQl8NRKtgtIr1yadElC8RI+u/FYBqYjjmU8j3A7M0YSmqnGxN2UdHzqM79TowaC
         glNH6LEr4paJrp63vzE4sWo5uyelkrNF+Bozukb9aPlUP2NIZKjuFwJL0rDc/c/1s5SX
         X2CS+4s7XTUoN6IwRBfqxsUs2DPReIQcsUV1DvZOSkH5yQ78cP8CrrZp7Aui3w4g1ZIl
         ZI7DBlOS8tuOzrPyHVbrfr17dZOX3D9j9CjSo0PFSKNqhxCgLaYVhApck+7KBprIzFwI
         hsFyGulQ9TGB4uPi8sl6BEcgbn7YcjXud6tlcSY4ZQAVdKT0sHbOParftBua8NUH2sLa
         qVkw==
X-Forwarded-Encrypted: i=1; AJvYcCWJzjeVnsJvvWvgTYb+QGFEvS0vvX+YBNkdRJSIcRuVC7s06xxAGtOi9+4Cp89BhB437u/JYuwZhb3tqriIHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kyhcFbWFNdSxZRWywkjki8Xv6tOCoxSoV9N441phzXFdpFWI
	h8KE9/slt0AHEhQvvt4l7DKpDr9V8dD1XKhz7blnbJ8FxZ6I2KqJddPDburRDy32i+x2PsRj3QO
	5w4upnM5KrOxY8nlF2g==
X-Google-Smtp-Source: AGHT+IHRBVCM/fJteETaWAs/3isleNIYRq7dqVvVCDKq4GdPu37Nrdb9yhp68WF7Uhd2xtOfaLaHAqeHeno8MUo=
X-Received: from wrbee12.prod.google.com ([2002:a05:6000:210c:b0:3b3:a665:e00e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2083:b0:3b7:9a01:e52f with SMTP id ffacd0b85a97d-3b900b786f1mr8987086f8f.44.1754906211937;
 Mon, 11 Aug 2025 02:56:51 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:56:51 +0000
In-Reply-To: <20250811012000.444173-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250811012000.444173-1-ritvikfoss@gmail.com>
Message-ID: <aJm-Y6oMiWGB5yCQ@google.com>
Subject: Re: [PATCH] rust: kernel: cpu: mark `CpuId::current()` inline
From: Alice Ryhl <aliceryhl@google.com>
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, skhan@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 11, 2025 at 06:49:58AM +0530, Ritvik Gupta wrote:
> When building the kernel using llvm-20.1.7-rust-1.89.0-x86_64,
> this symbol is generated:
> 
> $ llvm-nm --demangle vmlinux | grep CpuId
> ffffffff84c77450 T <kernel::cpu::CpuId>::current
> 
> However, this Rust symbol is a trivial wrapper around
> `raw_smp_processor_id` function. It doesn't make sense
> to go through a trivial wrapper for such functions,
> so mark it inline.
> 
> After applying this patch, the above command will produce no output.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
