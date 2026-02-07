Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F22882B4
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770501240; cv=pass; b=KV0cEs2+zbF2HrIRO5zvZJPGfzdTeyRMIKLRArmttN0l9DGls9TiRmtdt+e1SgnhywDU9Y91b+fnJL46pVA/rK7vy5k/PARGK8zC061QytOQ8XqMoo74weXPpt7Muy1U+HTfwpEq99lr/dFCjvIcDS3LBGkIn/VFpFBO527oAmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770501240; c=relaxed/simple;
	bh=1JxzIOI1m5ek/HwLnEcxMD/ptQXLiebVFZy+hyyU1RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJGd8YYKvycI+dLDm7oSy6ZCqudmU5Yd51JLQelOo6ipm986QDn5VXAc4is4XMzEmWMIh6pzt7ewDSk6NJNe/+SAlrrwfiVjmcJOqEBwEAOftJqYqMFO1LTMJKdff51Emb1RAGbJq4zjHXeNK/vBogL6jh9LYZXnyx3yYPMMDxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOt7kU/d; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOt7kU/d"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b866f98574so43677eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 13:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770501239; cv=none;
        d=google.com; s=arc-20240605;
        b=b49ska/RxNPkGdVyBtR9R4ThMBiKXbDRtkxsVZ1zq+Omi6r1kmdWt11QKsZDympR09
         1RQkoGdwQtpwN4cg06BjwtUgD63KI5isiuL65eiTb2F4+fYZtPU2yIdBzcXPEVZQWRVD
         X1T2sqmoidneLhBgnAEXmAvNSNc4vN4O5Wy41ItsQgBMgwLpUVlBDQzr+Lc2Vb2VKU3+
         5FbVMcATjqXkzjv4Fvedeg5oLuyKFG/Z7Tsvb8LU5eDWjruNSi0ZflHQKrzcTMZfMg1L
         MXhcveY4GMLXnq9D8BZwFu5q3cfjMgaP9w1NEEJoB9imujupQUezmjtrLIa1BRZ/0nFF
         q4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrd8gJoozlhPM+rOFXAmg9PYki2eeuNmptTtTWW5K+w=;
        fh=8lMRVYQcSPljoorbsvZ/oDfG8P/LHazV56GSFL9r29E=;
        b=La/0kbrUYez9yQCnFXORGFVqnNtgMqaS96oEq7i9JuloqYnqIP+KxNptOSxleFlMLr
         g14kot+J6soqk/cbAE+yyyPTR4lf3oooVIlyHQQrEYB/kx4PlwzEZ/str9jQPfPjYSxp
         0CO46qXyL5f+nalXvc4ZV8X3CuFaOy7Tngmwzv2gwj0NH79EqqZC5O3zy5HBa6jwC615
         O8xoIHd0inmebGy9CkxZxAV84EFDCbfcZKwtVC3qMiYCNoUB16bjb7AQVC1ALkpQCEen
         bwsO/a23H5wxt3QBvfqRKirOhcuSq28ZXTVDq7mfY29j27wwJcwVfix07OonWz+VqqN1
         UORA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770501239; x=1771106039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrd8gJoozlhPM+rOFXAmg9PYki2eeuNmptTtTWW5K+w=;
        b=hOt7kU/dPkRs7S1t0GD1L8L0z9V5VGiVBBpIGWsby23JzlMW7JuxK93vAJsDCD/OUm
         9goYPb+M6NnNQgZpDQ5p1bb7xUvoQ0EKagn9nleRrPZYveXWGc5117RwrKNdTvI4Vw1X
         J3oar5EJ+/EE8a9C+u3nG0hBNx2pUPD+Wq2B8gYrPSx/2EC5AgA90zWgijVU/t62oOvi
         3qm8GtxhVTfOKD61mMS9xwN7dT9pIFEoG2soMzDClt+eTOyK3mGY6MxCY2EsoCf0hdty
         +t0zEr0/ZupKlCufYdTiwGG4Rx+UnrWSZlZPXgGYzfKJQQ6dweNI1yE/fURkG/4fl/3H
         hJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770501239; x=1771106039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lrd8gJoozlhPM+rOFXAmg9PYki2eeuNmptTtTWW5K+w=;
        b=k3GMz1Qw6L/bHh37z98rISVGP2Eyfyxa8sPVObyIoEW+FgM924sx3dZq4pSfJj73Wa
         Xnuy6gDS01bm1gvQRSzOaaKxbowTlRxt9IS1c5OHMmOd8uYkGEwuILD3oAjZrhYXRFW8
         iRQMBRxm7vwn36A79hT8TwlQAYFW/uRWAEKHehLptsyweb3T1RikY3dMbNVcE+8Xml6D
         xPpJNoLRUo1zVBblpcN/xpCpPwIDRtmcnDsy0HvuPh31iNSmTRbDmRahMJjZJXss7c4F
         qnDM6PTNhzIoMEo3ybqTqjKylO/2Of9cn5VHUwn4ucqOrfYHwmtFoldXTDYy53R+Ieoz
         Gdug==
X-Forwarded-Encrypted: i=1; AJvYcCUev4p24L8TK6ZbFDekNoCD98kKBJ5NoGqbiml4uQioxnkZlem4Gh2y8uf8cweVldFas1URXxv5oH8qqoFfog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwejiXK2MDZFXYz2otQfnsOIqfYbIP00YEjgln7ARg3S5KVjqG3
	4T5+1Z1NoGCca243vlFgZFxQMmmEGgnVep9ax89hli7wk6HMnAPX5qC8wz+7MBlWngTazUMhGaj
	AZn8gAnpV2PF8sgnQ5aXbViMNJ58RJQ8=
X-Gm-Gg: AZuq6aLhLIxYWHi05IscQeFpuuc88+BhI+T0C/RIU886vy6XwkVBiNJX6V0PfIse+A3
	ZyB2mhmNgvdJ0AMTSb/2FI1jfwAbIiZrRhYvizT5natZwAO8gcSkP87Az54PHEjXMrYCBnYlzqc
	F7TeEyTbuoZHNihiHxVP63FoKtLCoe3ib9zTJm9qSPbaq7XQuLqsWEdyK2soMGsqEaGoJLgLvOS
	GHpNMnEqYYxIZ28QI7htk+he/Nyt7vJ/xL3yGX9fCFBedAOXmjiTbnx87X0jzXFvahPv7RN9qNp
	/kB5/27kVRIR6rqR4h8rH6518ZPSXh8JRhEEWQYmKFp2cZkneq/UbvTNOZjEvszCrQLCONbLzCM
	lbqTy05foZ2Mx
X-Received: by 2002:a05:7300:5794:b0:2ae:605b:d530 with SMTP id
 5a478bee46e88-2b856c56d5fmr1926820eec.6.1770501239202; Sat, 07 Feb 2026
 13:53:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kXaFkL34g0V3isOp39VqfN5Oaj9O_A0o1ipERFWhWi2w@mail.gmail.com>
 <20260207210805.196759-1-jason.kei.hall@gmail.com> <20260207210805.196759-2-jason.kei.hall@gmail.com>
In-Reply-To: <20260207210805.196759-2-jason.kei.hall@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Feb 2026 22:53:46 +0100
X-Gm-Features: AZwV_Qh8AuWps1WEnN0HececPR4guZvffLISXoOChVVg86Rl5Zr9ZPIzWRj029c
Message-ID: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] scripts: checkpatch: move Rust-specific lints to
 separate file
To: Jason Hall <jason.kei.hall@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakru@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 10:08=E2=80=AFPM Jason Hall <jason.kei.hall@gmail.co=
m> wrote:
>
> -M:     Boqun Feng <boqun.feng@gmail.com>
> +M:     Boqun Feng <boqun@kernel.org>

This is now a patch series, great!

But please review your patches before sending them -- this has a lot
of unrelated changes again.

I suspect you are copying files around, to re-create commits in
another base manually, instead of using `git` commands like `git
rebase`.

Cheers,
Miguel
