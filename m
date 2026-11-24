Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513584;
	b=NjAEpK9WnQGhLaXINMJFas5whjsAhLBETLjitPbMxc3XHSeLmorJD7+/Z3Wt3vbnUpGn
	 HcB1UZZgNQDYX9tBOGB7VHNBeHoJsaI9E87JOJ8rFHPt5YKdAyXVtdsUN+ZrKelAOEpqh
	 8Ifruc65aouM50VHE80R2YSRY72vbMWrLF1B2bCXHrD5w7vkbbu99iRA6fQBnQYzEJGef
	 VMVej812oi5J5hqSTjmV9e71tUJIJBTKCkc3+yjyg73YLPGdU0sIvqaoSejkJyI+l1FG8
	 +Z0b590tGOQC92c5SpNAjDVMFozXW6OcTpr70UFizRHGU8Otwg1GbLXNacOq5LeuzqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mgvCyIDH2ZO9+zG23U8X3//E3hkWpB8K4IySBQbaBqA=;
	b=pqAZivtvdhgSxGJgRM/yzGRAXAjUQdwMiFWGPhYMSHjnESzop41XbcnhQ5EJigDIws6b
	 c2vYA4fdIPYf373WB7I3sE4KSxDl85+oRlqA7K3BRLlfhT5RYaKU6yNpTaOHCGd9Nyjs5
	 HLUeID0oF0eFk/syyrjZ/ltVheRjfa7JAyH+VVsGDPim7jjDplh9J6sXdy+1IPgOBzfgQ
	 ygLz53hEgcu9Aigs6bnSDt+vNtyuxEQBHDO5TDk+mZXPmOzOYWl6Y7pVNAlWo3MRHp/+D
	 JUx8zJIVxV2Yyoq+7iezB7Ake3JrcfxKh83cvYalYdxqdaN2C+4BwFSiXwzxdVer9ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BBegzI/I";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B16071499
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 09:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3B16071499
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BBegzI/I
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a68703d177so1991643f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795513580; x=1796118380; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgvCyIDH2ZO9+zG23U8X3//E3hkWpB8K4IySBQbaBqA=;
        b=BBegzI/IRnEu1g3h7lrmzdjgMRICinEVpzFRkYZuurzisJf2Q6LEpSSXbWpykbdSmB
         lyoGQVx/m1ZyvCL6c06YRKZ6yE7RG58tRqwOYxqIJhA1en4ZV1klLa7ByFdGSxnb2/Aa
         dQpOomFzSc10bKxZLqgtCbR9Drvz0LPXGjTdXm3caQc9WKqS3Sh0ou3OcVG5U9n+ibDX
         HZd5IjnPr7EWQ+ToX5l1OOYi9+18GEtxtNRKmqCp0rupq3wzB1tWzIoz6Krdkb4ULBfM
         cEg3lgIH3Ds/9sIDhuJ5h9S6yrCzuh8QtGVnuZqrAYvHzN53nrWj+lZNGuB3YfKpbpQb
         Ax1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513580; x=1796118380;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgvCyIDH2ZO9+zG23U8X3//E3hkWpB8K4IySBQbaBqA=;
        b=EcSL6kdiSxK86itK0jABzuegbHWEsAensusEH4e9OW+6TSKYWjgCZxSsp56Gsw7NaV
         Kgjjqj+pyIK7rJxkPaKZNNBlaTZqwHbXTqzWdu5sT1898E4q647/QR633irupjBqjokj
         x6GvoNpliujshlkA9oTiK2CMFbql0bOxOtFkpQiy7KvyiJSoTykX0dB7viNNnYwO/FkD
         gv7CeMt+MLJQs+V5oym+0+oiODcJjWAMa7yiSjQXUML6PMLefM/hkPCjsyokrJMX5+6w
         ULsbBrxcXFAKm6fpWk2tfrlpkyIN4piUsyrzKi9CZkt53skMWLjvBsMDZitCQ/DUujYB
         16pw==
X-Forwarded-Encrypted: i=1; AL+hErFA+Wo47DHJQRXAx/52k20eT0HL5VdyIS+MkQLYjNNWLbJHrhqMDpTqXUfJv0rYlUb+Q7O4nBNu5Svlcy+jDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9+uUjJCz6h4YXJ3nojbvEHGUBOT6Hsm0A1+n73mWy2hnkY+VEO
	T0W2lRs9FgkN6JP3qr3CSNnFCtuUVF0JyQkMXs4yMtGAEkMyTHDwgSh0TMl1PhOh+x7Vrecv/+9
	flis0zNgUiPJ6mf8ypw==
X-Received: from wrme18.prod.google.com ([2002:adf:e392:0:b0:4a2:e780:c3aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:298e:20b0:488:7496:15b5 with SMTP id ffacd0b85a97d-4abb4c7ab74mr19174607f8f.47.1795513579682;
 Tue, 24 Nov 2026 01:46:19 -0800 (PST)
Date: Tue, 24 Nov 2026 09:46:17 +0000
In-Reply-To: <20261124074138.450793-2-ardb+git@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124074138.450793-2-ardb+git@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124094618.1683579-1-aliceryhl@google.com>
Subject: Re: [PATCH] kbuild: rust: Pass $(modkern_cflags) when compiling
 inline-helper bitcode
From: Alice Ryhl <aliceryhl@google.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 08:41:39AM +0100, Ard Biesheuvel wrote:
> Pass $(modkern_cflags) alongside $(KBUILD_CFLAGS) when compiling the
> merged bitcode in both cmd_rustc_library and cmd_rustc_o_rs.
> 
> Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Thanks. I didn't run into this because it seems like on arm64 and x86_64 we
don't use any options where this matters, but it would affect us if we had
riscv builds.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>

Alice
