Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A012D2390
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755070349; cv=none; b=XGFzP6NCyNXsAbB1hGNN3YqvxSWAAc+L1bMbImkjX8PppefVnsvREkOGlvEH9MppjKJpIjZMQEmqRFxMctLlgmZFCE9ObuvzfiE5M9lMeW8Ncray77nR+eL3CKpzPSyEXgSTTLhxyErkgEICmM7MRkqOZnFnReaHGH6DkLl7WJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755070349; c=relaxed/simple;
	bh=IHuZIPIubs/w3SJF5skp9Te+eH5DawaYvyi++z+e2+Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UiguWDSCVtJh/gPyokW5xPJUn0uyqp1iU3+7ZNExrTh99VQoiM0N/xAkaKQ5Vu32cAC/3X610b9dAgl8/EjLgCHZlwxuEIey7VufrBl1SiKzZFY53APYbGPU8w0OkfjbMsXH2Oymzzaht7TvFq5FEDRD9gNwprO0nQD6s+H5ZG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iNPFUwNl; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iNPFUwNl"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-458bb0e68c6so37444185e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 00:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755070345; x=1755675145; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5312UrazGm2nSYVWWroUOeaj5Kd6bEVW+F6s4R1WTC4=;
        b=iNPFUwNlBqgNSEiZ6QAOBCrHH/jtjgqtB7OKbSCDI5mVVfWpxvwNgdFszEhBpua9bL
         FmMMgD6NwekZQPTkMfAiEptakgZsb/s6Hn7xQwJopEe0AEtr0biPPaRgeqza/nv77uRR
         bsbIL62dgjBzXjPkcM822hEkhRLXspqMto264oASMZTSbhAM5NA8Kphs7GC9FLlhC36v
         OlXI1A/uL+7TRMNmPgqeO3hIT0JBAxwMkmRAIOps3BplNY/SMeIQvSqeR8tdYz8qZnKF
         z5mpjzauuKQPKfdOFDJ7xrnBkiB5OS81A6LTFKA/zNtjdG95Kpza8PlAfP9AYmFicUjv
         ZXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755070345; x=1755675145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5312UrazGm2nSYVWWroUOeaj5Kd6bEVW+F6s4R1WTC4=;
        b=vx8nbwPyiFGSYYxbBx8lr2sKhMG08bKWjX6nOsA+jUyMrPWm32empO0gAovV8bwtxI
         GBIseyA9gAkPvjPZNY//0teozndD9PMqXflIU8Govk7ancwpEUfkjwAcPNfQ5MKKzRDv
         0Vp8ktpSYhAHgtrtxvrydy2UEVA4MDS9aF/x052ixF0KSqstTRnF4e2vK4Qx+t+S+xHZ
         hU/oeYRCPDP0OtKHplSqz9sTeKVTfkD2+v9seKgbN+6QsR2JWMJ6J/5KfLiJxzK6eOwB
         3ouQK1dRv/+3Vabq6x6uC5LbCtY7yOEyrPz8cIbB+8mP+6uKSdFhCay04Dk3CPjxY7D+
         rfMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWavQYdj0LqLW6UCP2CmQvpgeFC271LCyawotHnYOAdkYJHnJWe6xS7s1SuxIFdDNNb5drMdi5VaF1R+QPc9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOq0+bBI8YigK/bPwnlafAvhUg7gHA99KGiLz2UPG1pJXp3bO
	WvDb+D1JcZMb8iQys7BmolLpqM3LjVppqXPsiCduHY8Y8zfaYsSIGfOFasDtpOXPan/Fsfm+JOi
	zQZOttVktbdsVEfgotg==
X-Google-Smtp-Source: AGHT+IGoPY0Up3k4B4X0DXNUDKXTeE+1fGEGc5eaPkBD/CJZX1FdQoee8fbt1gqhWP4uOguA63HM+AhbSh+cNrc=
X-Received: from wrbgv1.prod.google.com ([2002:a05:6000:4601:b0:3b8:dd13:ef63])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:250f:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3b917ebf766mr1284367f8f.48.1755070345355;
 Wed, 13 Aug 2025 00:32:25 -0700 (PDT)
Date: Wed, 13 Aug 2025 07:32:24 +0000
In-Reply-To: <20250812-rnull-up-v6-16-v4-15-ed801dd3ba5c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org> <20250812-rnull-up-v6-16-v4-15-ed801dd3ba5c@kernel.org>
Message-ID: <aJw_iJZLXPml4Abl@google.com>
Subject: Re: [PATCH v4 15/15] rnull: add soft-irq completion support
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 12, 2025 at 10:44:33AM +0200, Andreas Hindborg wrote:
> rnull currently only supports direct completion. Add option for completing
> requests across CPU nodes via soft IRQ or IPI.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

> +        let text = core::str::from_utf8(page)?.trim();
> +        let value = text.parse::<u8>().map_err(|_| EINVAL)?;

Same comment about kstrtobool here as on the other patch.

Alice
