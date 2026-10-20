Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523381;
	b=zp+aIFOLhl36YPRsRARVJ+9cRifYPwvU/mbcw/dMMmpTasXcRGfdcREc9zU2eJ+z2C6N
	 RAgBo3aggOtvuZ1ZcgxVSKAxy3g6vZ4274tzCux87emwkew4wQc+tTfRcla6IWUXHmOPW
	 GAjXuEaYT7PZGX98VSiA55b54A4l+ZBn0DQPbxNV2xeATxn+UJhtaxMDb1wNgX0ypGoe6
	 zzIaBdlpd0WX6qGeYRWXxGMgLxBcG77T9dbcuHxopZKex1jMnJ7wT4w283xxouoBRq/8V
	 QOZIJY36nJ8UfiG/2eMdcu7w2eRE85HyPS/OJHOQ8vV3cj7cFwswB/1OgVUU3yU4Nuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
	b=pNPMGnlFHrgYBAsdK4PzvE9BbT1WdWEpOiH00MKCUu6CoCbUh++IXgh7cPhFzrOcivee
	 sdNHCoxtmjpDdveJ0j890Jsqdfa9O6JzKKJShFFzPVNyrbFylJvPUUuIdRWJ7ixadVvC5
	 aFgwJNWspv5CGF4TbMzLQ5MctIAOWt2IOuclCXapJmx0OBK+2utpqXCjMCnshbZGd5H9U
	 /lzK5B59BCMucnW/PYdTsRZXfZsAGfBJbwhu4UZxI2ZHsMBuyMmkkgkCszahT1KNpjct+
	 rC2mp8UgLemJy51ZP/XOunb0Iy+UW4TPLXmJW0z617B+8ThmQFienRY7Hx/4w6ful2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5556606A319
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 19:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5556606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-363cd582f45so191978eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 12:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792523380; cv=none;
        d=google.com; s=arc-20260327;
        b=roSAs44Z6DZqqB54tzm+M9i+fGVhcD/0TLBL+FxB1BilPDVOswWlKLTbRRcQJi1qyt
         4syr5+0Q9HupDECLWzfuL+W2f6ceQNNbRjmFOtT4OLuBAZcOKA+9Fw1bZO0s8WFF1Z0f
         dY29EvtSqRK8kFtzniT7qd06HdcC6e8inkgbifXk+6peiWhtmmzsSljmXWu7majiS67K
         hjcGvr2KK1KR+JErVaE157INv6or1p5HsFjo4Z+JInJKgwkYwkIqO6oYCsh45KhDhH7d
         JU61tONjYyrDKiwyKchP5J47jJrUvuLqNmFZAKeYFdAHZgYXC/qTZw+gtoXrucfV0njP
         5u/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        fh=cdSpUb501GkmG3MJ21mUf6OqLLum9naodw+5L2kLlUA=;
        b=SSgmlMb/arjsTmigplwIfJOy5cBq56lOfV/9r8spF4vxSIPoguyBD7/ZlZsDb3I+yD
         pmrDs7Mi7BWd8rj6PmbR83OdEG54a+WNu1/5JR/4S0jHK7P/uv4dAIWwp0d4IPCMOzXu
         mTzmyJGAl435rvTCClX+cr7iYCQWKMp0cqrZm/3ZnKtXGEJYrNLVN/CSENU1N25hG7C6
         daszLJOWldPyrf0APvDi1xfCXeeH8LZIQnwkPUZ7N9/Q1UMDhxAcr/EfG32W2Go26/z/
         SVG4i7QF+y5qjnrIdi6i/Ak9LcRBqYhqTj55UTS7b7Fj+AI48T1EnUZfr4yE01Qdlp8d
         qN/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523380; x=1793128180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=IygMgcs6Wkd11h28ba3ojzsoJTpJa94odgDpgzrul6leMm134UWAt/R1EWFLQ7KrD7
         cBSCFOQ7MVWcZDDh+NFWLTMz20zU5V4OtYha/Dt/ndOifBmQqWKbEPWCSAUmQUCztPrU
         lV/rb5aZyojz0KbkWV7UxioMmIVCAOfmPB183Z6/VcaAHY/R7bG+jTfqiIfMVDC+L9J7
         Ru+qT/CBDKbmkkQdRKoQq1VXCffrvFzcO+E4IgTEus+geEGk8m379SuKk4YQ5MAzXfhX
         dJhCDvgLPUuAjgpRnNwG6zwIfkaC4zt+/JtE4MTaMLMyHELdf2YxSGLFrPDVCiXvHLUX
         iOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523380; x=1793128180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=gAQWTKmHdjP2jEWx3ofFGaEmmyVsftXtwiw9BU+loOi1pBIZ7W09Q6dsYZHd6ciTwZ
         RDyyYBx0Uxggg0r+fGKPh4ib7DLVB4SM+B2yM1t2rGVjyuxsC021kA9sdjM2uGWA+7cL
         kZjLEQKOrKMWmRQgLCUqMInnsxTXpCx+vVPBkE4CzucHCveQQJ4pHgkZcwPQDWm8L1Td
         tIYfWg6kyzU7H4ua8csISQ4GGlLNeSbFh5aQdtbNjGDhuILvNTTQa1Dr/2ggbaf+x0tE
         iGss3tFMx3gWoIaK+XHFfC4+RaBHhdCog1OmhVK//KzNc9wsWDoBgQ384CCjSbWG8H8v
         EWmg==
X-Forwarded-Encrypted: i=1; AKwUvBxd3UfAB6Bl5rSzIpHBx+rmWHekBFOd8NfHQfdK1UdbMJ7GFs/WZ5oljO3CL99yXBr0neFazhC9kd/h9paB1A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKVeVbkqaMNNNQqeR1jxsGicPOgtE+XO/dbYycQC4/xmZfqoFlx
	/v8uIjwZ7gwzGm3EqbWTwDFx4xvqCfI89xgx+bccIEuoHUwiogct3iKaezSn7RYYHLs+9jjNrAi
	buYUZOVcg7oMhU5rBBkefXr8uoDI4j0c=
X-Gm-Gg: AYBFou2nWM3klUKkoR3i6nUp5a/aaBGJ2thvI/F10CdO+zY2fac5qiAlCjNEMjsnA4a
	MLEEOgoMdQi4Uid+Tfo5pt7az9ksU11oYVpEQQQDGF+bTvgqnBC+02BAydgOTBko48FdruUu58I
	S81BtqiFjbSk1PBERWF+SS4iFG60KaQNtHXremv4UhPMnua5AWymrYNaGZb9dZBagl8H1KYOBiD
	0dzhzx8cASS++TrogpAkGbSQ8ZBfBEKjkm9MM2i7rz6TsKh6g2+hQIdzBZM5IC8342kYoZaEZKe
	NoWVaSI5xt5EZnAV3Hx1puQptvCyxMhEn0o0pICGLjAheX7gWLAE5+nErXeV+vd956e1Vo8yN9F
	m6mfkZPU28wY8NIddAJfufVw+iGbcqj7Rv4qzULnRnldaATjICrIK/WWtlCpNvj/Ccvfhr9Pjlg
	M5sql4XaySmUOoLbQtT9DwWBntPhY7t0SDT0qfndgixmQTwd84xOc=
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-18507ce1c04mr25464534c88.0.1792523379507; Tue, 20 Oct 2026
 12:09:39 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
 <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com> <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
In-Reply-To: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 21:09:24 +0200
X-Gm-Features: AclHuK__St0uTCw1avvWmNXKKyd1psXINLsd-c9PUmbMZ1zOmfz4IJPwzKvtrCE
Message-ID: <CANiq72mcCErQoK6wmtOcAZ+SOgRNZO2fPoZ1dac1Now6txy=MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 8:22=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> If you think there's a low risk of conflict, I'll take it.

Hard to predict everything... but conflicts are generally fine anyway.

Thanks!

Cheers,
Miguel
