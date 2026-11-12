Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486118;
	b=aD1rsX6005yWTgr5iD/al0g/F4MEAFVS1OfCw/k/XIyQVVwx6Qv1uRi+QwhJzMiSPj8P
	 w05tYCfunHXfcAWtY/QPjCXN9B/thHdhn24Ad+U2l7PCx4MM+GCezmmr2aAOnt6K4J1HC
	 zQAE1l4D1+VD+QNcfdpZ5ju78Q8+tmvk+ZC5/AVaN4QwYAR+lEN7QMEzJoc9pBPXlH5oK
	 ZyrCEKmnUfJfPupefsRfcqj4lKk0EoGOgdjxZiJxArlNOZJjDvbDldDHjV0D4N2ZxGbmK
	 XUN6LZ+flcE1xv2d+WQsZh3mgbeAf1bXmV+GttirStDVAfArn/Nu8f/LfZO8HaHZVjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rsZeRRNh8oLy7q5YMbD2ezj6sE80Huqu5ljd47eq5As=;
	b=cfL2ZBvvz1gik9Cps0SXvPOhCOES8ZSlT6QFbQpCjKx9c2loJIY51K2+Q22mr9jOpHl2
	 fc4ERtqdUvgTI8U3M1WxQ7iGTZx8yef813fqQX8J3+lPF87QF2dj3ODPXfd+OHDUcvtTe
	 0Wr4w1SFPe3YmqlI7s2SnCaMoWiC+6RH+HfEnKjGCt6Ljk/MblEh8WQoKlYE90bJAL/xa
	 Xql1mZ8ro+GAiRDkYWAO5MLIDu9qc3XT98gnabaqyOAUDC/Dd8B7g97aBujgTp7pfoFZV
	 wz92ZG+kGQ3ueoYO+kyyjXL8/aT0S77OyIc7eZ5elKp71CXa1T0y11TY0g8VTaK3DGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ePiqYl04;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A80606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A80606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ePiqYl04
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54492d8a988so211041cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 04:21:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486117; cv=none;
        d=google.com; s=arc-20260327;
        b=LX1fOU7oseZnYJPpoMV6cHk/UGKxnQ74xYvYtJ6kgcDg2j60U6zh4J96DVZIQZyKpP
         2d9Q1oOqJ0vcPpQodqSYooCK85rWR/D8KeL0j/vBUPLsgxcQTgIbYNI8WKgb/LkDnjgb
         nP2luh6RcXqa1kvsy3Lh+hp9UnGYv249rTSOj3sCEf4ZATslMjDHCiNAEUCvWQSAEhZU
         bwjMAkgCaxIBLisRpgKSipSc45tGXZB2P7Z9z0SkCSHIpNFGIluGzGBysLo2b+Dse7vR
         jy6IHsIkBV4lgXH9pjIfKh+5/n9TYvD0sv3hepwvCrRxpK+C/mJFXJbYsDI0FImvx1is
         TVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rsZeRRNh8oLy7q5YMbD2ezj6sE80Huqu5ljd47eq5As=;
        fh=X0aCUUoBzR6ZCu/9m1sA4UF9kfpEZAuS6MsjYUEivpo=;
        b=HXhvm5C4zXjYZi2G9uYMR1/jetG3JNbLXBd48x5XmBmsqGBz7WyeM28WYnDJ6WXX/a
         ixmqEWirlZURNYMiCfek/PeCYkGBUEDYMydmBJgHA98NOE5ckYxgWAXpEnjLHuykyt0F
         iHTIQUzuLzuJWmXej4O598V+jVp21/Coe+m/Ox1Ti/a+I8NJ2Bb+/XuYu0gcTPHdArin
         OJH9z58h2PELHztpiVirsxxYyMp20d+wcDOtwdcMT09aLZfhUORp7D2FRHGPqMngQja7
         jBz07RQ0ajN7hUS9OXfSxhgIx7DXI5LbY3V4CL4XgS9uDFe22MfJyfu++bKfB937Jgjt
         6cQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794486117; x=1795090917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsZeRRNh8oLy7q5YMbD2ezj6sE80Huqu5ljd47eq5As=;
        b=ePiqYl04MUfZ99cbOruTfFOl4lmSKQcpYZLhfEPcb5o9pPqNswmpqNrNk8V47eKTDc
         uGsxEMNyUBH3lescsaOB0/V54P56sK4Z35CaYOId1tzE4xL6j/vSu7zl2y8S4J+p4ZJT
         J5LCVHHwPM3uuP1OxXfGSBv4t4m9zblRmmQjN3m6AyEMutOkg4Z9WYRohnrFAT42o7GZ
         APp/EHwQZUkYXVl1IGcVSwrrOg3dho4idkM7uGKvxK1yzXofP8YrUkH2BwAoOVh5MuO3
         YLkErRZVtNPftfLe9d+xdnOC+7/Nkvp2XY+olCXOLsXwhN0VFpOkZSID711tSc4Qq14B
         qEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486117; x=1795090917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rsZeRRNh8oLy7q5YMbD2ezj6sE80Huqu5ljd47eq5As=;
        b=vkfPok9eZjkXz5JOJ3AJIBQVvL6lrW4xfm8R7AHAEU4aw9M5uU/vUoBkNLEYVNbDod
         6zn4JUdW/MvS4qRA3Hxz5bifI+g3NaJKpnuetLW02qMmLChmJHr/xuhoYg3nttI127JY
         gTL9/gAfcod5UNouL90eK3A8hYHF6PLC/vPVT4WrDVzVmOJsOyhqNH7a5eWARtD6Bxv4
         TIlpD7jAiNHO80tOkPtbfmfXIx8DkLBHU7ICiBywWFQYYFieS6ACn/fAGglR0Xsc8jEm
         3ZJeDO+ldXUjQKuJXMC9iHJvsxaqtlpjloFob0ve+5Iectt2PVHDX2yeKr6uT/gOVhK1
         yiDg==
X-Forwarded-Encrypted: i=1; AL+hErEmFC1vaWB/mO2N2RkgftwzTLX6B7Lk597Pq1lvDPxJRnNFtqG85XH1SVcAYGmdufr4WKFvUXnKi6yiC0iEng==@vger.kernel.org
X-Gm-Message-State: APuU4Z80siKXIY6sAU0JSNMwsQpWzim4GgH6fLl0HWMk5fh+raqgubmR
	IB8JjUihwKGvUwooUHyVUIKSxvGiXNXpgiccXfac2lgsh+O4fAcz9HvwtFaJGMzAbkehWFBHZI0
	W7ST56weMrQ+waYA6QAqPuqOF88RmWO+DWuBeX25X
X-Gm-Gg: AYBFou0eY03cAr8NfhFpbZJAUhNrkzG4/Z/8RA8wMcgmwqpm6KVI+thiD1IrnImrfQU
	1rPeS9yNQB1NbgAQqC5+KwfzhOYwP6fCnaOYybzR6vMOfl99QqNi8q1k5YuN+s+ZXgNwaG14iiG
	fSuzrPNXQft7K7wN1+Bw07coxtddNRJbNF6o9fFxy3ALdvx9UIfTilyKhWOiUC9pnhtWW/kolJy
	q9e5Yvz6rkzk7LSBMCbeWuEVMOZyIEp3EiOO4EtwQKwmLTzCUEe9T/fu9fEfv8e9qYban0yBuS6
	4trkhkp7Os810Cx4IWm8tsO9Yl1ScsQNiMlVWcHz8IOiaNzrr5U9vlnUaQgGRFp4V7bwJleyUvC
	jsKizxhnuyNi5u6T/+oIyx9C8Mr+O0PmVfVn/OW7XUCNHz0+GBqdnYR+TEYskIDn3VoY=
X-Received: by 2002:a05:622a:c14:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-55990231239mr15577971cf.10.1794486116576; Thu, 12 Nov 2026
 04:21:56 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112121512.1670347-1-gprocida@google.com>
In-Reply-To: <20261112121512.1670347-1-gprocida@google.com>
From: Giuliano Procida <gprocida@google.com>
Date: Thu, 12 Nov 2026 12:21:17 +0000
X-Gm-Features: AclHuK-ZnF36Bp6-KcmNcD7p51zS42N80zoX_4OQmZM994MWkcuG-BVKoqDMU48
Message-ID: <CAGvU0Hm5OjUa5hoa2ibxmCznmLYO4HE+_=-u4BSu7U-VpPdyPw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] clean up EXPORT_SYMBOL_RUST_GPL
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"

Oops.

On Thu, 12 Nov 2026 at 12:15, Giuliano Procida <gprocida@google.com> wrote:
>
> This is a complete rework of the previous series to switch to assembly
> as suggested by Gary Guo <gary@garyguo.net> in a review comment.
>
> The first change in this series is a miniscule safety fix that will be
> obsoleted once the Nova driver Rust symbol handling is itself cleaned
> up.

Sorry, that's a lie. This is the prep work for the next two changes.

The tiny safety fix relating to `arm` is in the nova-core change itself.

> The second and third changes switch symbol export to assembly.
>
> The fourth change tweaks a related test file.
>
> Giuliano Procida (4):
>   kbuild: respect skip_gendwarfksyms in cmd_gensymtypes_S
>   rust: convert exports.c to assembly
>   gpu: nova-core: convert nova_core_exports.c to assembly
>   scripts/sbom: update rust export macro in nm parser test
>
>  drivers/gpu/Makefile                                 | 11 ++++++-----
>  .../{nova_core_exports.c => nova_core_exports.S}     |  8 +++-----
>  rust/Makefile                                        |  2 +-
>  rust/{exports.c => exports.S}                        | 12 +++++-------
>  scripts/Makefile.build                               |  4 ++--
>  scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py |  2 +-
>  6 files changed, 18 insertions(+), 21 deletions(-)
>  rename drivers/gpu/nova-core/{nova_core_exports.c => nova_core_exports.S} (62%)
>  rename rust/{exports.c => exports.S} (72%)
>
> --
> 2.56.0.567.gdb80ae8cd5-goog
>
