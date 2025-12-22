Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C43019C8;
	Mon, 22 Dec 2025 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414289; cv=pass; b=JYcGRHJ9nnGClicg0CSImhTw++CvR14yu187VQJ9fiomdwjEL4UoItXjEscLWPLLmIfgx+Vu8gEfOnF1wpauTZUAIvw4UyP2iSZdFoM8CygYhpWJlQ7AZWgd1lEfYDSHif9FdwV3g7R91yrngzNmC/ekLZY1Y9RzxI7n/fGU+eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414289; c=relaxed/simple;
	bh=2Gf8DteoTrF+4JswUjVHeW9tlH55uhBa0F/TmfTDwGw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tp0mw2OEUr9821QaiMg8mXGb9ByDomT0EB0BHx/xufLmzt5mYsnXGLdHRLKtXfgqtuTFupUq4vCdr3oX84j6H/sgTLGPUQzVbHjEwKUgDso5xVqkgz8I6ydXyCWABRARIOFF6aUY1egxpLjZZ/HsQZn0PBsbChz1lURiABSF70k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=FNbeOfcx; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="FNbeOfcx"
ARC-Seal: i=1; a=rsa-sha256; t=1766414276; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eGYU3XAGyDrXVnn9w8sLZPFT3KzKl5ucv1T0a0i1cJDys6F9XBrnElWvqOm3Pls/Q6DbW9Y1GiW7uGO+3sOv5894W0gw1jTdAuiRjvQ9d1SCkKF14afZGpr68mHwqM6cTQmiMbTwp9PMPPcu/erN1EEvPLA4q2J7h0KWCWkXGIs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766414276; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3iscJTG1u/8bsDAdBMDOnXozhldvx9nDYCgI1ASxKgo=; 
	b=CHlar1GsLaRXYF/pJ1q/SQiOQrojgC/XIN9cCAv4Sxt8VNNSlUDfow1B5sDppkmdn5/vjCItUOrDcR2+IkVScF0aP8t59ejco5L7JktJZ5FBvGRwYE8AwqgaeaHtfaedhUCLqzSz0ycawHiqYRTKWW95wljwBMsxZ/T+MnAYyaI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766414276;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=3iscJTG1u/8bsDAdBMDOnXozhldvx9nDYCgI1ASxKgo=;
	b=FNbeOfcxKxbKqIPdly7ZqqxBZ7KliDRt4SV+LzJ7Hfhyp/dCog1NTiGNl1bPxoey
	SACLqHApMyvHFaYEBEXXYnRMq8v4oBIEL9HZRrRqoGbewYsWycBTT80OxubXS6cdH8t
	KS44njMH16BQwYOnvFgXc+r3Xgg26HyyJUFRjH+E=
Received: by mx.zohomail.com with SMTPS id 1766414275874618.6033541368188;
	Mon, 22 Dec 2025 06:37:55 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 0/2] rust: i2c: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
Date: Mon, 22 Dec 2025 11:37:39 -0300
Cc: Igor Korotin <igor.korotin.linux@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
Content-Transfer-Encoding: 7bit
Message-Id: <D7C5FC20-96FC-4E5F-858E-92405039AC11@collabora.com>
References: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 22 Dec 2025, at 09:14, Tamir Duberstein <tamird@kernel.org> wrote:
> 
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (2):
>      rust: i2c: replace `kernel::c_str!` with C-Strings
>      samples: rust: i2c: replace `kernel::c_str!` with C-Strings
> 
> rust/kernel/i2c.rs              | 8 ++++----
> samples/rust/rust_driver_i2c.rs | 7 +++----
> samples/rust/rust_i2c_client.rs | 7 +++----
> 3 files changed, 10 insertions(+), 12 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-i2c-fce258eb7e5d
> 
> Best regards,
> --  
> Tamir Duberstein <tamird@gmail.com>
> 


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
