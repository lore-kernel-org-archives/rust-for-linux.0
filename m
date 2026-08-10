Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A93B3B0595
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361383; cv=none; b=raRJOACDaxs37uRuOXtV3jdxv1XuaAUwTzIn92N9Jf5ZtMcImSttHZc6cdBv0pKsbDjAz8N4XN3xE8Lctfww76Lz3V1Z4o4zeM3R0jb7WESE2qFQ0USQ3yW8BIg6JgHYWWq9dGgR2kCAtUGxgseTog6tjmlpl/PSHaStZY5R51k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361383; c=relaxed/simple;
	bh=T4vd4wz9oV7G6VsMIJbSEajg0GHFwdqUG/LgEUCH/ZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F00qJgfdIt6fTZvac3/ko2jdLqmWFtLJ57LyEqG2TmMSL/V2+I0h9hnspj9aozYVEkV5hBRtcjIUt4t/RyauEMrRXSH0Q2PshkUP9l9LpfX7YExNgI/Rj5orshlE1gBhitG7teTjPodfz1TX1c35IoNhkmh4MfiR+Ay5B+NRT9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfY+zrs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfY+zrs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955101F000E9;
	Mon, 10 Aug 2026 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361381;
	bh=mM7Ga8Q2b9liUe+sf8u7Yerni+FXio1NjKmPiJcejyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MfY+zrs2hD5OPPkMhTL6065dwjDKXYmHbRGv3K2NICf7JIlSyIsAND48QQtRziF9Y
	 WVfFfFsXd2azCUbH9XgU1KCDFR8f7JQtwRl5126p8u2s/TDPREV6ebQhtMxlHqUvxq
	 ItMYpKRKLJCiN/VNEucqsHNdqBYHSDkviHcQbctfMKInwwwLqoaKZKYoJq2VzsWn8p
	 BMv/7tJhjCjLnOloq96t+gQEpSgY1iaIKhdWU096Nu9ax15Fy/dZ3qhQpqFgow3zJL
	 4VXLjraG2Q1dy1UvZrnaOla987TSbBTfs7s1EF1pDF74KCBM3idRjEFN49fNTO8W62
	 sHrDFi7UOKUDQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>, FUJITA Tomonori
 <tomo@flapping.org>
Cc: aliceryhl@google.com, arve@android.com, boqun@kernel.org,
 brauner@kernel.org, cmllamas@google.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v5 1/7] rust: time: make Delta generic over its time unit
In-Reply-To: <DKK236MNP2NH.MFG9QEPIEH1M@nvidia.com>
References: <20260806073241.1024319-1-tomo@flapping.org>
 <20260806073241.1024319-2-tomo@flapping.org>
 <878q6j4m8a.fsf@t14s.mail-host-address-is-not-set>
 <20260807.211008.1388653306665929214.tomo@flapping.org>
 <DKK236MNP2NH.MFG9QEPIEH1M@nvidia.com>
Date: Mon, 10 Aug 2026 13:24:56 +0200
Message-ID: <878q6e2p6f.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alexandre Courbot" <acourbot@nvidia.com> writes:

> On Fri Aug 7, 2026 at 9:10 PM JST, FUJITA Tomonori wrote:
>>>> +
>>>> +impl TimeUnit for Nsec {
>>>> +    type Repr = i64;
>>>> +}
>>>> +
>>>>  /// A span of time.
>>>>  ///
>>>> -/// This struct represents a span of time, with its value stored as nanoseconds.
>>>> -/// The value can represent any valid i64 value, including negative, zero, and
>>>> -/// positive numbers.
>>>> +/// The span is stored in the unit given by the type parameter `U` (see
>>>> +/// [`TimeUnit`]); its value has type `U::Repr`. `U` defaults to [`Nsec`], so a
>>>> +/// plain [`Delta`] is a span in nanoseconds. The value can be negative, zero, or
>>>> +/// positive.
>>>>  #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
>>>> -pub struct Delta {
>>>> -    nanos: i64,
>>>> +pub struct Delta<U: TimeUnit = Nsec> {
>>>> +    value: U::Repr,
>>>>  }
>>>>  
>>>>  impl ops::Add for Delta {
>>> 
>>> When you add `Jiffy` later, this impl block will only cover
>>> `Delta<Nsec>`. Is that intentional, or did you intend to support
>>> all these operations operations for `Delta<Jiffy>` as well?
>>
>> Intentional. Delta<Jiffy> exists to carry a jiffies-valued timeout
>> across the C boundary; it is not meant as a general arithmetic type. I
>> can add them if a user needs them.
>
> Is there a reason for not doing it now? Common arithmetic sounds useful
> for any unit, and since they are already agreed to panic at the bounds
> we can constrain them on `U` implementing the corresponding traits.

I agree, I think we should add these. Unless there is some reason
preventing us from doing so?

If you guys are in a super hurry to land this series, and if Miguel is
still fine with taking this so late, you can add the arithmetic next
cycle.


Best regards,
Andreas Hindborg


