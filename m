Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E800C4D7D32
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775071; cv=pass; b=PlJaDLAkoWOAo/rqSfuL6YwyOYNx2xcTR9l1LleYfe2a0iMp6u5jNkmk4rT92NuDPubtSXayHG2IbGLLz61yGUppQQPjWxzXUo+/dzii9jZdd88IiEpXE2JQXHbliIups7k3NlwoBLyzA8AGsT2Xqhf6G4vC1P1WHT6cFGDv1Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775071; c=relaxed/simple;
	bh=nt3S2LhYlCFMC7FO6bjhb5V3DB3fOhRHMafhyzm/7Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzzSkW/wPaf/lWyZRKZseS23X5zY49KUO6xpeaqX7pCNu6odG7nfG56ZxI3G3h4ttDyN76sTc/mav5T5U7d07L44yx3/3wK/djBNLoCZ51+h0MN4sCzunPcwWLoUmYF0CcntKdRGWFOvEEA5xD66vKL8Hb1IrjhlDi7yY7N4dDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WelMeTuc; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WelMeTuc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so3391332f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 06:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790775059; cv=none;
        d=google.com; s=arc-20260327;
        b=GkWHhU9RaFaRlVTtxfqnfe8PKeNDwMO8w/y/ORhfuBg0urFdQQVkJxYZN5Da5P/lmT
         cBFHuZPidDjzxzA/O79DIa7JibuOXlMr1leKYONPG6aPwJy7N6dTphFFuZnKYJFd9bSY
         C44hoy0ljJrJ3x3bCpFkp8sfPBgSlC1D02q9x46yEKWVTpCwfLRy8KB+JRJIWoZwJ4NG
         geBSwZq6uy3e/kqXJGATDp1mEdy8XUTXQjDbTRK1YEEmOgcLTB10Grdwr9jkPg8UVeOt
         Ovj4WNjGHExQhhFeDaRN4CEsiK8PpZhjhorCOEg8JPnMIuWIiilGMe9WT3BvH69qB1ry
         k+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ruJ2755xF9slnBF+H5hrh9UtiC9Erto4r25eLucJDT8=;
        fh=dc82lSVYafr08DGO580erp4uOIHtNLWnH4v4KnJRW68=;
        b=R6TbJR5/Kdwfp6Mwd6ZaQq+Dhboui+m7TnfX+I1EkCgj5HfHoeZldYsuuHy4U2m0DX
         qzR6zF/XSbOL5oSCz4sm05PdcixLDk352weYbx4njbQF5GYKAyHLv0DQtQrdbj/eNFOx
         0mhK9RHZZn+0NJHV8+9cDrVNqrkN2L2lol2b0/ErQfNUKzLfN19e76dgeEYcBZqOmRe6
         Ig4qt9IdrDYPY6EvnEXx5cWQntBRv7DLoCtGwNN0EbsSrT5L5Sydgx1XO810EMTmLdt8
         kHtyg67rmZoUQJAGGmt3J+DQaU1P/FrwiQ1/WWZYTD/D3J5SgMDEveM05nrQKtNAId8d
         AVew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790775059; x=1791379859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruJ2755xF9slnBF+H5hrh9UtiC9Erto4r25eLucJDT8=;
        b=WelMeTucpRQMLw9A3UnvMC9AkZKGZsvDZox5zP56ueLYAJcQytNt/hqcom55Ucp+bM
         7zEGioMoSXolKtNsd48g6rJkxHU/+sMW5X10HC0ybh2QTlgLf9rKEcZjqD9OdpWNAGFO
         zE4KA3q8UNeoCw8+f1I0cH/JvgCIC03kerpjhbHwJw7IkDdYP5bEhNd/MJzFe1R/qmPI
         MdPwL6XrSTjnMdpXUzkqGaIHPprHlzm5vdRFvtK8IU8lyf1xaakAPPlMoXLF8XOWKlcw
         pXyWLjA9e9tSMgc4U7YEBD/f7yx/dwUVt3wIB51MlqQ+dFyy/LVH3Mwxwi7nJiMixsx7
         vzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775059; x=1791379859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruJ2755xF9slnBF+H5hrh9UtiC9Erto4r25eLucJDT8=;
        b=MYXFoyyRNlrcBKmwEEuh8IeGctlFTXdadxAITYbAF0Tf0uigV/+lC9vlS2Yzt/vm6t
         PVr0YUBPCca5FSsu4LteErXpOF+3fcy8P1ymzBsjcEzF8KnfaQJjLqURlWf7MffTbA2O
         4p0QQPrJx6v9ifm0bCOrYgafRDzuCTTO6ASqwsqOVhy+hPyfYafC+iWSaJQvat13oO/i
         UKKJDUC+hkTixN04mzsBYP08T+FG8m7wfsqzYjZPTv29H61bWBI8Xs9rOaMOkji8KXdX
         kcvQF9sy5avPVnppa8smoYOqbj13KC5r6aMz0DNvofxNmaOERVDXSImvwpG81YxrkDRu
         /Pfg==
X-Forwarded-Encrypted: i=1; AKwUvBxtM1WP7gCnpc40RrcDrWrQ0zwY+VTtZ5LYQNxMqFqUQQ4Rc1wRfATOlgvnJsAlAD94EhtYHdvQui/Ac/qeOg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKzPOkM8cBIdDHQaQNlN0FDOx/HIlP/Ly88n5Phrw3FHw5Znw5O
	ZwZ8G148dyZib8ZHowo5/zy+n6LsPMsjmVKYoICIqKYE5zN0T/l8e6/sIZ2reH719677GDdpW5l
	Nca268voCrxbFS9lSBuMunmiFdysKtHROzwM2FbM9
X-Gm-Gg: AYBFou1WbMueL+0IPu8EODKnLOq7z+9wJWfcW0+oMSwBnbW/8KAFUSVD4q4vZ+uPId8
	1SfLVHxCD9WXcmfMLOg5pfzqXxvL74KpH2T5rIDHLVzuI7Pl0aISExdZVzWsBgqpYzSGhNHLVX7
	A97MhFPIAYrIVa9oQsgJXiiPdze/ftUP5PdgKMZkY9NoQuqfkC14LvatV6e8nwAN1kFCMWcJ6cm
	PpsvAM7B1l1Zn03qVRrdvEEwLi/3OR/3Xb/l0vYKP+N0LSioAU5OyV57/xsGCLVQgV7BIOWqtZq
	Sg61rAejnnpfFILSA6BxXlG9KHwVMeMNnjPDuxf+nZAVxz7Rl83MfYPZ2v7DZ4HapiaaBl8/b4u
	X5u6kJYBRYg189rqCHvVMSbNZlGCRQ7sL5nuHOubCSNAgg2BFKTMGaUIPhF2JVfU=
X-Received: by 2002:a05:6000:4212:b0:488:7a33:9930 with SMTP id
 ffacd0b85a97d-48b024f1b08mr2852100f8f.21.1790775058645; Wed, 30 Sep 2026
 06:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
In-Reply-To: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Sep 2026 15:30:45 +0200
X-Gm-Features: AclHuK8eMRJufnTTazPmzDKVR-CCLP7X7RaSkvqFBM2VLG7N3-iwji-l-8OT5eY
Message-ID: <CAH5fLggF7hcLHGp0aOcebygWPiRJzxsCs7Xhb19vbqz8hUA1_A@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust_binder: error line numbers and failed_transaction_log
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:48=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When diagnosing Binder issues, it's useful to know what the most recent
> failed transactionas are, so include a transaction log with this content
> matching the C Binder transaction log.
>
> While we're at it, improve the line number information emitted by Rust
> Binder using #[track_caller].
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Alice Ryhl (3):
>       rust_binder: start debug_id at 1
>       rust_binder: track caller location in BinderError
>       rust_binder: add transaction_log and failed_transaction_log
>
>  drivers/android/binder/context.rs             |   8 +-
>  drivers/android/binder/error.rs               |  39 ++++++
>  drivers/android/binder/process.rs             |   5 +-
>  drivers/android/binder/rust_binder_internal.h |   1 +
>  drivers/android/binder/rust_binder_main.rs    |  26 +++-
>  drivers/android/binder/rust_binderfs.c        |  19 +++
>  drivers/android/binder/thread.rs              |  12 +-
>  drivers/android/binder/transaction.rs         | 193 ++++++++++++++++++++=
+++++-
>  8 files changed, 293 insertions(+), 10 deletions(-)

I'm going to send a v2 addressing the sashiko review right away.

Alice
