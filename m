Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FC339D6F6
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780598683; cv=pass; b=UOdlXd1rl8r7XGPUpcvwpmyfNS1uJ9laJIjkb0PhuA6XeFp8+XQZGuSoL5UdjQNFRmkDr4X32mBQgkjZ4mii9out6WWYHw1KsHjlzVKcEKyWL+kdtwYYHub+m7dARUw4zMdseBhBBbei4HfDMBCW13t6lI8eghVcB9eTh4iTAGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780598683; c=relaxed/simple;
	bh=xPfKe6EbKcYxdvp0/jDHxc5F/Qx0hqbJHwqSktbCkXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfJi0JPgE1IEVkEGJ1b1NKS4UIvn0K/aaVss/yT//ACjF43g6itBGdP2Kr9rmkBStxmk+swpUhoLf/NxcPzE0lAV7/4xIogIfPyBqofcdrRlGxfd1VQKFX1x4D5tCSWu1sjX030S/I+vCnH16hNoxIFmHIEarFw11dHwBL5DjOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDsrLbZQ; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDsrLbZQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68da4e45so95910e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 11:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780598680; cv=none;
        d=google.com; s=arc-20240605;
        b=lqMv88pnF9eWuHVvnkZRx1g2yY60ydVrQKL9c1m1jaTl2JSIgWClG708CfOZsDeA47
         svJvxsjQNRaET061Sl4MTUg25DDxn8xFzvHW6rHXfi6UqIb1we7G05cqOIEOwCwsWkgq
         f0cRQDSQfB0tfKYED3vrzelqQWQOu/Jw4Y+rS67rWLfwLbbpCYqZ+ffARvyWj+bqdBlQ
         j/21sf3AL+JRDKkIqSXp/SqVrDpa8VAh7t0os0+nD+sYDir5ZGXMRU7HSsWImbGRnIB+
         Nb/maN4z+uFY5yr6Vze2XjnZUlsLRIkVLs7w+6gAHR5WUs46GRklY1O+wZOig2JMhTFW
         DvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xPfKe6EbKcYxdvp0/jDHxc5F/Qx0hqbJHwqSktbCkXA=;
        fh=r4FGeab9CQ8VUdIPTWGzk0RwI3uL0nqyM7gPt3LwTBs=;
        b=QI+80WYy3pE9FZugLTkSfboZLesRelmEAoKd4nKFRcnLD/kIrARgA0EDQ5hHadukaW
         vWbCNaRlbAQjF5Y06rLLNPE0kwlrQRXOKjWQt3PHONlWXuQWLrt51BQ6d5PrZ8DIiVz6
         ifHt8eivoZk7vNgNDVamsIklkGif5xj1uwHgyRVf7SORJcN2jIlOem/J1fnLhOSh/oDR
         M6Pu7+PBWi1ysTkCfJ7PusQFFaXlvQecTLF15ddZywqVCCKltKICxpKnyBFoOBQqbZzd
         V1xlGeJGf7BDYdD2fjzHpCp2um0D40+B2xXSckEWGDwPADNYvdlAmRJqZbgGYQitPC3v
         Q67A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780598680; x=1781203480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPfKe6EbKcYxdvp0/jDHxc5F/Qx0hqbJHwqSktbCkXA=;
        b=eDsrLbZQph/iF63QuHo4KTO2ckxTE74etgUNuMw3U8rLBizGX1DeRubXF7IbXRgFZe
         KO3U41Aj7oyd+x8qlkK7MmtzpRAmDGIBl/hhKfMCOjGV1eIZEkDl4uDb9Q+Cl2Hjk0u+
         H6EfX16DvIIbeYXM1O3yBmZ1sMnR8xZa24vGmpbwEkNaKF7HU758m1VTJI4OE1I3cAzF
         HQwaq1Lgd2Ka8YFLfCVH9Z6DsiHmzeRagl+Er3TwyMYcl3vytJcnhneUpTGAnRcywV6r
         Bcd/BGV3rqIfXqJymye3lTJ9rqidXJ7uPSSwy+6wLbPNk5zyFIA6opsbVm0S/ZJgpekX
         bSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780598680; x=1781203480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPfKe6EbKcYxdvp0/jDHxc5F/Qx0hqbJHwqSktbCkXA=;
        b=O0yctjEQPiQdI4WsOvVVFX9FpbHFUwRVzLj2y/COp2ml54u2SUzssb80BM3xeZq5sG
         o0aI6IViqK5nVzs7sbTagjhI3+godfTx3PyUz8k6Wik0v7ZnGwm5g5wZfYOz9ZDyZx8j
         c+Q/LZe/dlzoDeATD3vLtK+BqX2pqHlHXv9+e8Z4PFbegopgghXvmfLW2PvPAX4SHoU7
         VvkqgEfzlJTXWscajN8sgUeyOBCwao3+50Bz8LL2BjBYOABkcO+Lqzf5JrRZY7UUk34x
         HfG1qhzLou01VKlb0ekuy57JTECIgGT9t6JnYp2GTaHpZFruyHbgMk1Tk0EhPbcQjdyJ
         BB6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+FM9FEMLvK142pTp+6cgUiaYRNd52gpL2SZ2XMwWt0kWUKK0d6jC5M/yqJ8R9IMMAh0ECsORoZedWcQi5LLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiS4l/bqjZtgTdBkg+DvjBS/3VFt5dFqeCg3aOV3nEyF3cBaJ4
	6EmlhDun6m7RWSBDR24B+AmMosXb4318tlJy8GfysX2VO6JEBo7gFQNJ38aLoOVSkXTasqS5y6u
	1RzL/hWaLmLmMzrLG9xUkC9OqcRRJeqQ=
X-Gm-Gg: Acq92OEo52RyUups8tXj4UZ6x/vCBJaFcFCexFtarzz7hOY1laI0rwGfWgn3rgoLDRZ
	6HfrxJ/drtKLs63HY25IDtUbL8GQxhR5RbTbLFv4oEoUP/LtcYuF8IaL8TyCwC8vyVZsyeG2a4s
	OAAkk/W8JRkPkc5ceGUBk+EYr5CJSypt1nSE0SZKa9vR5nxBLK1VuPO9dJh91a5hePo/u0TYJ26
	Lgc4+culSnuAwnm5HuUdbER28e4b39yQ3Sqk4S7UV5emJV9M5oL+fYNwYaCo5w1jmtkKxTAuPK4
	YlFZbfcc61qe/qtCLywkKntOU5to5N0dRhybAJdDK5NvLxpRf3qNutHnAWTgLNNh8octzF8yMVp
	XXkpe4UMcGQaW69B65ay605TW+S91QsxerQ==
X-Received: by 2002:a05:6512:10c3:b0:5aa:6ec6:2587 with SMTP id
 2adb3069b0e04-5aa87bdd564mr2389e87.4.1780598680290; Thu, 04 Jun 2026 11:44:40
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502160057.3402896-1-ashutoshdesai993@gmail.com>
In-Reply-To: <20260502160057.3402896-1-ashutoshdesai993@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Jun 2026 20:44:19 +0200
X-Gm-Features: AVVi8CcNzCZfGdNa43ETXT6gv-24GRawVHzD35mqaRN-rSVvDK4iIqtny8Vbqn4
Message-ID: <CANiq72kJBH-4ENoLRLrezbcRovYGvx-TLODs_khOJwtr7dMz3A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: add #[must_use] to GlobalGuard and GlobalLock::try_lock
To: Ashutosh Desai <ashutoshdesai993@gmail.com>, boqun@kernel.org
Cc: ojeda@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org, 
	wl@lyx.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 2, 2026 at 6:02=E2=80=AFPM Ashutosh Desai
<ashutoshdesai993@gmail.com> wrote:
>
> Guard is marked #[must_use] since dropping it releases the lock. GlobalGu=
ard
> wraps Guard with identical semantics but was missing the annotation, so
> discarding it would silently compile without warning.
>
> Similarly, GlobalLock::try_lock was missing #[must_use]. Option<T> does n=
ot
> propagate #[must_use] from T, so the attribute needs to be on the functio=
n
> directly - same reason Lock::try_lock has it.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>

I could pick this one -- do you want me to, Boqun?

Cheers,
Miguel
