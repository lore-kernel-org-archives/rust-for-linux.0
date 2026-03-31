Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DDF423A91
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 21:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994024; cv=pass; b=h9RNcRYA53NDzoQWtVBC7P4o6qG6mcRzLmvXzL1qqW/Ew/FJuSYDxqkHruVOHYjJ0wXWXQewx5GKfbw0k31PZ74P6T1qKey5mtLJEbliXtq241PF+BlC5e3QWpE/cSk7ExaqwxW3M/BOY0f8BAamZS+9mk5LT9GeaOnL4ucFrq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994024; c=relaxed/simple;
	bh=b/ArxbDOSErJ7EhodougJMCKbAuLfhBhgl8KvGgp1Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1HK1ocw8YprzrAS/YWLtfrbJlyebYSxgAQgM5L0sQ0e8d3+cLlzrzebQColfNrfLH5E/NIoZLjc2KgJ3GY9KPtBg3iIyPGsk7lTJXJeeQquaqBqDkUaBRB6u2dPiNmIfVQxNPwsAo4NoQK/xDNQ/poqjjHF7uSnhV4dTskSg9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI+ZU316; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI+ZU316"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c7e5f38a69so31981eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 14:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774994023; cv=none;
        d=google.com; s=arc-20240605;
        b=WI/hJ8M3W0h7o/k0sB7TMitxgG0aMr/MH4PwNWHIGVJipowBpYvvubAGmhiYOWSihj
         FrePLba1adaJrpwyLvkRoZmwMgGkensR/E1u5CxQtKmjCutjUAAzLbxmeIgKx/KRg/au
         zLFcH676xFqK6jwo4g7tlNyHnDLTF6aWDSS1+BMovj4eJnPP/+2RbBRusy53BcxiPhsG
         Pk1+AV7lytRdYh7aNoaXQ/stdu9+Ne7UsCzQYs3RtHNP2+P5PpJRDriHrPHty/juddPJ
         +Smi2p9RMnHDddlG/TRDy5Pwfxqh6NdvEI74AKxKqd56pvGjU1DoYggzyQBq8OUapoWG
         lxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b/ArxbDOSErJ7EhodougJMCKbAuLfhBhgl8KvGgp1Vg=;
        fh=slgRfixQRRZ1GZa35lC05EcYuc3Vl4gUn+Cq2Ptlra4=;
        b=UDGjncmjhfrrBnuWjcoOXzAl56ZaNtVapAslQIh0nY6i5KS1PWfpzghARmCUw9lHEQ
         r4wfqMm5xYA/VoZZ8DTdDwoTGVcB1XHHWUxtMRvnwrSHBNT8xXgSbVxQUFaDFozvCC6G
         Wl0C/pmO3dwel7kLyYlkIbc0DHdIzFlWv3kqMyy84y5mSwvpckX8xhF9ELp5j8KxD71s
         IfcOvAiSYc0aNQPUApcSHlkXlaP3AIps8shGZ1rrfVQQBPPLGH2upNKqQC+VI2vsRyiX
         8zsxjnK1VlH1BfNgVr+Pl5lh7zOaCJq9XppYSL/Yi3Bbn0LPkck4e5lqYTbafQoHsNt1
         LW8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774994023; x=1775598823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/ArxbDOSErJ7EhodougJMCKbAuLfhBhgl8KvGgp1Vg=;
        b=hI+ZU316rzrg7e7Aifygasa404WPmfjmKJN0XKVyVRATCGwnsGXkM/URl7vqLwObXD
         q2x8nMzVT9xaJYJRr3NucWs0ZjcXhIx3d+UMKamrzxfc990kUClNRKDaObTG3NX0rb6b
         RFfMu9Y21lR9nTm0WZkhAIPY8bGqf9neHxUe+tepxvVzWHhYYz5HBoJmT5VWOzOFB9PU
         1SScrw32lJwxRYfmn+6bvZQ3uTGC37p2tgNQSdyhJ3V6hyT8W5P78mZl3gOFx3S0AxOk
         00dcimD5ozJd2QpbZzCPcW9wWLuaripl+vhtzovrK860zA4z0EIcogXjJRhHuZMlvg/B
         hfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774994023; x=1775598823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/ArxbDOSErJ7EhodougJMCKbAuLfhBhgl8KvGgp1Vg=;
        b=TNMXRkzpztL4s/8tzew3LauIfdeFWVeG9LgchlMN0kRjZbtpBzavY8kcjccKF8Gc/1
         V5gm+2t8t3LQ79e0Ok6QAPONksjLUqZbJvJozxavZ0gu2gllwIxrp0QitNAoCKGC4DoC
         OiKUwiLfkxb9aEFPceXnPT64A6/oJccKYnSxUHRtGcRQTTPHlmaVvzf4W59EcZWoIpTr
         jUODRzBqpG4PzorO5JUcanMFDydyTHuEZza9W7Rw2cTBAqsCpzqjwmJlT9wBKywoFQAV
         FjbIl00HuP+iN9kLgLelkvfUxb/UuC3Hh6hAOXaPx8Cm10SggBmh2lDR6FWGPe34Dcbf
         Mggw==
X-Forwarded-Encrypted: i=1; AJvYcCXllD9Ct5WM+uoJJEuSSE7Dj9Oda0t/o112KLRlPe3OlWMJD6XP8lCOm+2EzsjDOm3YSo0kPRLAz+z067h9hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4GVm3z3/YmfAR9ibgrDHCo46J5ERtLCfMKKZ13hHgRkhqIJE
	ytNPerllCBr/IjHDApb7XNfHj3K8qU4gjnml551Acl6xD+fviStUkHof5668pjP5ALREJGqMGcc
	jUglXj/bTBejXwFRVb2nRYhlInvp9o1E=
X-Gm-Gg: ATEYQzwxdH2vErwn4hNkIT9CMggsg05WBOAcwZoqjUYcRvwJw7ZfZk/gH9X/dr4KZLO
	HQHj9Q7IrdVH/Av770R3pZXZaKz7UpC3agfJlubEdNYfJPX4pKe4/wu8L5I0oKlth8l2977wZAu
	btWMffmX5HsLTE5D0M07Z9+HcQacvWQoJslH6EQG/bwk2jPYbFu/pu7ze7a1X1v1Hkk6vqGeGym
	BMnAw/N52NSGevsjgblyz52akp3o77BP77+McGV3vNEFc5B2OKWaM7gy6r6QaV365uhlYnq3SiA
	sBY7efmAUsbUfaiJLWdsvs74K69yL8ZNYlm5XBNvdjZloB/nv1D5Puoa54gasUGWnGnTFYdJFLP
	otOsMmc9XF9uYAHajzHoNK4R8v8mbXOSMhg==
X-Received: by 2002:a05:7300:1491:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2c932cbf06emr281953eec.5.1774994022517; Tue, 31 Mar 2026
 14:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
 <CANiq72=wsdJf1_qwAADhmKA2i7y9U+3WOm+9utE2rv52_eqnpQ@mail.gmail.com> <DHHANEJI7LQ0.3PGBQH34QK0DJ@garyguo.net>
In-Reply-To: <DHHANEJI7LQ0.3PGBQH34QK0DJ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 23:53:28 +0200
X-Gm-Features: AQROBzC47UfLtt9SgfAHiHNm4GsMBgtssH0puTNrVE3JRvF8RcuXvNsGPOJ1MSY
Message-ID: <CANiq72=8d03wo3_28Q91DpHs=LF8D5N3pmuZtAsr8gLuco5hKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I mean the lint is kinda useful, and I don't want to disable it just beca=
use
> it doesn't exist in older versions of rustc.

Yeah, personally I like the inlined way, i.e. I use it myself, so I
don't mind enabling it everywhere if people is happy that it only
applies to some cases.

Another consideration is that the issue linked mentions that they
don't want to mix inline and not (for field access cases), so that
could be annoying for some, which is why they moved it back.

Either way sounds fine for me.

Anyway, if we enable it, I should apply the other suggestion too, put
the Cc: stable@ on them, and switch to `-W` here and remove the Cc:
stable@.

Thanks for taking a look!

Cheers,
Miguel
