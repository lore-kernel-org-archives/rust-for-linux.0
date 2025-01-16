Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AF74414;
	Thu, 16 Jan 2025 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737055386; cv=none; b=l/uzxMaYgDbF5DP/MJVEjGYkbhpP35pA2wM1d2VoyYyK8bHiDJmaM8OQYmJLM3CSbvBOTS1Jm2xNmLxtBoggmkGyatNhF7MsL8fS0WJXd+3wGxL5Ug08XZkZ7EAivce9Ide2EmC5dfw6BPXgJE7+djaofR5b+43Nyg7rUW8lJiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737055386; c=relaxed/simple;
	bh=vag0uFGkgTQ0uTD7ryVQRoKGdDGVYg/X8vLOVmh7qL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hn5BlMgv/GQ0bGL2DBbbZ4Yg87/YKuVmu7vqbuuT0U9J9QQFhP/G2naVWdqZpJjfWcWi5jLmvAUdwZ5zc7hOwqoeQ+syhqO36NxxX5DHgVNRNP6SDlk/PtL1VtUVMHCls0TBXTpVnOL4IAhzsbUrh1HT6npzKIEnCbFMU0jJj7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeKS9CjF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeKS9CjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EFDC4CED6;
	Thu, 16 Jan 2025 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737055385;
	bh=vag0uFGkgTQ0uTD7ryVQRoKGdDGVYg/X8vLOVmh7qL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GeKS9CjFHb7qvSiHQP8MIf4qhRfOyAyWKUTbuvhqPb0W7PHNZojHhqrdbaNMyR82O
	 YF6dftoPYYQooyYRcsUxWOS7DEW98fqDG0+yEE71LqldeZrNw74jQHrClaHypd8EVH
	 Kk3kka7SJh7gwybhfgwEboaT/92joZBabAorZV3QXZZwKcgddSJyoLDyHrgOrOKM8C
	 EjYzVzazeV3ymiQtwm3Arz5f0uekaoqCfQ0xPYqu4st6aJyt5hx0L+m0Q2CvzNYP8r
	 ggfIO5MuDSGZS8XXeAiyRonZtxJI6O78GIxMYacYcJmwerz6LP0pAUcvbd1CjuQeDa
	 PK62Y/X+Gl5OQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Lyude Paul" <lyude@redhat.com>,  "Guangbo Cui" <2407018371@qq.com>,
  "Dirk Behme" <dirk.behme@gmail.com>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/14] rust: sync: add `Arc::as_ptr`
In-Reply-To: <CAJ-ks9mygX61B=FOgQegs3uReBHDju2cs6eFRohjNEX_GPwAjQ@mail.gmail.com>
 (Tamir
	Duberstein's message of "Tue, 14 Jan 2025 12:24:21 -0500")
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
	<20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
	<3zUeHP9VQ7ZaBieXue_fQ_8V8tcTW1nc83OQA7ehwV7itvlpzwF5DHHmyqTU70UzpXhUKWoDtueUb2fsFQdyUA==@protonmail.internalid>
	<CAJ-ks9mygX61B=FOgQegs3uReBHDju2cs6eFRohjNEX_GPwAjQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 16 Jan 2025 20:20:38 +0100
Message-ID: <8734hid0qh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Fri, Jan 10, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> Add a method to get a pointer to the data contained in an `Arc`.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Can this mention why it is needed?

I can add that after the cut. It is for impleminting `HrTimerPointer`
for `Arc`.


Best regards,
Andreas Hindborg


