Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BCD28506F
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016903; cv=pass; b=SCkH1gcAP6ajqPmGB5BvmIyPUeH9wKfO9bERN13qgPLuZ5S6wtK+qgtAfKG5ZnnY16PElIQsw5sdoAimJrTGc928yl4+EMMa8iOgNdUTz9cuJPdUwxE8zwjGcS+XWHNaXEzBclA3WWRYq68YAaQxO9S8CIYf8IU90yftTEj73ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016903; c=relaxed/simple;
	bh=+KRdNhUsOclhfCEeomHUa6mQoiWSUxWc9rU9olZnvuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSEnnSfqHMUVlcdKVOuK2Z5kDAZyqEzOe/hk/opQjlkfy3sEPYXU9XtSFFcJ8e+T3FOwnP+pjbcuzALn3jayI39RE6YrBBd1Q3aLxRumOSHoU8MGsutQIxlizGmlcTs1oMlI4yAc/hR4lfaOLmeyUwHCSz2w7xBsv7hX25//hMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvTFtHYY; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvTFtHYY"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6aa67a792so532757eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Feb 2026 23:21:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770016901; cv=none;
        d=google.com; s=arc-20240605;
        b=JfN9BTAHi0P2pFawP8Md97gAIkUngfhwUwxtCsue0WUsvRC4DrX4Qb4fw7oJfw2Yze
         6asbJN6nsSttnSaVfkubCaay0I4R8yiwg9eYioSm3o0A98/KmRm8s6KEIZQQMAS+3s+B
         EeLtL088UtqQ1s9wXcAnYVXKFK12n5snlTSBHiY5tLhtmkcwN+ye129BP5YBC1lOyFqT
         RM6Wszv+bvovp0CorvZdf6jkis8FhWSaLPhQbJZV1N4cdxmtnzPVY4lZ3ePtgjU6Kl2H
         h/zMMJRNDLqIZDeKmjc10cYxJ2o+6BDsZQp8n7G/DT/gkBQeT3JPrF0QfQBUTEoafQC0
         uUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4KG5V/gg9ddRbVKR3G8jxKDS5tmc0X/k00VtKOTvaoY=;
        fh=trhKLXFE83SvFjBP0uq/7H0jExTxhLO5gZ45314/1tQ=;
        b=E0U7kAVKk2D9AwajhpuXzLrUTkQhPGEl5de1rnsHGlnWWWKioqzFUYkcqkhWl7pxGo
         DvdB5W3LA3XNJ8SJSAFkUI/BlqA6/7O4f/xdMuxnCv7QwyGZTMSeQ1fy5lTBQhKoEIym
         szHMANx3wIfBy5SwXc4ryDwSuKOZX6fJjIT/hiTePF7esKFUQ3nNWmpnyAQfewlWM9SC
         ZWQrZPvjgEeeVZ2qrmBj/hs3St10nU93rhSgNvX96xr9TidMoS+s08eE6Oe+emwndNmK
         /Ahk6KfkT/qAjNcTk8Y6pb/+mkWN20gY6jFMkO87mUsVMmk9HEsbHtLW8KeRDX2uLSVw
         94Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770016901; x=1770621701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KG5V/gg9ddRbVKR3G8jxKDS5tmc0X/k00VtKOTvaoY=;
        b=bvTFtHYYyhTomV2v7arG4kZJz8fyH3ZUVFrWYcaCzl9sAj8/e2AAAk0teFkBvJRfCt
         m1hT2Nj69N1pJN+f2BzwNzCv5d6WtWyrU0ehVOi/SUnH5fObmkv8JHW/Q2+vb8dZuA7c
         gEXZZBPaYXLz1UL5Tb1hwIAx2Uy14UEY+KzhcmkwvVNkRzOB3eAca7E18PnJUvC4ghEh
         1BOQDqljHril9HdYXEJiMY9pkV1AJfcRvI7il8YPAAPUV3EyWv+WZU/cAAZauS9u3d1z
         mglMdOxetWpd0Puezw8qnRxN0LkHWwQFqdLKnTN/3H+clWXI+wqemGVfvHv47I1ghTkL
         jzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016901; x=1770621701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KG5V/gg9ddRbVKR3G8jxKDS5tmc0X/k00VtKOTvaoY=;
        b=uDLg8ymEaWw1233jE8x69Ow5COw2M1cRIU7ETOlXqi5lOGTEbMSxeh5gOaDe6QQopa
         J0ZuOwK1Hh/aX9x21HCa/p7zf8JP5ek9e+3yaMyz50Oix64T/EzZUvqpj+CmT7pDY20t
         xCZMJsfYh/dHXT/4MKybavaGanYEvTcPI6kUR0cTYFznR1vc1xA7DKtfrOQQ3c1kopw6
         +2Y6TUvMd5TSsZk+KfpC24LFw5Ez2d3PfJ0D9Ak5rH1VaohRtMIqFl+3eY5Y2NP8IYnm
         /TsXIWOAmJLt8J7l2llzL/QO9SCQxrmfP7WRaWuzZlpzhr+GGcbk507TWE1Vb9cZ+8K4
         kViw==
X-Forwarded-Encrypted: i=1; AJvYcCW8QeEVghC2Lj9gFwoquWY717gNnqNv80n8g/dboSCIR/IAjZbg0PVM/VxwKepnuj2femdKIyt0rrh4H2ru6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWZyeF8rZ5YzRtqLSCj1ax+wzwAopq8w9e8jVHPoD+Ls7pYQq
	0GZhAVd3/K89AOc1sb4loP1hpkknp8+kmzLjSrUzeQE9V29Hm5q6F5EsJQo9+b8O5sxtRPxtKsk
	9hrZC99o72NIhU3g6QhOY2oc0gL7G7iY=
X-Gm-Gg: AZuq6aK4RU8dJdcK7sF9LHbhmmZP8EHh/WqvEPHYV/oMlqE5RSk3thNDBX3OZ7FRJce
	m9G/1JnU0huZUtSDBweIbJ7H2DHEKadN1oV6oe9cvOxmUWgPxVrh6Tq71uwLqNXY3tTSO8jUi86
	Hg06j8NulhZLtOOK+ouvH0qyHEpgw8bZoROOmSgkl6LqBpCAaOEyGxHo+KeKb+GyXjTJcvJwg/s
	4WobIu/jMFi5/7R0OCm1WZiDfRS4Fx00pMUcEpWho9gedo6ghAv9cQwZiyePsxxk2ovoIZzBA5P
	HMlzLOJrtG5TFVQPoZJpXZuCScasgdNC5DPIGz6WLz4Xds1zR8/oDWznH1Fw9vXPQ6RWIh0Z+WP
	Ksi49mzz5Dos2
X-Received: by 2002:a05:7300:6d21:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2b7c8523f57mr2521839eec.0.1770016901440; Sun, 01 Feb 2026
 23:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117-feat-add-bitmask-macro-v9-1-45ea1f00f846@gmail.com>
In-Reply-To: <20260117-feat-add-bitmask-macro-v9-1-45ea1f00f846@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Feb 2026 08:21:29 +0100
X-Gm-Features: AZwV_QiJmnmQnlyUoO6FpRP-2gbUSQ362hKEtdx7e19OPG286AFIFKiftrq3J0g
Message-ID: <CANiq72k0J9iMU4bYGkrOO_e9_4TtCUy4ovCUYWfGNMjtCYko5Q@mail.gmail.com>
Subject: Re: [PATCH v9] rust: add new macro for common bitflag operations
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, felipe_life@live.com, 
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 11:41=E2=80=AFAM Filipe Xavier <felipeaggger@gmail.=
com> wrote:
>
> We have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for BitAnd, BitOr, contains and etc.
>
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and upcoming GPU drivers.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General=
/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Implemented missing `BitXorAssign<$flag> for $flags`. Sorted
      `impl`s. Removed prelude addition for now -- I asked the team and the=
y
      also felt it wasn't needed. We can always add it later on if needed.
      Fixed intra-doc link (by removing the sentence since it was superfluo=
us
      anyway). Simplified `empty()` title. Reworded commit slightly. Added
      docs to enum variants in example to avoid 'missing_docs' lint when us=
ed
      in actual code. - Miguel ]

I wonder if we should check the values that the passed `enum` has,
e.g. about zero. Anyway, we can discuss that later.

Cheers,
Miguel
