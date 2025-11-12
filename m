Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6814D325498
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131719; cv=none; b=ng4ht0i4fbqDhdM1GoTejqpN4r4OLnQUTWv+VyTqDxS4foi161q878Yd3/NdIGeUa/UVoc71DDkkz9L3B/hMVeFA/qTgOp/L10mBiE81L/6iHZTB4WsM73WRXH4ASaL6N0P/652FNz1gz0QCPUsLZ8QnMeKYokyUJf4XPjaqu+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131719; c=relaxed/simple;
	bh=q2P8dJKgCvUEVCk7wNRTKyFO7jkc+S4yKh8bhu/y4Tc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QMo9E88wmfaanOItpn8utVjwZDGzWoASrRhpZNq1MzDWZCA/41XJ4T7+STgtOsFy9tCFQnLGBGPk/LyX/FiJwtau9xdzxnlCOdW8v3wrMSBsnUVAuvWl/OrxXMU1aAxxHU3P8udQKW6M6j2jGck+s7VPBAoIpRoVEnBic9YTVOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5Ao/VJK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5Ao/VJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CCEC4AF09;
	Fri, 14 Nov 2025 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131718;
	bh=q2P8dJKgCvUEVCk7wNRTKyFO7jkc+S4yKh8bhu/y4Tc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n5Ao/VJKFtjYMQGHmnW6A1j5V9D8hNyiphrTI2VY1ZwLXHWy+hXEKseI/xc1Ctiz7
	 a1BTmIyuFhv1TIrDxvEz81tzaCeDVhN3JeofPglXzJib7g3MK5D3PyAuS2TXeykq3g
	 p0fyI2iDGQSMsKjfCzcpQGeXWN353YK8vBL4kfDcEszJMrALqp+E1HapdnJOjEtARa
	 gefSaCqSGyccJ9UTWTXwaPdAkWO2q5/9ws3GEzU/ZeYU0sX4PVcuFJg3PUdN0+u3Eg
	 6lm2bBpIy4RAoaGQeZH382HPQaflGQwpoPaTd/1dH/Z/op1NfeYuiAjNx8Bfz3l1wv
	 WyWK0RwtNY4+Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
In-Reply-To: <aRPjNS9jIsyHGAPl@tardis.local>
References: <aRIPgOPvi4uhGQcM@tardis.local>
 <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
 <aRLG1Ofr5QpJGFaB@tardis.local>
 <20251112.064349.598094996228184902.fujita.tomonori@gmail.com>
 <aRPjNS9jIsyHGAPl@tardis.local>
Date: Wed, 12 Nov 2025 10:10:14 +0100
Message-ID: <87bjl77h1l.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Boqun Feng <boqun.feng@gmail.com> writes:

> On Wed, Nov 12, 2025 at 06:43:49AM +0900, FUJITA Tomonori wrote:
>> On Mon, 10 Nov 2025 21:17:08 -0800
>> Boqun Feng <boqun.feng@gmail.com> wrote:
>> 
>> > On Tue, Nov 11, 2025 at 12:09:49PM +0900, FUJITA Tomonori wrote:
>> >> On Mon, 10 Nov 2025 08:14:56 -0800
>> >> Boqun Feng <boqun.feng@gmail.com> wrote:
>> >> 
>> >> > On Mon, Nov 10, 2025 at 06:21:50PM +0900, FUJITA Tomonori wrote:
>> >> >> On Fri, 7 Nov 2025 09:03:01 +0000
>> >> >> Alice Ryhl <aliceryhl@google.com> wrote:
>> >> >> 
>> >> >> >> That's my point (and probably also Andreas' point), we already has the
>> >> >> >> type `SetOnce` to do this, no need for a `OnceLite` type if not
>> >> >> >> necessary, and the fact that it can be zero'd by debugfs doesn't change
>> >> >> >> it as I explained above.
>> >> >> > 
>> >> >> > The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
>> >> >> > three different states, but OnceLite only needs two. I don't think we
>> >> >> > should be reusing SetOnce here.
>> >> > 
>> >> > I mean 3 states should cover 2 states, right? In this case we only need
>> >> > to support SetOnce<()>, so I think it's fine, see below:
>> >> 
>> >> Yeah, that would remove access to the value member, but I think that
>> >> init member could still be accessed in an unintended way.
>> >> 
>> > 
>> > What an unintended way you mean? Do you have an example?
>> 
>> From my understanding, the init member of SetOnce is designed to be
>> accessed by using atomic operations, only through its methods. If we
>> use SetOnce for OnceLite, however, the init member would be written
>> using non-atomic operations, which is what I referred to as the
>> "unintended way" since I don't believe Andreas intended it to be
>> modified in that manner; i.e., not through its methods or by
>> non-atomic operations.
>> 
>
> Ok, the "non-atomic operations" seems to be a distraction for me to see
> the real problem ;-) Let's clear things out a bit.
>
> First of all, data races are not allowed in kernel, but kernel has
> special rules about data races, namely, a few operation should be
> treated as "per-byte atomics" so that they will have defined behaviors.
> This is kinda a gray area, but it's what it is.

In general, I would assume that a 32 bit rust atomic read racing with
"per-byte atomic" writes to the field is not great. We would risk
observing torn writes?

We could use a u8 atomic in this case?


Best regards,
Andreas Hindborg



