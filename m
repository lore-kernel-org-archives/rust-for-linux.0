Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575460;
	b=O3d827yjO8bCu0MSfzBGU5TKVRo/LCM5rnhB7pwD2gczdE8gcQJ6RpNrCRzRyJ5UL8Fo
	 AIgiD5Gwjn5lxXBX9+0C9ouL9HdeW3YO8K1H4/ezmi/k2lQlWE6UFqbMhX3EaQz/2j9Pr
	 a6bvQ2X1VEfI1kknQg1uS6ovGhAFj1EC4XsRsTZ5HmJXb++YOOpImuPCNqCraBmlj0g13
	 cf8NwhWIjjxt5BqK+G1pMa6WKb7RSQV6Upd+/PkRPcFvpEuK7UAoM0UtznUv+u0HAGMZp
	 d60naaDab4N7d/5Vz0H94HM3a7RNhClNy0rnrhqKEo99pAA7is5CNHRMgDlYLH+ke/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dsPOGTQLoi0rzKoAlOG8d1lYBQg1OW1oD1gG87PYcdQ=;
	b=MBVqtuV2eVYo50tHQ7ls2hkE2LjQNa18NYxg3IELyOv/e7POvJoYAuL6Dmf8rwQNTMSX
	 BSDV3/f6qtG8KzUdzV3Kkt47ZsRdandMY1RegxOdiFHUygMt2SjKZnJGQjYPZX1eCqAtw
	 v7TBuM2UQB/lirkStpqWkAUeIIYXtwOGih8cuGJaRtDOF4YR3cFY3rr36BKwh/LSgfaCM
	 TIOTIb8gOJvyIhCKG2YSliunlfskDlUk9tBo+05BRvm1TdVyT+YfLfRVr7tkT9xZql041
	 ZNO3cj5bsOEPANTE0rlMBlWActWDXejJCvnH4UlOcy4sg0Ce6Ckk5AUygVeB+a/43ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="lyO39/h3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC8606A319
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FC8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lyO39/h3
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3667e94418bso47165eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 02:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575459; cv=none;
        d=google.com; s=arc-20260327;
        b=mFqo+AlA1iRAU+048aKLcSGWw/oogEsNBdBSGyynXg26Ywtj6ldhiZxSXM6FRHgKrF
         hT6fWvjCaYWOYqVeBu1oLG+5k1JhV74EIBrtv+QBdrnhYe0xhljMJtpmTCXG33ptt+Oi
         daaI0+SmuC8pv70shSqsijBEOngJt+WCaUhXrAomU6uY0flUbtk0UQY7+ftTn08BJ6sw
         sjtZ+Fr0eVgupXl/WzBfxBR1s50gyumFGsU1YYuRoaGv51TxIAgc14x33wrCkfQwShD0
         P4tIiCy7IG8yxoQT8p7YQA7XFm+X0DLbxQuR68Tat1d18+rWiUJbL5K/nHuf1tn8fbEm
         uCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dsPOGTQLoi0rzKoAlOG8d1lYBQg1OW1oD1gG87PYcdQ=;
        fh=EsAg2kUio3MDe7fI6/ofTDFy1ne7N0PtqnM5xCysWJA=;
        b=h6uld0c4+5TXO57X8+uARn2k5AwOmvQG+FAiakqG2e5t3k/yz4MI5gi/ygMOqx9j7E
         fWOLOZFVFdoIOLOAFVi554oS0ZYGtbatbyJHE1o1NICGSfVh6+xYoCbF5UmJkOzYt4qh
         KdtFbOu7ErgIp05Mb844I5YcDbT2+AP9YSJPZtItrKB7hm75hxmekqL2/wzEW3HzH73z
         lcQa2TBvNb25xe41Vn1fJgidhF3nVo+fNDAXOHmFhdn8KfYXrqGCbwRZ0dtNf83Kpfam
         9QghvsNU4P7SH5MEaXOCNRzzbTNFG62sl2Os/mtlfsQEu7gJGb5131LivE1cmXs/FhEA
         8uZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575459; x=1793180259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsPOGTQLoi0rzKoAlOG8d1lYBQg1OW1oD1gG87PYcdQ=;
        b=lyO39/h3vadAbBZSnxYCit8UCqhKByj3p1OZchONWtumyOeThw3cT3lwMfjPxtfgd0
         bG2Usxr8cE22Zo8HfabO4FT/03vXSSydHSuyY2D0WgY0tnmLUI4nbMrqOg5UZ3os/UI0
         4qvQY5u6llpem2dRN8mTxc3StQBPt65iWq22mEbb0ISCu68sXssRk4mxdcCr8927pN2+
         dwS+VIU2B21RGJDDXcs1U7dgFIRyYGh40Ok4aVeExP2uoMUfxRuAtGRDA3zetTDVNKnW
         HmzY0RCR0TGTNUbF0SbTp0fd1/iV4qxp3a4idwO0wQRt7TfZ04pRTcPCLwsJfQa8sVTP
         mwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575459; x=1793180259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsPOGTQLoi0rzKoAlOG8d1lYBQg1OW1oD1gG87PYcdQ=;
        b=aW3raBVhtk58Sgp9soLFaOWi5hsb+PR6ZrG/zYJ7oMACYrSFtOY19Mmu6icorlwSYW
         gKmMJlRTcR7AiYODRb6enpKtfVe9tZ/ptG4pzb8cCK/0L4XnlEEGoPB39aBHJi5mR9he
         /at0V+17JUSn4dSRbo4FQaZIczrEYhZy0T9lAlKWsy0DjqXDhcUVFP5xq5u9J4WNxamp
         CsoJdmc+jpH+r9XV36kuFT5+TH/vo5iHIuoH3sgGxDfbHAeeqU2Lw1oGfZG3fDw/wKe7
         24GHa3qDQNJZYaCSDmGBP5G83mngweWgf6ni5gDtk4RilpAEKbQAOEeM3I4PH7FoXeez
         mr1g==
X-Forwarded-Encrypted: i=1; AKwUvBx5WaWBUksCug9MtmlKOYpAjA8NiLjcuq/S8qU/7duNGtYgtDPb2SV72DE2XRvrBdhK5xqtcceK2ZtZd/rgTQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJli4HPgz0CkSAOySubTVF9nHHu9UGstBby8cPUa+XEL6683nXj
	DMmz7mI/jmn1bAtpvxoXWrPZjtN78tqmUIl+6bDmhrwk8lh+vRdFGk5xekU2RALdCLyKjq19HVp
	aEIw7uhwtb1PsHSeoJi0QzwsKGAVbHKg=
X-Gm-Gg: AYBFou2ZzHn7QM6/l4yKYWzifgsFJkSS4bbHbBdaKlYuzLph0W5YLjgRCML6w0bcPqC
	IsJBigU/jgWgp74uoOcRJkhR/MeUUtHyJsKAlgqMxPMgRRUr7dqlaXhgO03Sr71IiCMiHyAjPhp
	k9/bw+kd7wD++QFNbJvAS/fU2UNbcomYVHOMkeKx6e99M3b6w6SidITciPegYryY3UJ5HluajmO
	mQNu7ru1ka7FF1cwlKzCf0FQuz4nsnWaZtEl9nqyvqUK2Qbib/OXn4yP5Lo7O1IHvKj5cKLKqac
	icU/7SZz718yHJ4D4J5FkEtV1h3uT6MwDpms/o6ADQpdcemZgKUKvQ0E8NJVLfshzJZvcCHNVGu
	4dcFp+OkAtSc1Oc+Sf525VVZrKglFoOs939DkM4NzEvv3aVJkwsPJ2USvRpU5G0oKk19J6XJBYC
	aDrLkEw61CTng2Ab0LxVeGsaMhan1WTWe3TuGUaD3P3MGLoUdkp+kDkHG6CykJ3c3ID2945ktCG
	UkjuasuYy8wuZjT9noKUFkztvSfewqjgKLi
X-Received: by 2002:a05:7301:18a5:b0:35c:492b:e310 with SMTP id
 5a478bee46e88-3674866f609mr4050794eec.0.1792575458743; Wed, 21 Oct 2026
 02:37:38 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
In-Reply-To: <20261021033257.1359428-1-cmllamas@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 11:37:26 +0200
X-Gm-Features: AclHuK_gezHx8SH1bijhxHoa8Dbdh-lfkQe2cyS2NLO-bLn2HecxYdxDJWtCp4A
Message-ID: <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:33=E2=80=AFAM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> v2: open-code the %p behavior in MaybeHashed: No "0x" prefix.

Thanks! I think we may want to have an easier way to do this non-`0x`
formatting later, centrally, even if not as the default (which I am
ambivalent about -- I didn't hear more opinions on your other patch).

Cheers,
Miguel
