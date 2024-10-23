Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7386613B7AF
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729699243; cv=none; b=HOskbZvqAbVtM3j+BRjQzXHCadD6iuOBeVBjRhVHxfQX+OnIw80oj4wX1YIWmKvIrQM6SGzkKW8W0ZggIVD76V+264w9QWcj+nbU1TgpeKkpd08hMnFOmuuMOlr57bMovM7ZlK2BllQNczjj/JS9Ir9BSGxEU0CfNAvdL4SA5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729699243; c=relaxed/simple;
	bh=qtL+K8nMPb/GmW9LWWzNKP+4xCtLcYRaYOGM+HdS0tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNKy/rfYg3MFtrtD9f8PaRve9SwH2cddGQBxKoXpO0jD3DYRc++CYmwwxF356Eqxt9uLSU0L4ZsI4jt3Vr8BJVSEuA7BM2kxCbYNGyle+RhNzTKO5DhXjy5/6Tbs8q5mS8vYUmv7tqs3DOUQoita3eeCeoCGIdHIPvFt0V+9tPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2eUFcgH; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2eUFcgH"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b1418058bbso512274785a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729699241; x=1730304041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/BL4q4GodncwL53tdL1x5irR4Z1xxFebFUi/3e8kdk=;
        b=j2eUFcgHoXwA2wRgNvGF3SDb8e8/w9L0eS8Zm9T2s30b57/nyYPwVY5kmV5SlCtNGf
         KHuwI3qxLyovtDLjphyKwGlwKLNRnq3CGTLb5kYTEq3HXljVmo3EybxC5lJrRIFMVL0t
         n4zHuzH7+RI3XZ7Wt83ikcEvsNYBK9HVNjg/zq/gO5/0iHTFYUMEjA5dfTA9Y5hdYTZ5
         Gx7/O+q2PM/ZuPfw9SiFyZZDrNET4/Zz8YQ6FNQRqNEP76zwLMbGtdoWO5d7bfEj0roZ
         cfvN959K5/mF9TBcAhqAkSiG7GjeOrf5jBva1hqEaLvntpQh6u8TLKy+Pr/jIc0irgow
         tJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729699241; x=1730304041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/BL4q4GodncwL53tdL1x5irR4Z1xxFebFUi/3e8kdk=;
        b=oaC6SHH6+9TxwfR1WcAQ+QIV4zKBmnzTS7NxUVno9xnAMlE6oWjDD3J1+K3zj7VD+y
         uS1pFIyDtr4zv2a/CF3J9qQT9kv34ikq2yFD+Z4bVP1w/p5jZSvlLKRmaQ8h4fzDbCVx
         XSmgGdsIBmDX5918SC4KtVQ2dYIRawOTWzNQ0PiBdm24uyhi8ONin/vM0+He/F2DwCKQ
         J4Q+t0z/WqsE/DiV0wt1COf8ZsE4DEBsus9IOqku3SQ15B1DKPV7EVH9S/0raK3yUy/K
         ClZ5qxShTeK0muuT2kNXVDtTx+KwGh3mS3ZmwqONPksutxmwbq7IqCCCcrektgsx0AvK
         +w+Q==
X-Gm-Message-State: AOJu0YxckQS8ekJcKKb/ZVciu17iHTfjhVX+bpJh9653H2oi3/qR9LUf
	FfiY45P3gPAwTnPN+02G1CWXuFgba6zgsySNSxBfERa5O0/Nl0a2
X-Google-Smtp-Source: AGHT+IGKzMowfU6/R3P4lpxq0xqfPqPCoiaeeQuOmNJ0djlK9xb8p/33iV4OwGcEQY6Dy5mo44DlNA==
X-Received: by 2002:a05:622a:13d4:b0:460:96b6:3b56 with SMTP id d75a77b69052e-46114725991mr44114511cf.55.1729699240730;
        Wed, 23 Oct 2024 09:00:40 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3cba55asm42287101cf.49.2024.10.23.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:00:40 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 92D441200043;
	Wed, 23 Oct 2024 12:00:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 23 Oct 2024 12:00:39 -0400
X-ME-Sender: <xms:px0ZZxWQ2KQ9qG91T1KAIJTdivIJDElby5H0NK4G3SgnvdwZcUuRTQ>
    <xme:px0ZZxlT-hJseVokac6gyZA-XmRgC2ZKKeP3mP-6H3LQAARtoJqzZ8jhjmv34sMZW
    AK8Va4RKkKQRT5RyA>
X-ME-Received: <xmr:px0ZZ9YvqjvLpLZHR8_DtFlv2-niAUWbmJQAZ05YIQtNktcS_-uR-1XId4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeijedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopeihuhhtrghrohdrohhnohdrgedukeesghhmrg
    hilhdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrd
    hmvgdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:px0ZZ0UOnED0bkBjf86m5CEyQeCCwSw5aC0DYZHd_nnS51a6tBqNvQ>
    <xmx:px0ZZ7nVI_HKPoR7weBbs1La1GRez9K3Mnlf4HHs0aLhduYkiklJ3g>
    <xmx:px0ZZxfSuNOQBoh1Q4Dmgz4YEn3mrPO5k9JcqoegZaIR_dM082hOIg>
    <xmx:px0ZZ1GvQ0QZbCTmcoiOqrjKzbLZ0IY5PBkQeaNgerMBiVUHMmIzlg>
    <xmx:px0ZZ1k4scViTzZc3wlOwHRPcMnyMlVXrBHiOH_kopMP_4HbbXMLYvjv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 12:00:38 -0400 (EDT)
Date: Wed, 23 Oct 2024 09:00:37 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] rust: block: fix formatting in GenDisk doc
Message-ID: <Zxkdpf1tT0e79maJ@Boquns-Mac-mini.local>
References: <ZxkcU5yTFCagg_lX@ohnotp>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxkcU5yTFCagg_lX@ohnotp>

On Thu, Oct 24, 2024 at 12:54:59AM +0900, Yutaro Ohno wrote:
> Align bullet points and improve indentation in the `Invariants` section
> of the `GenDisk` struct documentation for better readability.
> 
> Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>

This looks good to me, but not sure we need a "Fixes:" tag, Miguel?

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  rust/kernel/block/mq/gen_disk.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
> index 708125dce96a..c6df153ebb88 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -174,9 +174,9 @@ pub fn build<T: Operations>(
>  ///
>  /// # Invariants
>  ///
> -///  - `gendisk` must always point to an initialized and valid `struct gendisk`.
> -///  - `gendisk` was added to the VFS through a call to
> -///     `bindings::device_add_disk`.
> +/// - `gendisk` must always point to an initialized and valid `struct gendisk`.
> +/// - `gendisk` was added to the VFS through a call to
> +///   `bindings::device_add_disk`.
>  pub struct GenDisk<T: Operations> {
>      _tagset: Arc<TagSet<T>>,
>      gendisk: *mut bindings::gendisk,
> -- 
> 2.47.0
> 
