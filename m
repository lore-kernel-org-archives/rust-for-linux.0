Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF741D8E01
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018131; cv=none; b=dSEvmgswTapEes44itYxt0filqsSNihIGG0Rk1K42r8w62jeDwffql+SBarntQDZuZS5XFrDHpW2n3W+1eXYBvYbZbK0HIdHJftX6pcVfwz77tT5WLGCXnl14zKRllrsHWRBfj3tFaq1NWpbYMNCO84USTf5J5v2Gz72JSMLPs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018131; c=relaxed/simple;
	bh=7IU35E/CPE5fOFeW79J9UV0rfWcuyJtwju4f+Bbxmyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmnOixFpjIaal3qrv5AtUYphO5k4UX5GAwWWEgbhDOCGcDiQtu+rR5fV6OoUQoEvyA1gLwAHqzeo/xLJexl4x5oxcf8a8OdCUx7yLtESjsVB/l3qn7pF5FWbt0hYbl11H+aBmWVTQqQ34v8igbkB+mDrlp+lmRZO5AsYfVnFHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fmvq976K; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fmvq976K"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so381838f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 01:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737018128; x=1737622928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IU35E/CPE5fOFeW79J9UV0rfWcuyJtwju4f+Bbxmyc=;
        b=fmvq976KAfxwfKP6+4evaF/evuK/oxu5ePWCqrwFF09bA+XlRtOuUpE33qI0o4yY4a
         owSRgO/zR6bH4GZNBYhV8HhLp3Incrks5GtSYypZxfQHn8gEgd+fnf3qm3di5E04bEpP
         WECjEQ18TLT085kvBvCvrAt02DDTb6Q5n1oztrHEjEO3rM6AI8egRyJuMjLcGm0LgnCG
         Dtc/TknbqUO6O1VCKA5vRyi87NBLwJusel8bRjm76DYrC7lcS2evaKHCH12Zc10onV32
         i77ZFNHvK6AnSQQevDCbyGqxgSQxxWgpCfCwaZBDkEs0RMqJoBgNmeoDtHFVrf6I3Nak
         qFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018128; x=1737622928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IU35E/CPE5fOFeW79J9UV0rfWcuyJtwju4f+Bbxmyc=;
        b=tTyWp4NSSfZAOiFg2cqq0/imWV42N5CxTBuXLZElvxai0nqCUNp5Za14CVkui8DQPI
         r09ZX/25TQxlj5v+fO5RS/axu5tVcoDXBwUUiANedKqAe5w+JjKZ8SYJ1LFKpiAcBbkx
         E2uZ5Vdb4Fu2tjUAXYoEwMSajWrlEA9VIVTqw+CTEOW1/Ep+IB23jRTP4QvP74HkheUz
         5/4uqZyb/PtGykWJNM30S7T1SA1f89HnFfvDbvp+vmeDhMhSyg8hcLyE1+6CdhrGpqIz
         hXKAvxDpDzNERZU//ZzQQS+YxkS3JaMZdeAsrhmGf+tL9Q9pOOMtwGvWupa02P9QK+Cv
         uD6w==
X-Forwarded-Encrypted: i=1; AJvYcCU97GPD3XjW32JezVGDhnb6k9OFGMI62zMUsXbiJ5r3VXFKU1Mgn0ZrawhAUAwMH5xAaM3QEy5oS1ndQSPm1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwodlbTi4mS/29e6Q4xWpSURJjXlIOd8MhhQVQcwdvMtsKkmtqt
	2Q5Ei8qzlZO/anMt2gY263bwFl8fBAcnoj/VPxtaCYbCp3W1EgV4K/SHheg2PXfvMW7D7w0sJgF
	OiHVcs232ccVpJQ8aKUP5A+Lfv0oxNudMZAGk
X-Gm-Gg: ASbGncvOHglrLQ4LPfmdgg+ffR9QheVuaPC+u4HPd0SZF5oegvCwrPfDfcYpeEsOUHT
	SZS/Q7WDBqjImqIyD9NEyv9736K4U/5HbPDokvsS3OHxfXHTGhJPpGDlLRBGlNjEFRe0=
X-Google-Smtp-Source: AGHT+IHsYcuZb7kXvv9z2zYXpaLrRxKmZE/mQN6LHoSOiQDnzvtXtWV/abgoNSWbAk3eZr9SJBDJzqYrt5JImaMe20U=
X-Received: by 2002:a05:6000:2a9:b0:385:e01b:7df5 with SMTP id
 ffacd0b85a97d-38a87303882mr28885864f8f.14.1737018127893; Thu, 16 Jan 2025
 01:02:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
 <a88cd29bf01c8fbafd5c2608357f54ea10f6e492.1737016320.git.viresh.kumar@linaro.org>
In-Reply-To: <a88cd29bf01c8fbafd5c2608357f54ea10f6e492.1737016320.git.viresh.kumar@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jan 2025 10:01:55 +0100
X-Gm-Features: AbW1kvbZWEwzHxEJptuAgkMSOW1BoXwVe_u3Ui3nFvzWU8elE5cxVBo5LvvgFlo
Message-ID: <CAH5fLghrK=dTP70pt=VK_gJSsnFnRCvRXLPKQv5v=jgZPrVNNA@mail.gmail.com>
Subject: Re: [PATCH] rust: device: Use as_char_ptr() to avoid explicit cast
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Rob Herring <robh@kernel.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 9:34=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Use as_char_ptr() to avoid explicit cast.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
