Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7B3B71B6
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786449858; cv=pass; b=MzuzRsUHL3OUqFxqQE1b5wf+SJy4WAQDqd9R9VkOoL59lU/DYPZkxVrcSF6B7F45xVi74DHuDrufoj/BHEDr+e2yVS1uGEbm2qFICLOcGIaR7jVEk6rZhSGS2S6C8krHBF6SYDS0f5GGjBykYRch7yl7QIS/zE//mnKe9ZXeSQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786449858; c=relaxed/simple;
	bh=n5XJVxyjKKrvU5Tf2BH3DhTGCWaD7m72/K/SFjbzLoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPFAg4b3gwkM5wU7F3PbdWhHDTkHQjWT9fSQqlIkxoTNs0nud+w/TgO5vJ1iDZx+y0r3LE1DidKq3k2dU3uIyfiYZ6pnd04WIIQriRxI0FRkz2GKTwylFzzGtSfqcKpo+V5ilOmVjzKc9AcFbtvN+yE7lpq2HSHmjR+Wf+9Rp6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxozYGlr; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxozYGlr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceeee8c46bso7521595ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 05:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786449857; cv=none;
        d=google.com; s=arc-20260327;
        b=Slxj+AAswJKn76BTi2XABElqZXanyxFwE6X9QfxZbK9DWXUiop0lmgi7Uuy1Wlu7Bv
         51x6qrDu8NcRgg0ETHD8pvrgyNhg9+ImFmwC9QQ0ZA2ZwE/biQXZ/vl5Baj2o/UNIPkn
         NCck9WqE83B+7ubnlnwzlmwDSoPxUMDvuHPQoauOelVPtKSYpQdQUXUq20/ETZ5gG9Ho
         cIs3mENughNAt/aH585arJalvqY9X0xPM0FxtHsSbdPLAYkAke/A+LX2YSGir7Ocu/9V
         yxqsM18buz9w8utLVgDtcK4JZmaMzg7zh5122N/bSNJS4RZV1lc4svKTBvbAqh/xZVsu
         EVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wUDPKIt4JBK1aml5H9p9mMv/VAzBV2eGmvqYyRcgH2M=;
        fh=kLY9+poXzbYYlPwA8bkFNxz8CQFcaEXYtMmln24QY2c=;
        b=P51v6AF/a9/f1WmhRNa6hnJumWNCuBaPqe+hUzEfa7bpGUWqvoU6rphFGZ4JCYztvZ
         fyKJz32Qaa/BuuNTGdI7eadfHabU9SFEGeRMW2tGTRdPR+ajGZQBEj/jJ2ZJzgfhUOSP
         Pw7Qff5FqsahHQoZDEX3Vf/HgWBnl03YBcKuMfwhj7qJQQbqJhmzWf0OXUMguVPvvkbM
         AhMcwodKkOQmmTLp5ov6vw6eF2jU47SfWjp5edl18obDGSrpIT6emgQ+A9BZ4l8KntXc
         u3DLQJAhaKv92HZ7SY5cKebLGy6JdZjAQ2IQvtaCiSJKWyKHJx5121f2m0zgD+18XEZW
         Pwyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786449857; x=1787054657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wUDPKIt4JBK1aml5H9p9mMv/VAzBV2eGmvqYyRcgH2M=;
        b=cxozYGlrlGsWOlB+YPoNpI6et8KnODitU3xhoSllVmTaoRIdF1Gtfg/qlTM2rzZHl+
         ynKQtfUwzRtFvFG7HlrSRsRETzCkdkuyKFF3EhCx1mbnYCUDnhXwyrdnVVYx/xaRyjMb
         RnWD4ubdndgVjnzjOttthDARj9phkw3XrduiK/PAu9BSOpAbRuy2T7Elec/m8L4N6a23
         SrDfQoJ2edMXVnD4G5zAaZ9NLIpJuG1DLH5KSGS0LG0Fe5pu3Zmz5vUG4pG8lkk7YegX
         mwyMh2hI9JB4Q5GEeP1srSDT1Rq2xBgqBiUzk9l5xU69KiD6D+IosZv4hexfebVxSqm2
         oEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786449857; x=1787054657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUDPKIt4JBK1aml5H9p9mMv/VAzBV2eGmvqYyRcgH2M=;
        b=XENi09Ict9EMtgpBgIXv6y4kL4BOt7SVRBEQ3xDsG5lNhyQefS9CP+ceSBjLSCt78b
         cwG+t5d8/qm8qsIqsowezym8NGJnFIK7aD+xvmEQUoaNtofTjL9s1vDB6VnuqopkA35e
         hcT1lBMCw0MhhclEK1TZpxtlmyWM3HGydzydTmjgdEJhz7nhw3+2jZFG2Nf+y89+uTJP
         IUMV0m/kobdvy21q/A3q8S8ugBbe6nBVrh4o8FtgbGUckxLYsFDn+8UM7w+kt84ZO6Em
         EVQqzTlxq5rjIhYaG7kiXwqyUDOgO36JtEXwmKKI9pdbxhy4t8392H8pfHzk7ArcJFgV
         feBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq66Az85u0Ld38vMZJEH/k1d3G2ePXGWPmjtwXPFIJ/eQrNpvRhCFc7rsGXevFnxzHE+5rwsElEQupPa572eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAg0EstbMI9p+p2z/ev3UHwUM8FUngE/edinivPRYic0QEir+i
	+FZHpyz1uBNeSmxhp4PX4EegcjW1ybu195zNMUzhUfcCzeOcvSxIwQ/uc0x0Uv3oeJo0tNv5e4M
	+5bAa1K4ERN+yLrPC2+d4zZQPP53p+MbBPqC3
X-Gm-Gg: AR+sD11Lg0rErHLzs5g4OcVEKfZiNnJG+58CJWBNjfJoAoW9ag4MVq+mxRrsnpxKHrS
	eqEfzcytwBf9MV5zVutPtz4x+SUF9I18lanMfaiLmKemHPRhIcaNxksj9Ypj2pWua3mPzsgnfFo
	1rGGz27R+EhMM2z2sNYKyl/KA/hVufq2iItdnDYMeIIL9UX1CjOyx96RkQHbHag9mvL47pnm54G
	36T4+W/q3dbYAKtGAiR3qA/jdS4fIBMp92CPce9VPzhVs04BifZSClok4eJOjV0o0ZiNGpVon1t
	6Or4emsEdBYstf2fcVS3aKiqCgxmTTys0ijp7sfrDCnCul9GoI6MtkMV3m8Vs+wRkuwDSnOGpVi
	dsoKiZ0/RFx2bAVtUyFgB5ASNjVinIQRqIEjVxhUNyVXdDFIDwUGTEMIP7/tb
X-Received: by 2002:a17:902:f791:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d31776844emr24387845ad.1.1786449856837; Tue, 11 Aug 2026
 05:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
In-Reply-To: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:04:03 +0200
X-Gm-Features: AUfX_mzOxCPBjocWw0ax4auF6rYqKD0_LaTTX8RHaI1gQQL1Hg_Az3mrgi7m2gE
Message-ID: <CANiq72=sfSc3_cS6Z+JvjyYLmXjc8pr5CcEzOe0Awa3u0JvEfQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove
 redundant imports
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 8:57=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
>       rust: doctest: use vertical import style

Applied (this one only) to `rust-next` -- thanks everyone!

Cheers,
Miguel
