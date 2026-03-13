Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BA617A2FB
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 05:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773381248; cv=pass; b=FUTiTx9e6kf/vebH8oC50boSl0FWww1RRc7+fc8aLNqF3Be7lECiRcplmiJ3J1HwMyGYDSDVyL6IjsRNc8dKsEmibAbm8MslaxEI+dLRQ9pRyORKoAMFrWNKw0KtQIo6eFniN0Pujtuclo0fIiP/Iwlr9nmd/oLJ+cGNDesbyG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773381248; c=relaxed/simple;
	bh=1O5JC40mgWM5zVrjpeth08KNuSHWy6NaWB4eNtTtZrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCW21z9gyqEuOl+D0f78RGL2donSQZt6oClN57pqjb8IRu2FVGgsqv70JkWmAwivmP3TSrz5nei3vXxE/7EtuPkrWbLSds/7heeCu8T1AqrdWZvSNwFTo135m9xfK0rqaF8DvyB/grB+Qu2vmlrs7NywtmUSJNDG5GJtNZQtWeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c13GKxI9; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c13GKxI9"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2be9ffbcf9aso72026eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 22:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773381246; cv=none;
        d=google.com; s=arc-20240605;
        b=kbZ6QWiiS+XZaoTEmp2y00RikIWQTgGElQdsI34cP97C0YTe1TUsmHnz30SvZOZp9+
         oIgvskIpL8nLOJUnPNHV/nU7vdSrL4SwL7v1dZfityEG45Y9NmZdrwlsSyUEaGJjI1Qd
         lpK4vwa41fWe9nIIzY2a6g43Q9rJFHS4wqKguU2nTQDKl7zkVJDYxIL/K9U41ZGAv5kH
         ynQlllDLiidHpM4K6d5axm9Gq4iOfz+M12CKeDWxwuQ/rcW7vu9BAywVVCKUEClzrSbb
         QOq+bFNsFo5/rS75jIT/Tc4zUjhzSpmnqQHqZYy1LYErRaxkBKV4dBFvybkN7c1iANXM
         XwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE0N7OKJt0SzGyOmS75dVlvrQ3qOhY0fM26VXEgbq2M=;
        fh=TDlW4ZiobAllxJuVu/2u2kmA+b8e4D+bt05ttMefhz0=;
        b=c8KuHx2Cohh6aow4ktqz6XhlQzWgY+rW28h2OWz9iBbC/fVjf/MANTUVEDT4G3Wbp6
         XmYVfgZXWmFBnn1dd8YV6yUghLDkrWHqxm9CIIVD07esNcDvnTkUfN7zTaqp9udxyCY3
         XEla0u/Rm4nEgJRJpV1JDfpnRXe3bBJ6i/bYUoG81RdK0/ECAsOs79dXPS6vEG21+6RR
         n1+PU1IgSWA3Cquy0SYAOppPYldgqkXd+WAeP54lHAeMHwBagyD7d028Sw3twErTw3HM
         KdBQ0zroB5sKNE8UecmGXhIvAvItBQQ/VuxcEDagJtHpOAtVr2oU43oujNFoweq/NrGN
         h45Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773381246; x=1773986046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UE0N7OKJt0SzGyOmS75dVlvrQ3qOhY0fM26VXEgbq2M=;
        b=c13GKxI9GPhGx5f2mVq/NSsD4UsMECuJHYhsYMWJyvf9tXK+6P5WTH+LX7vgSUfrhU
         z9siGXsWcnssQ87b8x3fXJIyaXeUnGQCIo/w97wpxgmv/b4Y/8LrWvuW+nBB5hsqRDmt
         ysbUSe6tnaG0C8y39BmAhfyqESVKA+ljT4hM8ntmAXozeThCVIP0+M0pZHzYi2XBpEcK
         Cf8rUWfTofpfVC6JJj7x44TqYhJ7GgZ6f7yw/tAZz27j0gHOy5NjJPp2aG68/cinajb6
         ccQezf4OYcYXEKPKQtKjBon2IWiNcJan4dXXBGZlqTW9v6u+1An2SoR7GWzS8bRvAzSQ
         o/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773381246; x=1773986046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UE0N7OKJt0SzGyOmS75dVlvrQ3qOhY0fM26VXEgbq2M=;
        b=daAoZibP8Jg0XK0z/lMKI8iJTIjpA8WiuT5v9q5D6h7m6aVUbI+AUuKrnmI1BtrCML
         PlNOhqp57Fv7g1ZtoZXaSRh9hXBRwah7EQ3OHCxqsA8ZbWPMXV8BeuZQIfTQF+5HEAHJ
         bQcDNno+az6MwxyymcKigygcKkJDlavWuhkGu6nz08Wz5qWKEaw/WcbTpcdHQ85dL7Io
         tRbSnjqvX2yMvnoG+aZTFUepqPao4PLCw0AmhCxgB3kEVo72n5GSEcx+uHrShM26i7po
         bnziFbFZP3+1MIhhYGT45Ye7wG1AvKEZ8VuP5I3iWBQ05vDmPKwBM/IGCIQEqnj0VHTO
         d3mw==
X-Forwarded-Encrypted: i=1; AJvYcCXO9l63b1VER/LSfkxDVoWkJtvHmdiuwd3LhhdfhOZ5d7M+5Jra48hQBCqkcJCRZ5xaoOprmFJEFOJSIzawGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKWbqDhvLZRkT4gPiZdo9KNlmM39GpBe767xDNDtlFUvT9KG+
	hKt7rpP5TVbdzxtZ4dxWJKq+lAm+WVWKJVGIzcGQTpALz95e437J9BBRjoTFHl6FY+jPab+on1p
	6CFAs6DIRByNlrkLJK46x/OAedHjvGzg=
X-Gm-Gg: ATEYQzx6tt8zVQKM4fl5YHZcJyqIWTCkfQcdUCnRq4wIx8pqK5Mi9B95okGlBxJFXf+
	BVa+KTeS3fakL+/M/C4SzMPXXh6kZ1Ms8PKmU6r07f3OKFFjYgFOGQFyd9Jd4TuZryEvsVpRVvN
	b9XRT6ZoYtiQo7cCINvrJep5ywr7rfgCz1jdAqZYq1/i80yJpovgYSzw7grXnlZ1hHHo1YYGodQ
	jAwIrA+5lg2kaJHAaVEQuzPxEvZtVwiQ0mbzFiiKjfXtaSMpQqQ+7wLIfYhUD1giinqGKlXz75d
	PqCFw51gd8k8se5nyZfRvJroXhU7vcLZneoEx3YmkJAgkrx1DF+xp+60z5vgN8SpUucgummKe0j
	xwEV53ew+nGpj5GD3FuF7N60zld3CxFyFSw==
X-Received: by 2002:a05:693c:3008:b0:2be:a251:b3f2 with SMTP id
 5a478bee46e88-2bea553709bmr543412eec.4.1773381246439; Thu, 12 Mar 2026
 22:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-13-alistair.francis@wdc.com> <20260303113642.00005774@huawei.com>
 <CAKmqyKMUT__C=4Lo5BhjB_QoaGHHNHQvxLmL4xuB54U=Rm0nzg@mail.gmail.com>
In-Reply-To: <CAKmqyKMUT__C=4Lo5BhjB_QoaGHHNHQvxLmL4xuB54U=Rm0nzg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Mar 2026 06:53:54 +0100
X-Gm-Features: AaiRm52U2RRbXymw9sLKGMHCSPSFMUzzPE02drckpBuanNBmfgA91wq9hM2e7sA
Message-ID: <CANiq72npg6Cp8EfvP4H_PKhSaenq=hhOvV2VyMesc+rR3hB0DQ@mail.gmail.com>
Subject: Re: [RFC v3 12/27] lib: rspdm: Support SPDM get_version
To: Alistair Francis <alistair23@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, bhelgaas@google.com, lukas@wunner.de, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 6:36=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> This is a public function that matches the C implementation, hence the
> arguments being fixed in the previous patch.

Since you have it in a C header and in `bindings_helper.h`, then you
should be able to use `#[export]`, which will do a typecheck that the
signatures match (it also does the `no_mangle`, so you can replace
it):

  https://rust.docs.kernel.org/macros/attr.export.html

> This is just how the linter formats it when I run ` LLVM=3D1 make
> rustfmt`. I don't really want to be manually formatting things

Please use the "kernel vertical style" for imports (it is done
automatically by `rustfmt` too by adding the `//`):

  https://docs.kernel.org/rust/coding-guidelines.html#imports

We have `size_of`, `align_of` and so on in the prelude, so you can use
those directly:

  https://rust.docs.kernel.org/kernel/prelude/index.html

I hope that helps!

Cheers,
Miguel
