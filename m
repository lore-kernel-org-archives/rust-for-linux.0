Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E09E3F23A6
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975123; cv=pass; b=epO/L72VLyNtyJ+UHuPY3d8o5MzlFBU+LDd+sQjw2lJuXLLNZ5oha7h8533O0ZZmKZHkwBalDAdLN6HBpUUuEfP/I7ZVXIwLZd2Su8jxuRP1Eh8BCDFCA5C3E4U7GKybNJVk26vD9RbVgi0EAs4uPIhlPyBEydQD8Tu5kYFtRKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975123; c=relaxed/simple;
	bh=dXiRf+++A1EZ8faGHe+CLzBLme3kMlpXHkqeV7xXFhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=MStyDUpCWt3KbvNCVtI1mfapR7VNQrQmPef9BAkn8VBJ85p1AMowBEwUch3D8sd7JIeVTJOw9syEvmTb0MvcdxjJuhlUHR5gRgc1quI8bUR6s9VsVVepeOH9uV53s31R2/eNCredZGN8N/YCsZf23mU92Jih6AfEA0TY2gSeHIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1Ir/yjS; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1Ir/yjS"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304da3b4508so41433eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 06:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779975120; cv=none;
        d=google.com; s=arc-20240605;
        b=KiONLQqTNGArg61dhKu5PnMEheN0Jbqj/yTvqRMNOjLGUfI1ma6T+gQhneHy3BKtvm
         577uHdCQ8MRxJWURjEN6sTCcvSSa2s2Q8DwhGNKeH0fJD7unFtRFUC7I0OA/ut4vYCbq
         XAyPoKuUwPdWu7UQAc6Gn/V59pACYzFQEAKKW+5nnKPXtwFbCha2lp86Ue5clci6CcPz
         qrecuPqNPIddjUNn1ahuwvD+AExhSH2tfr1pVyhsTaWY6CauLKuQwG3uIhIgfGTu0fHj
         zfHf8ODX13pQPgCNpqAlQAdPX2RCEIE+I9JgZIW2a/98ZMwTmwUDJBLS6/IQ1JoRFHnL
         OsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKO4B1aqFl5HD5hpLYR+XBy6yjhsJ4LYMO21+3NT7cc=;
        fh=ZRZB+9TyAZKLFnwK3MRN/RX4AUCEoFBrdnYS8eK+J7s=;
        b=i65sm8FWsiWAKIhOFdwOaqJZSq6mMy/XFG6VgVB0NXY+u9l1BoZuKGhbsHqfmCiru7
         OsrMTWufR7SCKlJI0DCJya6hc1x9pBe+/ZG2yQBS6FtNLhSlqd8qjEcyKMY6wuGk1X3m
         gLiMBIcatOv6TgDNku9s/+MYtV+v1DpTc59jGaKd+mwvirqhb3mhOTP/I4FCdUDfKAkT
         h6Zvn+Fq/nWN4C8ZHjEx25n7CBEH5GFeZwzAcmDlK0fE7qfv84tKq9jmvxdpu4KNeMDS
         XfEMpc5t7+IsuJ6KvqgHi/994e17tDaMI/3KmJrZye36WhxOcRLZwkwek81V9okC0GlR
         fVCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779975120; x=1780579920; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKO4B1aqFl5HD5hpLYR+XBy6yjhsJ4LYMO21+3NT7cc=;
        b=I1Ir/yjSI3ezESec12hjbTPLfUce0CaM4YuWcVIgEk9cdmKJiwwxNnBZVGlTGyRYzU
         VXDcI4O+tKiHKSCEjiLpiZNrdo7d1tVWfdKgafpdOUi0Xd664HcliPKIOeJEfI3PsjL4
         HtdVOyNSau/KeUBqKl8Sdp6NCPzJTCZ0HBw06Da3yBljpt2r8UtEoEvc9MaZzpBmwhsK
         Xf7B2PgFUXjs56cem4cnfus7li1vLaKo/gOMksdnjSs81Dpd5+NbcMa08DAt8ldmERaV
         26x4813pga7NW+XOgcXUkL3ARCkAwwqtIt/Inavtd5Dl9wKSzV+CJDkKbhax0wza9PnK
         BWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975120; x=1780579920;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKO4B1aqFl5HD5hpLYR+XBy6yjhsJ4LYMO21+3NT7cc=;
        b=J09CB4mCskikfZ9a93hK6jnfFdUwT9pK3UVn87s6muhyMs8YW9XsTM4ypeE6ZdtRGU
         8SC946b0tvgUOnulB2iF9hwgku+Nkday/5SpFg+Oc85a/L7UvyO9im/QaLkcBMtGtWnJ
         7NIIzOzkFjgg7vMyBxmyr7cZpd44Pn0ncEqvkXHi4N9puKK3qd+3OYXBAenPGuqVLpa0
         QoKqP8JD4gBvcDzhIJqqUpZY6JVODnrVeDorbvQodxqgdWKq8Pri8zyVzuYeO2xjlq4K
         kNsrGRghRS1Qzk7lNXoJeiRX5NDQ8OxOo9WO4Eqr93v7LDvJoq37j563OkM/zM/0ys4h
         8g+w==
X-Gm-Message-State: AOJu0Yxc4c7QxqnRIEC0fOxAsq2EfqRt/Pb/GLfwuVJu87Xjuy3WqL0X
	rSfIUTyKVo/jJK7/FWRSOWBjFuXGvJag96T4E2YMy+l0VgIC+CyviD3Oyxp/s0qIehJ5Q52RlEX
	be15D0SD3ym9EcqLWgwu3AYssGAFdlmWTd5a01f8=
X-Gm-Gg: Acq92OFfrnMxpzWZFmGV8MGgaQnYaPm6JLjMdKjjN8/ALvKOnyEfsPLuqPshMqsKD4z
	8Snq7CbeJV2MGwLttD/QP2jfbrR9e8V0uqZB6o5xzE9zncoYb13uNaea/enxEE65qMwb1/yN5+V
	odTKI0SHZOgIS/3CbWS8xm0AEkazo7Ezv/DU35P2AlY6aYydUiFcjWHwPPcol4i4BamvEiiEgCW
	wRSCAUTZe/qFhvA4+eSLze8isIyzT1sejaZ50j+OwlKMflt/OY4pa2tbKe5OakHzhDjjl8ytBsw
	Z5Gvn+ApfdMiHf6r2qOjzZOA47PRX/bchaDEGPzTTM4XcS3TiTnffxqDmq8XZJgLnB8L9+XV0Mj
	2WikJ3kqyXuhiy8heyX6QwmSZjh0i9x3tlA==
X-Received: by 2002:a05:7300:d518:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-304d2c63964mr677804eec.3.1779975119581; Thu, 28 May 2026
 06:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72k_TgVdAEAQUmOSGg6NNQ_AatJjhLV49s8VaQLsbSxBGA@mail.gmail.com>
In-Reply-To: <CANiq72k_TgVdAEAQUmOSGg6NNQ_AatJjhLV49s8VaQLsbSxBGA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 15:31:46 +0200
X-Gm-Features: AVHnY4KKycprHozmp5v9lJqRPmAOFyAatLIi381wIkeYYvdznwH37z7LttQFrTY
Message-ID: <CANiq72mmw39gNTOv_pJc0VyWEQXsZwC0c+Nd0FEtG16HQ58Mog@mail.gmail.com>
Subject: Re: Rust MC at LPC 2026
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 11:40=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The Rust Microconference for the Linux Plumbers Conference 2026 has
> been accepted!
>
>   https://lpc.events/event/20/sessions/257/
>
> Proposals can already be submitted at:
>
>   https://lpc.events/event/20/abstracts/
>
> To do so, please scroll down, click the "Submit new abstract" button
> and choose "Track: Rust MC". For possible topics and requirements,
> please see the description of the MC in the first link above.

The **deadline** for submitting proposals for MCs (including the Ruts
MC) has been announced: **August 7th**.

Please note that if you submit something before July 10th, you may be
able to get into the pre-registration phase -- LPC registrations can
run out very fast. Please see
https://lpc.events/blog/current/index.php/2026/04/06/changes-to-registratio=
n-availability-for-2026/
for details.

Cheers,
Miguel
