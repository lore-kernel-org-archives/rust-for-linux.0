Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EE39099A;
	Mon,  8 Jun 2026 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903721; cv=none; b=sLFPJwfxpXmDklE4XyhanoTGVFFHknYCT/iGHlaJVDuhH/vCp1wI/+espLZ5yRsm9T7f9RRwOw/A3TQ/NvYaP3XJn5rlAD2sIdfG49exG8PDcRzV7+oNacU/deua/CqLnPuNIPHa0dRewTEoEVNiKFq6Rtu2EDmgnmrRrZq7TE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903721; c=relaxed/simple;
	bh=OcEO/DZyRAKUyN58dU702VP4m5lRONRy986zh+W6hCA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gd65N1Hbao9EuItLL/66Sr8ic13cnNmVpSXbR8+RZVDG9YdnkkyiBscsOhEC5mc2eE6iNDG7EMY66RhErTVgA3qAA0zWz6BfPSMD1K0xcG3+Gihyeder4665EeS6OHww6Z+zdbrwfncuPXObPbO89903kWXeXLQll3lNtrR8qiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnSSNAqs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnSSNAqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF6D1F00893;
	Mon,  8 Jun 2026 07:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780903720;
	bh=Y1UMz7KEWzqR2vURLt1Ii6EJb/56UjCvUmU1X76Rq8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HnSSNAqsloZMmQ2COQ1mxjUEpXEKl1Hs7NM+P7WWGwgcfmM7Jpk4Gror0WQcM3PeM
	 Xbb8Svq/SYnKSkqhINP8eF5RmmBkySgor69I6aFio+alYi568JlD5IMoJFhqMum8O6
	 m7yrSng4m7mEP36SXuxNLQ6SV6Zi71AaP5mk/S+miyPS7C/yuGyo1ipFV5Ek9hDmhh
	 seEbGH8o1hlKMf1FVM96zN/N6QJIHj1naV+VHVqYBo3bvrQg4OOb5iuGS7hqKUWtsH
	 aEjsFE8sN1eyoosjYDd7xdqsDvC3dNudSxElX1SFSvTJgIiZdiilgNjG9Zi8BH4uw6
	 uRSnTBmNM65QA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Lorenzo
 Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [PATCH v2] rust: add a ring buffer implementation
In-Reply-To: <20260608062555.19400-1-work@onurozkan.dev>
References: <20260605-ringbuffer-v2-1-99df02489185@kernel.org>
 <bIhkZ-Y9oi0UpU4_qKfW4LpG7ebnML_9ph-V1DViGHkBgAotpf8_N1dzWj1UU34rczUV9F52eJhwZpaiq6glpg==@protonmail.internalid>
 <20260608062555.19400-1-work@onurozkan.dev>
Date: Mon, 08 Jun 2026 09:28:31 +0200
Message-ID: <878q8pij8g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Onur =C3=96zkan <work@onurozkan.dev> writes:

> On Fri, 05 Jun 2026 15:10:30 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>

<cut>

>> +
>> +use super::{
>> +    allocator::{KVmalloc, Kmalloc, Vmalloc},
>> +    Allocator, Flags, Vec,
>> +};
>
> nit: Vertical style import missing.
>

<cut>

>> +    /// Returns `true` if the buffer is full.
>> +    ///
>> +    /// When the buffer is full, any call to [`push_head`] will return =
an error.
>> +    ///
>> +    /// [`push_head`]: Self::push_head
>> +    pub fn full(&self) -> bool {
>> +        (self.head + 1) % self.nodes.len() =3D=3D self.tail
>
> Nit: This seems short enough to inline.
>

Thanks, I'll be sure to fix these for next spin.


Best regards,
Andreas Hindborg


