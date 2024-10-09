Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705C0192D82
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Oct 2024 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728475356; cv=none; b=aOuGHT76VxyWEA3dsyPEnSzwWzDtRvvGOOzI18MSnqbqoKIwra4QyuYttXRFImedSlmvmRKkwBBkLCgNP/2Ua6Jlxuhe6It1FsznGJ1TloxdCkb41rVWk2I9vAcaQQz76nbi5CVLwfCuCtgk0aeqZmFfUvTg2ac3+17ut1SUJBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728475356; c=relaxed/simple;
	bh=d0d0vbIjxKlT5RMhMyYh9iNcFRAx7FDRHnCkb6Nc+Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTOOK5hP3kz2PHhcvk1d0Zz9jVYJYgN86rSo/EwJR9v6an4TbLw9hB/cpoIdwVjkGOoqhtg/O+cZsq19pbLPJh9g+lLtZBmi3lLLfgdGe40MBPcsyF9KqDc9uB00RtgFjOTqhi3gFhaUmmLDnytC+TFqqsSqZRJaz1H4SSWPHus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=094RUNNc; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="094RUNNc"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so74381791fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Oct 2024 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728475352; x=1729080152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0d0vbIjxKlT5RMhMyYh9iNcFRAx7FDRHnCkb6Nc+Po=;
        b=094RUNNccfdj9BPn6etOfmu2SOQYDH5bfIoiZL7YiNQJo8PyNsney7S2b9zVIUMFue
         X/zKOnqR4tVACpBPmYmRQHXvRKGFxrqic3bBiFf9KkEeXsgjjc+rGnNI5ZlgM7/7vm4g
         daLZAM13lLkU0isdUifrGYqjGoeJfdxRQqAbB5e2/kB6Ut/Nqi4oCRlZmXHewHckzg5Q
         MEjIyzZLvJZ5JjG7VUuFjBz0CnvpIhq+psopn7V916InGXHfMjlMZNNhoov0cRbkaEXf
         VtoYTNQW8NmRVmlg20MtlQH5t1w3BB82iMZOtgjVmgvOAeHHk9frYWMLOxZH/uhwrnAC
         ff2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728475352; x=1729080152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0d0vbIjxKlT5RMhMyYh9iNcFRAx7FDRHnCkb6Nc+Po=;
        b=ZWATVp1eUNmPmXf5+qIZpIUTO6O8XE4ndgjNBnF1+kwpmSz+lsGUOAbXAPyI9kAx6Y
         xaHrQGuoBOvu0pzJtaR7QWPBs7cKimusAv6Q9o1hpoKEC8yvZ8/OiTs4dY2EIiinetRj
         bekuuRM4RVUM7VrF1FAJsoWAC1V74F3WnO1fxswFk6dzR4IkpvXm6Aoz8kOhtv4XNpWi
         ed5DIxrTGoscNK2hd6y6ZrDnzgFgA1cYfj2wgy7fMYf9LLyJZPT70GYbCr5XgdXnmHZN
         hnjmIGK+mJ7biJnL+kwQpnBQQANY0SYWrtmTRAj631e+iEOzky0oigsZG1zhF2MkNEus
         /ANw==
X-Forwarded-Encrypted: i=1; AJvYcCWL9XDEuZho51HKZSiI1rDbruQ/ahdKCfVVUGS6fim5+NVk1TkN17ksJfC3Fp7+TksnObUgzDva+xkwE5nyaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6Qti71XWwH3EZD/cff1DbMpSISmXAVJXq4Efe9/i4YDpGVhl
	akE3IuLq6fS9UI4uMbVzBPcrRuv4v+iTlx3uzNQ+Me28yNBvZwiQyewCuqHl7Z/xomN7mGu/yQm
	CeTWHQJEt0Ptoz7pXRq3bgF4dF4cMHewTB4Gj
X-Google-Smtp-Source: AGHT+IH+QlKgtlwzTqoKPr7pabfTtIKf/Dn6uN0z7IhEKa8GkYkV6bH6FebX2gMi8V7F78F8sBbeluZEzIHLWyDgLaQ=
X-Received: by 2002:a2e:4a0a:0:b0:2f6:5921:f35b with SMTP id
 38308e7fff4ca-2fb1878f46fmr12619671fa.27.1728475351720; Wed, 09 Oct 2024
 05:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009102821.2675718-1-masahiroy@kernel.org>
In-Reply-To: <20241009102821.2675718-1-masahiroy@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 14:02:18 +0200
Message-ID: <CAH5fLggMUPPbE1nW9PCHhhAXcVTia4TU7ARfJwp_GRNpb-51_Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: refactor cc-option-yn, cc-disable-warning,
 rust-option-yn macros
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <benno.lossin@proton.me>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:28=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> cc-option-yn and cc-disable-warning duplicate the compile command seen
> a few lines above. These can be defined based on cc-option.
>
> I also refactored rustc-option-yn in the same way, although there are
> currently no users of it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> This avoids applying similar fixes to rustc-option and rustc-option-yn.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
