Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE50C308F15;
	Mon, 11 May 2026 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509380; cv=none; b=Gwg6ciUr9OgGQyEecKqOpwqhZ5nZdBdN3sHYWo5FN8ADKlSsZnC7zY6VkeAFlVgPY1ggGbzn8j8zCKrCXJux05CoOOeaLgyVNuCGLVt0dPaiccljgiILLPvoYtWRwJPDxJB7b2a8BXjFHIhZe43x3DA9PLw7ZQLrs2LFKPsfMYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509380; c=relaxed/simple;
	bh=xDWDr3t0OAC3xlyke5VaRoHBlHf3osy3Akp6VsKpgY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fIvOnZkE4EVWYON5Utq5Yl7uwi4kyd5+6sNOV6XxAG9gTp8pPqQ7XIk5+qNX+PmXVvkL6eWI9jBpGmx0u8Ym747QFCnzkxbQwCLL54opH4GCDuuzHIls0dDced7BBjGrg9xLl8ZrZ1fPJjqF2lk0N2im2bPZeao6Gqu4+sYMmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLPjm/0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLPjm/0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25884C2BCB0;
	Mon, 11 May 2026 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509380;
	bh=xDWDr3t0OAC3xlyke5VaRoHBlHf3osy3Akp6VsKpgY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MLPjm/0AB3CpnXfs+zzIXAO77QPZLMaW2hTBI00D7jNQoNwYgWCqFMD8BCctA5L+5
	 d0DL7eOrkgxvOdl9iz5XwvMdsc/Me06BvV+ho2jhR1dVDRimzQ6b06zfziJeoWYs1J
	 trQJ2S8zWGwuyp7ImC1Mjqw1L3rAECgxZmamF2Typul6cft1bIwiE+ua3UMHBRLWes
	 qrQ7CkpFiwoO19xOPNNN3SxN7c3FxqPQqcjYx+Hnfd11/1FQ3Z3PeL/degx3n2wvV8
	 V9uMZpkeT46O5c4KTTBy56ZuMI1K2fIMDJuuglvCEH2PzX8cK+p2jP6Mhszd5mNA1D
	 ddk9m2H3EnPNA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: time: implement `Display` for `Delta`
In-Reply-To: <aZLWjBWaBz4h4_SB@google.com>
References: <20260215-time-delta-display-v1-1-bdd2d6e98ebf@kernel.org>
 <aZLWjBWaBz4h4_SB@google.com>
Date: Mon, 11 May 2026 16:22:49 +0200
Message-ID: <87ecji58li.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> On Sun, Feb 15, 2026 at 09:14:05PM +0100, Andreas Hindborg wrote:
>> Implement the `Display` trait for `Delta` so that it can be displayed by a
>> formatter.
>> 
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/time.rs | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index 6ea98dfcd0278..e18fd17f38c5a 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -474,3 +474,9 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
>>          }
>>      }
>>  }
>> +
>> +impl kernel::fmt::Display for Delta {
>> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
>> +        f.write_fmt(kernel::prelude::fmt!("{}", self.as_nanos()))
>
> I think this can just be
>
> 	self.as_nanos().fmt(f)
>
> Though I think it would be nicer to include an 'ns' suffix here so it's
> not just the number?

I was planning to use this to format a delta to output via a configfs in
rnull. The existing C driver does not include the "ns" suffix, which is
why I did not either.

I am not opposed to adding the suffix for this particular
implementation, but that would mean my user for this code will no longer
be a user, and I would drop the patch in favor of another solution at
the call site.

Please advise which of the following make most sense:

 - Merge this patch without a suffix.
 - Iterate on this patch and merge it without a user.
 - Drop this patch for now.


Best regards,
Andreas Hindborg

