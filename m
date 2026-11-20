Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795210479;
	b=OnrAy/Yp8GevxaxFfAlLx40OiCr/YFFQ0DIfDwIvpESvbrHCIwnCUuRDs/lM7aiOTNrB
	 cJL1GPCK54w62+WqK8XJQH49qq9LI1lK9ttbttWU72Hri0KAKa1CKhaV/lvSH71UtVs09
	 Qu6jZUfqbXG+Yr6Ox+UcoM45f8PCE1GTUaTkG3v/H3Q1tfKKdTXQSbawSCO2M6Im/139s
	 SrIiIfQieC/6Tp+stuTJ+CZ2Obl2nbgex0RWAo5fTQmLSyl5ebDMlhmr9YEzrQH3jKS1t
	 HtSpJdmJh2ZRoLSm+QBPXGyr41zGovSDX6EkesXQ3k+NqIKnDFmqNmho0jZrG4A9d0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ybDpcTLc48ilAjH0O6ivdBYWvKm9L7gemRZOYABRPk=;
	b=W+ixgCjmccwWZiZGUmBB/5NTAVhR8stLOHqzJZMmPFtrhIhS7p/I/qVdzTuu6eJsXnjG
	 UVXo6Uo6hz1ihq4RxDING3QOi7sLjw7pJEkWLEbbTQ9VIwIKsnytMR5nMPcYUPXoI845M
	 fCZ0P8mXhXuhKpR0llHX3fCz0Mb1SOIUpJGS+Ptj9s5Adhui55kNz+iRZT2qDDLZVnPuB
	 eK0f+DsbJZPCCrnt4F+WLCvCEcczBL7yqydQKK/3DvQpnGY6b1ejVbYo2s1eG/2FwsZ5e
	 SDDer020XHV0pKqKBon+gtOA+w+kKldAJw1VfdoREqMXN0e/td6zIfEy3GH68k/d8Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HB+I7Anq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044C606A6A9
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 21:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9044C606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HB+I7Anq
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adf89523d8so1687471fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 13:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795210477; cv=none;
        d=google.com; s=arc-20260327;
        b=JHAZLXqgNZ036mgFJyIY+chRC3gmsvISzNEd2l18xWfmLDhAS+0K28BBldXJ7HaN0w
         bkWoBWGU48n1WYXRnhaLYdAIm39x/BX/TalorcNAYAeItUTZoOqH0ElDnTrwKFBdewsX
         fmfELmhFRmg+my4MxgfFL30yZh4KT+bV9/a1GJkao/LKPEDeDpAbwPKGrcQkUa6O/Sgj
         iLb5fNARSL9/EuotniCwTvBXyDz+lbaGwtDaCdsa2b1GM5BQE2z48nO9dzbgZff2CKWv
         EBGTYRh2dkKzgRUnfgN7m+AThq9mEPJTF7DoJb2z0eTIG9WKQ/98DEF0mniwtfgiLgg4
         xrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ybDpcTLc48ilAjH0O6ivdBYWvKm9L7gemRZOYABRPk=;
        fh=bwd14AOK9jC/ZMYfRC9xc1EFd5f2eSE17Hsp/mIq9S0=;
        b=dha/BKQzC3zAqRRYGglGHcmY5JBCYKjCy1Cb+4aUbkeXKEBwTcZdaZBQChBT/5q1Sj
         /f7UYG/bGzgj5tNUrYAaSryi63GYT69kthfwxUvoqPaf3WHYeBqqzQbojUainSCMrlXS
         6KzDoyb/t6oYSs9mhEk72NQLyanEv+lyMBVxa7pjjuJ3uh2X6UeDB7A2LvbKlgkqQWNs
         HNXTkkP968tJtuJ3+3PGz9k9hBE0sgGZUEaXvB9KY7z9SJeDBzIUGI0RZaT50yrpkY9v
         RcfLzdVkXfD8zmuFNpG91UQ1JNdZnSWk/BKzVg9S5QzlKM0zFD5a0CWdMXKijugszUDJ
         ssaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210477; x=1795815277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ybDpcTLc48ilAjH0O6ivdBYWvKm9L7gemRZOYABRPk=;
        b=HB+I7Anqk8a0LDDlLIYOJaoJreFMMqIY+QYMOorsLogFkuG7OzQO/A2edDDVMNTo6N
         1jRF5SLbDq91vi+eRygoxIL7qtuiJy5+cJ0g0aDRWzRgP7XoqsAGNWdVjTTTjUmWGfYK
         iiMezMoIQocPUOMcJavvaxuVszqAH92Ri1lCIiIDn4HjBos+iXMAPy2qUTSKMZofY2l7
         fidmz5iN+Q/G8nvtUpep+Sqk9X8+2SesBOwQqky8Y3xavoh44aPDqVd3EA2Gl1co/EmY
         x5yOqQ2fbvIrRKR5ACugdugikV61qEUhVzU7duNsOFNGhb7IhVgjZhxSjx8j329j6Efh
         SlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210477; x=1795815277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ybDpcTLc48ilAjH0O6ivdBYWvKm9L7gemRZOYABRPk=;
        b=jFJl+83dBN7iYmaRsQNgk3M1azcnSHQXE16siXf4VmR3+LMR5NysHdPeE6/iozO/iz
         VxRhGg5aC+cQjMLzWIgyMYEWk6Cev73YInxaewG8O1keSVDZmoUJG8WgcfUuuIeB6mXY
         I+Gl/Twz6qhfsyjwcswzJyHaVf8aB69XibdE0mG5fcN+I2k6BwrODpWkil6EyZzI4RDx
         iHWiqLat2c+4mmLQ39AXqubHRbFkx4C6AWIYQvNPL6PNu4l0y+5P7wH+ngHQkFyetsy1
         2pQQhWN7+yXY4/K2tMDnPO7eGi2xFsbAXjEaJMCZtiuM+Y9e00lEpk/CfsIl4RjZB+X8
         302A==
X-Forwarded-Encrypted: i=1; AL+hErFJCQEvJNqiO0WxNIh2R2lAtUy9rODc66G0TOsijX7LtWlyU5BBoTA+QrSpJf486K1hfe+aRGZ5MweDX/NtSQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z86JPTbRWz0JBEsaXYuxC4EtA0pk/4fRKwccyZStDmUJg8sI6qD
	DocTqK1YeL8RPQQufrHYj6tNr46tiwlVsQK81jG/UZTDVbZcEIAixsRZF6nGpuooEe1iERqvcix
	xcaNVBLEOzy8tSn1XfYEjEPhU2XMhsa0=
X-Gm-Gg: AZFdTZeDUQ7Ib6ICf0X0QqhYUnENxHJL1TZBDFSQRFWsWBwZDjXfzbEGooFJtqiEXa9
	lc52oTklLTpAwrVRa/yv225nZxep9sHT8ABtogyweZSwIKZETceFuiVi92Vg9MnTM7s99wV98RU
	bRLF9I3f+WJAUzz7rqildlSa/G1bok0Cb5yGldbPFll2oYYoUEWr4VhYa26j2d/F0GhP69ufRVu
	fq+AGFyidF+YGav+q7QM4A/tuxCnAoIfQH7VGaeICcWkqU3r0FuYKfteCxhaWzBm8xJwr5sSJy9
	o8byUQEl+PPyip6ZhaQqVTy2ygh7K5qOru/0E79Bzz8I9dDdhvgXtNIM4f5N9op3JSk4n/UAxWB
	yRM4K414Fxz6v4gCkjin2eHQYPnRhL7sJXICVZt6fwQ+a3uzlI67wvUPFncroteiPII5Bi9ppIp
	b+MZ6M2F69dmGis3Cpa/MDUBxzObLUUAk6wTqVzGX8h6IIyfb6adftf3n4Gyefd2N2UQnM5TBJv
	P/XZhmXsEDTawVkJ51ubYHOG1rY7fVn1wgwdFGL2MaevXkEfj7vgWFbgVoykJdmVK3g3UMbKYkx
	zPnZWhBgJXak1vRzTA==
X-Received: by 2002:ac2:5692:0:b0:5c0:ca1:46c6 with SMTP id
 2adb3069b0e04-5c1bc7b71b0mr1742929e87.4.1795210476660; Fri, 20 Nov 2026
 13:34:36 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-rust-helper-namespace-v1-1-3b9a05553ff6@gmail.com>
In-Reply-To: <20261120-rust-helper-namespace-v1-1-3b9a05553ff6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 22:34:24 +0100
X-Gm-Features: Aa3M54pYIKS8y5j5sPhIHPrhwaCObEpFTxTtsZ6oNI_ybFTVM7rT8kqynPU1RAw
Message-ID: <CANiq72kWXzP1SWUvhOT2k-rNjopnySXeBkjwrx63V2QUaLpnGQ@mail.gmail.com>
Subject: Re: [PATCH] rust: put C helper exports in a dedicated namespace
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:32=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> Suggested-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/216

Nice, thanks for going through these old issues! :)

> +rust_export_macro =3D EXPORT_SYMBOL_RUST_GPL

Do we need a recursively expanded variable?

> +++ b/rust/exports.c

Conflicts ahead; this file happens to be going away with:

  https://lore.kernel.org/rust-for-linux/20261112121512.1670347-3-gprocida@=
google.com/

Cc'ing Giuliano.

Also, what Sashiko says seems reasonable: if we do it this way, then
we may need manual `MODULE_IMPORT_NS()`s in some places, which may
become a bit annoying, even if there aren't that many mixed language
modules so far.

Actually, perhaps we could just import it in modpost if a Rust module
has any Rust translation unit in it...

Cheers,
Miguel
