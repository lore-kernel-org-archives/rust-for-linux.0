Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1C202C5C
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765905613; cv=none; b=qjWyb7MJJCO21zN/o3ElsZo6xmBJBoBGL6REcNhMFRNeF35hK1n/Rkal06n8nsVCqN8I4ENceN5iIP+WnIwk/tvzFrpZkvkAqClnwBfKSfVlNLnlgOgzVuimEQ01Ua7aCzSyRbekBPJtTJpQKdyhqw8E3l+11uY4BJncJKIZuao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765905613; c=relaxed/simple;
	bh=Q3xSUzpZVzpM72qz1ELqk18PlnXt2ts3aZ5ceF8wcGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdHraKJ5PF6KV1qv4CirbJ5jOHd+qTlPkRjBM42pnJymW8UBdRqwjhcgp9gM3dhiiVcaa87D6u088of3VGEjO7Gb3L1+0bAfKpBPwho+sOgsuj0tiDm3W9cZJwrm0h7BuzPo+o5kxkkSER92SBd6D9I0GEmGOQS523oxJmqmvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTo9RRel; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTo9RRel"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc305552so2747653f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765905609; x=1766510409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3xSUzpZVzpM72qz1ELqk18PlnXt2ts3aZ5ceF8wcGg=;
        b=mTo9RRelNpvtIRN1FEebCYtoTjkOiG75JQRTOkKdRTOmyXkP7RUOdyzXE4tTIO8jQa
         fuLzY5CBaeN18rUvUGKNvqN/dHonBaavBLsim/RoJ97AqdzQU1A/B1c/gX2C1BswIwlM
         3wKa+WK9LWJ2HHfCCjgpdfxx1ZVzFfr0iSAY9yc7S6FEhd+JezPdXpbRDSqeK+O3qbiY
         Ekk4AAVawc3lX9iP1nuTWz2GubEc7xUYzQrboZi4TK1EeH/palD/BpUNQ+v0P1BQaLkX
         y1afqt0yn+5/Rsi6QHrpItpORQAFVwRCcxc1ccJcfJ286f86aB+oJx141JzrVL5Qfilp
         kYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765905609; x=1766510409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q3xSUzpZVzpM72qz1ELqk18PlnXt2ts3aZ5ceF8wcGg=;
        b=eWu6FyTVbBryFfr8I5icRyHj1OewDz1ZvdQPCUAKPQznXUUCpZvdkFPDSUeH2BQ6Q+
         re15BUtoHMRvl/eqcvrBTHWX6aWGHGFgNCL8xTSfLaf/40PhjcG1A45gWJ6VpVF/HYyU
         5Tb6TPKckMuIg8gCNC6y0wZyOIpZOA9f68RvGagoZ9e1Q6Vh+g4eM9Go+mThmINqEiPW
         275/52turVVk20+K1OS4L7TiA9qWJvCC/qFab7T3zpRF9yq6zjwN/w7GLbn/4YtRqYap
         YVQjd7CVwxjon89jTWsZ1j7zfLRiVG001tL/bcsgsKrW4DskkFSKARnDH4Wf2l3QmNaI
         dzHA==
X-Gm-Message-State: AOJu0YwusjChW+jrMljFZjzMfstJaBBemblm79U2zz4G/4LW7VDqS00Z
	X1tYGXTt+dkaxN1ZhZ3RsuUVEkoRTpHt+FmVDpL7ci5sOfxlZEc7nV41XSPgblN9RNQ7T5ABVqR
	tcbIasQ1hJJdAKXsNS0dH8NeXPLGBM6c=
X-Gm-Gg: AY/fxX6eeXvbEpO/9BN9Av4nIPEmBajvPqTZnFIKdnYWLea+nLsyxN9EG6/NgH1b+RW
	Fstm3AkruFy38mkaA2xak7Ph7vvhFP6/8wUvLd6aX4MW6mkm2jXD3Fj2YV8SC4bdyanZRAq1tL0
	X77YeBC/dSDZhEhHZn4oUdVtPNXOwALtbnfATJskHwmiYeoU+rCrsDR0GD/OTijD034XeuWzDkr
	WX0Ve8ShZDXzVv+oI7HLSGzNIaHOO7OUZHo8l9up3YjGc8DQuYTMhD8mDCjTt5dLyZHUwlVU20K
	2GttBFcx6fs=
X-Google-Smtp-Source: AGHT+IHZzJ9MmaPu/VQj1S6qIKv69/SRg5KzI0V+EFB1zK9bjBi9qIGvZ8Ui604hf52nWS8omHX8esMDC2/jcQPwkwk=
X-Received: by 2002:a05:6000:1842:b0:430:f622:8cd4 with SMTP id
 ffacd0b85a97d-430f62292admr10212354f8f.49.1765905608455; Tue, 16 Dec 2025
 09:20:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO3Qcbi-bLkOGQdYRwCGTX2+TZuRyXrGS-GXmU=AzeeeUoa-aA@mail.gmail.com>
In-Reply-To: <CAO3Qcbi-bLkOGQdYRwCGTX2+TZuRyXrGS-GXmU=AzeeeUoa-aA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 16 Dec 2025 09:19:57 -0800
X-Gm-Features: AQt7F2pjySzwZjFiHlNkmsZ02WA3DAvIqs-qq6rlvifEU8mQzGV4ixmQsNk3A7E
Message-ID: <CAADnVQ+TsLfhJDa8ghqBHbP4wJCaB8CeMJa7SuDJoT6LavoF9Q@mail.gmail.com>
Subject: Re: [RFC] Rust implementation of BPF verifier
To: cb m <mcb2720838051@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, ojeda@kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 9:09=E2=80=AFAM cb m <mcb2720838051@gmail.com> wrot=
e:
>
> # RFC: Rust Implementation of BPF Verifier
>
> > **To:** rust-for-linux@vger.kernel.org
> > **Cc:** bpf@vger.kernel.org, Alexei Starovoitov, Daniel Borkmann, Migue=
l Ojeda, Andrii Nakryiko
>
> ## Summary
>
> With Rust now officially adopted as a core language in the Linux kernel (=
2025 Kernel Maintainer Summit), this RFC proposes a Rust implementation of =
the BPF verifier.

Not interested.
