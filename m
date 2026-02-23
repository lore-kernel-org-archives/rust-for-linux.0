Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC059329E57;
	Mon, 23 Feb 2026 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867354; cv=none; b=UhL2OaiD4rIIlS6gShqYjXTAH1HFTqjdgKy1DzZo0tVeCNw7aMIwpnrOFs/C3KeBDE1sSEM5th9uh6EiFy4JGLOYfUu3wsS2JPhJsCTxrjVJUB0kwIeYr3CeEOwGvV7e3tXhblonUXjAzfUfWGCKmV5a6dk/NUrDRqq/aIJD9I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867354; c=relaxed/simple;
	bh=k0l/ZW4IF1Bj58qMRwhoQXzuPWSyXxw4ppV0Uz49fuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DWpSwe3lnFr0DqHJ8tMVzc44R8QQgUOGd70yKL3Pp2Xqxkkzkt2zM5LbSjJ++7ttjhhvgigGqTBwke+HMc6EriBeYa8p9+SYJNoAO/K1jnKb0/imt4siypv3BYMlZyoH6b5ka8smvyDj+zYQzJMaZwnsenrhBLKFmlff1K3a1Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEYHJqlf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEYHJqlf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54F6C116C6;
	Mon, 23 Feb 2026 17:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771867354;
	bh=k0l/ZW4IF1Bj58qMRwhoQXzuPWSyXxw4ppV0Uz49fuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PEYHJqlfbsuU/eQr3FiNugHJY2EW5XorP1Ysxk4+v2SYxxYAvN16vthZ3013EKdh9
	 8XLNQ0tTrGkrwdajNVFcWieNcQCDc+IHgwY4DGBbYUyPZEN4hS2+CL4+lTmqq6yJa4
	 lXkVUOWYO0JKbnYxpwraYZ0CfoFraaCPJbZ0QQ9q0crwNw6CvYNyYcBAq8zJ7HAn16
	 sU49V++XLDAuQgKI7ZBIuolGcMHUr2u81+IJuADrwF7jEgbpns04oKNBFakRSOa4yp
	 scP2dll4tp57QDYrpfMnAZHaSWasxGCZTsJrYbR7Pb/I6JYJ00fcs7IxcaIRpGxca1
	 KKcJRR22GHN9A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel
 Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v3] hrtimer: add usage examples to documentation
In-Reply-To: <CANiq72naMNGc8p3GJT6gBisOn7Kv0pU2-B6-O3GPKodcKjzKiw@mail.gmail.com>
References: <20260220-hrtimer-examples-v6-19-rc1-v3-1-ddfc19a90741@kernel.org>
 <CANiq72mHuOU-KCsX5oOH=D_9caN9C-bdKSBL5aq3QciqXz=KNQ@mail.gmail.com>
 <87pl5v32z9.fsf@t14s.mail-host-address-is-not-set>
 <87ldgj32ds.fsf@t14s.mail-host-address-is-not-set>
 <9u8V70cc50GcU39d6ecNVwmhy5ypnFqhxiSoDbA5NGcfM4rbski6YHemnqzhiqc_usNKbr1kf1CH36_2-xkq9Q==@protonmail.internalid>
 <CANiq72naMNGc8p3GJT6gBisOn7Kv0pU2-B6-O3GPKodcKjzKiw@mail.gmail.com>
Date: Mon, 23 Feb 2026 18:22:16 +0100
Message-ID: <87ikbn2x4n.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Feb 23, 2026 at 4:29=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> So, after copying these use statements elsewhere to format them, I was
>> rereading your message and I see that what you actually write is that
>> maybe we should be using the vertical style for imports in examples.
>>
>> The examples would be nothing but a wall of use statements. Do we
>> really want that? I know it is the style we picked for the kernel in
>> general, but I don't think it should necessarily apply to the examples.
>
> That is why I asked if we could perhaps merge two pairs of examples :)
> i.e. to reduce the "duplicated" boilerplate from the imports, and
> perhaps a couple of the items/types that are the same too.
>
> Either that, or you may want to hide them (but I am considering that
> we may want to just never hide them (or always doing so) and thus
> avoid the discussions that keep coming up on that).
>
> As for using a different style for examples, I can see we could save a
> few lines per example, but we would have to remember a different
> convention and we would increase the risk of conflicts there (though I
> reckon there may be not many conflicts there unlike the module
> imports).

I think I'll await broader consensus before shipping another version of
this patch. My 2c is that the imports take away form the actual example
code. I'd rather not have them.

If we are going to keep the imports visible in the examples, I would
prefer to fold the imports, so they take less space. I realize this is
not consistent with the general style we adopted, but I don't think that
is important. These are just examples to help understand an API. They
are not going to be subject of merge conflicts at a regular basis.

If we hide the imports, we might as well go for consistency with the
style we adopted.

Best regards,
Andreas Hindborg


