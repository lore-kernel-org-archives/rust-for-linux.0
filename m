Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5598D149E0C
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 21:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722029417; cv=none; b=EWz00/wpjDBQvnYZZkd+xwpa8a1vP+5kzTLZWTbWFpwFt605wA1YQ6g0mZk1LPI8OR0bpRApCeYZP5Zq7Q24sK4zhjQnD1phDMkU6W3iIjJegN6Qod3bSvg53LKhFHSxfhI9joWHKymInAtZSa/UvfE856FvsUVJJJignf+5DGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722029417; c=relaxed/simple;
	bh=TazJz5DuIy70P9F4AIkG+gYscTAZ4DJnFp342oDsZ3U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAJqAAZFWvP5rxERO4Xl4HnHhUR1wLUbtUJaEDpcNXla9BUNPqIKCtTsfQNAGbBCg1uvAVZChDB92NphNoOJDsrDQJzCqEgfLokIYcWGkkLB2I4omkuxTsqpbHJ9CCiMbX2AK6UlFauWdxQvfzL6ufLdlxorUQOwJIDcdTGOVMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KnmBAoEq; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KnmBAoEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1722029407; x=1722288607;
	bh=TazJz5DuIy70P9F4AIkG+gYscTAZ4DJnFp342oDsZ3U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KnmBAoEq774sWlpBt9Vk2FT/I+OIj6TmATo3eR3g9mQOvfRSfSz2WGHIxhL+eTGq9
	 phSqHCH+u1XvkjYCKUQLHd3He2NJrZ9gzNnrJvQQV0eFVjGbWlv21aIvadO8BBV/z5
	 wh+HI42Qw3UW0b2omFDSbIYqIMcdqIHXxGUH0G4U4MoqZ6LbWsjRi/01n+qzmnbChj
	 ghoOJx+w7/JL7cqRdwzO7h69c+4tvwvsr6ZpTmlEaVCFJD/pdBu1YbFWeteSHwJs6x
	 okW+LJJ2xCvponbQ6uHYCRmsvh/YyUOx8aRLhhUosIlwFfCuRrwz/VVlnJAsplHJNc
	 aD6eBfAbCviHw==
Date: Fri, 26 Jul 2024 21:30:00 +0000
To: Boqun Feng <boqun.feng@gmail.com>, Lyude Paul <lyude@redhat.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, Aakash Sen Sharma <aakashsensharma@gmail.com>, Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] rust: Introduce irq module
Message-ID: <e46d6e12-144f-47fe-9db4-d7d04914f265@proton.me>
In-Reply-To: <ZqQTXUl4w6LRPqLh@boqun-archlinux>
References: <20240725222822.1784931-1-lyude@redhat.com> <20240725222822.1784931-2-lyude@redhat.com> <ZqQTXUl4w6LRPqLh@boqun-archlinux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 67cf4481c52eddca5d086a82b0eb77c95d794ba7
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.07.24 23:21, Boqun Feng wrote:
> On Thu, Jul 25, 2024 at 06:27:50PM -0400, Lyude Paul wrote:
> [...]
>> +pub struct IrqDisabled<'a>(PhantomData<&'a ()>);
>=20
> I think you need to make this type !Send and !Sync (because you are
> going to make it Copy). Otherwise, you will be able to pass the irq
> disabled token to another thread on a different CPU which doesn't have
> irq disabled.

Oh yeah this is a good catch! (although it should not matter at the
moment, see the end of the note below)

Just a note: it is not because of making it Copy, this problem already
exists in the current implementation. One could have sent the reference
to a different thread using a "scoped spawn"-esque function [1]. IIRC we
currently do not have such a function, but it should be possible to
later add such a function. (and it is much more accurate to make this
type not be thread safe)

[1]: https://doc.rust-lang.org/std/thread/struct.Scope.html#method.spawn

---
Cheers,
Benno

