Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7338A79D2
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Jul 2025 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753727019; cv=none; b=a88cFDJIj/v9FMSYs5k+6SNUDXcyX5qGPg8CfPniBwEIKJqFX/fYEkLw5UC/FCrCgN3y+Jg6uH9LW97px5y0e4oq+FJu/7zWKA7uhRKLMCW7OS3UPYeCqFjWwVom9hJuSHZ4FQC9PpFmYEJIY9Low541ORzQ7G13BabAkpkMLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753727019; c=relaxed/simple;
	bh=fJx91lKfzgdhsl7yFezad7/4EJlrVplyv1lwNEgIiw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPE6vbhKLkqGByuQA+lFwAihpnF5rL8zWhKrRHEhVJTD4r9EBjs8fRLL5RkPsNdjmdVatRrM+Ebg8/rsasYMKdYMopNcZpqYmDhddIYf28XUIdvebgxRCcK6J5pZFJSDBT7gKG1x0eDTFfamxTphWreit1dG925O/SshZJ4cgxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sdwxLcsn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sdwxLcsn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a528243636so2882922f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Jul 2025 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753727016; x=1754331816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJx91lKfzgdhsl7yFezad7/4EJlrVplyv1lwNEgIiw8=;
        b=sdwxLcsnQaH/JJH241kf8OiqNWBQiZSvGDz57NBohWwu53KsEW+Nj1opPHZbigCCkv
         xcMYRhoj6bIPIY0KJLUktTrcniX24ab3/SUxc7xNqsljvFP8PU+nse3Y+aRGpgZMkRPo
         6ZtblJQfdpSeaIcH/iiEwzuneRHxRS2UGYgLmc3CFdnewsMZ11siIkB1p8Ya9+c3NvmZ
         R3TWTSqPMd0V+E23o2Cwyf59NrAOz/1y34Ibv8LAOO4vM54lbYS9QpLNx4nV/hnFvG7A
         bho1Q5HriW67txt9+XSO63Emf24wY+MccAkT9fpJV+ZjHt2TFi/6Prm8QQtGqcdDtjrH
         pxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753727016; x=1754331816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJx91lKfzgdhsl7yFezad7/4EJlrVplyv1lwNEgIiw8=;
        b=w9MRlvSoL2nfic0W1q6cw9rEFwNAR1sAIWgYG35fnLsa3GERppAgci6qXgnOD+19ry
         zKwgNOARSn5RK/Gn5RZxb3wy/Lm8NHJEoLEnoCx3vHEyfEk21muuYGszk+aqFN0PEFP6
         TGWXxfTR/5VZ0FZChIsz0V8HQ7vCNEASmxZ9xBjLvjyKjfogyH7XotIA2gRPbNIpb08l
         itob7gVcaB0sNw4S94xKjdFjW9FxlgyT6o6ErrjjqEQ0r3mdC6OeYa6s7D6AB3bdsXAD
         CG8P7wFd31ciw74SRRyc5wSv+O8b0+xV+j1lp9U5WTglHByDtR7J2mE+G9nZ/BEY8KkM
         xagQ==
X-Gm-Message-State: AOJu0YwJiSgATDw0u2+P62Ay07y7itGgwRCU1ybp9y98a2cxFPWADHd+
	FbkF+tbwyfBvy6StG1xtcrzE+UssUMqOEXx9YS6DcOUWJrstRxyxA1h5C7ubMH3cxfCoZWK0kGc
	9eT3cmRn8kszymoKoyjrbO9PcO4AzgHiWracHQUH3
X-Gm-Gg: ASbGnctDtA7ySuUFLebWRGdMK9HquBOGkw/vpSEJR/hah+IIYYrjgBUcxqUZcTkv0JK
	p0QFhE/YGMEEetTxrSMMlWigtGRWBIgB+t8QTd84Mh9jmrNXEzVxBmet4/sPHsuqZg6c7QrlNBG
	C1XCLxAiEzBYhzhSRQNSvUsBSLMQ7NvWnx6/cOZzTRbgX0rGCaiYm31TzFIRB/iYJ+cHb9F8QxE
	8IBivny
X-Google-Smtp-Source: AGHT+IFkf+piymzDEEWeOo9CeIGkE7E/rIRy4j76KaA9Fw18Ysyzuv5Q6jXC2pKQtV+Qwi6zRC+rLwgT+D0YOs9RhNA=
X-Received: by 2002:a5d:64ec:0:b0:3b6:de9:8079 with SMTP id
 ffacd0b85a97d-3b77657d03amr9755496f8f.0.1753727015552; Mon, 28 Jul 2025
 11:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724185700.557505-1-lyude@redhat.com> <20250724185700.557505-2-lyude@redhat.com>
 <aIXWOgTWdSODz7EH@google.com> <ad9e2b5518c2e2cbe72b0e61bf2d7701fc306008.camel@redhat.com>
In-Reply-To: <ad9e2b5518c2e2cbe72b0e61bf2d7701fc306008.camel@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 28 Jul 2025 20:23:23 +0200
X-Gm-Features: Ac12FXz24ytrg31AREbfAYQD7jZergph1DC1DHvH7mQGiyK7s3Z8oEcUaZSMfGQ
Message-ID: <CAH5fLgioqkcaJ_M7q3CEERPniREidqnWxS1=_HM89mFN5=q=iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: time: Implement Add<Delta>/Sub<Delta> for Instant
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 8:21=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> On Sun, 2025-07-27 at 07:33 +0000, Alice Ryhl wrote:
> >
> > I'm not so sure what to think about this clamp logic. Maybe it is the
> > best way to go ...
>
> Yeah - I was kinda hoping the mailing list would give me the direction to=
 go
> on this one. The other thing that I considered that might make more sense=
 was
> instead to implement these so that when over/underflow checking is enable=
d we
> panic when we get a value out of the range of 0 to KTIME_MAX. Would that =
make
> more sense?

Well, it would certainly be more consistent.

What does your use-case need?

Alice
