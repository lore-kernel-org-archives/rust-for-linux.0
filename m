Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C241D30C373
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768774473; cv=pass; b=OhXDNbp22EonrxZX6m9213xmefi7LrY3D8JAdpgE9e6OaxYeaZLjIPN4ZRkKKQ7R8Obg45jVZ2Qr4K7SM+10Ea5JhERuDPvRnuUI3p6ESwYZyOGNJC0j3tqfOLW5rRvpaBtE5tWYvhZVPdg/oO1BvWu1J2xmuO4MuqVNFKxmtgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768774473; c=relaxed/simple;
	bh=rFVaXTamawVca7FcuOUlaGPv4PCZvXD301YzgKJrMFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxPpqpxHCAQ/WckvdWswg4S7hTAjNGbUkWwCckATCRYPLsK1Yk8UjMafYOx6kuZYiXPK0AgbAA/Pwkbg2eUwqc7fITkxClCK4NevrFYgamuQlAeaSKgJiAa7Uf7IW2AMiLGFTqAfzBl4+HVzUUES/G8tTwReMjRDEpRsMGKXMNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWiIQ9HX; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWiIQ9HX"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1232c98f98cso254664c88.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 14:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768774470; cv=none;
        d=google.com; s=arc-20240605;
        b=Kos5D+uarjVz0+NEPBxvnDLWV1iTy0t9/1Tfebjn7dpWeWBM9r2n3TuU4RzJf82BfU
         bGFSbSziZIWgYSYOKS0XiRpmNbTF5rTBIjClrjAOMjxSGtJ/eyYTz16HdFaQSYDpfrpv
         ZBLGG9kLBcaE0nA0WhAyygCeXrbdTd4E8Wprd4PysWodn/swqOlH/OQeSth1Ne7bxJqk
         i/yU/v2X7HZUrRW9lCCNxzRm75rYSHzfveK8AAgS1ROsFjzywKUXNIWp7Qspb9kNQQGf
         AopiQ0fCKgFa6Eg1TtETOuGEu63COjpZqodu49xvbyPNLPv0XSoiB6SPMTKasL5QxMGU
         RgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rFVaXTamawVca7FcuOUlaGPv4PCZvXD301YzgKJrMFo=;
        fh=6M2v0t/qvuY3h1WlIDnDMOGlmS9PlCyhDvucDzshAAM=;
        b=fHb6FyOTgGsYcT4nkjspH1kSns9MxcpNCyYmJrZ3KH6X5dV6T3ItEJHJnnkpWVh7iS
         VMvrGpLb1eo6iAQfzoIh3gCM6K4Xw92CFVf1qGF05ySQQQjfHJg4JmybOYqWGS3G6U68
         tGuhYYfWJ6N143lxqW6txRxacZIUVj93lxEwjgT71TvngMDQhpxBdUWqPfTiACUuu2pL
         VTO94FFxOs8s85O0BzZ9XBCGvLbr2rviFUyeuRxe1/GSEU6CALcPSuygAaav68RlIsA2
         EPYvIviLFN1vMWyq1XVlXVA1+iiA5dVfTq/OKE1uwxBji6LqeqXP18WARNsUmiH+GMhi
         zJXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768774470; x=1769379270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFVaXTamawVca7FcuOUlaGPv4PCZvXD301YzgKJrMFo=;
        b=JWiIQ9HXnyHlxeIvNWseZ40qClOQD0daZAW7xELlgF2Z49UCc9kJLgiUguxqUqG+zS
         4lnqx19AF6FljkTUWlCVJw4cTNX8JMz2XXeXSjtZYd0BzZxVFTWV+LiKJoVzbXHJdp4+
         89Ow1Uowhy/mJ83wPL6NSVCH8n5kbAUbjDSBaJlSULg3Yuk893QpFipIsVLtn4mtJS1k
         hc2CC5sPxBjb0ERpzMCTWvE89HvvDvBb+XaPl22AYWf0DM5vkZBCcGqCQkPVHZDjb/0F
         S0kutDrDqrjyo6bPXRTe+wZrpW6SxKuCiI7rYtz0s/V7nY4A2jUtq8xvRzAsMWpFgW6y
         Sz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768774470; x=1769379270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rFVaXTamawVca7FcuOUlaGPv4PCZvXD301YzgKJrMFo=;
        b=bliXK7G7fP1srsSX8LNSEvbuutmHp/j/Vlm8shQ/awW99n154FIbb7pIolpYwCwPEH
         WWp81cH4ChxIgWMf3A1bD1P7pgmldv/OIf0fVDC/eN/+sl7eXSRwWiy2cKcJewOPAWiX
         UTcEPHojh1ulxpyLe65IciiIzeTYNhC4sryyDWdxiZAFezuWv9mnDg88dU4BTibanMj2
         80IWznYHE18x23jRYeZKwPqdBqzWatJhx1LcfBB6qBz+AT5IaVsoiQF/r91fIQhYOeTE
         DOs+R2wT02o7/+T/6w5hv9/YMqBEE0J69MEvx1pi0TRhDveKFmSkjcuP8fZ0P7Orxcc6
         rYBA==
X-Forwarded-Encrypted: i=1; AJvYcCXrNALkUiQofsbgAR3iDPS8IghECcMFsXc97lC24DWLDgwOYVXXc//o7Uam4HJqNw1y+CvkXET5yb6ZmSL96g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzEK/tJw5JYfM8k+zAn0/Eu3SbMiicUorYKbnhiKex/XJMqm7X
	NCf9BM1cNtArjibqNcQ5ypdV+3rXi5KBrslrxpt4IAY5alT8Bx6XY3p5lWFS4OEFKy+tVfYrN86
	vv4oPQEstsH4SjvUx0uYFCUihRwsCfw8=
X-Gm-Gg: AY/fxX5Xhm4fQQB5EwR8nsR84DsvNjekMgJWczVwvFSpg+qsnGLztEAj+LROjMphL6z
	vIY9DbhlUxxJ5kW7HZG7UEN6lTkpjf6E9bCL/ICiA8Xvs/U1TDOFy+cj0CgqeokenE4aA8F7aJk
	mOIUCVnn1rImjzILjjelXzeBMmNvqIFABMI6QTLYjXUhQw3Zj+rjSOnR8vJds8givuAha1Yn2oi
	4UYm0JcmKy/RpaQ8o1cAuAVR9tNkdC82KlLrcUdL2O1MYPk1wO3V0pxZRzEgGUFry0NX6vv7OIN
	o5xbV1gKqWbhm95sDyORnaX5DcbuKA8hTU00dfuQWeGWwzZ5nEYedyOkxobjMc19Zmb50CXlt2k
	LbJ0MPjyp7tiK
X-Received: by 2002:a05:7300:fd0f:b0:2ae:605b:d530 with SMTP id
 5a478bee46e88-2b6b40f82e3mr4624275eec.6.1768774469760; Sun, 18 Jan 2026
 14:14:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130211233.367946-1-seimun018r@gmail.com> <DEMK8K1I3FFY.27ERA2LKI7MYB@nvidia.com>
In-Reply-To: <DEMK8K1I3FFY.27ERA2LKI7MYB@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 23:14:16 +0100
X-Gm-Features: AZwV_QhbmS6fYnaLHG9OmfFPvxPSjjMQeHjogZCNf2NRKzxWYqqnS5uWm8UjCzE
Message-ID: <CANiq72=BN3gQfBX-0abv+8hDKDL20JC5G0U0BS=r3nY5VB4a0g@mail.gmail.com>
Subject: Re: [PATCH] rust: use consistent backtick formatting for NULL in docs
To: Alexandre Courbot <acourbot@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>
Cc: Peter Novak <seimun018r@gmail.com>, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 4:29=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> On Mon Dec 1, 2025 at 6:12 AM JST, Peter Novak wrote:
> > Some doc comments use `NULL` while others use plain NULL.
> > This patch makes it consistent by adding backticks everywhere,
> > matching the majority of existing usage.
> >
> > This is my first kernel patch - just getting familiar with
> > the contribution process.
> >
> > Signed-off-by: Peter Novak <seimun018r@gmail.com>
>
> This looks like a pretty good first patch! :)
>
> Just make sure to put the meta-comments (the "This is my first kernel
> patch" sentence) below a `---` line so they don't get picked up in the
> git log. See [1] for an example.
>
> With that sentence removed (which I believe will be done when applying
> if no other fixes are required),
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> I have double-checked with `rg '\/\/\/.*NULL'` from the `rust` directory
> and this indeed appears to address all cases.
>
> [1] https://lore.kernel.org/rust-for-linux/20251124-bounded_fix-v1-1-d8e3=
4e1c727f@nvidia.com/

Thanks Alexandre for this welcoming review, and Peter for the patch.

I see Cc's were missing, which explains why there weren't more
reactions. OK, added everyone now: clk, debugfs and KUnit.

It would be nice to have Acked-by's for them, but if nobody shouts, I
guess I will eventually apply it...

Thanks!

Cheers,
Miguel
