Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF222D374A
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 07:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069727; cv=none; b=QK+5Elf4ejUQRTFQKVeYa5fqCKPW2QZKaS24TgJyqto11QgZEON1gv5HZn0vM1oePNnu8+sLnApI4lTlsaIfQ+0mtVHPBhayQHdnDZMwBl2XUMHGdHLm4jHyLkNyhL56+cmfoq7u7oafG8tCz/quRHFX/xi4MqKlh9j8NYieK+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069727; c=relaxed/simple;
	bh=ybxFcL5mUeE5p9xeDCdLZnS2Cp38P/ieTu+RyNkH4Bw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J90K5oZmpjPx4mhLc79ulPdp2PSuOR3EFkBIz6mn2qY6MWOpvLiTfv8T0vPvVALoAPMIBUmtSmSVEDsh3zUx1a5avVLiq89OmRUd1uVeKXXv/FOnOFLzva2XFa2wfU00BbJU3CRfE4zEoMtcDVEs9cu0raRvwLkOu390YuSpTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TwaA4KKN; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TwaA4KKN"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b7891afb31so4537770f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 00:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755069724; x=1755674524; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uao4Kl6OxxR7h74naKcsZhVNyrqxD8MN/aOQwmPq0RQ=;
        b=TwaA4KKN7C3tDj7YXanG6ZbDkDQGXAoNK7PpG8RqHNq/IOM2E0Rt5c5/zLZy3Wli6L
         TOZeq5l1WjuDhgxelEGaKNr7Mpl9cZkDNziE+p8oGPj9N21h4Gbg2DrhIvdZ5f/ybA0U
         f8FwY/0UslpaBkW7iaGcUcx3W3WXd24GVlr5XWacaRkw3g+ZnlcodFuNZOhewZqAZnAo
         lKkejD+ERav2O4U3bIDDMlklI2pZT/9OWg/QEkHGq0JYKgNXKyLlwYG5y7BIzfqzAZGX
         9zm/gT04ucpO0zhA9oZDepUF5tG1trNvmFeDGhPJjROL2OWSdq0C8AIataFwS0UjamBx
         K5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069724; x=1755674524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uao4Kl6OxxR7h74naKcsZhVNyrqxD8MN/aOQwmPq0RQ=;
        b=HsFvoZIUNGr5wmrW+93ZpETvo56i4oNhwkkVaTQvqbUmGHk5PQUenZ2FUkl2weeyx7
         d+G/n6WHGnusDFpzyncBr6ageg7/jjRO+V1DHY8JpWZ1h6wcIEzTq88JSUqHrV+oojqM
         kC+2F2elHPltfcDuI+DnAK16Xppb7fNpr52eT3tDFSrHGTyntvUJmoVcPDM/yWXaoKxy
         QF5EtpY6ngQShGNHML6ZY++5cehrGAt9hjFh3pd05s4E/MSfb2NufOxxOqmlp+uz1/ch
         I+UcoXRJdT9JgNmXZ4pMFOS+Sc/JIl4bwzxx8LNst/BYpP4Ko4THb9xAXeCloaa/23YF
         Z6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDnHZwcJO+xDQCdkhrjEWjnt89iWTBLvUFOAxZHw6tfRlWl2V1vq/42DWyz+Ij11x36cmjgLVo2F8mtjBrWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXOH2TRIguyXDZVkDRE4ffG7EiYQ1GpxcAzDl+dGxXF9It5Pc
	2NsIRZJ39lZI5syAwo9a2/nSjuGIhwDm0UP7uAztRRADboxN85tcjo3UK0ZGFWDGhrfE8cskqBG
	i+568xiGEtOs+S9+usg==
X-Google-Smtp-Source: AGHT+IFH2HZb+q/UNBvWdYL64GIEdCoc0p7FEqREP01trPF16T2/9yPdiTg3O/WuCMtfdFXdKFmq/EErimNXUf4=
X-Received: from wmbjg12.prod.google.com ([2002:a05:600c:a00c:b0:458:bed1:8923])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1449:b0:3b8:d69b:93b with SMTP id ffacd0b85a97d-3b917f419f9mr1388472f8f.52.1755069724343;
 Wed, 13 Aug 2025 00:22:04 -0700 (PDT)
Date: Wed, 13 Aug 2025 07:22:02 +0000
In-Reply-To: <20250812-rnull-up-v6-16-v4-6-ed801dd3ba5c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org> <20250812-rnull-up-v6-16-v4-6-ed801dd3ba5c@kernel.org>
Message-ID: <aJw9Gsy35koXZjFo@google.com>
Subject: Re: [PATCH v4 06/15] rust: block: use `NullTerminatedFormatter`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 12, 2025 at 10:44:24AM +0200, Andreas Hindborg wrote:
> Use the new `NullTerminatedFormatter` to write the name of a `GenDisk` to
> the name buffer. This new formatter automatically adds a trailing null
> marker after the written characters, so we don't need to append that at the
> call site any longer.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
