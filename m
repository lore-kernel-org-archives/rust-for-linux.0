Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD78255F2D
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230790; cv=none; b=ogL+HRsTwfJKayLlOJRikzOezsmEcJzbLPpHtIrrRvBkQal9M1uQNJdbXN2O4kRM1ZyY+t7UVQICO2wHOFPck30cKCMmCqkGlK/dFsqEqRbaqJixnp0OTvcN26FyERgPcRsmW+eAnCQMKZunqm6po4Bo8jHQFYwinsT5FpgmM4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230790; c=relaxed/simple;
	bh=uoahuacCYZ9SoHB6vmBITsd7B+5bwwaSz1/UFBUoLTY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=afMURXf/xuTM5T1+68ZiiLED+Kd6ZHvkg1fDDPdL+4Bcs+HFI58wamCfhp7jYBY9T/zeubRdn+RXEBfmi0y5sG9FFbFtaYCkbAb26KuPfVV6ern6ojs08BvlvpzqXDf2TA9JxXxNavT1UNtvC04O0AfgtZRmJYSRMEaCcnBFRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uhS9SWUf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uhS9SWUf"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso20207755e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771230788; x=1771835588; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9FWlfvVYsSfvhml8J19wc2FeA1m6dphdLaOlAObMaZY=;
        b=uhS9SWUfXveVTX+tW4arkZoL9CWOeo/HkjVxsa8Y89h1oU7QHx0qe0LGh8sGE1w5CC
         aZOYYVPKPo6eIfbX7/MS/nR9ID8cmNYCbXX+YnZvTkKNRil4Tyy0NMhqUDKCEgwEQUKQ
         Mr5QdDoABEO6IcVbc0+bByEpJUP4JxcVSqlWV7DPveFkNsiyi8khhXKCuSJD4uwN/xpC
         Tjw5Wx17+oPQ/KcYrOyFLvF/BdBJJGxN6rKyOUTs+M1iBHsvqL+g0iY1k/QUTrR5Ti7/
         cCnlySCRWqY1YYfvrtpHp6FL5OynGKDMJycuE+O6+Qz2gCIJ1KpEBHZphZSY5D2WTeCR
         EXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230788; x=1771835588;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FWlfvVYsSfvhml8J19wc2FeA1m6dphdLaOlAObMaZY=;
        b=aB/hHqw6XKib5zyfP6D/FzuxmSYxRhr9le+ODol2naKAMxum3Fbc0FEhPoS2SkaCdF
         qqZCWZJYJi9Mg936qKpRrGii1X4hW20SMawUYm1Q7HLKZDtBZbc43GoglEBmm2IAWHNE
         S0eIfZQwxLn6bJgyRaEozi1EXizgSkJ8XpdgzwKnejcpkkXcaVqocTsLP19DUYYMsIUL
         65ghkXV/7kwtIzAn9kfQiK4iNs8497nGqI5CkFE1/wJ0uRt6ReguXSxwA+mRwpiZgp39
         LCW2q8Ms4MA1+qyo2z+lmvpIGOP+NQ88Vs7ITbDwUCzSzWQ+FJnbEmZK5AkgiYSG1m8Q
         6xIg==
X-Forwarded-Encrypted: i=1; AJvYcCUSZWfiddfTbQe5zoGX83FSXzqA9YGgechBqJyjN1tLvoZ9XYwL2MeZtJyrCx7glwUjvaJayBSLbsPum9+9Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4w9e20jtZZcZg5aqRJs7oSMB17dDed4ywe7bap8xfRBnzdMJv
	tJHwZVNvnUCmPfqYiL3CLfeKEHfvZ11WDDXC+bxitZHFBRda4uVAEF1uopAHKTadzu2S+c6/NN/
	f20H/AJ8N01Iwd8SlSQ==
X-Received: from wmco23.prod.google.com ([2002:a05:600c:a317:b0:483:29ff:3c47])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d10:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-48373a45d65mr154147585e9.27.1771230787459;
 Mon, 16 Feb 2026 00:33:07 -0800 (PST)
Date: Mon, 16 Feb 2026 08:33:06 +0000
In-Reply-To: <20260215-time-from-nanos-v1-1-48c61b15ab4c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-time-from-nanos-v1-1-48c61b15ab4c@kernel.org>
Message-ID: <aZLWQsg5HstDHiGZ@google.com>
Subject: Re: [PATCH] rust: time: add `Delta::from_nanos`
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

On Sun, Feb 15, 2026 at 09:12:04PM +0100, Andreas Hindborg wrote:
> Add a method to create a `Delta` from an amount of nanoseconds.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

The change itself LGTM, but what is this for?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

