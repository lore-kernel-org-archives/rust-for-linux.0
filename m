Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF674335081
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360009; cv=pass; b=Bcv573bTKA2yPdF/WJI5vBa7ffjhYraW4ShNx8/0HSMtVO+Dvkx52vegsztkZVwbfEcHnxJtvBJoD52MBqAJQJtZwb1LqQKP2+oAU5qrsYbNl1FEVhnRZPpW2FQj2UScmafJH1+aIuXcWai5viyR+VyHxrZPA5KjOeKAMupTx8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360009; c=relaxed/simple;
	bh=75C/JukTvKdnXwRgWlbYQi4lAka/pdpoSGb1wX+7VBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8/8fQ51qiR5vusaSikP5u8e9ZESRX8iLpZmo7L5ax5W6ef5SpVjKuMChpyT7l0k/0C1U0u2kZdie+EVoOva81KiiF/17OzdCXwz6zwijQy8Cua7MTzHxnhkG6vf2r5eeIbipCYyehXvPF375T4BcE3zaZ8X1FHoblt/BRFirbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4CvyYGd; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4CvyYGd"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b8095668ebso154235eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 02:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772360007; cv=none;
        d=google.com; s=arc-20240605;
        b=GZ8QW6gN1KjesAysSl9GFx6YmSyqfDVUc6NNYx+yJKQqVGLX7uDZ5xH1Wqx85r3qAy
         QDTjgti8T0R5uYp0sv/a1y9z8lYqdOzow1PJyPfWki+ZmyVzWoNDaBMMAkSjkyf5YyRt
         y7cKI35Sre667p0sTvm8o17vyTNlWAsNggn4xsWNdzzdp8aZXJMc+Me/c76L15BvefwV
         yTmYswNOBIb+BfD6VKYIluG+lwZznjgnjyKu/ScIlE6kxJ422seo7cw6dCJLEQ6tVLyG
         n47mIgPXOWl5udClvRDBLH24nIj0CILTBr9hG6w6FuqetckpJK10+2/NIDbrcyIN4ouF
         Eh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75C/JukTvKdnXwRgWlbYQi4lAka/pdpoSGb1wX+7VBI=;
        fh=3XHU/W6JhWL4FAqb29i6aURymvdZTMslTtANP/7Z+FY=;
        b=eQy0qbd9YGebiTFEauKzjqHH0NCC3OZN6LAewfI9P1XSrxkNdGIaRmSS6GNUtNOUdJ
         IrQk4vaCjWwrAK0K9J1k4i8K+RP3qBgmU/3q95rfVSeOgk+VtLh+k39n7kdgrj70PmCp
         9my0ichXLBEixBPthLQprS58q+WYiV9dSNqjHgva9G1IFCOTLkQ73gpDv1LbF5cXvYrq
         B2he0o1dngeufeDYDiJBP9Sr6/dFKfp3gRu5JK8XVt4S5aPC4dAQ2U8CFkK9u7Qi58cb
         gVYm1LRlbvNq21HFdb88ltkAlYLlvIJicYArjKJhOCv0vOjb1Z1JnQPtuwX19rRT1Ezz
         fREw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772360007; x=1772964807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75C/JukTvKdnXwRgWlbYQi4lAka/pdpoSGb1wX+7VBI=;
        b=b4CvyYGdoTB/HA6JgVYkwBhfhKvD9AqB9poXcAbabtbjVTcg4GDQmRDlXQgWxmcVxY
         7JM6ZVXAMcoCxgXPXE3bs7GhvkxCGnXMslG8TInGnNUXdRQMZh9LpOwYLulM6a16flhq
         ki0O1PtxyI3jNRq1v+GLk5gu/Skxf5NT7qF1GbCyWTPWlKd7OKtyhSmynm7b4AtMz8UF
         IRy/Xe69OjmfR1OH2nelCLJHS3kuC9Q/g9VViLfCqN5pABe+dlE+N69F1YLxoHiO6pmk
         VmNnH0pzkHzeV3G3h0JcecVM3oERmmBoud2Lhk0uFEiy2Tx/1iXgbRIna1UnIzNP6b3z
         JyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360007; x=1772964807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75C/JukTvKdnXwRgWlbYQi4lAka/pdpoSGb1wX+7VBI=;
        b=hyJw48syhAYGfKm/Jc+AcNViGw2/yuFWLeWK+Z7wucHrlGcrwuUnGoRX7GnzsnmJyt
         fSSqPijL2LvgT9zxEH6RlTCFlhz69qVcXgsebXEjobq6RcpdBbE6+H37H6+gkAKKBr59
         fMOP9LnDM7Iq0j9lBeBCo/ocEYDNZ2lyUshX9lHA95SAspipKpsMETiGQg2NjVoU0w7S
         UP5kk/m7zzJYDp4PFfiriokXC2L89+3Dsc1bFJV5CbpU/LTIVoq+y4dj1NkslFhvssCq
         lnn739JjdmX1iHhes5ymkt4pem4ne5xCk/euFqREHT9JROICENCMEKz7E5+eCjcBlcYt
         O2lg==
X-Forwarded-Encrypted: i=1; AJvYcCW4csRm4N3SMGaF5JUJx99kjB0dqDMMYQOuUqtW5lZw4ohiL06V2CZaKwHI3A36+7+n8420QQulr8non4jtpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzbJsM5OwzBHcnyeqRxGMtnkgkAOvK0uW4nCJkF8EPtsyJuZ4U
	kzwjY54KOn3H7NwA9vvhBhCLS+FisJAM5ZZIH190uW/s9eLKg+1Ln8X0Rugnm2X5v22Y49w13Gk
	a1aoS9475hWA3GaijZr8LlkLoMriNhuw=
X-Gm-Gg: ATEYQzx4IKnHnU8cstCPAM42WhSn7lEevdO7i/ITKJADNVKL60kCy9iskxJrXrpU6PY
	xMfebwoImYq/hQls66hI82puRtu+JqWu91iMcN3bM4lgz2Bjc5G024eepT18rH5zIEM/OsBKxgw
	HoRnsdalxvt3PPZ2JYOy60KiyAud/ReeJGnm+4/YMn/QW+NfWAMnfsTMzDaHajH1LS/cF/RUsWH
	dn/zhSKbihREDSnUWgyGCVNGd/Y8jBUKbk1vnpm8glpEPH1fgtMfXZFEL2QClM82zhaabeFrv82
	U+IyzIeajz9WkPTyewpWdDBo9iayqgeC0gJThKDIidhagmsrk46nWvsztOeQgTJYliIuENeNdt7
	2p/n1b/XbMsOYyKi2JjPEF0iOwntC
X-Received: by 2002:a05:7300:724c:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2bde1e90dd9mr1533864eec.7.1772360007089; Sun, 01 Mar 2026
 02:13:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301020545.1734572-1-sashal@kernel.org>
In-Reply-To: <20260301020545.1734572-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 11:13:14 +0100
X-Gm-Features: AaiRm50nMriLVyJIwduMFuyQbOs4IpGjFLyo6U0eJZtJzgEz1pwnRPv8P0IIuaw
Message-ID: <CANiq72n-kFuv7QQ3FV9cwSrX+Vbmsf6R2A-AeUNr9wsMcUqyPA@mail.gmail.com>
Subject: Re: FAILED: Patch "rust: pin-init: replace clippy `expect` with
 `allow`" failed to apply to 5.10-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, lossin@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 3:05=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 5.10-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

There is no Rust in 5.10.y, so this is fine:

> Cc: stable@vger.kernel.org # Needed in 6.18.y and later.

Cheers,
Miguel
