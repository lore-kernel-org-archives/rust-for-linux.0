Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE221C173;
	Tue,  6 Jan 2026 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702574; cv=none; b=PYBKOOOa0eUyss1QoYjRZsOUZjgWkPVqojbHn026gEnXBjlDvyLAz/Qp+srhHkyh6/AXo29Y/YMnnUoT/IBwlhJ/yCO7roxTkTP1oha74soytDt9AyAhjefIu+HvwOq40pl0PzIxk3ysZBXuK1MDdcgOgR/p1Zlaj6QihkCq41M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702574; c=relaxed/simple;
	bh=lg/uQ7v3I0W0HT+BOpnVO62ZSIrE199SGnAivcANcos=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jNQSwo5QVJ+5K6e0Q+D8+1puaR9RvpmAMvhSYu/xde2E+12gdH4+iCBUVrORPpOllxsYT/LIU1v6It4zRHQgxiGeN39QgvslX7Bsaa87IqT5PlQMlpxpYf+QdSmkeGrTsQ4b7QmuSBzNpUVrTyVQURZ4Dlj98San0brMT3vjvx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHaNmu4v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHaNmu4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6518C116C6;
	Tue,  6 Jan 2026 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702574;
	bh=lg/uQ7v3I0W0HT+BOpnVO62ZSIrE199SGnAivcANcos=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OHaNmu4vNsk0K6/664zMS3Z+KCVhNugJrCwzZ4NMzmMcOoThTkk3Hz/p9kvfXKgJs
	 sU107LMINq24K2CGDDngeqc+lMBSYlZ+3zInkvdiBizhrnGdoIEwwHC0+QvrYrLk7H
	 DTxbEpkPrpR31rsO+CaYrwcaT3tHp7+G6mrZPlz6fjubieE0tJyvOIK8JotZHiOjNl
	 2ST4XeuibiiclTDF7L+aoOXjLs2yxrTsWIJI//MssMN4XTMQ4OdJKPoT1WdsZ9LO0G
	 eI+VnbbGLNrKmV2sLSUQWlPjtdPDN2Z1oJ3T2Mx8vTnwQvWTtymW2pBfvZWhvkygW2
	 8iMBiBWA+pmcw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Breno Leitao <leitao@debian.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] rust: configfs: replace `kernel::c_str!` with C-Strings
In-Reply-To: <CAJ-ks9nDDceVKjLengGsjJvxTT9Mc5SqRfyteuOw4AsO1KWhLQ@mail.gmail.com>
References: <20251222-cstr-configfs-v1-1-cc1665c51c43@gmail.com>
 <CAJ-ks9nDDceVKjLengGsjJvxTT9Mc5SqRfyteuOw4AsO1KWhLQ@mail.gmail.com>
Date: Tue, 06 Jan 2026 12:23:23 +0100
Message-ID: <87pl7nhtn8.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Mon, Dec 22, 2025 at 7:12=E2=80=AFAM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
>>
>> From: Tamir Duberstein <tamird@gmail.com>
>>
>> C-String literals were added in Rust 1.77. Replace instances of
>> `kernel::c_str!` with C-String literals where possible.
>>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Benno Lossin <lossin@kernel.org>
>> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>> Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> @Andreas could you please have a look?

I'll take it for next cycle.


Best regards,
Andreas Hindborg



