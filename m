Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BB239B94A
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669747; cv=pass; b=jdUV19/FkF0IKopG+2X21L47FFTLL+TO0JidFNGv35Ef/nwQICJBJQuumP++vN5Tcpp8KHqFC0jvhe+dlGOcZhs20MyzqFXMZfcfp9jpcho6bZeOsqpSoqCJdQW+wQa/6lnBVBVG3jjjFdoHH5V2Hh1zhH1xhcF2G/AV1gGXfqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669747; c=relaxed/simple;
	bh=cyyiNDptl98k8pZAyExFSCW/9thFIw3OK7mbtDKcMP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKEJHPJy0LYlNr6OlYh9AOECz/3phxRY2+8wzsy8Aa7Jvx74FaybaErZZMxSC5pCcLmumj2SpGVL4l1LLgdMwgkB10IGXhiITS8+nnDP+yPSDWRaT/NtKmWK2bkG8XzUN0aVlFsFD6OQgssRqmT+CrPuTGXIsN3StWIMJLe7PPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0bfrDHf; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0bfrDHf"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0c482dfc8so29023eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 07:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773669745; cv=none;
        d=google.com; s=arc-20240605;
        b=AoTPmYDxKP2d/GSxVkUTDGNfS+a+OVpTV6anT2SxqrOvlFW8PKGIkhqMQFReWOBw+Z
         1zYxifYl4B12HRgBoz+2CPx9c7cG2D2vGeb9jsbQgrbDlhv25b+c35Ug2yXDdupOsDVD
         jlRWweNc6iDtxhKIt+EpjjjCI0BzdrLbjwdT4YG7d0IrEtaLy6g6/sqfKnDMZrvfELUv
         Eu1nTm6yz0wQag16sZsC2U8zXXLyUDExg+XnCHMHzknihA5YahI1hcMyj5J9BrJQrAM7
         pZjTZQ2qnmX7+/s/cRw3LWAKXHeNB606S717wj1C/xwhheFH1RUDFgvmBNf2rf0xQWpL
         ai3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cyyiNDptl98k8pZAyExFSCW/9thFIw3OK7mbtDKcMP4=;
        fh=glIaIaSojCzCraMekestOpINBtIiHN38GG417yFm7G8=;
        b=SudTraVx3V4en5yZ7DmSudE+Ts9dZozr856q0/zzht76Y0qvhkoMe4yCymMvaHFSoR
         XIJ9fWpc5YlQuDPIBI9mT1nzuUDMGXqoQqK5mffvfVcIHLGPdjmyI6PCNftVFg+Koteo
         jl2iVdWqr5yf1cIt7GcngCyvFFHr9avCF9g3NQSZmU+CQscrPdtlenDLBdnKHtd/py8d
         7YbKKfqpU7QFRUGxCdDgNM0IOTmxuONgmPsBJpBnBmBeDzH52GjKjp8EOxwDrnn+jSMv
         q1LH8TprDIU0QFi0LIY3Wcd8GQmoHYH62Qkh/znDBc+oR0B/Z89P212qWPCY5fOvLC8s
         Rq0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669745; x=1774274545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyyiNDptl98k8pZAyExFSCW/9thFIw3OK7mbtDKcMP4=;
        b=l0bfrDHfHAXXtUL+rDOmHg+DhwsPpTwlBjNaKxI/dIaYK5PeeMpg5LzpvUFq6Y02HJ
         dumIKzyptFniUBwwMdjyPuXf3iIfu4rCGRCe89a2mpVgIgAJyp3tFq3jxilucc8s78S0
         7eBi5ECTHe5/7AD+LWirdzzE1oLGNN0YGwbMnhL0ZXcerPe9PZBLPw1DScdVD/R0Atqr
         OGdMGTqfb0tyFdeUpiwcabZgeVYNjG3Jq+YQ5Bz/79InUWzgUBvGDLZclFb4UVECthjr
         Yf8FViLvNAV8wTJuezCZ9gsveQ/2FITPDTV31uJJ6wFz5/cVjj6Xxg/n3e1oTcFZr+YY
         4r0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669745; x=1774274545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyyiNDptl98k8pZAyExFSCW/9thFIw3OK7mbtDKcMP4=;
        b=L5Ve50Z4No6F552FJ+9TqwMNZ/pm/aJMCa2CtMm05/pYMQuje4nC43uiyQoP6GFNvK
         xLr1yfAsR940KE6Ck/7oDem7cDoVYC0EAcUQWl+MWns4KQRiI96bg3LWoGTu/lV7ZcAh
         XniZNuqO0ooZwZXpUs1hQA94gOr1PkrLa4HgQTQd1A5wz6kIvN0A82v8bnpaFJy14XJt
         nMw9ysQ4hFTNoQTCUIOOogwb0YE3SwKQFxcff8uCttQgMSHsbPKci0MgmGh2dTdK+FCi
         7h1FD7xqm1AVXphyHiZBQOypnWSLzK1R8DNtWJJzCI69GSx5cae35sJYnKlh+zTKJsWq
         +Ftw==
X-Forwarded-Encrypted: i=1; AJvYcCWP44sBY/MafM3hUHWx9Kp2k9g/6ra+9XTmuk3qO4GsrHFRfmTxWS+QQi360hX0wIZh4DtxTwqPQi+ryoxf+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzestEHWWFHe8qf8ZYPw2eQxOPsKy08s4MKC32Y2KQ+NyC+g7
	X/KQcs8uE9wglNywt3m1vtQqOoA9QOsW9gCwddB5CZ3JW9x2oLykIf6DAX9haoWsojQqnQw6mYe
	MyFefIpsxY0rGsg7JwlzjU4bQhwPbTYg=
X-Gm-Gg: ATEYQzwb7PKYaVG2p7lVorI9LyR/2tA3E4psCr5DplnuGNevq4PN2g35miH09O2P8ZJ
	rSJ8okxXOXuoZWah6d+ddHbrPu2IRZ8ywuoOj1qyw9LVjbqs3i/zrUhm+539YTE8DUE5Y+OO5sZ
	zOOoc/GHytZ4kIxj+Pr11beBvoJJU59DeMrjCvKDDIqF2hzogCtDwT2IRgiTT52nbxq6YQoFdvi
	PIGOF+oA0b1Gn1BvDSZzb3760X9s5tbpw5sXbcdvyscJwDtaXGIsEtHzTkA13WujDH4/fTRPl8W
	i5O9N3Bur2aVyveL+PixPN2vrvA5IpXDREJme4OUlRI7hZxrHPInkDDC8FQsxPs8Bt85AXBXfVN
	ysZzMDfQt9ZkZfBTuabpSSg8GUrXLstgfXQ==
X-Received: by 2002:a05:7301:19ad:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2bea559164cmr2813360eec.6.1773669745095; Mon, 16 Mar 2026
 07:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org>
 <20260216-rnull-v6-19-rc5-send-v1-15-de9a7af4b469@kernel.org>
 <Y7WTRL6v0WsR-DWju2vumM1EBu4KZgQzE0VJul7mK3pUwD6ba0UuQO8sclDzOaeLGGh9u3WG5iSKq9T3kQqH-Q==@protonmail.internalid>
 <abfe2LbhLzXiGCkA@google.com> <87cy13swpw.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87cy13swpw.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Mar 2026 15:02:12 +0100
X-Gm-Features: AaiRm52qARL449c2NWg6ctU1DYpJKWGFTyzYGuap71EBsFi63NYUf31noEiyOu8
Message-ID: <CANiq72n5+JadJUW-GO0cwQrq9eJW7cB3ZK7zx4J484RzjxmYEA@mail.gmail.com>
Subject: Re: [PATCH 15/79] block: rnull: add `use_per_node_hctx` config option
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:58=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> This is intentional. The line gets too long if I pull it up, and I don't

Do you mean you don't want to go over the limit or, otherwise, that
something else complains?

i.e. the limit is not a hard requirement -- exceptions can be made
where reasonable (as long as `rustfmt` is clean), and moving the line
to an odd position doesn't sound worth it.

Cheers,
Miguel
