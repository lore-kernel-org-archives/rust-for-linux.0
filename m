Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04FC29994B;
	Thu, 19 Feb 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498106; cv=none; b=TVcUzKe+kObRPkAy8+9mH6e0xOAs4vyxeYj5IarVksTsLcT75EK24c9HL1XhxvBvf0zisAHNqX62pbrT673v7MUlc9TXcbOJnwgYEuG4l5jR9+oP0a+YFnoo7yVK+evaQsqVL0IWHGZKiaKe0xCO2onuV78XY9dLticNrdrxzZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498106; c=relaxed/simple;
	bh=WaEZapfDam7Wtdhp2lbmuP6LwYDYFFll03aQ1ChR1iY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=brC3Oz2ZpW1B4fZAEFxGlZYusriIQKWia8XhlAglLqLL2vXOYni6scZdFzSzOttbNKkF0TWGNt0JcWvsnvpnfHjXyTLsasuvjTA8/34ZOqyNDxnaxdhbThhKa3ZATqkxD0jSfx2tEvw6gGu2HCNSYSuf2cnDJkvG/FX96OwqJhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOaztxci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOaztxci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED57AC4CEF7;
	Thu, 19 Feb 2026 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771498106;
	bh=WaEZapfDam7Wtdhp2lbmuP6LwYDYFFll03aQ1ChR1iY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BOaztxcicx2FC6kEQiMVpfDj2PCPrXVDZzMIjq9Bx4N2nhMKeJnWvH2Jq2Z7+1De5
	 KTMgxbVHxLe8hBPIYN2ZjSMsUE0BEO8fYNcSCHt+HeAffzulcaWOwH3uhPtTZgRYoP
	 zAE0EBFRF4y5A+WSm2YNNAz2jXrP8U/ezV2VRuorPaxlVuJ70nm5PCFTPonGKTKqJh
	 BOTZvhvfNh0dErVHZ9Cq96WaHw4+IGfjkTZOzfbUi9Ct6iqNRnQYXjTgIVf/9dQvOF
	 8JZk98odLspQL4+1AXeM/0PrACDhuMD1ZoPncNnfw/Y4AbaGXxbWNJPujY3P2sJ9HY
	 1nFx4/zHkQeKw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 boqun.feng@gmail.com, fujita.tomonori@gmail.com, frederic@kernel.org,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH] rust/time: Add Delta::from_nanos()
In-Reply-To: <20251117.103923.1643210589533849785.fujita.tomonori@gmail.com>
References: <20251114184207.459335-1-lyude@redhat.com>
 <20251117.103923.1643210589533849785.fujita.tomonori@gmail.com>
Date: Thu, 19 Feb 2026 11:48:17 +0100
Message-ID: <87wm099fgu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:

> On Fri, 14 Nov 2025 13:42:06 -0500
> Lyude Paul <lyude@redhat.com> wrote:
>
>> Since rvkms is going to need to create its own Delta instances, and we
>> already have functions for creating Delta with every other unit of time.
>> 
>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>> ---
>>  rust/kernel/time.rs | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index 6ea98dfcd0278..2b096e5a61cda 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -363,6 +363,12 @@ impl Delta {
>>      /// A span of time equal to zero.
>>      pub const ZERO: Self = Self { nanos: 0 };
>>  
>> +    /// Create a new [`Delta`] from a number of nanoseconds.
>> +    #[inline]
>> +    pub const fn from_nanos(nanos: i64) -> Self {
>> +        Self { nanos }
>> +    }
>> +
>>      /// Create a new [`Delta`] from a number of microseconds.
>>      ///
>>      /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
>
> For consistency with the other methods, perhaps we should also mention
> the valid nanos range in the comment?

On second thought, since valid range is any valid `i64` value, I don't
think this matters.

Best regards,
Andreas Hindborg


