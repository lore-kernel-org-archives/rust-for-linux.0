Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB744D8CE
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775301208; cv=pass; b=rHEX4TX8e5geruxyZzc+70swcJBeVbhmzBXJ40ZG0PRzihldXO8UoGy10iSJ+xLFHwZ/jA2LsftjVSw2OXsC08wRe3/+pGYkpnwJ5wXTGuIM+xbF+0hffE1QvKJCvT2eWTZwYiuxuAgXxyadjX35iHr0L7e8aP6XflNGQi1I3jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775301208; c=relaxed/simple;
	bh=0lEaiaIkXKKFpbAgX9xiTiOJl0xP92VqRxY4H7j9rTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tnyxEnb+n7kg1Pi65m4vSkPXuRQNS4sU9My4+Q6s5ng+4bkZNhX8h8yUTeJbfodv3u3eSoDIja1k77mlqoySpWrUdFMpEDMuOVYGPIrMIRiTtmfX/eEwT+p0QB5IERXiQkY6dAzzKvnMDyUocPkzgdLriHRAoUOuEpXAPeZwIPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1YSehE5; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1YSehE5"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c98928e4bfso224666eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 04:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775301206; cv=none;
        d=google.com; s=arc-20240605;
        b=IFF+nV5RYHmoSe7llfTo3U3zLXPL4gqVdJuEJiN3GU235L9KBXfCLF5WUA03ax9Cd6
         lvXUNd4qMTzbYBwVQ1Thz72dYfQ+SLGStwSbr2Wd6LVbCpclVRGeAB4w4Qa4fJkpSZfP
         mANiZjZ3J8qBH+D6ENWfNlgNrn5a+jmpYWugXcXQqNyxoh4ciG8RWebx9BEfTTNdH6AV
         lcStZur48n4pJiErQjXzYkEBzkVX6mkFr0IhasU9M1TAfBdERGZxKa8aYQ1j57j0C+hx
         7DL0++IpBfYsUaoh8q60IB2WZxdogZW8nOAVjFvwHoYAle8pbtemBd+2kHWwYh74mIHq
         gZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S9GACnMS8GcXC3rcZ2Qet1UDngSK/R1MzeZjsApbxfY=;
        fh=JRXCEy4iyQTpIe3Js/YRNAZJvujJZ5QslEe24m8tUnU=;
        b=YfIWP950ixLfB2B1hh49+EinGpGmhvCmtzuxhxXjcOe4JLoRqSj4AfHkDptkI6BR9k
         rB6Fw+ajkdXqwiTwyTPzdAIfQO/yGYqm+FUj5RtZcAXzLQw4aflSpYx9DwNcqTiP1J/t
         ASnKkodbSFlZbYQgbEmm5BrW8Ke7ZqxFTQngmePiLLysQGeTQ2srxdVStPpbdOM6YitG
         1tVBz44tOPc2zu6vyatTZMuwXEVK73TcwwWMULfhQIwB1pQzPucgB6+IKnGojhBFEPxF
         XQnBKOPbVJsr/NbxMBjwtB68qqVL/wEupj8ZnPjMpyrUhEtk2+SAvDNvctSblxu5Kei/
         jHBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775301206; x=1775906006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9GACnMS8GcXC3rcZ2Qet1UDngSK/R1MzeZjsApbxfY=;
        b=C1YSehE5ZQ4G701Tcf9yjRMq8SJKr/Iwi6ZKlbTgPescFNVhTZzuA00scyjMElGOur
         ua2OnxBv9YAO3CFS/Wi7Ftn5r2eB8hCgkL8yDxARhFYD+moTcig/WtC6Rrrf4R5l9SF5
         Sla6rybu8NvypLaYXHdS1o3fiW0EhtFDIVI9gAAHbdIpBQE7hguW3igKQbHOF+sNWYFk
         iSDy+I4CSL6ECaR1S1e52pp3vkREiPsGxu8rZTFMbAnRYWxe7/OOfhbKHcHfGV73IXGz
         tKNndxw51lcZmKHiscwkCm5S3fMr8QwRIDqpj4pkWSAJx+FpWFW6BcCYBAWUHSaxXJNU
         Q90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775301206; x=1775906006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S9GACnMS8GcXC3rcZ2Qet1UDngSK/R1MzeZjsApbxfY=;
        b=o2zbZPkkAqoIXI6pj9/auE0EeLxibX7NH+59jgIHg/wkhQvk/rPP/Gj08eQBqoaVWC
         iuAp9wkHU92r0iOLmGu/v188wlGR4Tzpnz2aNOffdraBMYK+WrNRaQxB+P7MNhFNE2fN
         gyGiKjxe+jtoQrTicnAi7XDHV7Tk2LIp02vAGTAnJwkssPDFgeNayFw7Jpyfkfok6hly
         z9CbAgbh5PMEpaXCdPXZs3bRoxE2z9whvbhtESMSbsc7AuQBpHtKwyyhGDjBd8YrsIEa
         L+eHHlTHxbU6qdHL7j07dhwyUFOsZGkg1oHZ/qkqGMzWdwSdO07rAVUYmaDaOcjC89qL
         R/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwLRIsgkkFYJw06ajxXAStjrxTPnA4wuQgiaYbvo65Z2y6URlbGUUcpylHdrIXkBuih1bFbLAyY4x7UB8RLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXjtcYgfSh4+Dd4vgVuRzDBwFexzhTqWjvGNzqJly6k+rkrdFX
	DputmylLus3VM1yNzkb1S7W8kS3iQxGUXb7Tl3V/N3kCQNL+WJ/00SMFwSTa1nkZriHyZH1gAHB
	98VnhNReu2H92ifR0FdonO8QCXTYj/X4=
X-Gm-Gg: AeBDietff/Lj73Cd/NbORfd723SY6U7wv3S7Ow2UY1jbKnzGTAszQWDUM0wwCFJueWm
	jXNXQOjh5FhpxwNroCZ4eXsdY889i4hou5rLH1xvBWZCHm2E+kkc4tJndTE/6LyBraT1CL7AZG0
	wLbwodaZRFzdS6ccU8V1C4UD0Soow659aiTfdGcaHMs7Fi4KwfRZXJPStqNoTNp64Dj013o5DsK
	N9e904BuDW5U1dwiL5CIzN96JOYXL2kG6kmhbg/Jbnm0BAyO07PpxMH1e56gzVa3JSlyii6nSMx
	A6KzwHS/vQ5hvda21k6wYervXUOtJVeYs+C3M6Yq2iufnK49zwCdpTMb9y2WeC0Zt07LC5+YPkI
	I3naEeLX9FgX9+9dTBfqyZ9z2iE6UXbmL8Q==
X-Received: by 2002:a05:7301:5793:b0:2c5:704f:7157 with SMTP id
 5a478bee46e88-2cbf94ffb65mr1336403eec.2.1775301205894; Sat, 04 Apr 2026
 04:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404025821.386514-1-jhubbard@nvidia.com>
In-Reply-To: <20260404025821.386514-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 13:13:13 +0200
X-Gm-Features: AQROBzCKMEUYIsQHnoB-GacSkb0tvcH4KW4kz4KDx_A3rMY74MXczTYbW7tQauw
Message-ID: <CANiq72n=7Gnq6=B+m3VMXMR7f365zkhBq5te34cRHWSAPrd8fg@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova-core: fix three clippy::precedence warnings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 4:58=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
> because the relative precedence of << and | is easy to misread. This was
> causing 3 warnings in drm-rust-next.
>
> For read_sysmem_flush_page_ga100(), add explicit parentheses.
>
> For the PCI ROM header parsing, replace the manual byte-shifting with
> u32::from_le_bytes(), which both fixes the warning and is clearer about
> the intended byte order.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Please see:

  https://lore.kernel.org/rust-for-linux/20260401114540.30108-34-ojeda@kern=
el.org/

i.e. the plan was to allow it, since it may be a bit too annoying for
some. It was also the reason it was split upstream into a new lint,
which is why you only see it in Rust 1.85.0:

  The Clippy `precedence` lint was extended in Rust 1.85.0 to include
  bitmasking and shift operations [1]. However, because it generated
  many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
  lint which is not enabled by default [2].

  In other words, only Rust 1.85 has a different behavior.

Having said that, if people prefer to have the extra parenthesis in
that case, then I don't mind to keep it enabled.

Thanks!

Cheers,
Miguel
