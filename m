Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1453112B4
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769803926; cv=pass; b=NNdYzJKGSxDO6GlZ/Kq7bW9U8amWsH+VfwmYShUPqO3hW3ROHNn3TbAx0+vlgv2MyzZdwoxTG/e9mvkwEQQS1tos2BJA7Auf+Ni+ano59inbSe/yOWCmZi5gVFEZMWn7g3KQfa92m7c9JmtrmLLJ0b0DbdMpqDX685srcbRlgXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769803926; c=relaxed/simple;
	bh=jf4SXvUaWDQhdD0o5T0svnQ22xhEC4AAo9cwMcawRFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qime78YCyKqHfEhW9WXTkjj7SMEwQky01+sg9Qvjf5CIzK6qumiMXi0ypw+uCcbwyRYfArrFJMEtkmnIp7Gg8DD60Q6rZJ/y355YL/Kl+hGgvamFS63lOb7InDv/lP9C6ZfFaiZgcW9XY8Q5bEg67k4q5PK+pncZ6Xkrot2lmFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtbL9G8d; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtbL9G8d"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b703e04984so136516eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769803924; cv=none;
        d=google.com; s=arc-20240605;
        b=fE1wZCCJKF05Z+/VRgcC4M/6C2jLsaaNztlzZCj05MJE8IZfS3rMVUdq99QSTdFA8t
         +Zb9Zx1IqXtNEwxeBZvRTYmGTbQbUDdJq/cgrgMfCjdU5i8fk5gzuMBwjPx4eZZtLsfP
         VBbpcinFOYJxue9kaN/8jca/K75TZxclRqSZTWa7ovZKVqa1dGIqW9tfrBKIq8qFSlK8
         qXQl2gVcQbF/8DxmK+oIhM0y9iYDYvlHmrzqe6oi0GIVyymIlqL/vR1HcZi4nX/MqhCp
         fWzW6wBFJL4QdiRdBn/dz443Zv330fCETEMMxR6/2+4rlAcRJ8HGodmSdn9EfqrJhNR/
         kXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jf4SXvUaWDQhdD0o5T0svnQ22xhEC4AAo9cwMcawRFg=;
        fh=lTC+K8lFIJrjWnYSIpzUYiR6xH0A4ysDM2c0ET3MPso=;
        b=Y3lInDPItjqbzUSY//xMpdgIKwSt9D2lDD49xxSUIOWJ0FocYnFlPQTy/HoSlpLCzT
         UTifmk1Y6g3NgyTVTA6oetwxTNR6PMAUyQ31FEQZXmsvZpAiBtO9TOxSUffiGF/IYQYU
         2/By8Mev4kLfYg9Y0dqnr74k5XZncU4WfyiTg7MJe7iYVed9oyofZuDhrPWhcQ9Kvoxg
         8dcsfVcZBPzPtS9MzvVxYJGmN3bA3sTzXbvIFxYG/CBOCZ+Zc6xSmTJicUrWgbZP3dlk
         ut/p7CfjGGKaktGLDxlcYVZ4XfSOPrag4nLGdMzllmaGA/8+nU95ldtq6GUWND5CmZM5
         h8LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769803924; x=1770408724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf4SXvUaWDQhdD0o5T0svnQ22xhEC4AAo9cwMcawRFg=;
        b=DtbL9G8dmePfcyD912NnyDFmQluYAK8EUeIt1Uyweeg9jB1FNw8ur4egYFOKtGq4zx
         c5MHVJEurdrmJn1WKFrT7OhjcBw4osXmDe3DqnJbSv7xI8Kf28U11h1L1Vueo9D0ykrD
         d4Qqmqf9TM82+yQLicwn03wp5ueJmHnMQuJRPSssgBtmowNmmP5LyTsDU5aivgnEP2wk
         7bfEbTO7P1zyAUYzrMyiQQAJ3NqMh3wbDpK8zAzbuo2qJXxMgQxXLVdc3IyBhqFN/i7Z
         j5OFqj6FEVzlWpOMybBfxzEJcQ00xQCuF1Ibene8dSfiG2+ZPwWOVncW6Thy6PThyDHo
         Z9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803924; x=1770408724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jf4SXvUaWDQhdD0o5T0svnQ22xhEC4AAo9cwMcawRFg=;
        b=XSmgoK+2hvbYl3fEmCnXbo7aE+eUywpnD5rs+O1iICpEU+ZGJVTXFElzqYvdSnPgDR
         xIQ6qAiwG1k1uXMaMaXN4Pi6msBri0voEwnni1BY2nu6Qj++qEperYZ2NlJDk1C4UK/Q
         AwiCIu3F1zxeNfB1igmHFtu84mWS0H4ON6nrNUFr/CfDdLsa/hamJL0vGYGN1N9KL39A
         WBv2KIrSz9p16Zm45+aVP5rmxxJimu3UNKCKqMLPHyo6tDklxzPMxf/xKtjUgQ7AmD9J
         EaLpD3YKdn6WJbICbLRYa96BwdDM0fJ/X4RDCcbceBLbFddwdIm7XUVj742oA2Xa04QS
         AIgg==
X-Forwarded-Encrypted: i=1; AJvYcCXBQianGt/kjh0JqwDLzsjYc0TQGoJqun0r8cabaxdFw4kcoktUUzaQEIW+cxWadQzmGPR07Okq4n++Bm8rTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyked8jW4D2oARlmIaM6Ao2jB52LQqrR0dx5jlcN242E5Qhivzl
	OKpjhZmw+VNObPMVqh3aqWerMgVJ6Yha+FjksGTCOhC+pGfr1GLMiqJjuAim5TGXWeppieQdUDj
	3AJ8BW6n8sXxV5X1rIGKfKuaUdvvnYI0=
X-Gm-Gg: AZuq6aJzBJHv05/B0uYa+odVlyyZsvkWdBRCK16D18IJieg8yyU4n80h2qzacNtnns4
	O3Fvh1MTUVofq3z3NM10+hi1G43g8kFJNKL1/QiNhT/qyU+FN2U5vkK3nmNWC+YpLzyTC77OR4n
	3ieDDzASfn/EzQJytR4qm7528fvUt37vBlpQKiv0feXZQMrOvnpk4ie3ZXPqfKXCPRkdrTXz2Sg
	ByH37wzzqYXXlS+/kNRe7EyuIPabQ9qUdjcSGnsJRiUsKl62XW1SLZJNmfxdabijIX+mgeZTy4J
	oWiI2t4SLPg/ohT5MM4vu99JfFUO4PtYzi4MTlqeYV3KypR+nhKLnKG4FvDSUYjnvsuIerrG+Qj
	MepFY8qAyzneh
X-Received: by 2002:a05:7301:3d0f:b0:2b7:3678:2d1a with SMTP id
 5a478bee46e88-2b7c88e8ff4mr1012955eec.6.1769803924294; Fri, 30 Jan 2026
 12:12:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org> <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com>
In-Reply-To: <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 21:11:52 +0100
X-Gm-Features: AZwV_Qj4au0aU7pebrbcXg4I13-69k2VjqboU7pe4LNCnz2LbkozSTB8ZAuBBiY
Message-ID: <CANiq72k=WkiuKCQoOQFewbCcKATm7KZMV4jYBFmSSFryNKEAhQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] scripts: generate_rust_analyzer.py: tidy and add type hints
To: Tamir Duberstein <tamird@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 8:57=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Applied to rust-analyzer-next, thanks all!

To clarify, in most cases, branches are supposed to start from a tag
from Linus, not something in between his tags.

In addition, the idea was that you would start applying patches next
cycle, i.e. normally the branch should start applying patches with an
-rc1 or -rc2 base, rather than at this time of the cycle, and e.g.
finish around -rc5 time, and then you can send me your PR for that
cycle and so on.

Let's talk about it in the next meeting or we can schedule a call.

(The patches seem to be applied with the msgid link and with tags
collected, so that is fine :)

Cheers,
Miguel
