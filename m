Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A655227B88
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495337; cv=none; b=uq5JGsoWClDpwTJBWvU1LGo3xm8GZOxuLA0dyWKKoLB3D0rw11MREP1q76NR5jb3cK17YDvS1w02lLFQjK2+pW7Zx5HTAIV1tsQys4HytHx/FgkgvYPrmQjAjs7ptUf2niKisjg4XQFoyZ5pUej5n4GCAyRu9ii82wMf5qBraVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495337; c=relaxed/simple;
	bh=nhfCkn5afV+zWJT2i9GYqLFCbYKcMWVSCyMLBoUFUyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UBFmyDuRIeE8d9eyCWpmCYdzLhlqfGV85but5kb8N5XiY03qFicpcj15z5Hu7Zx7FdtOofqIcOMBmXDuoV3HyynVfXbx78vdgND/z+LNGCdPAzojvw0foaY5G2RS5ZD/dLLTwxgxxoGqx5kfYhQo2excCKDuCkye2FypSDdGfls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L0d2ZAVW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L0d2ZAVW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so5746885e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 04:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745495334; x=1746100134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhfCkn5afV+zWJT2i9GYqLFCbYKcMWVSCyMLBoUFUyY=;
        b=L0d2ZAVWTisp3aKH3Pb3lSxFz+MoWNVLiZVBR6mUDngCVHjM32Jn3cChNXdbK2yHg4
         Qr5ZDqTdlE0XwkidufYQcXmNyKcGM34VpM+arIn7wyejeeUs3tR6TiMcNpcgmZVJ2ofA
         F1k4KD+DNoKJYbZTUM1/nsFBQyKZ/FTQnyeroHFkSOMjb+6ZHvE8MSB5w9E5YhHz++fk
         umdcglF/M9C3dpe7jacHYiDC7eM3WEDkytWxTSkXu5y+jzSO540+Wm+wgU3mhHfReTh4
         SiN0gQOnX7bIQw+0/4PaNjjVjB91gjjx3rLNvN5J03hl73SuQz/JL0So5lahLsYm26M1
         ct6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495334; x=1746100134;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nhfCkn5afV+zWJT2i9GYqLFCbYKcMWVSCyMLBoUFUyY=;
        b=qbA5jNuP3PTTF561Bw6mgwj56BHj/evxnVKoU/hfK2LM5ZBmRpJUvW1kqYii62ZhZG
         4GwsC53f/b2m2p5mbIJJ2rZwfP1NXKjlcBodU52+SWOZCbk7gLug2Jh9annpyOrqs4oa
         OrDP8sw/csWXrunIQw/TBa0bv1/otXHiLOsV0yaKYinW+hHp0fy0318PWe/uLQ4pkhXb
         /wPbInXDtEbckJ9OHzsrBaoZJYVK/Qqz+nSf8gk9SxfzDz5hXRwLCZKUWoL3ifv0VIk9
         hNl4thaKWvANP28NDbdTDvJYgHtdAbArADyAgrIsWvw4vhJXOuefjFNrPvIm+O4zRdTq
         oc5g==
X-Forwarded-Encrypted: i=1; AJvYcCXi9ei+jGcURWyYe/k70x6+VEA5WkXtAJVghyTmm01MZsy9IfKomEKXb17Xax3j4CwIKWpudM9pdu0oZujjwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNlqLH6qej6Xyag5C8hJ4vf6OF+9VoG3DVXx7qZpOaJUCvxRNz
	WpKgGR8idr7jK6aNKxa4F+5Wa/cgc9wBK6dhz1jxTApsAZ3lF3xDxtzTCzcO4UyP8HLRRx8gd2X
	JwZMtRSYratiEaQ==
X-Google-Smtp-Source: AGHT+IFRK84dzOvIeFc8HB0WOHiRXhwdVaQDJrtHgwU6SSNDk1zrUXE5fQ6jYagO6EYR9o5uOoyyBy5GxZ4tt5c=
X-Received: from wmbfm13.prod.google.com ([2002:a05:600c:c0d:b0:43d:47b9:bedd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c18:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4409bdb373cmr25454475e9.30.1745495333949;
 Thu, 24 Apr 2025 04:48:53 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:48:52 +0000
In-Reply-To: <CAJ-ks9n5qzUBinofbWsrR7CH6zjqtB6QCs85L0JTzYw7JGcxbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-2-deff5eea568a@google.com> <CAJ-ks9n5qzUBinofbWsrR7CH6zjqtB6QCs85L0JTzYw7JGcxbg@mail.gmail.com>
Message-ID: <aAolJBv6RMvsmZ7b@google.com>
Subject: Re: [PATCH v3 2/7] rust: alloc: add Vec::pop
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:42:52AM -0400, Tamir Duberstein wrote:
> On Tue, Apr 22, 2025 at 5:53=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This introduces a basic method that our custom Vec is missing. I expect
> > that it will be used in many places, but at the time of writing, Rust
> > Binder has six calls to Vec::pop.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>=20
> Could this be written in terms of `remove`?

The `remove` method has a lot of logic to move around elements, so I'm
not sure we would want to do that.

Alice
