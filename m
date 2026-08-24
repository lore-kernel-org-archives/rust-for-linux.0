Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F740DB53
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571186; cv=pass; b=sLBF/lAffiQL+grs2BrpEMQ9ZBuJy7Cz9ZCwilu3GdxIPX4q3hG6Spp+5dEVTgKax/Djnh0RN1L9tVciebfe9JXHSGn4J2sT4gLjCJaIu5WcodApqCjIR9XmcOIiFp6cBJ1DBS/6gLAag+62RDSQ+sPQSuZzO4GPc9JqNX8oIVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571186; c=relaxed/simple;
	bh=tG8n7vBiTj9wavffVvqRGON3z89WPyyp3NtwIl6XIng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1OBuCveJXwbNzEFA90oz+yiy0JBvMfSb7rsA8MDI/w5wxYtivRTpUWb8uucLTEf1mG+zdYLZ+POk+wXp5/zUj83Zo7sNMqIc/HS+I3cRU2EXrxWavytUnJ0QGsYkvIx3DJ4il8ECTYsWKVKbahyEA+MUl3nHdz6hyVWalS+y5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxT/hj+u; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxT/hj+u"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca53979f8e8so180739a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 04:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787571185; cv=none;
        d=google.com; s=arc-20260327;
        b=rTUvq0365a7sXdpahlyNZ+aJ1cIc8ToC6YgEczfDA64FK7YEBCTqEJUi/aybKg3KEN
         7+TrT+AoQWBLBVMgyiK6wdiJk2MItEusHfPMReMekQKDI8/fdBOhcjTH1sWNuiBwmJXT
         2B0Xo62CTc6n/gsMY8W0vNZWvgLX+lWla5ekVXuttZhjVHEMNP2S+2AbIrrYhC5dhlye
         pYEwo73dyj4H7AYT+s3Wo4mUoIQ/3VdlVi2UGxVi1bWcTEhtB6WviEhHN6Ugnf8OPk/0
         SQ4+oYNp5AyHU7lshHkwBcuA9j3PqepFJwzIalJjtsNgGc5VlIFx33d4NRz7OYo0FIvO
         Vcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tG8n7vBiTj9wavffVvqRGON3z89WPyyp3NtwIl6XIng=;
        fh=w29F8p/CLCPYPoeA8zO0HIZi9hBDBGSAWX974CwIMC0=;
        b=fhqzEuVTcsgHavoOmaayAxjDQEAaAXrxQOvVq/c/SFrtYbyIIYB4P5wLHnc4baPbhB
         jkGu+WprvLOx4mNuAJxV73I7ulHsytvX15wpo/2oJyNkT//bZpo0i7gcLjEOHID9XCs1
         R43KB/qAe6Vqy/MCOXFe+hIl0fQM9xqxw54TtwaL3X+vZWwzVXXL9eOCWP8+y1mLS8ck
         IlyLrN8gjfNOcj9f8QmMlYSDQus88JyKti0yQCey5ZUqntSJMxmPLreFbcGhiMnQOOhO
         Leh/dytdrPnEHAOMCtmVaD/WwuOqwxcoN5TuiPM9ACmrOhoQtGeHpxgSwk4D+s6d/NQr
         Tmwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787571185; x=1788175985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG8n7vBiTj9wavffVvqRGON3z89WPyyp3NtwIl6XIng=;
        b=TxT/hj+u0YL+X+7sOKBqlsGxhEs9+MMgT3H2TtGpW/bhHmLG484BfgVKRcjQR8QTmy
         8QBc6IpIz4QuqLRJPsd58pcTf/EDtiGtJv8Ldci+q0H6VmiH2vcWU4AnrW4bWpc4tUvL
         clBT5vInSLy5erIuWXC5AGG8V4sQZrFdE6s84sAf7ltasO3STkGmKiFrRmhfcmke3Ec4
         S3YpIu0plNCLWqmaW6lCYCjPBPyU7QtxTW7SCnWPwFnDzbvN3kyc3KiBAyOq4TqQ0ccg
         VvgpWnE8KkylAiTfRmbk8hjaPlhiGz5uyW0EwFkXjjmfke5tyZVtdsokt7bnz/JD+ZpZ
         enUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571185; x=1788175985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG8n7vBiTj9wavffVvqRGON3z89WPyyp3NtwIl6XIng=;
        b=FTBaLRX1de54fAGlx0KK4jcscEPOv7Fv1m6CP6dnPHlhyBS22e2nqYkeGWBvFMgn0Y
         3KLCESyWQT+l0GGOGXSoV9izQWmU7/O7eaneNnNsg/ImPni5lhGQ5x2R/+feMFWaCJOj
         CAEl9IvzrKieTlVkxqWgg7CffOuntm6MZk/vcejRvTRmZhIzE0BPn42KxeKWidX5saUN
         skCFzFHG0zmnxoQa+6klEmJ28tm0gPvSV2xXO31XXucew2uQHn3rsUwYJMV84qmWS5L0
         zktfOoRO0jTYJEseMNuufJchsgLr8JqAE94qXpHG42qyELbq8vMgyb5HswoJL4ZxoULR
         ft1g==
X-Forwarded-Encrypted: i=1; AHgh+RrAi/Ze6f10uH9HYXybiIGUmDo5HEFeJoMQceut46m7hpbdN8kHkVKXSBnhzigA6df1TGDa7qtCM5eDgx/UQA==@vger.kernel.org
X-Gm-Message-State: AFuF++nPnvz4a8i2Qgs0DiqN5Q3/gF2z3UHtKbg6wnnD0XkRRSlOvrLB
	ifigYxPZGiz+9ScvN/oceCehFGGWbK6PBIbHPyg6b7Nnn6wSHdI6g0sZBSSsKFT1mmBBySgXvqx
	qmdaNLOqJXwRl7oTo/+9yA5bbH3Z2EYc=
X-Gm-Gg: AR+sD11xNgDG1XWuQpqZSx2vDYQm8VjyABUZ8gVUDIu2OaTcIVibz3Kh05jJ9etTNaW
	QhDZdphjq/ctTdKCLWKievzAALKkA3dqpblx1UJUKkbWCPq/25/kDxQEXnk2aUHRqnnNgRd4LlL
	pxByDzpeYgG8evSNYnUXkACo7+sYNrACQ+uLJ8VvqDgzAQlzUsHI/7JZ2l4xWQEpGWRSEnF7Cw8
	pbfK1+H5wYyaj5Y314FgXsrdW94QuXrN+Y1SDNMX5XYIAESgiOB1ZSvnIT1YIhzyLYwQO7NEAcH
	VZbs6AauJ631upZ9uZ3+78eXNGbb7gcY4hH6IvzMWAubHoI6R8AdL+TBeS8NeOyThduq+53wszi
	Neucpro9cOjEP7/hj9MEuHZ066DJ7KJtB+P8stFTSAtXnRWXtPPtd09pv8QN5
X-Received: by 2002:a17:903:3c30:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d64a9d1a92mr213585835ad.0.1787571184660; Mon, 24 Aug 2026
 04:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822-fix-rust-bounded-from-bool-submit-v4-1-aa780bfe7f30@younes.io>
In-Reply-To: <20260822-fix-rust-bounded-from-bool-submit-v4-1-aa780bfe7f30@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 13:32:50 +0200
X-Gm-Features: AcwNN1XIFhMoyEK4a3W7pWYnrtK64GCMIjUMwZkmGmILvFq91xYUPrm7yvCJg4k
Message-ID: <CANiq72mOfR33s4y+Ueivd5NrC5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com>
Subject: Re: [PATCH v4] rust: num: restrict bool conversion to unsigned Bounded
To: git@younes.io
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 10:45=E2=80=AFAM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> From: Younes Akhouayri <git@younes.io>
>
> From<bool> turns true into 1. A signed Bounded with N =3D 1 can hold
> only -1 and 0. The current implementation can therefore create a value
> that breaks Bounded's invariant. Deref relies on that invariant and
> calls unreachable_unchecked() when it is broken, so safe Rust can reach
> undefined behavior.
>
> The other primitive conversions require the source and destination to
> have the same signedness. Treat bool as an unsigned one-bit value and
> allow conversions between bool and Bounded only when the backing integer
> type is unsigned.
>
> Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
> Closes: https://lore.kernel.org/rust-for-linux/OzuVxu0--J-9@younes.io/
> Cc: stable@vger.kernel.org
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Younes Akhouayri <git@younes.io>

Applied to `rust-fixes` -- thanks everyone!

Reviewing this with an LLM made me notice that we should probably seal
`Integer` or make it `unsafe`, because currently someone can
buggily/maliciously implement it to still trigger UB regardless of
this fix.

Cheers,
Miguel
