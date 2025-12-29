Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16543081C2
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007650; cv=none; b=kzrjWrcVr3+M0ztcgKDLnNn7tlFud/G1ogC8Sl/olMtDHYYu+vM0qacOO4wKD+G/odR3Q9Wj5J04mjzyrsbvoRJ4uPMh9eYyW6uTY6xe99n8qTkkLjnFFdhpevIE0JfW7M5vR0c2fZJmtkuqYh3EAvJ/BP2TgETrMI/cG4uYCYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007650; c=relaxed/simple;
	bh=b3ec5QFuazVxh/+Jf8lMp/YgdypLWS2DkHOjER3/j9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGiy5tOQLCjO7zMQlVCdH6QZ1jMnZDjOiY6bTpPCjUZ4xzNgb1EteSf2s4I1e/Xou71jufvS9KXOpzRq5YkSeZGUTzuhSqBVuIb2vzrIfDv2ahBJUfwMAABU4IZyHv9gzEdbIR9h8cQB8o94mVIQl8Ul7pM6PGxNRsrDb5ZsatM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7fA+U8k; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7fA+U8k"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b2dec4d115so884214185a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 03:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767007648; x=1767612448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLOywaR2Lfk8P3TBwCG+W8wNtJ6I00fQI7lPPPlA3R4=;
        b=F7fA+U8kgW2PV+dRuUliNXY4OzmtmXECMeZnX0CRyjYqmBGsOz2Wn5XMhSM9zFSER4
         2zAa+k1Z+KCw21r/pRk6hiwUKpYFcHkpNRTu34MmPVbicjsCPxxqrad8gXSB0r+7R2Er
         w/LqBE0Z60jaSaoRClprpwcw7tPjfdye37mEk7b+cCjkG/ETFZyf4Bt4PSi9rvhqv0wS
         HauiWL3bJPQCfwic3sCirJwljhBRDfSQ6Kdd9iRPAE2QAV3+UPM7IDI5ZLcbxnuuyiTl
         XY1StP8tuwUQUzz92bZ0AqBzv9mkqmfixUtwbagI5tH9yqTaBCRDmHD4I8BRx0n5QFUm
         a2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767007648; x=1767612448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLOywaR2Lfk8P3TBwCG+W8wNtJ6I00fQI7lPPPlA3R4=;
        b=DulaMyF/k2GGi4l+2CviXkaEzZ0p9Z9lVmmAVzwkUospAeA55IxKcNIaCvGxqIeZ0s
         q2VXbdRTu8jCy9UFvh0x7/yXovz3+4B2kkVeuDV2c+sE2LwA3RAgj4bO5XwV6lz3103C
         Iy90dB2SJlT3/L0isd1I/Y6EZecLw7s+vhkqO6onosI9SNIiAshQLzIrXNLxKwxjBrkp
         Ci+855/EUDd6Oql163eeNnQcO7e5lPgoP5nPjdYMmoFTe2mmA6544cfaNmcZorP1b70u
         MZx/rQDTTT+Kr1snUJyt6L2KbfEdUcbHZhEruPsw+iY85q4z3SC2HQiesNN4KFcd/hwC
         FwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMIimXR7fM5NJPOyYuavEnix9r9X4AtDHfuM/3FngMll4iSbAe7YBLDQ84RMSLyN8gRmlaMfp495hhYhC7Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOy4t38IsDHoKOc2tsOUAwVA7deiQHp2PEvoSimqBq2ENSE3YC
	AjtxiyRz/nw+Z3i2mpjLiU3sDWOWgZM/oO3kC5iVHAN09IyDXOBQ9CGY
X-Gm-Gg: AY/fxX6Va/Hb8QVV9+ytD8P/FoXqPXsSzCnKr9onmjDthbAeZQnG6qljhnUuqG42qbL
	FG2eAnVug7hveijjrvM+p6Es+DH2/EyBJRCw1rwFR00JTkyWXXLs8+TLBv0iEwzphp5MwmjIYvM
	A1Anf5/nauBaJgsMVRRFehe9xofR2B3Z44MiG8zDfl7jSfIHQW/ZCa3TVcSP50C/swy2i3ISj4l
	406G0Q3bMH2WuGZm9yp34PSaqT0IzDf3hsDOpRqCxNjLcszvZNYcuU4hNxKtxkd271OF6KZjuzH
	26zCiDvWXc/PuQA2ShKLYPW3VSa83QQtEyTjwcA81MqSXSBqs0VScAGTfimoBDN811AGm2B55H1
	4bwBDEeYt0dGpZGro67IWI/0EMH1w1Wb+kp9ZxVEj4//c8y8HU3J/Hp8S3IaKRlv5udnLg3r3zZ
	evIahr4WhGT3kSGW4XpJwm5zABAslBN/tFFB5x4z1P3LjDfIoLZ0fghblGs8L8O8231l9wPbbdk
	sm+2PMoJvNiKnM=
X-Google-Smtp-Source: AGHT+IH2UfDFiYcV5c6t9PlxX23LdSw1rhi9hD5yIONPEYNTr7e3VQKbPmw93LbddxN1JX9Oj1TAFQ==
X-Received: by 2002:a05:620a:440a:b0:89f:1204:504a with SMTP id af79cd13be357-8c08fa9f18emr4473807685a.57.1767007647724;
        Mon, 29 Dec 2025 03:27:27 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8901d0dcd77sm32590396d6.42.2025.12.29.03.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:27:27 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id D3D19F40073;
	Mon, 29 Dec 2025 06:27:26 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 29 Dec 2025 06:27:26 -0500
X-ME-Sender: <xms:nmVSaU2Wdh823EfLiO3t4uQCc6oTWJH_3QT5SUz3j5a2zFhAI5gDTA>
    <xme:nmVSaVnM8Kr-1FdKGwEMxC-sgvW7l9SfN6xUOeetN6DD79gcurb72iXf2sBRQVSc0
    n9UbnqH5YvG2jHujFxKwLwof2DzN1V46vgGnWcfwlN3YvZbwW9TUg>
X-ME-Received: <xmr:nmVSaa4CFUmnKA8PFnrGxlZZW7UDnRkCKvaAYJUtNqXyaHGWgRQAbAM1LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejjedtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhr
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgt
    ohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrg
    hrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:nmVSaQnEbGjHKozaTEbjWe_Osaq9taR8bIAeKjANxbwyleSeZWyzCQ>
    <xmx:nmVSadVwqS4adp8KuXUpNbGBZkghTtDxF2bw3pWGAMcWx2tG1zMDIQ>
    <xmx:nmVSaRRcpnGv1_HDQj0WAGbIrLadMKfEraTwCo76TWlKipvtsPbhgA>
    <xmx:nmVSaSB6dtwB2Q83L-hYr5WWzGGPQPoH0n0116eZbiLTwUrJzy_CWA>
    <xmx:nmVSaRsHK9Yk7WW1mY38NYNcHIhl6VxxtBWt41DgwmkdS086fcruJiat>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 06:27:25 -0500 (EST)
Date: Mon, 29 Dec 2025 19:27:12 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 0/4] rust: Add i8/i16 atomic try_cmpxchg helpers
Message-ID: <aVJlkCqg8tgeUb6a@tardis-2.local>
References: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227115951.1424458-1-fujita.tomonori@gmail.com>

On Sat, Dec 27, 2025 at 08:59:47PM +0900, FUJITA Tomonori wrote:
> This series adds Rust helpers for atomic try_cmpxchg on i8/i16 with
> full, acquire, release, and relaxed orderings in preparation for
> supporting Rust-side cmpxchg on those types.
> 
> Rust atomic cmpxchg is implemented on top of the kernel C APIs,
> try_cmpxchg.
> 
> On architectures that support Rust today, the kernel already provides
> try_cmpxchg implementations that work for i8/i16, using
> architecture-specific instructions.
> 
> Tested on QEMU (86_64, arm64, riscv, loongarch, and armv7).
> 
> Follow-up patches will add Rust users of these helpers.
> 
> Boqun, feel free to drop the ordering-related notes from each patch.
> 

Queued, thanks!

Regards,
Boqun

> FUJITA Tomonori (4):
>   rust: helpers: Add i8/i16 atomic try_cmpxchg helpers
>   rust: helpers: Add i8/i16 atomic try_cmpxchg_acquire helpers
>   rust: helpers: Add i8/i16 atomic try_cmpxchg_release helpers
>   rust: helpers: Add i8/i16 atomic try_cmpxchg_relaxed helpers
> 
>  rust/helpers/atomic_ext.c | 40 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> 
> base-commit: 30f5de001fb2ffacdb61e82c8626cae2d68b4d03
> -- 
> 2.43.0
> 
