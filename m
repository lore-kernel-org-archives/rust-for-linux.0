Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4478E3ECBF9
	for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693797; cv=pass; b=jsQ++eDNY1dJjSuHrvDjYRrO8PAjYtRFQ5DygoVs6tsqA/6tV/mpQqQSt6m9NjWUziuPmV0u+eZfzR9id21ScbnWfFyMYnvLYzhSQuWNeOMw9lssqJTOTmCra5y+gxMPBL+l6W0T+Cx/uJs4W2wKzJUVI+/YzloaZVTVJi9mg9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693797; c=relaxed/simple;
	bh=WWDuYBwwIhtZWxbZZJ+FGpgdtuYt45wkIZY853RkQyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lhfm0IaDE6K0IxVIHSdBQGuAAv78IMUfvEyfIEgSD1LO+DFk72+FdD03hMq3l28AsEBgYCgSx44rKmwihDqcN3z1195WcN5dH+FzHfecd+nm4VwNP9dcSHEEdRXOMQFiqoG502bdc057IrL7qzTuOuSQLJf1n9yZ2Vrz5Kq/BqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggtCXj01; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggtCXj01"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f13ae64db1so264349eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 10:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778693795; cv=none;
        d=google.com; s=arc-20240605;
        b=Gjao4AsUD1rjcvh2m8rj+YXjjyjDPVLkdIrKrvrO5HTBOFcdxY1Yml279z//UFeIxy
         9JvunQq4ezItZBwpiDxTGP240WyjcU09ee44ILd3HYvhjCpKzYc3zTcRfFlfLvwpJtY5
         aMeRyyv4qfLa364gJZKN1wRd/he6hmO2k71BEDh0bwfUqynpH52BaTb2D9zrLH4PNo1a
         ztL43JaOx+GvpyXBzpgxU42PtWh5ZwhALrO2ERjzO+orlEi8NExVdOZFjZ3/HEwms9Eo
         MZk6qTSgQVqGnqhBaKjTQAozbY6HENaqqIXTLp4bDKU9ePJ+2I1oukLyw0SpETgmTk6A
         xzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nPtB9DmieKata5LhGoY0eWxX4pYykFCJJKOPZ1/GTfI=;
        fh=5rFMkTIe0NkA/6vkA0kAF3WoHTUVTHwZ/1yP+m9nAWw=;
        b=gjXZzdTSkN+1PiOsMiE47BqrDlbM7NJWBnU0eh0sck/XuRRYOx04WpdI861Ffr1EUt
         HhVcVv7QizbiwVShqIGvd/96anVg4DW9GW0LR2qZlP+UYyARAviPhfEy04KT+PY677hS
         48/mv0mmL+xKN/bD14GssLYEvw3oEN7vB516GEOMly6Pudglg5Mu0knGERuEsH+f/w54
         6bmCgvcSyVuJEcjoE7aXIYDfMMJfZ7fTwkqqrBli8zN8JGPwRngMYAKtNDzOrewOe/J3
         FmJNbbnr3LUYc+ohxxAKjD8On4cs6plYm6gIvpV/03vf2PEIXSv3KAo8iHvN5/Lk0iT5
         MQxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693795; x=1779298595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPtB9DmieKata5LhGoY0eWxX4pYykFCJJKOPZ1/GTfI=;
        b=ggtCXj01bG7iZh+FSuUaFnrqWiqk/xoFxuK114Jy6dcp1W/Rpg793AfPga/QuRJHIb
         XlZqVEQLognVIm7nZf/xD5W29MAs3gqmsik3n9tpujJy5BWoYaYmnd1qKUQWIrW50qQW
         7QDbp/iIrOtoy+SzuehILTErxS9Qhpqz8ateF92ezLq/wG29B5eoA8grFo1xooUWtD3A
         vD2Ow01Qtmv+zGid0/C8brRYIEYQfpTLnN/PvFGcuVzFRjo2DZD/CDnfaEUlFjnZMhGD
         3v3TDJGgXTMPQR88Bp3pzc7p7KLn4IGpuUh6RSNz1MzTgxjuqo/NQyS2wDDw1mf4do4d
         3WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693795; x=1779298595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nPtB9DmieKata5LhGoY0eWxX4pYykFCJJKOPZ1/GTfI=;
        b=Y/WNHP9erG7ju3KWkKu5W47OUbVxR7aUhMbT/wiUax+tHHy5ChMUKVNifI52BtOarM
         2cT9F/9m9nSw87lkBCpKPPjjOgLPq3bhwPuTYvy8zdz4i/IlV87aOlmvz5jyUCGSMyHz
         AzQurxSPXwAWPlQha3EHOYpQg2wwMoRfUnllToys0To1yI3AjS8Orpd1NrGQxkGRkIXn
         Zx/M0n3DVII637myBQNUKqkcmvucZe6TGM6XALIf/ACl4NEfxxOo1khzaj3hb91UUArh
         6BNypPH1z4piZc/UzN7kBmlYYOhtDFRMUmrD2RPDz8qivIpPpdljDpZcGQGzyC6Nerd2
         1FkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+80Vh+yPzjy84MiGeAUwfvF9P6yGIxtgxNUcq6bdEzo6OHK/dmbPPmnWF9V7lwdYsW4GE6AA0sB5e8ro7odg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZEyc4il6RoIkv8JS/p/t+7rIBW0aD5m2AKLDeCBnUF+Yank5h
	Ls8MEAUW+A3pZAbxV1kBYA8RweikLgWlRym4y3eQ7/JKK3zkfty5tNYnVkRjaNjtborybEyDzBI
	9deh6awCjQt1ERBtigdJWV/G87Rcbtrk=
X-Gm-Gg: Acq92OH7Fqj26+366vOH7Pi6nuFT/oUWRG40vKDfTk0Gue25Z8iPhCNklCMc6gqsqeb
	eh8HatFt6duAsindIBkq1Yp+JEjUdQ+TbvoEbMOeYgZYSIOa50YliXwKFY8VnE9VHniiFr81E/b
	bQkzha7b85XJm3hkZwxDZyWZnBdXwdbcfzsCoRJxVtSWNxoX7jhGpnEHtkVBKQAtSUNQtZ1Xj3n
	4OPmB6SkzuHFESumLTsJyaMdKMiJ+xgPyxS6ZL8LfH78xRxF00xWQ3nub+9iWdIgasO4VJxjwNF
	Wrn6Mx0i8mRtgmsOV+8aNx/jk4Xv8bZlkeyAnGQVak1MwWl6jjQkk94WIq9dNX6hGmWgnbYexFl
	qprXvVmZ5Cpfj6bRKWgk3N8aEJ2sjJbdnig==
X-Received: by 2002:a05:7300:f191:b0:2ff:bba9:c76 with SMTP id
 5a478bee46e88-3011b328323mr1202731eec.5.1778693795294; Wed, 13 May 2026
 10:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-time-delta-display-v1-1-bdd2d6e98ebf@kernel.org>
 <aZLWjBWaBz4h4_SB@google.com> <87ecji58li.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ecji58li.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 19:36:22 +0200
X-Gm-Features: AVHnY4Lxn5IGpFyeKwjAljXlaCbyH8zM9SqL5IvAKOhMXQ6DXrYpny5OVIfwrJ0
Message-ID: <CANiq72kgwybgc+iD_btN-6s1OTS+mQjQWun=Q1t3Q=1NaAYq1g@mail.gmail.com>
Subject: Re: [PATCH] rust: time: implement `Display` for `Delta`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:23=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Please advise which of the following make most sense:
>
>  - Merge this patch without a suffix.
>  - Iterate on this patch and merge it without a user.
>  - Drop this patch for now.

Having `ns` may be a good idea.

In fact, if you do that, you could consider using separators every few
digits if the number is too large (like Rust integer literals allow
with underscores), e.g. `12_345ns`

Or you could even consider picking other units depending on the
magnitude, e.g. `12.345ms`. After all, if we are going for human
readability, then there is an argument to be made for that. Even about
showing only a few significant figures, e.g. `12.3ms`. Anyone that
needs more should probably be doing something manually with the nanos
anyway.

But it is up to you and timekeeping, of course. I guess it should be
decided depending on the expected users and what most of them would
want to see in the majority of cases.

Cheers,
Miguel
