Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9842D73A0
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767656526; cv=pass; b=DYuOyl9S9OJJpIDVL1MGk3RRRD/VLIbdc66c8Mrja3nZdPzqJ4a/j4RieNMH+nSVljMvakxbsnd7QTbrpGu+e3zJ8XaZJLR49T7b9/Ije+GPi+n9txL18nbkNjhZHtGeQXhMa+emzjDoCHsxOeqPPy/cqsVJHrnFS1Z0Qiq71tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767656526; c=relaxed/simple;
	bh=iHHgbjguAHEnXawIB+JIaSb5c9TmEty1OIPIu/hymr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvWqwa7JIVhcyzGGq3WfzvMOSzmQHGoHHduLv8GQkRc4hx8T6dbjc19p01njEbDArlWbtl9I3Kzabu2rYbWMastHTAL1XS4OWYOkJAOK594HPMn0Sq/abYys6Rc7CszkSBZVqhAv+wD06bms+84C3pROOXhGnmyCwC+My9REvLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3QCJsIV; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3QCJsIV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f3018dfc3so1242325ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 15:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767656524; cv=none;
        d=google.com; s=arc-20240605;
        b=V/4DfNTpKloq16pyAQC5P/6CZmBjHPWNAaSINgAIAaYn3jD8DO/3N4zH0SOr8DCoHD
         BMr0D+yQDdjXlsy7ckoW1noJjyuKUPJkZlIP1is3/bHdjtyf6LOloQ+pDrr1ZdvShne1
         aOYToOFmQtg7jansJpC6MrpTxaW4BLMH/fSHQmqQhXYgEW9VUczKGZOXmA/s6t/iXDfa
         aJ14R2nkLohuxk+52ewG3cmjxX6xaQ5S1R28He+uIvbNdTsYVuqvV1pDYxpNrgDqX/sC
         J/HKE0TFg+FVGs+dQvsyu+n3EEXGkljSDE8VJ5f9ocZW/oeiVsXmGXZJtx5XO7bM6w9N
         jgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9OIRkwOggpsjKhMAOp1NcMVugg4CNhuGbCDvh2b7ZpY=;
        fh=fTViL0GMiXvjDHBmQ5BxnB//o9AV6VtMwgngS9uAF10=;
        b=ZpzDtIkKx6zocOaBg7RweMYd1Kut249Jx6HnZk3ZbhDXP8f0j4F4xexiuFJMwRSNee
         L4hgQ/HXk6VEOMdtdGYQxWf5zS2lmV9hOZRenqIWArJfEC7AqcHfPKUpxHk7qyGVa+Kt
         lJD/SC3tkkaNv/rx9XtA04Xd7fE/yRrEeHTdlq34VpwGuOi3xpWlw8wlt0Rqj5kVyV+h
         Tu+K0YzaTjli0at7fSC+JZdR/BSgMNPK/j/1K3hBRQocTagAxBR23yYImmvvuHVHeYqd
         DSyZmf6WFeWGBlfBr+VL/WzIcoO7P7M0ZBUVsT4u/CTlsAUpXrV63PC5Kmx1+MEx0JpY
         NO6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767656524; x=1768261324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OIRkwOggpsjKhMAOp1NcMVugg4CNhuGbCDvh2b7ZpY=;
        b=G3QCJsIVUl5PmeVliCwr6uK3TOKpq2i0wh70OvvaZELC6p/ov9bIP/KyyeCQAQxabz
         o7BJLN9wfFDl73d0vELDosum2OlY9CtxSWnzxwLhVJpCsx8ITB6W9pH3SK9koRn3H4L4
         9pIkZFQ4PbRITXldAtv+qUySaW4n3QhU6pMGGA2PGmoCCHABGBVQ0lrJ3I6A91+eiISd
         61pgU3TpKzQTULeD9y3WOOLV8qsQB0ShcRO5+sdckubujaPBHvN96mk/n28quq9mhlTd
         zUpqx0Zp0cK9R4qEcBtAX7lAlmTsue4eNNQVLWiudYGrBQbVqE7cwX0TJYfEtdkK44v7
         rekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767656524; x=1768261324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OIRkwOggpsjKhMAOp1NcMVugg4CNhuGbCDvh2b7ZpY=;
        b=DLk/7Wv2eu0VE2DaK2zL431uq7v2O+oKQgJCYBScvLXEHG8dIRRS20ltpou7f+BgRe
         DysDNm29uBypgSK36Q5sz9LzqOLxaQ7zI8+kAD68hX7ct1/zJL0dXnNKjrR7qoMrfLqL
         yDMQ7hBmNGi8EwxfFNNGbjaX4blh7oR8PlqFGjYxNDMNqxyznHFepG02RAsp6EEaQPOl
         kdrHspuv6JUMrO8KIL86whzldCNJyc3VEop0YjK+RMDazdlWA84XsT6WC8CeU0fi/Tda
         oLi/QraguC8C4Rqs05z3qjLYzPvXhsuT+Wf9vAVIzp8LLYNH/2KcI+nPGcMnOl1RFlIL
         ectA==
X-Forwarded-Encrypted: i=1; AJvYcCWyhYVFjXS8JXrcFuRObAXMq5c/CUgnlkWibkDC1UyND7Fzo7ORpy/y5RYpgLKnzr5wBkVMQwxTr/XHFzwj0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc4vuXSn0kN4RBq4+7hBWCgW9jfsxWD7j4vYsjoQpmcfX6w5d/
	L6PO7VgAK2kfOyJG7EVXMK0lttqhtUCaqal33NRuLi8fTgH3wu5932//AAL9cJ6qihr6GiBJGMv
	OnM8+jA8e1DZT7Ff3rTZQzXCn7mmzq7E=
X-Gm-Gg: AY/fxX4irMftZRxOAXiMjzs6qAc0W999kmVhmE8Jyn550tFv9kXynz7o3ngY4Zsef2/
	fbU9EdtlOehPV5n2LajvW8jrrRHxeTJ87VamT/mEHe+Qw6+NUdJvh7zSyvBMSRE2uw1KRXFTGui
	DkJm3/eELIbFlSn3yqZNtJSLZZNmX/UtPkGDC9wyMmCiwsMaQIFDFf7bDriEGUFD9bPh9ZepG9J
	ATiRQdUXBjiUu4dLDlXOmJ+lZgIOIqBJbJ76rxIAdd51B7TNWKZhGG95lNwTM1OnMHrjV9YOvdR
	45CZzlqKlKIT/U1V9OKCYUyd2zUQcvpq6XQoreEJe6X0aBVlvFKNmIb1UKuw+wziE6+Zcai2UqY
	hzCYx4QJbT98e
X-Google-Smtp-Source: AGHT+IHtZqfgcxY4U36jBsJ7UTPxgybxSMEYTuEWxlYn9nLq+LfP9R0P9A6u0QbTqI8EnTkrMBGSLIWCgjZUK6s/rA8=
X-Received: by 2002:a05:7300:23ce:b0:2ae:593b:2163 with SMTP id
 5a478bee46e88-2b16f90b9b6mr423352eec.4.1767656524191; Mon, 05 Jan 2026
 15:42:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105142123.95030-1-dakr@kernel.org> <20260105142123.95030-4-dakr@kernel.org>
 <D5B126F1-B6F5-410F-9BE9-FA688C990A10@collabora.com>
In-Reply-To: <D5B126F1-B6F5-410F-9BE9-FA688C990A10@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Jan 2026 00:41:51 +0100
X-Gm-Features: AQt7F2otFkC_ACq4yRMksDcIl_LQ7lbWRdk9Ag5enV_KwstxHXVYbXxmNGCRsuM
Message-ID: <CANiq72m5fiupZBaiyJZO5aykA382FrYutW15VPpxWzrhfGip7g@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: usb: use "kernel vertical" style for imports
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 8:36=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> OOC: can rustfmt do this, or is it a manual process for the time being?

It does it if you add the `//`, but adding the `//` is manual, i.e. it
will do what you want but you have to trigger it by having the `//`:

    https://docs.kernel.org/rust/coding-guidelines.html#imports

The goal is that `rustfmt` does exactly this, but without having to
write the `//` (and without needing/adding the `//` itself).

I hope that helps!

Cheers,
Miguel
