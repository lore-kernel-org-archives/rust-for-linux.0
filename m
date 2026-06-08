Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA4130C16A;
	Mon,  8 Jun 2026 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907603; cv=none; b=Aji+zG4O0gVCGXe09woy2TOWyPtL5UyOpF5uXKW+eWWUoSx7Olob/V+cKcL8FrxkebTOZZATXXivmKwIjqm7thhnmwYyMPAcYrWU5hcwJAJd+6r/35iyL86aQ7Z1AMJJZ/FS7xOG0j2cEzogs7woR5/7pfVA02cOea43i0mZzsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907603; c=relaxed/simple;
	bh=dqN15iOBTjQOtmPD/LxYPvXDDpZKNudQr5wdJthj7Ec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=foBnewK85exAZj31mM11pMBLVJacD+lVtjz63HAX9tUK3271WO74LumlfBiSixb+0BVqc9FAnMNKrORiC3upIzDJJwPpOk0ZYWILtn7LU5f2WxLIhECuXvIFXbDRzQvN3pHDiwcG5ZREEHXH+wZfVewWaileNXhP5JiMJYbIC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCIUuZU1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCIUuZU1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAC81F00898;
	Mon,  8 Jun 2026 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780907602;
	bh=dqN15iOBTjQOtmPD/LxYPvXDDpZKNudQr5wdJthj7Ec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XCIUuZU1hypEzjXq9JodlFChvPeL3/V8+g3BSNmntfxUJ+I2Mu9HHobysYU7zooRF
	 HguDT0WumpKAkGumg65Mw5RRch1Ws2JKn98A747wd5nE+wYFJalQ3sx4smocXmfd/q
	 ebs7qtH+tf5PafSH/rjRvUOAed/ElsaFyS9FdCecS3xYQQqybJ6j5n5NtH3DVfGyG/
	 lK3oiVaxCLlq+Y+09QuG2d67JyV/FJf+t9eWAuPqpkoN4mskztxj1AbEJgVnOFBFUy
	 yMPmiIn//oHHyziqxvmc6yjPbxw9lRPY/c2CRib/Auv5MzeHb/CarYFhbVj2f1wEEo
	 JopYdruIqsipw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: add `UniqueArc::as_ptr`
In-Reply-To: <CANiq72kjir2brMJjZPRO-bymJdZh871pmCE-DtHLAPOWYf7-aQ@mail.gmail.com>
References: <20260605-unique-arc-as-ptr-v2-1-425476d2abdb@kernel.org>
 <CANiq72kjir2brMJjZPRO-bymJdZh871pmCE-DtHLAPOWYf7-aQ@mail.gmail.com>
Date: Mon, 08 Jun 2026 10:33:14 +0200
Message-ID: <875x3tig8l.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Jun 5, 2026 at 3:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Add a method to `UniqueArc` for getting a raw pointer. The implementation
>> defers to the `Arc` implementation of the same method.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Like Sashiko mentions: did you put it in the `<T>` impl for some
> reason? Do you want me to move it to a new `?Sized` one?

Oversight on my end, this should apply to DST as well. Feel free to move
it, or I can send a new version.

Best regards,
Andreas Hindborg


