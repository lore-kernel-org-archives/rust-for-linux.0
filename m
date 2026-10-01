Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCBC49DB96
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885725; cv=pass; b=hJH/mYx2NCmFy1cAXOgegCp0CdJ/FK9dy0gPpvnIGUp+KdUWUZ7YoTWst3MuTxAqitPH6hn/WhXiZDu2RGAV0KbxuVtrlm1G0Ix4b3zVyZJm9K7Mhne6w13MoBGOSBNmnE10yGyGhseoK1kRHDnev5CqPj0eMd2wSbb+mPDA7Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885725; c=relaxed/simple;
	bh=xdsuKJRUPTMCYHnn44lGREsRwQPG7jyNO7dEeNDGY8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CadnvCWXUCMgpuxazlJViKETcIJ6Ec2qvMtDLB2ZEA+F2CnxIdW1/N5A48ZUwJGz/EVtvgl3A2rrBrQqt/1fPMdY9zopzaiUCBpu24BC8rn5/c2+vg222mTK+z+uV00y/VHIWlixOlT7j4wOBdYv6+kIJu+lp00AyU+rUNCw+lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/RD/JB5; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/RD/JB5"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso558867eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 13:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790885723; cv=none;
        d=google.com; s=arc-20260327;
        b=He+11ZR2aUcCEja12cDBXBRMBW4NnX0ue6lhF0Nhqpd1brFahZx+jH+C8A4difvcLw
         bF8UcSNU+mo11ytwiS2m/Qoim1hyxRw4xePbXhitYMXAjmRF+1tNek/5l4FI6fBvgX6X
         S9QHYkMGJPwM/LLdOo1L0pl2HtfKYgCIVLWawcAZHLpEA8h9bp53CXWlWSfvsfVrWjpQ
         udy1XztPXI8TDs5GkcTtPAF1y/d7pM4NuJC9Ow/TauRYBAfwF+kLnrpMcZaj8Ms2akzn
         P2dhExuYzwKdFv97GAkeL2n8CCAPEyAq/5VvmEiG5L1Jbg+8fqy6qtRCozVrzW9c2IDW
         6slA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xdsuKJRUPTMCYHnn44lGREsRwQPG7jyNO7dEeNDGY8E=;
        fh=sFZIqZaYBz6G88KWxZCmTNLj+vni6WphRerq28CQHC4=;
        b=KPy16iXt6qvgxRwmg6lsu7sEFwIW0OQeoK6qyFVfrmcVKCu772SVH4diHpp9QJz85f
         9Ug35te1cDMpZ4H3hXIc/PWfyUUfgsuoLY1N/k/d1LKP5RlBa8f631mlT9Ez1HRH7iIl
         tyspfDLq1GZpWDRs5htf3ATRDCYm8J01PNae2p0L4fSrmHQdn6qpukZg/gh3ywgjzrf6
         O/iyFDKi1DJvX4vJba2mowF9l80A7ILss2+mewBrHlcFbFVb1TtfNyWG4oZWCfrTsS76
         Adr/keEFGtH9kFaPeVWvdfqyx4oXuOsD41Phab2dtqMeT3hvKtS6S8Ka/JXjN71IvPjF
         +EtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790885723; x=1791490523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xdsuKJRUPTMCYHnn44lGREsRwQPG7jyNO7dEeNDGY8E=;
        b=O/RD/JB5sjvwoLnrSrxhQx2HChO8ZkGmT+DBAaE6QI5RIZjOl5RYbHFxxGtf4TZlGR
         /FsqMAFZ/ByWS7CTjucA9/Y2T+5UbaFJsjSFtmXzEp8CTD9/uoBK0pNY27LAMv1QyuLo
         E1lvi/y0sHrriLZN8x+cAM5IhiWPG4zyP46b+06WrnpkHvz7tOo+Epl8ikzqWjUEXR1L
         a8LLvMwcxeVqBKCe8UQ+st0CUmlz9oWT4P1gVeIKlbERso7WYEmIPMCUpKsyv8I3UD4j
         H7Uwy35LUi2E/wx0oxhgII9h6W9TkzvDVUJisZ456ggmivgoQSlsTOB133d4pG6pfA29
         CWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885723; x=1791490523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdsuKJRUPTMCYHnn44lGREsRwQPG7jyNO7dEeNDGY8E=;
        b=ezmLuhRxEBKRcXZybzwmLB7d1hJ65atO125B4R4mbksNcK9FoflrMucM9jyOPQhjL/
         QFOY8V0nlU2WK/PTt87ns6ijkE0xq5mxxk+LnocB9owIw8BTQgd0/xJyqw/zqyeQEvIY
         1vU8ATzFknTnEv+PXIEhhB7w4Lw++nuukISKt+FgNQkUdXZF1tLrUd/N0adxbeogV2yi
         RwaceNGZJkwJcY9orZ8hSpzq7WglztHbqAHsjyiTbjQ4ClWymCOZiC1A7v7vUyyfnv45
         vw6w+B1EXBbLHnu4irot7piN1H7vPjDR11RMfIQOJwlF79Vlq8oqnuoPs8sk6wMCxgrd
         uSGA==
X-Forwarded-Encrypted: i=1; AKwUvByc/JESYP5OOOcDJhFCfnGrJkcCoAPV6Ulqz6G7lR9s1umWTui9eNx2cTmwl9MOk60EUdNWzQ/0NFGfOS7uQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK4v7lbEHlM0bh2gju7w+Yz1xSRD/GXEl+HXvu2tqueaP6GIFwd
	DeT2+YzDlhP+QICOPIB3i4KzchCHIDLKSwa7SUIuj83WYi9y7oKVNv2yNTXxhOeD5MA905qAr1v
	AGluLTZGvqfxn7W86IQRLHJhizeuXBN0=
X-Gm-Gg: AYBFou1YVMgNf8XSCsPv/nXBgejYornsHft7/dM53TA8jErnSxLQdUEj//BAheaaOf0
	a6MhzXRP+2EyCVQ9I73Q3MXhcD2QyWCZMdKTyj329AfERT9tt7otVosuHQmv/rI9F0AhLV1Cq9V
	c5t7BD+WNLsdu6Dt8jdyCEynIdq6IuiY3duWzDyJOOUixrf/R0mExRoIplWsHlUhsBi+EgzIfoo
	VtLYA1aDaN1T+lQM5DefZLsRiX0eQLxfDxQ+VT0Yaa8Fbp+98I0hOYAAFLgj6G3HYUmDqpjqY/O
	/vaQqvL0FV5d8Kyf8+mhW5s0rnnZ9gg413+KHpFEqd9Umz8i6RP8xi9jW9Hk5WOSjX+I6ixvkCF
	APWx9Qy5C2I3F/rouHmqsuXX3KCuiuEGfITEGuPnF2/ouByZk/hzx5WLtbgNAICAa/7u/9ALOFu
	hY6/kgtG5LgzWnq/JcN/GbIljTVHZjyXtZg6HRPOjdtRJxM40xz7A=
X-Received: by 2002:a05:7301:9a83:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34f14ffa69cmr713853eec.1.1790885722936; Thu, 01 Oct 2026
 13:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org> <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set> <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set> <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
In-Reply-To: <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Oct 2026 22:15:09 +0200
X-Gm-Features: AclHuK_PqTgVixaCB2jBczKY92-k98QEC3Sx8f2chA4JCjVJrl5imL-InuRiNGY
Message-ID: <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Burak Emir <burak.emir@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:38=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I can do it.

Actually, `cpumask.c` may be better -- that is where C defines it and
that helper has the right `#include`.

Which in turn makes me wonder if we should also put the Rust one in
`cpumask.rs` instead, rather than `cpu.rs`.

However, we do already have `nr_cpu_ids()` in `cpu.rs`, though, which
is however in `cpumask.h` in C.

What do you think?

Cc'ing cpumask.

Cheers,
Miguel
