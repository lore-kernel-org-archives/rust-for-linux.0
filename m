Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D8A32ED4B
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765905801; cv=none; b=M11x4BkdnVk/onD9q5gVwk5F0ShrhxZ9xQru8XOB0kSJX1l4AFkaBL8QDL2pFtCIgPHCyZbZ271t/ym7SntHB+ifEcobrGApe421z8qXM15ELSBdjpFHRpM8QLdcgc/pnpHV/OC66yQ3ocwebM8f8QWfh7nuSQ+Cx5tOAGQPqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765905801; c=relaxed/simple;
	bh=XXt6mnGqGRjbR2XWyOWXjnp7w6j/5peiZzZEWNdNprU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnTVO3y/Y8LrQX+bXoS1a9I3zQY5+pm8xLePOjZ5bhCxnvIXaovj1ivge0vzztXsLHYkaab06zaWyowyI14B+ogmdx4jckNdu+iitEhPkuGgkvpnJVjMTamm0Uy5LlKD+lbkY7o9fqB+7MM++zuwYVnllsbKAHLfTBDjFeMPYsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sz3zpf4I; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sz3zpf4I"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso58628285e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765905796; x=1766510596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXt6mnGqGRjbR2XWyOWXjnp7w6j/5peiZzZEWNdNprU=;
        b=Sz3zpf4IhEonprgd8ycjvntrwfGFR826rQcvynu0y+9+HHaYHQ2H5Nn1DgL7I04mpt
         KMSsEo9MmGPhesA1e2Dw088II7lZiJLl3YI3BOcBElk+ZIUDgmgNVlkUhLvqF9XYNDFx
         esMBmerdLPhpEvmx0MlVhJn0jMDViliRRqk3J4ZBeQo1I6FUNxOr0LNfdYu8KLpDK72c
         zjXgGPxhvZpv2BAX0bEQ8fHZg0H4I/nqD4O2u/SmFpUU9vrugq4zmcdgBqN/j/oNoQJg
         CvKvIVn9Z3ZySvSKqjP0uIgaG1rFQnc3a+ZiqS/uCKrZEH0RXO8BZJmK8Mj38K33NHtK
         xbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765905796; x=1766510596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XXt6mnGqGRjbR2XWyOWXjnp7w6j/5peiZzZEWNdNprU=;
        b=mFq4cUE2e+uLaZ2ZFp92+KouGfciFoHq8tlDN8CgE/sRYskqRZnFeHywmAh4IOa1ue
         //rAYnIcrawBwahZhI6lueslUoZlZCiq5Lf+gOnlB21T2r2V1UoHsKxMoma9mgbMjFJR
         8ivWaB+Q8B2HjFfqWrJpVzzcIlsa4zmyG6E+Jjc30k3N/dpfaX735IDKFSqcnq7ytU/E
         1kWW21E6L7lsLB0HtHLjfLk9eH0E+Ccc2ebCLEqqmA2krk8K1ybemSN0HLAyejaNTBO8
         ugTWsnAotBOo49mUP2KASM5GfienvGmbZWU2V6SVVVAxN8KsH9jsqrZTiXxkCsYHM8BA
         9PVw==
X-Gm-Message-State: AOJu0YyrY0/oLcqMpzRpYjPx2Wcb14U4GUkELFpr5Huq8vGob2OFjzxF
	r2MQtnz3CM9v8+7IsJHg4ksroeww/ZLy0WgVsgIOwdd6tcEKIKkQeTMDD4VtTK9mxKDlA34abZ6
	g//PesyAbyJRL/FNI5axr+JqwBIMFQQY=
X-Gm-Gg: AY/fxX78erW+Aus7M1HdLvSO3pm20T0Ikh5EGe3utZlKN3fsN0zsPHx6GllROpH7otK
	YGzRQy9+yoXIlST/zZKxSZEDU13JKvNqxAtsmYaZ3ZjbMrF8wTYziUmYGzt9dZggHH57mtnP/ua
	RKe0IwJtdNhasghjaqiTwvpXgPBYQhulinefBE+c6QUBC1w89oO9SOm7eOU43cizZdkTyeXTZ1Z
	a4KREDit3l+9MHrsG5SyZGMhJEMNWlWQi7UTcg1AaVJLhBblWjw3vsoMMaxp2l1cD4ilSB7z4EQ
	cQhCqtWhnZI=
X-Google-Smtp-Source: AGHT+IGzCwcecWiwfRim4rPrz8a6yuJzvwF5bXuJEDTL1Cb3Tknw6j8mnJEfx1PaGhAxy70ldq+bE3dk+w7C/y+p1iQ=
X-Received: by 2002:a05:600c:6994:b0:477:a54a:acba with SMTP id
 5b1f17b1804b1-47a8f904080mr140778135e9.17.1765905795586; Tue, 16 Dec 2025
 09:23:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO3QcbgU-wbyxgeYL87j6adrQP+-FhHXiXdsgKwvKGMzmzeVPA@mail.gmail.com>
In-Reply-To: <CAO3QcbgU-wbyxgeYL87j6adrQP+-FhHXiXdsgKwvKGMzmzeVPA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 16 Dec 2025 09:23:04 -0800
X-Gm-Features: AQt7F2qbpJ3Zz-cLA8rirNmIk0aU8h4OkmkZa11FgM1qDSAWinPZ8VpmzcccQ5k
Message-ID: <CAADnVQJ7Q46VEO9wgZoQvLfuDLtQ2-+bcHOQrJdRmm7=tBU-=A@mail.gmail.com>
Subject: Re: [RFC] Rust implementation of BPF verifier
To: cb m <mcb2720838051@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, ojeda@kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 9:22=E2=80=AFAM cb m <mcb2720838051@gmail.com> wrot=
e:
>
> Subject: [RFC] Rust implementation of BPF verifier
>
> Dear Rust for Linux and BPF maintainers,
>
> I hope this email finds you well. I am writing to respectfully submit
> an RFC for a Rust implementation of the BPF verifier, and I would be
> very grateful for your feedback and guidance.

Nack.
