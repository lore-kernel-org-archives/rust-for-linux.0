Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BBB1EB5F4
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742549041; cv=none; b=dkC6uvXPXJhqTQW/j7ffn3iIFF0jhfMUZEKLPN3hXj2C2NWzC30US1xCQubuKgjb4HSlxDOIBMcV9894Mkx3ME9iT17MA+0WIc/PLilhkqDgogZ74KKODSwRcuSDA15mmXwFzxgmzpbg68ADZnClDMzNduab7bzWjQL5uhcE2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742549041; c=relaxed/simple;
	bh=h1jw/a/az+IQZ3iNVBmt94kRXQ4qbh4zs55yXqznB14=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p5lr1uUv3PiOB24RyAKBJx+meKChjD+8eOxAQI2AL5UBnth9nq+2lxfcZSn1l6ERwcu2s2HwZ8K7rVvWbmKu5Q5mMra838c7kdvYdI2ZuFHqo4n8HMg22eZyCzKzDLMs6Xok1X3EJSRCVDdb6fL96L84C2kDoN3+jqjE7Smoa/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ehdgzc9d; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ehdgzc9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742549036; x=1742808236;
	bh=tAlTidaL9ZFX/5CreHBohcgLbQEVfvTPKzW8H/kKXzY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ehdgzc9dXWfdvFOTHWGz1GJoEJ6lOXuYgmQCCS6pzMhS43QpkS94HVB0cjWfcH1Ov
	 pg/wiLnW67t+kB9HrjJK4DM1KXz10LJKS/EO6t+VbAna1030qleUi69VfJAcrk0Oy1
	 RGq3vmvjViu/mX5bwlXMSR8cGjiV/W9OtDfKMIsBEs33fSfTyHrnqk51WJPIpwULWw
	 lfseV3eitLfnRTYgccgWSETXuCW4dhwhNUwpRPDR1+q7l4BKK8DpDHCGTVKZXpdGk5
	 6ZxykmJUtm0PjRubrGvb8v6HJ1N7g17IOE7uInsLYJO17NZacFIEEogi6ivuR8aaOJ
	 2XOmmAfX6U5Vg==
Date: Fri, 21 Mar 2025 09:23:51 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] rust: alloc: add Vec::pop
Message-ID: <D8LU2SGJ1T4U.1JPJWNV09A5UT@proton.me>
In-Reply-To: <Z90YyLPhil2vBTc_@google.com>
References: <D8LFRQ5IX33R.35U012LFZ06W0@proton.me> <Z90YyLPhil2vBTc_@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: becb8d096c475d5cd085bca86a8335a4a15aaeb3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Mar 21, 2025 at 8:44 AM CET, Alice Ryhl wrote:
> On Thu, Mar 20, 2025 at 10:11:09PM +0000, Benno Lossin wrote:
>> On Thu Mar 20, 2025 at 2:52 PM CET, Alice Ryhl wrote:
>> > +
>> > +        // INVARIANT: If the first `len` elements are valid, then the=
 first `len-1` elements are
>>=20
>> Please add spaces around `-`.
>
> I can do that, but does it really read better?

That's how rustfmt would format it and I do think it improves
readability for me.

>> > +        // valid.
>> > +        self.len =3D len_sub_1;
>> > +
>> > +        // INVARIANT: This invalidates a value in this vector's alloc=
ation, but the Vec invariants
>> > +        // do not require it to be valid because `self.len <=3D len_s=
ub_1`.
>>=20
>> I don't think this should be an `INVARIANT` comment. Maybe we don't even
>> need it.
>
> I can drop the INVARIANT: prefix.

Sounds good.

---
Cheers,
Benno

