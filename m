Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59901DF258
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230864; cv=none; b=EzrHDDOarOP6D3F4BCMFNjLqlEU7fasaBQHj+v1xZQWoUx+c/IxTQ5SxpT1ptfOuUKc64gS1NA1IGOSw66DrEfIFQccQbPzte6KQxqOBQc54VVTj6UqExibdod/IUpB6awKB86HCN9XSV7jobc0JhRyv9+0Muq6t7nxzFfK4hOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230864; c=relaxed/simple;
	bh=uQtAVNC65mFQ6/lwaVnbJJjEdXBK5pp+eEmXO1VJvbw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UDItJI7U05YxMcusetwvknf0I2svOBYGVyQoXr0hexOcnjIZfwSEAc7MBo5PkbqmgkbUx7n32uFzvlPEs/eFlIHPWMynA63zXfiHyZ/Dw8TOpn+r/chxRupfl0CVMZy2ztEU1WimUKgcIFkcxZzkKX3dDcw86vTLGtTLCtiBNPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SlA0guJd; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SlA0guJd"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so14060345e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771230861; x=1771835661; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xO+YeDnOOVbfmdjw1uyhMwcQoIFJ6oMNmSYTpMMrEXg=;
        b=SlA0guJdlnntrokpd/lKfRqrW4lSLvPeRLymtMslcs/rqDE/7mFTTQ5gWQ1gLtSmwn
         U2irMnhqUrgJwSEgbKT4soNxw05LGQ77bcTfjyf6oH3zN3yUpfmuK2tdubCe+y/WHHGF
         0lw+0IsmyGPjU7BXQph8yL9uUDkpPiQojARpSlsbsFYFQPlwXtKZQulr+ImL8YwYVAjb
         KWLl05B2l5DHoCgSuN6Z4Cq0M3hOsRDAnMkHGJADpytGym69oHvRFKF6GDjN5ojW8vjV
         g+5B+bs1a5dqKlhWQ1SKT/Kstbp+2LjVVZaN9Dnq7TR3x3PT0ZdP+L2ncL2yfyF8bgU5
         WoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230861; x=1771835661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xO+YeDnOOVbfmdjw1uyhMwcQoIFJ6oMNmSYTpMMrEXg=;
        b=XMmyqvY1JaKlZcysPefTLctG4TIBUYUKx7YQ1WBt1mw9Sx6PnqkIEoZMQnBMC3ZfXs
         Ldo03hTaTnkJOpTE7CaHvpdyYYkU2f7RYHcbH0F4doJcJUpGnzq8eLCzESH3DdGwR/Z3
         k2oNa+yc4n3QWW6zpdZrh3X2niqT1Z7rd+5dqH2CLPHXZ7INdJNMOho/3MMzkMkh+DPB
         cOnWbJnaPhdKDY/Tg98WKgSdt6dLjWxCA/BBDMzVrB9pIuTLWdKNiS2KgCbWQCKuBjEW
         vrRd9wW16JkjKpkRozQ+LWMhhbG4sHpxLHScHxXj4U3i0tUXpMtysMROFVom6u+PpoJc
         UD/w==
X-Forwarded-Encrypted: i=1; AJvYcCVvjKnzL+kgd2WPydTAx4qHW7k/jtS0ADudQTJYBfgtq89Mk2dnwV+rDm6JSP5NVO4P59lb2jckl+2wWN718A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWu/iovgjbu+Z69HKU3KadMkAUGYJBFYX3tfLPaYr2KaMWTjcE
	/mvonReJAxusiLuZLPA3ezg3tVLjV1G9rTs3OPuKrIujLmkDEH/0G0hlzkaUPMySSDz9mN3l4BY
	2NMjtE6j/Ey7bDH4Iyw==
X-Received: from wmxa5-n1.prod.google.com ([2002:a05:600d:6445:10b0:483:7c8d:ed1d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8189:b0:482:f12f:f35e with SMTP id 5b1f17b1804b1-48379b98ff9mr119301215e9.12.1771230861193;
 Mon, 16 Feb 2026 00:34:21 -0800 (PST)
Date: Mon, 16 Feb 2026 08:34:20 +0000
In-Reply-To: <20260215-time-delta-display-v1-1-bdd2d6e98ebf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-time-delta-display-v1-1-bdd2d6e98ebf@kernel.org>
Message-ID: <aZLWjBWaBz4h4_SB@google.com>
Subject: Re: [PATCH] rust: time: implement `Display` for `Delta`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 15, 2026 at 09:14:05PM +0100, Andreas Hindborg wrote:
> Implement the `Display` trait for `Delta` so that it can be displayed by a
> formatter.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/time.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6ea98dfcd0278..e18fd17f38c5a 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -474,3 +474,9 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
>          }
>      }
>  }
> +
> +impl kernel::fmt::Display for Delta {
> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
> +        f.write_fmt(kernel::prelude::fmt!("{}", self.as_nanos()))

I think this can just be

	self.as_nanos().fmt(f)

Though I think it would be nicer to include an 'ns' suffix here so it's
not just the number?

Alice
