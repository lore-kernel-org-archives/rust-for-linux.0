Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54431B804
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927270; cv=none; b=THWv7yy6/UZJqkOxygPJswSnKfshbMqO5BWOtT/5YwDECIdgu3oehGveRw1PLlnbJCHz1PGwTke1QA1RJTS+u2PJtHiC8RgdNZ/xioo7aNnzHVoRcXm15vVi8rioDxJD9QEQcO8bCQ1qEFR6P9eUyBDwvx//m1J2xyD7RRj6kc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927270; c=relaxed/simple;
	bh=7t2oOOIr4g6iyo5A9oCxWGSFWGvOurrVD62KENZp9XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sqe5E7Ut/fO1enX2Tkmn5pgWQ8w51zO0Fy1qI+wPJfHj2OpzgfMA/Wale/9NmhqPkpGYcPGJk0crDrYxXcD3rgPiWOEh3877zbkdqZlc72MKdvEIhGdIe5zKKVtgBFDvSmTW6ipI6knRH8z46cY59bzi9QmJIIrtHgxe6ebVhxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqW6EP3q; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqW6EP3q"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b9a2e3c4afcso194329a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 01:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764927245; x=1765532045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t2oOOIr4g6iyo5A9oCxWGSFWGvOurrVD62KENZp9XQ=;
        b=KqW6EP3q9cFInZVX2JA3CWzjl+PFeRLux18b0PiHCGwlMKcxbvLSHmQF0xJRDniF+Z
         kdq4mapyAgbKMgCWVCOCn6xGOYdVggIcy5j4WC3E/YnY5XJGdCgzMQkqxk5efYYRMEjY
         AXcEQ+2lgl5uZKnXNzYEDZunJScEZd7G1xeH06Tvse8LaA/VJv306MCoX1cV3Z4lz17c
         E2u/KU1X5BX6IwYq/5LIMoY6eM5731tKTpVQDP9Qurwo4jadb5w6kaPhki3WHOzZ2t2P
         kLVWQzfGGnVOxDxYar3Ss82YuT/fW2goUW0NViSN+641PnBGMBk9uAp72k2vdrWz4UO5
         vWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764927245; x=1765532045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7t2oOOIr4g6iyo5A9oCxWGSFWGvOurrVD62KENZp9XQ=;
        b=P3AlemNg3QX+fnR32aDWj+ORjnVsu/WTVJEX3equY7Hhey4SRe6JUimD+KDyjtk+EV
         EPVBnrEUxgXRh+kZvlsTRpv62c/CQ6PFOtUAGDMYGumBdaFjyy2855MBFYMYsqCo5P8V
         lm+faEE3aPiHRchvOj2qz93d/1eZ+Mi0XbMvfNxjuAw92L4lKhyNWOe/5xJ/uposuhvk
         umNduOu6WkP9cROWcYKzy8hIkyKnHHRCxrblqnlcjJSWvDyvpBfICLDvc/+BunfISzvW
         KOBAyXx6BErl4FapjXXem1mt24o52NP4jj3pN6H1P+1uvPBt+7/aEgGLQshc4PIpwEOn
         rTBw==
X-Forwarded-Encrypted: i=1; AJvYcCWWjqsCcsXjFpohgmgyQr6DO9B/AcsVcb+5l/spvHf0yRlerTJFJ/GJ127/Ha764kbHhLeybDiKp/cGyf426g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6p+s0D7CYjyraRL0wT9imX36NyJ8dODsQFyXm1Mmec4dZTo2n
	MoUKnt7OzTcKKXtUFBV/JPpMxgWuODTwodDkoqLv+nqhrbsdUzls59N1MnEjyfsexU+Jj3XrJw6
	jY/XgvCkyuH+u69QZbUT+kBGTGl0L0iA=
X-Gm-Gg: ASbGncuaxrYJOpqmOdMeKuAT6um+ro8gIoEH1Or12pvs61087Kv1OmKdm987xBPhfHT
	jnHdQkr0zQbwl9rKmRGxjj6CF5I4NUij8zhA/lM7dXSkD71yF+kKoGKk5fCIm1ceWy8xS6QP8N+
	eTUz4nnh99/3MJ1O68xkx8u7kifXas+4F0rftk0gNw2pxfLHgMV+3kws+b4AQGQRe0t0irxvfeH
	t+M5A5+rj9Qz+yAQF2DByOOrsYsHsFxgz6bfJcR6KxzxxV8QWi1dI3F/oNJEwDrJr+WU4D81jlR
	lYVqhh79kmtvEpcJ4C5n0qqcBrcVtRDgd8gHJXGEqfe0bNPEf2w5/9kvVRXgXU+TvjEUK4fGwKA
	HpOI+ZQvOW1AlgQ==
X-Google-Smtp-Source: AGHT+IFLd6JZGQx3xPU70vAUdLRVbSvVeAi5OK9jLxEIdFHA3xMD3dNxVxkvLbz2GYWKIRIMy5oAZJqzB2J0oobIUYs=
X-Received: by 2002:a05:7301:e0d:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2ab97ca970amr3901562eec.2.1764927245157; Fri, 05 Dec 2025
 01:34:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204160639.364936-1-fujita.tomonori@gmail.com> <aTKkF_hpmtf_VrAD@google.com>
In-Reply-To: <aTKkF_hpmtf_VrAD@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Dec 2025 10:33:53 +0100
X-Gm-Features: AQt7F2q9wt2cS4nx6Y0OPUYF25N7dgJPx3ggcXxgKfwC36ColBBmsmxMf69ztuI
Message-ID: <CANiq72n4Tcu5ENbAGVDcu_HR8h_2uD1O5Qu23opkTtbXEvoAfw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: Add some DMA helpers for architectures without CONFIG_HAS_DMA
To: Alice Ryhl <aliceryhl@google.com>, David Gow <davidgow@google.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, dakr@kernel.org, ojeda@kernel.org, 
	a.hindborg@kernel.org, abdiel.janulgue@gmail.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 10:21=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> should this cc stable?

If possible, that would be nice. I "unofficially" test UML with Rust
in stable and I have seen these in 6.17.y.

Cc David who does some UML work and UML.

Cheers,
Miguel
