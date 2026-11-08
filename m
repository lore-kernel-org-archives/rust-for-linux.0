Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794165255;
	b=u2TuupSILVOQylceui4YVgoXGDPs129QwKpWu9Sj9V9zIPf5/anuYcpfyE0SbBNDW9+P
	 dRq8EIQWMSULBh1JYqijFhc17Iwip78J3d5zE6H0x80HLU0MJ22xhknIJ+jeg7ooC8QTn
	 v9QH4AsoeeCtjvGJ0rHyqHdR5KWkzM0BkIyRYJHMrDcVKYaMqX3JBawkdi0BgHf5f1Hx+
	 xgPbi6iDXHeQIKFuXf+JPu1fA6zo5pAgnIr7u68edNmlycZcj/z9fKxxVmYaKRCptofYg
	 yHfbZRkmLK6u4MM2cDAJLXhQUbZ+cJGpaifL6u+9KJck74Y/YiKmLWcZLPQ5HE48ZWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
	b=L7J2y4yhYCl/WUp3W3iZ0j+i4Lsn5ln5ir3wm8o+FRmtFxUV/KCa0u3gN7ISFXdFXUh9
	 6zR+k3qXOuiQ+WdJSpkuctTusRIpmQPSDsuQRxwwMNeX37Pf+B3bsGw0IjW28nHIn1H+T
	 JfOU+acBgOAEej7FZOLTD3f8KpYnJEkdgVJfF4X15qO5z1LmP10ifMYFy+EueH2875Ag5
	 yjYCDS1krcHUMxjvfRDW8LBA7nnFEJEp/nN3sk/6KKKxFjpTMXmd3guTdlAB+37DZyRP7
	 d20BwULChDpXLIzcLwxRu9SZXG44AtTYRdKYVCpAwAJoUahDuSA49EyQx7pzNoLqBhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rllbRpEg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E4606A31C
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Nov 2026 19:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 325E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rllbRpEg
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so574049eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Nov 2026 11:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794165254; cv=none;
        d=google.com; s=arc-20260327;
        b=lRUvQgem8WVHkpXTgxfjTOIsmm8vgDKtRJYdLkAJhi4jtV88iGxqJ+grzhnBaFZneP
         nsbGmgY0+nSQvuAzqvlwi5Hybldqo+4eyUDdVytqmLAmDfvWU3ot3x4BvuCvNm/Pj7GF
         i3U7NKsJzPmjcAkKxTDDyTlMir6lzjIxXR3Se5w2ZirUbjnbsdch62Dj43RQJYhatfWP
         fc4LYY5IWa4EoqEuMlDaLdbRfZ8Krp/P0lC8aU5R5JRgYpbQ+SUoqzjPAYAs+TeDvxd4
         xYjZb/PV/e+NMXmoWtfhIHi03vcu1HuDD9SyKT0H3sOF033F5ycnv3AJJsQBOyW2UvYj
         CVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        fh=Bw8b5hKjAmS9efyT7BXzU6YCzV0mT0JA49DnWB7aNGg=;
        b=WVirweH5kySh66uuD1xP8JjPThXeRCElzUwfVPWk39tm3PyZf7kWqR/M7ssfscVliV
         reGVOiipRxpa14HK8xB1P4uVBxkZk6Rmh1B2nBjaSPGmkEYZv3C0dPShrd4Hy2uQ1vy5
         iyMtSNjF1MaRefcRScfc7u1ZTFsu+PThQJcZ4ovhcCs+hpTy4xFFtLj+dVw5I9tLMeSt
         Ie/4I0QY4+vHPCixC575UH+xuMW7YTVBphORlNapWPCGgs9uC31MWL3zGazq3IZ736O9
         ywH55h74GUG/UTVA63F+xcfj+cNKdUj+Rb44lDEIBBtnjCdFs/GxsgjWgfQ2LNCuuWwM
         QPCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165254; x=1794770054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        b=rllbRpEgiw5AIuoQnqAOapTJtURQPajg1YXAwpRhZlWjt7K+ZzeDGOMzFSAzbSqle8
         RZSht2rfco69yYb8DEwj2en5KGT41k/56aT8gFqQnYZbnRoU0I4+FoIQPMMpYyMQr1tR
         uhD/S0OsBEBHi1wcCfsbCoe2fmWPlMGpvlttpmmuONqFrunvkEbxIVNU548gxCpkJp/H
         Cp3e/CrOl9QoehwxzPoS8HzOv1MqoWlgKxSSr1+7axyaM2JhbW82FxzdcAhYpfeuaWsq
         Fr2lWuGq1Mqt6zthCm79fbucEi+tySKeWtrJ+OpVVr7ZEFfBUNeHjQm/YgJYmfsTksLV
         2cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165254; x=1794770054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        b=18eiM3fkbNIB9yEYzAA+QhSJ08hLZ9aMeCCqaZTOKPjSWalCLrLHGTe/tQdU9/Kkk7
         9MiVrIFYmaWA/W4jKJYx2xPiNbr2zj0qbiDeq0OWtdFnahSHg8HivPZhJmxAFI+MtUm3
         WLUQpQhxeQHpaoOpXf6NLQ48mtjGJpzxPgtzBn6qFJID8kmHJrQBguCZLV+JIXMfY/As
         poKYWB6ZZVu3EYIxdHOCYmCnh1IjyX1jcTs+PDBU5td87FFwCl9vn3ZmDWYm8LlN27XS
         rXrg/f6kqHlA6ox8a8/+feR1G7J5pZNg9DwlWHg1wtTbS5kUfFltU/n+TpnH1pX93ek3
         cShA==
X-Forwarded-Encrypted: i=1; AL+hErHo1yckLIfbwQXSxcBwnHFI5Bf2Q2Q/UivO51r+UImNjdiqUw+jKJiHH+ZLxq533UUpUitEhRs6K38U7HC+YQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DRyA3XlQ3355DrnrNlC8lAzyDoVqqibbREuXynMP1wcs16nwQ
	xCKgZcif6MHlgMpm6xGuRPuJB1q4CoF5EENf8DwYbuBGhy3p2sIOnt14TSWnkeK+31hhnRy0Cct
	pQZ69fGq8PhtRb2YFk41kDlAEBH1eN6c=
X-Gm-Gg: AYBFou3jb4AoWME6v2DCnAuZWMzZ6fUFtXjxn/PxNYZH6ZHwxXDuiWCvdTwh20FM+gK
	T39f9o2LByQesSWunJy5q0sSamBQUPhNpIGNdawxd5fHQYMN55HKJt2/aUaJOf9CNksyarJmusI
	H2HO9kHMcr+YDtxRrd/m2xBG9A0cbnmOVHwIhyU52kZBRfrxgLAr7fv6HEHgeHZU6lb9RMYV3EJ
	BI8TvIGRJnLeodwZnALR5X2YliQAcmj7K4aEHkTnlivxhSCqF/7/jEX49Hb6lkxCYLAujOEezVN
	rMoXUwzVFQ5fmlvHVl7RY3zrhXJukUbJN4Az2we3A2FlYqzfOF/KfnnhFg/AZLaGdeyhU3oMmaX
	AsTKTZHZVye7sf5l4V/3U1QM5uUA/fnFK+68tJuoeKwUHADwW8SKaM/aRl/JAwY5hQAy+v8aCvY
	BlzoGsgNp4bBS8AbuM+fLFKFKFW0ljz9ZP+i0AojxCpzAQ/1/pWCmb/b9TU09+/iWH157a3t2Sr
	OUKL60=
X-Received: by 2002:a05:7301:7004:b0:372:eab:d700 with SMTP id
 5a478bee46e88-37252e3a967mr4833895eec.1.1794165254303; Sun, 08 Nov 2026
 11:14:14 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com> <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Sun, 8 Nov 2026 20:14:02 +0100
X-Gm-Features: AclHuK8Zqm3SYvO-6lPeY5_gCtAhcGYV6kboEDJv7680m_CzRJR-fiUMmy4_9do
Message-ID: <CABwQupNhiTRmbA+1Ps96tAe_vrUehAR=ZqmPustz8M4k47X6vA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Rae Moar <raemoar63@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>
> Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
> test so it can be run when CONFIG_RUST_BITMAP_HARDENED=3Dy.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
Reviewed-by: Burak Emir <burak.emir@gmail.com>

Thank you for implementing this TODO, Nicolas!
Testing panic behavior is useful, not just for ensuring that it meets
the specification but also ensuring that changes preserve the
behavior.

cheers,
Burak
