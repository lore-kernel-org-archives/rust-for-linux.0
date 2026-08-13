Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1960F3B9D84
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605816; cv=pass; b=md2ICW0kCWn69bfKR7KJ+F6o7VbNSZVK1lgvwB7siT4dJ4+PTmOA9VPqrD2LWw9/avj7GsUAVSdDoveUZF5cxXnMF0M1+a3ILZMK6xugY7FxJMjumMkngt34elG5GRQQVy0hCL18gCgFvDiXVchv1wut7Wagl3r64vDbFLv4+oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605816; c=relaxed/simple;
	bh=2PFGMFb+nHKE8x/xvUPhNHSabhwVI0LVtnxabgh9Ig0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kReTx2zyrWdOioqneIPmBF+J3ThR1Ct/3F4UMsAPOOfHuLjQJZ+OiQj9SDBlO4wAFkzoHLZO8nLjgk6e1q0DoAcOIjTloWoDk+6SdTklH2Vpg87e5bBPJUOhqH38o7XPseIDJAkWzfBunK2QVx7gSWaTQIf5bILdvNfcfdK0d8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8ipdBH0; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8ipdBH0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so353443a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 00:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786605814; cv=none;
        d=google.com; s=arc-20260327;
        b=KUwoCWINmrkrIkdz1GjQgCVSnKp2q3B3OPgMcCLz4fXo1+LUD4RQKRkyE5rh6c4RQx
         g/PqQDIPa67MQ4V41+2yYxURCAs+E2rWZL95ElzT7JL8nKkWh3KvRJ0yYL/XY3R4LDCB
         cMWmeNSwIIsMRKy6pxYPQ8QgMFA8zJYokjQ6pHA1+5aYMSFvGeCDpA/cMjZuhKaUFiAy
         WsYJ4MMzLCqjNW9F4bE+H9hFqeF4c0jM2xZya1qfh68RlNMpDRk7htxNYASiSNZpi0+z
         NAIxJOEm+JbfIPbaqWbK9Vl2RjhCXBL47RprWlIDMiNXsZmWIgPhxa7vuVFA087RxmL2
         H6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2PFGMFb+nHKE8x/xvUPhNHSabhwVI0LVtnxabgh9Ig0=;
        fh=AvKm6O16FL3ojgtu1xwbulril5FB501xyY/XrD48F3Y=;
        b=E5VkLN2NVdASu4kLvmUb45+8jFTPwk0QLKonblLWIS9RBrFVmxHATXTN+qDrFKbx/M
         eeB5/dIYmxkoQtU9Ndf9d+VIIT6ntuSC4ngJW3HEH1UWSdSHO41IH+XoCtptqsb8Kguj
         BQRJsfnrm8ieCbLETBWI1g7OJTHa6X5xznUj3cMwSDCR0T7A1O7yRNWP9kPSMbyIV8S7
         oIEu0ZhI/2cKLMkXpHjAx7wdJuFByGr+cxwQ6P9CXKCiuVQ+tYSYWk8RYy1aXXt3tcV7
         y+Dm7enWdQ6/sOEG+rqs4Sti39PWmj/V/zm9E/feWJrKb0jcblsTpF0oGOemPiLG76kj
         H+hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786605814; x=1787210614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2PFGMFb+nHKE8x/xvUPhNHSabhwVI0LVtnxabgh9Ig0=;
        b=C8ipdBH0Zz2R2AcoBefpUCpLxVufzEuen3cWRx0GQ2ZRvd+k4jQmSNML8pzYi4Ew4f
         rsbcDxiMY8VXpYlWxx78FQoTrONbpDNYYcW9WgNbay7OU0ow4d0wE7dbrLC5aRIcfobv
         OxGqgpdzBunOpdfPgMeMfbLrYQjygoFHPBdwEnuLkY+8B5feW+U9w8XgFsHbKOI4+8bN
         Fc98/7wLkfrymq3mZnGsbHoTs4cKKMC2s51rV9d4PMItnWnQJPlPpptFeHc3ivigQpAz
         oA2CTWiY5OZ+0yg62fehYfY6Q65fpanIIUHlQt11jJb6anPD17f6wBta8vtBgIWJX834
         aGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786605814; x=1787210614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PFGMFb+nHKE8x/xvUPhNHSabhwVI0LVtnxabgh9Ig0=;
        b=UPf4fJIgKsBcB0+qzp/C0eSxvld7NfQtuvGDjHYkvBdJFhgQFC5xo7vkQYkuZwvAMb
         t/3MJUOVQkwrdrbvFu1H79dmuPJBMIZVWEN9dLnHfnuizhL1W0FiLF+5lGhb4Q08eo9F
         ZqLgsS8Kw4+N9OZqgzXhEr2SyAlyMEkHZMypR4LJChQL+SrUmGLjstqbTNtMm5pLdrLh
         d7yWcWqoYDzQnMKwvsnbYWbgHJOefrbp8MWLB2f2Hm5DksC8ltu7n5WL+slkBgwnck9A
         LtAUhlfK3n00DwlsdCOW2X36Y5Fe+vUCzuhqQVKz1vq5ORZfAYQPA81HlrGhdHGFp0f2
         Yi+A==
X-Forwarded-Encrypted: i=1; AHgh+Rr74YA8wgFd8Uc/hk5ehjzu969N4bdXQpoYyUAXBtkbm5pZ+pKVMlhllEsJlHiM9XGzjPE8+L84IN+9GPXgPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Pi3LsMcZko+BjAKCgCUAopYywbR9EQgjcELy+ijPb3Vivwl4
	j79BbriPZ9HY/ZPOoxG6dYhMA5IUAhbx2L6SVk5xpkMRaP40L5Y1+DzC4KMenzweBKmBhfB3HC2
	gpI/j2CyshcActd9IEAhPRzMfdfNSw44=
X-Gm-Gg: AR+sD12Rst8Fh0qFgGQmfTF0GddL163pQjxlTERGIYobK7fAfy+rhXOYF7eui5I7rrZ
	rqRilwUpQYBYgrfNvoAlW0MDIX44csnOqYj3NeCyd11wC/6DRvan3J4J6gSeryEWKe5JpqsGTq9
	8HfzdFX3aCU0dyPyKweQtI85TL5tiPaIbqXTV8JTe63L5tJmGudrl/3SqlVA3d6iokfe1ANLKlJ
	12n1KEbM0sS0MvlyByQ+pNpnBEjruYxlMVGwPfek9roT+KWMme+m0arAVjJv1eSaXD+K0ewlnrg
	M8GGJvtmcKOMQiBOcNqZarSeYHToM9cqXKsYwwyybbtANgdJ6XdeOBoQpNfQUe03XTTf05E1OyW
	ELHTbzAyazypODet1t5JS9tsC1C0NbeMEBb+MODjpf/MNvoDG9431Qx9OTtEIkTlficwe+Fc=
X-Received: by 2002:a17:90b:1d4e:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-3931e282b77mr3120507a91.2.1786605814096; Thu, 13 Aug 2026
 00:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-hashedptr-v15-0-eafd27d36476@kylinos.cn>
 <CANiq72=hGtRyqcZpEvLB8mS-qpQeCyecruVGXSaPCxFfkzifXA@mail.gmail.com> <525e31a3-6595-4d8a-b684-67cb0e903c08@kylinos.cn>
In-Reply-To: <525e31a3-6595-4d8a-b684-67cb0e903c08@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 09:23:21 +0200
X-Gm-Features: AUfX_mwNznmMOTIHuwjKldMXNuIcF1lMZgaTf3SUpoW9xxGsRWqoobscM-CqyGg
Message-ID: <CANiq72kWM7OJjQ9J-o+eNqeywDJJe6po1M2v9_GOPj4E=cUhvw@mail.gmail.com>
Subject: Re: [PATCH v15 0/2] rust: Add safe pointer formatting support
To: Ke Sun <sunke@kylinos.cn>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 5:17=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Thanks for applying the series!

Thanks to you for working on it! :)

Cheers,
Miguel
