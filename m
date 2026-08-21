Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A7B46D54A
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307514; cv=pass; b=qCA66wyG7EJ5bMXiQxHPN70q7hD11lnxGzWhoEfVMiNe9I8CP1yuGO5cs1Z46biq9AnDfdCsMk81rzipfPSTf17nz1t+LuZYoSN3UmczUeOphQgDCFLndBUhoxdAZfeJ5ZfRHSFPEZgxu5+gXzFKjcbRmXagNcziW0qQRs9roHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307514; c=relaxed/simple;
	bh=xTAGH7v9RUm6BZ6hjfHIXTUlW3mZCV6c4dtffHxY7FI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psy6yKLL1heg7om7WGgqBfVnvqlJq5fDu9vCB3Mfe9dNyDEtqMjuW70Rdqwlw3CgPIRhNkQl5UW5xXjBLJmZ6xhRqUXKx0sQhRWkwO4T+kZFsnONa4ZA0hT9vzgsZEMPi/9qNrsfTK2sziuH85O/BfzGcvTe46xbFm3odykp+iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEuzFFPm; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEuzFFPm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cace91f112so9104895ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 03:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787307494; cv=none;
        d=google.com; s=arc-20260327;
        b=FkaXvs7km3xd6bGKsrq7OV3L+X/FQdVVgkYE0nTnVraYNt9LOrelp3b5PpHOfLrTTN
         Ovu//cs4aIpMM2Liwg0VTqFabWf1FKINDwObjaKfr89yxrhYF9DDkhiTqiqwLsTuuh5M
         kGhFvJXeFChaLiMhy15vp7fFGvOFTrrXTWPrUps1Hh81dlrZ9vtSwEZr7cH3uwqbHE93
         MgDHiJZpqFAwGK/HWK/GNe+ZY9jn7Die6RzHV5hNQ9DEa688kttSo20IFhWaf04PuNCC
         n47x8CxUm+Da11TSH8NcZB4+tXcEbgac1BY76hTLDXf4AgvRwPRn1Kbkd2MJxiHa8Vb5
         bq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xTAGH7v9RUm6BZ6hjfHIXTUlW3mZCV6c4dtffHxY7FI=;
        fh=LpBvyeN8v4qDZperHLuVAHdmJ8zBMFgi9LHS0FE/PXo=;
        b=VVfK8qJ9iuPWOWiRHt6eO8EHX1nTsUV9Rgzq23CZmeLfk7+LDanAnHIb5m8oihG6xL
         NMNXXybZ0B1SAzz5FMFA505JEoqWnxylQe2A0ekcsE3B8IQUo8iu2NUHPCU2gJr6OAum
         iBkxOM14El9GCahTPgL7H/B4HfHlxOkVyGluASoymaE7g10qhyl2dyXFogM2G5YHD2OZ
         4LMCjdO+ekqMQgsEjYEO+/oc+G9a6pLl+FAHlnop7Sbrt/dyUnMj8Z2ALA1OOknTaQgi
         ynuAxn+CVg8jox5lFyAWxgmUrLvJQeOMZUHveazQbLvsff5gCUNFYupjwVx3lgsisNY2
         uZYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307494; x=1787912294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xTAGH7v9RUm6BZ6hjfHIXTUlW3mZCV6c4dtffHxY7FI=;
        b=dEuzFFPmRoCRIWGKpHy7no72ePKyRBpMd06yxknrO8ez9U4RIztR67rU6D6DiSYurn
         4Z8XcgCWmFEwehksVaXp5EMHHapeD/ElBConUYn77pAg7P9BIHJbwZG/l6qUmN3BTZNX
         k8h5f2+/tqmsVCz3vrDKDq4TKOhnp+4pmvRPTmM0Qz2gy1bbuAsww+qz3YMffyXQRRNT
         wKQW/k5sbk6yaSmsc4r8mhwFfK/g6ADAZDw/XeeGKIm4UWLvxv0Ruq+gHLYNdfcGxZ48
         Cz0c6ubFljeX9lO0tVV4jB10aOgtfgM1T5pozU9Nx5BCN8uCon9LAc+58a06FT755AIP
         btGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307494; x=1787912294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTAGH7v9RUm6BZ6hjfHIXTUlW3mZCV6c4dtffHxY7FI=;
        b=WaQp8YeOHr06cgvWrCU5szqax4dfETWqwH7IR52uG/Likyjk/u1ba2GN+fdqSiNv/9
         cBPxuGv1Nt1fQuSDBisaQ/G66y/MhOnAFkHtxisckv3a0QH+jfnFwQwgdT+QIJuprIkB
         e0bMfE8eRodmWHNILeNO47D+aterhmcOX/FwMl0tWtp+iMtvCte/3hS1gVNgAd2fnJjW
         mwHT4SrZJ63ikdl6AfdeWe1WqDlM8bT9gcB2VHr9c9ySTrFBcqWz+ywlIltRtAp7W36B
         JKdHH6UJj3yHvj2x3BC0QBTN97IodcfGbUUkPb2cVo4fo0uwvxLvlD13sFRQrnFcWnNo
         QIJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZ4BY8ns0/LIFPp6EgyGwhd5oYloimwOR5V/2O27onQhLrbVAWtRBg6hWmUX7X5rp36+SVaGjlU3S1bZOSrg==@vger.kernel.org
X-Gm-Message-State: AFuF++k9WJvVUnLMc/jgPleFnaPMiwecGYaipLKVInpPDgx0Qvz8rrbF
	MeBk80Iz0IbLjzCevS/UqpOusngkHoX67NG66QqTfGW/Sch8Z5I3emqhtyLUM170HG9NxAgg6pR
	2hPVf7sjNiq9i+vGOZ5syiicrpST0IVJhTDUN
X-Gm-Gg: AR+sD13qF1Nsebefw1oyrZr1ssBmrvoQCVHdLHmAsTmSO9VnA6vhdPv9qcVOKr80UL5
	8E3iQhOFH7EfjsDtmttfVq+7aRuqAK6VmHoxMHMZxqado0Js53MxO7OLgFgQj9ZUXzUntkyjuBR
	VMy3qIf+K+7dNwz4P52ZbxP77mvqRSWbOClZRzL8fcqM8OvHpTNcXHMKbtnGB3A5Q6JPmPyUWGq
	dbFJBg8r7CbkGgmFjnc3QZ5u0b1TcUYDJllcju8etZKQKUFkq1Fw0MmgMLGTJKyzCeXNOPEInMA
	X/OILC4eh6cDtwD14ti7GCYukgHOxu3z3yXycOaikdtoeSWf0/F+Zc9fPMAn9iP6t7gNL8QLo6J
	oSQ==
X-Received: by 2002:a17:903:354b:b0:2c0:a555:80d6 with SMTP id
 d9443c01a7336-2d64ade4a69mr104277895ad.2.1787307494193; Fri, 21 Aug 2026
 03:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
 <09b0ce81-0071-4df3-9f0e-a54269d04c97@davidgow.net> <CANiq72nNVQzO9gUcj+Oh1xEBWJv1_YxKeYpNTdhoNaJyhvOtmg@mail.gmail.com>
In-Reply-To: <CANiq72nNVQzO9gUcj+Oh1xEBWJv1_YxKeYpNTdhoNaJyhvOtmg@mail.gmail.com>
From: Malte Wechter <maltewechter@gmail.com>
Date: Fri, 21 Aug 2026 12:18:02 +0200
X-Gm-Features: AcwNN1UaLKjiN2bvD5r1kFIy4hENw9KTyMDvwAOIadymM45wmmISvmU3B-9ZXVw
Message-ID: <CAPB1BzcM+6zyRnrNOOWkE1Ni-XPTRUxVTZdtxG9ZZ4By7JjGPA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: add optional assertions to catch taint
 and lockdep warnings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den fre. 21. aug. 2026 kl. 11.04 skrev Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com>:
>
> On Fri, Aug 21, 2026 at 11:01=E2=80=AFAM David Gow <david@davidgow.net> w=
rote:
> >
> > My preference, however, would be to have these features added to the
> > core KUnit implementation (in C), rather than specifically to the Rust
> > bindings. This way, tests written in both languages will be able to
> > benefit from them, rather than just tests written in Rust.
>
> Agreed, I was about to reply with that, i.e. if this is a feature that
> is worth having, then it sounded to me like it should be in core
> KUnit.
>
> Cheers,
> Miguel
Sounds good, i will look at implementing this in core KUnit instead.

Best regards
