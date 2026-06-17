Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE02F7F06
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709226; cv=pass; b=mJCLxK/yKl/PtlSV0HPccF4PbL0jhmfyx5Rk/bOWW2Yg2bqFY8wUvNuf/pFMwOUK1HzihK5gH0kU/OJTpmwMt3xvmeytbTnoCD/VyPMk7bRjB9xlCtOVS4GmMSQ2lUuO9M7cdw+xnWcmoCZt2RmvOvl/a9KsJ2GOmdWaQlHrDJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709226; c=relaxed/simple;
	bh=1YeOeVcaV3t2A2us7OOjCzRwIaW3U9bhvKRMSctJIqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lk7/jsUS/XFkzttvyJdXqCsO2tRY4oTfZ6k6QbxF2dhIRt029EdozZjB81iRRI/w6JQj/jc0z1fmVLEX4Doj1csRMrCRt1Ul4aXdtc20F0HocqGKMJIgIGBXXg1klUK/VwcmhtP4ubf+eru9vC62A73uOUbp+fTdOIt1daKBA1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3IPLQQH; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3IPLQQH"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bbfe3aefdso141647eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781709224; cv=none;
        d=google.com; s=arc-20240605;
        b=kPEn64vCilCEz7xv2oKH+SxeqOTv+jxgchOo8km2hCCwMZCHy2YJ9RUafcQpEablRc
         oF+EIq8x/nnl2I7OQyR6RDFH41K7YhsgPAhITA6BUWLVIOme/L+5hgAoU6xdFBX6OspW
         Jtad4glWLxGIC647kLNJaBQ/uFXG8/V7EVT41wEMeD6IH1RXpJuqysygKNE9AQj0PywC
         41wHAfluOGfVROJOWzSpE7xhkuGTz4YEfyvT6Nrr3cdhNDE574djiqoaZwMCTdyY8vH+
         KCFrMXMci0wsrvWfsCGk7jOFFWPEpu6Yg184RRmph9bMEqZlbRaWBhuXXOejix8SoV9r
         hd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1YeOeVcaV3t2A2us7OOjCzRwIaW3U9bhvKRMSctJIqo=;
        fh=bnwwiMPrXUbK20aOgaaQG6CWfalkwOofKLdhNxzxkHo=;
        b=i+lbO8UZ8dUxZZxrJ1gOp89zSVn7BLDz4Q0KZqSFzb+54mFsrw+GGAeWA5PtDzZrEj
         mg5AXJLCsxT43AAr5S5opNbP29/86ICan6BlFR0qPsa5Y9kG0CPp+zhUsgYeUvzBoqWq
         pFdAIivEHl5AProwZtAP94hgSduE02jVDd6vFmobyMMP8SkwxYcrMLLJPVSylANVyvh2
         KKz6txYujEPIWYAoKIpB3NkDGvR6SEnG17gn7Hsv9pGM0pUpc5D73Wv0SICe0hN9ZOrX
         R/UxuAwRGxhfz9lkKZO0a03h9XTPCQ/OZfFUAbEN8XdnObc/OW4x83b/WyyKIk9IYrXH
         Ep+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781709224; x=1782314024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YeOeVcaV3t2A2us7OOjCzRwIaW3U9bhvKRMSctJIqo=;
        b=a3IPLQQHU3TzqK+rzjoHYChzlNkxQuFmzyiPDoaJFs1hbkBE9aaneuRYHcS4AbjEdQ
         8ChIrZH1O5VzZrY5yDVTr9SHYIMH3k1mVX3kGR4IV6yArKaogOvArdKYCJTygTNfHEVI
         u7yK38oiIfe+TvWZndP/LwVfQOXIraUxSDbzNa5je6a2PsznukCkGsKy7YHK+DuGU8R0
         YUII8KL6Ud4YuYSDlZQrO8rO+u1EXwGZ6CspE+DBcyX7zs85Fq24ZMhnhowh1XhDeq0r
         UOY8Ic7uqXZyVI4M/HIOorYdP+RviLxaKPkgyUTqDfYwixLor5X/bI2dHVPDpQS+yAja
         XQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709224; x=1782314024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1YeOeVcaV3t2A2us7OOjCzRwIaW3U9bhvKRMSctJIqo=;
        b=qFByTD8EA+o9hCdbGqGufK6C6pq5m8oHIx1t0iUqRhY+eXdoktypS1PEkDwQVUF5/U
         69mvw97KM4t/d3QBpSXXWdq9ufBqLcqCQEMV4jcXveTifbVFDFCuig7Ie7IpnZxAfg5n
         9YsQXVz4P8XfsfESztQTzFoYrIf0tmzUhcVhse4N5bmWBfmY10U09V94pWJ1jfW0Zk/I
         kLaTyCqlJ4dcKKFUQS61qrLcnirsGWjNmKina96YMId5G9juDZZ5xvtQ1Z4gJwSLORfm
         eCn6m5Xoti8OMjYaVjYNmPGzM1vESkzwnRycvxUJwhhMvdO0GJqef3wILzdm5tChH/Hb
         d0Tw==
X-Gm-Message-State: AOJu0YzjZIr2ZzRjT0vRVKXgloVPVvTCxnKiBho0Zfcw+qCj2uNJ7XJP
	yRxCpUAfFErqtF7sIo4z9s3LuDzXfgGgGtBAExwhe24n5u0n/gBj1AxAYfT6hViH2A2N/yDuzO1
	cHNtK43Yr8WgLFP7VqwTZHrc1v4PjE7s=
X-Gm-Gg: AfdE7ck51aFUbzcYzU9GgUiswp0xOVxmMMaM5KqrF0Y9UkYIEJlyNn7MgFKdSQ1tpcK
	zqr/1nTNKjyOu7m6+N3zQXUaLiPO/Dv0tAAK6iXszW6ZNkKJf6ilud2jdMw3X4428ZCa13P9UhG
	jwHB4tXwmwO4ZX4VX2shrb2nHJJR1MMHKoDoVx7FL+yiLFrVbCuGiQhhH5PakHYdJv8pTnkF7D4
	WKjrl78NA6r8Ym4eLQ4TxGAXh8FqW/g+woStl5K6zuOSV62bYr4BAcJUBCt8XWlydObAwCH++VJ
	IcRJLRnWrPJub2Xj2zryejZGLRx1JWFK9EviKyZamKZJUWL5H5tS0JjlDQFL99H9VMy9xP52qhy
	2ygLEgAo0OFny
X-Received: by 2002:a05:7301:670a:b0:30b:ab02:9e5d with SMTP id
 5a478bee46e88-30bca0ff9a4mr1011746eec.6.1781709224326; Wed, 17 Jun 2026
 08:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617150143.2152-1-mike@fireburn.co.uk>
In-Reply-To: <20260617150143.2152-1-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 17:13:32 +0200
X-Gm-Features: AVVi8Ccbv3X1xkwu2DB9qCxLaen8yiIiQN6moOtMJGKTe61-EHWEqACwA8v8LdI
Message-ID: <CANiq72=me+GZCOW1H5FtfE-b1OY5FXN0yT2S3661vP+S0EDVwQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] rust: crypto: library AES-128 / SHA-256 / HMAC + RSA
To: Mike Lothian <mike@fireburn.co.uk>
Cc: rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 5:01=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> Both were factored out of an out-of-tree in-kernel Rust DisplayLink DL3
> dock driver (which needs SHA/HMAC/AES for HDCP 2.2 and RSA for the AKE),
> but the module is generic. Compile-tested in-tree against drm-next.

Same question as in the other patch series you just sent: is this only
expected for an out-of-tree driver? Maintainers generally cannot take
dead code, unless there is a good justification behind it -- is the
driver expected to land upstream? Do you have a link to the code?

Thanks!

Cheers,
Miguel
