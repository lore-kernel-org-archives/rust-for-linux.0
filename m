Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14567433A9
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Feb 2024 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707388637; cv=none; b=YHYl/3fqAlsztyihbsvNi1+I5UdZeEceTrC+q5gqnjajlI+Zzh0haUygQPcSE4GvQPZE7a4jskrfVZSsMwzHjZSo1M4L/myOrZXVxOnxXggsjFhGm7hQn45FWW4Jx3mH2noJFPmVx0cShe4W3PVPMN/+jEedoyNNbq6W2mHTZcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707388637; c=relaxed/simple;
	bh=cNu5sA6fERZMA9W4q3lH5iPjBTfz73q1guO6FxEgLeU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A45cHrbckiokjfTOWGMb8h1JAYo7mjmP/b0X38EC3fhHUHUKg5NqTrHoEhb3NubdJbXVnFjAABpLtsuw8LRDbfnp7qPHGZWMlazsZfHWxLDxzVZ4SvUKVnwcBM+yl/3wjcx/ZbLzIvpIG0gjXNpirSUYnKpFNO1NraUHQGm0Yxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=d/Jq8vtB; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="d/Jq8vtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1707388626; x=1707647826;
	bh=rPykoucvkZsYaTMZrK8P8EUG/coz9HKX28tpbc64dNQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=d/Jq8vtB7QAeBljLoQcvoYh4Myfe0jb2EvYYplbEFWq2uE+P6OuB5gXJe80GFWF99
	 2H0Xl5auIhTAYSxvT/BGsfK+J3uiusRnfJP13TJGNOhOFMufjQDblti+3Gg4EPreE0
	 13u3tM1MHH+e4nqZ4ipVXeCU3Lh52eYM0IIb0LcHSF/6e8U9LxwMiSx1CdJIQfZ8TM
	 ZCxBqF8M1AEITW9/xfkekWRX+RQteap03Wc/m+3vVj8OVXhBcJRNhcARMX38obTKp8
	 bJvpcpeSf3JRmxxmxyoiZFMrxVTuDJ910jKgCXGdppmqKsn+P+bDVmdtiLHwleFZmH
	 88dNOCXmCmWdA==
Date: Thu, 08 Feb 2024 10:36:58 +0000
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Valentin Obst <kernel@valentinobst.de>
Subject: Re: [PATCH] docs: rust: extend abstraction and binding documentation
Message-ID: <223ce440-4643-4a7f-b97d-c023e64beb16@proton.me>
In-Reply-To: <a3567a18-6b8e-47d9-ae44-418de9dacfd3@de.bosch.com>
References: <20240206065429.1933397-1-dirk.behme@de.bosch.com> <CANiq72kqdsX34MOCz1qOyb0TCxsHAjn9N9S5OqdxfwwtJSGXUw@mail.gmail.com> <a3567a18-6b8e-47d9-ae44-418de9dacfd3@de.bosch.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2/7/24 06:32, Behme Dirk (CM/ESO2) wrote:
> On 06.02.2024 20:35, Miguel Ojeda wrote:
>> On Tue, Feb 6, 2024 at 7:54=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.c=
om> wrote:
>>>
>>> CC: Miguel Ojeda <ojeda@kernel.org>
>>
>> Nit: it is typically spelled Cc (i.e. camel case).
>>
>>> +.. code-block::
>>> +
>>> +                                                       rust/bindings/
>>> +                                                       (rust/helpers.c=
)
>>> +
>>> +                                                          include/ ---=
--+ <-+
>>> +                                                                      =
  |   |
>>> +         drivers/              rust/kernel/              +----------+ =
<-+   |
>>> +           fs/                                           | bindgen  | =
      |
>>> +          .../            +-------------------+          +----------+ =
--+   |
>>> +                          |    Abstractions   |                       =
  |   |
>>> +       +---------+        | +------+ +------+ |          +----------+ =
  |   |
>>> +       | my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | =
<-+   |
>>> +       | driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          | =
      |
>>> +       +---------+        | |system| |system| |          | bindings | =
<-----+
>>> +            |             | +------+ +------+ |          |  crate   | =
      |
>>> +            |             |   kernel crate    |          +----------+ =
      |
>>> +            |             +-------------------+                       =
      |
>>> +            |                                                         =
      |
>>> +            +------------------# FORBIDDEN #--------------------------=
------+
>>
>> Thanks a lot for the effort of making that slide into ASCII :)
>>
>> I could try to see if I can export the diagram into SVG and include it.
>>
>>> +The main idea is to encapsulate all ``unsafe()`` handling in the abstr=
actions reviewed
>>> +and documented carefully. These are considered to be sound then. With =
this model
>>> +it is assumed that users of the abstractions ("my_foo driver") can't d=
o anything
>>> +unsound if
>>> +
>>> +#. the abstractions are sound
>>> +#. they don't use ``unsafe()``
>>
>> Like Valentin, I feel the wording needs some improvement here. Part of
>> the confusion may be the `unsafe()` there -- it is unclear what it
>> means (especially given the parentheses).
>>
>> It is true we want to encapsulate C APIs and we forbid calling
>> directly `bindings` outside subsystems / exceptional cases; and
>> ideally provide safe abstractions as much as possible. However, we are
>> not the ones "considering" the abstractions sound (or at least that
>> way of putting it may confuse readers). We do our best to have sound
>> abstractions, but it is not something we "decide". So if e.g. someone
>> passes a raw pointer and just dereferences it in a safe function, that
>> is most likely unsound and it should be fixed.
>>
>> That is, in turn, what allows callers to avoid breaking things. In
>> other words, we don't "assume that users cannot do anything unsound"
>> (introduce UB?) -- quite the opposite: what we want (as much as
>> possible) is that they cannot introduce UB even if they tried.
>>
>> And that applies even if users use `unsafe`, as long as they use it
>> correctly, i.e. as long as they don't break the preconditions of what
>> they use. It is just that the best case is that they do not even need
>> to use `unsafe` calls (this is why we want that APIs are as safe as
>> possible, because then we minimize the chances that users get it wrong
>> and introduce UB).
>>
>>> +Abstractions
>>> +~~~~~~~~~~~~
>>> +
>>> +Abstractions are the glue layer between the bindings and the in-kernel=
 users. E.g.
>>
>> Perhaps we should avoid "glue layer", since that sometimes implies
>> that it is a "thin" layer / "uninteresting" layer. However, the
>> abstractions are the actual interesting bits (and can be quite
>> complex, precisely to achieve the relaxation of safety preconditions,
>> i.e. making APIs "as safe as possible", that you mention below).
>>
>> But it is quite subjective.
>>
>>> +The webinar `Rust For Linux: Writing Safe Abstractions & Drivers`
>>> +
>>> +       https://www.linuxfoundation.org/webinars/rust-for-linux-writing=
-abstractions-and-drivers
>>> +
>>> +has an introduction to this topic.
>>
>> I appreciate this, though some of the things in there are outdated, so
>> I am not sure about including this nowadays. Perhaps we should record
>> new ones instead :) Or, even better, I could "write" the talk in
>> written form here, which can be maintained and be kept up to date.
>=20
>=20
> Yes, that sounds really great! :)
>=20
>=20
>> Relatedly, Benno is working on some extra documentation about how to
>> write safety preconditions that we will probably add around here when
>> it is ready.
>=20
> Benno, is it worth to wait for that? I.e. drop this patch and wait for
> your version?

My stuff focuses more on how to to write safety documentation and what
our motivations for certain conventions are. This gives a higher level
overview and useful on its own, so you can keep it.
I agree with Miguel that some of the wording should be improved. Maybe
he can help you with that.

--=20
Cheers,
Benno


