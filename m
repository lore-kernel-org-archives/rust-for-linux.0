Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCAB32B9A5;
	Thu, 15 Jan 2026 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768517004; cv=none; b=gy3GzyNcvnSPfeCPVYpIp0YmYg9BoN8ryfQSio85luNkt3PEVZJZdWCrbFLfHYRrPe8W5DO5qJ9i9t6rhaQdmSb2FCf4xDZgPr0EMDwsBlPDn47FrfXcD1tGd/1zjD3mvaUWf8gPSvCgpchxp5WX40/bUENiWdI/rQIUU10TD34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768517004; c=relaxed/simple;
	bh=m31PCGEoMuxh+83GRpg+768JtktghYN5EwY/F2pxhiE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fPlb+daHfv+FKIFZdK3UEr23Ad0V+x7DWxdjqwAycDrv2cS+qbQHssnbpfX9I4xP7y+ApSkYM/Bo+r4DKH4xNQxyf8knXHQ7GzK8PVKqJFy4agJ3XlxA98E1REogyjIYPfjWLt4dQxxrD016BI1SU6yV7gysO9L7XEStcpiLnF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljZwqGl+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljZwqGl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C17C116D0;
	Thu, 15 Jan 2026 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768517004;
	bh=m31PCGEoMuxh+83GRpg+768JtktghYN5EwY/F2pxhiE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ljZwqGl+56vf3ouLrR8eh1MDXd0m0KJ9ajzR6DzAkw/7wQMB1ZSAY+NO6W4ahaWyy
	 MhPhz/iXIrNPsFSGaAGUEONcAB2v4j+ZfgCcbySqnMVsQMrwRQnaV5ClMKDxY3RaX1
	 RTwv1t+/AwlFXA5CcKTwaquxAtDj9CHm2KOOj0QZtVS5sivwsX4b13yoadJrLHJBeZ
	 fwF6I2MAzTswg2iKAdqVgzomoEmdVZ7GIVqebpym2a59LHehYXCDbaqUEYzfOztGKK
	 hnLU2Ef2FTmLw7Ci6mPfGdf1acSNQsCgr44ArJcmQciiapzkgjxw22D5py3UjggyUv
	 DGzTqouLbFn5g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 23:43:19 +0100
Message-Id: <DFPIYDMDHC6V.3CT62XJBRQJOD@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 09/15] rust: pin-init: rewrite the initializer macros
 using `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-10-lossin@kernel.org>
 <CAJ-ks9=kvTBHLzepFUqtYn_FOroP3CU0QhyNwBRyH_tHF4p50A@mail.gmail.com>
In-Reply-To: <CAJ-ks9=kvTBHLzepFUqtYn_FOroP3CU0QhyNwBRyH_tHF4p50A@mail.gmail.com>

On Thu Jan 15, 2026 at 10:45 PM CET, Tamir Duberstein wrote:
> On Wed, Jan 14, 2026 at 1:20=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> Rewrite the initializer macros `[pin_]init!` using `syn`. No functional
>> changes intended aside from improved error messages on syntactic and
>> semantical errors. For example if one forgets to use `<-` with an
>> initializer (and instead uses `:`):
>>
>> <snip>
>>
>> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>> ---
>>
>> <snip>
>>
>> -#[cfg(kernel)]
>> -pub use ::macros::paste;
>> -#[cfg(not(kernel))]
>> -pub use ::paste::paste;
>
> Now that `cfg(kernel)` is gone, can we also remove it from `rust/Makefile=
`
> and `scripts/generate_rust_analyzer.py`? That is already done for
> pin-init in patch 3 of this series:
> https://lore.kernel.org/all/20260114181934.1782470-4-lossin@kernel.org/.

I'm still using `cfg(kernel)` in `src/lib.rs` for linking to the std
Box and Arc types.

Also I don't want to have to reintroduce all that infrastructure when I
inevitably have to add new kernel workarounds.

Cheers,
Benno
