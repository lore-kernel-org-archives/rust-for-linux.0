Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46E223369A
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908711; cv=none; b=V1FpOLPHkBZKh2nWmwOESryiJlebpeBEu0/tT6wicPqyQSim3TRCVDFQvbO6eI7+eLlYyTXHQ2dZIQM3evozfBdIunM3Ol8B2/5L7ZM2MuYO3jMfouGSgLj7zZZl/7WwzMQmF1Jkla5B/8oybFg8qo3RNRrrn3GNWaGlosg5dzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908711; c=relaxed/simple;
	bh=3vHYlP+vndcNXuZOI6XprGkQpKc6n1GhE/RqwAQGt1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTHzHnfj6pzLVN76coj2XMKrP/CERpcCQpSREa9Ri4qvlV4u8f3CVg1DqRjysEADU1tvk7XqNhN4C1G2AhEfrSTdf1iIU257uquu+uE0fBQVUd3501wXBWSo1J1Aa1Tx24zMzeVB7GpybbWFi1tkot7SLwTF+dJiTxmuO+DTya0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ap6NNcZV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ap6NNcZV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e06af753so2848108f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733908702; x=1734513502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vHYlP+vndcNXuZOI6XprGkQpKc6n1GhE/RqwAQGt1M=;
        b=ap6NNcZVR9tEdDFafFXVp8tZwW1IbPCjW6gAJOCL8T2Yeu/XM7u5+iMinmN9oD5r2L
         0JNFgDECbdlm/XEY5pAJoB9z4mqPISbUVMQKv/9DVRX7eDN1PSHbQv7ukZCGhwVrme5U
         qwDjtLamHKHP9xUVzThABInaLbgV+AEeDJ/4W5w32lD/9Sa6O/JFwBy1PvRWdoymYbhj
         mhF6yt2jvO7nY0lBqA62zvDTUS4EGXyMIcXpNwEMmkr7h6q2iIuHoUgq5xvdj2pTUJiX
         QkKEbmjFe8ilJ3apuPAu1lH7zLbnyi9ZTiIaSZD0D+F9Q6cxpmlfgGfe9rGdTyGgzR3H
         7UuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733908702; x=1734513502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vHYlP+vndcNXuZOI6XprGkQpKc6n1GhE/RqwAQGt1M=;
        b=tWV/7C5cgu8HBw78o5azwxfTxjJXW8ghwGO1aiT6xWdQri9nW0+B/Wd+HXLnpEBYfd
         0gvD6Uo/VJQ+ZnyWR1z7e/1p1Dl2ojsGzGCCwBxapRwbzD8w8UuyQAj6aX+1FRZ22G4O
         GUZcpaT3MNNYaICbl5nyhy9MuKMid6aB2cHmZhfFhri6ftRoj6tjfoSKxp1hm7vy0Tkg
         KsRdf2E96atO3ESlltsSmy/OapeSgJGGWZTufX9qFwGOK/I/+N2D8doLpE92MMhBlz3w
         RHG4MybQMGXRjeaPAgxOESHU/UQhZlT9jOdnZcXKHgp+f9/vSW9nIOeU+pNb2V0joCqM
         7tXA==
X-Forwarded-Encrypted: i=1; AJvYcCXWSWahdXnuqzk2pEZORLfrm5AltOhZ9l7nFGupUtyChHN0Nuivg7zGkwZ1TVzRnZsP7YVAczZtuI4G0wtLmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dfRR/AYSJdS+EqSg0msmfQL74jFNdtlxOP104QhFDE7p8Fxa
	NtfaR+OPmAI+Sux376gRs6XFkCuGFhThvRnfWfOq25FU/ynm7lBOFa3WCEGMRRb/lDlf3UMqR9x
	Ki+zrD7P/fUll46jy0SGG6MsfHB+b4mrCc/p8
X-Gm-Gg: ASbGncuXI2ljUH0ku5aTgCmmqg0AR0lrG/Z6b9sjOaEEHzHP+x+kQEEg2MlBUY06GxB
	y02ubNcuJV2Yrpkut/f6/aK+lmgJMbYcCwUCtgRpapzk4xWjuvWE/qojUg6VUBbKfqg==
X-Google-Smtp-Source: AGHT+IGXlwylyC3zJtiNHL0Jm3c9KPPDvqnLEc6f8/awzTY/st7wW/grsH5pHA1x0LnLhySjtkPO/7zB4NO4hs7+tfc=
X-Received: by 2002:a05:6000:18ae:b0:385:e961:6589 with SMTP id
 ffacd0b85a97d-3864ce96d45mr1556644f8f.20.1733908701835; Wed, 11 Dec 2024
 01:18:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210224947.23804-1-dakr@kernel.org> <20241210224947.23804-6-dakr@kernel.org>
In-Reply-To: <20241210224947.23804-6-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 10:18:08 +0100
Message-ID: <CAH5fLgjWGRCzy9WXVd=ggi5=R6e8Z12bq8yYwAQLxLMH-uObMQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/16] rust: types: add `Opaque::pin_init`
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, dirk.behme@de.bosch.com, 
	j@jannau.net, fabien.parent@linaro.org, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 11:50=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Analogous to `Opaque::new` add `Opaque::pin_init`, which instead of a
> value `T` takes a `PinInit<T>` and returns a `PinInit<Opaque<T>>`.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
