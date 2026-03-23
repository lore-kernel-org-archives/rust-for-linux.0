Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2579520B80B
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774229945; cv=pass; b=iZpzc2mC3IDOmy2KonKOLT7sdlUxA/oBxMOKE9OYsZdcLzB7FUASAtG5W35YqzVRatyhpzxXjQLjx6jwya2lZS6jSUL/Z5wJHfrwNMgW9JPsjphnNFHAqZkwmLUIGNhrv6U69xMmNGJRp8IR7jgpdwyQ27cEneLe8eBS3f1/Bk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774229945; c=relaxed/simple;
	bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdk2L9SVe0YlHUIqUdc0wF8Xrf64wdCFq9sDgFYYBeUL59af8zC90crGnHulE2y6H2xmjq65ZchT0E8GGl1NrFAGVfOKwwLLBK7xNIVm1OqLfRd6bJCqTwmZPVrLULr+5hdlQ+8pjbnulXPQYhwBPqdJeu7vMm/sDeXF1GlYb04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Doe7rQl+; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Doe7rQl+"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0bf0a0236so122877eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 18:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774229943; cv=none;
        d=google.com; s=arc-20240605;
        b=In944s1ubLGmO+ES5OGl1kw7NrVbtEf2hHM6T3DT3gLxW5O3k7XPVkmqDKln1JgpK4
         ncp3/S0qgQZhCy0il8deLZ3Zv713EizzRDzM8qONsFXAMGYa6miR7pA2ecxfJpBhizAq
         SsK6lfPbv3FH8ukN7UcpmE4m6GW8pe3v+WknY75SKGuotms7tFbk3c4X9/tbr9GsI6si
         uvxZqps1L9aaAfb2BdmiK4HFAX8qit6vaHdSQNv5O4jyGFoN7a4hqaqr7it8O5Su+RQC
         3rHaXY7dSEfMgfvtkW+QeCTbhIbJAyez7wanT4Oy8jpr/+2Uj7BFF7nsCGsi+8sxx3Ri
         Kwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        fh=EIsEqG1FisfjbWCbUu8LsYhwN3LUIGq5thWvazMB+hY=;
        b=KnwTu0Mb2maOVHljvEtNKNgtjAqLDLEZwJKhBrVWCDMQ2attXUFvl/iHhpyIinRDsM
         nPYioCGp94igFWE3F4/tbbLETzE3qVy4Hm+U1N9H41Xvhw8rL9c5DtO/IpUeImZ9T8Ni
         vvbva+rWot0W4DJkwhvMUEjO6w5n8ec99Bg77xTq3UHJaUgySkj9KQYQr4DCD0sUtVfz
         X5QGuS4+fMKjW4nlkDtRBUdZInFoQno+jlEitIhZiZgVbXfosmRbHW//pnMaerGhYWfg
         d0bmUav2xVQRiJUkXCqUB/3OdwVZSG+wO+HFHm1YSYMTDdeWRDzY1d+IXLM7f1rkcGj1
         byNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774229943; x=1774834743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        b=Doe7rQl+AtVpPjUEG1oAqnqc/dKpgui3fu60NhDPcShWsiKXo7xd9lKm8e9A4jrbSx
         TjDb/iJUcr2/9vVLYkHizyoCDjV+POg8yOiGQB+ZSibO9QfuA3M+EccVNxii4nlJGhRo
         A8y/b/pUGg/nH1bSbXvsccorE3WbqdF5/Ce6Ou5IgQ1ujALaNWe41oNt5XQsGup1eRK4
         lN6U/N7pQU+wEK2Y8OIRs+2OeJajYbNZefT17kxpLSKZPOytX8PtiutcCe7vAOd0pv19
         1NlPe3N8u80G3BKnm6ZWo+FOeE4uNqQSlw6Z9t++jyVai5Fqutez8HNgieBQMn5gcRKG
         INoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774229943; x=1774834743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        b=pe2qfDhCYIJpFZK7gHUFkHV62aZ+QFZgikQCvP5/sA1I7eIP/AAI/FWWs+zbEh0S9D
         I+S2lPV0kuWNauW+l5DxWt5L1FAOzJXgzO1UsyFs15XKvWP0iKQHJMOYmmvCsZKttyvU
         QcabD1pZ6dfr3ex5hCOoYUYJKA43sebB8obXUMIEFrYP8jY9S3P0XHBpIAzp1sTTqxE1
         vXLXFV/zm3n9jeJljdkhJTNKayxACw+fgqur0h8L6bmZxiqEv6GI7VVnwKMRAwZagGs4
         uVNfwj1i6WdGNj1n1Ys+UrtcvYvWRyPJljErrPZiLJG4ZurCJh5r6LQfKqoKUHv+Q8qy
         LvuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcdU8aFdqgah9FFzCDllKTT8aE8cUUA3M2FR5aZnfSB6JdBEAGj/pHIZ4WsEYtlISUabpU81HvOzAqGbIC7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy97/SmazJ8jCT7pt9KfYR5JdAvIy6nYVvD2En54AIZN5Si5oRN
	Ic4LPUgM2cm9D7vXpLpftUSp6gUY+HXwlYaEEY+B5nzjXVuuvIIhhkNjPw9huKldN/W92mfvr/6
	NYKNjb6erdwI+QKXMpOL5GghYnnr+ysw=
X-Gm-Gg: ATEYQzy0qw4Zxf/TK369gT6FLy4jnpS6As9ga1P4f/cWoCoJZ4PD8nqzOxGKwHRNOV0
	aPCc/GPiOFYfeNg4fCOv83t+ROztaM7ODxkXz936IhFz9cbCRGZwaVLFeFRFK+5WTy+O4PDrumH
	v/xnxEwYZ8p+CCGPnwoCMUf6AYnUyf+/LQWV2WD68dQLOLMldx1YvjwUNZdxQKLGMXaIELO3MmE
	cfIvtMCo1lMtWv91ZAHjyHURG/YMJJgGbpp9dh0BRZRKrNIShkiroGkRx4lqGjkOvgaKtNuIXCK
	eXSs+7PkQFdGS4QDHMN3P5T6fBrIU3bX4Y9pO5Sm9oatVB/IzBOiDYJ4CY3jG/kWZ3YPrM3CEhN
	ku6R3B6QMqTW6aj8hrI7aXbQ=
X-Received: by 2002:a05:693c:3118:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c10973f6e7mr1912078eec.5.1774229943149; Sun, 22 Mar 2026
 18:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-5-gary@kernel.org>
 <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com> <DH9RDC77E3NE.3F8BURMZ8INBX@nvidia.com>
In-Reply-To: <DH9RDC77E3NE.3F8BURMZ8INBX@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 02:38:49 +0100
X-Gm-Features: AQROBzAdgpVg6NMG5khS7OAHwybEFX4tptApRBIZ_6EE7KPQ0oZWmoN7Dzb4nwM
Message-ID: <CANiq72knM0_w_eHbu1qV2Ps8KbST6KcAZRtTH9FEd_5sRMqWdQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Yury Norov <ynorov@nvidia.com>, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>
> (sorry, assumed my Reviewed-by carried an implicit ack as well)

Ah, I saw your tag for #2 and #3, but not #4 (nor #1).

Did I miss it/them?

Thanks!

Cheers,
Miguel
