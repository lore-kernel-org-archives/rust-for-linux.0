Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A5332C949
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712968; cv=pass; b=TOpDlkMjVJ5R9KXoH7xw7JPHlo9s9B0f2NYNMjWeoM8jFPzEEPAVcVq+vqJ4i3cs9T8END32bycLh36vk2SgI24m/Ta848lycU8aaUoGi+zm1ZRRIHzhyAanL07FFUGGQpTTn8eKlVZY+cZQ3f+W7X9EvO9D8Cn+p7QvFAQvihY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712968; c=relaxed/simple;
	bh=pzj9Ny1KxKgyvqZwK3YaJvtJxyNcZudeF2U8bB6Rm+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MaGe69ISx4FPAGcZjXvMyaAVMgO6tZt1JVQuhrhEMZINWnQQ3FAotzPWOcoRstX5+Tmf2z19B9aMDa+4M1U7WLXdOF0aG/wzaEKRjy8nI2MVFE9usUka2NN0msD+q2hLa2ftIcpM9y4iZZHVE35m8zmaMptZ5R3RiV5JsUOhyIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g86YfLjH; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g86YfLjH"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12711867ca1so210028c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 00:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770712966; cv=none;
        d=google.com; s=arc-20240605;
        b=fPCkzFQvOljqki5vHYBBBbuPI+rOoPSLH/NM24dUhANPmSl5kN89yBhZnkU+SIhwal
         Y19eAezBEtP1Kb+I5UU7CZdIjw524q8XR2y4WZG6H44cYn2cJl2jl42LcTLnrlrV2SQI
         86kU3fClf3yyVrTDJlQl6vqHd52xwV/1XtXLG1U18AiE5WpBpS0AasviNqEvfkA2d81C
         tJY94NVNvzwcH5jHrGh/OGGp3rpyZ//tSMiPR0VzMLdVw2HyTUYbqXp16L7y9MDW02vj
         s3Lfy4Vau3RMJqE7vYA646uBJV3XtgsU8mukYcinEMA4oKgVulNf7sAHN8kYOedjLK0w
         6USw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRd5nGkK/uJsiW/OSeGHF4f73KvZkDNQmuEV0hYZwB0=;
        fh=ppAfkVd46EJEeeuIa2pFaSoA+b6gnCIzbrvKFVDIwRI=;
        b=gFwWLAXBbi0s4wuWbm95ySVF1HnnJyg8dKCBWonnbXwyM6ixDDra6W3yFY7EEKnGJT
         YedDlpTguCkBmb0Lrx/F5ZCzWDRe5yTYiigwfcdjeQZ9YCOKwHyA+cCnK97tIG8676IE
         5dEIVIpX0ZhBbPweAQWmm6thxI+iZEnOhjjHn/N0S87HUCVadFOTlsuVH4XMP2EYC4Fc
         5vEPOgyLbIV1sRSDoj1ZsxZclh/sRCD56b05tyVnev69sYcpZc/BdMfR6qpMyJjRjN7H
         fxUICtMyYUZHLXbNcW7S0Lv/ik4vMtJxiGyWzH5p62OWkuvyxNU8uPjRh75bPO9JUPnW
         h+iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770712966; x=1771317766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRd5nGkK/uJsiW/OSeGHF4f73KvZkDNQmuEV0hYZwB0=;
        b=g86YfLjHLLROwQ2kshoDhTX3jqvWN9mGJHSO/ArVZzzwmHv3dc5RjEV3XuioS9oK+i
         2023y40IxKLhkr7WTc7eQ4UG3v7ZwfYhUp2ovmyTq3LnrovQ5Ar9sU61cYhaK7GQzjCm
         +EVJwa3guOqKJnwnB8iaM2uq9RzJSH7cAw5oAHYlylzxM1QAZncDhSZW27EtflWDtyeE
         NtO1f3fymHVUbXyxLwgL/GHJnAcjz6dvkLXJ6Fd/34IQlrkf2GrcIF6uUfr+xOPoOeg8
         QkxDi0ViaMJRH8RwfmOvCD/W1Q/fgpZkCj4fC/f1xix4UES2MuZ5oR7VH9gq8rVs/WeB
         XLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770712966; x=1771317766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRd5nGkK/uJsiW/OSeGHF4f73KvZkDNQmuEV0hYZwB0=;
        b=PAtIDZiRQoB483Qcz35GnDCXrcv21Jkg6FQxwhHa/tEuwTiHryD+NPRDd79MG2qC2E
         YOv/v/cFjPJ+V8pQ+k0dGtv6YvbCJkA9eTeL+sI/pG8oYoQ0XZmnRc+SRQnWPF3KsMhI
         KGec5S+48RghOojuG14VQfTCcfxN7T8Pw2Hr0Lysrnp2B0dO1cO0RzLScl2FDBNVfKyN
         geVSyDZBNLiRyQUfB968IP4yghn/L7rXXUJm8Sud0IMGyNXX/5S9RMcy/ldUBJNseP2I
         an8/fSHFsetZq3ZgVS2S7WUukwjdafOA0xav9s5eFpgya06heGUX1a0vB7L/XC3xdD1c
         pVqg==
X-Forwarded-Encrypted: i=1; AJvYcCUORtZlKiZTUNYDH9Vx7PFRU/1EhKmUkmMFk8aMvi1rUFttinTUaUHUwM0LABQhRGc6qXLzFYZGYgVzhMgc4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPQ7j9F83ExfTWUHBkRi1sowAvJSwIxXbAISeyCgbNceroK1G
	OqwZbdDX7cH2fBv+a1Q8kvJNnxLc+IViWef8Rk1nRtRdsqVnCcBC1Ozm9JMCAP7P0ReBGElYMJN
	5uH1Jje4RXBctaF/BvwJct/GUHR060uY=
X-Gm-Gg: AZuq6aLSVT23j5abzv6V3+3EizxILt/taSbACOm7edX2NhVFarrMAJefZOknJUi9BkP
	ETkM8dnx8UYoY7IMDFTsfAZrJ5cOYErsCe3axABq3JkYMZpyQSi7XkTTWGdSoCBmWpUSccmiAGv
	MtGEjpzKdn7ulnc3Wy2YFV2KayxwDHh9lzrth6n9luKcY1xqzxYp8Coz/vS0BVx3XYo7wGiUkXC
	tncptkSFBp0kDIVLuIWAxp1mF6DecxH4xhh5LfEP8kJAtxbmkrCIxaZKPEk7/eaP/4NeOdlzxxx
	zXfVjM48qVUG33ApAPqPHf84iqee3KgnEUsXus48zZhIDJ2d9F88Rc90sRZoXqkMsOOmM6Kh00g
	Mxt4wlEkernxjP71XfdKbHrIG
X-Received: by 2002:a05:7300:3721:b0:2ba:7322:6bcd with SMTP id
 5a478bee46e88-2ba8cc89047mr187606eec.3.1770712966327; Tue, 10 Feb 2026
 00:42:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206204535.39431-1-ojeda@kernel.org>
In-Reply-To: <20260206204535.39431-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 09:42:33 +0100
X-Gm-Features: AZwV_Qg-hW3f7kkxtTxv49a5tYvs160zPEvUI7XxUzESxFFA_J56CIIMLUIrGT0
Message-ID: <CANiq72=15XC6QT2KucsBhzLOdp=rLtCgC__ncLPwWK44583S+g@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 9:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Custom target specifications are unstable, but starting with Rust 1.95.0,
> `rustc` requires to explicitly pass `-Zunstable-options` to use them [1]:
>
>     error: error loading target specification: custom targets are unstabl=
e and require `-Zunstable-options`
>       |
>       =3D help: run `rustc --print target-list` for a list of built-in ta=
rgets
>
> David (Rust compiler team lead), writes:
>
>    "We're destabilising custom targets to allow us to move forward with
>     build-std without accidentally exposing functionality that we'd like
>     to revisit prior to committing to. I'll start a thread on Zulip to
>     discuss with the RfL team how we can come up with an alternative
>     for them."
>
> Thus pass it.
>
> Cc: David Wood <david@davidtw.co>
> Cc: Wesley Wiser <wwiser@gmail.com>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/151534 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

This is so that Gary gets it soon in linux-next for Klint -- I may or
may not need to rebase this one, though.

Cheers,
Miguel
