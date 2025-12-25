Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BA22EF66E
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766652796; cv=pass; b=Gk+lzLKeyBHGnh8WG+UzP3PrCJ84oIScjk7MV8IvSQGvs6kA9TVU6Nf1GTdKWFcozhELrQZ9vUpESD9IKpC92wD7deLH6kL5crotuvSJ9mun/4U3wTr27P/z8ePXnhThXXn/zLnpGRGVN3/V5E2WXhnWulbIgr3DVgHkPsZkGjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766652796; c=relaxed/simple;
	bh=tYHSTvgoAy9+tJlkd/9ZeuLZQbgHEkcZjkZ6FBldCTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QY5aFnOzhJhlmzZsz24HOpERizjO082zQ57c6bGgKNq978fSgd07mtcK0GT8GSKtYnpx3v1NVTPLc+73IjoU73w02onspYn5u+h7nUFVh7If22N0AYQ4nVaF4l3WcGhOs1MndlfhnAdqnMpy44Huv0aDHz3AQoF2dOgho1AByqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6uqlX8J; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6uqlX8J"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a2bff5f774so14631165ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 00:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766652794; cv=none;
        d=google.com; s=arc-20240605;
        b=B38Wfs3EbWMBO3v5sNH8R1BZS/4wI+uRSMh+PI4G6GMBdFaXAyIGe3qdloZ4QxhEPA
         j84Q63vu7HxyADyCMjfV8+fHrrbGoWeCAxP8TxuZowyy3lhxSyGIgdk+mYDySHyZnSj8
         RE2CXCax5lCKqR1kCu4SnXtYeNVIke6UnV/qhHZ/8+F75E7hLFWuWSwf1R+JIVMhCjrb
         W8vwsFJXpDQZ8SZpCAi96euktULHvS5CPCGfaNVixkvtT93K3LzPuAyqT67Pj4Rhl2OW
         3NY/Q9Tld6SSQBAEbCMgRAC5FQWwcY9M/Nt+UwpPw6peZOoSNWvzVQSo8xuuOi+TRDH3
         T8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYHSTvgoAy9+tJlkd/9ZeuLZQbgHEkcZjkZ6FBldCTI=;
        fh=zIOHWdN/ypDm5JoNucnKR6J/5USw2zTBD9+idlFtmDo=;
        b=czJAWJRPOtmhkBIJVfTZOCm7vumoDYpSUmWCaoPjLJ9fSf9UiAVmJNX2ynfdXTuT0N
         Vf8B+lZ3c68hXOGC9p0bGm8gt5AimMY7UdP1z+WbQMxpAL7u9tsTw/IcG8POlgTuRZIa
         UEFBwpdTmb/h6WUIJGY0osmuqcDrzTGgd4fnQPr99S9FSQqU8+ysZchfhyp7cd2yk9eW
         83KRycaKlNDANxy/O2LH8O823vEqz95DC/VenNlaKxmT2wtkHAsMpjVallkN5SdWsQ1/
         T7aI9T/dRciahxMlR/+j3zHpxLXQHdDmyYgYvmDSFybEXHZUcuWNywQIvGjIO/GhN5Es
         LTUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766652794; x=1767257594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYHSTvgoAy9+tJlkd/9ZeuLZQbgHEkcZjkZ6FBldCTI=;
        b=R6uqlX8JHOR4PHsGlYHCRLYyo3rrxWx4YNiL+aY15UDoCOr+NUcSPmD1rBqboFXJdo
         d2teTZC57LsLjzf1nZ2hpecX7JUBZolWYGsNkuy2XHqn99pn0oIs8etQOWdJutbjH1LS
         qreLzD20oMdmqQXVj66gaFdmHH/tVnN3TTKx41EBxNYDZQv0HnQn8l4qmQEmFraG2aGP
         ABTG/gQ9GEhe/nYldl2Lq7UpduT8zzk7wZncZ6R8dkYtYAVhgBBmPpsSjVEVMVcw0y8J
         EQuvp1QX5tLlB5miXWJdLvQY0jWDB0e7fOFZSVu3fBSq6HcFBGUEijPnoiXzr/Lw34nc
         sygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766652794; x=1767257594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tYHSTvgoAy9+tJlkd/9ZeuLZQbgHEkcZjkZ6FBldCTI=;
        b=Hm7Qk8uB78FymPnKzuwkjZTRmGZRw7FQ6VG2b3cbyHAX4W29li8hgPGRsAiHoZ0Pf4
         7CIJpJs2ORTQOfUWAQUN7feQuD4mog2HShviw5icS1k7cOSrRXou7DYkODMWxGShmqNv
         ZTTBwxAlB9bDTJAsgJH8k0yx/dxIYzs6dDlhM/XzXsSDK35JwinEj1eu8037/VLiuCWU
         KPBjsvdjKvObjEEPJ6zOWPhMBHfk4OJ401stJ1aH9Fj7SQjXbkqJeBGvtvsqi4V38XnF
         DvkxWlNlLu9lmzycp7l90hxn9xz9LC3TH+GU1t57lxK6WCzRHUytWkSwchkuxhrZlUBo
         EuTw==
X-Forwarded-Encrypted: i=1; AJvYcCULBfkNX76V15bNK+k9iCx0bqkNM74fcD3ocOov0dJm+ujaEMRwgBfsqu1viBsO+HghjV3AEFkL0QMtiMOTYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9WCktJuPoyD2G3kQhx16csGD0leFGhatn6tTOBx1RiC3yGR7i
	0/mU/14C4fI8NzdNaFCw9e+LbEmyaCK5PJmZd4OXq1xVVfKrMOV337GwUsQvnRfiowW5y3qL2jn
	dAUf/HMeyNJoBZnZSss9Iul4LbDoJn8s=
X-Gm-Gg: AY/fxX52EPRerP4ZtX4LoxHyUpLNPzaO8v7NLzzEuthRgMtSYSvCh0zTKlgRgSLbLxx
	Sh1A3nY3Tzl/QRUiumX7bc+PP+7ysX5pG+Ct4TaCef5u4qBHKT5i+SiIeX+bpi7C/jjkSkfh4a2
	ie9FtA0gw2rpg36IwhkDSreOungsuR54HE7+w82D68q4KGTqSXw+cnOmqCQ5+rKBRSrV870v5Uo
	qDaaP7om+dMFeq6RtASSEBkHB0OKS9Y+u+LKlVEOYgG5NXJwGqEdvFzIWs96cBQZB4E74FV2uOr
	wFSHG3NqQS4g3RQJNX6G2ElJFYlYslsfp1z2Kqbdtcit6lafK6HLCtGxuW33oLpQHEozIWModhh
	3LcTp9kcEnbyC
X-Google-Smtp-Source: AGHT+IGxHS3T41bMJah+h2fxoRQGgY2sv8KmscfPcELHkB8uJ/e3gNBZFklo//OrPgmq2bwh2jTeW0bN0bzjOW+vJfA=
X-Received: by 2002:a05:7300:881a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2b05ea06747mr11031639eec.0.1766652794240; Thu, 25 Dec 2025
 00:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
 <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com> <DEYMFYQH2GY0.3HF506HL8OHY6@kernel.org>
 <DF1DP93V7IQ2.2BA2EV61WUA6C@nvidia.com>
In-Reply-To: <DF1DP93V7IQ2.2BA2EV61WUA6C@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 25 Dec 2025 09:53:01 +0100
X-Gm-Features: AQt7F2r48akHot5jZJNdEdgXb5JrNE8DTBABH7PSmZUQtoXBVsr75a95o5RFSCs
Message-ID: <CANiq72kc_SY9Nsy0kYDa__Uqjt3WqNnT-yfqvF=1La7ox2Fzyg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 2:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Miguel, are you ok if we take this one through the drm-rust tree? Nova
> is likely to make use of it this cycle.

Sure:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(Catching up on emails...)

Cheers,
Miguel
