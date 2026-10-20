Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792539549;
	b=hTNKUP/DUGhkCPn7Z8UfOa60xbBQH1QZXwQ4QIeUxQzytceGFoLffFRahKsDaAVmJKUJ
	 sTxSjp4FNjT8lavrHxgIlg+UW520XyGiFQMVu1BTA0krTekQYYdbUilXAtEoOKaDQ6Mf5
	 iUko+eWrBbfL/CxRyWfBTMPd52BFKxl84Gx2dPURmXW1hkrayRgVx+HlLnsW/IeoKKVLk
	 PCfpySbEmSR4Zub/Gc/R/OwEsU2Wh8KBou8Cfo/8J3y/Kt7+uZPJad7kFtIPgWvrUVFuz
	 Zuh2OMoupbw0fufFwersPZuwoE2Oz3FwAd26T9ajLV1aCgUI5bJH8mBGE2cBtbwXjqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0QsbV+4eS5sDEhfqWeQ1tQuP/vIQExpdlAmYVuAUHhs=;
	b=KVSy531Uql3KI/FdaOtk72JSYbFdpYX1MnAi1q86D2M72lHE4b9TXe57GPlzl4b0Zt9+
	 dIk0IbM/O2Azo4A4lW1+Fqyrpt+1RTdYvsrXnVBB4ntmgwj4JMSkUPQU0rGcqCBypewop
	 n4qG51zzH26tR+hPVe77NvQQleKHG4LfRzM78kuN0+6LbL9drdBnRKJ3FdgUHmdo9USmD
	 qXTfCAjrsO8e45ZMXtxzHS6ERcfutzGaaTPR4aw3COoYoCCXYMlVcFz4/ju8ORV4fAHV2
	 N7XFiUpksjM3pqvDvc4QNdZ+FN7LtgVKMbo5h0Zdk4AfeLy1i4ILJ/OtZN/2VUd/RWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hIfeR7ek;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0599606A31B
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 23:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0599606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hIfeR7ek
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3667e94418bso11172eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 16:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792539548; cv=none;
        d=google.com; s=arc-20260327;
        b=kI754kahvX9uUukq1agceeDx0cvG2ZIyoWvvRCjkGz+3VgHb7tdGCyeQpMQieQhjQe
         eAHgGH2btJI7bTgWVvH05wogqAk1JfdkLOS0adDYW6IhTu8whcNDwIbJ/Z6dwjAl7++/
         kdyXP6C2UxTo0iADa+yuszlHhY0mPPZsvi8UZOE/wOoAdjvnzWP/qnfNJa02bNyXxBuw
         /Uc5ISVNvM0qbODGaK6jzwajzehXZr7lmIG3VMEirlrR2wGuxplr/LjnsQ/YVitg5evw
         5g3V7oG69LtnB276c3T/yjvTqwtxL4qp70FcEuM8bD2h3egg+1ANh0BjJKcPhh7Gay8J
         jwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0QsbV+4eS5sDEhfqWeQ1tQuP/vIQExpdlAmYVuAUHhs=;
        fh=Pq2V8ZLrO08M9cbG1kQLVafaxBqnIsYMa+5m25G/Qrk=;
        b=eJ3ltHQIJM/b9e9nSpuAUNLNYLYtZ2/VsNgXi4R+HbgnebK0jpptL2SA/HTQa6pgsB
         c/VkGTFSYSpncx7tSvpE9QCIKJ83ChJVoZ2fqOhxSjVDnALFkkcgE5zMxf3LlMP6hFHn
         04n+Sp/JARKVe5Nc0faHJNyxwWDTjKqw/vN89Pvt6toTwxvZ5K8cLIO/llFJN9Ev2iTg
         qP/sPxRXbosO/Dp4tuHhmPyDhYUbhV3q4tMzdDPnAxQ8QJEA1grsgR6Y8d8w2o9K/AE2
         fSOQlVchfi+U+yzEYYZPrgLn3v+EIcdn8IxVUj3U88kkklhHGMrb60asJ1nlZqN90dEk
         wxEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792539548; x=1793144348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0QsbV+4eS5sDEhfqWeQ1tQuP/vIQExpdlAmYVuAUHhs=;
        b=hIfeR7eko7mYwPUSSYNG76Jw1jM5Rf5GMf8HvzVDyJDFldyrw/5Q0O0MBXeqNWYcrI
         NRVNT468KlBZIEwn1GByUSToEzMQgRiSsApmz/sjdu37KaEH7jcjTEj3zntFGiJLY+m2
         CBePTmAuZ4PqoA9HZqM3ccV/ouerEa9LygyMy4pjYyH7OzJiNHm0b4EfrHrI66rOuVAi
         soyawgK4BX6PXtzXjARtbd4cF/KRc2KaKFnSHAIkm1fIXMysmGzfOgdyurnjX8JphMIW
         jw8h95fbE2O/s3CzSXMWavSIFJ/ccuq9hZ/5gc8vaSWxjwiOSK/UIk6tvPiUF0fhgDa6
         589Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539548; x=1793144348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QsbV+4eS5sDEhfqWeQ1tQuP/vIQExpdlAmYVuAUHhs=;
        b=Ipcq9/wIACMM5a/5IvXyZBG4PfIQzFk+mBaXBIM713zQOwc9MS8al3Rd0gwrAdW2zh
         IGTX1Npsn/15RRti6KqYML0doUuRAiIdricrKEy3lc+FH7rpcfcnyz68c0U5jIo1cQF2
         203/n80YZjqW86p+66Eq6GlQBv2ezrC8GsTkOVd4IYcMPI4mt+CB4somhthoF1nMk5AL
         KqVG4BVv/f2/kUDFHTET/B9V9a7KGDgny5UWcULaN4bcxBuTS4l3v8t/IVXx3JKjQjN+
         PsTyVXOKmBOjwM7nyoAOPyq8/iu+3aRyjntyg22lKL4Q7VHIBlHvCMxUg2aX7kd0RPSB
         S6Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxA7+wt0jdPBDh5uf7y+iTZmzkAWm4+sY0bBwUaxqUp7hXCep7me/rUqQxMXzq6zEJgvi1EnWc0C2Rc/zHXJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL3xS7WC7WMGnPotLd7Z+XZKK2Z5eBEzdgIMgfgWFupTG+62Ptt
	icIpxmNR6+5LcfGwHdJaLJP1d6/x9wdFd5jI+3iLboE5nsaJirPEXSYSeo7lnaI1TGwFFgcSzM/
	mcZWIy+9ecRXRzx21pFCA70WVlEv/Nc0=
X-Gm-Gg: AYBFou1pNASASmNWRpgfX+d3zjQygADD2updVcHGz0LAHGDm8VH2IWnR6CU4uWS40wS
	xcu4EnViMMjip7JTGAJHA+3hcuZNmCGiyU9jZmrIn54FJKF8wogDECl09jJZobgcwYKAb85h+HF
	iEzaBrb/CybN19FWArPQhn3psku42t904rNGwR48Bi0iX8GE7IRXx/3xO3saGC7sZJAqoGdg9Bo
	c4B1AQxU9wjiienKDTJdWjWqIojumqIV9rIv+zcJW9QTKLd8KjUwRGQzszqFCGPYLD0bax0y/u6
	KmqD4b/59DijQ99s1lUSLnwcZ6mZpr04NM2pxf7x1jA/8CXMO2HyrN7W3cMcvbQq0+dpBl9gNRQ
	7Y4BCHANa6JHqreDevn8qJ9yrR4HnY0ZCmHwUsrDxtAuS1CFtjDizdTAa8mL7M3Y9vShvYS7Q4/
	IWbt/9cPpXVmahE5OwjTFNMBAgYr1rVT3IFJQR8gv+5x74n1ytdMQ=
X-Received: by 2002:a05:7301:18a5:b0:35c:492b:e310 with SMTP id
 5a478bee46e88-3674866f609mr1510231eec.0.1792539547565; Tue, 20 Oct 2026
 16:39:07 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018131313.59391-1-ojeda@kernel.org>
In-Reply-To: <20261018131313.59391-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 01:38:53 +0200
X-Gm-Features: AclHuK8yYamw4gnf0-K8VwIxz8gbaA14LOonPBIXFXHfecsWiw-2OkqdsYTLYA8
Message-ID: <CANiq72mJs3=z86wp2kNLJv1iUOiqxWnGt2KDhnwrwOCSkOUY1A@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function for
 Rust 1.101.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 3:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.101.0 (expected 2026-12-24), `objtool` may report:
>
>     rust/kernel.o: warning: objtool: _R..._4core6result13unwrap_failed...=
()
>     falls through to next function _R..._4core6result13unwrap_failed...()
>
> (and others) due to calls to the `noreturn` symbol:
>
>     core::result::unwrap_failed::unwrap_failed_inner
>
> Rust introduced this helper when making `unwrap_failed` generic [1]. The
> existing entry for `unwrap_failed` does not match the new helper.
>
> Thus add the mangled one to the list so that `objtool` knows it is
> actually `noreturn`.
>
> See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
> for more details.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Assisted-by: LLM
> Link: https://github.com/rust-lang/rust/pull/164059 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- tags still welcome!

Cheers,
Miguel
