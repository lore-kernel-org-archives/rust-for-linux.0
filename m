Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF733F38E
	for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 06:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780209931; cv=pass; b=PTdmZff5i+JFk+HdLYcSopNphHmc84fVSPX+xNmZ0m2yQ3eh6cCpuim6JVHnhaY0kDkuANMAuQA2YSoJPzhtxkXTSxx1CaBTx7zFppGB1uTAoPnq7zfCrsIQdIskfnWb5YIAI09l5Snx2g2vVOpGv4/AJqRb6IIEwYMCycb44Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780209931; c=relaxed/simple;
	bh=l0S8477QSvG3Dyip1hUSjiO6JEar45YczihYrhVWLWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhyob9ICeixiXuSwBDZsCFkV9uI3XOsMYLYVIqcae18OQBZ4AsqM+Oh4JOo294wHTxEZQipB7QoJAxZ+4xxCSdcxs4hMe9DMIHhIUkVDuijw2jQ9ERGN7MZiVJYd/Pok47NLw7sV5NaWeCOe2lfvNW+pYHcrYAekSJQDazTiKNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOmtiiR5; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOmtiiR5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304e86ecebfso271940eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 23:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780209928; cv=none;
        d=google.com; s=arc-20240605;
        b=FpqKrZOdyGM9hmJtH2NRp3IUCiBsFNJuhzDWREu+P5FnSyJDCtlYhOrEm1McHl38OV
         ML4bGA5pJu4938k2QFqjeA8fTzVaER8NZD5t/my7Q6TvekN4JkJdEYMFd73TtZTTjEpr
         4aCiJL3iIwBTkUKvP91bzowdpZrnHPjaxI4ctVGOIE+kfPewpQX4CvGQvibpyECG30pO
         ADkWB42TFypLSEQGw2mXvzHJG0LVMbkAUNdI5O+Qg64UplYvbRmFFiBHN+YiiZwd2QIf
         utIAbpEHUbvUo6pIvWujYd3KD/wOGUK45G7Z5VIDDEpdpKu2s6EbHmYOmC8RmQ1Jc/j7
         TNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0S8477QSvG3Dyip1hUSjiO6JEar45YczihYrhVWLWs=;
        fh=y0P9DQqs2yfhDJePXxiybpN1Ml9MMbDq/l66lcD1SEk=;
        b=jLLEntXdkfsudbIX/t33nLQwxoMKAtQztQa3as6njhWJEGvvyhaPxWkTCzH6MosWrM
         x/yMGaa/DD+Qen0o5DWczsc5IeCmAsoqVXDb1zkmwdshooQc1eblO5s+ZDUaqC6FL8OG
         nQANkrd9YeZTnP4wHhrXn6f07USQ310wl7q2E98pIcAXlOsnqPqXSsX2tr8GfFbaNX18
         qDDqitVetchmY46alTDRXvF/sb/R2om45Ya6zX9maRzaEJH2AFG5Ub36qZScviFqILD7
         DKEX2m7AcoaCQ589wYYOjxBbdnYrgGiofrptJyiU6HBanX4GIULvxKyTg7ps72lXiS2j
         u9ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780209928; x=1780814728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0S8477QSvG3Dyip1hUSjiO6JEar45YczihYrhVWLWs=;
        b=pOmtiiR5Nuvz848QajAdLhYJ9KKaJ0ucJJ8fcdEOT+oxgPdxXlVD+fJYgrzM7+mhqa
         kw/pKirVh3qM8m1ZQQMJG/CHU7toZbTXcCX+7k6HCEABuzeH+JhSOOns6aBHbOmuyM1a
         hK1Eq3xI8zdbdafHAFB+6dqIxswtjCG1HQNI9QkK9sIPF3UCQSR4EP0fGbaZjsgA5oY9
         b8DbugwpANHKKjECvRMxbaTIiSa71ADgJp5NsWf4ZZTWsBe+zJ152vrPOZW7RIM/+6hV
         3nvyKA+1PJOxJO61oFVbhPIkFDQl6D8uaq5Y3AAddOpxDcxgq/LqUvsNxgiwA7LqjsRC
         abxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780209928; x=1780814728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0S8477QSvG3Dyip1hUSjiO6JEar45YczihYrhVWLWs=;
        b=WDdgvWvjGlJEAd/1lgqRE8DFYngy69kzhzrQEeVGLLYV8M3Ezyq2DA2jC1obOof13D
         Gb/WYpvA/aicqdUpbGDBw2u+yy8PdUZyqZHR6x4t0jyDZJzKr3NePrPAu94G4HJilYBY
         gtgzv2J+0GaXBpsjGbj7fVpwRuI0x2B6zjMVktXLWWhdyX1h3IVN+Lhh2khQ10aPYAtM
         IMu/aS2lRBqFcMRICqZy8CKrNCdxcpMrc1jSopumNTSShG/wT/uzXQ5n+if0wdSiBSia
         UOpEF5O1fT9r/AGecf5bDpXlxUtc5dDvcH3XD5cR0j+ggAeBL2F+dHERXET+A/AEdQ0N
         IlXA==
X-Forwarded-Encrypted: i=1; AFNElJ/eHJQvwaI40njHE9TzI1USP4AbcQ1KQh7LE45GkM+zZMzPs1cn0rEHeEfWMLZyquijnDcm+uIeQ55246yhIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00p9H/BINH0ZNP9hdIub6sT82gGFhWyMWobsDEEEtzr0B/47N
	6ep+Ctar5mAx+chktMSI7BPpgvVtSfNVUcp5xzixKyadC8i2WPIiuGGT7wzEyXKKzJB22IkKrTV
	9L3gMQYN5/lxm3WXmd4TXowU7cDBg9gk=
X-Gm-Gg: Acq92OE03MUl4mIW2Huq7PglaQNqcV6+dccFkibl/rWfYhuzINkvtSGxpblKQ4IqTPO
	u3Se8jBnpul4Jbv2PfUCWdaEEKBz1tVHZRbOu9MmDYrgc1V7eogLSotss4WNBoQ1IJ9d/26Ag37
	kFxRLDDolr0LpmM6rqcHtZUhx0L0YPaYoNfuCkY3x8CZOLZhJ5y1L6dlvYt2ALYz8v+f2mHgqov
	ClVcXmvbnhtN7n3Jg1ZycfeLYczD/CDn5qbPlkmq6MtyNYmgOf98wVPiQwTfz1aKeZYaAP6Xzz2
	w7Z8vV4it/ulAMVgDVjdE8yhXpL1OPiEbq45iSoPeuJH94zGpetRhRJAUYY+Pyn8g/26AEdvEgC
	VQSoIuOOOJ1SwR6tN1ifoUOkH8Pk3c3yQ9w==
X-Received: by 2002:a05:7301:6785:b0:304:c73b:79fd with SMTP id
 5a478bee46e88-304fa68f723mr1482767eec.5.1780209927997; Sat, 30 May 2026
 23:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530184944.10459-1-contact@jkam.dev>
In-Reply-To: <20260530184944.10459-1-contact@jkam.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 31 May 2026 08:45:15 +0200
X-Gm-Features: AVHnY4L8pDtXPdbKNrUQfpBv_HjLynBdwLkgy_JeIYUFSH2IkQeNYPWqY7tCCRc
Message-ID: <CANiq72=huc=AfjBRYUsoJY1hSvB8W6CvnUh7g2G4rt98XYmxYw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
To: Joel Kamminga <contact@jkam.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 8:51=E2=80=AFPM Joel Kamminga <contact@jkam.dev> wr=
ote:
>
> This cleans up files generated by rustc compiler in the case of an
> error containing an excessively long type name that doesn't fit in
> a single line. Such types appear relatively frequently so the risk
> of generating these files certainly exists. These files are purely
> compiler artifacts and are not created intentionally by the build
> system. They should be added to the `clean` target to stop from
> cluttering up the source tree.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1236
> Signed-off-by: Joel Kamminga <contact@jkam.dev>
> ---

In general, please add a changelog after the `---` line. Otherwise,
reviewers need to manually inspect the patch to see what has changed,
if anything.

For instance, I see you changed the title, but the commit message
seems identical. Was there a reason to not change it?

Thanks!

Cheers,
Miguel
