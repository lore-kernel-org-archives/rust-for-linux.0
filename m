Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A3143759
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 17:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733245532; cv=none; b=UrxVhO4GWzmPKhvc7Xy3VLN7zRCqkY3PD+pDaIKn9kdI6pJoH4p9iBFS2++SNvOkhgJY3OJejf33V6rtjRshHDf6T9NwzCiHYCHTRwCSFnduJkpV6jjk6TOJ7NN66c7TxnOB7oJU186x/lbRU2caO/BbBzs5FATfA5+IWf1ueuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733245532; c=relaxed/simple;
	bh=pFxzie7d4rVdGXxbjGyGR8B9lmpgpdsNPaJXSplW7rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=teYsxkgt1VCEVD34P/va+i4c71c/Z3ZVJkGaJWON8tkUSDMhfouqVhdRxjHqlUd+8cADJgIoXeb3yWWEGnHtW4FT/eAZxbXwghDZ4hR8+WjF9x0FdMv3Txl7D/z5iPBNa9dn1DgSesrDwjtXsHVbsPGksvocKGTlvSzEKDkQVI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y99bTvm+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y99bTvm+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e1721716so2222625f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 09:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733245529; x=1733850329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFxzie7d4rVdGXxbjGyGR8B9lmpgpdsNPaJXSplW7rU=;
        b=Y99bTvm+CCP20hM2lYv+UEXKrg+RgA/Hbf5KtRjcO4VHE1U6rsiHPMdJWUTqHNUlN5
         VzbhQdDKuPr6q4fUleh5c/6TXykIDUcMBO+IIcHac15+yKG4CxzWH07jFiJpnFLdQNQW
         WlbWeXrhGqMOJxWnKpY8RrKvPbnhhdLRbb/4amkLq0rAUDmowYLk0R7aAFUeAfG1eHdw
         VOu7doNVv/Wif1j88cWpBKiRBq5R62eANlLqcEJ0Q3IkPBjYYcRVyylFH/XgkAy5ovF4
         73T4iuAIp/x6MxPudba4BEnNY8rMu86J2COWWPzZjhA6Elg3klxZbsXwcbcb3j3GuEno
         oVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733245529; x=1733850329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFxzie7d4rVdGXxbjGyGR8B9lmpgpdsNPaJXSplW7rU=;
        b=hIj9e1RGPP4mJ0E39X8jEpgtbVKyPmKjFESiZO4endJIGCpUa19HtD6eiTEMLndPqG
         le2p48TnNy3p56Xf/RbiGn/EUpnp4xzI+4BMV8t3LDvtCV7Oh6MzbJMng+FmaZTubayV
         lYnHy+l6DQWsO2iw+fvp3JXmxUZjcOHa1ViVB9eabxOUg2+d/MCkKZVnvAK0AgwgHnJM
         X+uz33zRQ3AgcMwifZiCsqrj8lTHfHDmDLogt7QXtK5FbxZiJONJubnC5nKosJfIWtga
         ms0sXmLykt77TuGJamFNwHpS8lRRECSD//WqZL8o6n8bfEi52KBAlG2YeISkfJM3bB3s
         1HxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw2blKr3wn4vQonuORQ3jpUkWREnkF2X9d9z09rjQM7rtYwwEnl45f7+VztYBDKGValEoob+mMjhWw5Rlr8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAPNhSlwg3fPKs1wrVxcIUQ4b0e3ccqoaJhoDZuaAXvyWP1HCE
	fM4JY7YdFOMVlzScvsp2wTlEEZoPiEl3mly3pBBD60ye3hDFN4k0EcLKR4PVUSLa0fz5d3gAVDQ
	jbB6nnPLZqThVraimJ0buvKhDM9p3LA/jTtHL
X-Gm-Gg: ASbGncuMHZMwaBAXEE2a6yHS94hBCz3MNR+pQGeySpYz6OvOyWPZeOXnEGpl6fwBEFY
	38DmLAagLXsSxbtZsyQCwfpbTnxWBt8Ex
X-Google-Smtp-Source: AGHT+IGXpFDNbmsLHw0aFRliY4X3KqTs46pn3woNBu8qT27zr0f/ThXoP5MFbDWCOhrQ154MkA6hCY3nmp/+ijERccc=
X-Received: by 2002:a5d:47cb:0:b0:385:fb34:d59f with SMTP id
 ffacd0b85a97d-385fd3c562cmr3339844f8f.11.1733245528976; Tue, 03 Dec 2024
 09:05:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107-simplify-arc-v2-1-7256e638aac1@gmail.com>
In-Reply-To: <20241107-simplify-arc-v2-1-7256e638aac1@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Dec 2024 18:05:16 +0100
Message-ID: <CAH5fLgg+O7AxZAHZt7FSuac3b-NaNv4iWOR7=7tDXNBK=nTd4A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: document `PhantomData` in `Arc`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 11:36=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a comment explaining the relevant semantics of `PhantomData`. This
> should help future readers who may, as I did, assume that this field is
> redundant at first glance.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
