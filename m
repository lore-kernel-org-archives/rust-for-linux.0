Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081517DE36
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 00:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774225792; cv=pass; b=YW92Yj+Tk9i+z3KQshtujK1hOK4D1osj2CQ/O2fH3N3EEaP1Yr4epesZv/KQLhkuSaFwL8Ta5jAHZafcCbaKd25LFU/VUQbWr5maXEk5LdO5OGEzCREVFTOhsJ2Sz49oLl29axPN8mBk3sgcAdhODQrmMRyGtqYEggW+tLkgyEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774225792; c=relaxed/simple;
	bh=9cbHdiwHVMGwunEQtejbJGfCgtUR/AP8Rb2GG4SIKJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYbxshbBqVCVXJON7a8iUmOM9Hcyxq9DgjZWDhlzjkc4/lOzK8YGRgF8PXG9hcmtgNEjoKyKimXmui2O/b/YVReDxKsnXaI4g3rEsYJFQtAOULZPdBaeCSVSPS/zGh6al/KhTWVv2YrRbWiYKIpbn7vPCMW7J1RkrSAbCpsAT5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4+bMxds; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4+bMxds"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0ccfcbee3so192823eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 17:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774225791; cv=none;
        d=google.com; s=arc-20240605;
        b=Ceuf70e+89bUkVk+SxnfmB6MIAurMX6g+vJn9jEXofkt2HCHodbiFsM07+6g9NIVnW
         mrqIfkaMaLAHRaSV9WVukEQtcZgTpZL2m8WOSNV/bYcJ9tCbMkaZNCZSbYei1HicgnaA
         IK3JRHb1lxPgU8rPvlY3zdONoYEnQLS8jC3gH/yurEt0oZ3aolvPPlu+tQsrcou6v80c
         dWU6GmFnye0VgSIhPtSgxmqBVyT/esZCi1GVLA78CGkdu6BN6wZblhktc7OFaJDCXqZh
         /tG0DpCN0PCk8ue3F3XMR0KPV9XNUyPKNVu6WQyFH6WJOKkEz5IKTVJKKf6+auhqqHpL
         vh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cbHdiwHVMGwunEQtejbJGfCgtUR/AP8Rb2GG4SIKJY=;
        fh=rVPzcRsSiumYN+ijQn0Am0I/ZT9x1+i31ntuUe7AR0M=;
        b=Eu2UeGMUDfKeeGGzxPawNrxmMvx4LBJFgP/UIFIkEbBnrvYJ+knrXouiLzpk/XRH7P
         /6bvEbmvns5lzG3uIijPyDmBN7FUvq6VMorlpHdScWzup8t5Auyt0Htk0i0+g2cQM1Pm
         F7sTAQs7kffeR0WZ9v7rpWkrBBTSpCy3RTepEyg8s+LNGpHYOW3ocVHP7lpRw45cL5wp
         P6J65sYIzoffoxGFJ92W8Xa/fQtCGgU3OlTr3yisnuIblbxR28hpp5W+QL5N8LIQmwZp
         sqPG4UPIetzEYUF2A7xHZt+LnMWXRZ6ZG+tPTi3l9fBeaoNUquhJSCeGIiW2hqSW2sj/
         Jq1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774225791; x=1774830591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cbHdiwHVMGwunEQtejbJGfCgtUR/AP8Rb2GG4SIKJY=;
        b=L4+bMxdsyOvjNUJmmgOMJ61YIFEOI6sVTpta5OQKCSIJMsjzGDsDWDyXyi5mRunoBE
         cMzMCm8F5nwYStA7JCfuIQksncHUxW7CZ1IxyU/EdFZ1iqAjs7Ci7omYDGEyiDFc7/N+
         hrQgbMCnzkJL2oieDU/CP09xahqThS+kqwLM8zAViF70vNIR0Oy9M9L8afEjoVCCfH2b
         uNmQcaWICI7JsFrdy4BTI1fQWKrbRYjYd7WxxQ/n+6sahsgmvTLWceFB1nW/iGzFBh1d
         m13bGOPqfqmCklXlbQaBQujwmKc6JRh1w9ROhVV+9zygFXsvO0nxOSbXvGEx+/eIF0DU
         +5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774225791; x=1774830591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cbHdiwHVMGwunEQtejbJGfCgtUR/AP8Rb2GG4SIKJY=;
        b=L0iV2ONRI6RuXAHW3k2z17bbyVcZZwbmwaGf2b7Ei8d87mo8rKiHYSYs5ceRuQLbZu
         ZSGgxC+py2zCOmV5hkvosQxDwi5T/TOoJN2xKH0yD+zjM/comHZXBWtSsn3IPLmfTO3q
         rZl2mBnzdHWnW/04/d8w45G0aRy5tau+kKDjhMxUETGn/TUXQXV7fVeGmjXEWVpo05IT
         16wJnoR7m2yb7LhHul05OVGeeLaExDwQ2uXMLVXTPyAckgHBkpufaRDuFsXXO9xP4Acs
         yvmUII3dFLkwuXpgFh2zYIG01TSJGjRLR4M5CifGurmcLT43YyEf1amG7Nv1/ko16N9r
         cGHw==
X-Forwarded-Encrypted: i=1; AJvYcCVz9KauZWZlmLdwlkbhqLUEA2k43HYBOwCocUVKssiUfKoNPPI6HSelegWO34aSBvX5ItJ0q+VJRbhw9Ji8oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDeRwG90gVH0xO8He/5xVI6fOJXyb86QbDNC7cY7j+nd32atG5
	iyIMGXaBEng1VZEW6jfNK9gFfQxc+SxsbggrDuMD3ntPA/LlhKxE/P8nI8kYlyhn0/Gd9Y0BcrH
	8fbMBf8+7M3jJ/Ly9kBaEvocjGtnA4rw=
X-Gm-Gg: ATEYQzxN2/5BUXBQMjhnZd099guwuvykW2Cg6Csq8IcbxgnLAufbIsNRBm0Urh+Vwnz
	rCWuhafBqLTS7awwQw52SqcQWYsk8QtfGKcsEntMNjCPF4OilvRdRCh3JdU1bhiTJUTkaBXa18W
	hrpd9tv+4x+pv8IhB7Reqjb7Fi7fDunSmRuOfsIx0XNQK4yqkcnQ49mgBd9uaVqB6c6k3iXch6x
	PP4jO+TYl8dq8P3lSz+Upmvz6qfCKp09b60jJt2Y4T3Sy/a5+nLtop8XTx8iioHaDd4zEz2tYzy
	i9f5Cqg2A/jKuE+CTOIpOpdm0CYagp6vqJg99Wmw+DQQSGw3M5QVEoKh354B1zKXnOxB+ITiH5R
	MR9qW5W7hh2frIF6ugCWDTv8=
X-Received: by 2002:a05:7300:aca5:b0:2bd:a3fa:9bdc with SMTP id
 5a478bee46e88-2c109862618mr1863580eec.5.1774225790638; Sun, 22 Mar 2026
 17:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
In-Reply-To: <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 01:29:38 +0100
X-Gm-Features: AQROBzA_7BqFHE98PrvfdrcuinIkR-uI5M2p9UFW_-ESSorfSt0DS6xmhkt5poA
Message-ID: <CANiq72kAhVALH=CoQ37GPOKp_w=3_kZYu3Rkwnwc4CX3V5e9Sw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 1:16=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> I'm planning to send another clk pull at the end of this week and I'll
> include this series.

Thanks Brian!

Cheers,
Miguel
