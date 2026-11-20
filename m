Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795187253;
	b=qrm9s3yKoG+s4wLjajwY5o2rjq69/ONsJD7Ekwppu55lwTqrVHpRIGNBUewkc1vi2A51
	 UYXe6rQusmHDkWKa11keGWVGivQNNZv8kol99od8awQPMyiw2+mk89j/rtQQmXkJggw3F
	 ZxNneigPm/JJS2ibP1W0E9ilCCE28ave2ZxOPab6Hu0hSjcIwSu7UGuAaQRknt+muhoCq
	 nNVhPL1ix/zX5UeJj7GOTVzbmKJpFwQrJVzqGoJf5foOFR8wmKALuPxil65+QIljAZvFu
	 yzZou/2mQvGEq+ua4I8izMEjTzbn6Nqb/4j1u/nsoCiEcQzOAmc3+ILJe8sb35mmLzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0VIeYKjYJPYfVEKNuXLbK3ZTpB7YLv0Kh1v9qX8Ns0s=;
	b=Ft8SNvHzSJb8uIdqSYA3u1WRR4T0YwU+1+UzCOevtfnc+eNom8WZ78yGfxNFtLoLC4FP
	 mqbyaLpcLMxkbiGsUACvl3wXd5buOwHyZ7kdyRvkr1vKEl4P5mHneB6rvi89pnuGORW+y
	 ijQ3Yt39fvrBYqEwkaP0sgwbgsVnPUByxDAmafwWM/03fKIjG/ZRfgPBBrBks7xMfnYs+
	 Sh+GnJtfqJcGHnTuh5YerjEnbSMl+mzWVamnlTTUKKk3lXuVozmvaRJXxxXGFrebTV6DG
	 DqRLomZIF70uxMJNux2NMIT8FlNnEvttsgvS32X9lTB2NawzhrRXQ6guqgG8ljM8O8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMCK6jkU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC3606A320
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 15:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMCK6jkU
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adb75e65ecso821531fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 07:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795187251; cv=none;
        d=google.com; s=arc-20260327;
        b=M6pxXpfjdil3KhaZz80j/g/toSRbIIFaR70JFGYWqS7czH9PVhVl81MCC971Jlepxn
         E+y2oyQHw4cgcKHYDUbE58bLYlBylZAroLIu3PobmKSE5fIILzQNdESec3rbRvZN09Z9
         2qdL31faO9BwIFPoHmPvDMyPFgjTU7y6ty4prYgJVKU2ZNZUAVD7+J+BmIqQ8JJ8+bLz
         YhrbkPjGfGpJctYHKNxTRG3WQP5j6VCkC+d/z38fzDUVqt7FSFZMfkFs/KHi/HHfQqqq
         2CVtnw2VvANg7vj9Reaa4WIu+7ROe2+eAN/EQ6fQM05j4RTTufqUwSKzbU9vNvohTbvn
         5gfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0VIeYKjYJPYfVEKNuXLbK3ZTpB7YLv0Kh1v9qX8Ns0s=;
        fh=wk2XCFEEn6RiKEnGEHU8cp+6NZuSCDxnvnJ1hkl9Uqo=;
        b=E0akUflDR8POtiOmytu64Vjb2IO+Twpbo0NmR7LzXpvgHq3XBIylKnXl9zUZMgBb9y
         MvHL9UmloQgMBmEiNh9fp9n4wmjmp0xPITFG1sxdiPV3gsUROTtkKftCHHE3lpPwjTwu
         UgTclX8MYhAn4+m6DvqzFptmbMgR9vKG3egJXeaTPyv0fO2BMdl9CLDaC+Aj5zamVMX2
         DePfqT/M3aQbMKFRUYtcEm92bkAhSBQmAZvmp9nn3QkYsZFDJ6AH61G6zJVtmo3QtoSW
         wKEw+subQajCCp7zUjI7UbA1/5y2SfFw4ErLA/K5p3T0thgigtL2avUtG7bbT4DTMcJc
         6nag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187251; x=1795792051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VIeYKjYJPYfVEKNuXLbK3ZTpB7YLv0Kh1v9qX8Ns0s=;
        b=XMCK6jkUo7wByooJZtyW7ny3g5DZaDQdNAsIk3UApWv2FlnBhXrVmzZ64OAeqgR9c5
         duyNkpLRZetZ3LCPXqVMJuXS386vOmXoCNFj69w7n4F/Ig/HkURe3Sr/3I6GJUObY/Rx
         ipFP4aS7AR/Ic8SpRgM5fDGljWoof2wAZZuCqbbLadp4+dbMRko6M0soNXKYK1Ggd6Gp
         TyuQl+CZFlUnnZ+fRyzdzjDN7Qx13/uimy0GgXIh2/m2QKSccj22cJ7kpDzwSP0hYDgD
         MSuV1q/ZEtrQNahjTIZxSkPJl5TMj7A+7BMf97j/fcyFrO7fikF4uIStwPOweRf60bOT
         p9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187251; x=1795792051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VIeYKjYJPYfVEKNuXLbK3ZTpB7YLv0Kh1v9qX8Ns0s=;
        b=pNQ/QkBFl6bIaXgQc93jGrBiBYqgcO46xs4npNpxemf2pAe9+ABbhtuOMFEXQ/TM0Y
         t/v0OV5l+35DCxSf9svaTnrd8S0kCyqPUjILFFDJ9Ac1SnquyKeMjGHkFD9KXQJyHKpC
         5hTVoqgFyZTp6s7Wc71nfcBiSCUJzKTvKQvok+S2Xh8iUe0kFfgbylpHKup+cJz1ZgnQ
         0EMHXMBANiNyZKQIdbL21BkQNGgIqSGDNxjYmJ7M8bQDiZfcLmN1pNzD9SkXoQ+8Qp9j
         tyoNtv5gPy1BuBA0Xv0cdyeGzjcqC46arAMbXZxS0ebiD1DnuL8Mv+eLFfwwHb+sd2sa
         nQmw==
X-Forwarded-Encrypted: i=1; AL+hErFPf5I4vykUWTHkrbSbzrThvl3Zedcu4YjEDeid3uS/SFgePG6t1ncCoa/T/L45IYQjMaTLl/tCl5dbO+hxuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5MMRSLSnNPkmo7iMbuww7/baQRFHgx5hcAhSsWL+CIlkP0C0R
	Hy9RexEOF4mYIyQr35xITOYgpaEvnbQH6iy9VPag08gH3P7RyLGkDBotY5XbiEr/uYGHb2HMgQB
	RT8QRrKfRnBv3XUcij6qWM5aHkPAjV/E=
X-Gm-Gg: AZFdTZeijC6Y3BYT8HlGSMDIEvPKeRsAs/P6z/y9DJfLWBoapE9rIhWKp5OEtW6iyhx
	xZoO5WcP1UiBCOEkef69cpSPaQbTfbJiqEllZPIom9ei8Z7B2wUhomI1ri3Ym6khhH+J4Q6r5ud
	4FO/sUSdZVCZH6ei0HZAPPR2/GELnSMS0JKkF2SsWW5mKjs0jtY2ytBNIw+v9+Arq4y+aGOglYe
	lrxsx+qgGrVd6HsoTZGkyh532baISiMXW3bpFMpBfAv6GgCefHk4faeSbvz4PYWb22J31jq04FM
	1Gwx94rd1gXxl1Ih9NxIlcQZHR5Q8gqmmuBmJC9PyfN5Yq8uy4iztiA6Uwvejg7Eil5G2fFsrGz
	PNBKsVA6AcQ8Sjom8aUrlULzuBzL6FO/De8Dl2OFZygt2n5aaT/Xv30Fg/Ly83zzmVEgEmkhGJi
	hwn3v5yMrgTuJQsyzQwkh3nsZi6kqlNXnxx6jO3Fgft7LQNK7zCV0H20XXZ0LCTuq3f4rdp5l+B
	g13bjSgbQnQThXmNpUTji93q3W1iJJ6s5aVJCPuYh+42grxk19IuxO6APRget53uLLhZ3TS1lA=
X-Received: by 2002:a05:6512:23a4:b0:5bf:df58:d669 with SMTP id
 2adb3069b0e04-5c1bc69bf2cmr1387550e87.1.1795187250808; Fri, 20 Nov 2026
 07:07:30 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net> <20261118-dev-project-vis-v1-1-2a5f433bb516@garyguo.net>
In-Reply-To: <20261118-dev-project-vis-v1-1-2a5f433bb516@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 16:07:19 +0100
X-Gm-Features: Aa3M54q27XH1Xp2ep-HlHO7AOSvO61RSJVaTdBeMZuWQ8ApBPaE_qgH_4Z8u1g4
Message-ID: <CANiq72nNX41q_ZLOUUbyPmPownON1uxCLh=RXsVGBjFmoWhSBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: pin-init: internal: allow `clippy::large_unopt_stack_frames`
To: Gary Guo <gary@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:31=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Since Rust 1.102, Clippy renames `large_stack_frames` to
> `large_unopt_stack_frames` and make it warn by default. This is a good
> thing as in such cases pin-init should be used rather than potentially
> leave unoptimized large moves on stack. However, this also triggers in
> unexecutable code paths that pin-init generates for field duplication and
> exhaustiveness checks. Allow it on the generated check closure.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

We hit this in stable kernels, so:

Cc: stable@vger.kernel.org # 6.12.x (Rust is pinned in older LTSs)

Cheers,
Miguel
