Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8252853EF
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709170; cv=none; b=l5pN4VQujq2qpaXHxlBC4eGWYfWoWApGNopV+HcS8fRX223rw2Yn2qD8F5z1CKLMc+GhvDInmZ8j9mq9Kb9b+7WLrh6hGiztYNDvjLWQ44PMa9QPd3h8A9LGD1Ijw2DRnZbZCkSOfWPbJWwHrplbCluptbbv3efGEJ2yr83FfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709170; c=relaxed/simple;
	bh=/u5Oni1B7nlk9985eSb6XttI0rp4egr161AKqYs7Iqw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hAmMz2a1T2U7Qt7SHYciV+HLKHwEa5GJpvg/TOmCc7XVfv+ttNsP0yguqe4VzHuiGye5MJf9UEzw6kZ/dzL7ck8rQcokjs7iGSavr56ANx3eBfVk5OoxE33yIuoobkMUpz+VfTx48QSLB1e0HEeyc50mI9EtIztXy+i6HrDObSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPQxrmf+; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPQxrmf+"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso3329795f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744709167; x=1745313967; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFv4zzeDVFt2wFNfc+l1QeY2z3r5rZGCAIJcj5O71+o=;
        b=tPQxrmf+ZVjSu+cK4pwn+KgCUy1sWtXdltEtqNlEeiEZZ/5y9oudAUSxVRonip62Jf
         pExsTxKZb1kEjZxFy8cLKlP6praF11spaDZQ7blt9iceCL28gva8mudUKfERcmmDLfUJ
         BxM3kPv1LXeS5sCSupjShcfzoC37UWRhlt4x2VYbP2B9jevDB/QqxhK3MMS/8dweu7E4
         ivnnlyA3TkV1bx1x2+/auO/5w7VZgeh8ns/TJw7K1zZRmYgU8ogEJz+6BLzgoF6x28EY
         XWSclsPKX97hX4tnuPxcuI3V/KFmOVqDw+Vlx5duTidtx4PZKbD4dIg+yyp0ntFmveFH
         UcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709167; x=1745313967;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFv4zzeDVFt2wFNfc+l1QeY2z3r5rZGCAIJcj5O71+o=;
        b=SI5pmN4IEevZHLHe6aS7ckX44W7og6HyRcmmLoVsBhkMzFzLjyxVHpEPpG6k/B1Sqc
         GwsiFrE5gu5lvuCtDAcQ2JnQ0fFMbpsKt5WU6PTJK0+KtNC01I59KnLbhwq50NPtQjYk
         YTQgbIVXHksy50emI2BiW0DQfgZ6u7i+RihorGBFeYZ59jG8k/9BuYX3FjarhdGnoLox
         w3aQzQTqfEhbXkTO1mhIkg46+PI5sgXLoLrJQCm6xPII1vKVid8D1Reg2oK7JJApvnUY
         EM8x1TdKHsGaYP4SHyZu3UAngSinzCeaLmf9sRAqW+HYzurE3qYwMD0KfHQeR5U8BCrM
         tpaA==
X-Forwarded-Encrypted: i=1; AJvYcCW7/Kn7kb8+c1En4qCMgS4tot3ooDnHH9gWzFfwfNYtmkPIMOKdRvgiGlZO55OKtk7RWeJjw47aeVTIWALS3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXPAVSiZ5+ZFLOLXyAwaUpCqLz/smcAiPRbivcABYWfKdtRXgf
	jwuYqLH7KFiRCuwJgDFo6NA44e6f+WN9m1z9FJVx1lNfbsaNvFS2ggUA92Z7vo9TTtIwLUoPlmU
	bQqD+KFwDdmdvXQ==
X-Google-Smtp-Source: AGHT+IFeSEt4wIOY01EI6T4xsz1Ma5642UUs6D/RIhqS/zc7ZZbyi0t98TnaKTF3Edu8clmB7G4YeK1q3rLrMu0=
X-Received: from wrxn4.prod.google.com ([2002:a5d:6b84:0:b0:397:c98b:1537])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1887:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39eaaec7a7bmr11167075f8f.52.1744709167073;
 Tue, 15 Apr 2025 02:26:07 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:26:05 +0000
In-Reply-To: <20250414195928.129040-3-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414195928.129040-1-benno.lossin@proton.me> <20250414195928.129040-3-benno.lossin@proton.me>
Message-ID: <Z_4mLRn-piSzuuf6@google.com>
Subject: Re: [PATCH 2/3] rust: pin-init: examples: conditionally enable `feature(lint_reasons)`
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 08:00:20PM +0000, Benno Lossin wrote:
> `lint_reasons` is unstable in Rust 1.80 and earlier, enable it
> conditionally in the examples to allow compiling them with older
> compilers.
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/33/commits/ec494fe686b0a97d5b59b5be5a42d3858038ea6a
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Why not just always use #![feature] together with -Astable_features like
the kernel does?

Alice
