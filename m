Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD281AB6D8;
	Thu,  3 Oct 2024 18:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727981246; cv=none; b=pQPdGK57IovBME4bFMoAQPV9pkar34YXJpypVAOLXXDjykoTCzQmRtcUKU7LWh1GCie71+OXip6MWNLOQOFxIWDDLiZ5W1wwuXqGBLkDev0xXXiQ3UX3yDLdhe2arFeFUuxeJ4vTZ9cT2c2Jcc8CXVpImfx4mNcME6CCbsWcyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727981246; c=relaxed/simple;
	bh=BHzOqisEFLFox6mXku+m3ttFgkN8Btbj94wO+ixxN0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxGFnoE60tmzyzsBmJfit3965hMI05I15kiJYowrEiw3wEJTJIV1d40lVT46DCdrNESf/TwVRr+Rl2RmHqAKWfxf36uR92SMAffrHy75NyKTiQGSwlqyFYkAS2oWQoDXLFfFkLZ4V7OtIOzzVBy7h9dFSHyaujk0iK8WW6dl9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmKZtpFq; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmKZtpFq"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-718ef6a26dbso64348b3a.1;
        Thu, 03 Oct 2024 11:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727981244; x=1728586044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHzOqisEFLFox6mXku+m3ttFgkN8Btbj94wO+ixxN0E=;
        b=NmKZtpFqJcLvdOTL3jHaZ+gKiGYeyrMmtMLYKttOnjJ1CMovh+Ml8paKTOrro+/T9O
         t/2SSZdI0Y9f0rzTPY2sjye0i29TiNhyAf6tb5HrKfkTidIvOrkPgSSu2n38Opsmm3my
         GhOQBVYpq8QZl0rfSZGrTaNJJoplcNYlsIN3q8DgFklsryub/tkNQixwTgiNGSpkeLJs
         Fv4ulbzERZOjZaDzB+FAWr1NUpJ7itDz2fNjF2lDP0uLOu00Jh1yRyWpInG+4XRmjB/H
         +A9xBtU1Uw1lUwABsste6KYL2eWYeFMCPb43z5T1Py0romjdrGfSQoTAxxFV2JkLpkl9
         G5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981244; x=1728586044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHzOqisEFLFox6mXku+m3ttFgkN8Btbj94wO+ixxN0E=;
        b=dLlEj1AV4ZFg1OIx0y44HnsBgdPZ0BLkN9hMsBvCa52coTMf9vIWtF9eEASDeLrinD
         XgnzUbS/0t8xS0AuI5q0gopYYHf7nI/R4jrOTTPQ8vyGXAsTzxmt90vwqyVmIPOYqE1B
         plGdV4py1yb7CpYTV+8YBRIakQWWITqXN9ZOCVSlo5XvXqhro2d18IZeo3639cUCDkSY
         nHgy43dCCdkw6oAEGI1+JAeIljj10Rc5tfb686ZR2Dnsuw1IpKIEVeUw/ykLeTrdAJ5o
         BXCXA81HQl8e7jxKTkL50FhGfSXO/F9fh5ULjWkObLyUNHcQ0kC6dmsrlPLpXdDSPHKY
         VU7g==
X-Forwarded-Encrypted: i=1; AJvYcCUr4D0sTvlY48+jYLbBz2s6rrB3/7jJUhG1DfDX6utFGfzXMOxvpKAJByX82SPEXkrZvEBSSrfLc5eT6Fo=@vger.kernel.org, AJvYcCWsfeH4Av9QUZyLTzptSHjmbdvNYqb30Oc2xN2a1DMgcOMbc4WXMWRP788wCdL+3lo0n7h/v+90Q5VhfFDkKMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymwlFXWnJLZx/BeLN/0WGIr6VME9NKRnsw7ErcDZTk10TJOZ9M
	FcR6MGr5OiRDzfKhPzOZKkN+qc1HC5rxbQmWaajC6qQ5iY5F8C4UB/veb9P9Cj+fqc9HkfQiwSg
	zlkyrTjgdvsUZLZ5nwG3LOwdaupQ=
X-Google-Smtp-Source: AGHT+IHQSKPGH5/k/nFbWQQSbWal0hDnFnxx3XKzOECbMsBCPokb9Hn4CYRGnqUL19UtR5ee0tB2w9mdue7VRvsAH4U=
X-Received: by 2002:a05:6a00:464e:b0:70e:acd0:d8b6 with SMTP id
 d2e1a72fcca58-71de22e6819mr86562b3a.0.1727981244078; Thu, 03 Oct 2024
 11:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-17-ojeda@kernel.org>
 <CALNs47s=kCJUJstB4WW1KF_b55-e1kYQ_1rZjPu=LWxv2gmF3w@mail.gmail.com>
In-Reply-To: <CALNs47s=kCJUJstB4WW1KF_b55-e1kYQ_1rZjPu=LWxv2gmF3w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Oct 2024 20:47:11 +0200
Message-ID: <CANiq72=ZYgJB-fcFfrnq-wTYAAdqxg5zXJNZGEzbMtvQtSZjHw@mail.gmail.com>
Subject: Re: [PATCH 16/19] Documentation: rust: add coding guidelines on lints
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 7:03=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> s/ocally/locally

Fixed in the version I am applying -- thanks!

> It may be good to link to the docs on this,
> https://doc.rust-lang.org/stable/reference/attributes/diagnostics.html.

Done too!

Cheers,
Miguel
