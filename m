Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E311FA1
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 05:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713247194; cv=none; b=ljkswgP8MNgVjYznhIQMsrwLwIwMl3Z90W0RqqAEPGRfxmybfxC2/L8DUTxy0fJnxbaoBCvtWaAa5n304dRDVY5+4cpIHMY1kR1EvkAjBHKHnfKyNJFKPkITyNlNvF6C+w4XQXFOpYQvIMgjkGLrbUCMGE8Zp/vlaSmGyTq72rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713247194; c=relaxed/simple;
	bh=/X8kldfFUfv1kzJjaEOkSnhEVlOxiDNHtvLt9f358Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2eVbR4Zfftu68JW4bXEkItg/0Ly0ySoktr93MUxw8teiKnFZYrGUn0glZI4i9BFUDum2lXIhTvpktVpfgJKM8AsGVsjcwJvQ1CuZ6C8TW5QSErd3nxYhoVVP67ZH1rOj3fbw3Omaj4iY2mxYe3MdhF1oUbi/2VwQoeflSGSD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=NRKQuVG7; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="NRKQuVG7"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc742543119so3543780276.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 22:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1713247192; x=1713851992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/X8kldfFUfv1kzJjaEOkSnhEVlOxiDNHtvLt9f358Sw=;
        b=NRKQuVG77HhCrvAhtniZzTBuFWB9mDGIvv6hNhelED0+OyDiwsWP4IZgipl1K1pO3P
         zLOGu30RvbdJ+5Z9akTiOcTmHX/KQXjTQwsWJK+GudilMzNUbx6+yCX6KB8F38IUf20e
         PZcqTrsGs4xTS2BsPBYSMG4QV9Dr782Nda7XzA/2x24g3f+ehwimmjPBFejawGpCXlLF
         XTuW7bF1rGw9bGGvzSgxBPuoNtJuRyXsh3zXApdZ687Q4SEY7BZMFfsxCajMgvosvZ77
         Cr5WEPCA7a261VIMahbdywMvBo4bWRLkzpPb3OExsP74JKEl+Uq66QHF+CM41sSiGKue
         /CUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713247192; x=1713851992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/X8kldfFUfv1kzJjaEOkSnhEVlOxiDNHtvLt9f358Sw=;
        b=iC85k68GwG6KmAoa96HFZPMdtOSHRmnkB18PC18/pH8OyY+f/g2KHB3jKxTPAhjZvk
         7y9DSenrgdwX8xOSfO+1drtRC0wZHfVjKh6grAX/H+qA4kanHCm95u1aujQlaQA6Z8mz
         z6UT5VKRy8tw3Qt3y3mUNpRs1KXPnw+ftaxY/Teh5nhMtdoP/QARgBvbsGmmD95bRLBR
         HfmzlyggzcpGsKC0KqdQ9eM2njUQR72zbWgEASHN9y8kV/wIHzBlTqbhpRqI7boSkix/
         9sbwjwauTrK+iTiR6fpdCx8nM4HBDYVQSItSOVtAHP5sA2wLoliSbuqJk0jTC5BriQmm
         SxnA==
X-Forwarded-Encrypted: i=1; AJvYcCWJg47k2DLilWhWjOCF6EQWITpN3IptFizgNoaGQc0faJrS/TMBMXPhKnLN2vzgpDWuK7BMdWAXtx5ILEHEs5JeEnlbgeUdkk5EGStlTwo=
X-Gm-Message-State: AOJu0YwjvuEz4JvTc+oZNq8pa5RFTNA7yrt21mCujZ4KhkR+T+XwmSbJ
	PdOZCvc3cS8wzkwf7nT9L09FxfeD8x7hQ5SogiNaYpCAD9eddcGqQzr33vc76jT8S/B5bAAlt3n
	U9K83NC7dOma+jYmYHqdF8KnN9BqUHKZHQ3dcQA==
X-Google-Smtp-Source: AGHT+IGxAA1/6dVIS1Tb+gSLLJflL07G22oif0AkvdsPqP9aSqkDkjAr8InDn/XDCdmfFrrltHVNs2i2RdXihQa72Bs=
X-Received: by 2002:a25:8211:0:b0:de1:1af9:c7ea with SMTP id
 q17-20020a258211000000b00de11af9c7eamr9541679ybk.1.1713247192343; Mon, 15 Apr
 2024 22:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411205428.537700-1-thorsten.blum@toblux.com>
In-Reply-To: <20240411205428.537700-1-thorsten.blum@toblux.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 16 Apr 2024 01:59:41 -0400
Message-ID: <CALNs47tJrsAJt+-CWfVuQDxUoNSi0De5-1y5hD=YZPKL26uVDw@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: Fix grammar in comment
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 4:55=E2=80=AFPM Thorsten Blum <thorsten.blum@toblux=
.com> wrote:
>
> s/directly the bindings/the bindings directly/
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
