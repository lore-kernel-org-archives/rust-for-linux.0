Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2965D2D372F
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916207; cv=none; b=f4bvz8iAxIk0upwN+RbFuwHZHEOvhI7vbmG6ykbeONfufhgA2k5lE/HfHutmbbXdWURDAvhXmeKVV5YSbpo49rOXR3/qSGd5hIn9norvBEiLJ0pn+x5FzcCXvzjUejPgnkGZAQowmvMePhE/75uBElznWQYX3Rm4bO7dQqxMMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916207; c=relaxed/simple;
	bh=j3KuIhJo0ivrR9GdvJeQEnar7BGsh/Xlz36SAqt6LBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXLRAGt0TCXVo91JMKzHC2q6OocWzqyWewsytDQjfquyUhw05NxyjvBNHFRba9QpfR6av+5npOoHbghhbbdJVk4tAI+hOo3D+xEZWYJn0S8Kp+ecMmynewrg9iFCDTD/BVRRYq/KnQYIoNxGcwsRjOIrZWedGQdIBkPGqoflpdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QXkAuN2w; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QXkAuN2w"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b78310b296so2297912f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754916204; x=1755521004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZQtbM58CuYhzw1MvgZL2tVUq7quGscgzcUmkjWg4xQ=;
        b=QXkAuN2wr4WFac+I4bBDG2gAfJb9+5Kty8ux4yUXpFZZTZ3w301ci7IC0ulAccWKY5
         u0YVdsX/3OZkF1CCvOEd/FVUC2TYPnioRgyXapGEhYtdku+Jnryq2rT4dIsVGWUwpyz+
         4XeiB/EAXOfEQV3N0nQ7Bbbe4vRuHEn0DB39dLBzo8hL0imlvL46DfXzwl5sk4JZ7JV/
         O1v7A4O7geFCxcqnVmWyGdAkVOpdeb5lymae25PuQ1d03arGBlg/vJVvzRhitybNRHnC
         Wy3/Rcqig+31ltu56j8dr18foZnIL1/vJNQJiKKQ4S1SXtOp+Dwnd2G0Wqg0mWIVJacP
         6PNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916204; x=1755521004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZQtbM58CuYhzw1MvgZL2tVUq7quGscgzcUmkjWg4xQ=;
        b=h4QcYP+Mlc4dQ+2IFkSctS9HdqRTO/J5bTGYJMvpwz0biBl6m2kGddJw9W4VLxDyZf
         AYoXd53RnpXh7X4sipsjlTTGK6E512H7FRtVYUoNGBLeY/r/74ySZ2CF1BHG5wpKYsAW
         xTabOqsw5zzluzGS86/v9iRHsdJksMvHr6oEPB4tMPIINBswZEJUW0vJrRNl6Onogujo
         5BrgA5CVOLqKqXkLnBAE581wgbp97X/cYBUHfLDB05j409VaHoD6RyXnZwWwiIMJt7T+
         JMn1hB/rRJDYGMcoiVTlHhDxvTBCln1pJCt0fS6Fti/GdgCUo4wdyAsKqdwEOdz4T0Je
         Yu7w==
X-Forwarded-Encrypted: i=1; AJvYcCUByYmdu5n042F495Dw5y7rvNTNGzXCSU/AUhME5dnxvhDrvo3JfRzzxlKgrWFKf2GCBrQZUwMtrT96jPzuXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzts0TAEC1cZ7irMARBIQ7e3VbS6UK/Y6XFnRtu7K8cBeZtqDui
	n0IoqoxCzgRHBMEogqI7eIc25pw6Bzpw7f+fbjFL8BNGqkQE3BfM4dnFnYLA4bP/oNf3xF5+Fva
	+sTtrWxRyKj7AqmyoaUjAxNXwijiOAhbwEkBeGAPi
X-Gm-Gg: ASbGncv1kVrezZwPehjZF0+sBxmNUF+IwiwlFa9QgfoMw52RAv8iR0H7EH+BAJyBDTh
	hauf8RC4npvhnQEYD0Zc/uXlSVGEg5xEqLP65FFEYigMxkSfDdO0M4mem5BsFLZe4ZxQGQfuAYU
	/Ar2DrT0JPf+XhpblhMDrzxF8fNxQchyAurJFS/QZzzYqc7WurpUeHCmjK8hFn/PJD2fn5mGXSd
	ctnVcNJ
X-Google-Smtp-Source: AGHT+IFbHmiT69GgG6VywhTtWkjpjKn3ClF+vJUww36UOVmWy0SF/jHh//RsS8jPS05Gf6wMhqwnjOEo7UsZLyjUxfk=
X-Received: by 2002:a05:6000:2507:b0:3b8:eb9f:a756 with SMTP id
 ffacd0b85a97d-3b90092cab1mr9287296f8f.11.1754916204089; Mon, 11 Aug 2025
 05:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810-topics-tyr-request_irq2-v8-0-8163f4c4c3a6@collabora.com>
 <20250810-topics-tyr-request_irq2-v8-3-8163f4c4c3a6@collabora.com>
 <aJnM1LgUYjTloVwV@google.com> <4EE6F260-5AC9-47AD-9F34-0D6C224A8559@collabora.com>
 <CAH5fLghV0aVZBBEmjf9CF9gFyG08dH7nFzKHnHM6RiANuSZaMw@mail.gmail.com> <AF48133C-BD57-4EEF-8E4A-ABEECB8A5C49@collabora.com>
In-Reply-To: <AF48133C-BD57-4EEF-8E4A-ABEECB8A5C49@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Aug 2025 14:43:12 +0200
X-Gm-Features: Ac12FXxxIhPmaPtJKy3TMgtU486Km52fgwcFr8qaz3_2m5jCwDhsYNXHNvF34dE
Message-ID: <CAH5fLggOqsrob-h2v8c5hsnMquJZhXJ2euAub2ia2fjj=NY8Vg@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] rust: irq: add support for non-threaded IRQs and handlers
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 2:38=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
> >> Also, I was getting tons of =E2=80=9Cunreachable_pub=E2=80=9D warnings
> >> otherwise, FYI.
> >
> > If you got unreachable_pub warnings, then you are missing re-exports.
> >
> > Alice
>
> The re-exports are as-is in the current patch, did I miss anything? Becau=
se I
> don=E2=80=99t think so.
>
> In particular, should the irq module itself be private?

No, the end-user should be able to write

    use kernel::irq::Flags;

so the irq module needs to be public.

Alice
