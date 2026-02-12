Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443CA31B130;
	Thu, 12 Feb 2026 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770893548; cv=none; b=N0Di9ociOM21y2yJjAqiz+io5M5LwsdZ1ECZBlcfo7ekH/hbwWujK0RxZ8FS58P48ZmhlvsNAVKmOLF/MGg2ObXfBJUpbsdMDIhehVkEYnpU5QRFwzAtweyoWz7qZONip1kBthlANGArFqZTyEVD3KodAaEKrwBDdOSYlTCh2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770893548; c=relaxed/simple;
	bh=9Pyx3FcIrlIeSu7IdkFhtMfJ1XFqoVQj8E3rP5bSCnE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hMlz9qYSByJzL7WZvPBVGTiHVdkq97yWLCcyxOY6YwOXoXUR1YI0LF7VD/gZ/VNbBf3KeXVN031uWP3bk3lJA/VbIaQxYIkEPQRr3Y7isnBtKefOCpcNhQMgEncn3WMip3MYeRUuGYWSsiyLYybPCC3E+TA/KTX1Rxjy/aIprD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGpBP+sW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGpBP+sW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7046DC16AAE;
	Thu, 12 Feb 2026 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770893547;
	bh=9Pyx3FcIrlIeSu7IdkFhtMfJ1XFqoVQj8E3rP5bSCnE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JGpBP+sWDLYqpKd+0n6IyYuEGPaBwrsrgq5JQr0KEeGvYVS/xpBr4LkEIuvaDCdWL
	 ROM/xTIWczGVueTKJiSXraBFyEFLasHMYkCCbwXyPWacMsOxoH5Tj/hQxqRRtVo3Zo
	 T0MVUvqpp4eK+tpfceNSX1b2J4apk2k72Ia2CqTjLaKVp1ge9wx7o3xBG7ksYYpGLp
	 m/i4UWETP7rmTvSVlXJtMmnOAKwMxN/FvNRipOMlMlKgI+BVtMaZZ5gh1q56L6JTu0
	 yf0jT1oI3jeZFkJpZKnpoRPKxY3srXx1A7o1tZxhOcJ7rIdRajAR67oTaImMyno00T
	 LUcvb03S84W7w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, Daniel
 Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
In-Reply-To: <87y0kytggx.fsf@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
 <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
 <87fr77viat.fsf@t14s.mail-host-address-is-not-set>
 <fU1FEYt6-SY0KlyJy4VClCr5j6P4d5-wukzc_9TkSDSBuQNlY26xyOIprMbHEVMv-H-nrAJ1iN_9tcfIXEI1iw==@protonmail.internalid>
 <gta2wjt4tkcvyu7g56gqyipiigbmbk2ca3biqzmxc2npch3rk7@ccwzwgnk7mcz>
 <87y0kytggx.fsf@kernel.org>
Date: Thu, 12 Feb 2026 11:52:16 +0100
Message-ID: <87v7g2tesf.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> As far as I understand, this is a borrow checker limitation. It is easy
> for us to look at this code and decide that the borrow on line 51 will
> never alias with the borrow on line 49.

I did a bit of googling, and this seems to be a well known issue with
the current implementation of lifetime analysis in the rust compiler.
Apparently this kind of code used to be OK [1] but the Rust devs decided
to remove the code that allowed this, because it was causing excessive
compilation times [2]. The upside is that this is solved by the new
lifetime analysis implementation called "Polonius" and it is the
intention to replace the existing implementation with Polonius at some
point [3].

Best regards,
Andreas Hindborg

[1] https://github.com/rust-lang/rust/issues/51545
[2] https://smallcultfollowing.com/babysteps/blog/2018/06/15/mir-based-borrow-check-nll-status-update/
[3] https://rust-lang.github.io/polonius/current_status.html

