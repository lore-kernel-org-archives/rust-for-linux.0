Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AC5318B92
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637473; cv=pass; b=G+imKIhfWTq2d0PjKOH5tW2JRqa3wTGLf0yiCWyfqzQVivqR3XJ8yADlTTKBysxQHky7Uib1odBJ0cUObFLQ+JTYdw6JPp/HqbYqKQczwgn8QPN5E5OcqiHLQpbdTe/oJu8EANQe+icM9ufey2ocz9q7JkvYYd8sL30GdLyrmcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637473; c=relaxed/simple;
	bh=jWBAlxFqxUcmgAMzCHbAefvq4Ks9vhDZ55bi6/80ghc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgTykCZH2IazasLH80gx3Tn6yxiEadj16YAvKOK/h+OOIb6/2MK0daIqol2t/8/PcZ42BdWtBK5enW20t4qwOSur5ISCUJS2Z8/v4IRFukMO/jQ1s1OGDWCMWB8M3vHUJf4lQSzUc1mVIh0zR1+/A2Bc4zd130fCNC8ZkN3GN+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggkT0y2i; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggkT0y2i"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1270fde1739so97110c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 03:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770637472; cv=none;
        d=google.com; s=arc-20240605;
        b=eyOIIfhdnJoXyG7YcBEfsOISqu5nSJ41hLFcAts5sNJnSN5W7DsJDi4i619Bbw0gp9
         VYyX7N1ICVFSROnRYbSetTjL9bLmwK1qpmof5kIY31w0hWrOkjIFImzvglvNz+3jk9SU
         Xmo2TZXvLAlF6B3CbiGm6V2nsVibZJH3dtWSH8QPiTvn6wPGKQ0m3EEOmxJKDbE0uKyU
         TjwLwvXHwY6PtAmsubzxJQ6FhYxsn8Xdy6S0fsxH78kedX7NHo3TwD+9L3KJo/wXGadj
         dTZhEqCBTzotHW067N8clkcnGNILNyd+eH94lfh7fG4zSrLLTCIdmDkuQhFKV20IH94T
         hemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z463P7NbcGqbKV1tdT+mMP9zQ1Yf803ptUYTvGcTtAo=;
        fh=2TaEMUf0mKTOlLXhHzZ/N1XxVRdu1+ogth2wxY+m3RY=;
        b=SDuRWDfHFJ/ZObE1TRex4jkWyzw9gSWoRxH9sNXsOtrHdIvzvsLjv/mlGvL1gNNiDG
         MjZL5Ztwdbk31QMECxvvX0PtO5mMzYvcpPnoTwzBgOVCkHYomqpofSIPImg5L8KZdZRt
         MVKvEcCm850z1L0KxJzxgN8JBPu1X1VuWri0HPqgbIIMtap7IBRUvvl1zPmCY/R6C/An
         W+JxjJLdqPkj8H3ypw5oDS8+ZIWJzI6WsygkYDe7giAmilFx4jn29aV/RJdVZwVShL1p
         NAbrstNgnGc1LvSrXoxk7JOkA+AwtTKA0ewVEaj/vEJL3zponHV8jjLkHk656DD2ayIe
         N1gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637472; x=1771242272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z463P7NbcGqbKV1tdT+mMP9zQ1Yf803ptUYTvGcTtAo=;
        b=ggkT0y2iP+yRzBj16ba6g5TLobVqaElRZ6/L4nBCQa9qqS+Mm7ZF6EqjNp00AZojJq
         f5Twwdl87Ju5ttwJTw8eJamSxEQs3FdExk2O9FXJtCWAgmcLOVobeEG8akbRQ5b7zoaL
         zqxBroX5On7R7Sp1Bd24QWVOjWlPlpRIb+/YddjMgEldATMFYGEBnrIAc20mjH/H1kNK
         L1GJjEcpqbVx18Slo9BXh7tNRZWgoUMNTeMILQNqSpT8isbw1oX+37DRgO2NDXBgH+dr
         U5K7h6GlG9DYMJaqiLO9rlTqqYzU+u5GC04wXhAns0RBAfOLIPs9rOKY44V5dP7sgQWk
         3XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637472; x=1771242272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z463P7NbcGqbKV1tdT+mMP9zQ1Yf803ptUYTvGcTtAo=;
        b=EpVdiMC6ammaoLhPtm1vnx8wKz6wbaNm07sNt1HpiAT/yYqozDCQ1FmcMCnbsHZTyg
         aZSdwQA3LDln8Npc0obNYBVfnIQtkpI7P4XOdTokFYUAEmhwfcf587poc236AUHnBLlh
         5K/5p6h70OYxDwKh5/M6eLDCI28P7gWnwiOwsz2EakgfqANd1rX9rEn/8qEEx4DLh6oQ
         903SEua93ZY2LPjRMJ7uXcajjcqWj/Sya1HHH0ymLl5FHS2zBSoxUXXiggU3BjsahpHj
         3s94R3WM79mjRaDsMK4IxhwmCjmTEjvZMPbqUO0S3lt9S8giaixrxBZ6XCcdLjeiBF1v
         k6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCiaeCJTtn8zo/NP7sov4QYkSSrRhq9gGVw8sopRznsUWWq8PXhWa+1EWmQtDaJqLgAd0hgoyICSbi5ckqPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7l0jDid4bwz4CyPEvlap+I5Hfo3s+bNcI6/d/nn3LgjLDylkX
	Xk+d9nEXLDi7XqOswlcj014PIH9C/vQpOTOEBRikE/ieM+QTI9EtDoEnZnLTFeg4t5BMxtWbM0h
	IGn69rS1+j12ZuX/bpLdzr+j/YEzfHbM=
X-Gm-Gg: AZuq6aLirUEWRcPtVPCkag9PDt2d8QK6jUZDLrPeQAqlbIowrMh380+E2Hn+yR50vbX
	YzqyOA44jPVUfE37wyUMg/bGyqaWAn6ccQiu6CK3cLTwad4Ekrv314Cv4huF5j0qIPUiGEJnifG
	zRThSa40auFEVEgC/FSdJTfzCMeZL8PZk4b5ogQcLN2R2IAAn3H0xrEz7vh7Bf5erjRT7CWS4Zd
	YcD73YjqBVastgWdUxIxLZonivHnZFlAbHJAmY9i+QC2rJiq+VSG4s+4nE8h2JcffflUhgovVPL
	Twl3MBjJKrTXr1fUd1MHAOHn9FqOhTLMuu9gAglMoCqQ4Fe+8QR+JhwMBUVUzAYQG4euZolNKAM
	I4KaPr8NriTg7
X-Received: by 2002:a05:7022:458e:b0:11b:ad6a:6e39 with SMTP id
 a92af1059eb24-12703fce96amr2786239c88.5.1770637472388; Mon, 09 Feb 2026
 03:44:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206171253.2704684-1-gary@kernel.org> <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org> <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
 <aYgmENPRTdD4wCVF@yury> <CANiq72k4D0ZPDzBCHY7xq=qOmERHk3e7P8CcKtVHjjjOQhJ+2w@mail.gmail.com>
 <aYj7J0yTJtYlxLt4@yury>
In-Reply-To: <aYj7J0yTJtYlxLt4@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 12:44:19 +0100
X-Gm-Features: AZwV_Qg7nUV6rtPfWlG_LGfIqT8Y7Mi6NVOXBREtudXwxjELntn5qaYrZ-_btT4
Message-ID: <CANiq72kkLe-to9hO9+Q6kk-xpfAUZTCEBug05USruPymE4GkeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 8, 2026 at 10:07=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Can you please keep more context? It would be easier to refer to an
> example if I have it on hand.

The existing docs for `build_assert!` have a couple examples that may help:

  https://rust.docs.kernel.org/kernel/macro.build_assert.html

(Those are the kind of examples I would like to have in the module
level docs, I think they help a lot to quickly see for what each one
is used for, even if one may not know the exact Rust terminology
etc.).

> I agree with ""Build-time check" here is a bit confusing", and the
> following indeed looks like a compiler implementation discussion. So
> I concluded that the difference between build_assert and const_assert
> is not visible from programmer's POV. Please correct me if I'm wrong.

Gary has also nicely explained in detail the three Rust ones -- what I
was suggesting is to take something like that and put it in a single
explanation in the module docs, with the examples we have (or others).

In any case, to reply to this bit above: `build_assert!` allows way
more expressions than `const_assert!` does -- the ones you call
"runtime conditions". So it is very visible to the programmer.

(Not sure if I would call them "runtime conditions" though, i.e. that
sounds like a normal condition that gets checked at runtime. Hopefully
the optimizer also deleted as much code as it could...)

By the way, in C, `compiletime_assert` (if the compiler supports the
attribute, which GCC and Clang do nowadays) fails in the actual
compiler rather than the linker, so I guess it is a fair name, even if
post-optimizations. But the fallback still fails later, so in general
it isn't always at compilation time (and the docs use wording like
"break build"). I guess we could eventually rename the Rust one
`compiletime_assert` to match, especially if we get support in the
Rust compiler for something like the attribute (there are already more
`build_assert` calls than `compiletime_assert` ones in the tree,
funnily... :)

> I suggested const_true() over the original underscored _statically_true()=
,
> and this is an obvious improvement. If you think that 'constexpr_true()'
> would add to explainability, please submit a patch. I have a weakly
> negative opinion on that.

Thanks for that context. Hmm... In that case, given the current name
was meant as an improvement over the underscored one, rather than
other reason (i.e. perhaps I was missing something), then yeah, I
think I may submit the patch. It is not important obviously, but it
never hurts to try to align these things to reduce confusion, and it
is just a few callers unlike other macros...

Cheers,
Miguel
