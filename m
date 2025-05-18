Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D70584A3E
	for <rust-for-linux@vger.kernel.org>; Sun, 18 May 2025 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747601335; cv=none; b=jeYXR635481shqQBGBnjGlu5AgRjoyS4vC7WugVfjSDz+FuNDs+yXqT8EkqEZJYUidpaxwU4v/gBhSw91fP0aXmRR6AO8cDn1g8+q7h4QX6HP9TKTaiCi3j2nh2fijAD2c+KQPpvcVZqUl+QV34XHL8oOFo9fV7ecwn1oWNfMHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747601335; c=relaxed/simple;
	bh=svhTy00l5zSuzlx8mubgCRrs5mcN701NTPRZw6JmmjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwQ/jFfLC8K5Jx1aCGUJQL7iY2Vn8C3xGIfmkwdGm34HJJ+ZNfqEwI4JGxpSc/ZQoJ4bwTqi6nQSCB/feEHgfOTNpZ8fTLhyKNeThZvIeLflwbQm7h6tiqBs5Z3kp4aS1Atg1M00iDlpeK8FCIJxPWMOcyX8YEqh3PAE/H6H4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1asj06E; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1asj06E"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30eccc61fc0so281543a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 May 2025 13:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747601334; x=1748206134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShCu2kAowyYf5rmatRKy2Mnz5s/s8ewGRXlyu08J8CM=;
        b=e1asj06EsxOwAgeK4kWYFS3zdJCJSo2k7/SxwOXnq/wzrh+L61g6geC0FO9F7TkDxX
         RJ+8v+65KifIrTlUU9VqKxS6EiZlYuJv5Utsm/a8QSR8Um7RfJ/T5/3UNnpJZr2KdxTp
         +r815CLlyMnn5ChDHEhFLKuBHsOAKhN96PXef0Q2iifJ08Cq6nyMvKx7YbdrxCkPOVXo
         kchxvhCq9QjH7366fhNSwf5oQ5hQ79hXgBGD9tSIEvfkeMra6HYb1BZauWfgDCER7Koc
         yOswtLGP4MNNJiUOvB9uk/mu+TWYbuvhU/lu5qx7q2I327Cc58Pe/grUxy5ngl2Kmpc7
         DwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747601334; x=1748206134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShCu2kAowyYf5rmatRKy2Mnz5s/s8ewGRXlyu08J8CM=;
        b=iPLxderZZNHWEhpEuppwwf3i56TlyaFeo3Hd0f1zKc6D/jJJ9fJZUU0AkfpM8MDBZH
         dUr1HcsAfeThx4+ORMYm0zBs9kXh3fW6pSbGK/KKw41l/IjSNPTWayhGdu0Gazkpvyph
         5Tu0CAojhs2PA0qtGr9jop/c0um121oovb2lffbN9ny9840pO+J+sQL5fd+AwsFfw9Bn
         CJTpXUAGep3yRMYf9Tu4eepXIPQmqM81PY58wNzAn5XC9dSkNC3k7iY/Oe2zl5KPCTLY
         skJddSuXfWGFZyWXw9SpAunYCPOu5cVWp5eT+WAYOen7jrWhaJY2yIbedYwEwm0w5EH/
         va5g==
X-Forwarded-Encrypted: i=1; AJvYcCUP1BVELOqPOg0s/vcJbX6nCyy2vKeh4GA4tlT1Z3FF3OyyNoz69MKHU+GWIHnEGD1J9ZQNgJ/c1skYBcNEsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jbyPTK78lBn3KFpYrgBMiDmbpTo3Tlo7MA337k/KcQ33+jLP
	lwNmTXS5YYpUfD4swPkqJYlU7Rgh13q7XSGc5tgearP4YeLdYEMOa5mrys+qp//ef2JvzcEnra2
	WfBFzpVbqY87HLmYnwbp8jFMPdi2vzIM=
X-Gm-Gg: ASbGnctqaEMEqIhWouEuaHCwtKLQN37hT81VzwHJgzUWDrlA3+r8QCwOQb4zpEAB7da
	zLPzk7W523FXeGdeqmp4tf8jVbgm+k1u39QqZ5l4FIbxMsmiN81AletPDav5AA9aTS5k8YRagNw
	my2JSfA9WdpT7fXJWGsXu9vzp5qkrtT+jFczOJyiRSr/Q=
X-Google-Smtp-Source: AGHT+IFQ/0jmmxwDQdYoS0lzmZPnFn0p89RYlh396SmFX6zfWEE4saF0mOHCFPbOrdOKMjspJdE/Bmtla+8Dt4h1jCk=
X-Received: by 2002:a17:902:c951:b0:22e:72fe:5f8c with SMTP id
 d9443c01a7336-231d452dd8cmr55853775ad.13.1747601333599; Sun, 18 May 2025
 13:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v7qeqd6c.fsf@kernel.org>
In-Reply-To: <87v7qeqd6c.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 May 2025 22:48:40 +0200
X-Gm-Features: AX0GCFsSihkyxcgI9pOpeKr3_cSp8RAcS1PTAxP57ZkdECzsIUzuDrhIiCuHyVY
Message-ID: <CANiq72nruumfdJ5ko0i1AnKcSFxtZ7ckToLNbzdUv-Q0vj6vsA@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v6.16 From: Andreas Hindborg <a.hindborg@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 11:55=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
>   https://github.com/rust-for-linux/linux.git tags/rust-timekeeping-for-v=
6.16-v2

Something strange happened in the Subject line, but apart from that,
it looks fine.

Merged into `rust-next` -- thank you!

Cheers,
Miguel
