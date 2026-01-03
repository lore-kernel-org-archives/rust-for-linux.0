Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67121A95D;
	Sat,  3 Jan 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767434344; cv=none; b=ls74A/5hogaZodhHdb2CvS6AgjfA4iaQK7Avgqhua+8K1AVLpVLRJDXCqlbk4x5qlAlqdLQ5VayEwMcmDspOoDAbbS4Uox6/PpSJJsbcvjWpkbGPFsvuC3MWT7Zr+lDhuvpW/ngZcs1cFtZAx2Lc8OlsqBN3jQqRqSPF3Cil0dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767434344; c=relaxed/simple;
	bh=9cMJn24asddkpwwKVCl2QOsK9R5i64qbxC3xV4KCc50=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XKQoaGU9nCDtlj6TGHBVFkVDwtNptpl2RpFdJm8wChLzBWeXitoTQgHEyoPyVGHWoZRS0C/WpS1Pc6tXx6jEvCy/wBMXMma/zyEvAQfkUzxbr+akU3PbF+JmgvC5gjH17k2bfyJpQh9JXVNLYX6yICYHbcZPel6xiqY5pPVTrGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ky6TS3cl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ky6TS3cl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2ECCC113D0;
	Sat,  3 Jan 2026 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767434343;
	bh=9cMJn24asddkpwwKVCl2QOsK9R5i64qbxC3xV4KCc50=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Ky6TS3cl4aneh4IjQJ12kCXAlZOO3tYw+ivV93W5pab3nz72Lv+Xx11MZrL3Jrm4i
	 VI3iUYejVAvjRaLmiph4ub/snoiX9nDTnlbVHgk5mZuJcp4420kL27+4uH4lWDhEoS
	 xYZx93XTIk7gUAk/flANrXkfRCwLFUV8HWmo8Zw6S39VcWToOv1B4ccg1qfi2Ne/ba
	 H6Hl+RPKe7Lm1a3ivqvBOV7lRebTs5cFGKNAUsg4EuHxmIyJVyZpmpA+0SqEmB6upS
	 TysA6FcaRdQbyLyW6GSTzOJdjqp6eJ7N3Wuffr+ZA2j+g65Bx+Y7AVYZufjEKHd5cd
	 ihwAAmJ5Zrxxw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Jan 2026 10:58:58 +0100
Message-Id: <DFEV6M7ZUBED.D22RP35TL64G@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] scripts: generate_rust_analyzer: match
 rust/Makefile
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <CAJ-ks9nJ149Dt2v5Dn0A3+Qw=TnzE84Lm3Ridrfrc=mdhFt-MA@mail.gmail.com>
 <DFEDG6TK5AY9.1Y9EPEYQLMCMX@kernel.org>
 <CAJ-ks9krE2+K0mVkG-Ao9VAuyDqdAoPbWAK7fHyoVZD6ww=zyg@mail.gmail.com>
In-Reply-To: <CAJ-ks9krE2+K0mVkG-Ao9VAuyDqdAoPbWAK7fHyoVZD6ww=zyg@mail.gmail.com>

On Fri Jan 2, 2026 at 9:34 PM CET, Tamir Duberstein wrote:
> On Fri, Jan 2, 2026 at 3:05=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>>
>> On Fri Jan 2, 2026 at 4:25 PM CET, Tamir Duberstein wrote:
>> > @Benno would you mind having a look at this series?
>>
>> Oh wow this is an old series! Sorry for missing it.
>>
>> I'm not maintaining the build system for pin-init, but from my side the
>> changes look okay. The commit messages are missing some context though:
>> why do we need these dependency edges? etc. If you fix that you can add
>>
>> Acked-by: Benno Lossin <lossin@kernel.org>
>>
>> Also note that this might be different in the new build system.
>
> Thanks for the review! I think the commits all include answers to
> "why": the first two make RA match the actual build and the final one
> does the same and also fixes navigation in pin_init_internal; before
> this series, go-to-symbol from pin_init_internal to e.g.
> proc_macro::TokenStream doesn't work.

Ah I missed the explanation since its so few words.

Cheers,
Benno
