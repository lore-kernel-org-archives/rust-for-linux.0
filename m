Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C710C47DD48
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988600; cv=none; b=p7IVETyABvAalkTtc4DGvrKgf90RbQpfDGCoHHWJ2K7sRjftt9p1I1F/pQx8l/m8VAa8/E7KAkwgXv1sb7FFt2LFwJ82/b38QwiFSpzWh7VPAwoBLBGPXmz4OaFdz9BMZ1eDBVCl3s5y81c584jhfQA3DugkvIWK6GTlXOGFS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988600; c=relaxed/simple;
	bh=3PVaLrkQxd9sBpXqLUr2+Su0VtexTjoqxXVEfuvUubc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=plHYAZO+FuNIITY9Jrh1wy0A2oHGK+GcM1aWgWDAmSdaITvLMoFdp2shjtzIC5XH5sk76TujROiNpX/kTTe1XceFde6XcwTVQMUt7h+X+ayREvtsHIS+m7y7HqVz/8BxTvYz6I0HcDvih7WZIRW/1Q2AZNF0qobmD65OWyVEqzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJwzKEqT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJwzKEqT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94586C116D0;
	Wed, 21 Jan 2026 09:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768988600;
	bh=3PVaLrkQxd9sBpXqLUr2+Su0VtexTjoqxXVEfuvUubc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PJwzKEqTpxltz21m4fvfSEDC2XMk/RjjZmn43PEIzzNr5FnQAAC6wTsUvYlrxjQnV
	 CPWKANG0qCDo0bjkaBiu0zr6YxEdXGU+vs8ZI/WhQirvn06k4nhvqIc/cggUQsvKlM
	 DXWPBJsm9TuXM23p9rl3++3vimPLoz8o5m3s9TUCzewwEE0nvhG9jFzK2MXXbcinzA
	 Dbs/4K05IJSyE5IIhuaGjTuHLn6F//ppwsWgCjZe29hzRIZmIRzrDlFbHakDSSAPXu
	 8P8XYmE7gDX55kN+lrAQtDybSFIcw7gRNOajRzHdcSCSHWKg53cTbamzgcREGElLR7
	 76CtgXb14+Mww==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, ojeda@kernel.org
Cc: aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: time: Add Delta range constants for time units
In-Reply-To: <DFTJPKIWK06S.3J0C75Z4RHUY3@garyguo.net>
References: <20260119233621.3465304-1-fujita.tomonori@gmail.com>
 <KPB3FIcVMpT7PQ-Zg-0bQVF4nSfqiVuhuzot88r7jK8LruVydZSqJRtFsvpBazN7-iJV8NL6ZLPzK_RnQMHV5A==@protonmail.internalid>
 <DFTJPKIWK06S.3J0C75Z4RHUY3@garyguo.net>
Date: Wed, 21 Jan 2026 10:43:02 +0100
Message-ID: <87sebzti6x.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Mon Jan 19, 2026 at 11:36 PM GMT, FUJITA Tomonori wrote:
>> Add MIN_*/MAX_* constants for Delta::from_micros(), from_millis(), and
>> from_secs() constructors, and update their documentation to reference
>> these constants instead of integer literals.
>>
>> This improves documentation readability and makes the valid ranges
>> reusable.
>
> I think they're really just their for documentation purpose, and we shouldn't be
> expecting anybody to use these constants.
>
> I would rather just drop these constants given that we already specify the
> behaviour on when this is non-representable.
>
> If you have a geniune use case of these constants, I would like to see them, and
> they likely can be replaced by something else?
>

I specifically asked for these constants to be added, because I do not
want to see something like

  The `secs` can range from -9_223_372_036 to 9_223_372_036

in the documentation. It is useless. Reading this:

  The `secs` can range from [`Delta::MIN_SECS`] to [`Delta::MAX_SECS`].

makes much more sense. If the reader requires the actual number, they
can go use the constant in code, or they can click through the link if
they are browsing docs.


Best regards,
Andreas Hindborg


