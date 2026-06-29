Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DFA1E2834
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762362; cv=none; b=Z4cwP+6I/oQrwLjiooJbysilmB0VV/SXhctZyzo7NQkRDiorjZMk0V/eTG2oJyXIZzMjwskHJjIENVzMOE0aHwQHfutCDjO6WtNebARpUFp0MyN5LSlCLBDwJ+Au+qAKNJtiHxtcWBDq/C8Ds45h4a7MaB/dGOY1bUuWMyyjHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762362; c=relaxed/simple;
	bh=hY4JgavGrEWhCJWnwiRyUiQPfJQ1CdLm+cvupsbV5M4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Eb1E9Sw+ASbxZvfPL4EViSJFQR//QN2zz7k344e+PsgssuQcZKSmM9ENXf054tOB2i4PXDpyM6x3u0m5hoZmMKs3Ede5GhbNP/082h6vuFAd380pukya2WUnctiRwTRUQ15+IqmOvQnI2Z2M8dAFuVwWOE4bHNGUxHeCig1V/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nr75oke4; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr75oke4"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13986d61b4fso5192383c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782762360; x=1783367160; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY4JgavGrEWhCJWnwiRyUiQPfJQ1CdLm+cvupsbV5M4=;
        b=Nr75oke43xuIG76aPGPf/erhsH33PKy2YEVTL1A9sqNAYOC4JM4lWFJjtcdg3Pt9Qt
         ua2mEIDRGtInGXs+sR20ZUrCJE6hAtqOTuI1k8aB+KXUpPsjFGwGwfL04HQ14FIzNrkc
         3xVs/avSDIDArvDmCZkwo6y9vrYGOkiOo7QfjWoqPQKqiJqZqjnv8j/zNSgLVQzjskFC
         oStK2PlbM9CxvLwWcmrbPJxZe/bF6GOrCpYll5vhsWSLnUKMMHh/KqUPcFFcU8KeZMvf
         psWqyX21o9sd8/s2aczwFVRZDQdTeKoi51treTjdEieH3xlT7MbMrcS0EexylRUZC64K
         VUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762360; x=1783367160;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hY4JgavGrEWhCJWnwiRyUiQPfJQ1CdLm+cvupsbV5M4=;
        b=jpnD8Izrl7tqM0a+0F9aVyH3Y84f1PczIAxPX7BeZv+4BhhqHcmW+Mvi11/U/SbIC+
         047jSA/f7vzb06XcImNdeyHmZHC/VSlKgdULaUpbsCFhsAcHBS9NSMkcrz2tm3wu0nBw
         ZKmf1xzOHQtGdqJ+UTSKXNG/s1HXZqZmOp+ApxYGGemj0yf2eA/YjOAvFQMtnSxkpnfp
         EtWExkTcJTMZTACkfqUvrz6gycbYCyuC9wgTAJ4FwAv0DwV3L7kTiolcrxRFIn5GuR5V
         5shgSiEG/XKsj4HZ3A4P2VAWA4Nlfa+etunVjvnHEx/8UxbH59jcXYj4x80sKQgD4yER
         tVSA==
X-Forwarded-Encrypted: i=1; AFNElJ/OaePpeuwXVaHpFKCdL1ICqu2IltPvBml1gCjXaWgMBE3gXPUm3sHRF2dAWJbPBAi4+2HnVJ67xHve7hVjsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlq80kZUV2Fy+qK7ewp0Ccyj94pRh6h+DvwASnOXmb4wFEUhYE
	1SYbKEDVDNdv9pEaPeejUQosyM+Zq178qMlolCDKqG97I+zkC8rQe1M=
X-Gm-Gg: AfdE7clfWrzGEzCXHfjHLglrZLwj2l3SG/60c3FEInNtbp28dmV/XBnoB43DkSUwI74
	67B/TbF3jmttGQSg3sLJ0xMllema+VYTd0pErq19u9sDA7O5hHQQofhIqkbRuF/hNWSa4+qjwBD
	da4v+s4nkNhOOeE+rq+hIrpodeUvrsVQm4IVw7FNlyAt0hqBtSTle+BP1+KFlxmLd5VnimyGa9n
	uGFcscqK2J8e5soH4oY+5AdjTlqKIy6iSenSH4uNhyx2eehz3eo5Da1DAYQIAXRSqwE7L2nKnWN
	hCj//2N+gktlPL9JTmD33YkGmGEVpqfBp+Khaetdy42Xpu58iVQ2plu3GW1KFNZDnWVG3O3sOxq
	pm2rnJSAwShjsQQxigm0cJ0zJRIkwW/PC0oKtGYJDeCvwJNaWEt3RiAR2qRMCUVyZxJEvvbNxCz
	KwNB8y+GN3U5N+4XMMXdeCc/U7R6UvDX5FF30Kpi1s/QrPt2sX
X-Received: by 2002:a05:7022:41a6:b0:136:e639:9c05 with SMTP id a92af1059eb24-13b2a1af5cemr407270c88.31.1782762360212;
        Mon, 29 Jun 2026 12:46:00 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab30047sm571436c88.8.2026.06.29.12.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 12:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 16:45:53 -0300
Message-Id: <DJLSIEZ5OBYX.APFOKYYKPU5C@gmail.com>
Cc: "Joerg Roedel" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Robin Murphy" <robin.murphy@arm.com>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] rust: iommu: replace core::mem::zeroed with
 pin_init::zeroed
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260626203122.713317-1-nico.antinori.7@gmail.com>
 <DJJOZNFW51LZ.IKTXQ8ZIVO55@nvidia.com>
 <CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com>
In-Reply-To: <CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com>

On Sun Jun 28, 2026 at 7:31 AM -03, Miguel Ojeda wrote:
> On Sat, Jun 27, 2026 at 10:35=E2=80=AFAM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>
>> Note that you can also use `..Zeroable::zeroed()` here since we are not
>> in const context. Not sure which one we prefer in this case, but I'd
>> personally err on the side of not referring to `pin_init` unless we are
>> dealing with a pinned object or need to because of a const requirement.
>
> That sounds reasonable -- Benno/Gary, any comments?
>
> By the way, speaking of that: the docs of `zeroed()` (both of them)
> could mention the existence of the other (and the `const fn`
> difference).

If it is ok, I can send a patch modifying the doc comments to link both=20
functions, noting that the const version should be used in const=20
contexts/pinned objects and that `Zeroable::zeroed()` should be=20
preferred when possible (as Gary commented in [1]).

I'll send a v2 with `..Zeroable::zeroed()` shortly.

Thank you all for the comments!

[1] https://lore.kernel.org/rust-for-linux/DJKV3IQ0SXA1.30T5Y71AL6KV7@garyg=
uo.net/
