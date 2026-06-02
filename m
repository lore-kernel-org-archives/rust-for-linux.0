Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95663E9F76
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413133; cv=pass; b=pdkIE/FNp7qpOBGvufNHpsDx5KWsErp9sSE1ph36dGXF9/DQhKmViruKGsm+LM3Rmu9m2btf/pr0W8N/kMGxDu07xKfURJKVCkQIVOUmwTtjNfWjljZ5OIXjdgn8GB9upxFHoY+DbzY4M5T9/kmEYVLBCkr6xGh59wFkcXZ/Crc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413133; c=relaxed/simple;
	bh=uFPYloQT7XT6IfJNhJ/SAmsfhwQb5BmEaHuYH5X2XhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLZEhlA2+LCIBAg7WDSLlhywdF/gA2dKXOCL9hJIbmuosylV8B7EON2ClBUveTYpvelybE3orz0pn7eAPT5leL5sNf63x52oqRLRLuZLn5RGvjJ/Rd5XFDL0telDWH2vHwygl43XFxSikjtcGzPX/0wKRXvnMDWBD7KFpcAlJZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPTUKWy3; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPTUKWy3"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so442161eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 08:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780413130; cv=none;
        d=google.com; s=arc-20240605;
        b=BXmWsIhSsiqocdIl6Bm9EEPktldrWeCaYl7J2J01f1Mr8zIvEqUpQ9/ozNMKWC6vXG
         +IuJxDpm5W/bMVjUzBWQi578CMbPJERN0OidGKMeqJvlon9pUEJVideo/H3FyibqCB8G
         120K9AwgJD18GIgo2r0+3yjLuejaZmu+R4m1d2Sh0VIK9yA2FfCRt6+FlFQVFPfS+HFL
         egfgX4yO9LVuSXuusX3pTOD0cPGCk9lr1eZ62Fi1HEpUA6Nt9LUdm/sK51KUXbyHmJRb
         AnL1+5sa8CoGQtHNK3k2ZmmSoN7Lu/xhw8BryD+sgR/XFdhezubcjH7FATK2jbFyRf7f
         i/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YiJYeG2fCLjzF65IFEg2pHH+5NjWfuJTGzHlNysR1+U=;
        fh=Mspk9MyTQ/ioyC2YOURmWUQxP3O81We8oZO3eRCPr8I=;
        b=GkpYO8qpXpWBA1b+MT+5zqZ3xVhiYdX5KVoD9Ja8fEvwd8y3lpt7udTF9xjDXq8DbZ
         IdLYLdZcGaM8hptwU/KLuakGgDccvBDmWOmtejVSDMVnSUJAUFc2cjznoRD5ZmNlgDB9
         Q4NgUnc1xOZOI1qianq7rkPC9k6a83aZbXEEKhZVUVB2SRJhbb/1LP4VZdAkkG29hnqW
         7AEuQF7TzUl59Uy8wH+afsQmCJmeWFPzSY5XJHKXXFPBmtqjPCubX+GAW8Xn1oZCgL7Z
         /eoagwOA5SVPiXTSAyqhyxO6scruJvNIhjKn54cYDfi5kqFHqdCRQyFZfhM92sNQSPUT
         6N1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780413130; x=1781017930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiJYeG2fCLjzF65IFEg2pHH+5NjWfuJTGzHlNysR1+U=;
        b=BPTUKWy3oKEljJFweT4sXiVa5VpOeXCztzpDykXqQ/CoKKjEiJkLTBn9KLNPPJxUNI
         k621brU3PvHS++P7+qk7yJfhdW69iqOHeF8F49UrMvTIhA+OPjIc98YU5ZxXkQeKiXrD
         FuEykK3sYNMVBTOwatIkyaxznyS/4B7N5foU00kmKhsnOY/cmmTNwpYkuBVsZEbb2KKO
         AZJmPz3rwcrK0liZjLYsWCl83nysi8+mu6dv8ayxQrDmoZRUq0oU4lEg6d4BgJ4KhX4e
         H98KYy4eDQfMkzwpUTuj6clKJ96cQUrAgl4+c7vvSejZCjZvKen1tJP/fw7IS3ZSchSz
         bIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413130; x=1781017930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YiJYeG2fCLjzF65IFEg2pHH+5NjWfuJTGzHlNysR1+U=;
        b=P7HMGoS88/h3RY4u1B21ZsoyGrOA00PieEpowv62OVCEOpbUdLa9pB0oCDbvL0ehtQ
         B0L0+l6sQGxLuPc1xSbLgxMrh93QA5pp2WSqXBsG0hKYlkG713FVBSaEK6eoIq+0dIln
         tZ7TkFbLZL733bQ+hIy8WIFy69mgaVavLPGwv0YnIxp12OCuC11CtRRePax/eiwoH5BA
         5GYNLe/uh3zB8KGs3VaaVDxzf+05RsTuQrrJ5YRX0GUuyGBzAw13UmKFBNztAZShL7Kt
         QYqAv7ZFAeZOie6fR6H2dQ3aZa4668vWgZV5asL/g/0lc8hGA91Xvvlo2qJAbUseaaQm
         akvA==
X-Forwarded-Encrypted: i=1; AFNElJ+UD14doIAuiCkdN26df5m/EJRh4B8R/u3yhCPRfbI7BHJC773vP7+CCTKnVBBzVlBZZbzo4KS7g7dIbqrqog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhAQ9rJ7AnjHA/hhQ4/m8uP+lM/QZhkeKddhSmykBMINeeLlbc
	ZOiz7ZgLacTyvlZmcIZ/BQZuuMUv/AScU0WEZkIul/eWVh8yL2z72yJXYatiIY9S1uxScUEPhUn
	Na+uxMsW3mw68krTfUYTdpgITuibg8Qs=
X-Gm-Gg: Acq92OHUKmmR0UyVCRCZ89ITND95LqJenMAUXMbNLhtndu6h0PxPrvIyt/s3PKUxCSI
	Ld89yH5XSmr1NOUPT8sSHclxSJYZ6jGDvLrO6jnOCl9H7Dicc+STdPbPhXWupG+PQtCUgwNPvZi
	XmuD3D4JBEg2jwshf99P4NSUob42ciyBECZZtI08cCkxrBx1Q/MkHaC5Gxe4k4NUxvtAeoDf0j1
	ietNIFQok2yIv1RtHzGrI58+rxWnlJAhA66zUTymm9Wy7TaLu/uEqHZppQnNjqQdfRQLpuPhxyo
	r67TpRtNagNHUqERnVWHZgqBNuSpgHM040KNxE1q19jwAhmDRQwsgDc9jpH21r4ExWH9bCzLMTV
	PbFol2gZhVNsSPdQ/gbJneWu9Siaxgpd4uw==
X-Received: by 2002:a05:693c:300c:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-304fa4a49b8mr3613659eec.2.1780413129636; Tue, 02 Jun 2026
 08:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602143002.38390-1-laniel_francis@privacyrequired.com>
In-Reply-To: <20260602143002.38390-1-laniel_francis@privacyrequired.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 17:11:57 +0200
X-Gm-Features: AVHnY4LFoVeXSriFdB4h3MAWgoxx4YQ8iyP8wPhbEtGQ9gefjQQAfyS_0pWNPPs
Message-ID: <CANiq72n+tyDcabpwZOR1gHb4mycbpTQbzr0QNgi9c48cSnrZ8w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: pwm: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Francis Laniel <laniel_francis@privacyrequired.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 4:30=E2=80=AFPM Francis Laniel
<laniel_francis@privacyrequired.com> wrote:
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Francis Laniel <laniel_francis@privacyrequired.com>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Michal Wilczynski <m.wilczynski@samsung.com>

I would suggest this ordering:

    Suggested-by: Benno Lossin <lossin@kernel.org>
    Link: https://github.com/Rust-for-Linux/linux/issues/1189
    Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
    Acked-by: Michal Wilczynski <m.wilczynski@samsung.com>
    Signed-off-by: Francis Laniel <laniel_francis@privacyrequired.com>

I guess this will go through PWM; otherwise, please let me know.

Thanks for the patch!

Cheers,
Miguel
