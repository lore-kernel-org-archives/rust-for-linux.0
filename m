Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC9733ADB3
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762869541; cv=none; b=m/bNzJ2GvmlSaHwZJwipRr3quHtrWbRQRdB4SBANPK+GW2lSC1JBUmj/X65TrMRRr7gawMtj+6ANKOap38zw03FezcRmwyi5kIiOCR7AzN9anqG6tNqSpRcvATQVPZK7lqi+/RvFxozclNItSEvMgW6x1F3nrQZmxVSfc0NQ46M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762869541; c=relaxed/simple;
	bh=hRUmzVbCzzL89fOTZQBAaUfGAwTMnx1MK/93dcHh+is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9rSO7lyymeQMTofSZrJdNJA5QC8MHUTKir5o5Kt5h0Hcqnpt0Qxu4sGtyHlrt+253vZTT6gPQA1XIiRuxNHSpr+zqBuHZkInO+cVhBqFRg20BwZ7rlE/7tPRqQ4SipbpAb/DUhOk9E11VyyC00/tiRX9h5gTw/UKj7DBaRJQmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZsUgUUo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZsUgUUo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297cf964774so4855765ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 05:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762869540; x=1763474340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRUmzVbCzzL89fOTZQBAaUfGAwTMnx1MK/93dcHh+is=;
        b=YZsUgUUoLezCFU0P/y4ACxySgN2oXPKkH5rAUf5K/Knu+yjMKYIEAtI7YWLE1CRREH
         G4CuuxoaTEockrL6hXAlWf0lY4nQRzzL80T1q7fmEJSsVau+53U9PGuFNWSL/5ALXvZ9
         gY4Gy8aWTsH+WCrDPGfy3++IOkelaCvSmWKF5ReNu5O7A3o5fX0ZZx4+cq0XO63GN9qd
         bYV9JSbp9+UvllV9KKNUO+tyGt51I3QqMtssFeRcwbmHn5h+RNSgJkV/O2Rnzmtfj4zK
         CVY9Huk2VfkwFwl9kJtqYxHo8j5N51q9r4sCHWCJUmcuSGkPkMEVb2wS/9+OgyV+2kBx
         vg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762869540; x=1763474340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRUmzVbCzzL89fOTZQBAaUfGAwTMnx1MK/93dcHh+is=;
        b=jq5vu8iNEKRSmsR62aGb44C0h34PjwK3vxHQqkCXw2wCvwKv3rfv9X76PzuTpZhsE1
         GuqiOehyaNMRfhH2Er3Ig9ig072YMUIK8qRxO/suLc5gEM5nPVGQ7wA7SkUJH4fy9VCq
         fZx7lmpyDnP944WW3PaXff2erml9JOjKhyhU8aCsAFLboS7qaKVdwGTx2smOdtZayhng
         PJ1J8Zdg55M38zF22MbHvjBQPICQPVFhyfuuVzWi7fhAabwlrqcdamxhry2RjF80rpNj
         XYQgxvRpbjJHi9gxv/qJo5wWijuTEkaCvCJj02a8l6rdhQsCeSA6q3sgRYU4J0s31zOT
         in8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNpPDujK1IJYH0B0U3aWg/Oi5k1JWNT8D6YvvzhvB99pjgwhxXUffP7HOAw6cZY4tOLOCX+1o/qQE+rqQowQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa20YFTuZFK+b/RZPYdfGbjfhbHKuoMCRJhesvCCdmejyHdfFv
	E95oeXZRntJDTu8mHvYZa6cUb/ntVwrPgJgwKXsTMwyYXgOfooBE17B3IYKUlgei4KybXQC/4Cq
	WivsvMb/eELhpgONet9/IqtJPgdMQKK4=
X-Gm-Gg: ASbGncvmdpOSUtb/9hnwzmP99NRTWMVR9UIq1X70sRKmMVXHzEWk/IAp7aH9OyCostb
	tjMExSm4xcDOVcNUrpFhyJ2f9g7xlZhls0FWcwqol0IrtVcu4zZQvqbav9vnzYsPLUyvZIzrp6K
	1vceMv4h6gJR1FXYcstLm5vdxEXmS1yHoYYgDOnOk7Vk7LH7FRWbvjNNhnttQLE222yCERB2AZw
	ALfVHoC2rt5eVvbNUQhYFgUOMidQp8gWt53qzxcSI49TBVnI3RPPvNwdynBii6DcYi1sQPNcCoA
	I1EcIZ5tqIj5QMppWdRFfwhVMmnq72mAxII0gEh3xxucxl99Uj2rML8M7mjQLVwkWGxlRSbvTnW
	XTlf7f1ijuGOcVA==
X-Google-Smtp-Source: AGHT+IHYXxM/I5GaOybb6g1yecFYohV3zCOa1VEm8f2yGvBo9rJ8osfE6aj7FDf3tvSiEZ9Z9+sidUs9ZqMaIBw6rqE=
X-Received: by 2002:a17:902:d48f:b0:295:54cd:d2e2 with SMTP id
 d9443c01a7336-297e4d096a4mr91553105ad.0.1762869539841; Tue, 11 Nov 2025
 05:58:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
In-Reply-To: <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 14:58:47 +0100
X-Gm-Features: AWmQ_bmjChoTwnLfQhUmk8zTDZP6XuF3N7zYh0KKb3TDMGl3YRN3n87n4dAkPXU
Message-ID: <CANiq72kaoYYMq+ghFsa+YrRbTE13M2TrtOMwAK1eV1Sk9tEQzg@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 2:54=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I will send a couple other fixes to Linus this week, so if nobody
> shouts, I will be picking this one.

Of course, if someone else (thanks Haiyue!) wants to give tag or two,
I can still pick those up, and that would be very welcome.

Cheers,
Miguel
