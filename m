Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8342B4085D
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727377100; cv=none; b=Xw3hIat7veOnfbQaripef23GZSqkEWPOSVQSyiVbMYvPVmnjhXMw5iP4urk/fAB3gd088XuvGcGB0243RHPcGUh4D/hHTmAXn7LIpJT9InZcMf15Vb/3KkepX60F2/R8hDXG6mX3PvXjASQpG1dX9wbx9QaF49Af5Yzv2JYuWF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727377100; c=relaxed/simple;
	bh=nFOuKnkaTmIkn6GiEorRCB9FV+6ha31zO84j5crpkY0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fvQLbNChMU8MZ1Gq6Gfl1F5PgycUfW1BA9vS+JdXX/Q8lDWPc7Wy9D9Som8XIPzaGN+8tS7iirpvjBcqii7vjfxtKF7OvR51be+XWHInzeasyMTpkUEQdb3WSz2vSz8VajmIdhaXImu1yr+r7bbJ4VmjwNjnoAlO/zgwKxqcvgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=eNmc+Qah; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="eNmc+Qah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1727377096; x=1727636296;
	bh=MY/ZvB0yi1dIucSZzljqvB4KqcbC9zKa10VJMi+Shxg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eNmc+Qah1iuFhuit9fCzpb6eaSuWVKd/NfqP3FMLfrcWo4BUWyIeXuCFbpIrEmxVN
	 9PMyLF922uEhwE7eiMZHag8WGBlNsQOqwWcZt+3rja8XdjSmJLkEQ0RjHWM6wfFGgE
	 RP4JfL83yNIbpWEYFWqyTXlTzURzyorjQdoxGLgEmXn9oOqewdqdYbZ0+gILeLVU4x
	 on5u9vzC4nnwCPY1GcXPprlpelP0o23FE0G8ceUoyCEf0gl7XbDUa6Hvh9Y6gVDkqe
	 1T2bf4uU5JlWcjdWyX1sJ/D7eVnB4P47r/5HxtcyFNX6/3uQqt7DBxtBmuOM1t7cVD
	 I/XatSfu55B1w==
Date: Thu, 26 Sep 2024 18:58:10 +0000
To: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Miscdevices in Rust
Message-ID: <f7820784-9d9c-4ab9-8c84-b010fead8321@proton.me>
In-Reply-To: <20240926-b4-miscdevice-v1-0-7349c2b2837a@google.com>
References: <20240926-b4-miscdevice-v1-0-7349c2b2837a@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b96f335b3237fcac0256ede9a308460b398ca769
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.09.24 16:58, Alice Ryhl wrote:
> A misc device is generally the best place to start with your first Rust
> driver, so having abstractions for miscdevice in Rust will be important
> for our ability to teach Rust to kernel developers.

Sounds good!

> I intend to add a sample driver using these abstractions, and I also
> intend to use it in Rust Binder to handle the case where binderfs is
> turned off.
>=20
> I know that the patchset is still a bit rough. It could use some work on
> the file position aspect. But I'm sending this out now to get feedback
> on the overall approach.
>=20
> This patchset depends on files [1] and vma [2].
>=20
> Link: https://lore.kernel.org/all/20240915-alice-file-v10-0-88484f7a3dcf@=
google.com/ [1]
> Link: https://lore.kernel.org/all/20240806-vma-v5-1-04018f05de2b@google.c=
om/ [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Alice Ryhl (3):
>       rust: types: add Opaque::try_ffi_init
>       rust: file: add f_pos and set_f_pos
>       rust: miscdevice: add abstraction for defining miscdevices

I recall that we had a sample miscdev driver in the old rust branch. Can
you include that in this series, or is there still some stuff missing? I
think it would be really useful for people that want to implement such a
driver to have something to look at.

---
Cheers,
Benno

