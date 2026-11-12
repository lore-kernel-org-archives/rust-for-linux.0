Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473724;
	b=295Pin6DiD5fS5PQn2UY8ql1Su+Wa1ZYHk7uMrfm7Yda8E7DTP4YJHeJuVv9e6HG3Co1
	 SVyCCOBWV9NW1ep1PoaewVgg/y4rNBlPvARv8dUBM257hUpIoxztaSG6QP+lW/I/qOfeK
	 UHqiPsvmlxQ+KUj7cUW/gKzsFqx4eU+9HguE2yipbhWiEH8REDuK+yq6PkTNZBBpQVWfB
	 JoUfbYaVimeIeysLC15IcLR/CbbRBvrM/L3j+Soxkh8tBrtRnSBDXh/WBfRt4xAWr8IFz
	 XZ2wBHqeNIr1crlKCXDJQ3Qi8aJi0TnavHcTa832yf+0qUn1lLTXGv+YW84AlQqsDIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473724;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=/tlF4suFgWB3YLT3tkIuz/E/f8bGCMYQInm9HkaXt1M=;
	b=STdW6WgkLdL3d++sHgCxygYILyNBU385cng2FDGDCJCPia8Z7aCBEA3IxzfeF8LGUd84
	 NL4PukO1SfQC7Fz5KInLwuYios3ztg5iGioxYCrXMsnvFLAEwnoS5CDp32+LDADVG7KQc
	 UPEHjJm74QE1xIGbnxmOAwCYrjrlBgtR4ZsxK0swQErQCKxO3IzRtCtBawHmefYTl6F8l
	 uxSMcvj9gkHP6dKIvxdVNcougEWlk/1KC6QikyxQHvGrSMrhe3hH0eX9VXN9j03YuM8jS
	 wYAbjh6zZa43Lcs6ugHrybnAiuddWoUG9nt1Yjj4e9EZPmay9c5Do9I4bCg6qiFDWhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gvl6nteJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C5E606A332;
	Thu, 12 Nov 2026 08:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gvl6nteJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9ED11F00A05;
	Thu, 12 Nov 2026 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473724;
	bh=/tlF4suFgWB3YLT3tkIuz/E/f8bGCMYQInm9HkaXt1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Gvl6nteJGPyJS3pfR4zg+GVzIZ5ylC0wabJLdSVZBWfWJ/YX/YZqFAzuqZ6JP5j/7
	 L70XnwICVY+DqS03AM1oiqY0CxTtMXvf0Baf7FihestcLFtkaXSP3a5YVZC6zEHXg1
	 +06vWw6fUKxVA96Vpf+9o8yISsRj2wdlIodiuJdCNCJadq4ah2I+GP60xIb1Dx9We7
	 SMND8zgX3pn4g74ro7MOZi0vPK4t9qypjE6BVMTh3AE5KXTdacMC2bn2LN8iQ6AHHT
	 Lutp8vkmu2jq4iadDubX/kph4ux/mD6z6uwT0JiXEYQr892Vr5lTXjheS+X50hkjc7
	 RTYLSS6lV+KGA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: hrtimer: add active() method to query timer state
In-Reply-To: <20261105.201145.828445900027892304.tomo@flapping.org>
References: <20261105-hrtimer-active-v3-1-52636808ccda@kernel.org>
 <20261105.201145.828445900027892304.tomo@flapping.org>
Date: Thu, 12 Nov 2026 09:55:05 +0100
Message-ID: <87wlqiv386.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Thu, 05 Nov 2026 11:17:24 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> Add an `active()` method to HrTimer that returns true if the timer is in
>> the started or running states. This wraps the kernel's hrtimer_active()
>> function.
>> 
>> Unlike a direct read of `node.expires`, this does not race with a
>> concurrent start operation. hrtimer_active() reads the timer state inside a
>> seqcount retry loop and re-reads `timer->base` with READ_ONCE(), and the
>> core documents that it must not return a false negative. No exclusive
>> access to the timer is therefore required, and the SAFETY comment reflects
>> that.
>> 
>> The returned value is still only a snapshot: a concurrent start or an
>> expiry can change the state right after the call. Callers that need a
>> stable answer have to serialize against those operations themselves,
>> exactly as C callers of hrtimer_active() do. This is documented on the
>> method.
>> 
>> Also add documentation clarifying the definition of an active timer.
>> 
>> Introduce the term `active` as a set of timer states composed of `started`
>> and `running`.
>> 
>> Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> [...]
>
>> +    /// Query the state of the timer.
>> +    ///
>> +    /// Returns [`true`] if the timer is in the started or running states.
>> +    ///
>> +    /// This method synchronizes internally and does not require exclusive access to the timer.
>> +    ///
>> +    /// The returned value is a snapshot. A concurrent start or expiry can change the state of the
>> +    /// timer right after this method returns, so callers that need the state to be stable must
>> +    /// serialize against those operations by other means.
>
> Does "expiry" here mean that the callback returns HrTimerRestart::NoRestart
> on another CPU? An expiry alone moves the timer from started to running, so
> active() still returns true. If so, I think it is clearer to write this case
> directly, and to add the case where the timer is canceled on another CPU.
>
> The same sentence is in the commit message, so please update it too.

Right. How about this:

  The returned value is a snapshot. A concurrent evnet can change the state of the
  timer right after this method returns, so callers that need the state to be stable must
  serialize against those operations by other means.

The intention is not to reiterate the state machine, but to indicate
that things might changes.

Best regards,
Andreas Hindborg


