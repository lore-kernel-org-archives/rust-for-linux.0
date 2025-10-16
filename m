Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CF4155326
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760649887; cv=none; b=oNkIDWlGUx2lVvBqlw28Cn7s+wauTtXr+bZDqnhm7rvsUrHF3A2l19Vt+idGZjo6SmYgFTOuJYeniDGcqiK/xUJbU4HniXXF2ojGY1y3L5xorKknaMQQAC1uk1FZqYoEiD2LPfM6XPlIj/1QqX3bMXAHkEgsyLaINF8UMbX8O8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760649887; c=relaxed/simple;
	bh=GjJ1WmiRmWmpJrjA0Rajn65qwKkQDgHPux/O/uor8Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twSrxG7LZ7WOZmYO93wtPDXJZoSl1t4HOLckm4tSkieR6k9NipXSubLFpby0ngZ/XIjPe5IxDXGXaeloT//LPm5xSNDdAcz1EcMu+kEjKsoX1UWWqRcqYPn2Li/tu3khsck5amhJ0crfsrNmVXN7NkDjHWgYa/pJ5q2CmhHvs9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2QdmWmX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2QdmWmX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27ec3db6131so1891945ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760649885; x=1761254685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nrKPmUCwMPDYDiZh+SWdu6MfHF7qH9Oc5WdLHC9FKQ=;
        b=g2QdmWmXxegpgkzJSBhaldKE86gPX/kLptJHGVORF0aLJvz+oXQwRzUWLFWaXG5CBB
         amUm8j7Coh4+Tl1Onjj8ndL5znvqQTl5YaxdEsYbBwjU9A1+ssU6vU7i9/AYaBUVkq58
         Be/YxZpsuNmvWgEfg/tUOO4D4WJf1vH9LgUw9/oQw9V1+k8dvxrwCVS2eXB/xa4QBEjr
         C39A6UNqJOy8AwVDTk3UVXOZo7vBoe5FCiaMRiw5SUo8bTWmC9Q2ZzrVSjF7Xd/L4PbC
         UfjUrOPtHjrfc/I9i0JZG1Tl+sCqpCrjurCoDZyxHNVlnQUAguxnpWRR8IZb+wO2op2i
         lW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760649885; x=1761254685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nrKPmUCwMPDYDiZh+SWdu6MfHF7qH9Oc5WdLHC9FKQ=;
        b=vHcE+lwtx3cbO7wYGEaCscGaqJOi2O9LXSW0zYcQoNRpIwm9Fv1zZejPcz5Fbf9KvZ
         X9jsJMVxsolcm51GiHi5lOnUoA/pFuSFD0ypiBQb98UNOJCqMDzZPLEBS0ADKZZZN1fB
         +GCi9ndwsdIeQYuWqcTyHd92fB1u6G+A7p4Ib61J4XCv/wi1jcCZeesYb7LqZbceHl7i
         K7ixla02+W41KP/806c1xKDoG0W/vZx6r3F4atxewZnLuaXpAFfaGgtRPyb2AyqBW4xO
         aE3FQPJg13cEsuzXF6lO+WR9jzDoRda6OqykSEis6wPb+oNTrvknGA+kN5y9tofwvJiN
         wSqg==
X-Forwarded-Encrypted: i=1; AJvYcCWpVYBzTSFJUX/C9rq7ipDOJk9sI/FW8/ygZM2VVut1QPV7Zy+MPjb8JB3swmItSOpfA1uOQO6tXZHs4bdXeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkGQNFwEnfiZ5amXWuRlhd0w+UOPoRHK6DSclcCPMDSeX4XeH2
	qfZSBlgBVJ00WWoYgjfdchM4W/8Z+qXYCmjo/4we8cly0+QAmpDhZ6A5NdJaBDTavvm62V8bTS1
	de7Az6CKMd6+q0piwXvPtcsSm48VT6dE=
X-Gm-Gg: ASbGncsoa6I4c0xLtuXW9sksxNxqEKD6dKnMfVx0AUAfb9IjBci0xEXmP/zQIAp3wZ9
	X7lDTsYPmiejmqxWMxyELicTyRoUCR6cAHl6NYA9riddUfXM6zuXnySEd9MiIJMkBEr+yYLHvqx
	zsRrv8FdCxRLftUTkPmrcpgyydYDp9VUl+1ZrNpxZo+3KiiBE6iT1/UyywGHPXwOz5SFtojsCOQ
	L+dlyvYZh0vAWf7kVXcparkQrFzLddkdDLp20IAW+ct+NeOpO1V4Ls1oaeSAuKuPmZv03fdx3lH
	Fj2FibsYduLOLjO/JnZlod8DgLUvtxyY1pNrkZgvf8s7bNF1RB2TlfTG3B3N/i8wrnVOeZjgvWP
	dZ9RNjuxLUhtKhQ==
X-Google-Smtp-Source: AGHT+IGnxgBRJ3U+G+Rx7edjM57XlaxeOMOXI3o5gi2a34CPb9gCivHNo55oa8Ovom5Sgq5XvaFoCPqdKPPRGNcGOgk=
X-Received: by 2002:a17:903:19c8:b0:273:a653:bacf with SMTP id
 d9443c01a7336-290c9ae1dc0mr8912775ad.0.1760649884726; Thu, 16 Oct 2025
 14:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016211740.653599-1-lossin@kernel.org>
In-Reply-To: <20251016211740.653599-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 23:24:32 +0200
X-Gm-Features: AS18NWBqY989ayloddTfcF8OWEnJ9InCFTkCC88WD09zgOYwhDkhIBRAyogFVX4
Message-ID: <CANiq72k8KmpFyKAFZ293GDUWx5=HJtksR02hTU8-H9PX7xsT+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: fix broken rust doc link
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 11:17=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Rust 1.92.0 warns when building the documentation that [`PinnedDrop`] is
> an invalid reference. This is correct and it's weird that it didn't warn
> before, so fix the link.

It is because it is hidden -- I have patches to fix this (it is not
just in pin-init but elsewhere too), but I am waiting for confirmation
on whether this is actually intentional behavior:

    https://github.com/rust-lang/rust/pull/147153#issuecomment-3395484636

From the early reply I got, it seems it is not, so it may be that it is "fi=
xed".

Personally, I think it is useful, so I hope they keep it, even if as a
new opt-in option or similar.

Of course, we can land this patch since it does not matter either way,
but please add a note with the above in the commit message if you land
it.

Thanks!

Cheers,
Miguel
