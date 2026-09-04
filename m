Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677D3B14C7
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Sep 2026 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507209; cv=pass; b=RoLUldGIIL49dYtgNQeKBxrVt/SYGqAaz8QOtAgZalHTTXhto5+0VOEaYOI9r+kQ3swuwHN+XmYGRPR/+unuwKSFZFJ2N/xhxbvi3EG/neA13+txLe5Isreobmfah+9QkbDIChiUDgrPw20Iv9pheVbbGLXvtaEPy3z/mtaKAI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507209; c=relaxed/simple;
	bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFXMdwTTxo3oXpP5KXe7A5ILodiG7JBhj7zg52Qn1ILvhecIHw2S719hNIxEI+VzA7AD4YGBJpPYMivu6iIXpR4QEFzUDjnCkWhLBZaGQD8gFY9AGEtLwmpmrJUkLsBCU76szfyJDuhWr6qowvEWCBnPeGAZTaV1h4GtplfJr4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDZAmMop; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDZAmMop"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-396555b8c7cso103230a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Sep 2026 00:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788507207; cv=none;
        d=google.com; s=arc-20260327;
        b=aE8E5olz37r5kh0Z04gBLvBHknU4Sr9N7PnWirtbZqE6wKxJqFwqzw3uCkibeyuUMA
         LcENWj4MZqtiivAotI+de8HLQT2pNfBoUSNsWz/TLAAs66/3J83lmAJUSt80rWC+4rPu
         +dlfaXd+FMEqQR/G4jSxL0u3vviWZoJ4sYKBgeb4ePBbacgSLN23exG8ac0qj4eJg/MR
         k7qtvM9P41Jr932BPtZqTEI8qWi3zbjlQQtD5b8E4xYly8uIjJ1bFnHyMyHs4Su72VBP
         x18rGE9YhSEnkwOi9JCFbB48d9aXlvhjQYOyA2LKB+DbuR/4Q+iiLf+4IDCHmMcjLyF4
         lqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        fh=SQCpF1zrX+OWXzThd/EmfiO+VLwoEcXdYiZC/DKZJxQ=;
        b=NZIHS/1t9+Eom/JV3Mz/pbdSP9gfag1D4NJdNEm/rr5Kseyw5/xW2u6+reV7iXkKa4
         uPhdelDe7cYn6s8EBj5MT81+deLXqtd3s6oOj5Blf5lqZBJg2gPj03Zcxdm2qADh4Mxj
         NePXB3oa6iEyBmthO+PCXJeysaI9qBVZY3KC5ZJYD/g8Z7hf4GpgucsK/Q8Z7bxtYy4e
         1gmz6YGEo7GR27jD90sBycf2yjTMXeF6IlyNhS+xx7u1AM4JebQD1X0pPnUG0hSL0lCX
         DsfskaT0wWzAr7cf3/2/J6aX0+14oOagmmX3p23h1oVjy4PKH8ISk6kuwvU/gsCEZt9u
         55Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788507207; x=1789112007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        b=SDZAmMopSCUl4xfnIw8zILP2STvKxsUGUiEh1FQDVGua8xFaZ5UtDafY9uWfM5L5Uk
         g6B22inFWeo3MVdK/nnQOiLkPYd1MoXHgE4TO4o5IbYxGWypXkbVC4XZIQc3OWSYHKAv
         GRzDwY33PQhIE00mpJIBrzl+3C+1jkEVtMyHYPkjfAzkGVJpUyl0a1Nf0V9hwNftjN7A
         m7jxcx0V6P8jmdZSZCbHp8yAgd0xEWGf8Hj4TgcE7sFt5VZHIJOVLaXGHiqXzkOEi7x9
         VfUa4sVnGMkNiVoEM42mQ35bzCl1LSRgAJG0odYSZqHWtGsKx9xb3KagJ6NJkhDb2+6k
         cWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507207; x=1789112007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afPt/0KFpvntFZhHSqjYB0IVvdjVfuzsHdAD7Cxurzc=;
        b=iN/dCcMJccGbOvmO6tLSqn/C1/lSA2lajacAdcveT+1PCMfswxddi4CeJ8KYzJ/XOX
         st5L5vKDn/bKBuipz/xzG/BG7f7fFsMGZuwwDzB58LzRDxKcQGGDIApvt3bGwiw3Zrou
         vfaswUjGuphw238+FoOlOT55+c8jCBsjF4Luuiy+QsOROEqV9sk6sDWidCNo7GEmrfhl
         vFzsl2nSKHwfWkbWoOGBsTbhKwCo1cirPctY6zl2ZKyVL7s6PRmE5bRxuDx/z0r//bRm
         B5GKsL+kRvJmXkofeLteCZzXfc49qTaxgkP7wIfANZoXkEkyG0jnbheV4lwOBaWCI+2f
         DiHA==
X-Forwarded-Encrypted: i=1; AKwUvByaHcVHMUKqDjCFagjYzJEXkpg/eIbte8vQJGZkCW1Rp3JUSO8ITihPzOd64gwRGNWQ+I4TobcrkR96Iz1xEQ==@vger.kernel.org
X-Gm-Message-State: AFuF++klzdbKivPvgz9gS2IaY/lp4UrAVKLn6yD1vl3LBBK4SKfZlW8i
	0pTH2tF+RoJO5RHP6QfHLeD5PVPiKHHRTS8RcCkrIvjfIr9DkmW/EFNgyUn8S77qFJzNkcUqmfT
	4qdgydT5NEAjm4N7bWHjAmcvxVeUwYBI=
X-Gm-Gg: AYBFou31/P0qCH3zoNXK/rrVelKsMTE8C4y7FXb7L/LqI/RTy6iufh3m13g0JgG7JuJ
	OLbFWDP+F1wyTrVrV2YuLWAOFRvMhqxtbs3rIrWQfPfUUY8kyQ6xao9PsiBQNJrSizYRG3Q7F0J
	Ymx8kyyR7oRueLyBS2pvWL6XUk54wnIKXmaS8naPQa6FkX4r9kF4nCCOw3R99D2ltn5JAyte0op
	EcHEil4eOrWnADCg/hlGe5nKRm8YjD9n+8FgEgN+ZB1C6QSGhyHNi2Ie/LDkN4MYE0f+NCJGt8T
	cNH2/y5J3B1wGY1552J0kuCVhcKkivV/GQHgiGa9cg0TR6is9GUkUXQvlgnpnglQiAUniVtJKtg
	sJuaW1x8XwIushhNUE1bCR5Ap6tQVg04L6ewWToZuUzv9dSq1czjlPkbhzkTN
X-Received: by 2002:a17:90b:4b86:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-39b26252efemr4118157a91.4.1788507206622; Fri, 04 Sep 2026
 00:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
 <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com> <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
In-Reply-To: <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 09:33:14 +0200
X-Gm-Features: AcwNN1XWy7WQ5apZIMaAZwbTUURDXMelE7BtsLngCp1nI7dZlSv2a0vAJ741AE0
Message-ID: <CANiq72nHb=bD9mtFTJk7cWgxpp0Uh2K7W4GB1ygtNEF4d3zKag@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:51=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> I queued for loongarch-fixes, thanks.

Great, thanks, please feel free to add my Acked-by:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
