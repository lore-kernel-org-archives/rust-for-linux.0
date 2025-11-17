Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB45326924
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371260; cv=none; b=IO7M0qMiqfyT4d/RiPVIGETPfIq93CAmzzelOt7V7vPttHkb8yLlGOXtMQnp0zVQj5k64KpupEH38jY+7bW6Zf6WBasTa/WHiPPYLEtNU0mm3j/6Inz+ribqa4F5D1An0F57OYLPDC9yA2Z3bLgsg4WTCQSlezfNbrsV5xW8f3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371260; c=relaxed/simple;
	bh=9WleBwX2QRmI4M/SGs0iFUGLuTeERCsCRIqc2x/WgCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3If+dJYq9+I9gglDDll6SAaja/ATp5Ibdv9tDZYOS3kMT6Cd0kkYAjNVEOcCX4WeVtOuWepd8T9cQSigUfJsAV8gSUvnejbbQVf2RL/YLQNW7NUJuQP3KnmMeXsFVadCJyV64H7+lKgiaQe6tdji+unQD5VXQ6QEymaMrl57cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQdGI2pD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQdGI2pD"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b8b33cdf470so112991a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 01:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763371258; x=1763976058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WleBwX2QRmI4M/SGs0iFUGLuTeERCsCRIqc2x/WgCQ=;
        b=jQdGI2pDCgV8tHEzZEkTs4HipKX0J1nuW9c0W3UyXagQ0jRTluHRPbl/5YK4v+nwAH
         kz3H5Zmb3mpe33XZRYyuyJI4mnyLa8GQ/QiuBJ0jUHnX7WixubzWLA8udcVfdYdu/nUo
         RQTf1F4FrO3EwQONZr2HEx6II2T8r36NTOeKGR1Dn6wZTEl1zGJpwAVuOKEhuhcf3Qyp
         Eo80eqPYGUu/rHhZmw7M3bEnw+Q0xayxoME3bZP9uXTj8LKDH53RWzg7TK+wABgbTOmL
         FbkBqfZ1AgsgGOUVNMz/ifl1b3jpSH4fN04/2kZTvPeUSk3aK27q0lI4+IY6m8g2V1kj
         lFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371258; x=1763976058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9WleBwX2QRmI4M/SGs0iFUGLuTeERCsCRIqc2x/WgCQ=;
        b=WsupFS0awk55+uPfomn5bwC7wIPtzO3RCDZGVGpyuoOg7S2cUCOphlEQZ4dSUuunoD
         WmDqxjmdcuLHdEySZVIjYssoEKDrl1HZN4iQphvAYr4hdL2PR/PqUulQCrzSEhVkrH9u
         fU+NOl78/OGSscYw0/2LtaqsNTwJ4nqa8RL7n7YdEiMUKlFGrHgfhIyoz/EWPI+/b5dG
         LLHiIqeuHx2CXcjL6Ua1HyddWBlojuP02iRlRze15tggidcpYtWfj78T4Fts4fXksUm5
         tx/J0UDypShCQ12ouo4nsmsVDqwEbZcFhVZa9tfQJ+MwhU+2aj/8ga9eqQFolDfXd2IH
         n4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTTSXKuIpPF7AQdNDZGW9wzOwObORHd4Qceig9Z35mbRqCxtLFi5/Dn/hkIHqgr62daanv7bGX2b/A7lCA3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw63gjjMGR3TKFamOxUED9ZiF17kBIOLLNfyNUNbl5Jmx5jQomp
	4dPJYgVxy2vgcU+yF5W7rcwg5ErGcXd50eAPsl6mBI8gmRIM/Uq3h4QC5G8Yaj0lJWzC4QqrMx7
	E7O2qcHijcM8FUWxiFxrJ9NtBN5+EW3Y=
X-Gm-Gg: ASbGncul2yfR7aIY8ec+kFtae27zdRpZi2VEHHoOHupIdNHmpfVOm4ADnuN7C9gI2Th
	CmURetdyIUQ/PVsOMFghc9IV56z4q7ak0sRuqu8+NIQWvQmH0+FT7hVGMszEeVQCg8dsuXuEry8
	0iG3ef0hU2IIP8gY+a0+T/rsNrMCtTIhcs00B8QmrpLcbg0S92GpsqrmmmUN/NqBzctcIFHO7S0
	F0gLMoZlWlV9lX5IkAcZlRmrKCAxN8vzhwP+6jT8mboGMUq8PilmJONKfUoXmcPXEPGZzNtkBkq
	A4tWskdGmw7uaVugL5F7XSh6abV8IIQ5rfmKRs3o8zC1h7b9v9eeO9YnKPpW3WKdn7BkLp3PWpK
	FltU=
X-Google-Smtp-Source: AGHT+IGfFrgm622FOc29wvAAHNzvVoGxN2/E4IwtlUsCpeegW0zJbzdx8cPGIxEiroiCX7oWF2z7Z5G/nH4AC44Bv+U=
X-Received: by 2002:a05:693c:6319:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a4add16638mr4250072eec.2.1763371258172; Mon, 17 Nov 2025
 01:20:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org> <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
In-Reply-To: <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 10:20:46 +0100
X-Gm-Features: AWmQ_bkMBtoGpBgvSAmXP8HMTS4lIYkuaUXdKJO_5GS6BNFKAoBNWrknMzILw2Q
Message-ID: <CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build wrapper
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 10:13=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The makefile logic to detect if rust is enabled is not working
> the way it was expected. Move it to be inside the wrapper
> script.

Hmm... Could the commit explain a bit why this didn't work and why now it d=
oes?

Thanks!

Cheers,
Miguel
