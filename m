Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97EE3033E9
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768777054; cv=pass; b=j+yM1CY8832G2xqObjnjkN0tgxq3EZVXweG3kr5Vp96RaPEb5wlOSe7YJFKUYEgpQWsml7nMQO3q4EN7PQnLJpgGpRECCEMYN5J0pwSLdaamaTP5YI1OkqcDgt+QxI5scn5ej/S7mMiVf2IYYTOaNmsBLSD5c3r3WXeuMTiHSWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768777054; c=relaxed/simple;
	bh=zQlHANmxw8+1fglfsz+j8wJ3APG0fbKTxMnYtaqi28U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmegbpbF2AV5DMO3TPSCUGXnFfUoRT0WyyXkfVOXQg/bIIQ9n7XXSEqH8eRbPhvWx9HREvPWurHfDT7auGDPWDw98RQKDWSKlZklKy5kmp9pl4SEE8knoTOjyEqV/2BsxNUSHOyHSGIpBf33z0/bbLpFLsEFPAnPhdz+vhiH+bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmgbdLI1; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmgbdLI1"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b1769fda0eso387518eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 14:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768777053; cv=none;
        d=google.com; s=arc-20240605;
        b=GQtnR4Va8wHBO/xnl65oL7g+UvZAbsv9p5qlLxASO7Xsp9b/+wlY/o62dZjmhXl/GI
         1p2GytuLr5bvcwomW8dh/V5BVcMfCpw8myVs+zd4TX8s1XPPXsRHWCDlb+MjlZqt0Ydk
         Mkh8q8U6DLVUv0ibEL+5Lx77CEX2NcKRnbRdh/oc7sK3ppkQx+Fn24rRannT3XTVZCPk
         GtemUq0vXTvI4mBmu6p0BLS55O2CGeA1CVH98bg/1jQbIHng7j/1ddcB/1npY4P3NixF
         8xTuA/g0hcGtJPRnolTJ5OWr6/tfipbU031bUHv7rFKuBhDqGuC43m0HwqG10g2nTrx2
         pIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQlHANmxw8+1fglfsz+j8wJ3APG0fbKTxMnYtaqi28U=;
        fh=ipMX+uTnHTb5IlTFhZ0zO4qviD3iqQq7RD/jjJkg85o=;
        b=SEIKkZjUs4crn4FpflyJqunKBxwIlMi7dS4KcYD+rr0eCIuzVD6IrQrUB+ajObR106
         ElskYOWcFcjuQUKLH5al+ftBaQu+PJ25HbyutqBnlYpX6dzyJoTmEcw8YM0M2dJGg0k6
         xohbbKifojyLDaW2GGlwqiKPfLqZIqr4BpXnNmZ+o0VvL+3z93m35csolA79R02nmZR4
         ReO/rDen8jP/7fdb1VoHGcZ8JxMRxAQ+fJf3M48gX5lDxUmHXFWaikuuFogHMmlznabA
         kXPtb9KcuEVp6D8IwMlkCpvpCbc5NOyKYH865SNdPdi0D/3NHaUT1n56cIVN1QV+93oi
         79mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768777053; x=1769381853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQlHANmxw8+1fglfsz+j8wJ3APG0fbKTxMnYtaqi28U=;
        b=QmgbdLI1897wv3wZtZp3vVA2ph9tuLeX6TwHIm0ltHKT/LzNVnGv1wyc00uLbObJCa
         mO2lYlTCiyjz+xwRutLOqxtxBikS3DAtjjhk8hhzA3vwYP4eU+gYgA1hg4ap2UPK5apj
         d5kEJbBBW9mvCahLjTABHh0n2OwYM9BikkMcd00X9jRSoRMzHeBL2fK2pA9pcSINQNgc
         0io3AJ3ytyNnBYswwShyYoaBgRtWQV2OBA7grvBUIhn7ZOGZFkYXkQkB/gCOFpELkGMk
         NZ5Y87ZzpPyNtM0ss9wWMEVEv1oegwjEIYC01urIfuqI907Lqv7TqStWtfxhf6NYKfSi
         XZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768777053; x=1769381853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQlHANmxw8+1fglfsz+j8wJ3APG0fbKTxMnYtaqi28U=;
        b=GSLS6v/izbg0XHJQvdca9HGXhuuxAk1kQb7q/8sVDd1nR+noreZxIzslff+CJPtddA
         dM2Eszou2EbDUvGyP2SjruwyBGnPMRfh8plKPvvhdKga2QrHbnPAVcdmDAJ1pcCnFJzk
         yOjsSzt0bOCy9aUuXPQz/Gh9bbn/1duIgfw4z8T285Q6XFgKp9EkpvfQcaTRa1iUCYjh
         hZxfiZzsRU61rPfiVaRDffkvD1TQQ36KyeF6eIlhOeYQwX5LvFKGi0Q+ntZb8K6i+Edo
         evn4HF4hIR5U5uux+hnCLIdhpxzNb1jXWDiSN0aB2mDbzlWnDIxNMCksAYcq9xQo+4ue
         2t+g==
X-Gm-Message-State: AOJu0Yy0Eyo7U6hCNz9kdS8oVYH14MkxeXI+Ui+6czwNYvjcxFDryfbm
	5oyxHorLuxJUpiPQ+5z8JnwQEEBP1SNQrHnGXIDRe/LY+DemBt9CS4GTmv6McdNG2PvH19MmYh1
	7kP9sAQAI+QHhzigYecxcJRoIA7zONkI=
X-Gm-Gg: AY/fxX7jUw4VQyO78gbA5mjZ5A8NNesJg5oLAUT8PpCEye4M1vRm4QgaBWJoITr69fb
	38kipgzebEnJZ3rrr1/I9KoVBRtcuUxfAYjcj062WxGRfAGlHPoZNq4M4ZeCztY3DMjMZApObbm
	ySBUzCOqXaY+kHAxwtT+CslNy4Nv4QBQ15oOhYi+TJMzAyJJC51R8AJjic9jw+LXAN0WEw4fWl9
	AL85zCP+TNXULa4/5NSsCc9BSK6C55Z3eznuMSmnRmWZHe663Sek9CRhuLMEOc9UrQtuMLSsXJU
	Wi+5nSRh71BR6YboURJwRogsf7r6ba4ls/9IPbSKrLa6QEVI2cPFwUfrhXNfyfJP7GnzLo+z9Jt
	Ttbc8VADKoNcU
X-Received: by 2002:a05:7300:8b9e:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b6b4104734mr3613124eec.8.1768777052655; Sun, 18 Jan 2026
 14:57:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911085447.17463-1-work@onurozkan.dev>
In-Reply-To: <20250911085447.17463-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 23:57:20 +0100
X-Gm-Features: AZwV_QinViWpLOCzkYuvgQEwdHXFOp-3gyULsAv-362CjsOMWar-r2rcsNf2rTg
Message-ID: <CANiq72=gerzuzNeZmv-0y1CELobFKRj4TjsH2KRyqEbpUdKDaw@mail.gmail.com>
Subject: Re: [PATCH] rust: resolve safety comment TODO in `as_str_unchecked`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, tamird@gmail.com, daniel@sedlak.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 6:53=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Resolved the TODO comment with a proper safety explanation.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

I saw this patch without replies -- for future reference, commit
3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`") made this
one not needed.

Thanks!

Cheers,
Miguel
