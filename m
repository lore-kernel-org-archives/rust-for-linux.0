Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1A165FBF
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 21:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714599203; cv=none; b=RQCEP36bP5H32lAa/SzzCia/yiDrF/ChlUoj7H256USo8T3QvIbTkWeOwjMqQwrqaQl850XMQIprUXhDDEBCIZq1R0woXI2NAL/7L3djAQqwI0Xe8FFa60hFiZW6IQNCYoxav6wGHZiqyhm0bse0o+vdQ+HRpuXX5KHabKR6hBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714599203; c=relaxed/simple;
	bh=eaXyGvot57hCFSjw0DgV9IXg74Q2iZmH5MYlysQPwL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igYUUi4gGWYi34beFGCbhCWagFd2HJ3UDbgfeSNTyUzg9IAq2h2Q7UZBN92eRYTUuZ7JSyw+rk787ZqrvRRrkjM3R1Wg8aUPkxvgOiWooUVbbaOHUrnX32JXKL0dAzPkGzaYlnctnuJ5yJN9Yp4B7NW1m6a6PRpkPHtySlyawto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBoyWUQ0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBoyWUQ0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2b2769f017aso1817084a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714599200; x=1715204000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaXyGvot57hCFSjw0DgV9IXg74Q2iZmH5MYlysQPwL8=;
        b=MBoyWUQ0Xn5QBQXiYttUpNY/GTToxEo7YyzI025bMebJXLBQfMtAwaBv4ZhuE/Biua
         xgLik6fAFWTGniKpTo9i4QUgsqdwHPo1E5cvPHR317Yp6BRuZ6R29wBehOGp7jm7zLnT
         XJgI34fzKvHfx/xrevC6TUVQWou92t3MEQszFY6joLi7LvUTbzvZrj5Wpb6s24H15PCb
         S7+B3iw1/T20Ty7UYHSCf4Suj80O4nIbT6x/cFbphL3b4Y5hufbDFwvM8TQjXeMZP2RX
         aiN3r2ClZR04rLvdf4f/qmvWwn7BvUfFWEjxTCGPriToiOFSB3k1j/85mE1Tar6KVxUJ
         tkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714599200; x=1715204000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaXyGvot57hCFSjw0DgV9IXg74Q2iZmH5MYlysQPwL8=;
        b=fsZrbPlWBjKjYd/K+tGaYgBKkwxFEK6A1wiT+K1MwsQfXz7RvlMcgFWbVZBNclBuCr
         drCbuaSpUBlfr4+4bIYQjr9uV48xAjzZAyy6JWU2piWTEeNwLZXjdQqrhKTj0zarijHH
         S28PNOvoEbx5cSavGzdSniNW23q+MoieViVGBtyoVinhgS296Fr7jtykgoSMUAG12i8r
         IL8C9KR/BgqtxaHP0dkw0Y9TDqMxaypNfKzTFnitkWdv4IampaTOvvKNWlQDyGBCqOZL
         946xNUF1SobawnJTBzoEnS87KpmnAtoDDIUP8L9DjUlsipGTs6JP1ROj3cMO3fq5+uuz
         +uvA==
X-Forwarded-Encrypted: i=1; AJvYcCUgkBVbIbQBDWiX/Qf0Si8m/rTCRoIC2lAaeTzmlbAf1CfsWXLvJRX3SttI3RY/VV72ivTYoQE6+d/homJiJKfLCthUeUKw3yGgisKTYR0=
X-Gm-Message-State: AOJu0Yx4xWtBWnd/UnYbkFr9rCZH+7lsTbs7aGgtkRkCdh56Dpj2iSlk
	5XcmqVqyTnuEu74OJ80BbQD/EA4MoYlVU0U+N+Z7TFYKJ4ESe7lcS0z5biGCg0kmJMfBlNcItgR
	gDmvmD7UIEi0PAtmEA2kLOWh/IOd7VPe1Cq0=
X-Google-Smtp-Source: AGHT+IFREHHZyoRI1P4uAOAzhoZfgXI9U1jFU/6dcsw923zMi9YmqV8m9sDGLYc/UuO/ug5aZV+WpyIlX3XXI+hdtc4=
X-Received: by 2002:a17:90b:8c:b0:2a5:5a2c:6066 with SMTP id
 bb12-20020a17090b008c00b002a55a2c6066mr3875878pjb.37.1714599199836; Wed, 01
 May 2024 14:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429201202.3490-1-dakr@redhat.com>
In-Reply-To: <20240429201202.3490-1-dakr@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 May 2024 23:32:02 +0200
Message-ID: <CANiq72=0BNw-KiURBjosLqfuUEPpjZPbRg1XMFZyobOzBt7aMA@mail.gmail.com>
Subject: Re: [PATCH WIP 0/8] Draft: Alternative allocator support
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, 
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 10:12=E2=80=AFPM Danilo Krummrich <dakr@redhat.com>=
 wrote:
>
> Please let me know what you think.

Thanks Danilo for implementing this.

I think we should explore options that avoid going back to
`allocator_api` if possible (i.e. like for any other unstable
feature).

In particular, `allocator_api` has been unstable for a while and it is
not completely clear to me what the path forward there will be
(especially with all the discussions around that particular unstable
feature and previous efforts to make progress there, e.g. whether it
would be fine for them to add more `try_*` methods and how to name
them and the documentation concerns, and whether it may need to wait
for other features like keyword generics / how exactly to avoid
duplication of methods, and so on). It is also unclear if they could
give us support on their side for flags per call site and so on.

So if we can find a way that does not use it and that does not have a
performance penalty (or a big ergonomics penalty), then I think it is
worth avoiding it.

In fact, I would say what we really need is the flexibility to
implement our own allocation APIs from scratch, including types like
`Box`, `Vec`, `Arc`, etc. suited for particular kernel use cases, and
giving those the methods that make sense in each case (whether or not
wrapping/newtyping existing `alloc` types), rather than the ability to
"just" customize the allocator for existing collections. To be fair,
Rust is already willing to consider solutions for us on these matters,
like they are doing with e.g. `derive(SmartPointer)`, which we really
appreciate.

Cheers,
Miguel
