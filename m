Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F4938F244
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780758372; cv=none; b=mVf+O9aSukf6O4dnzj+mpEPb/y4nIi8gaRY01MNLe/b5LyDJC/B7RtnN3es8qpvyMWT7mizvzucl2c6as4yrrHtUlbgkfOU0yBmxibJc/0ImR6JNdRxx1yqWZoAQbCq4AxcJ/OJHwstXAfNjLfp4XET1jQxoAZIm7jodjkXHvXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780758372; c=relaxed/simple;
	bh=MqrR1qkfxVNLgLGDFhtcAsrh6I86vMgInnQiO3VemTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV4Mz3CtHHXqx5LnTEFU+BtL6Prr7fkH1GS2GcN5Pp271f9h4ohaGckor561JhaDIJLO17y97UdHyQf1ERVMBOtzrwicS6H8mfYGuxCKsfTOkjxgYZ6tNolJ8GkfirYyTkchUKYQdEuPDWQkORUwqUK/7l0PhRx6gyBNzA6oL5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OFK+wQ7L; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OFK+wQ7L"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf2d865383so171725ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780758369; x=1781363169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LGfvdtWSGmeyeBZFaUpRxe1TesgPLTrHXjlHvnqJz1E=;
        b=OFK+wQ7Lb9OiQr8q2/Y2v7d40D9KS+d7wpJutHDHANMQhUcNRk6Per6D4NK+EvgPjX
         GsSAlTpkgtENZdu2HjxaNmN/AShsea7y3cA0Go9nAbp0g+X9S5XUTjjrZtwGmyBWQubZ
         LHcKpMdNmukPbPYHxtdlTH3BK5bTVY1yzHQWLORPLM3c8CVaGjJpsZtH2/RRGBNCRgyI
         Zy7A5bZHOeQ9qGnzRqo4U0iU3qrtaXMJCzwhj2zKpPD8JUnxunW6iEJ8Ta/j74qXrIuN
         IRDkSrEZU7t+N5CdvGT4a7kPzr+QBTQ1rkcUYZAL4IYpRPJAQHaxteC9wRtgcJVjH1qP
         TMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780758369; x=1781363169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGfvdtWSGmeyeBZFaUpRxe1TesgPLTrHXjlHvnqJz1E=;
        b=oKESjtCwxYKpx7whHuPtYQEjEaAQaoQF+dk87cdf4A9c2XAFVqoU6/9bIUpNR17bw9
         3DDOpstyvOOekc2w94PFdpKAIUaiSYuCg7vcygO6qDdSkNEt6ay0zAwfMcihtegNxyjX
         /WyJ0rRs10Ej6YKnXZS7ME1D5CkQSUiJyKtjWvshqrws0lWZkOKuWEsOLHIuTOygEF7W
         A1N7YRAl73DYqjWZ6bZj+xwtAN4NMZNkTFloQZhXZmOz65ZjOWOTaliLdBVgvDeWNQnR
         udIjf2cUa7Ox8pxPlewNbqiGa4X2OyFFIx8PvKUEjWFIBWFdfxwtGLCfsFc5n9VepKDH
         cVng==
X-Forwarded-Encrypted: i=1; AFNElJ8mwALHji77sRmb75hUYi+2kapClanGxbhj05O6OMIdf+ARZ+wYesxnV3OlrrmPCCmtr24wFnk8camw++hE+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnizTXrbno/Ekpe4x7aXu4G2HWCe9QCnBeFAVlzkXUSmtY1vC
	HIkEHeq/K5DAzPyonP8jxItV0WFI0JjwPIjvY4Z6zSIdocwqIyuvrw2KIrs0w7mLzw==
X-Gm-Gg: Acq92OEZMe6Gj8NQ8tmhfwLcfI2sdCx1CJwSR7XAMQiHTno6P+x0PidEDPq5gWrs5FZ
	uWg/c/K40z9mczl4Z2Ubw1sSoN2iv8PKTRt3tfpPx/pFlaDb0F7y85khxx0sz9XRgl9HD3gdXUJ
	+8lzN5Ca+TofdOKk0wzcjIjT+loIs4H3aydoIvEKhfd0onBcp6SwV/jvIupeZZJE57723R3kDpH
	HrzKnERpeDcPUc8jbvB+eJDsx42Y19Jy4YAsuwU5hsoRd/51yp+3uFmKURD+bYK8lm+l8gJOkyj
	O2NotB5uLvbYA0qOXknfe/FtUmrjcl4yEHq94CPeq0/Lqo0yK+W2Al12jKrkUqtg+05yxlDy461
	5gWjAAqe4m92CGuw/nkXW82hx3rCmaRR7zueY4M4lpNOptT2CEBd6lft9D36Ybn/ZXYD0T3ZB5V
	yt+zYDiru0zNVJB96VU7mMv9/Arh+5zJxI/XT9ppfIif1FifRgfx64EHsEinO046xcRSW1X1Peq
	nO853CTd4DImJVdk0qfgS8EUFijn5P3TML/AGkhSkczcBd8JTi9+bO1
X-Received: by 2002:a17:902:ef4e:b0:2c1:5756:1230 with SMTP id d9443c01a7336-2c1eaab121amr3570175ad.0.1780758368860;
        Sat, 06 Jun 2026 08:06:08 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282350f8csm13647791b3a.14.2026.06.06.08.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:06:08 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:06:03 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] rust_binder: fix BINDER_GET_EXTENDED_ERROR
Message-ID: <aiQ3W0xVG4dOG_br@google.com>
References: <20260605-set-extended-error-v3-1-d60b69a75f97@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-set-extended-error-v3-1-d60b69a75f97@google.com>

On Fri, Jun 05, 2026 at 11:13:50AM +0000, Alice Ryhl wrote:
> This code currently copies the ExtendedError struct to the stack,
> modifies the copy, and then doesn't modify the original. Thus, fix it.
> 
> Furthermore, errors when replying must be delivered directly to the
> remote thread, so update deliver_reply() to take an extended error
> argument.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

> Clearly nobody actually uses this feature
Not yet (only error logs for now), but it will soon. e.g. EAGAIN will
translate to certain transactions/commands being retried.

Acked-by: Carlos Llamas <cmllamas@google.com>

