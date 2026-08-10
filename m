Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295B326923
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 02:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786328647; cv=none; b=QtcL2n8BWa70USMn6TKeyInxi51e9Xhy3fsvCUtGpCgz8xmPQOrNy3F/96xI9Gx8UmMjtzzavM/gfziaQsVf2+nOHIBq9gxiJhThlwQfIOD0/YqSaa5hZ4pxmIfp03jL3qAfYBwOE8o3P3hN2EhLLduS7QMkY5rKG2QF6I6HY38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786328647; c=relaxed/simple;
	bh=Tjt1+GH1KqzZJsG1E7avwVeWXUACulXMoyWHYKT1iX4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lJq5qiRwFlBxpNuXxmrKAZcEkdNpG4GThoaysE0p5RNL/JALRcF21hS+8yGt+BjVivI3RCzD4O5P2kMpOr+eLB8qQUhdK7CPfVqA1qLKe/p9L59mFR9TOmYPXj/9VYgDA9fUIoPjsrfNNc6ISQ4S38EgUTsDdACpnKkP2blEcKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=aOa/zyED; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CEFJwXO0; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="aOa/zyED";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CEFJwXO0"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.stl.internal (Postfix) with ESMTP id 354BD1300167;
	Sun,  9 Aug 2026 22:24:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 09 Aug 2026 22:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786328644;
	 x=1786332244; bh=AKEtcbxlqfDDM9/1+18OhcGVY1iYjbdgpCz3dGuBwdw=; b=
	aOa/zyED8nhSgFq0ishptM24w4CKtWFIY5xsq/947aukdnjMbL8SuFHcYLSHXzOx
	u4aGDTwQxWzSuSJebQdcvkGdX832D/dVlzXafrwz6yMcUwu4nJhxWT1hncEDojzO
	8zjATnBajxILzg72kzdCHyZRrtEO9HaXWERsFjUjKOrAfEts+WLM00qGqwAMNTkY
	qB08HPFrYGlsQBZ8cJDVaaWjBFW+C0rKOfpuCWNj/IEsPHvOHwRQVCOn90znFjkA
	zNaRq5FvH64+sew7MgifYs3dbPqESmQrzSayTSJtUeGa6uyitVCzPnShXxNzyZxU
	9JLa8xOd3WujoIfHSrq66g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786328644; x=
	1786332244; bh=AKEtcbxlqfDDM9/1+18OhcGVY1iYjbdgpCz3dGuBwdw=; b=C
	EFJwXO0w1+63+RFmr/X50U8i5S+9M4ePfIUc4RJXnS9F5YwSunf+KEeZHeIbk7dA
	HqSXPz76ZmYklagBBtf+iUIyk7rps8zcvAWUnD7sJwqN+rs+Vpeza3Xa3GXHqKEG
	rUjhdiU+pSPw8wZZ9j4g17PyNY/V1Jd2CBI3uUlO3cHR7r7ryzjvMr8yolKiqyfF
	/WRaIkvphfcqenvounppHJgb9iOB5c8kAgAwzTXaC8Hp2qyIkyIkNjmDOlbWUrWU
	2yXrzDAjDezjwqdzZ+k1TBu/vpurASau0SL997+Hm0UaTKIWowaOJACjzsTJgACG
	sd6Ig5OaoA331qlgnEeRw==
X-ME-Sender: <xms:QzZ5aj9qNyhNE81Ydq3Jvnh4vyMY9MBF7UKxHiOPYOoRhlLsGAu8rQ>
    <xme:QzZ5avlVA57umiI82I-MG6aUy1r0Dzw7lSOiyn_czZMH5YeWKjfBf5_nUn-z0z1vj
    gbCrS6h6LWqYToplIAfB31cPy_cGzzB8fAE-EcdXJ6mVIxwKMBctvxq>
X-ME-Received: <xmr:QzZ5auVXDc24bITLf334CtCStwOKPHoH56idcSD68GXbTwfBw6fg2BoeY5nHClQBsd8O9t57OWXecUUYSVd_leQS>
X-ME-Proxy-Cause: dmFkZTEgVdwXy1JCWfnvAj0CmUpqt3Tv7D9PDXmbkOEknWwHFqSBkq/LISOpQJ3Zhuu7si
    yKNWi6/kLgj8SJtq7eiY1b7AyPh7/RjzKAU+u7QBXrIcNzz5u7JrSbJg5YQVVdhu3ynr/5
    ENJuaQeeWNXR41WywF05iL8YxYDGlO2pyPu7j+1ITVCMFHfBFM8cKzI9iQDXy2dvKxK9k/
    t0Uwd0yuJXjnBovQdNb/qyw8DOWZubyiHxDc8gy8VEd3xQH2t7SWOZ05odiP8oahmVO+GQ
    w2BQAKZ9NQzZAhli4YCDmuuLABC433Q34VeuHPloPWm/U8y1ypjD5GImrPj6uLRR1KxGJO
    Dv0bzpfQEZMcf5ZVbZBQnWY99+Ma7D1c5f11wjbPzI8NdXlrJeJqeWN5i7g6uh9A/lv2ZJ
    1p+3/AqMWDDcEzd0bq27VdLgOTmamlSlDv0D1X14zNlyGqgJ81s1SQZ3NYtbY8CBljnc/f
    oB8yx+qBXLZMtvBAubgiNSQYIkKi1RgcQ6IU7g6pflU9XNYzLAf4HNbhfcza1BGURcHym9
    FS0uzDnYGDS5SV3zq1g0fc5w+nzjKurGd6eof7tXmydn4Djk+GdWjrkaEYFsOmxAkc+Ev0
    xd6r/RMVfKupgVINu/R1+Owu1ldFhxoV+e8+9g9kNAUuLQvtEhWtXE6zDlXA
X-ME-Proxy: <xmx:QzZ5arrhctD4AAcygBu4BZsXAOl3NGwozAtZ2d1wshJZfbLJ2CRWrA>
    <xmx:QzZ5alUNt5E8D6ngkdZjCblcA52OtxiGGGPiScur4muny9M-GOtmPQ>
    <xmx:QzZ5ajBRIdT8sRsvXLnTyPHvTnkhR3hkgUaYH7M3adfbU_O2rJDbow>
    <xmx:QzZ5ahVtsdeQv4DovF0L-EDenLpKrAIaYcP3SM5-qD8KC60wSNhxSA>
    <xmx:QzZ5apIJ-tc16CZwhCk5wDGE8YSJ5oy_o5wgW69r9vN8v7FPodvjYo9a>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Aug 2026 22:23:57 -0400 (EDT)
Date: Mon, 10 Aug 2026 11:23:55 +0900 (JST)
Message-Id: <20260810.112355.268188462246300198.tomo@flapping.org>
To: acourbot@nvidia.com
Cc: tomo@flapping.org, a.hindborg@kernel.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v5 1/7] rust: time: make Delta generic over its time
 unit
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DKK236MNP2NH.MFG9QEPIEH1M@nvidia.com>
References: <878q6j4m8a.fsf@t14s.mail-host-address-is-not-set>
	<20260807.211008.1388653306665929214.tomo@flapping.org>
	<DKK236MNP2NH.MFG9QEPIEH1M@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sun, 09 Aug 2026 11:26:49 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

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

I was planning to do that in a separate patch on top of this series.

You are right that `Add`, `Sub`, `Mul` and the `*Assign` variants are
straightforward. `Div` isn't; unlike `Delta<Nsec>`, `Delta<Jiffy>`
needs no CONFIG_64BIT split, as a single shared impl doesn't work.
This part needs some discussion, so I'd rather keep it out of this
series.

