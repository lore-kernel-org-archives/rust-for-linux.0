Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6FE2367CF;
	Mon, 16 Feb 2026 12:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771245838; cv=pass; b=Gd8wrm/Jfn1ZoHia9Kp/WBB7bIiCd/+Dd35yFbEUr6ne3af6CQW53vJsdR8YQHWNZFxqkiKbrTQZ3Px7P6kekn7pwrb1tm/9PlWhR9GgU2y3Tbd2TBEC03YXo3mhqfHYVR+e2aYK4+J9G75oqpKA1lganld588NTOI1nYZKtTrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771245838; c=relaxed/simple;
	bh=og0oxqbY92W+hH04CfCfxPv6zhPi1wPAe3oARVt4mBI=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=JZmFDsFJuTL1VRALHW47EJsmlxA8JJR3SFHM8D5AVFG8X5sE65Qe0l5f+XQNrAYU5tChQWFxNw3upYQsw3911vse9xxExJ0lZYJUjyZD8rj7n/rG+drACOFmDflDFPOcEwuteHg0mdmUSiE0TCbV7jc0Ab1nq2jJb+t+GJ9Fnyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=TyrtYBWr; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TyrtYBWr"
ARC-Seal: i=1; a=rsa-sha256; t=1771245823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JAl1Z+gEjXjtjeC1hFsedqR1fGMcBLsu2eomRC5UaDTchqnAbzTwb/vwTBX4zsCSpkGQen1R6i7t7oGtAgRiFPDzD2gRMU638Hq3ZZcZdyP53zYmPXIqAJevnQ61GO8ESoFTxEEz8FhZngZ66k8gabNVPk8B4ULry9gJKi9PbqY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771245823; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=og0oxqbY92W+hH04CfCfxPv6zhPi1wPAe3oARVt4mBI=; 
	b=e2cqPz69S6EwlQe304j+RhVMScVteZcJ75ALU4iwBPIiFNDYGadzv7QT53EHz5zdCFGedBbvkHH1V3M9HdLjf4xMtXzyIwMtqVYDCWUQ9kwZ4JjQNsHZ60iDscjK0GS0HRJQRBlpcVxchjovKx2Y4E+KrPkbGIyb8XqinqkVNSQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771245823;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=og0oxqbY92W+hH04CfCfxPv6zhPi1wPAe3oARVt4mBI=;
	b=TyrtYBWrLOk3VoxX2ATwZxOnSEePrpzifUgujIYLRrpT2kos/CKyMlj+/XzlXWBr
	248IRSlxaaBtzepFuOBBrTOMLgPX54soN+XQxEuEN2naKa2eLX9Whks7MiR2Vj03vol
	4uKEZSKQAMu3p9RubGOGwiR7HUGcgE/VbZO5W3lQ=
Received: by mx.zohomail.com with SMTPS id 1771245821326519.1905763381354;
	Mon, 16 Feb 2026 04:43:41 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] rust: add a ring buffer implementation
Date: Mon, 16 Feb 2026 09:43:25 -0300
Message-Id: <3D30E044-445A-4260-8409-903D0FD60C7B@collabora.com>
References: <aZMMyJofDKualqXw@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
In-Reply-To: <aZMMyJofDKualqXw@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: iPhone Mail (23D127)
X-ZohoMailClient: External




> On 16 Feb 2026, at 09:26, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> =EF=BB=BFOn Sun, Feb 15, 2026 at 09:24:59PM +0100, Andreas Hindborg wrote:=

>> Add a fixed-capacity FIFO ring buffer. The implementation uses a circular=

>> buffer with head and tail pointers, providing constant-time push and pop
>> operations.
>>=20
>> The module includes a few tests covering basic operations, wrap-around
>> behavior, interleaved push/pop sequences, and edge cases such as
>> single-capacity buffers.
>>=20
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>=20
> Why call this ringbuffer instead of matching the stdlib name for the
> same collection? VecDeque.
>=20
> And a more general question .. is there any chance we could avoid
> rolling our own for this? Is there an impl in the kernel we could take?
> Or could we vendor code from stdlib?
>=20

Well, a pretty good reason is matching this with IoCapable as I suggested. T=
his is also a pretty strong argument against VecDeque, since this is now unr=
elated to Vec itself.

=E2=80=94 Daniel=

