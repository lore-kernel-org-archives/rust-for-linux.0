Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E890C3A4AB6
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938592; cv=pass; b=e/ULFajN8hCMADz46YzmZ4INVjvul2bxjeyDQZbLLzvbpRyEt8y3vOP1j3bRXWUlkVdISMpvh4JFljlmnquy82DjDCXUu5RTqYjZJaw9QfUH7VNAGRnZYp2OM+dO5L0EKzFmA9kNotg6Y5t5OIkTcsg/pd0qNvPVF4eT9iIN3KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938592; c=relaxed/simple;
	bh=S9fl59k5puWt33JzR4GT4lL/HsZOZFVj400kW+fxybU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCq7Ze9sMcl5WDPe1Z66kwq+J35RRi/Z76L+OhIxJj0Ct408I8jrjfyKKW6Pl9G3lj6+wn+d+Ofclj57xsEyPuPyrMaHyvhws+SIJYFo/JE1fHaQFFLT9Sw/e16iLZ2HyIdA3J2PP8dFbblD7bKdFBpCumuwL1F6kB/EtaUuWUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4cpHcSo; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4cpHcSo"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1232c98f98cso412643c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 11:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768938590; cv=none;
        d=google.com; s=arc-20240605;
        b=QQ3Idh4QRiwXQ1ePRjECwLYbjjLWYUQFDPSXG0Ixo43xtoi9ZboAn2FMZLP+UMqZQX
         8slLc+ZyI/9/UIhsxKdUSiAg6Oizg3MmdPlkoLq/W9u5WnpYLJbcpuXV+66hREW+Ig0s
         izJY2+KtHVsZ6labmPLIy34y9Lhqv3PgYqoH3+l9S/yvshq5v4FrAoP+DHVmhZnw7FSQ
         2iAFV9eSJgrKbXauCBX4mrpHcFoM+AXAj/pqj68f/kb262/X7iTnu2hxWTzK3zTaILLh
         BlEihm6XyEGbWFBU8ymQRngzV/fF73gM0N7gNNlJahJx+uQOjqwhyiyUCexHh6btv7z6
         W8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=blap3a3dHjESYY1Y1zms2pDZWMkQH8ZZXSdy8ZC5AK4=;
        fh=W68lAMp98JdC5Ifcc8ig3wMnp3WtiAeeGbkT1ZM1p3s=;
        b=V16JODOuEky8C4u97L9aDBzb1qqv698h4bqc+F/dBCW0JkuNT25hRSFYB5Ds0ypV7u
         EitNkTyguBi8uLzstZcG8rQuMImF2F/mk3egT3qwuQM4ABR7vG4zy1ejqWoB8Ie5/stF
         2qZVAzlof5dCYnV3K6LZHTsO1C3LF+gAlgsXQDOwGwmE3hFLr3qiv3AKgSzhy9RgFYOK
         RG6pzVwMgMgI4rNzh8FToh3sJ9bktc5NgkUvgQMJIPCiSwd7HaX02CDhz6YsZtsF6gtg
         wS52Mqco414PbJ8ShIybPjIRRkbjTm7MPP/QpUX3cpi+1dUNpwmnN13/tpfdW9uUnFOE
         P1wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938590; x=1769543390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blap3a3dHjESYY1Y1zms2pDZWMkQH8ZZXSdy8ZC5AK4=;
        b=d4cpHcSo0uLQPlXFH2FNVaMctqvrs5E+UrZccm8S6pSf/ZQqPZYE0GeGnNCC2o/0Kz
         i8gHj0hN1Zna+F1N9X5N/2nzbUuH+9NPMri95ShuZy7eKBpaMsuiWZxPYQFy0+M7+Vdh
         1RHfRlEGbcjuPkUUvSjRybawrC7kMWZjpYVVGqTwVMqY3CAz+Qu9ll8/NMTOEZz5Mzix
         mKRFWLxVUUpNzxDZTrsXHFpsXeYsZn6MZarvdLlTsQ61YaBQSA0GFHFIxRCStcmBexxr
         pcTtd5/uCqghVJodQ/ZzsFlL+3B/4vNjY4U2P79FxtbJN3kogMdbwmcKLBibZ8d+aw63
         T7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938590; x=1769543390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blap3a3dHjESYY1Y1zms2pDZWMkQH8ZZXSdy8ZC5AK4=;
        b=gEuQOyr6Vybpr/gYqAd0+dAPamYw7CRmYYVY0ecC/smvzNO4zpl2IMqV2SyayJCnlh
         M4ywZkdpL7pDR7/dO/Ijy6SaS2cdqM3zhKAOj/y/Jq+vhMu4kAJ2uTFYP37vP2pN0a4z
         VPzdpMN8i9tcFkpMH1+PAiChw8NdwsB0mL5RcMN+7jKRH07ANqKHoTk8WCTzmdI7nmTm
         z080JrWbYiGuJl6t+T1hFAMV/MJ+DOJM65xFAP6S7Rqly4ZbjOMbsAy8lG0IaEhdLzEm
         3Hoxth9tIEarIMJOfTQuT2ScHJ3GF3AD4DNfSHNX2r9RSR1X0UFtY86SO4UKlOJF3UZZ
         hOGw==
X-Gm-Message-State: AOJu0YzvCCSOS8i7JYewzl18NJ8zBDdGlQ1UaxNpRmzqUBOuFF/IdDbK
	IaNCy5qSxjxNj+bABV4WZH6/46C/giLjRVTte3Xea7zynGpKE8EoQZl5qvWJog8OTdBI9X8T2O3
	/1A9C51s11P/Grrd8v9HE9MIjrGPJAao=
X-Gm-Gg: AZuq6aJMv6AkIrRQGh/Cb04jOk/swXT8Va5ZFRLrHtT1SNOMTGUgDErsPcy/Rb3TmY4
	DpjGuFUM33IYn8W6yli8cZKh+Nt06+39TjaEzMHIQtRZSMLHs+4cR4fMuWBJd/50c1i3kR/YjMD
	K0zgUBNrhjSMqtHN6LPZ3WaJkzE5uJ66VsFS/+egHvlNdU9PoOI3+p+yoqNeBeh8K5SWq0v3bN2
	+3Ov/jMXyurQORfPfqsjYR4U+hc0xuW9yq+nr6R2UhvMG8JtSRdw00CcgYlbsl/kIfqzI3+oRpe
	1zlpYg50OcTzl+Ic0MPd2uYLPkn9RjkICM49CxNYtKQ6OIilOrzUO3THMEtlcBx8UomIUA4BoHy
	+kHrWNasDgJRW
X-Received: by 2002:a05:7300:2308:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b6f70d3b32mr1569108eec.7.1768938589492; Tue, 20 Jan 2026
 11:49:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGk=Op9baRBH8_T1xZpa79TiteMEBHQJAqEM_E=5KHnsmZD8Mg@mail.gmail.com>
In-Reply-To: <CAGk=Op9baRBH8_T1xZpa79TiteMEBHQJAqEM_E=5KHnsmZD8Mg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 20:49:37 +0100
X-Gm-Features: AZwV_QiFMYd3zhavHQQ7ChTPDY1CzWdmIULl-8w13fkhrWjUeooxm9p88rqnChA
Message-ID: <CANiq72mxpYYL+q+PGCfu2nEsbD_7BjGMhz+Q7wXjNRgYXqhu2Q@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: add if_cfg! macro for config-based conditionals
To: Christopher Erleigh <christopher.erleigh@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 5:28=E2=80=AFPM Christopher Erleigh
<christopher.erleigh@gmail.com> wrote:
>
> From f0458e293b9fc50b39f1be5c604bb12c3c691704 Mon Sep 17 00:00:00 2001
> From: KaiserGranatapfel <christopher.erleigh@gmail.com>
> Date: Tue, 20 Jan 2026 17:09:59 +0100
> Subject: [PATCH] rust: macros: add if_cfg! macro for config-based conditi=
onals

I don't think this reached the mailing list, since it has HTML inside.

Also, these headers are not supposed to be here, but used for the actual em=
ail.

I would recommend using `git send-email` and/or `b4` for sending the
patch -- they make it easy. In particular, `b4` has a web submission
endpoint that can send them for you if e.g. Gmail gives you trouble
setting it up:

    https://b4.docs.kernel.org/en/latest/contributor/send.html

Cheers,
Miguel
