Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC230C359
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758660817; cv=none; b=s+KO8W0aLQsqPHKkUziuRxC2CKYVCpAIVIkiZgmFfKiHv1n7k+klMc6JtpenoNGfwbwvI3oQEJlNi2QwqMZ6J4UwjpMvxYNGUVCseM8E/fAzrdTSwOKCjdqAmX2fOqXfIQQu01ZZrbmTDITkkCP//xdOXze72lnmuFFstYGnakI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758660817; c=relaxed/simple;
	bh=G1CjHe1H6u6QYEqMboB4shYudq3opKfe2g2puvgFMn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=TWvpmHnk3chaLH552GaMbvkOCPdaCWhPXiyAdKsiIwH1pUWBJyhuBubv/UxeWt8cpCHR8R/Rjua1kFrjVjDuuao3GyZv6eVZoCKWYxRqqMPFAFqY28+YErsBWyeVugBZZAg/rJ8oO/nz92JfHzDswbME1P+atigTHBdok3+I+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1mb/SLj; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1mb/SLj"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-267fad019d4so12901265ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758660815; x=1759265615; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeIRUXM48HHUK8Qqvw8VJ1Ezc3fvB2lHmZlSLJhMh8w=;
        b=X1mb/SLj7QBwrBB6MjVQ80mGoGusgZbyAcK5QIjRmnRiP8d1p8MAzh2rjkM50C91Zo
         PFbHJ+AjAXVhg2V3OaORFrNS8W+hc48aQFCs9wsQJsWfEYWqD+I4xUQScou+tbgOGnwP
         U1j+yO6VuuZ6OJLKhaCJDhEc2GHoDDMSBvxcQ97QuBGH4lgachh4quCYB3noW3ftceiv
         i5dxtvFlbKNu19Daj6TxXajYYQy50pPaWcxYpV0NTqThr4RC/AyYg71KdYmqN51/4XwQ
         Jy0WdsR2fs2jbojoTIRQ7xWHqLnf7UdfzdO6Bj/vy54aJY3f8DgYxASZCEE6bpUGTlr2
         X4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758660815; x=1759265615;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeIRUXM48HHUK8Qqvw8VJ1Ezc3fvB2lHmZlSLJhMh8w=;
        b=NNiE+jlrQ71PeafZADWhIltgKowz96gE4KCZ2/Nx4NjZ7IIpYWoGo+zTAa8VY0WnOu
         6QLTTl6FNFhNDHRwTcpQSk35wAgT+5zfXi9ENElqALyJlZllY2634JMjZmEUrys8lwpX
         5vAR2KLbJV9BUmL3SNFylkGen6R8XntnaU4D9eMWt0FCzAWU8stzN2AHqh29HiEVUwBW
         5/NRBnWNo2p5kblifvn1c7VdRW+41t2yJ1BSIc3Zy1CVJfTb9FfxJoy2aLAf7S9jon+h
         BhGKZ+TBVhmslcbaSqRVKei/DBUvq4x7TQyMZNF5R47qnYSBar8iSU7reWAGKHbJWxFc
         QFhA==
X-Gm-Message-State: AOJu0YxfiQ8ma62skTnvavvqdEt6UjAzjcCslmx+f6TXp/WU11/xMZU1
	2iLALXLL7PDAJfIsA28P6TH2F00LFjvh47vrXUpVycM7fohiItyddL+XIXhsfyV0wFQswgGNiep
	QNoq5RpiXDSKASb+sJucwnwy1pTERitFZNRJWPPxH9A==
X-Gm-Gg: ASbGncvCVa5bGR3EmG0anGnyDkffNnwtxAMNBBiEyYERTSFlXTE7dBQQclBdf3Whvzg
	WLNUM6cdHaLEnVCM6Aaci5gCzxxp8UjetFD03MON/bObr57eJzmFiuiX5JMixgxjdE9zJXLBfRd
	TGYDZMI6uRe//ESwQpOXql0cPfM4q7+JjzpVFnfkhxVZyjwIDuFPV7dfwziUNV7YOgPahUNhDp5
	5B/CDEkzb6IQaP0gWVtUqm8D+M4YWYVKkNDzL+faYaCKZNkMI+KT8PHcc3w4WJVzgD197ud8BCy
	VVCGJG5legvCybDCl/25lywTIw==
X-Google-Smtp-Source: AGHT+IG7UxLeyVKwsswhjfZ9PBof5WwJL1uF/ZLaV6ryNX7Y5kOSUlCQry1erigNGF1RALXfqrUHzL5kh2hgPH/vrko=
X-Received: by 2002:a17:902:ea0f:b0:27a:186f:53e4 with SMTP id
 d9443c01a7336-27cc28bc350mr30869155ad.2.1758660815210; Tue, 23 Sep 2025
 13:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72=o8B++kHHb8O2tJh8d7E217Vw=mPfnH7mzvFnxEhkyWA@mail.gmail.com>
In-Reply-To: <CANiq72=o8B++kHHb8O2tJh8d7E217Vw=mPfnH7mzvFnxEhkyWA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 22:53:23 +0200
X-Gm-Features: AS18NWBFm9BjebyMoJzwlvnIRoO_jynsUp4sm5NkSA_F_9khGE-TORAO4Oaf8Qc
Message-ID: <CANiq72=anyGhkbVZyK6kwQZKqOjjBSXXMZ=hFj=JuqS1D6iO9w@mail.gmail.com>
Subject: Re: Rust MC at LPC 2025
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 5:40=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The Rust Microconference for the Linux Plumbers Conference 2025 has
> been accepted!
>
>     https://lpc.events/event/19/sessions/223/
>
> Proposals can be submitted now at:
>
>     https://lpc.events/event/19/abstracts/

The deadline is in less than one week: September 30th.

Cheers,
Miguel
