Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B697C533D6
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752581638; cv=none; b=IoF+p7ea/aRgZrRlLMnqG+wtIK9HpFAzhBWyGTZw1MZNE8BWQX/OiZhawKHV87HPi8NXByI17KhxfZZJLQ+FSAyZzPKbbpEtK72vuNBNtCopKZXe/8xohkFzv6e7wJOmSt4H0B21KKEE2/sGMk3wYeMe2C7tNFsxkbAYFMybWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752581638; c=relaxed/simple;
	bh=jLXy7vlBx7cYAsSa5uQVBZocuvBpmf7jcdI8FKDXiu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I57X//jKYWTgeRBh9C8uQmWE2hL80Pob6v4aCf8skpTC8TnulvcAFtgEz2nRm5Xf+8KOlCsqvycGtmTO8zv1jIYAvDRmGpTUdtu8Gag2Bovx8HJtvdFqlAu1zOpUyXKU3+dtRPv54upm4Tf4CaZe8QmMnHBlINz4WCtxXcBmyyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwPDIQpi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwPDIQpi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2352b04c7c1so7922025ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752581636; x=1753186436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnvEHZQlzN+r+6/15sEZKfG1Tor6pZWndYOX/7dnTLU=;
        b=WwPDIQpiPgrW+e+3JArwvKnzRevv58ysskNAXADlTm694jE+ReoWh1lnYs8CrArA+l
         AgRAF14z7mq+XL+w3ENQo+rOJAOb5vpyBfPO/rJjzh9I/h9MBIuR1G0IYmIYVYXIvTvR
         zQSme1IyHcVpd5ADg1J3tHZ/P1QgP/Qh2RtZ53QTabqyb79y/4JumrImyMG3Ym/hczRu
         /Js+0SNlubYW+cAzU7f/lo8ssKW+653CkrniaZIxgoYtnJY5sSVLnzjci38Jzh+dOvla
         qXgz0LlctL9P6iy9CRk6rPzbfHigw6g1eD14hB198LiRyJYd3eUdcuNit/Lx8f4yiK8C
         fqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752581636; x=1753186436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnvEHZQlzN+r+6/15sEZKfG1Tor6pZWndYOX/7dnTLU=;
        b=izwtuxN4RJgWfM02CYIm6fMwbshoNHDavtnwYxXmKpwZVnHQomNvDB8Z88pH5CINHN
         8M2p37do9kg1GZ9pD6dAqM9tyTr+MkLsL8WKVc6niJywXwZuK7+Qxabso/VMTrN45kfs
         GbH8xnC9YQPosGCG7vfiHNBiVcTVnbxUZ6dvnYXtj2YI7iwjxP2uP8J10yf0QDNR192p
         0xj1qY6gNxfLixFBRStBQpGA7FIP2U72RIbbbR0+0eeNXyj5jZP2aI8l8Roeput5+ocr
         nQw/0RqjVB6rU3rdbF8/MNvtVmUNZ+wsTIvOHGvIfh1jJFQRSGnc24M/Eoi0sA9svZUW
         WtLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbP1rBiJlg71Z/jWXqIIQYIClrikAXxrhiVeYk8a3DbYzWtHNd345D/ND4tMrw473DiDaf222nAvJ/xu3ZwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWx6UOgZcwNRxid4TZsEuJqiSJ77JXjjuWX8WnZpvA78SgMRu
	UWEQQUCzgIvRcwwd5W3ejNMaWtS7y5pFB61AHyzAhkaQaRWTn7buGG2hg/HdGJWvsLEhKFUsBUS
	D7BKEjwJBy6NaCeYplUux4ahtReOxkv8=
X-Gm-Gg: ASbGncuDwk+XPemlvOIZqkyI6E02LuOBoFHx3Lz+TEwabYtP+8jtlN4ObbJMCPnI0HW
	Mlb7sjyuJdRIjirnpMGSsapeQgTZd3fxRosJAM11kEjUSPViorovAaXhn+bC5HYSP7OFtBpDTF9
	9ETL1nLrtwMINL7COjpvOSvCZLjle+TmUmP2ETk9sfFQd7vse7B4Xl6bhMIUn7wqiMp0lTB825/
	Oprl8rw
X-Google-Smtp-Source: AGHT+IFBs5bYYFxzAwWDjesNueVAOXX7E9SgDS2klfW/LpAxtaMXcLz7+AuogqrnDNKQX52CwV4pKlRCksDOqz+Xxi0=
X-Received: by 2002:a17:902:e846:b0:234:ed31:fc97 with SMTP id
 d9443c01a7336-23e1e9b5891mr8699895ad.12.1752581635629; Tue, 15 Jul 2025
 05:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87qzysqw99.fsf@kernel.org> <dMzjRfDkgj90HLRKVyXBm_Nlx98TlkiwW_FmbpiETAFOoQjihnqJRX2oNXYOlbr2DSVEM_uXHAHHysSOggqU8Q==@protonmail.internalid>
 <CANiq72mP7QAjnYuM44tu0ZaviWO4PNWV6Oba=LMwh8=FxJJU1w@mail.gmail.com> <87wm89hon2.fsf@kernel.org>
In-Reply-To: <87wm89hon2.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Jul 2025 14:13:43 +0200
X-Gm-Features: Ac12FXw-di26f-CMcZ2xrrw1oqABxDFP9MQ3qgS8mlXLsk23X6157Ck7guUIleg
Message-ID: <CANiq72k3kihVyPsDqVVRdq-u+dOfMYpt523tTi=G2tT+VtCb3w@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v6.17
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 9:58=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Sorry for the missing tag text. Let me know if you can use the following
> bullets:
>
>  - Make `Instant` generic over clock source. This allows the compiler to
>    assert that arithmetic expressions involving the `Instant` use
>    `Instants` based on the same clock source.
>  - Make `HrTimer` generic over the timer mode. `HrTimer` timers take a
>    `Duration` or an `Instant` when setting the expiry time, depending on =
the
>    timer mode. With this change, the compiler can check the type matches =
the
>    timer mode.
>  - Add an abstraction for `fsleep`. `fsleep` is a flexible sleep function=
 that
>    will select an appropriate sleep method depending on the requested sle=
ep
>    time.
>  - Avoid 64-bit divisions on 32-bit hardware when calculating timestamps.
>  - Seal the `HrTimerMode` trait. This prevents users of the
>    `HrTimerMode` from implementing the trait on their own types.

No worries at all, looks good, thanks!

Cheers,
Miguel
