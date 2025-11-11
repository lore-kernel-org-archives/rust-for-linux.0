Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F245E32692A
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 21:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762897448; cv=none; b=o86GqT0TFmqKkH0QkwPCNsVyh6ksFcucvnjZnJivpI/S3Ke0QOZcM6NXHczUgVT6/bqUmc+tEy5CCkJ8bXCWInT3Egsk97ydap10dKdVw+I1dtR36S9HmvuWJgpTPKCnRPyQhoMKIryy/By6CVfQnVbD80S4r4QlhDmFlNbb21Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762897448; c=relaxed/simple;
	bh=YnUjWrkd1WF1vs800zEjTVyQgnZYas8J6AcEU89sItA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cnURfomuBqyFJtXcup/z86euWFS0CT7YzUUliwcJ/CRyMdPrVtGZIAMxX7NCCVacyqZpcldYXrLggg7lSkvoMhZfptzlUPT+3Xh1huMz1hIlj7tfNrTpYfB9VIpikQ9eQCx5bSpPJ/c9Xmu7Prl3GNGkDLjkOmPdV3J8LWhzpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvLZ+bhD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvLZ+bhD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso136855b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 13:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762897444; x=1763502244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ueNncBuXdbx7UDDfdmsz5u+SWeV2NNiLErcdEavOBc=;
        b=YvLZ+bhDv3NOQWlXS5Gt64QHUt3yP/pj1C12mvABoX53M/EFXbBNjvNx5b0NqUDPeF
         iWAjuyy3aCH/KGLnlK+Sqv3BBkz1mD2WZpMVzenHYRkCF68TgOXmnNTF+FYbAZbCIVCq
         zlHfXXdblVYhfFGYa8hWwGGZkBiGdgQk+VUew5yT7QVimS9CAr9OrK/RJUAdS2zcwt+q
         E2lERlkKmrH2NEZMJCRxGyLP9dCjKslBKQpXUbApvJ8QqAEZza3sIBTA1UwjK3vxnED0
         s/NVLWlp+4Atc9bySzJ3WvIRoH9Q6sRsjM5y10ij5hAyzd8VAGIG2oxTlaMjhmETUZ56
         UzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762897444; x=1763502244;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ueNncBuXdbx7UDDfdmsz5u+SWeV2NNiLErcdEavOBc=;
        b=hFvpDQeERGP4wY/XxY0T09uF6twpuZUY+h2/S3yM4G4k1q7diW++mHxSLQi4ytg/N7
         fZnwbIfb/rEDmp5CTEh/we+9ohTOcRmF+01tj3Nsszu1XHVcHIKEFa4wW7TQGR7erVor
         IVKPK2kNcLLW+7gmfh7QfpF9u1syRH/TcLpK0hejClcF9IK33RtlpT+5M9Gi2YFr6Vd3
         WkeeNgvsDKWD8zS0BevacZHVjqKPbKg/V/hFf8l+dEfQEghw5kGriTjFz8vBzA3uRIa+
         /jpqHXEsXdisAbEKRkXXKxKacSKC0bOizCag7kR/vuTkK7R2U3EAzv128WRRbpKitj2U
         B5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVuTC0ZTID7u2l33lUTnAFJ2+v3GwmK65HP2q6+3c3RBQECPs1i4/LR30h85ckNvcVvpl02KfpGXplBY8nx+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNstyQJwG6rGoJpIljoMN5ok+1uYTwu1kdDvuyfy9uP/k4pMm6
	skDHZIYvHzGbVXICM9ROlyo1Dm6ZfGClTQVzaN+SBgFz/Xvb6ZxU8gks
X-Gm-Gg: ASbGncsR+aTcwiAcaqnUDMHMdNnRAGMcceZ5/LRF0nMpv6EKx+I+ytKgRRfPCLyCply
	HhyM1yQ/lK1gO+I+v9F+NMxvzWVrq1wtfOWEjOfaQmMrAsVwDSpjk7K7MpF+qPqB80qgZbifGmf
	FUOzK/CcEhZLuxE3A26DqrQX9oUlnbCfpK7j/w+gb+9ZN5mhRyZE72zHgKAXfwDJygez43bir5f
	e7ZkQ4Syt7528uqJGdoi4r/8OneMxWwQb/0kggLif8sBVx7DQcT+gjnpbt8fectQO8hutcimbsN
	8cdJL7kQfgTNjaN49DVN+w0VKd1T1Zctk8yGjEHP9Z7Csn1jmOkaVdrhB8GSn2Zwzyk3dQT2yD2
	VeCkDCKkT1m++knsyEEAKTqhWZ4MSlKJIpWqlHp30+eXugzl9TxqpnLZ7av5pa9Pa4lIX3S+rGx
	omXCdk1Tr9RiLMqBlPlQlyUjJLbzm25RqaTFDLas1FXbW/tPMxYlXVotBORaWHSPKB
X-Google-Smtp-Source: AGHT+IH/a0SPO+0c0TCcjBwy+l/sEDfRbYUKPVHBdmofpgjMB0JJUp2GLWJegOqfK+Jv36zmnjB0cQ==
X-Received: by 2002:a05:6a00:92a0:b0:7ab:3454:6f22 with SMTP id d2e1a72fcca58-7b7a4aed22cmr491726b3a.16.1762897444050;
        Tue, 11 Nov 2025 13:44:04 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17ad4asm16346517b3a.37.2025.11.11.13.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:44:03 -0800 (PST)
Date: Wed, 12 Nov 2025 06:43:49 +0900 (JST)
Message-Id: <20251112.064349.598094996228184902.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com, a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, ojeda@kernel.org,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRLG1Ofr5QpJGFaB@tardis.local>
References: <aRIPgOPvi4uhGQcM@tardis.local>
	<20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
	<aRLG1Ofr5QpJGFaB@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Nov 2025 21:17:08 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Tue, Nov 11, 2025 at 12:09:49PM +0900, FUJITA Tomonori wrote:
>> On Mon, 10 Nov 2025 08:14:56 -0800
>> Boqun Feng <boqun.feng@gmail.com> wrote:
>> 
>> > On Mon, Nov 10, 2025 at 06:21:50PM +0900, FUJITA Tomonori wrote:
>> >> On Fri, 7 Nov 2025 09:03:01 +0000
>> >> Alice Ryhl <aliceryhl@google.com> wrote:
>> >> 
>> >> >> That's my point (and probably also Andreas' point), we already has the
>> >> >> type `SetOnce` to do this, no need for a `OnceLite` type if not
>> >> >> necessary, and the fact that it can be zero'd by debugfs doesn't change
>> >> >> it as I explained above.
>> >> > 
>> >> > The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
>> >> > three different states, but OnceLite only needs two. I don't think we
>> >> > should be reusing SetOnce here.
>> > 
>> > I mean 3 states should cover 2 states, right? In this case we only need
>> > to support SetOnce<()>, so I think it's fine, see below:
>> 
>> Yeah, that would remove access to the value member, but I think that
>> init member could still be accessed in an unintended way.
>> 
> 
> What an unintended way you mean? Do you have an example?

From my understanding, the init member of SetOnce is designed to be
accessed by using atomic operations, only through its methods. If we
use SetOnce for OnceLite, however, the init member would be written
using non-atomic operations, which is what I referred to as the
"unintended way" since I don't believe Andreas intended it to be
modified in that manner; i.e., not through its methods or by
non-atomic operations.

As I wrote before, in this particular case, I think that it would
still work even if both atomic and non-atomic operations access the
same variable though.


>> >> Yes, SetOnce provides three different states and the feature to set a
>> >> value, which are not necessary for this case.
>> >> 
>> >> So there are two design options: 1) to add a new minimal
>> >> implementation that provides only the features required for this case,
>> > 
>> > Just to be clear 1) will still need to be in kernel::sync module, as per
>> > our previous discussion.
>> 
>> As I wrote before, I think that once_lite.rs could be put in
>> kernel::sync but I'm not sure it's a good idea because I'm not sure if
>> there are any other users who actually need this feature.
>> 
> 
> Rust std has its own Once[1] module, so I think the concept of "doing
> something once" is going to be more general in Rust code.

That was one of the points of discussion a few months ago,
implementing an equivalent of std's Once for OnceLite would be
over-engineering.

To clarify the behavior, it might be better for OnceLite to be
implemented without atomic operations, similar to the C version?
Unlike Once, as the name suggests, OnceLite is a best-effort mechanism
that only tries to run once.


>> discussion, but I wonder if there are use cases that require Sync. If
>> all access goes through its methods, it seems safe to add Sync.
>> 
>> 
>> I personally prefer the OnceLite implementation of not using SetOnce,
>> however since it's not directly used by users and can be easily
>> changed later, so I'm fine with any implementation as long as we can
>> reach an agreement soon.
>> 
> 
> We should always try to find a unified solution, if there is not much
> trouble. Otherwise, we will end up having MyOnce, YourOnce, HisOnce,
> HerOnce, TheirOnce etc in our code base.

I agree that we should always try to use a unified solution whatever
feasible. That said, implementing OnceLite would require modifications
to SetOnce, and I'm concerned that such modifications would just make
SetOnce complicated, which serves no purpose for other use cases.

