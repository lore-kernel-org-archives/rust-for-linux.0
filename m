Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538A5625
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 08:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048302; cv=none; b=FPcI91X1kZZ+ShdnwReH4LYmyDkKR9nBFgwgooj6ZErv9DuVXObq2/Fh/ipczs73Ciwxk4yOzF3y6c0b7dsjXHDZyENzw4CjTxc08LkJ9vP5tl01UKfzi3+UkE0ZjAljx/g5JvPI3RGb6mtep8r6J6Y4bssf+juuF1N+wpJGBZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048302; c=relaxed/simple;
	bh=A5F7lsTYr8WzzKN0V1G4Qhmzzhzkqy3tyBEFq5W+5po=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jhode8nesbSlZNZV4BsAp8op5H3E4pxr9Dxnpya3JX5mZa41l74tptI0ROJdMXYjpGzBhoeU4fd9EdLqExCc+ODAVGKYWXEipk7m/2SJeBdsBeS6NuLwsQLT/dhHle9A/Ge5C25v4VdYkjPmYdNqFhWTfN4QLLwmHZbo2cLrk/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtfmutvY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtfmutvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B69C4CEF0;
	Wed,  9 Jul 2025 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752048301;
	bh=A5F7lsTYr8WzzKN0V1G4Qhmzzhzkqy3tyBEFq5W+5po=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=PtfmutvYfdBqAB9pw5+f01vaxo3V9cz3EsypO7g8gg4AyG4D52QfQ8JNBFFZctb0B
	 8FvVjbq9vhADwhK6QuH1yupgRDASMPxrP17Xrbep0B9F/z0fUDMc5lUNg6MOgUhVbd
	 N672+y2KGydlHKxQFdTYfj2/bc4vjsrELIcUvaeSunJT17IqQe0f0UJYp96lYs6c8r
	 AHazA/Kn8ckuVw0xiqGlaf+ZPJQJJKTcEQyd7856EkEqNPasqRkaQ9N53p/KNNaw7Z
	 BsTQhKB3LdgEtapctWBgeqVD7d95+jvJQtm64ZwNCgXbznHFfZXvxCsw3ztPA8Ly8r
	 6r/OtZ0gO5HKA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 10:04:58 +0200
Message-Id: <DB7DACSKLCI6.1YONOEGQZ08T7@kernel.org>
Cc: <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com>
 <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
 <CAPZ3m_hArv5MA7H4RYRj1FHUaaFF9+2QAuo03xhUKGQ-YZ8uFg@mail.gmail.com>
In-Reply-To: <CAPZ3m_hArv5MA7H4RYRj1FHUaaFF9+2QAuo03xhUKGQ-YZ8uFg@mail.gmail.com>

On Wed Jul 9, 2025 at 12:24 AM CEST, Marcelo Moreira wrote:
> Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kernel.org=
> escreveu:
>> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
>> >  pub struct RevocableGuard<'a, T> {
>> >      // This can't use the `&'a T` type because references that appear=
 in function arguments must
>> >      // not become dangling during the execution of the function, whic=
h can happen if the
>> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
>> >      type Target =3D T;
>> >
>> >      fn deref(&self) -> &Self::Target {
>> > -        // SAFETY: By the type invariants, we hold the rcu read-side =
lock, so the object is
>> > -        // guaranteed to remain valid.
>> > +        // SAFETY: `self.data_ref` is valid for writes because of `Se=
lf`'s type invariants,
>> > +        // and `_rcu_guard` ensures the data's accessibility for the =
lifetime of this guard.
>>
>> This also needs to be adjusted.
>
> oh, of course, &T is an immutable reference, mb.
>
> What about:
> // SAFETY: `self.data_ref` is valid because of `Self`'s type invariants
> // and the active RCU read-side lock held via `_rcu_guard`, ensuring
> the data's accessibility.

Sounds good.

---
Cheers,
Benno
