Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6773018DF8E
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722415306; cv=none; b=hy9kx2QeXW5UI+3jYxeSmoJ1k32pPk2TJQirmQ0k7B2vkEsKNAQbBrjP3QO1nHw0XWOkpILo6SZK/ovZlyk//S94scj/xmiMyTLXLFQkdlc6/2v3h/TrXlpnl5p5BI9au4mXU2PWTekxNXnRwsavF4AuJDnU9OE58Eb4lJqmAWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722415306; c=relaxed/simple;
	bh=B2Sw/vizsMUyqk/vLPQLkHjIXQQw//mEZa4w4bBnzLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qW02bIJ66cZo4C/rYNUNbea2Ul2uQ+HKsDkITPYAaVAkrxLFPB7fHIuNoOnpNE/bM6zXSb1B9TtG76hoBvxy3rKWZ7Z2ubbR3sEvJDhFLYU12VvevmXqUBfBq3dEUFCCXCteKIzYQQyW8jAAnChdLHa4bw02xRLaHG7Txz4cZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cHe60/I+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cHe60/I+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-368313809a4so377876f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722415303; x=1723020103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2Sw/vizsMUyqk/vLPQLkHjIXQQw//mEZa4w4bBnzLE=;
        b=cHe60/I+vSo+7t/v+obI/ikcFL3opg0XUhXQWuEzGiEFIBfenRusd7TvCU1j2U0sKp
         Fn7jOXmSxtyaN5Z6WzXnVxPGODXO0B0/TLU4gypVi6Q9yN87vfND0+LYuL7jfVBJVzxt
         62kocJlLHJLZfwOkwXzZiLj1L8KLXzdkQCbJITWUH+HeqeeMIzW5F3mKVoZAtpIDmFOc
         yRoDFDahpzbE8ECxEDNZc4LO0x8iYrfLm2noAkXNckbaufrPhN+CeDvSlQbmp+f5gUn/
         RIRMj3rNIpE86XGotJBnYAuYR6C1CJcoNgpD7n0Ckpx5cthFASWs4gJ9oaxU3RRszjlg
         s/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722415303; x=1723020103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2Sw/vizsMUyqk/vLPQLkHjIXQQw//mEZa4w4bBnzLE=;
        b=CUwZGST/CZbmNn8ITfeRW68kyzH1bIQMLnleLtlSOI3RHFfF6nfvIIFWh+w+07qDiJ
         xva72ppVXj7Izald8N9rxP5k22moqkZ0Z///VhV2TLFC/VppdQ5b1ooDfZLcifj4DQWm
         fDgwBjWRi0RI7r1kwepyQuKQGlFz1N6hCFSbi7mHdO23lcakNsb7eUbROUiSp+BeU0xd
         qWwtoC7D8GV8tTPklFvOOMEeOTxDU7bPJd+64k7aWTA45rOD1/uBftVRhpKubEtwKtl+
         x2e2OzKfU0xJM14KcLEc96P4mA90KfFLfhPN5L/bTszEdfPrdVSv4hcnje58EkY+8sGq
         ULhA==
X-Forwarded-Encrypted: i=1; AJvYcCWh5BcdTpqPnL3d8geHRDrKocS7SMJNBiDMixmNBlIL47u85psATa137lMREhkqjbCJpmGr6ykgPrT8I/WQI/oATymR9aaTi3aDXiEXYLI=
X-Gm-Message-State: AOJu0Yzl3EpUnqCexNFsKaDwOKh+1EK+IpWGaUa20Ze8sOrkOLWh9k0h
	qq1sBjU3rvgM/GhUzRPpFRHtjkd1AxNLyy67KsHDWgDRaXysKbY5ZAqPx1EiFYuBGdEBTxsp3e8
	vOJjwZC9ZmlM8rc8Jnod9UEwhv+p2OPk37p8s
X-Google-Smtp-Source: AGHT+IH4/VkrKwNdMel37onE/R34nyaTDLUF63X2rjy7FQGTHwsI7LeMqmpN0KLfwKDEj5QdRZBUtCMOu4zauPC3ess=
X-Received: by 2002:adf:e541:0:b0:360:8c88:ab82 with SMTP id
 ffacd0b85a97d-36b8c8ed754mr2828583f8f.30.1722415302303; Wed, 31 Jul 2024
 01:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730182251.1466684-1-benno.lossin@proton.me>
In-Reply-To: <20240730182251.1466684-1-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 31 Jul 2024 10:41:29 +0200
Message-ID: <CAH5fLghV5mRFZ4ORRouy6oKMuUBu4LnvsvmyH3XoTLcV4PvdAg@mail.gmail.com>
Subject: Re: [PATCH] rust: types: improve `ForeignOwnable` documentation
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 8:23=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> There are no guarantees for the pointer returned by `into_foreign`.
> This is simply because there is no safety documentation stating any
> guarantees. Therefore dereferencing and all other operations for that
> pointer are not allowed in a general context (i.e. when the concrete
> type implementing the trait is not known).
> This might be confusing, therefore add normal documentation to state
> that there are no guarantees given for the pointer.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
