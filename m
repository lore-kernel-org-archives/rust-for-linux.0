Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B802C0F81
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769805184; cv=pass; b=cpG5Z+L229stOhfz5enYHFisvyi0hLvK7G6PYOnRA3nFngQZ6E/jcU1WJT+pZqPac4JtP0W5SRba5ZmwyoRFcOEJ73zjwUGoRHQTdF7YV8FsZ2Pc3AetjLebxpTYAQBzmcS+1rRpteMDAEhdmRs0FgsLSBkjrwSGMp2nqdZS49o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769805184; c=relaxed/simple;
	bh=QpmnObuFW1DC4WhAstZmhE6ejRlTpM58/h9Bjy+SR2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvgoQ3SxEfeGmOCQNBpABySMHmIXhXub/Pc8iBa8QtOeuPp8B7yNM+3KQ6ya60iBam/4ojJNZH1/NmBsMVv3JilO9WEHYQ3lfbcB4Yh9W/9WhZOkkRyvxUiQx+wDa4O04n0bNQ3hU4VvpcKTF7V2yfP2A5ENMcHFz/yenGAn234=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRpQJR8U; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRpQJR8U"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b703e04984so139418eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:33:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769805182; cv=none;
        d=google.com; s=arc-20240605;
        b=jmKygZV4gcH3/iyeCQ/rsq5MyqM0d+7dQKxFENVnN3htbmcAxMqkGdOZRj+/qYl6ct
         47IMBHMuZyvFhcyZVQXRw2Y5y0XIA258aYCwr6djbL8tU695OLOL+VdbqpLir0wxaody
         1DraKCf55l/KzrMgJynujdIO7cHG1vX29mIvE7WyyvOas1DAI7en/2KPlbb47SkTemsj
         ujAZQuXCSgkV2VYC436hMCwX3Ml21Eqhp7//VHnfzCILGCjChG6RQXPKYSeswNIsGM+e
         d+NU2b345dqBbKXTukHZpgwgU0W+ld1629nebiGHlWVBcDuD8CkWFGMOYXkPQXosFpfR
         8mIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QpmnObuFW1DC4WhAstZmhE6ejRlTpM58/h9Bjy+SR2A=;
        fh=RDZtw8EgdbhNnsaffA3obhue+FldtuwWunW8ArP6Ghg=;
        b=g54fspsg/V6nwnoyD1kRkjHI3k7Kl+MQnAZ50SPUCVMpV3MSgMELx/EPzo6H8JsT9k
         pTs8DYs0Pg13JXEna1x+PFxJvCgPmFy37BZjpTP4w72nWtBljyvJPceWhntfUz0YyLik
         nWWCOze36YMTnpB88A+TSy9kA2qGbJHTlrz5lUECsEJQ3JmjGGMPNIXKbSJkLTmVm0Yk
         ZDO3XdSq88x9HQiEdbEBUB1PrLtkmAu+GX+WIwwZooEsLUWyC0iO3hoThTITONZ2mCMS
         iGIdjm1mpOiIFV0LW9q/XNnwZC++cw1p2udBqIQJoTXrsq+NH26rsJgRC3oznKU+jW9P
         bA8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769805182; x=1770409982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpmnObuFW1DC4WhAstZmhE6ejRlTpM58/h9Bjy+SR2A=;
        b=iRpQJR8U5xp5d/Iin7pnr6ehXl8zokCNsYLBFnP7G7ca1XbtsNeEJ6YiLyim39lsqz
         XJ1qAQK2+NTC6XxkdOV3MBWeVy/UdV39Cgtkaof7cSfboJLk1quxa4B85MxPiltSOqhM
         ScJZBQE4W05MRcxglmKsg4HrRVOg14AQwx3G9HEkuG0Z8ELk7647NxE0DChLaJK9kJ61
         vqZrXcd7s6tJFwGEgv8nISDFRqEgfUZeoBRMweCPOurHPhmDW2psg/9WCGUhQYKDGrKU
         /0sfiWAkUJ/upk+62TRd14KUq+g2OjAyT/6QfegKTxoobNiFtYD1CX1jxpL/w744UU/R
         76Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769805182; x=1770409982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpmnObuFW1DC4WhAstZmhE6ejRlTpM58/h9Bjy+SR2A=;
        b=guqu3qPPaJ7qH68t+btOn60Jol7WzixQPMITuqZ6Xssju82pM+COf9dDfjWmm/Kmwh
         +9oWo+Q5PNOU8w6Adqgf1ONIew6Pii+9e4+NVCfDFU6ISqX2zN13kDZyfRThps12tzl5
         qyjYEL1u1peht9A0uXLOvV1y0OS5cq2e+8bC0Ao0L/+gZqx+V7oI814tQiy8l1kLKuH9
         rGeP0Zbh2dtUXVhuH8MWw65BRGZvZZtzPvKcxS77kmWkk2Em4+R29F32HJsY1X8ZqxIn
         HaWzANuhUdTGokC96dZrUFeFw7yKfsPhbwUrB0qEtABLbdcQzkPddlod5jzpmDn6z/xv
         QLQw==
X-Forwarded-Encrypted: i=1; AJvYcCWInklWQAuWpL1huQH2P5AYxpUhgNxTtkebOfRX/Mmy7HGcrHOr20MYmGa9sJnCkKfsv4fJgmbjihjHAHVbHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIBp0C30g0FnmspzegDIMnJ1JQpxYnuxD/1tCHbj9vo4taGQqq
	6YfHejSsfjEcfmZZX8whUgl1ooZMx5zHvmNWIeAouzGwjcQzQomoUYD+jd3lI86EpdqPw5lddTU
	xIHTKcuh74/yJOtZ3yCJmkIldNB8eXeI=
X-Gm-Gg: AZuq6aJ5Qvz25FzAMMIijDr13m2oH87o55pNJgLpUgxAHjlaaUZOZzeOurBQG7es+pw
	mr/ZGqvyxgzH8lNyJ6vpDGzY1nmXf+xMQBzzJYawyZL1aR+vVV4f3iX2iT0fmtDSZ9UgNz7pQ2K
	cPQNec0BaCUA9hGKyM/BNJz4tbOV5/8iSkTggGMZ6ekH2favDnxk+v0SSanQgWje+tDju5KzbxC
	IoESnrIinYKST4xHXCCbgO1ADlqQQmkoqm7FPI0oDjHA5pTrzFgGhhJ4N0dPvTdaN6HZVQbN5wC
	z1zO5Z0qfYY1nQM0Rp97LEV+oruuupI2KuQHoG08i0+z0MANO5SAXWehhkKSi8gkz6i4eIk//HK
	1rjoZfsnOlmTg
X-Received: by 2002:a05:7301:1293:b0:2b7:20bb:8c23 with SMTP id
 5a478bee46e88-2b7c8907a54mr1129864eec.8.1769805182177; Fri, 30 Jan 2026
 12:33:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
 <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com>
 <CANiq72k=WkiuKCQoOQFewbCcKATm7KZMV4jYBFmSSFryNKEAhQ@mail.gmail.com> <CAJ-ks9m7A1GcSbcUJ4AF2NjQvC2k5TgJBCPbBJA68dJUxZP=cQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9m7A1GcSbcUJ4AF2NjQvC2k5TgJBCPbBJA68dJUxZP=cQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 21:32:48 +0100
X-Gm-Features: AZwV_Qi-i5t4di7Qe6jHzEz6lcqAWZapwHU3evVYF36j1rT8MURSClExP08HtT0
Message-ID: <CANiq72kxZVg+iHbnG03GACYtXdPPZNy4yf2ssD5r+wTygzyhsA@mail.gmail.com>
Subject: Re: [PATCH 0/4] scripts: generate_rust_analyzer.py: tidy and add type hints
To: Tamir Duberstein <tamird@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 9:24=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Sure, will plan on it. I've updated the branch to start with a tag.
> Because _this_ series is so invasive, I wanted to get it applied
> sooner rather than later to unblock Jesung and Eliot.

Thanks (I saw you then reset it to the tag itself, which is what I meant, y=
eah).

Sometimes maintainers have "private" (as in outside linux-next) for
testing, collaboration, etc., but that can be done outside linux-next.

(We can create such a branch in the same repository if you feel you
need it, e.g. rust-analyzer-dev or -testing or similar.)

Cheers,
Miguel
