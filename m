Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2D3FF1
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542972; cv=pass; b=Wnjey9kaJZqOcF4drxv1+caQhIf43oWghEyvZed83Me0cUPm17lQOal/aFr6Nj8y7oApXvRv2a122E5OP6znPne6CISqVlhaxjk63GazbTqtcM9BKnf5IvyAsQFR8jEqZwnXvyGC/aF1uUzG97T6UiDgM7EYQ4bGawsgd+Rf03g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542972; c=relaxed/simple;
	bh=Q+/DRkIIF4erwY0u3dL098eIZuCczJVcy0eryVyHh0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWC/x1d+F+iENdU6F5dU7s4bwO6ySEzMx7CnfZLku6kF6STUiJ1Rex6av/ODHTJIetp6I5lbEXNQK9JaoStkgh6/BoRwfwOVcDaezaAtgAG3N/Wu8iXgQT5br8NT9EB7XjcEn/OU0fwRmEoSbaxI6IRl6ehp/NaIzbF3mYImwB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7M0RGJ1; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7M0RGJ1"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c16dc38120so109112eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 09:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774542970; cv=none;
        d=google.com; s=arc-20240605;
        b=L3XesDGxAVq4ujMUl0iD+Fchryy8dTUaORMxHZvatk2KOmVOxDtnNaVjzizcxnfwmE
         ZvMk4PvvVoM/G0eWQLIsXGRJD2jcFmvxgnS2u103eda/b7BT4u5hb9qrh7mSsxqejznp
         oLIDjbTqiTov223VnsjOCEt7ojoVdD3rgHCMXCmhIVsKQPd2xK8xiVHMiC9HiqXKo/BW
         jE2Q2oyyX2cryQKGBDWsnWMN/tlfHIy9Droz0/8czKDIajsOC51h8sBsasTiFhILmzb9
         RRYre5Qh0rzdCD5f10S3WsUhE5UFLW2TmKAFkTSj+Yp0tzHpz+/2cGAhatRkS299k3ba
         RvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nydeAOXpRYVwIW4c1YTZfBGPxow7LreCLUi0+NKHYUU=;
        fh=4RQomGos2n+fXw2kKLYPk6Ox6Ikhnu9ghTsJ0ZfBqjM=;
        b=Y0453TE3aEyJbBAlDDAF9dTEXIHRidm0orOmVg+TB6lUhNY4D23+2K3BcU+X7NnnV1
         ltANl8clXuZR+383zz4s3NSn8tnKBD7iWJW1y5L7eBz1mUNvEbFQ6JRq6h68CN7rK2Ff
         tIID9RTtSuJEU71Bae1Deaxb2wUT0BMNfU9VYCJmmVfJfjXtaKXCjelyNp4gewvUuCKg
         u4o9cO0T/HR+LM3o4hrYn0hMOPGdHKL3CZlNCVgvDTOsyXO0X/ie037TlDoBW4TMGZnI
         i3WsU/8obIT2uio6XSl40pnuvmRoV7Ww0b1+z7OzK+TnJ2hr0XUvlAj3Se7ifihxUCIB
         bUww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774542970; x=1775147770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nydeAOXpRYVwIW4c1YTZfBGPxow7LreCLUi0+NKHYUU=;
        b=p7M0RGJ1kq+QiY7PU/KpsFSpJiZBwDeFNwAfF3rLDTsGlWNoRzI0nrbZJL8eimc/JV
         RX687y5fIDeJAo39uVMLwzcXXqeCrH1bxhdJ+zimDYcG4S7Od1T27NLZb68TOGYEwmEk
         jWgOm78DL59YHa173+ikiAbstcdmkzgcztGkMkX6yeHKx6lAI/Re408MZ+bnb3Lz+zTo
         yOUfuVwIXy+RCsLddptnApNfIVMqEdP2bVv6OxD0wtCvxY/7pEh5SS45/MkCMI3v70m5
         Uzeq09XSq4SrFcKBTNZ0rX3Vgv3fTtXzJt6z5yYjBevqjVlXyo709iFfCR/2PrqDK5A9
         fp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542970; x=1775147770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nydeAOXpRYVwIW4c1YTZfBGPxow7LreCLUi0+NKHYUU=;
        b=jx6k5b5SPpq4OHXSm+/NlI5danTXxXqICHutT/AoScZ94DMuvBkRhWejAojtRQ/63x
         70lFqEBMgxOd6zxYC9WTRJKnTOgzTccmkqNW07dDFkZdBjx1NDo7jGPm/WRtxB5+9mZA
         izkGkM+VdW6AuyN7pe9UQ+APJEoObJmdwgwZwcjZbba2PeAEZD933EeAAfWnZGCNuDXY
         NHu0eX97mH+w7G4SZiaWHTHw+idGcwuO6mvFQSNuXIhXXPrCTQY4tYV3ilylRaEQQa/R
         QdPXTdG/4G9vbYxyaetakR3GFkLjaJkVTXvu136933hpnEBq8jp8qzyxQxthpQp018Cb
         mRMg==
X-Forwarded-Encrypted: i=1; AJvYcCU357P1S4UTVIs7KiNajtEpneX1rp1GJ6u5R02FYfuQlvgxNs9TGpI43sEHtOtXhrz5yNXPpBqo+kyDCEu4Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRtG79Z5busPigcWhe6HCw8OkK1byZnW+H+DCtYUb71jiCNYq7
	mY0b7D1Q8km492pBUwaqmMeD2HeaH1CkEm8wsZpqHBX9JfHM8rpi6Z3d47s/NLtUT0iZ9qQR5Bp
	zjYnNGajTdsNL6xhfMJtVUfTKjH3gox8=
X-Gm-Gg: ATEYQzzcr1SHAmayM3aSffM92nMexZoFrzPgKqxOvx/94zAv9TD3Z0f8h+jdIq30Z2Y
	zzzEJwSibPeittKdiYenxfF+LjGIG52PZ4SosKTRlyapjyKGFanNfsBAkMFfmL9/bWQxMFTn9xC
	ZuJ+rSkXvZSezac9cdmudG7XI1UFVo6mnEAj9WRGADepk9WpMiQ8p6/pHBan4Lk8vkO6/Q5jPLK
	zE+zGo8L67jRgtlObxQJckJazW3GL/TmCVrdG2bnRl75RFU+tbTXHh8ttUPI7Ku98rRxfCjGDh2
	ZkaXDCxx9Sd2zFd8zuzEHAbPYHIokdAeQTbn7KXjc0Hv6JdXB8lRwqhG+EID3fgODxZdNKh65UJ
	5WRWknNfUKdJA8mFclC82/RY=
X-Received: by 2002:a05:7300:3b04:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2c15d389680mr2432111eec.4.1774542969928; Thu, 26 Mar 2026
 09:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev> <20260326-b4-tyr-debugfs-v1-3-074badd18716@linux.dev>
In-Reply-To: <20260326-b4-tyr-debugfs-v1-3-074badd18716@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 17:35:57 +0100
X-Gm-Features: AQROBzDQHHLoflnxMNt36NzcqIK5070iU_W4yEb_v-_RwpsKDpwB2QFMZ_oaOeE
Message-ID: <CANiq72mg9nAMrFNc4Tbn7rXeSoZGETTZnUtKBieVT3XLBmmhYA@mail.gmail.com>
Subject: Re: [PATCH 03/13] rust: sync: set_once: Rename InitError variants to
 fix clippy warning
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 7:55=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> Fixes clippy warning:
> warning: all variants have the same postfix: `Init`
>   --> rust/kernel/sync/set_once.rs:68:1

Is this fixing an issue earlier in the series?

If so, then I would suggest just fixing the patch that introduced the
issue directly (since you are not the author, you can use square
brackets between the Signed-off-bys to indicate what you changed. I
agree with Gary that is may be simpler to just allow the warning.

If not, then please add a Fixes: tag pointing to the commit being fixed.

(By the way, if you do keep this patch, then please copy-paste more of
the warning, i.e. it doesn't say what lint is being triggered. In
addition, the imperative mood is what is expected in commit messages
for the kernel.)

Thanks!

Cheers,
Miguel
