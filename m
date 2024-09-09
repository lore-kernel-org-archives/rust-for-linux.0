Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777528528F
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Sep 2024 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898992; cv=none; b=Mqo1x/HCczcgss2cHjUA8har5v1r+oEdjOqXyRRA8lMZO8uH2Bgeku8mA2y6UD79FvRC3rRQA64TBYjFy7ayxYRzHPyKpu55X8+h2VmDtMdI7E8ZW+NMmdkvDZAKyfxtxsiAiMRHPzUrmgODoTpe3f+sPWxbR3W8ZIL6iU2FVXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898992; c=relaxed/simple;
	bh=qdFhZU2r5xFdA8KfDRlBW7jZauhNKo9TcpWQuo3EmbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7i5dyqIo2L2Ujuxp2Nr5tH0DjLeDnE0vyAl8YWimZRbL2dSL2EY0aPak66VWyizAsH4fY4EDjfzekTZfG2qw2yZJkNx5veS0gQa4NQx9HiO49WA63WqL927/DCjzueoFPSqel/qNyNW1TMQDMRJKgUDeJzdTVev5wcwCwhsZ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lnKoDx2i; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lnKoDx2i"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374c3eef39eso2569904f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Sep 2024 09:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725898989; x=1726503789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdFhZU2r5xFdA8KfDRlBW7jZauhNKo9TcpWQuo3EmbU=;
        b=lnKoDx2iaxicfLEcE7+viUSsjcbDBFVFPIqEkYrXHQpPbW0xHKYB8mroSvbe/mBFG/
         SIpE+Chiex81kGljK5YmeuOiryXcVesbAc0DcCI+1X5/wIfiwHd6XpjZDr+pMsfxp99q
         wbbp8aYd1ZiFHuDWPlHreiGewYePnllkC4z+DYxNHaypqz8hJ5JXDh48m3/i3FOyshdF
         DupvEGQF5QOVpN1PMV3YVbvV9p08zVb2cU1HGV+fk4ewINsEidDpM/pVAXjiXhQtgrlr
         EQLPjja0vbKh9B9HPkQ3q0SZ28MrPc5rh79kgNbGpb9TlcQDI4TvZG416Yr6WOEsMlbW
         bJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725898989; x=1726503789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdFhZU2r5xFdA8KfDRlBW7jZauhNKo9TcpWQuo3EmbU=;
        b=AJcz+jFf5KtKISFrc9NL2LXn3yQ48suYjha623/0qPDsXa7cWfw6KaztD10tbOJZpC
         V/kCUi1Y1hz23VdEK/dRxvXjoQbWtrRsfqg23mqRhmSVzVKCQ6WkKyN/qtVrSXV4o4/8
         chOhNXy5PHhneONYkCoXH8YmxRwLidZ1KV4uM4b3VPNrv+VA9suwllQ16NN0HIMji5a3
         QbH2u/oPhZGGUXBIsHAqSlDW4v5n+erjzmzvanSO4eSTS4seToH46aE7yx7GFiFQ+KN5
         J8DU75mnVZA5lJ2lwBTydKu/Q33pF8IQFJKpddCAdCABkvOkcdbBPzMTGYgjABTOjmeR
         Tz1g==
X-Forwarded-Encrypted: i=1; AJvYcCU6nJXCAhRJ3XuejbsLXZjKqzGuJiZyirKoMhDCE7Jl9r/duyDYmQ22DjmRAZxTd/MLhmijCbockow7i7eKBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD3JaX6ppVWOcLv7B4ymWhuyNFGpvoALxvpaWJhF7qv+v9sbG5
	nwI2SpVHF6Q684riIrqftQXuiUozB5yE6Al1Qp5YZudd6nfcmuZ8tyweZJmzhXGpvA5pDY7SX1O
	3BynWfivwnEzXJZ9VP9HMB/c8Xrx9FbLdyy6e
X-Google-Smtp-Source: AGHT+IHx9J/yPFQaPjxmG7oik6CeBdUgdSF5f+JFwuhc11j3xM9DcZfmY8nyTNNJUueV/KbdjSiGl6sL+Mh/kyBkMzk=
X-Received: by 2002:adf:f4cc:0:b0:371:86bc:6c05 with SMTP id
 ffacd0b85a97d-378895c31ddmr7061192f8f.10.1725898988441; Mon, 09 Sep 2024
 09:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM4PR14MB72767619350CA0C447D9A965E9982@DM4PR14MB7276.namprd14.prod.outlook.com>
In-Reply-To: <DM4PR14MB72767619350CA0C447D9A965E9982@DM4PR14MB7276.namprd14.prod.outlook.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Sep 2024 18:22:56 +0200
Message-ID: <CAH5fLgjQ4X_SBSaF9RdaJcMuTG+1Zwzet7tua8QJ9X8yfNrMKw@mail.gmail.com>
Subject: Re: [PATCH] rust: error.rs: Remove dead_code marker and make
 from_err_ptr, from_result and to_ptr public
To: Filipe Xavier <felipe_life@live.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 8, 2024 at 5:26=E2=80=AFPM Filipe Xavier <felipe_life@live.com>=
 wrote:
>
> Remove dead_code annotation from from_err_ptr, from_result and to_ptr fun=
ctions in error.rs file and change visibility to public, making it accessib=
le outside the kernel crate(issue #1105).
>
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

Please include a link to the github issue. You can format it like this:

Link: <url goes here>
Signed-off-by: Filipe Xavier <felipe_life@live.com>
