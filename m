Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781521991CB;
	Mon, 17 Nov 2025 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378167; cv=none; b=Qw6EcE/NqajiOv/zAjWVOghFLEQU7/wRYMaKB0hXJhdH2Rx/nJVyOzzOSmIMp81aepGadNhMWXGWfyuJ0f4p5KnLIXJwssAKMEQOTTQ2t/kSo6Gt2OpvUtggv4xOqfnYt6AjOYKyBct6G3l7bhPIOQNxVeUKFtcLVpGGjCqYhkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378167; c=relaxed/simple;
	bh=+3eEHmJchsn1CgTILfWy8tSswB/U9JLe6cYBmoENMU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oUlenvPyIudWJxvyxb2XafN7xbiJ879r6YrqiUgbFPliH6Nuxp9qhf1DUSzAtN0iuo2+UookeWgaQ0v6MzI1Q508Bmw/BNXvHOwdnQ+s/r+LOs9YwZtVNVnHV+tqhnynO/5X2gT8n1Ov8jMOuI3Ym+QSJyCI4+7vzGr34hwDk9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M59LWyPs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M59LWyPs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05899C4CEF5;
	Mon, 17 Nov 2025 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763378167;
	bh=+3eEHmJchsn1CgTILfWy8tSswB/U9JLe6cYBmoENMU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M59LWyPsDYp3FpGOQKqh4VqayJ7taBiuntOx1NnRQPoOelHqmwxbT0b+YxYB/cOI+
	 q6gxAxSEtcZz9/Fno97JVfUTzBr3YrpRr9n9gFTsiSGMBokAe1LsAI8P6pmQRY2JFe
	 ASeXJhpcWHjQ9oxAOudsiYvSQUwMgOgx//E4xpE8pAH6KxIL3cF0ODXk1UH/LpNHV3
	 TDXvT426+znCHlt4oyUZZwgQK64wlxOCbUs2rA2p5dGYowUcgDUFmwM41w00JA+Ol0
	 JF4SkY/N0w7BO9G5H1EyzmqmBAspu+czPBv29TTepg5EDwz/TFj3iCDcA3AUUVUmrs
	 03dbDtECdsJJg==
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
 <s3el1v7RYQ-WQ5Kp3rzmGOYYtb6no2PNpOwP5VaxXPRWxotPbXLlRNW4qPIf1eKTuq9WmhhwGhnE5Mjf3OLa9Q==@protonmail.internalid>
 <20251117.103923.1643210589533849785.fujita.tomonori@gmail.com>
Date: Mon, 17 Nov 2025 12:15:53 +0100
Message-ID: <87h5us3o5y.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

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

But, please make it a constant instead of an integer literal.


Best regards,
Andreas Hindborg


