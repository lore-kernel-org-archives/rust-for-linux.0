Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461452D7BF
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 06:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748846312; cv=none; b=MJa1NkkhfkpSsmVD9bQ9L7KjlMI4jrkUbXK3ylM0cZ8WvwI64umb83Opt4l0ZXocFU6LM2Ken2hQKqSeJgqQApP2hx/cML9YmgifEt6b0gbLhLVBxlvc7CiJD9oy9hyWb2bJS/A9ub/QbhbdY26x+FSc4CXVg8qlhR8xZfPfoE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748846312; c=relaxed/simple;
	bh=5K9DZAdoXkEhJvvS8lIyG+i+OoTGkEjZLhsCL/QjuU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tq3+kd4uhBabQVxmgsRjHZEu33RWrUrix0P3Yn9H4xZdNsuHIWjsw43iMHFMF0kY39kLpB9sYSxSvI69+COZI+E1aMk2CLCnqgXj5mRqpeRMIvt07oHksYKzNHRfy6IRVrYkz8oE93HY4S1G0Syvb6lQtTsRwk75NTAvLs5D9/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqD4f4Z+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqD4f4Z+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-312a806f002so196478a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748846310; x=1749451110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6/WtYv92WDCQzfI89O1jMWaaW6tHqiaCffXvp4Jf10=;
        b=hqD4f4Z+rzDNuyEGNh1ZCTtc3330oCNarzQxL7gUu8uPH9WxjIJpdBZCztArkTiv31
         M8zPL46SsjGpAg1DUyJ2ztPH49Dg5e9vuxy5a7qYyWFjRMxsBwGIccBDa2wUtOViYUlK
         ZZxqdgdxzGMuvqkciBXjdLfDoGeseiOamlf+Yncqu9Aqmkf7zR4xavN4wpfzx6n/dVKp
         XlbqJzA6bNdZ/bBAMS3MRZOR5AEbgNM8D7RmrmAlCsukQUZFDNwyVpRYnhh4UezR8wcp
         uKEdFGxLsaFhH5Wb1DKPaoUa+dIGxr772gPlTMZkuLf0w3xw9PAfDMQ8XWNzlTXX3hSD
         ap8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748846310; x=1749451110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6/WtYv92WDCQzfI89O1jMWaaW6tHqiaCffXvp4Jf10=;
        b=TiXHCuyO5yceGhIRFAykPDlbjMwXJ12v6epW+gfMS9mbBXk6LNIxiT6J3o5kczIf2x
         iREZchF85YzLtUiYTcXUtydGnT6bHSvarQ8rpKYyp5oMjJvZMOTjoSQPfe8OnRrxiaFU
         x58YItsoDzUw1hZvaTXMLjbT20lirbpgd/YfNC76TqiBwgpO/ypqRDN45M0BqdMu/Did
         F0HsleTwtOkBIQ6OFmzaC5KqnlFaH9av8m4TcTvuBXBwpCkBoQDDB7+u5or/Z8ev/7jT
         llkGhlINoDJ9hqrXLtIDW9qicg5VJXduqyJ/eqR3DZcwcM5Gnsfx8oCypuyf/RpFW17A
         ZSaw==
X-Forwarded-Encrypted: i=1; AJvYcCUP4fLw21QrYp+hnlXceb/SamO2Tt+7f//preeBNUctdsaEX3+pqeu4QhvgGVasixtYb+lnAXdBT313+iKVXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylQAaDZHaIriFsiFxWwV+JdeZi2pxot09V0+S/qtIwkvX0BZ8L
	L/ZGfAPVcu8zR3kNESG97A397g5JqnuRqXw7RWx29QsJivbJIMLsq3ULYOK+gSSqn+63ahK3dyu
	uVNVWgXbG4C1gqoLcQWTmAMwn0a8CmBU=
X-Gm-Gg: ASbGncuoLGAeytJj5WuoJjDgqaF25/qDF5p43AyVUM+Gp9iUG6huMpOafzxyEPyWw67
	9pyW4zmWFoFC8N7jS/ozGE+Shk2o2Is2yYYfaM/jINzI10hGHcJFDSuOGEfwvmzL5t5ekzE/3dT
	rNCraa3FkXRR14C1PKKnxe25mjHNR8tVFg8LS1aE06+v4=
X-Google-Smtp-Source: AGHT+IGDnFrNctY2BZsrUFmHD3WIym+SkWAGWtWeIQZExNMaiV6VP5h9l2Foyc29sJkBB2ppexPTia7WJ+c1swBM1LA=
X-Received: by 2002:a17:90b:1a8f:b0:312:1dc9:9f5c with SMTP id
 98e67ed59e1d1-3124db0a69dmr6276557a91.4.1748846310386; Sun, 01 Jun 2025
 23:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
 <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org> <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
 <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org> <CAPZ3m_gCY=8PScnfGZmJrpxgPFtTOaSh6Xw-9hS5pcUs7y4p7A@mail.gmail.com>
In-Reply-To: <CAPZ3m_gCY=8PScnfGZmJrpxgPFtTOaSh6Xw-9hS5pcUs7y4p7A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Jun 2025 08:38:16 +0200
X-Gm-Features: AX0GCFv4K3Kkfeg5lJL_nJ41MNrvZNr1dvdVDYMiaTafaqDgMKNXXrQePYM8xKg
Message-ID: <CANiq72=MZ63Yyspe+XoHkT6zQNWmLt8_qRScoX=2jhLzV73e8w@mail.gmail.com>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add invariants
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 3:18=E2=80=AFAM Marcelo Moreira
<marcelomoreira1905@gmail.com> wrote:
>
> oh no, it looks like I submitted the patch without the explicit v4
> version and without the 0/3 part :/...  Sorry for that, it's the first
> time I've made a split patch like that.

No worries!

I saw the other message with the extra "manual" v4 cover letter, but
that may confuse tooling, since it is wrapped and the title does not
match etc., so it is best to resubmit it properly at this point.

The cover letter, and the right titles etc. should be generated by
`git format-patch` for you, so I would suggest using that and
reviewing the output (you will need to fill the cover letter in the
file it generates) before sending it.

Thanks!

Cheers,
Miguel
