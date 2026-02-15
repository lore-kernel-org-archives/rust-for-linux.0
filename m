Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B69C2727E0
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771189212; cv=pass; b=oTsGVUGQkLfAQbVhAjY7kDVhIfO5eBKpEzdCxp3lwRFL5uhJCRawoosgMcKRKkZuxmCnOBKwWKLnAD57dOhdEC1+B1CH3Msb3rDJ+aJgPBB2WY9bPn9NX5puxrGX1Dm7eOwSpmCG+HtHJYyDdsiSCkErIOBYZ3kUjW7ffEH0pBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771189212; c=relaxed/simple;
	bh=SoSCcd0TRwtIRX4NZyBiwQXQDK/sQZZ6YszJNilIM0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLBvjmZ8NZQ1U3Qt1nY4jyBieVaySSxU+dT7CppQJipE40Gim4Z35AWkllCHrSzHupjFv8gCHcaqGEZ7j4hslH80g3LHyRGQ7pgMAnF5B34/2FeKu3JO1/lCC9ULwrNYxZeJcZHbmbBG66UR1lH8jzu9vI8rzFEorxZnSU7t+7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwrcyZ8y; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwrcyZ8y"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba6737fafbso133363eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 13:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771189210; cv=none;
        d=google.com; s=arc-20240605;
        b=P0O4FdDphCaqEz/rQrvdxxa9IRherEQOpdRB2CHdG07rrEIUiiPzR4IP7q1MDGZjjo
         zdWm+JRM0NcLxYf8sIzMnAIvvY9Z8lU3ioM8Ep/B/oX/Fi4yvz3wbNXK0+nTnpVFQ7oC
         Ee6q/BvyBQaBsqEpBkFacwnSIfML/UBlDlzYL9CPBjB/80z1Yl6rQ3YXUUnBz9K2M6Nt
         1vFDhy7vGIkh5zZ607p6TQ9wkRzqgmAQm7LFv8tFA42Me56Yo1irMmOjLvck+cjCPaAN
         O1rJwwq9Z8Ir6I6ShHIp44kdTa4l2jtTSs1RkT7aA4ykBv5droqTmBh/FdvSbloIwQm9
         sE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRa3io8SMslvyjnorqhnWAsXnSXzAh2kIdFuJLN5OK8=;
        fh=A1MAiU5ojSVO69IQUHPNNyGbU2ki9y8V+4D30twGIkQ=;
        b=G+4hs7rUNaVO3IcSpXiCbKxuY3Uyv1LDLUkx6XmL7+raohPD3K8yq/LbRYxDWfiYEy
         9QCeBa1I0SPtTzzhas0a0EDhL3K9/v8MVL6BjfCLR0RqmJsQU6oGuPA+kTm6h4Kev8CJ
         xKduAL9GrcZuoR5x/nQO6x/558c1YfCiDq+imrdPt0vl/g91lXT0Fdeu87e0HFD+9WrP
         cs1dNcjXr46Yza1TYoT2uvnNbpIlFGvL6+re5B9bxw+5C2hUiiLuhaeWNrYjYjSeIcGd
         kwogoM7VgCsH50eEW7FzDHfqTS+dg/1r2t5HMZwgubA+h1TYDtfnQcrg59OZ4wmKVjRZ
         1wSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771189210; x=1771794010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRa3io8SMslvyjnorqhnWAsXnSXzAh2kIdFuJLN5OK8=;
        b=NwrcyZ8ye+FBKT01B8ZnHMC/MF1L9vvKyTPFyn5xqukHMRBZCjRF6aOVDyod1vICwe
         7JT456eZ7AYVsa7xdnFxZknyJfJd36hKH02NQE5KLg9eGWqjspqm8ACv5cFvbiNr5bBN
         JIFpzdol+ZxCHRz4gkYKOuXf2azTHdxzU5GPnedtsNnyfwQAh0QlE4Oe1f+tuz12HyCt
         XURKLmETtk5wNwh3xxdXwPjegqdvCOcOMp1VblmKqQKja1iMlGI1lx6yHffK1NkxF0Y4
         C1PBt9VSpAA7fMxNtCpuXP2DWZFpXZnCe+Izn4+L0yClWFbBh1pMD8vM5TGnwGwQzUuG
         tfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771189210; x=1771794010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRa3io8SMslvyjnorqhnWAsXnSXzAh2kIdFuJLN5OK8=;
        b=JdBFPkT02YoNWKVYS2JX55d7hOwbtVMz/OSlwYd/jD0uSlTxAc+MT2NuMDkK5RZYW/
         /x69DXTaU7i8SuaZ/qXMtiVn6no/g5Zdhv9yCP9dJn8cqhLHa+cQ6V9EhAs4vURolRzn
         hE19ocu/saT8ZAQCTgVVxHKlISFeVRJiAEqfqYpR984Qly4/9wYzFLuzXDAS9qegjfyn
         j6iFp+r03ULmXg0M5a+W5YBcjmkVH+OnPOU09sspT3kzKTYTcywe0G93sPAwhTpEMbLv
         wQiUPNx4UrjVmYjYDZnlNlJwp6uUVee7MNk+eRcmzyhRkiQUfOJPagxGs+DfKxoc+v9k
         r9PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpSieRvZqaHIQ+l6yFm0tf2LVoawpvOk0puwH15nxdl2VuVc3gybTt6AEwRDPGbPNG3eRGYuuuRwiXhybk1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh18f3v+bVWaN8VOULAzy7ltJyOotvMlS4hVFz8XmJu/1Wd/i0
	pr5UGGBNkpq0ESjAbj4v83G5Tx0086LYrXCIhh/8WzHW3ZwEM2f/kd8LXW++Wrx6VP4kobv7cJc
	Vj5oQJDHTuaI/tLi+fhiaUm5RREFobVA=
X-Gm-Gg: AZuq6aKrmNqyNVuh6Dbis9ZgKcjm1tWoeEUfHZV/pIxdGmZLCyBe1U3/J57vIOZdtaL
	YPRMPEa2ZvIQ/R2qNy6ocp4rOn6F8eBv8XzQJrcRaeEN7Jac+Ym4W02gbWINv0XgwZdMx61AKDM
	pNnT7JDO1ZYplQEGL7sa0+l6ntkbyTtOO3THqA0u/sYqEE8vtVwfRpV4wueUhRTxNgTCsmGKmmr
	M16Dwi3PPz5G4dj3GM5F48/rn4XM+idyYf+q6KWvs4N9FhgQaEkz4K4k39eJ0CY0+/O6NCYGro9
	REGjEGg6h59CUPViIg8XkC4uZb45AOcg3Kf/YarnN1aLanOsRtlX6oVdQUjpPvhz3Ii6JCTML8x
	y8igqeV+UAOss8Dv0+T29Nrjy
X-Received: by 2002:a05:7300:324c:b0:2ba:6f02:2939 with SMTP id
 5a478bee46e88-2baba0131d1mr1909641eec.1.1771189209932; Sun, 15 Feb 2026
 13:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
In-Reply-To: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 21:59:57 +0100
X-Gm-Features: AaiRm50roiJfzZ30looaTVRCCzgtio_pEAWTaEjG9pO7U2gnGZyLAQdI0VBf594
Message-ID: <CANiq72mfLyXNs2QdzROkgOeuQDPSEM_f3Rt3rvGcrhd44weSTw@mail.gmail.com>
Subject: Re: [PATCH] rust: hrtimer: add active() method to query timer state
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 9:30=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +    /// Query the state of the timer.
> +    ///
> +    /// Returns `true` if the timer is in the started or running states.

[`true`]

Since we try to add examples when we add APIs, could we perhaps add
one that inits a timers and asserts it is not active?

Thanks!

Cheers,
Miguel
