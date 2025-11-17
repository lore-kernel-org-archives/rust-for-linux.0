Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA97E30DD03
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363082; cv=none; b=M38UaEND2IJ9YIOCXuYlEVNCg5H6OLW1pfdrEcpVgET9uD4+KI2SPMawjy+bwjEOYS19WasVRm/2XHLHQjbBqpVPMnRHqjRmOt5AeP92HcRMIVbofShBXTIMgBOlkluSiWWi7aYbi0WZrn4F4Q1mQalNSBhLWZHIjqQPgcudo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363082; c=relaxed/simple;
	bh=CYPw329zmkubMZ4Oqp3vAoduc8Bm9/LkBfg4v4vKqr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcsl2qav5oKFW+vE6a/VCuzbE6xVpTl2Ls+sCtuSPx2IU6IU8PRONMppmGjQyq86eWGWz0JWqvRG7zXUuTJTUSZDhaA23/WoHLf+w8iSYKfHLZUsxfuMBaCxpPSGddRCZGYwgC4divIfYtRnaQopTHDRHLdLboCZESUE/T4048g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+KcNBzA; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+KcNBzA"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso328229a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 23:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763363080; x=1763967880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYPw329zmkubMZ4Oqp3vAoduc8Bm9/LkBfg4v4vKqr8=;
        b=R+KcNBzAAtB38gMoSP0V4W+ICzrEBQk5VbtjdMDIloAnAlHWiaaYxzECSsSWAJkblp
         qDJ2MW0Q+Q/fFgQIGprXWLo8T4Ih8LG08FAY3EXrojtQ6Z4ttcU2Q5zGvP+LWsWA9Kn0
         1tXEZNzAT9N5yqztzUcRSQjDxiejMfOYPBsq+QteEpeJVQJTGR/Zc75qn3kZlorZg0fw
         km2RjXF18X8QvvIxgzV7MEHAjJnTRZBgkU3/c/QqX6kqh2ZO3cxYFlTXJ/fSdXerXfyG
         /ni9Mgn/Af1IjQ5qVeg5ZUsH0XJXaOxKjsE7DFWwYB9RfcGQyCrkbNOI1DcORydnt/cp
         v0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763363080; x=1763967880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYPw329zmkubMZ4Oqp3vAoduc8Bm9/LkBfg4v4vKqr8=;
        b=HRj+9B0HoeQE1X0hwCIZ5crlZ3TanYmNnioIvRgeruLKJE0D7CZ2Aj0HXPXFgW9KiW
         2+eHQkvRAt5emOhk+BdV1oDr766NotlaCBN+IofczwF5RwxemCD3mkyubZLnuTNUWrP7
         X5cTR/mqrAlvjuwVZa2lpzVn+NvqS/WgmDhYzhp0Eh1+HzOG6fAVTvontDVHkrGDgiZa
         mlRkL4b/NazMnK9lUBACLB8TqZraCtPS3brC6sGin4Ik4HfSQIxzLTteLwpviUkKNjnJ
         LKIq0TRwjLTv/inxawwTH2BRZ62H3HOwpYZTa+53PB94dEZ1GxrLkCvgFMOvLpIIGM6z
         0yEw==
X-Forwarded-Encrypted: i=1; AJvYcCWkIDVsz3Gua/FXY+IeiMut37Wnmff5fm9IVK9OxGxyvSy9P8qooVxoYgv3rnZ+0ZDqsR5s4MLaXQRHi6c65g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSq/xVCIJlWor5sxG2nL1eUyurIgaCgRBThXSx1OX1KDL5tYv3
	JIR3QHrANXAUIlRWYg4N17iQWo7W1zKk0S2khfDJEd/Toje7YiGin7FPhgN/oSs2tIbpfmACLW2
	Qii7rRC8TNjyfOzthbhRnpfeQ29EO9oo=
X-Gm-Gg: ASbGncuz4/9BqAM3TBmnfqtcs9w+//98u/nQvwRlKf6SPHiyXJhEW92IwIcsyfc2iUn
	cu32EVGmqEwi1k0fgjtVnVTMP7tBzUfMKD2qesdD+tuyuv2TfGiHf5rRQRGTu3zLsW24LnWPgUC
	XQ1OrOZGUInbZ79o23fZX6V40LmwZrRMRjn3UR7tloKeJAmN4c8cVQRp2e4hTExitTwN0w2xcZK
	umdBJg+vXxL/r9BVPKHQwdBESFaGggNABqCGebb8JnlfhDgdOFb5RyNvZNz2zFU5NMVfDOxUt5K
	HvP92assJYf7wslHSfotnfv9+jcNS9bwSxQG8F/6UcJPwUETXfzweqYRO8NpD/YOXXk00C15K9f
	31fA=
X-Google-Smtp-Source: AGHT+IFF6tPDT0L4yizZVI1c10ZclGyviGsHkCQk4kxS7isKo2vtxkOxYRW0hlhC0Uw2BCeIjdVEY0/KECyEd/erkGE=
X-Received: by 2002:a05:7022:e0d:b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11b493dbc02mr3847201c88.3.1763363079884; Sun, 16 Nov 2025
 23:04:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
 <CA+icZUVcHfLru9SRfhNGToiRmyOY+fLw-ASEvQakZYfU1Kxq4g@mail.gmail.com> <CA+icZUWqLbzK4ANrx=MDhhY9UFzazX6O3izbQeQ8bF0obuhT0g@mail.gmail.com>
In-Reply-To: <CA+icZUWqLbzK4ANrx=MDhhY9UFzazX6O3izbQeQ8bF0obuhT0g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 08:04:27 +0100
X-Gm-Features: AWmQ_bk19CSqQLRlb4nj4Al23oXTqmCbs9eMIWMN-W6GK2KEEvtJiaTpGvDsumk
Message-ID: <CANiq72=4-pM50mp+_0_+gEsd+Yu6m7yBaajnq5YZzdGOz7iGkw@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: sedat.dilek@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 6:28=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Tested-by; Sedat Dilek <sedat.dilek@gmail.com> # Linux-v6.18-rc6 amd64
> with LLVM/Clang v19.1.7

Thanks!

Cheers,
Miguel
