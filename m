Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8F5786A
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Feb 2024 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707833982; cv=none; b=tr4ZbvxkPODj5fOS+/2kX4WqQ0o3jh57ks0PZidwIaLoCa5xMXOcwzOTn94gnAZ3TEuDuYy3i9WikmuqcWIb9MtnEP9XgSDvgpS3FKsOnADQ3stWq6QBZxN7fX6v2u6nnZI/rkh8/EeGEduhOMlmVB1fYvmN71Aft6S0eQ0g+54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707833982; c=relaxed/simple;
	bh=+zhSIt0qtZV5RTWTlLFo90VHqHo8JuZcxOT8dUoT4Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0rL52eb8aEUPCwN0E/8vN8+CUGxpcxCwHSgahsi6QLEbX/DhGfiY+WAB/6XCpWjL+6MlLRwfNWPK7GIN4qyAKRNm/g3JjlewefMptKO8MzRtPjuFfaNw//+weE5hJrnNJw+vn+JYtab31hkZnLYUvOvT4bqP2ocVETOzzYu8dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SESKF8uF; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SESKF8uF"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59d7cbf1279so265821eaf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Feb 2024 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707833980; x=1708438780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zhSIt0qtZV5RTWTlLFo90VHqHo8JuZcxOT8dUoT4Nc=;
        b=SESKF8uFLIiTAqR9eB1wKmj6RbRRX8cZyvaYJZBQsZGHuGKtBxLKEBdZp/sh3+rW+r
         vFsxBkYtu7cezK9qwd7kHMDJzIr2Y6YmjKSfMKmaUOFYCgbXJxxnDUT7T9+hjXlGzVZH
         b/e8x/7gtZr8uJiZcYvQ1T0jMxaRb8LwXqA9RKDkvavXS0PLKxAPeaC6YPIVa1+zQ80t
         gFppsIWILNhU+TiBfCvF4MUp7SAgTacT/kTUdJo6qheeH0G8fpQI5ZIHSHYR+Bm1rmxk
         QGmp7LfbCR4Jd2YPCjhvmvoxKOP4O2JonWG59kzVQ9ye3RRyyHgcb4uPGtIbo4fXCmuo
         lVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833980; x=1708438780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zhSIt0qtZV5RTWTlLFo90VHqHo8JuZcxOT8dUoT4Nc=;
        b=DC4RqC5/DngLmHoaqBpn+qoSZppY6Xi9z4cFO/gcBi50I7S5qv1BVyHZ4XG2kjxUR8
         xX3U5VwHJW63+4VtUfbFf0bZFNuGmIkPy4bMXNTUD1/3+2hPNIYCjeu223gFwB6Nkll8
         4/PTD2dNmyXGg04aXEXgFGIeEOtzEotBADeIX1/NzlohAIBzJWoGddIzLVRGr9MPEpOT
         yOKm/UgsS76R0Hr3G0oA+IYL4q40YwYyC5UCU57GWU1Up9HRaghrVL9qnWk3i71J2EO6
         6zbogDLZtWUQ+EJs7AtvegsCWIoTWVKdEw6I0O6YQJ+T6A7hLZrlovtqJiDh4r0FONOP
         CVow==
X-Forwarded-Encrypted: i=1; AJvYcCUAk9nEGqoOeEnaxqSw9iCsv0pizKtWXDMEbhE7GVe3ARluJuZmsF0Pec9GMNchc/hI9AU90JqWh2OuonEHX2kJ9yxvMjzCxsCWmsd3U5E=
X-Gm-Message-State: AOJu0YzbIQ8chzO6d0ZL/me3yBxVoHspBD4pcsMGH8smE4aN4ZXQBxZj
	9UICiOTX2TI3ovlSNXGjxVRmm5/cCX2pY2iRYs7jiHuwmbHKOv5e1kUpdVguc/Q/qUQkLGxHXXR
	CLxBnSr7MLYg/wY8YrrPvWOMmQ65R2miflPFG
X-Google-Smtp-Source: AGHT+IFGV2cuf05umKWyaF8qgM/iWKpcM28es4dunNmKzKHkKH1tyJ1+fkwaegZnOhlMpH/IXDxiY8tlEYEB5smmJVw=
X-Received: by 2002:a05:6870:8a20:b0:219:3d17:63a5 with SMTP id
 p32-20020a0568708a2000b002193d1763a5mr12034734oaq.13.1707833979998; Tue, 13
 Feb 2024 06:19:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130023843.11512-1-dakr@redhat.com>
In-Reply-To: <20240130023843.11512-1-dakr@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Feb 2024 15:19:29 +0100
Message-ID: <CAH5fLgj-0Li7E4KGKV0e1-dF9x6TQXS6E_KyagY2ndQV8MSVnQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: str: add {make,to}_{upper,lower}case() to CString
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 3:38=E2=80=AFAM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> Add functions to convert a CString to upper- / lowercase, either
> in-place or by creating a copy of the original CString.
>
> Naming followes the one from the Rust stdlib, where functions starting
> with 'to' create a copy and functions starting with 'make' perform an
> in-place conversion.
>
> This is required by the Nova project (GSP only Rust successor of
> Nouveau) to convert stringified enum values (representing different GPU
> chipsets) to strings in order to generate the corresponding firmware
> paths. See also [1].
>
> [1] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/to=
pic/String.20manipulation.20in.20kernel.20Rust
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Not a deal-breaker, but this comment of mine still applies:

https://lore.kernel.org/rust-for-linux/CAH5fLgiwRDcyaxbcUNY8M1c_w11vkCWyRfq=
VVrN9Sgc7XYT0xw@mail.gmail.com/

Alice
