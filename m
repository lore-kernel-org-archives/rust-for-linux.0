Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0698D231A41
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515767; cv=pass; b=ETA2NZrQOYN/1w5QJqOE++UdQ+pFpxj5ExNUHmy8uTM70q+1fw7lmwUx3Hyz/z6u2fw6ZbQhMxvWg0xKAKk1z8baoyFvtyKCTvChpRDi2hk2du6pwoYReLozPtf9+n9JhrKwbgiUtkM+A0LdBnFk3YkYGpd8X6cSEk8n0nSX6+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515767; c=relaxed/simple;
	bh=01GSOieINClQbTWiNGIDEavqyXKAQTpjChNDJs64pCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAln9cVm11F9uBjIX8teDPEwI7KjaSbzNG6MvoCC+rh5EMRmfGllm0HYjAbBBZA68gJ5g8GmFILumxq9KLeXMMV74Dyr1hkvDUXwdHBhY/FZtGtJJ7T6atp+/jchBWNhtaDe87g9AkOkCUTbhdnS6Beewexe0PRCVyr9r0FROgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZZI31/F; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZZI31/F"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so55195a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 06:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783515765; cv=none;
        d=google.com; s=arc-20260327;
        b=ovVKD6YlUiBUNYlWe0wB0dHBd6Wcf2K3Ex0SoFnr17F8tKE6UV9OAPuzz4prOH2Ap+
         6B91F3g5bAM7UHHnisR90mKYki9mfS2KXko6v4YI7u+hLPGfix1pU0Xp6IX9aMZrM1AG
         ivWGMLG85NWHtJuH3HuAIzYhCi8fHAi6NnRduuqGE0Aj5aWr90mXf7D9DElRHf2JiFo7
         y8PgWlskL4hd+I+kleke9DOkWPlYK1fLydATLKBgi0VVzj9JQu+ikehRfSlznE8NMtSG
         WGdt66rQAWOSN+P6h/Xq6D9JSuoxYNpH6oOySJGYGepGvwbs7OwSyheXfeLU5BlxEESs
         yvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        fh=eVfcZF1Sjade24C3SBHHOSwiFhzNpioPXvLtH0T/1b8=;
        b=Ae9Hs0xEN5L9GosvsJk8ETDvmbb5HYBmRVqKCBjoiKgiwPrX2JIWozGqKwCL9vTyA8
         mWtXVcQW/UO02WIYjx7vXUL1IEYJ3NuDwEbCoRPRjUlJxgI5U5FYEQfKfadBPLR9XVqS
         NS1edplza4w8Gh3FJdSbYtIhC2mwg8Zaj7j/SVDgmu2OtyQDQL3D5H5a+ExZddczehgj
         2+5v19zX5LbxPlontnG6VtVzDIMRHhSujozREKyIsD9Cr0GWeDG+kRx/h2VUBx/xPPZB
         gSCT7ABlAoiwX/yZJPnc2T6wl1nM+np5UzEpYdpwoUzKHMtq7KNv2tcjPIjyoHkWWkjc
         eR5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515765; x=1784120565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        b=CZZI31/FxNNpWtOly2DU0cXbcA+45474Qkg5GVMdjIxCS2OSchNs/Q0OhjpcEtZhOD
         inwHap9QQ6Rk9y+fHtPxiBYHoQDU3vtm7CWqCwBNgYEyJRCVEOa3RUN2E6ujqYp22y9B
         Mw+ZwHg4yseD3P5mGWFCKbfdJSRzaLpFMqloutDgjsaVT31q7IkFKP7NXiHqtskjsf7N
         tTc6vNeC7XGoSW084r+90OCPnkadmwy2AkcGHo35/LCUIbjtzc3gktWRTpkCa+/JMfIO
         lkgYLPJj6AIXlrlCTDKnt3p4zdevPYKCuW9eNcogHUp138Uy+0p1QSt/1dETv9dO2iud
         zy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515765; x=1784120565;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        b=TWYFcAqGTMhkXIuycu3Vtu4tkG8aXIX4+8jKpEMu21B+EWUA2ZA0ea0V7XFDvYGXMu
         QRahkZOlqBv/74CzWs385F1CpwAfdj7vZPM64sXUa5OQ9MmVNeMU8OTsT1E7rMYJHIpp
         vAJ9qBPUrV2RHyTdRWsgokxq5cFVVbr/TJ+6clhwO3LW5D8m5j8x8fLQbqQuhjyBDdsB
         3U2+29RmLcoeHgNPQFEBHx2x7WkAOrwbL8xdMqqTfQ+hrU/iI7j/FAZEmS7lFRY7V7Oy
         dz2FEw+y9EhgesnSuAbGk5ZD3L1vzyZA3jmGZSTANzJmY4z8PFco3Z2tCkhYcINbgusS
         1CwA==
X-Forwarded-Encrypted: i=1; AHgh+RoLskOSUm2xy++ZQhTa9TpT+OH7E3sYhx28HBbKlrlhrlxSYCSl4KDUzhKQWM8fQQnoxaMhZ2U6O0wMZUojtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8rCXmT36w80Rj/kIhPZD3RLHlciwGj+KAxxItFVM4IV2P/aH5
	SyubJLeVqKDyOuonGuEb6BP/UuNBPHwOKGFRbLi9bpF+jUIUH2csnNap4/GLVbJe/pDuYIT8V2T
	gvH/mZDCEquXJm3uD46uwgIU2HdHgvho=
X-Gm-Gg: AfdE7ck0gKzRupGENESxnf3v+sfiYH0d4exbZAijIl+KeKhKqd+j7InrSFDkrb22qiA
	FR97xGxPlRbzhaabR5OeOVVqHfKbZGuDvH1grseghKLdHMQ+lxcS2bnrWNcFoQv9mhcYuxlQzAH
	98NVi4C6xJfCDj5eaDw5EzNV5+sksxQjbZfkkMmaq2geY0iAfBTXwbB2XDe5dxq2e0rMmtumaU7
	/QyY9RtYL9iftpNAJxxvNLoIvQCgDCviTdg91rHNgkMLO0qeLyA+d+f3uH6/n6AyaAKSBDoWf3h
	IyLd6jRdIExbnEFQ+ST52NVDZgbbvg9+2caiukC1mcsOpqt4/ycyc7zQQTbiQOyDmufZt+QwH1+
	qhJ5QmsOV+5VU
X-Received: by 2002:a17:90b:568c:b0:381:16b0:55c5 with SMTP id
 98e67ed59e1d1-3893f97c879mr2063340a91.2.1783515764982; Wed, 08 Jul 2026
 06:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
 <db94b1a3-cc1e-47e8-92ee-976400209a43@de.bosch.com> <7bcbb466-0c2e-41c5-9c85-8b4e73348d1b@de.bosch.com>
 <CAGjpMsQgjBLTMt3PU8FHokCOBWc59YFagSjqcE2ZJSBGixLGOA@mail.gmail.com> <CAGjpMsTvHHbfaGXDTK+pK9j59wpAx1zitfgRDeC1NAnbt2K67A@mail.gmail.com>
In-Reply-To: <CAGjpMsTvHHbfaGXDTK+pK9j59wpAx1zitfgRDeC1NAnbt2K67A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 15:02:29 +0200
X-Gm-Features: AVVi8CfG8PaAXSQQxyc-sE5YJS5cPaEgoiwxvzqNgWwMzRipNLGngs0fOznfSAA
Message-ID: <CANiq72k1kdv4R+QYyROpJmO6sZBASCh+RwYkoLZ=wf8zTyUrHg@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: warn on Rust unwrap and expect calls
To: Harish CS <harish.cs.ss24@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:38=E2=80=AFPM Harish CS <harish.cs.ss24@gmail.com>=
 wrote:
>
> Do you think using Clippy's existing semantic lints would be a better
> direction to solve this in the build time itself ? Or do you have another=
 approach in mind?

The most recent context about this is that we talked with upstream
Clippy in RustWeek about this again, and, bandwidth-allowing, I think
they are open to such lints.

In fact, for `// PANIC`, there is an open PR:

  https://github.com/rust-lang/rust-clippy/pull/15969

Helping test and review that one for the kernel use case would be
welcome, I would imagine, since getting lints right is harder than it
looks!

I have more context in the live list at:

  https://github.com/Rust-for-Linux/linux/issues/349

I hope that helps & thanks!

Cheers,
Miguel
