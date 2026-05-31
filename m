Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B7284B29
	for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780253603; cv=pass; b=aGV3/AKCZ4DM2I4oN7rOd5LsQxD65CMyqwbO8UlxlfvC1/hh+nJCFXc8P9i5Do+SLBcfXb5ZazTbBiiGL6HFm6C9fU90afyaUM5gP5CDUmpMiyq+Snd6XoDleEplqnTUS0e8BYzU6mwzbn5ywCl2ey95rH45c25khfN/2xRL7cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780253603; c=relaxed/simple;
	bh=jgPxYYhrUPADA2UCr3MF6jfqPwTFJ6/F2LjSfEUcPio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqeCc71CKWDX9fJy3dYGZUWVw8icJq0t/BIuW0yAEpco7bFyfn4+LxdAaHkvr6y0UwHAbNg+qxz9Ja57Akj/qi3eqw4ZORkZcUq/LYXgiHTSG2LQLEL4KSfXtruEC+QvVtZAXmrtUX1nFgcdS17hFlurh7Tw8Ixf+VvPBAlosSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sg/9W1O3; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sg/9W1O3"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304e86ecebfso298663eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 11:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780253601; cv=none;
        d=google.com; s=arc-20240605;
        b=j2YeOzpgvQNEYBHXc74tTeRB5oYyggisNTbJdqaLNev3nSHcw5BC+Z3SnpJxC/BNfA
         r25OTx+zZBw1lXcyhOvoAUJCVUSwt2RIzFi34ZuBBBCE01EfdoDXg/kJogL/6v9YI62s
         5ExXDYLLoywLEnYJ1QJFviZpkLnQH5geMikOHYJC/cJX7fKrrr76Y5UjtvXF6Iu1Dp/B
         QEiXc5EiDJ7w9vwR+uhNZ8uRhGA5qR5mGDPEWM5QxZHy4+LTHx+NDC9X0mWSVXM4vk5b
         d5VCGWyOUUEMxQjGbkeWkrxcoJ01CknwFdOf2sT0gkPwH7BMtabT5PGjE4xY/DWvMaNN
         78nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jgPxYYhrUPADA2UCr3MF6jfqPwTFJ6/F2LjSfEUcPio=;
        fh=gvSv2ku6yzsdy6tYyaSL0z7VL5ZYmU9emwb4TvpLM+Q=;
        b=Pen9E0sUR1/bmGP/77uOZvZaVbn2DgrF5xSVuSYlFuqu+3aNrZPOTQgOvRCtIcZIuv
         w9e5qvbAr3Jb7awfGjY8dUBTGF7s1xSq2RRDsNpS46CmVOx+egcYLpcBabBUSU3HEtyA
         UiwKO5GUVREwmLz6iD00b05ZphtOpCaNpiEWHnOToZyuwi1OxetaxH3eBxDlxDt+/31V
         MMjJPA3wfdfPqWWltGbBVnfx8fYFmhgszZrOCQbEFwX4U+LAI3Om3P4SYlVY1wZXt2Pw
         KakW33ow8Fxv4NGCQCfvF2I6TH3qWsp0IvkWcLXVPiXRXcwmemcRUpsAvoSWE6veMDwk
         6/Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780253601; x=1780858401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgPxYYhrUPADA2UCr3MF6jfqPwTFJ6/F2LjSfEUcPio=;
        b=Sg/9W1O3KOSLGeG7x8n3RDQYPVJowCksJgEqkGI/D8ZXVT4XWXvQ/4PbAawaeiRlEm
         xjF/GE0GS9xEIcpKbWQ/B3wEViI+Vo1LYH6ysC8VK2j4RlvAvoBLJ4gRy//77JdlBP0E
         lLsw0F8U/mNoyIM0KoBV5ZPGmao6/tykgcU0brkk1izb5ZRsOKniMe4xcJ42I715rNEh
         3iLWeLAhT9oVYOXI0jeT/7OUPgOpsXzulRe2qtubFgEqZgYt3/R0Fj82v+fISefobcth
         HBjIG7AImD0onK2zpJ4dILRK9kWGngcgaEHv8Pm+hMC6PvD+JylAU6FaP/WCJLDFy1I/
         QjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780253601; x=1780858401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jgPxYYhrUPADA2UCr3MF6jfqPwTFJ6/F2LjSfEUcPio=;
        b=SxZHFTDVHkVHZPPcXMd+Q2t/t1lvhWhnQJHtlqJk6XqOTEMsB8tDCBcApFpwvtS4OV
         XSAKSUGX9qXz62UsnanfwUKLraixyPaRSbss7MqHdL54ivsd0ZFAD6xWI63oZNhcXMXr
         c25ZliQg8ct2EXdPDbsxBXfS27jRg6s/64nBXiYe3ucNkIMGzsIasFgK7VW8KYhE1if+
         C5QVOOMAHShj4Lq05hzkRwMHt+w9a5aMXKKJZj6yM0waUgtIQ6yJC20ZFWe++5NF52Yy
         j13fEGZ1uwYAPSDHq8iKWSC1lI6/XeEy/Z1mOfth3Ab3LdK+NZUYVxkHf2X4PPI++Tmm
         XUAw==
X-Forwarded-Encrypted: i=1; AFNElJ9VvjyQSgy5fZ/6frBB7KyGqe2VhtBwP/3gdcgA0v+gnWS98wjQhUd2uaY8zFMRaqF2OHTSTaP2e/QbWqcH9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbDAQjshQstidcBPe/lW4FUptDEWakS8SGBATdNGXSZMyIWJEw
	Q57K0y+4g091u/UL9qJP0f6AlXtSHLVXZb/x6Ru9yD3ExSXePHwDBRRcrf2LNj0aHFZxgfS7Zfu
	CTOUFHkhtNXrYDmVcvY3bj6nMPrkgaYQ=
X-Gm-Gg: Acq92OHnCLcexwupq8Q31MjQih4kk09ZJC1U/aJ/61NCIfFb1BN+MmBuQkv9zT2cVbX
	++D4wCXFzAjSHeBSHLb32cuxBiqnKRnKEGW6B8Z3GM3m89KsG80INcG+46QAKTjj2MatuH4Ybby
	3mf1dVqUb0Bj92DswL6g2U73gjtRmeUIOubEmYRBpBP+rictd/u4Ukx1NDJ43YLSR1BwIKuerBg
	pBP4jFNPZaQquYJ243IT6Dyxm+wJHnrb+SCkQDA5lh1MmWP+45FFcVAIiv/vR7ZQtAZanTJsuAe
	TybX2HBcOMRGJEhBqJMU3bxiOwBkPZeWWCNezTLRcyzlFjZCN3YNR64tu3dSu7kA8Git6tZeGPs
	+6oCoyX5AGpDMJLz+VtZA7YozfceoEVYqLw==
X-Received: by 2002:a05:693c:2c86:b0:304:f860:3ae3 with SMTP id
 5a478bee46e88-304fa49e500mr1849902eec.1.1780253601227; Sun, 31 May 2026
 11:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528062810.256212-1-work@onurozkan.dev> <20260528062810.256212-4-work@onurozkan.dev>
 <20260528082025.44414-1-work@onurozkan.dev> <20260528083518.66203-1-work@onurozkan.dev>
 <DIUB2DNTF6W9.2BT1NF6UXUOFI@garyguo.net> <b4f6d3e8-3a08-409e-89ae-ba5d612bae30@paulmck-laptop>
 <20260530062730.38077-1-work@onurozkan.dev> <3ef86db1-edc4-4e50-8614-2dd7270540b4@paulmck-laptop>
In-Reply-To: <3ef86db1-edc4-4e50-8614-2dd7270540b4@paulmck-laptop>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 31 May 2026 20:53:07 +0200
X-Gm-Features: AVHnY4LjPr_-R-w9GEV0I1IedUBZ4-Zsh5wDmqL_ofn06vbOsdcxe1NMN3VRKCA
Message-ID: <CANiq72=jVHEu5veW_k9B66avYgVR2aHDN2QmDny=j4EK2uRXbw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] rust: sync: add SRCU abstraction
To: paulmck@kernel.org
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Gary Guo <gary@garyguo.net>, rcu@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, fujita.tomonori@gmail.com, tamird@kernel.org, 
	jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 8:06=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> Is there a Rust-language counterpart to checkpatch.pl that could warn
> when it sees patches adding calls to this function?

We had some patches for proposed Rust checks for `checkpatch.pl`, so
it could be there (there was also a proposed `rust_checkpatch.pl`).

Having said that, Clippy's `disallowed_methods` is likely better
(modulo bugs), and we already have a couple entries on it (please see
`.clippy.toml` in the root). So I would suggest that first.

There is also Klint if something more custom/complex is needed.

Cheers,
Miguel
