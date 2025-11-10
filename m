Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52851305E24
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771391; cv=none; b=mChTWGWhqjD9CVTXoMcnlzOy9FMJoBuyI/eB062V5OOPf0olHc5KpsIhnlYiG8Qp4kkId1iWNnww2htN0FGp17LGg1w0XQTxyq155NAc5JzQFxM0dh5GqtBmKwXofS3qLJr+GHNnk7AmAbyF7DV+qJJBhNwzc/WMPJhOTFp+BkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771391; c=relaxed/simple;
	bh=PaK9aaWb78+gpE3XwxvDFLq4iKRgKHKKrEr/MVH+uOg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IefS0xbR0ypRpRfM1qIea7i1H1CGV1DKbfNnEPHeXVvEKfs0GLKaQG750/z/bT6fFlfjFqNG4uWTcSRoLLcvtMAam5kIcENy4M2ddNC5Zz3CzZ/ppy20QXxF/t5Df2SC2FrJPUj7nZRxnRoTEZPzgnTmlKXBP15TWMC10oeIIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DCUJFWQq; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DCUJFWQq"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b71043a0e4fso266432266b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 02:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762771387; x=1763376187; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6sNizUOGkciptOGTci4SybgbOhVv6AEZQncHw0dXTs=;
        b=DCUJFWQq9EqGT7G9n7V/5XKEkgwo5+kB4E3oqDBF6+9bH7f0eddbHtyvP4xOkRQWl5
         7tZ+rMy7ONx72/XtWTmduxdR67YIjb45mFyfIC/tnGgTaX8RHZNw5QWbjDEQC90u2oqs
         +n/yCcRFXCkj9mqxZNNpIp40UWsEDGNDtz3ahGbhpsUNCWpSNzyVWYszDr5YJq659jiB
         4SVQewPPNerZf7tNyDqTRE6z/Sc/DRSeHbV8keZNpz9THNl1auMlPMbsQYqTRclpmX69
         J1Sb7C386EMWYKMOyHFKEwdciV34OnAwAa6DcgFEDXU4y2gZpb9ir+j3A6LTmisSE6Hw
         897A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771387; x=1763376187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6sNizUOGkciptOGTci4SybgbOhVv6AEZQncHw0dXTs=;
        b=SaT8VUtbfCjdnu74v7y+bCHju9O0AmIwFbSPpUeRkgByaBhO3oZJfGG7LzQ98QeWRM
         awWO1cQ0MwuQ2EbqEJZ4lMCDL3B7oohd/iQ4J54IGWzlxq2LjYPh4yFnisSW25e4emTN
         bL9wlRE/pUkYB42JEx4bUB0XJmFiJeMITuK3GTOGArOla6HUOqgexmJBNv1MOb9f0/pU
         lVoNXnG4/gXvkoq0UmeYxSfjQgFAKvjjZhUx9ZFEUWxp5lHBRge0x23H2d6oK2bq+k68
         p5PIgYiI11Tn5e9NI76AQ2NJeQ13rFbd8++rcVcP7Ft9Puo/r9t0pK+aisUx0gnai5PV
         UEzw==
X-Forwarded-Encrypted: i=1; AJvYcCW9XMyVi/OvbGI9eBySdFgEca4zwLVxT4ZMXuKX8jtvRHlJDcGQplHiZiecN00hRRiUUf7n+PnDwZoUQUxJbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6S+giIzeYl/Y815FzHPuFqK02a8kFOD0KQDcW07E+PDMjWfhn
	PX5zBpR1DQ+RhfSN+sM/MaLcPR9K62+DX4I3WOEyJPNId9Wq82gKMxT81BahnTd//RsJGMPuV5/
	ywA4UFCsyKTHXqMfsDw==
X-Google-Smtp-Source: AGHT+IFY61ejHKFEIykzrnpB2o0ZUucS0nhTdm30eA2AKho8jI6G1MrYig9/jVIr/y6CqyP5/ec46LFxxBld4FU=
X-Received: from ejctp27.prod.google.com ([2002:a17:907:c49b:b0:b72:ce97:7786])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9812:b0:b71:34c3:d5a9 with SMTP id a640c23a62f3a-b72e03ee841mr671805366b.38.1762771387730;
 Mon, 10 Nov 2025 02:43:07 -0800 (PST)
Date: Mon, 10 Nov 2025 10:43:07 +0000
In-Reply-To: <20251110095025.1475896-5-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-5-ojeda@kernel.org>
Message-ID: <aRHBu3RoOLTrMA8n@google.com>
Subject: Re: [PATCH 04/18] rust: kbuild: add host library support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:09AM +0100, Miguel Ojeda wrote:
> Add the a host library rule that produces `.rlib` files to be used by the
> `macros` crate.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

We currently have two kinds of build rules:

* cmd_host-rust used for host binaries such as generate_rust_target
* cmd_rustc_procmacro used for proc macros

This is a library for the second case, not the first case, so it may
make more sense to name this rule procmacrolibrary?

Note that HOSTRUSTFLAGS is passed to only the first category, but this
naming makes it sound like it should be passed to this new build rule,
but I don't think it should be since it is not passed to proc macros.

Alice
