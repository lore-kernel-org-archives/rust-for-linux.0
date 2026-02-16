Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CB91A83F9
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 20:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273925; cv=pass; b=RyGGJ0cgIKp00zJ0m9+/zdV9DbHoFDOSM//L8Ck1Ck9OL2kCv4LHiiiZ6Zpg/bYuPDabt+v2hm1oXZMyuU/Nm9Wb4GxtKxpdjoymBNwNf+DYm+0W1Ghvr6tekjHgYPFZjg5G0upf20jgLBmMfdCmiki8mTbFg2/8/Toxplth04o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273925; c=relaxed/simple;
	bh=x0fiW+XBzqmaqcyM9ieC+zqAmcx37+qTvSD63tZUSnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0L9ZdMmF1MI6Tbs0tirGnZW9Gmh7qdy8LN8sUgpQManfeKIJXAQ+sMZz2qKXD5t5v3z3U2ptGltu/p71gzXaiGi576wT4ysPzE6V+kEDfHPOKKGtpvg3AR+rwwaJ6ErCVoZ4WwVVJ5QhcWpjozq2hZQsQDvHuHPryInWEzbcm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJVuHRrR; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJVuHRrR"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba4f9df1b4so244038eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 12:32:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771273923; cv=none;
        d=google.com; s=arc-20240605;
        b=WNQV/F+T+ii1RVMS5BvTenSHKa8xMu0vFMSbYz+uW6xLadGBgF4/rCGUvMnmnqtosR
         ZH/GsIZgdyMKDotHznB/4Jo8T1MbGvdf03mnjVkVi1oAOGQrpy9mEXqD/4NyDLbPT3Bw
         S+43QUtFWc3N+c0qamNuu8lCAYMR3P01wOECxnJeSSCLIib3Z0u/JUpku6qccV/b/Rl+
         zWhkfSIBkJHH9e9eQAFnlTSN2Cld363ABlDciqSE/AXfIxGIXhhIpImeKV3YWOqLQ5Tt
         ejhLfEagGEMswavym+618oUtaGW7PWVG69NqhfH+G691r30l9HCZDKN0Z6/uCFvbc2G0
         p6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iwEvth+31+GFwp135kkHneoBVMspZnrgkg5rJEPQ+eg=;
        fh=7LNVqtl0aUmmO0GvPfHRuNdWlwI1zwwf0mxak0zAY6k=;
        b=dAD8bb3jPErst45dJWM0G16E/fF0JMOlzdA+I3E0ivdnIljignWiQBQiz7cAdhRAAM
         5BnMEJDO5+xz1YpK3Wt5ey1A7QNI8W/BdYeS3Cv8Reaa+OgbAc21ph4V011UJ29hlsKF
         CVLwBAV7Td3en1YaDkKo6J7OJbKOUIcPCFlO2LddN/sQZ1KdkC0KUdMsELyeFQ07aFK8
         oRjCAxxui/CUoHDr7MnDeOSbvyCkS2xK6bPcMThZOJpINIStgbOgF1thu/sYR/ibZV2f
         f92nymgQgJ6IUopIJupUSZiL+ectk5uMt+vl8FBHBibFG2swcbwQIWss9lsfM5lFlOLm
         rJFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273923; x=1771878723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwEvth+31+GFwp135kkHneoBVMspZnrgkg5rJEPQ+eg=;
        b=IJVuHRrRKHtacCzH5CyoSuv4UhvWPH+imr6uUW1ARjI25KhjMPLZlNyyQAuF5x9nt2
         RJmXFqD/Kg6CgNBBp/JJMLvZf5Eal3kKFVmGp/siUwnmc0hp7zHuvG7SUNDJ/P7lBC4G
         UeuH11wBGv1l7+ngA0GFHVlrMVwGEzvk6yU06ndTQaCWuIz3pBIO7oYFIdRlWten8GFI
         OUdExUurrtYJhVo3Ot4c0MpaYb+L2j9KgIPi7FLLImuLy8JJYYc5EaMsEiG9VpLW5/Xc
         MV2dJ33ElBVgejaazwNvS48/oGgLXLq0B+0hTzJlOj16PHV9orMQ034GOpLQBZLbsl4O
         TnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273923; x=1771878723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwEvth+31+GFwp135kkHneoBVMspZnrgkg5rJEPQ+eg=;
        b=lrPbUp97gatfaREismp8xjlQ/nVrxoDSEyng+XfvweFA5qT0UwNlA3p4XC4cIwZAbL
         fA0JcgzhKL7BWnwa1rAN/S2PtJqKbyUdnD+9ekTRHrSiwlsXmSrozgMV1S/QMKWdr+MI
         6FjniuaN5WnULdvuyIDhS1/2nz7shMJ37an0edJw1nsnfaIPpBnbHRriCTVQVFDL8H8S
         UetcYLCY0y75czQPVyf4SDlYzlvw2p/+HPzjadVxeiNmIb4ZjJAMwt3AeyiA1ybgyM/Z
         YRfAt+WP9vn9lJdI2qriJQHMYLryWJaVBk3moHnxOKnl7+ivpLHdUijp1+hphPP208m0
         jgOQ==
X-Gm-Message-State: AOJu0YyBMVnqm6v4aSQjn0oLrORw39zO5+81oBycoK2XG6Fv09sJfJWE
	7jT5u3JDSvNs2+KwJPPKkBgfEDE25vv++JrP4xSCtOb0SCNQrNL3HGiQtxynJFCKb6B86he6OLF
	1uCHMce74AyNQEQamgy/0RKu36NG/blc=
X-Gm-Gg: AZuq6aIRoWBVGmX1Nl7ygm2+bOMGZTCOu3GFb5/3baBlKGdUNerU5DfTupaEm3PRvf4
	TUrtNMd4O9dF9GZLN7uAxpJbhjPE+3Q37MK9Ofd7JOp40q6uZkPFgOJfGdq9FpxsHwzEp2Gt/ey
	vk7feQ0hW3/Q537B1vx/OrVlaKDkDPkKLVH4Q4GLg5Z36f+B/vmgZAP+zkL1uDwFimPaTtyOL4J
	VDzNqwwUjxUH/10auWENo55ji8TTc0+ZhrMyRq9x8JReatw/ZWiHHZjE1/w5A2z3E+uaVjPRky5
	/FZaDAM1relwyB947zvMpkxluK1OpxWdX5XoNzlINJSvLoNSr3qMMMNU4KeFgkfXh0gDbpikwJq
	af9O94HA5XkbqgXb18xYipkPu
X-Received: by 2002:a05:7301:9f12:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2bab9fdaf9emr2775628eec.1.1771273923264; Mon, 16 Feb 2026
 12:32:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212125427.122362-1-alizainuimx@gmail.com> <20260213053123.8869-1-alizainuimx@gmail.com>
In-Reply-To: <20260213053123.8869-1-alizainuimx@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Feb 2026 21:31:50 +0100
X-Gm-Features: AaiRm52ylK7cxsThzRFLgWUPo8T_C5WKEy0_WNDzdQ8TbZba8nSNNoVoQjufF3A
Message-ID: <CANiq72nMZwRTLN1zU5MDFJ2hLsGD74ah+DYR8i=Lb0Ysb2-u4g@mail.gmail.com>
Subject: Re: [PATCH] rust: print: Document SAFETY invariants in
 rust_fmt_argument and call_printk
To: Ali Zain <alizainuimx@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 6:31=E2=80=AFAM Ali Zain <alizainuimx@gmail.com> wr=
ote:
>
> Replace remaining "SAFETY: TODO" comments with proper explanations.
>
> Document why the raw pointer cast to `fmt::Arguments` is valid
> and clarify the invariants required when calling `_printk`
> through FFI.
>
> This does not change behaviour.
>
> v2:
>   - Fix rustfmt formatting issue reported by 0-day CI.
>   - Remove extra blank line before unsafe block.
>
> Signed-off-by: Ali Zain <alizainuimx@gmail.com>

Since this is meant to be v2, please mark your patch as v2 using flags
like `git format-patch -v2`.

What is the base for this patch, by the way?

Also, you included the changelog within the commit message -- they
usually go after the first `---` line, so that it is not included.

There is also an unrelated change in `print.rs`.

I hope that helps.

Cheers,
Miguel
