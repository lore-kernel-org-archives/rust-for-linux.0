Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F581A279
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705570379; cv=none; b=WxmsCogwYgO5xkuWDBH62eXuCD6iDKYbd6+Ps9/idfHOxLIj95fC3L58FnMoSOm8NQGHUSy33uDgc0Jplqd/gj5KkPjuWWZ7g0TFrd8h75XlkyTiZHuUHuY7yvJQL1+fdQVYvUH5Y2Gwvs9G4P5xYdSvujYQjO1ueVea08tOWkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705570379; c=relaxed/simple;
	bh=mfRLT1ZTYMh35t1IJwqIq/uG5hdyfPymCOmiW34GIFU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=lLge64OYwDLo45oybxUAXPRtcVPsNv/uaqGl9OtnJMy/qetawfoHC5SfGCJmoKe3DaBj9dhF2W7+OHuaTZ5FEvH+65oLP2lUe2U6YjZjgDCM/NM+nXKLIXi0XSxEeTrf93DaR7qZyiZyKy/CMWTbXE3ZOAy2ObNKJGktLj4Dibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9vVCDxE; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9vVCDxE"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5edfcba97e3so126308457b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 01:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705570377; x=1706175177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfRLT1ZTYMh35t1IJwqIq/uG5hdyfPymCOmiW34GIFU=;
        b=P9vVCDxEFtPtKf1N8jl0VVs6rkI6QrXEE1RtYR9SvWH7gFO5bz/upLyYZCux5jX1zE
         ViOqOkPMe8oMKtAFqPSEbZoNxHyJjgp8GNz+wKkzr9o0b0Sd7WpjIgOgTn7Gw2RPJxjm
         nCA2i2xMVrjduLI78IU4uGMQS3bF1KEEblVl6umufxYZ0c4ES9LqdwfhV8hz/3a3Zd05
         dcxYYMMzrHagknLtl+RRmIuwns6pMkuE3BSnwkKgM+jqXcxmxkFjF1ZttZjYp+fp04D1
         B36b/oIIUDmv/XHhQfzcUseW85NJUOct9G0dDLAO8Yay1o3h6eanH1/4YOSbXW+Am4uT
         rkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705570377; x=1706175177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfRLT1ZTYMh35t1IJwqIq/uG5hdyfPymCOmiW34GIFU=;
        b=I0Pi1qvRO5mFGnEaZm+AhtPsKWr25ZC8u4XLkg3D/bCYF81Q7NlfeSkZkTlFJIyzMa
         tcamVcf39aNkGYWaD7Fx8b/M8ctU/JrlhWyoqRIWI7A9GQ4QfGbUufaWqjSMHLHanmxK
         o44EhJHBA8qmG789ZLke9mrnbZfUG7FTkT4cXpvDKo4/321ont6D7zUpejwBjnu4CcM5
         D5Is1NRf78kORB0s+xBauHr5y+HhKr9jJdbWQcb1zdHv6gxqmIa7SkY54eLV0wvDRk2y
         Wz8bEAY4drrgrBwf64S44vHMNNZQs2gtINGYKfWU4ANS1+9yCQUb7oniAkD72amLSgxF
         u8Fg==
X-Gm-Message-State: AOJu0YyTs3dqifHOXuTzLeffjE+WhcBcAfumcy8EQ30Pi29UGpJzbt3o
	ldL78yDU2NgBG3TYPatPekThTcT8cLTevhhkvSVpNLb4sqzwucfnir/qeaMgAgdXT7fY5YcmtBR
	X4nFLWaCy2deR+hG02FvWXD0xNDY=
X-Google-Smtp-Source: AGHT+IGxAmd6vENZJ3wan8GakGaCZi98RT3jq3GTAA6dd/ztZPwqX0JU1QSIVj+9XN0/AMwR0fLh5mr9trqk79HiSm8=
X-Received: by 2002:a0d:c182:0:b0:5ff:67f5:f3 with SMTP id c124-20020a0dc182000000b005ff67f500f3mr470340ywd.38.1705570377022;
 Thu, 18 Jan 2024 01:32:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <241c57af61dc03c6f2f6bd90856908fcf84bb71a.camel@redhat.com>
In-Reply-To: <241c57af61dc03c6f2f6bd90856908fcf84bb71a.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jan 2024 10:32:45 +0100
Message-ID: <CANiq72mF+NWL9kyU=zM=WaVaYVAuUYbDL3L5GF=zWVmiR0=ZpQ@mail.gmail.com>
Subject: Re: Intended folder structure for subsystem bindings
To: Philipp Stanner <pstanner@redhat.com>
Cc: rust-for-linux@vger.kernel.org, dakr@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 10:26=E2=80=AFAM Philipp Stanner <pstanner@redhat.c=
om> wrote:
>
> I'm having a look into potentially creating bindings for the PCI
> subsystem.
>
> I was wondering what the Rust infrastructure people had in mind here.
> Should there be one folder per subsystem in rust/bindings?

Currently, abstractions go into the `kernel` crate at `rust/kernel`.
You would typically create a Rust module in that crate (which may be a
file or a folder).

In the future, we will have the ability to have Rust code in their
usual folders among the C code.

`rust/bindings` only holds the header list, the generated bits plus a
bit of glue.

Cheers,
Miguel
