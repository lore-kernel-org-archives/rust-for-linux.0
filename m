Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794654990;
	b=gJsnOdrdOiVOpcIDpK6UBq/x64XfQw/SaCTfbBu5Om0hAO4h584wj4er/O2hJjnLLGKi
	 Tu4th5b5UGBk0d8Mbk0F6bbnN18jN2zH6ULuO6OqoNd839S69NYTGHgHmJ/G36bibOGQg
	 R8pC7mvjzEmn5kaPGZov7zOQomM6n3buQk8n7NoZ+T6zG0HmL0E6Aq7qhC6DNK+AfMDm+
	 A3ZkbpbbPBPAzV358LnY2IDVoXYtOWpSuqD7O+7L8El3UdjT3Bappvv2urnrl8OHXFfVy
	 k56iNy9Fqr4FNVl+Y+dZuzwqYJaDNnuDcm743IlFvM+xWyi5nfSYUQ3vDY1OuMWAkSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EoymXlENdnvPgZ2SqWoxmO4d9nV00fAbShAHyYnLQ9I=;
	b=G9HAnw2WD1chruWkaIaRgAubqZSe+eQn9TgKZVCmZZjaxhG8024v3f4OzkMglGo22zIe
	 wMx2RuarS0QBviQDt2UHKmbfDNNsRpd5p3suLxPRyE+JRsVi2UaCy6s14zzDBC7c4ZJ7l
	 iVhFquJ7JCfucE5RRBrlNkIrygy87RBO1iMseDe9BPTXRMbOjgNAw87Fiv/owJdgSSkAj
	 oa8Ev4JfoyIrPF26b53f9pGzQ7nbDo0GEoHDnRqCi1+Zb5GEvDpedXPLgJpHKLq7+ePHR
	 cbzwD7Gu6F0Db4vVbwznbOhpUOgG7W6eITU+x6mtKPYWpOdPBehAJoGkqHkHvScfMvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLJe2tZa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602CF606A89A
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 11:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602CF606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLJe2tZa
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35159e0092aso205805eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 03:16:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794654988; cv=none;
        d=google.com; s=arc-20260327;
        b=N6mqGK48VppmEo9uXMF1ce5w4KXlLMVnzVgzxRzTkkgI5VoZm39vll+j9MAQ0qZc9D
         s0xijbFbpxvdq+8wvhdmq7zHFV0A+Rd0JELOftlkzXySVHQOhYNYwZQTit2ezCNBTpIt
         /GYCLPveDMA/VWbFmpA93MdQINrMkB66yOlHILBPC+W8YBAFzLFXOF6cyIp/j3g1Q/VG
         L/v+oRHZXi6fOgisCgkU9CC5hrU0L4RdQTW3l+hSzAzf1JdwVXPZin/PgikDIMLzNNjh
         EitLFcELKCZJu7gFUs3tfvVaEj2vEKx4p5eFzGNDva0oZYq9ePUvbfWjCm/ewRbi1WZ3
         Pz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EoymXlENdnvPgZ2SqWoxmO4d9nV00fAbShAHyYnLQ9I=;
        fh=QJNRZjk9BPf5W4xAZjFnUNEhhnosBqJpAif7U7iDkXM=;
        b=o5JDtNE6C3gmgVIuZmECBE+XZTyVZ9x6zPuv/UX+rhVhNqklWX0UNJhk9wye5GEZ5x
         3Mzvqfy2LayRAG/PqxyVL5hegZ/bvOJrM04EZXqex2m9dyS78F2Z2DF/T0l7rQjQ11Fw
         pwVbuPY88HmMykRHihs209jIkw0qhaMC8PESCGErbkqod3m3/y+PWN5TY8mcp2QFyE0k
         LROSPZErSVSfFS6UrdjB9jTtSA8kdRwa1Pq7ky+ZQJ3v6Z4yKraDHjH+yLE2Dq5JcMDF
         61iRD/ouHz5Nzy07yRTcze1+2QVvrUGrVOYJn45sSh+oyGf7/WbDG0C9u3LXqP2CENma
         JT/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794654988; x=1795259788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EoymXlENdnvPgZ2SqWoxmO4d9nV00fAbShAHyYnLQ9I=;
        b=NLJe2tZas4dC5doQy4SdAqJOkCOyI+B/f0AeVx43H7VZXGCGgKCcmmy9w7YXye3fA5
         iW8ogwNITPUiLBTWZmrUzgmPfEJ+q7k2qYLRcZIkAD+AVlYUnzluVR+a8ca369CnnDKC
         HtxAkbUddwJj4aqJnpJDoYSAgRhreSiTcswsiVUxFlR9GJmBlVC94YruuNheOXn1OVZ7
         KM4qyKN85bBgNntR2xaT2QFOKQxybCuAdewLz/X2XhyJvF0JC2Vg4BaE8pNmLUa5+5GW
         6F2zcqpdmHcaUK8HFGWSD7HkZH6sHTd6NhRBnMz2FGOiyDDVsz9mFMYjQMUEneykIyLa
         tNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794654988; x=1795259788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoymXlENdnvPgZ2SqWoxmO4d9nV00fAbShAHyYnLQ9I=;
        b=LRCpBCgbibgNy6K/HMjDsfEWbtwmlVVY+VrHm143ikCxZo53N2vDIFpvxFj5q+zGV1
         pr6QigL8Wf28EZxnA1KDN5jLJJveYEV0tI9uytJ038cCUptT7mxMBvsJsIstUvPLxqx+
         j6c3m2C4RNXH/gNc50bRXxW9SU3MSwVDFL23LEcZllg3NcQR9KJtsYqAVffCFQnlYVIG
         HIsMGO62S0ye/vZLXlOuYWrHmaqZNk8dD0qqe2gD8ol/gmosVBfLlcphI7I27wRVlWRl
         quQZ1oW2lWeV6iJLGrNoSoS5jSy9mGSPeklXoca7MyQts2b3T15sY8uSxoSeyDRFaVMD
         P7vA==
X-Forwarded-Encrypted: i=1; AL+hErFp9ooI3JkaSD5LwJD9VEPRZUr5FaV2oW/vBPG346pzuaOYhisk2rXPpG3KJPQ89SPR4yTeJ96xtokC0R2/OQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8i5O18aJPpNqOGk7QHvDtoooY4FB1OdaAIhMXBfV95x0FuNiyi
	hXgkTImI/CCih6ky14cq5MUfGKDvzH/zDd5nUROXt1zWEvDkIi5jSEG/VNoopB8ay7cVlwT5q3u
	vlLOnrtA3Vhe8hprjK8ErgMzVryWK1tY=
X-Gm-Gg: AYBFou0+o6fm329qabCbemU/KjWYV4YT8//sBpZJ9ZaCaA+/gHOyL0ZpBX9GVmqGr8I
	A36Pxy8cHpkK33+c+4nwF42Mytkyzq6jTeLZDdpwrYKk8OfWMl1fNXk+wJ0MvIOM/XW7PADTKHz
	uvRl3Dy5gVaT/dObcIhDSQNWTjqHIL1l/JZ8ZJd6eHQQeSAH5BX8dgyskIm0aii0pgNmdOUELzG
	oeGm4fPJAPr1gB7RlnlsJP6M6X3jhcONU4mNRHqf9pq0fN1137vsLvYY9InHz1I1A/lDWw3WkeY
	TuEJr31Th1xX3jYTIgZEB3NjU7aEbG3Znu53sDRftlFCeUV5CM+JmE6JKy2mvAuQhTQADB/VJYb
	z55YGLu1nuVaqcdg4ZakMUPSyiRaUZuT5tFBrnpSGX2llYkRdPgIHX4cEACIGZqIsFgMHxs7Gco
	Gm6xy7TtXXOzgseofYuE3G4bPySaQlU/ZhQ4ijawGDA5/FAWVYlz3azD7CNs1Ap9pNu2Kpx6o30
	0/3cJlcidlV1538GujZek1BxTveYYehDemAprf6FdMTLPZahu5B1xvdAwohqWup7JgSq7KZB3VK
	AjfOBvhhRJ8jDs5BUg==
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id
 5a478bee46e88-37964e03109mr9445400eec.1.1794654988480; Sat, 14 Nov 2026
 03:16:28 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114024515.1000882-1-marawanzein222@gmail.com>
In-Reply-To: <20261114024515.1000882-1-marawanzein222@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Nov 2026 12:16:15 +0100
X-Gm-Features: AclHuK96lOhqn1CghAV94ECJPrEaox5jn8-bjo_998dUQqF5BAg3A6nFGX7-HtQ
Message-ID: <CANiq72ntx7OypsqD3QmeMiYOJpqRBgzDJv17grZQA-M5J_r8mA@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: fix lifetime of copy_from_iter_raw
To: Marwan Mohamed Zein <marawanzein222@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamir@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, spidermana <xuyiwen14@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 3:45=E2=80=AFAM Marwan Mohamed Zein
<marawanzein222@gmail.com> wrote:
>
> Reported-by: spidermana <xuyiwen14@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1265
> Signed-off-by: martell0x1 <marawanzein222@gmail.com>

Thanks for the patch!

On top of what Alexandre said, for fixes, please try to find which
commit introduced the issue and then add a Fixes tag to it. Then,
please consider if it is something that may need to be backported:

  https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges
  https://docs.kernel.org/process/stable-kernel-rules.html

So we would have written:

Cc: stable@vger.kernel.org
Fixes: 06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURCE"=
)

Cheers,
Miguel
