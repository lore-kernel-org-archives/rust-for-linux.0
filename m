Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683613DB65D;
	Thu, 19 Mar 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931587; cv=none; b=Jh2OaCqqM+el7GZ40xQX4KywlwyCmJjr6fS5emrZxNqRhXvWoeFEbK0eww9qccYey3Hz5Q+VTeknoYpmeF3H1yzMwp09deZi95nVzOH1D73aPsdUV1g6WLQYvNAWJHyTqUywRRyGXri/lzzf1wvb4genBpILgeo6TPMq5kzyVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931587; c=relaxed/simple;
	bh=gdqiTLii2z2RxCYVz6izzaW5vCjU8f2cMg/5kOa4ggA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=p65w/oGbWhWMqDZMf4Ft1Argl5JKWebMW1Se0Sk65nAvCTR1kaQW/hprepvGdVQF9H09dOExT5coAyk5LizrjhSL0VtbztaSIsMbQ/V+rfmvJpmvYD0ZIa7go67wQOQhT+4OBIJ4fiXkfsw92uBBWBNE4ZsVLU2hG6UHNfj4atM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDESlFTG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDESlFTG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D1BC19424;
	Thu, 19 Mar 2026 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931586;
	bh=gdqiTLii2z2RxCYVz6izzaW5vCjU8f2cMg/5kOa4ggA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=CDESlFTGgD/2hvlpVsdjoj3/HTt2d+yKByK5sLWqOeZPX8M5MMzV1N1/X6yNl9+T9
	 KdEC1L4CvT6znbZmXEromPoo3JR7pKY4WkyQnqQYiwPzzdNFyShfLc+lzwql4P3egH
	 zUjs0mQlU+TsHCdwh9V0E96AiXIk8UWt2ir4qGqA1j879z00X+s639v3WvTxna3Su9
	 BiECrRK06J8WJ8SeV2++eaUUsA5XbvWV2hiU9C9lDXubprRvrhoKFuzc3clOgss64j
	 rIXuGmGespPUv4blpywmQbMwxxTHmMJ9AlBQHLCvjuhOEjVuJMKhpnk4mqQQv7Hum+
	 IlM6qr2rv0x1A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 15:46:22 +0100
Message-Id: <DH6U9IQMD76L.1PB45UGCOHJHI@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] rust: pin-init: replace `addr_of_mut!` with `&raw
 mut`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Antonio Hickey"
 <contact@antoniohickey.com>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, "Oleksandr Babak" <alexanderbabak@proton.me>
X-Mailer: aerc 0.21.0
References: <20260319093542.3756606-1-lossin@kernel.org>
 <20260319093542.3756606-6-lossin@kernel.org>
 <DH6PM5GUHQQE.1D6WUKBV0GSHU@garyguo.net>
In-Reply-To: <DH6PM5GUHQQE.1D6WUKBV0GSHU@garyguo.net>

On Thu Mar 19, 2026 at 12:07 PM CET, Gary Guo wrote:
> On Thu Mar 19, 2026 at 9:35 AM GMT, Benno Lossin wrote:
>> From: Antonio Hickey <contact@antoniohickey.com>
>>=20
>> `feature(raw_ref_op)` became stable in Rust 1.82.0 which is the current
>> MSRV of pin-init with no default features. Earlier Rust versions will
>> now need to enable `raw_ref_op` to continue to work with pin-init.
>>=20
>> This reduces visual complexity and improves consistency with existing
>> reference syntax.
>>=20
>> Suggested-by: Benno Lossin <lossin@kernel.org>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1148
>> Closes: https://github.com/Rust-for-Linux/pin-init/issues/99
>> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
>> Link: https://github.com/Rust-for-Linux/pin-init/commit/e27763004e2f6616=
b089437fbe9b3719cd72bd5c
>> [ Reworded commit message. - Benno ]
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> This version looks okay to me. Why is the linked upstream version adding
> RUSTC_RAW_REF_OP_IS_STABLE cfg?

Ah good catch. That's only in the build.rs file, but it's not needed any
more, I'll remove it.

Cheers,
Benno
