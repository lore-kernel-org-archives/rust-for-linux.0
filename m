Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618CA39F193
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210313; cv=pass; b=LyNLin/kIa8MitQBrQEd+MJxnn5el1zl+H9zwhxLMqwrb5wRFCSDVJfi3YxH3e5OEbkR2H1Vd3Iv4jzZ94sD+LVBl/bWirtEctTraUYmgz6IFoEMfUHdvB0ASiUbB1sb8zBngkw/JfKfZ2AI5u5UMZwB0Jo6JwS+MpkMKNcK5RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210313; c=relaxed/simple;
	bh=oOxkjjfhcOl93bR7jJpLN1gAAZ3I9hcHeXVpG4gC6d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSObkUg54+iX0P1MftbLT6ceosftNw9Kxxkz7LU0wOSi0u9ip7Qpmfsq9C3u8hZrH+Q9yqA/Wyzmk0u1GxvUEtoIKbmsA3VnyEQ7RK5kbnoX/zxXAltyczGKohgGOeMwfxLm9Rw6N7h3rQ6J5vKWvRdWd0DYrH5w6FOX0tnsBHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2H2xMYL; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2H2xMYL"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bd5658b901so119514eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 02:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210303; cv=none;
        d=google.com; s=arc-20240605;
        b=AsVCsljkqyu+yhTSGakK4A11y7NU6D9tKAL92p748Rp6qboQ1X18k5Jsrd44hxxupw
         tU3w4NGI25bLMDLOUduOBVebaNRjSD7rCrbK9u/i9WJg0ORW/dWw3iubYFQSaCfXMPQ5
         dVOzshNkljeCO4ltAwasXLDy7n+fAStVPf0fBJZ+nmR3gUEDDWSTYiXCiXT6m4TwGxya
         ry98SS5XpbUBwCmDWarRGxpJoPjF2zJK7sogTkvHkVtMepV4MvymklWFQy/ABmKefG81
         bhf0nZ4tZnMT0Mu4HZRPNbCRse6jSj7gPMcX3je9+WGIGkRqgRRr6pAgtzDWJKYeks8L
         qT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=06zkiEF3LaHgWzKyEvPv2VMoD96BYHXNUimvhL01aeY=;
        fh=+gp0yWIwnZFlldp2juzXVjtF+i199fS8VltDKa4ZGs0=;
        b=J6CrbP8Y5Cyvve7g3UeZlQPAXYhtYDReHJRRujx/6o/lqaiHA+gYLwYe5c9OUhui6Y
         lVuHBaxVgtc1jxHQNSLm6oAgOy3f/XGkyZq1s+/+8uslg+SSGXgRyAptOqLzX5zxXuNG
         3LVofcV+YoKXEPbjPD1SmHbk9UEa3mRAPri+ldLTryYDvjuR0Dlqazd37rHb4/B4VOyt
         aoL5Tqtqxdz8KnpTSld+ALSetMB+mr+oIlcZNo0c8oEfYWyUZ5rMS/1UOGuXU0lNLcwO
         h/020fcWV0NB4LjpxZPvjPQ+bj/TDjtKUPTPMmQ23+ijDeqI4yQ6ud0UP/z8IyZ9tDFd
         wp9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210303; x=1775815103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06zkiEF3LaHgWzKyEvPv2VMoD96BYHXNUimvhL01aeY=;
        b=q2H2xMYLUNIbjDCI13a6dthF6Ni4uVZwy4LuWpkJZrmHNnTkj0qTqM1kmx0mqg6y/p
         VpBXQD4r5jVbZyTJXX5YW+pr0SdlnzZD/Orjzei+KuUxzvT5x2mXHG/o+HMst3p6rC8x
         ZLyrGSAm4bsF/al7KbMGU7WU7OZqzuSM0m3LdjWv4dyblOa2EXa7QultvZOBbGSNm8Iz
         YsnLFYMbPyiDZ+PZKmaS61EcbBmhOM7GKCgQuH1FBXBrdik5xL6Q+gg58lp3dP3RitUt
         bKOvawiWxT0vOkIO2ywS9TRbcFGhodN/ijpFmq85X7GBiLmTEpEDomZApypi/pU3URju
         Cjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210303; x=1775815103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=06zkiEF3LaHgWzKyEvPv2VMoD96BYHXNUimvhL01aeY=;
        b=l+mDBlfGsukESQlnydqGUUmn7BcT/fK8Chlgg4i+rp5UeR6sqSNrXtRXh40issWKC9
         KVbcNXtrfdrZbDyXxiVBTjWU/NzCNctJwI9/Btm/JE8DXPs5vhjDXjRHIn33JF23RwnE
         HwlZ7cALWhj07HngF3fuLVP9QFmhrZExpIdL4EYz+8F9Xtbocms8iSmrgshq7O8maH4q
         07dhIlVerNKMk9QTSFkWQGDB+WDFeV7wLWeNMCl7Ah8qZr0EQkk/2owULDC2fKP3rRWa
         W48qS/5xmzDvX0xlm2b8RfimeSqYETjmpJeLIB/SNtGP6YLuIbh8+OEqWUkFNRPo6WNY
         dcjw==
X-Forwarded-Encrypted: i=1; AJvYcCU9jupah2h8cCPF66I+rYjjtVr8OCQh2fqzTa3nH+nccRaXL+xXtTbxkXYdHtLd2hSzXZW2G7Zy5fehmx4/tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqTHiBTW4W8uezZDDDiZCsAHPAbiSPFMD4I8MpAAqBwFC5LdnE
	qE81u9iUhXfrr+IEk/0aAeNcgE6pnLWCFBS5bK1pzvZvbR0+ZZUkh8REMJMjlQM+nxbxnDN1HC8
	s89DWytm+k4ZhlV26p0a6ZzE3zu9WQxY=
X-Gm-Gg: AeBDievvaqsDppvn2fEdm6jNczcCyOWdosnJGjoX5OWoha2A2fcDZrcrMbrB9edCMDl
	Whd8Tqo98MdSLaDH3owWE7Hm+Z4QVQMDTNjpvYvOxQ9PCVRk+W2IwYcPqkfQyz0UIFnINgjJ9sm
	LFYx0ieCCzxeOxqMKy4O5eV6xKBEqKFTHpKZ7x9TQ6GeZP/PUW4ckcFJK/86unBCVazo45cH3I9
	BfeI+oXADW5lTzyjxnqrp+CUaiU2wH8hkH2Myzf0GRnLDbLvfynhCy9sm2o3aFFhefNTf2HqQqj
	3vSkABiaN9CcZVosMTaaRUoeRrTYLv5NdV8ujQIMRJnIQE5gBoXnE4YovW0Om3GblP51zdfK4ov
	OEZY+IeDvc47i2uYzbxUOCWU=
X-Received: by 2002:a05:7300:3242:b0:2c4:76a3:be04 with SMTP id
 5a478bee46e88-2cbf6b95862mr510874eec.0.1775210303377; Fri, 03 Apr 2026
 02:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329104319.131057-1-adzicmirko97@gmail.com>
In-Reply-To: <20260329104319.131057-1-adzicmirko97@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 11:58:10 +0200
X-Gm-Features: AQROBzBL4Ump9hhVd8ae92CjoyiVRYM6ZJm2g0JNH9_sV-w6jFSfzCWk2jWuV3I
Message-ID: <CANiq72kpJXxd8TytH8A3-zE9bPyF0PAfzDG9xT3+tJiU_j58qA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: error: clarify that `from_err_ptr` can return `Ok(NULL)`
To: Mirko Adzic <adzicmirko97@gmail.com>
Cc: ojeda@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	daniel.almeida@collabora.com, khali@linux-fr.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, tamird@kernel.org, alistair.francis@wdc.com, 
	acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 12:45=E2=80=AFPM Mirko Adzic <adzicmirko97@gmail.co=
m> wrote:
>
> Improve the doc comment of `from_err_ptr` by explicitly stating that it
> will return `Ok(NULL)` when passed a null pointer, as it isn't an error
> value.
>
> Add a doctest case that tests the behavior described above, as well as
> other scenarios (non-null/non-error pointer, error value).
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/20260322193830.89324-1-ojeda=
@kernel.org/
> Link: https://github.com/Rust-for-Linux/linux/issues/1231
> Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ - Added `expect` for `clippy::missing_safety_doc`.
      - Simplified and removed unsafe block using `Error::to_ptr()`.
      - Added intra-doc link.
          - Miguel ]

Cheers,
Miguel
