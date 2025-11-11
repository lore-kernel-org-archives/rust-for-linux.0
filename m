Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244FD281508
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762897292; cv=none; b=fmqxSjcX3tYY/bxzT9Y7Cqk0qvWzbU66EG13DOqR3B3spq0oNmiq+F9VQoETJ1zqZ4iSmhTC9kpPoPz5Nqw3niQQc+WZEN7fN0jdSzxmpG4cRg77pmChqf2DOrsdCO4VtFXVOTLpOhzOeQz2/mEJk3zVaIfhxdQDoJW3c9uj9VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762897292; c=relaxed/simple;
	bh=zfdAeaqTBrEgSr6xloh0Ahfnqu9+q+5A1a9axEx5SIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDT1e37XB7enjL2m//8qSQp5v40YXmDiv4S/W757DRAwhzOec3wFMOq3xJM/E9/UniFFaOM9W5+bIqOnSNF5qr4SIzcynYt3tdysiE4on21Di+dqOIDF4GK5AYpPJb61LGxqCYeiu+ky3R+9H0sgzMKDZNkcjltwHsKSHlCiNxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFonxFw4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFonxFw4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297ec8a6418so110155ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 13:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762897290; x=1763502090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRd73cij+HovMGtftbZP3pXBqOWm36xza5TU1RGHHpM=;
        b=gFonxFw4AKlFwXXPCiGjZbmlEYvW7aLCkTq/unD1ejL/KlzBzSO6UlR/KVJzILVUL5
         9pMf7k/HGAA1z4+wpxE9OsfvyJaESquHEOrK5LFTwbZWxpsrJcxS5yvleQOJBBPcyIH/
         hQxb4biLP+uDxqbNdQmVPUuIQljHwTknbxCjQuvZnOlXXFl0WHDWjPTyQuJDHSrNdL+0
         ElSmkLliVf1tSDLb8yr6GiFXF6TJyrqv4OEO8Mhe4DHgjLBFJjiUNKK1Jn65wBY7h8g3
         S/lZl/LSX5rvN1DAG4sMiw5pWBZthke/2g4s1Wxr9K4bZZW+AM+ltEDN1r9MCwJg70mU
         XHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762897290; x=1763502090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oRd73cij+HovMGtftbZP3pXBqOWm36xza5TU1RGHHpM=;
        b=qJqgXJf1njgTFaBPirMCx55FtgIpLK97bQmVq4MiEyel/Qw6R0UnqTLMcqVpeEdOB2
         Zkg68TiduOBJOoS2vk7PDxGnnke1gPg+xC7EHwdZ0MmX4sDTUvUfLCsZFfWGqC0/l/+U
         JnllYs/OVGj4qaPRK5e1WwICLQxshOabn43WqL5isbTNHp5BZhA93SQ5x8Lu0dkEMhii
         FE7H9wtq8Z9qA4YGIQ5G08ZH0osklIzEEWNJu7Kyn5q3lNFuFoQx/4pnKMFZCY65Jnom
         6yPASKynX/MD/hnoU1ybbv+QCOudTWoIr6hnWL3GCz8aqc++VRmpnReOw8c7dv1XiV5Q
         4hiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvyjbcwF1Bq+eD2FSiBBIqiJO4IOIgAHUhfourp7yxmLkMtVXmZd3QbDMTFqrRFHe9miCd/uHQNzwiU/Ip7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxCRb+xuNklkQI1hZGe9JOD/HTyTe3bIUD7MfW685D3xw/sbP4
	HAzh6X8fTwfW8qLlCYbhWmNPqmucAx3iR5IxrN1bJnL4OGlP7YERi1Xa7Z27mqJfyZZ1iA/lRk3
	6v1oewiPn3IFjry85gnvH1FvDgiQwwek=
X-Gm-Gg: ASbGncvh5MCf+t64xmHXqFLPomErDkggYzNnvYiIxtTL7bpigjd889x6YZQ8KuYWckB
	NV0/jf7VzY/AHCtmjMlU85JfE38H1KwtrYYFUckXkYxi6pns/G7UKa7pXtkOM/Gs84np1mv9Yw4
	m5oj3WvpYJzT37544uaXeECRcr3/IVQmv8WW1utH8uNCMCsI1W1s2AI0SFlApgX/CRgOXn9g1gw
	fBvS02YQPm9e7MEJnl/POdh7RO8WgthymFk0hlWg6ezRSSOTdQn4u4YvaJhKazHJZkaHSQDseix
	E7db0ujRbbJbmjJRdA8wgE7GdbSoRulEqEWGIDLN7GPsYdsLBG+/1zJevgI0W+2PKeo0zBLxVHV
	+08/Kddc3MKNSew==
X-Google-Smtp-Source: AGHT+IGiL+Jp66P8oXD6skqSSMCPWrZ1n1NrI/tbAtWufk7Trii0awwoK1IEETOo90VFIpPok9XHsp8l7tpFByeE9/k=
X-Received: by 2002:a17:902:c951:b0:295:f926:c030 with SMTP id
 d9443c01a7336-2984ed34944mr5274945ad.2.1762897290547; Tue, 11 Nov 2025
 13:41:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
 <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
 <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
 <CANiq72kcRsTWPhQVJ18P6RUxL=+c1Z8BJkyK_kRR8EBmmH+cWg@mail.gmail.com>
 <20251108044206.GA3038215@google.com> <CANiq72mLbEVqX-uBtqy+_wru9CRRb3PL3qFqYEcjpZdNyZGd2w@mail.gmail.com>
In-Reply-To: <CANiq72mLbEVqX-uBtqy+_wru9CRRb3PL3qFqYEcjpZdNyZGd2w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 22:41:18 +0100
X-Gm-Features: AWmQ_bnYAMAYrSvwgB4l-mm_bJOJnIerdQKKKFbx5vEbbDg6gbIrr9kWQZIl59c
Message-ID: <CANiq72n09yx9ZjOtOb3-3rPfpPLKaJZ2fs_Bmpbz28Y8U05snA@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 6:08=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Exactly, that is what I was suggesting in the other thread about
> editing the `cmd` command or directly teaching `genkallksyms` to
> auto-skip, but I didn't know if there was a reason you didn't do that
> originally instead of having (some of) the `skip_*` lines in the
> `Makefile`.
>
> If not, then I assume we could already remove some of those lines,
> e.g. the one for `ffi.o` (no need to do it on the fix, of course,
> better to keep it minimal, but just to confirm there is no hidden
> reason there).

For (cross-)reference: I sent "v2" of the fix, essentially taking your
patch and my commit log and putting them together -- please let me
know if this is with you!

    https://lore.kernel.org/rust-for-linux/20251110131913.1789896-1-ojeda@k=
ernel.org/

Thanks!

Cheers,
Miguel
