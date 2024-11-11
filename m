Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFEE14D70E
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731332070; cv=none; b=E5/V2Vd6Qp6EGZcumXR4vlVMZoYEEoapvYg7pLGCTWh0sUXW0UYeZJHwtjUMRIDHHTcVcgdfLzWZ1x5l1zl4sHEnUivv0jRxlHTR8jJgjnTF8AQ+4t0cac04jKflEB4/jVWqnrLqPIVKptrPUSIMbrltl5KleL74vLKfXMs5/cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731332070; c=relaxed/simple;
	bh=zCupLufJnUtAcHZ6VreqxrvXnxfDHJ/EW9bxVmzkwKQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=A/e0ovwmbwmKD+ECdSK73aFxa3wXERhmsXMtddU58jgdFsagfSqzNmUlwwVRFqbR6ilXaB1FybUscqTLRpZig0oJUj6zcthgWsyPL8wxlxzva36/MWvZ+Tk94T6Ww3V3QmS0dhYWV/IaodrpitlPlpNsoqdFAD5q3/TEA1AEAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=mOzsozF3; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="mOzsozF3"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 2514038208DF;
	Mon, 11 Nov 2024 14:34:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731332058;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=zCupLufJnUtAcHZ6VreqxrvXnxfDHJ/EW9bxVmzkwKQ=;
	b=mOzsozF3dRuC4bGRnedQnWzZVww+jgsudxMccEN7n0LNhXwArqy4A6Kfr5xNqvwN
	KNyZFlUXTlkb99HOpQelSCuSY/hgrxBDng+fUVdarn65VvDK/Hr4hjB51T+d/orjByp
	sg684KwOpDT9Y3aZQ/EA2q5GbvqDoyfA+EU+KeX3LVt1PFrieCTImKluYnuTcAOxuv1
	PTOTjeSJhNotyrE1ASV9QD6M3mZN+0eeXaZeqJxnLq1bIBOt4aZmy/prmO2qBUgT4US
	6umyX+ISgXVOY2qNXzJzSYJVzxBzN7fRzMwSlTOHpRD/heiRbemHvTN1/sKvBPISOxv
	2ZW+utpbhA==
Date: Mon, 11 Nov 2024 14:34:18 +0100 (CET)
From: jens.korinth@tuta.io
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>
Message-ID: <OBQQehb--B-9@tuta.io>
In-Reply-To: <CAH5fLggOJ1QMdzS=hp+wEGDSKEMFuCh=VPSga5jRy=F+knKE=Q@mail.gmail.com>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io> <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io> <Zy_oj_k-qUPLSVEr@tardis.local> <CAH5fLggOJ1QMdzS=hp+wEGDSKEMFuCh=VPSga5jRy=F+knKE=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



> One advantage of using a Once type is that we can use
> core::sync::atomic until we have working LKMM atomics and then we just
> swap out the Once type without having to modify the warn_once
> abstractions.
>
Ok, that's a really good argument. I'm a bit perplexed why the generic
`Atomic` type has such requirements, they seem unrelated to the semantics
of the interface. But since it is defined that way, `Once`, or `OnceLock` etc.,
seem the way to go.

Question is: Would you still merge the pr_*_once macros with the`do_once_lite` hidden in `print.rs` for now? Or would you rather wait until
the `Once` abstraction is available?

Jens
