Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48C74E322A
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780120; cv=pass; b=PJvpcGguPRT09+CdveLN6fsaythfE44Q8ZZGzolgzR8YXy6EGxANfGFmI0Ge/2OOPqmq/40b3LRCSI6Pk1RoLBk6EX+88/uZQMjB8cNDP4q4TMvtpZ8fKU3hxwfjmJUzGuuPiOstyQWKdGdXj+d0COH7zZOexyKbSuL8vJJNDMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780120; c=relaxed/simple;
	bh=+9LhwFUxd3nuc3xpgPWp/vYsHWl/HfXCw8nLMlz0pek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtDb4NI6tU+rTAILFWo5nBVRZPXn6ThIJ2TjoOZ2h7UFBfzz18uYKIACnI7ToPsxEuvXmTdhKVsESaXiITaUNwxo3q/nX4GGR0m5Idp6bqhpNAIM7ZRPO0gpGdtSWG+c4VcWLbImX1cR27Ydnln8Y+x4qQOSJbnj+qzoriN2MvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfQ24We1; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfQ24We1"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so166274c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 07:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790780109; cv=none;
        d=google.com; s=arc-20260327;
        b=NpvpKZwxTrZXAL6hNx67oOSERUYD9gg5ifTChCv8Ugi+mTpaed6lUpPB0s5/DV8gOA
         T2hV6rCYC40zvZRPUzYGDSpSatI3O2JdQApVximCWMC7tMxedXoQEp1/1kY4in4Q5OtS
         IY/D6K+LjWXYd4EW4QAZQyFbmc17XKUAIB/E4+FcEei8LNNmlskjITAQXJVSjvf5Zce8
         Ez0j/LcZnf6y906d+MsfvGGUi9nQNpUIomqvxfxhhryXJ1iIq8qp4UkgBDyVyPSvplqJ
         iLFUlPZdLIFQfjFi7Koz0W0+6A2X7BpetG4hvVL3AGJUcze0FzpdEqw39T2yvxdkQMry
         EG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9LhwFUxd3nuc3xpgPWp/vYsHWl/HfXCw8nLMlz0pek=;
        fh=aE0nT4sxq5fUfG1bFyPdBGDs+PiSs04VBuH2QDVJHXM=;
        b=XFgqR9Dmy5D65QNoTml68O2Mz4cYlYFQYGSx+iCeN81265/NZacwabIsMAa7AiTBsr
         tFSgzi4ZTW70OF03ROPYC/w4wMlPTqh++sP+rSInVYU+uaA4Kd9KVzhcriAJ4UamrIJx
         EF8Q5P/81lWNOXeHulVUIg3gYOMHHJ1TvlD5vwxiGjao7UlXWgs6fHiz1+hByln6u8Mi
         6KBEwWfDxPF1gc5moxkR0PyDd2D7oHH0+TRnNiMkr5SVqUzIqBHvHsy47fvaJfgd9q2d
         Soy3QS104bqJExi8asUNuACciA/tJ2fynYEiRQK09UcDJvHY2KBGVggnvFLPO/iVcNFe
         VyXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780109; x=1791384909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9LhwFUxd3nuc3xpgPWp/vYsHWl/HfXCw8nLMlz0pek=;
        b=sfQ24We1pryQMJGE2pQ9MOBijyxeO43j/VwTvfKvkj02sGT788H95lfrGoEXB5q8yr
         ZiDM7DvYwvyGbcLlAz5b9QHZ1OuDntuIG9Yr7So3c5AB00/dAZI72x7lSOe/dC/nYRJ6
         Ax37J/bf2172HF1/cw7h0o7GtW9H+MCIVcyDjqMWXRkuWheqQ8pWEK0fLkzXfvVyjb6s
         3BBfTZIEPkRSy/TwswUnlUx6phPI7VABGsOs347BjNGlbTNWZL2KugASXZBAnuVRoVu6
         EVHOa/phNNCP3inMCYiFhDCMFtlQIUlnp0yZ0JwLusX87wOac7sJEpEFt+0fUOvCcB/4
         X7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780109; x=1791384909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9LhwFUxd3nuc3xpgPWp/vYsHWl/HfXCw8nLMlz0pek=;
        b=OsVNOVHZsFcVxljIyY74OVGIh5DV/pmT1bMVfa/MlZEZ5a4GADog+28EhRuUkxIZlH
         Zt5z9sWKHAYRZwBIZUbUvZ2/nz7cGWD1kMemn/7DVetc1Pab+oN0NY8OwA1YyUEwV9oE
         HU7/jP0T0GcS0NFj4SCN5oZAEevOHeYJXoAcfyaVCOzAFethzTrZc4nA7Jul06O6J6cR
         kDmsoUBwbf06z+jxdLeKLmYt8ZMPtjwLP0efSb7B+JEfu5VDBSEV89TqpH7DbG5aSaYr
         NF7bJvCzyIeRmMWZ8XhIK+engkqxYqDZw7API6ACNV5HpX3Lm5kgn5HuaaU6Tc8vb8vW
         ObTw==
X-Forwarded-Encrypted: i=1; AKwUvBxhHIxrwt9PVNwNQxSpsnU9mQUpKKhCfnK80Xa8RPZBeaVBoNTdW2zzhelfxEKyfLC8xGk12RQonj+EwvfgAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFOzHYUcofblKmNduXken/gGN/a80KFLZ66dWYHIKAIJEIQkJ5
	RTZpCvaArADexawo65+x8KCCFPxRc885J621B5AoGJK7YmKoYvMesNB4WGmcHamBZ15nxjMOan4
	LmarM7+8+o94iDUHnzDnKepJrFVnZmZo=
X-Gm-Gg: AYBFou3gmFmhIMivELiofCJg/2m2FgDtI/tAATMiB7AJ7spAzowBfC9FdlqJF0zUQS1
	wFOygi5aPQPq6OA39pzGZcZQuemlOm+px+bHR6v2m4yzML/CFUkL8DvtToK6stsVTCXaulML/x9
	L8U+aRBNhxHT+TEuj6z3IRtdJ5yrjGKKFsJz35rJ05TgyxOWFrCjmHjB8vgxowVllsKeN5Y4N7G
	oIBXFzyWwAfx48NlUgqz4QMinEBOX35rLw/SM40bISD/uc+y9LaTnvR9hgZeTO0Ner5qnL/Nz/c
	QmMusUwzB5/DyJ4yE/tH0ROtqI6MZWJrT21r4ONdltZUdaSOWvg5D1vhJ0+AGVeoKArjWXEc3Eq
	fIhTLeXOW5Qw7rMM9TFc9H/yVeedcb5FiunKg+gQe9NanY7z9M2PJnOAziPbtrt8D1aKZQBnD0T
	b2tCbwTuM+SKlpsPYPQ2ebexLiWoPiGI4GixBfxB20ITygS6J/SSM=
X-Received: by 2002:a05:7301:7309:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-34cdeb6be9cmr3096391eec.2.1790780109257; Wed, 30 Sep 2026
 07:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917051147.98775-1-tweek@google.com> <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
 <DLSOH1EVCWKD.XEIME3CYEYYJ@garyguo.net>
In-Reply-To: <DLSOH1EVCWKD.XEIME3CYEYYJ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 16:54:55 +0200
X-Gm-Features: AclHuK8vs1MTQYyzGwnnDdzCftKWMmr3adWgFDGOHVj3p0ypcSu7KLDo5vXWnlg
Message-ID: <CANiq72m=rhBDJSSPBZ3yXb_r0jiCq7f8KOy+Fs1k8SzWJUwkhw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: Gary Guo <gary@garyguo.net>
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:16=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure that this should be considered a fix. More like a feature.

Yeah, I had the same thought, but given we discussed the topic in the
past and we supported non-ASCII on purpose on commit b13c9880f909
("rust: macros: take string literals in `module!`"), I thought it
counted as such (that is why I mentioned it was unintentional in my
previous message).

Having said that, it has been quite a while, and it is also true that
for 6.18.y it may not be worth to change it since it does not apply
cleanly given the `syn` rewrite. It is easy, but requires creating a
next `expect_` helper.

Cheers,
Miguel
