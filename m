Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437573B0AE7
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 22:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786486424; cv=pass; b=QMG4+ritXCQv3P42Q5Hgs9N5a2kTIbiUcC18bT25RhAuZJwFq/ucRkI8y/IDoBVRCGlKg9NeI/oAx3Dw+gSY4Y/fMmf3PMibZpe/oVrCn23vyWTuMLqTYN0x7K0szk9m64/EgTn75onrNH0wHUQEAyZSfOQED4IP6aEx2r/0Uv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786486424; c=relaxed/simple;
	bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHdc8XS7b2Oh0dy25ULnoXRP0WdhVWVWzjW921B/RVvKv5EtmJKkpQrHWMfQy43lrbaRqdUEVz8Ctt5i5MN/TEz4qHxxrUO86KNYF5ZoMkti2d0W9K15NvhkzqQMo9US749xP1MBaeyOu0JMev5q5zgPma7iXP+UE6lUtXJJrsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNhicO+3; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNhicO+3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d01548ac96so760195ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 15:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786486422; cv=none;
        d=google.com; s=arc-20260327;
        b=M3A8zS6LQoQeXhtVv2aRs5gre/fdRHebusxfplJnTnjzZBLTs9aPzoO1X2AWEJKx0O
         v+/MNlZZhvll8+SEERFlRjigUXSDupLLgJeFhmmk90eNDtrRAy93v9tdrCkaerdakA6F
         tTQe2N5oifDMt4x/u8gJQlsj3FQidda8vj3i0HB/5OLd9NYdq955WwZSv2Ftng7M+F9x
         jtH3zvrXgMXA+hkxTJ+fJ6lEwe8+Y1sVqeHrH1ABjeYAu8WktseWOSEwZcWYOZkqUZwG
         aKYx7LH30s9kzAOaPtCBl9kCQ7eZLHrBVlSiiCqHmz9dzqHMVDcNo8O55TXK4Hs3vsVd
         JY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
        fh=c/GGT3W2YOXS7XohSUm2pcf4f5MLGYGAUovPDDu3CYo=;
        b=aQhbd8iZQuPvTSiLooclPNNEtHWRqUX2TIAMYXE7nygneH9mimqAWxdD1hrkgmNtHR
         EEu29X7xQOJyq2hdUD7rjNgrdTJoRBQY+IJgDeLOcR4S/UK6Ka86AP5/IlukMSac+HvQ
         XeqU2d2yBdfekD2efKYETHTwn8pcknENGkr7zQ8ZdJxDdMh2mDuZWLsTaXnlsH1A+tTK
         VIw4SNQD44Lo084pC5bCBzsffR71N5wU01fjJ7DzwKXCfMnOunAgNmGnHzlmYuO8haq1
         iNFU5FkDz4Q6knif/zX5C4tmeoFwBIb3w1hGJn2I83vVk+zcJcP51lHhoT5dysxTvKCw
         88Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786486422; x=1787091222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
        b=LNhicO+3kHWiujGdjf8vPH1NeNsXSAQnFr7C6Y5ZnQk/HbrpI2dggJFMXgn48Ozz8k
         HO2CMnrw6Y/jMNqS0mNYZ01ooBhwiBl1eweB9jCaZSPGU6esjB8YxHr4o0kWS1Mf+pju
         Dx7L37/fsR+K9BO+pw9y+nEiOELvrhnEOKQQekCsQ6MXnRLh3f8etKSHUwqpvfimcZfi
         rYPMEGcP7hV7Lz0/qLxHWq3jVKJbQRzjHk/cXIL0Y0+S9WPHUk6lGbwIftWmM9ynYFd6
         edEO9tNDjUhhJHGZ1mQHpJFP4cR8FNttD1FqSdRPxFiZ2hSRTDU73hfr3izCCpD5KsRu
         TzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786486422; x=1787091222;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2/6oU/E7SnoNmRzH/SDE6FA74XcSBsdOkPyd/Kh3so=;
        b=DfCW6G0ssQyGq5OF3+cbQ6YjUQI7MIgBkebrp2+NTG+p09ox71efAgpJnS3FS/xsMM
         5QH1+fZtOgIUhsYFYsuz8iTbiKOr5tK6mp7YvP/TZf/MdDyQjZYDwtV83OFPXh6Ke4XV
         afruQk0UWcIr7hK71wr2iCEmEXTW3VSUcXMqreR7caU++xhMQUMqWPFfXsFWgUBs8Ddw
         pMQT6wtARa0Rt4G4CLif1xhbknpsI0Ddl+EwT61Htkr5+8DV8g06Dn8k4mu6tiwOmYe4
         O+0yBzPNUzprYMTMySIhEbQG/WSSP0bkkV7X9JTRA3LNhNccsdYDGyi72dM+IPTyUnOp
         CciA==
X-Forwarded-Encrypted: i=1; AHgh+Rop78CiBQbTGpZl2WnDFWzkn73PEp9TX4C/7K49lGpk06I0ouc3EMcgesjLd6NvvGpcR0o81BM+3fVtkgDE6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO7LQ6IgZYZCDr2d3qqVMRFoUw7KVlNLGGIG4S14mxW5SA28mJ
	O5pw2E+kUfqKzuP0fX/Ywart0o+ZHlvcevt2z5rF5ILwHygzauZ2XysLYSfUnonGNmL6qW7rVd7
	hbqW2Hu5TPlmavivtYraJezwc6F3MSLU=
X-Gm-Gg: AR+sD11iXmpa6xYypKYGqUI5MOS43StlFUPdPo2Byq408WtUz4Zd1G8ZCcsxEHRLy74
	O1VV7Hc0bJiNvVsIIpXGtMcE2eXF6jN8fjz4+IC1J7mvlIuGay43Fr1j/epLzCj81B5ml4ipjtA
	TJNDtQanP6l1PALv3XYSFWzvWV3wuNVMCSxYSGGWcsRJ5nIy7E2JNZL+56A27k8h0525qDNpe19
	NyBC84ImbZFaVdUpDrei9saVtPXrrboJf5DDzaxJNDKR6rct6knI6sO4Pb9AEe4ffxDMm5QB3/7
	+l/Ad2YIArQlugaVzsN8KRwEuoYEoXjCTNBgd3IPFBnKWiQAP7efz8aDLjKP+IjpB4bd/3Xtm5I
	uhuKw0Zpti71a35VWSDMxG8+GrF+enr4bLexqut0eDG+y2pmUFPEFPf32E5/T
X-Received: by 2002:a17:902:ef0c:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d3456ccb29mr5130705ad.2.1786486422513; Tue, 11 Aug 2026
 15:13:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603160910.159307-1-laniel_francis@privacyrequired.com>
 <anqsTVj5QGYGiEQ9@monoceros> <20260811-garrulous-serpent-of-agreement-cf9b19@meerkat>
 <CANiq72mb0RK=2Oaipzas9UZQiEy7FW331dosH0+cFKuVQNE6Hw@mail.gmail.com> <20260811-famous-convivial-iguana-d4b104@meerkat>
In-Reply-To: <20260811-famous-convivial-iguana-d4b104@meerkat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Aug 2026 00:13:28 +0200
X-Gm-Features: AUfX_mxmO2Kt_BTUTcV2EXxHGCyIy663HbvVAP9RurhqTTrI3f50J2EGAHSXNPM
Message-ID: <CANiq72mcieV_SmvraqcNNYVOQOppzrjRtkNdpvdv5hOKfZkuJw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: pwm: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Francis Laniel <laniel_francis@privacyrequired.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 11:17=E2=80=AFPM Konstantin Ryabitsev <mricon@kerne=
l.org> wrote:
>
> Unfortunately, some prominent maintainers indent their code review traile=
rs,
> which is why we have to pay attention to those.
>
> I generally recommend using "|" when adding trailers that aren't part of
> actual code review, e.g.:
>
> | Fixes: abcde12345 ("Foo bar baz")
> | Reviewed-by: Alex Dev <adev@example.com>
>
> These are guaranteed to be ignored.

Sounds good, thanks! I will try to adapt :)

Cheers,
Miguel
