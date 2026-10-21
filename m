Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572742;
	b=rtn6fspZPweDU5+IqrSZvHx1NmjX1pXR345j872Iv2TZ+3Vzv7r319gXrn53PT3UTFBV
	 1royb3CwqXacMIxg/LmP2620w7HLNHLGx98xWhahipeC8OJ/5BcIOrRhv21Z3Q5QqEnBG
	 RmNSFr1p+DaviAFHuf0ELYmt6lR0oDBhO4zt9om4jFTRN5/zznQ/y4Dyt/0HCdZ48XZOW
	 fadCirRwskSCe6suaDffDojIHUNIWvU2Uo6k9PunEs9R7qpPHmVrWnheT3nt2oOfHNpAd
	 NyBwAVAZqW38jFGptmXgMRa7gfvNOmc3Znqs+ESgwj+Ej8RDuYvA5sROYKS4DKAijkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SEtvLlHPZX8KBMC3GTWr7jAy6Jfm2stXMKr2M6fDZ54=;
	b=vUtzARdxfYZg098s2aHPUSVsYKwUyAfAhSShfTvjZXOeiakjOebhaixXw+WqyKOPvKhi
	 eluinNS5x380gYxGcjwUARjxQDa5PHGelBbF9533CHlrndpWyd6CT7zFjvwi6KC5FL7Wv
	 RUwc4sGNsTvPsPJWIzoBemTwVwpep9a2Q7w3HdzpkKxim83vMcnmlWoqQcTyCB2DmOQY3
	 GuXcfM8SMOJVJ6NewejMzCuR7yB/7gnNMYSvnrOIOLmkfHPlgCVnxIZRRyudpGd6qOGIE
	 d1l9grn8nqYWrCJapfY9mBDDPqpf0LgQVJN1p32gv01UqdUKoyPUz96DoSNh2HMHlrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FWwDBVJU;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBE6606A31A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 08:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FWwDBVJU
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c4445512dso415120f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792572740; x=1793177540; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEtvLlHPZX8KBMC3GTWr7jAy6Jfm2stXMKr2M6fDZ54=;
        b=FWwDBVJUl2FEvu3LhQKSqJTnAYB2q3PHqxkB9rV7TxtBa8U7l6gxC0CV7V8qbZIkFX
         PTdSKevf9CTdlR5ZNt+S8nXtK7enwipsUlYTKrWY/YeLSIQsMh451uX7quI/Shc38NJ9
         bCfRZ24pODfuDdBaXsg5OpbjMBIZz1PBH1zvrkYnqCdBG/wbuFGdD8eD/+hF66UzP+5u
         OqXLvdKnjQtIXsLAcPMCG7uOeSSNPQCbBtBfgSv5lQK5WpwspIgg3a3xsQIywtsmhy33
         9jT5Ys1E5a992oYT6oGpSaOpH231OMfsJt56wViHcwjhE5ml05QGys/id5E44AaPRgAO
         9l3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572740; x=1793177540;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEtvLlHPZX8KBMC3GTWr7jAy6Jfm2stXMKr2M6fDZ54=;
        b=i0uxVBMUqwYPaJNG6JIZ/3UQ1L8fnlxz70bxn85mZTM/bTRx8LldK1KlG7KljxRgx4
         UIrV9hPgW/JWXiEVbn1Nm+AjlTSKRqfTtuaF93tl8lBuDN8tpz4kB37kDNRQyj8xxJgO
         zpmpWy4Vmx7PpMoCB1PDwOKgghfY2oQABg32Q9TUvd7xJmzc21z+srLyIDtv0cx+oyqz
         F0qlys6phpe312jUP3J/BgW9yUnkp3SEBwvnMCji9aYXM2m9cM6ViEHWEGrTs0m5Q62L
         nczVDp+N1Qc7Kb3wWoInZRe2Ag/z21AkPTsFHtAjw2FjqI2rCoExG095+26nowqbernh
         D2rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzmtVwG/jXZJWucpqVBy+OOomdTH81NneQ3mL7dZBFkRVVE2t8UJ2cQ3uHffWT5HfOodeChq3sK7ty+OVVsg==@vger.kernel.org
X-Gm-Message-State: AFq9FYID1siz68wULkButeq6SGLJMMgnCO1BKo99PcBHRCTJ1E+Unm5s
	B4/8RQaxNmqcvAyPWw5uZJS9UvYwmSNaUWhNSO4f6gL0tuusYKHYndhaxZdQ3AX7vizFYIKWVn+
	EF4f8BGeIhRT03QnIlA==
X-Received: from wrqr9.prod.google.com ([2002:a5d:4989:0:b0:48d:faa3:7b10])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2283:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-48e264958f2mr3332623f8f.31.1792572739863;
 Wed, 21 Oct 2026 01:52:19 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:52:17 +0000
In-Reply-To: <20261020-b4-dev_query_fixes-v4-2-df66b4c98bc6@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com> <20261020-b4-dev_query_fixes-v4-2-df66b4c98bc6@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021085219.426333-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/3] rust: uaccess: add method to get UserPtr from u64
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 05:06:46PM -0700, Deborah Brouwer wrote:
> Currently a UserPtr can be created from a usize integer representing a
> userspace address. To create a UserPtr from a u64 integer, the u64 must
> be cast to usize. On 32-bit systems, this cast will discard the upper 32
> bits of the address.
> 
> Provide a new method to create a UserPtr from a u64 integer. This avoids
> the caller having to cast before creating a UserPtr and also clarifies
> that the truncation is intended. This is equivalent to the C-side
> macro u64_to_user_ptr() that provides typechecking and casting to a __user
> pointer.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
