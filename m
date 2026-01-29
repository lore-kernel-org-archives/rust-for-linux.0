Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2846C3396E8
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686006; cv=pass; b=tCExfjhrHsAmuqzX0Zp8nl6OFFQBLgkDPxb62Ex6F7gWI0Fsn1HVK+oz94cv3FnwaCluv6FkZRpyuBac/VBrS01cFXlKSyr/WeIxZbdbeLIdnOj7HHzFgjdzAPNj8HMWVmN42170Rh/kBfAl8vhOAdgKpCjXNzqefAblNixmIDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686006; c=relaxed/simple;
	bh=rTBwobW7blgjKHgIg8gbEPiJ438NMcLNfvtouebEM2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISMYKbHK+iMfPm78iUBmm8W6wdXM0UT3ciDlyj+6b9jqE5HdG83Zw2OpwYWDk5FQhivFUPtmQ3urqA/OxiV8YxZhnEgDagMhspEYkNw+HeT1FA4QjGFDa5V+LYz8mH+UFNWhfC7mZKcSfUdeYow2n3TXHyw0JzleDstD7XBxn7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2Obs72H; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2Obs72H"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b72b154883so25698eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 03:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769686004; cv=none;
        d=google.com; s=arc-20240605;
        b=TLmO7R4Gqg15fcAOvC6UzJ09Hkqyoa0Qi/PdSnc5h14+g/hkqeCfk3SD8T/oTPcgRe
         QDHB3h4JlM2YAcmgJ6qK0Av0ngOdDE0k94vmJ6U6Jf7yzmofg3n3MnoAjBQDOO5u3CHK
         Cpn+av7Z4FV4a/8XxIme8IcLtphuklwcUwI82/HLuAVZjea6pZzCdreO8zKt2R3KX1xU
         Ce8A6bIBDz9YiEc4Dfa3Pkn7dpDSsD32Ci3uFhs4WMYVKVu4akBoR5nq2CbWmFllRhKS
         n83e+VTj6/FOJciRx2NhvlajirHrSqgjU31WIf0QEHNMBGICzFIqyDmB9FFSE/8aXvU2
         IJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTBwobW7blgjKHgIg8gbEPiJ438NMcLNfvtouebEM2Y=;
        fh=CdHVjmeFrj5fmgLnelgHTC/06BFw0FoneK8ep+raU38=;
        b=XlYAmR12rXyVU+E1Dg9fNfSRkSJeU2qbiQODOAMLJsuT3aDphy7THKWfNxGVfTonrh
         r3exZ63HPMJwcHJEwZlIcx7IivOdr9jrW03spSNQkC9Bouwhux2BE+VM5ZqR47VYudK9
         yzGv4kJoFQOEY9H1glaTPK4CcwuVKR4s8J1byUXNSy4hXWW+pjXm/79kSYic3Qrnoz/e
         rVZaOciyXYXRkqK2PkSTGYoF7BbfGfwet4vw3zn3X6wLxEFB+I/c5qYWkbX9t10KWRx3
         S3Pf7X+WJMopbKm+OOfBHMmWAkFwGhWLeavRJmlyQUSSj2bHdgmxndXwFvbYb/uvr4Vb
         TZSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686004; x=1770290804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTBwobW7blgjKHgIg8gbEPiJ438NMcLNfvtouebEM2Y=;
        b=h2Obs72HAaigq9JycZG2ZT3H2dsshQ+XnW2//01/iRP8tnF8Ss9U9Ga4gi3FFGnr3c
         8kmxDVE5NW3DzpwIZMOiJ4iCx1RjiqOSUp9rQrIwe/FmJiMdyXODaI/OaxKcICf4Raxv
         SVKj/7mGDjqbNM0otsolLu/uK8t20RJfTwV+0kcvCDooMZQCNvm+RUjtRCiAVHL5iBl+
         kkIlumkLpWsW1s7Ip0e6wbbX9QEAj78bRK3NOb8bLPXgvMy7ZE32k1H+RCQh2biR3oIn
         BJsXmwVq3WbzIk1QcQnppKhcI71iIRKpzap/7Pg+Gpb62N15GxnZs8uLJTxEX3IkI/zb
         Y1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686004; x=1770290804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rTBwobW7blgjKHgIg8gbEPiJ438NMcLNfvtouebEM2Y=;
        b=I6ht+GHAY1qvVWCK0aRdtog39qXfA01tIKRIVSpo4gFDmHjx3eNo5JGyA9A65LS8jN
         j/BXZzoKPcxoV6AGvwGZlbxLJWx8mQYcALOAUc1u5RqdROrPvOZefXiSgCnJhykdWrdN
         lWriCrGaEf3qUiZVf31K16/0X3gM7JrAyDkihzUJ53kj/boMCLKOVGojF/yfmGedMEvw
         V/3Lugabx1XuwCHvN0F0XPad9GXJQR86DDUhxER0ZxbN4Z1d8PQLlY/hZKGBakJSCv0j
         rDkdSdeKThmPKg8WTNSdlJEZIUExrHx8wLr6nFEgj6vBxrwR00mOLvuPILZCrZA4gXdH
         /n2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxpXPuaqW95yH8wUUAHfk3BPNgv74cEbBlaKeC5MnJNZMfDDFNjNxI7izgTtkhu38WwrflH3jsX8HCL2a+NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOe26MhMLDkfmtci+RFEZ9Sl9bLt85zEPlmQHwR6ANo0Qu2gf
	ZionlC/AAGjWK/SkhMAbzQlh8atrOLDOWtGPWsEbEgetu8kPw+n403EdTW7kwKKPuQd4lZirMe3
	9YMeBCGCc/Y5bNEkT1qHY24puyxuFSXo=
X-Gm-Gg: AZuq6aIHbKlCsbsepE5TB8aqHA5Nvw+eiSP2uRfQOXDv36jb6MzAIut+5CmrQrmFIsw
	BKSWyP8WyP77HZUix91Tqelqg8PjPBSCh17tPUaBvr3C1MF7jBe8rESmW0DpxzJUUL9ZVHINruT
	03h/kSWHR8H1edShzn4AlvPtPNsNJ5zBkccRvkY3kbQzedY3xuKB7PPBK4iR+HPehK2ZpsFDNq9
	tjQD+2maFJHwpEaoBoQSRbDxxJqDKNVqP4ZJ9BRN2uQIfZhD0Hwq1q80mL1EDFAagKwGqdz2bpk
	e3sqNNGcleAHnF0b8aWKRjQ1EIwafpv90bTM11qKfhT6KXklQpAtY4vv9wubiVPndZO567OkBTz
	F/f8NxQMWIXhE5XCAEf7BlyE=
X-Received: by 2002:a05:7301:4b03:b0:2af:7427:30b with SMTP id
 5a478bee46e88-2b7aeee373fmr959224eec.1.1769686004277; Thu, 29 Jan 2026
 03:26:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129004520.62697-1-boqun@kernel.org>
In-Reply-To: <20260129004520.62697-1-boqun@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Jan 2026 12:26:32 +0100
X-Gm-Features: AZwV_QjEigWgVtwlfTZvvep8-dxvVBHL09lG7swXUdQJFwhVozQ7aNFZLFhFcLE
Message-ID: <CANiq72=p9ZY2GWgnu=wYbNUQE3mxRsa3KMfkEnJV++X=mhTcXw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update my email address to @kernel.org
To: Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	rcu@vger.kernel.org, lkmm@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 1:45=E2=80=AFAM Boqun Feng <boqun@kernel.org> wrote=
:
>
> I had issues using my gmail account multiple times this week, hence
> switch to @kernel.org.

I will apply the patch unless you or someone else wants to route it differe=
ntly.

Gmail is definitely giving pain to a few people this January...

Cheers,
Miguel
