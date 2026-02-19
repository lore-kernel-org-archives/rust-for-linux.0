Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213032D7F3
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771541753; cv=pass; b=Eoe6mgEF6aetz5HBhx+raVq0FQh5sfzkVfm9Te6Mr7sRRYUBUEm4rON/kouCIwarRSU/4Z97vWYwvjx15uhqX2/2evK8IzcK2mX7FmEvgpzAmzpOPfXQH926ZXvMTJPB4iFiR2AS7Mhw2Ohw+H9ka6Y7ueePxfprwOUtVpL+lZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771541753; c=relaxed/simple;
	bh=MZKjExKkSBJcIIP6vxJQ/Xoo58AUuTyIj/ALG55KVsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlLvgWbctb5lCt6hn9YfnyTh//HrkIUZpzPW26vygNMZFhr2UFk5iCq0NACfLFT6BPVGuiUD/JB4zwyjoXijKGhH/gJxPlPEzTxTnM3NY0SkTQDQ1pJPJdhwqw64uIZ61+YXOmIoM1iY79dfKnmjj115fh3Z6zXdcTrxo4+i3rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfdON1pE; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfdON1pE"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12714f01940so125172c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 14:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771541751; cv=none;
        d=google.com; s=arc-20240605;
        b=C32CWGTBm+Zqo1gI1H5n5wzXI216Zb5HQWQlkigRgTS9WjbPW9XpzsErgZVD4Rxx2p
         hRhZHzrjeHEIaG8AQhDABXPQheAf9qapnlZInN61j2zT0wAc5o7reOIUvuHfjcOHm8Yu
         cNkdUYZDvZMeIgtPSUqPB0Nmz2SCAMNYDYAC4EpwCW461l9cckvwtSpged40Iz3I7nEm
         3cpIwTxNmee7pD5jcHXgCO95wtN97SPN1mxa5tDDOEFZwLQOxxRj+NzeDEFhYVJMJHuT
         i2jxg9aJViQR/oUIm1TEpdpOkW+EQMFCu2TolEyzYFZ6OA97Eppld39znba+RKAw5qY2
         4amw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
        fh=TUWYLmZENJ7HvtWTHEgx9E2twUhmYwFzyNk5vCpWFtY=;
        b=jB33SUtwRf9kQYt0Vw1RYYKoXMzYk55n2tTMJGrNccDxig2xQS4t3zV0x5ywi3eQUV
         gKcU8DA5wY+TAv6OLWKkafzXWe/eF5cP8WkMR/9AT2w55MAfLPNvrjWgdOr7qzcpwidP
         s+r1JGf7Jw0CBs9b4haAeNNRs9eOdKejDGSnLUjMiPJIZJHO688vuQo+YikmYSrmM+Ro
         cMbVFcSo47dKqOplXEiVDwi5jbh+bqucOQgckIKLjEHptvM/bsZ3JB+PxrFktrwduejX
         EKwf2Q3jJ364lRggXRP1oeM0zJW2E9lzaY+tv6YNY3HrWw43zTR1wPmblBkWujMjJQxE
         kVMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771541751; x=1772146551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
        b=JfdON1pEw6AnnnY24AAdkQSIWeYklEz6iE2WB2joEmcUDHHUchAKH7YnujEc290v+S
         LpG4nctyScnAV7QQ8On7oNXzVYpwUeZkvzQdddHCk3SPAnPdpuYnIpMooOoPRJfzXuUH
         ihW/wpqeSudOXok/16i3x4vEeJfX9TXcqTCNaPcxdPf5n0kpkZiSGLUV6p64JNBix2Kz
         l4QR72D3jylumNtSR2HFXsFYV5JOLYIZDXL0OUTA3+l4BNmY1gLlAPrnPiNapTmIukDC
         +AXRbNqjqmF5VMyjQpZh1qfuheJToR1hCrWoIFG1HdsAr6NtQXf3QvJltK5eSEhXvl9A
         MxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771541751; x=1772146551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tzmFdsfq8MNx6L2xpTWEWoiPLvNts9kq7DaS1ogvM6k=;
        b=mDCrWk9DMv+UGKc/Hr73JcSvlsrM7n+WPugkb+6wDA46Cuabq1J2GlcIma5H99j/f6
         PfHUYecFq4y4YaDBURPMDIEygUDVRDoQXNRFEeIbMEPcm+OI7lN992sHkhKjbTtocHY+
         f0+Pw2f4eMdMWZbZ99iHlOJxOpQJ5dpe4Z0mZahZTkit1f5XAD+HU0AevH2S1mOualcJ
         33V2uc+xkACnln1q1X6yMpOACaYyefbRUc/trnUO1DMfaQyLR+3v69qyOm2VXY1Z9hi+
         40aQrE8DbUF/dTRElEB9UKTA5YFCb5n1XRotc/eDKRhTdgyPm0pWFNrg9rVHP+mB56wS
         5mxA==
X-Forwarded-Encrypted: i=1; AJvYcCW+qRQlmH++v2Xxr2U6m6VvY4kRBx2GpqkozXcRIcMuHloUkyDJKcGyZgW+23fWvz+i8GmTpvOFxw+YrSevqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKcJfXf+tzJlvduxgaM15xnTUC6Bgis1K3tiWKp4ZaT3xXVUI
	dH52YCXKkl3ZyvIkH6FcrCkeFLlpo0H/lDTI4jIsLSfMN7EWNkzqQItDtEPrVBFpNpwrFcCPkOP
	J0V1XLm2b8DtFcux0mEvJDlhn7o0UHKA=
X-Gm-Gg: AZuq6aIqguDFWhwTk94rCfZgUU/k7iAV+wCvKKp/ocXxXf/vbHbPsuB6/+3emu4IFLJ
	61Q3lrbOUPjqO9g5ySE/qJBtmDUkBFbqteMUkVT49MQbNbpo9h/+k3qHh836XJ0Dn4lXW0JCJ0p
	NvvBROXZCwzFIkIEDs7hF5ZVs+CnfXdIWNXCFsiR0HCvXkuhcyClHYLnWmHs7f0L/jIiOPhWsSK
	I09mk71bZgT4GqNLubTyC/K8pg4TIOzqCmHl3G6widxWSS8i5Zpc5OXL2AToZoVsKvn2nId7eYR
	6rY7CxUQ5tN2ZGf6fuC5dJuZhpvsdLrynVaclpJQGwUXbS7qPiakGk+250h1XvJlYFh6898qiMG
	VqT1pN7yBY8rgYK6dlDDE0Gm2
X-Received: by 2002:a05:7301:4591:b0:2ba:75f5:72cd with SMTP id
 5a478bee46e88-2baba129259mr5952861eec.9.1771541750839; Thu, 19 Feb 2026
 14:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
 <FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com>
In-Reply-To: <FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 23:55:38 +0100
X-Gm-Features: AaiRm50FqOS1dTWgKs-rY8pjqDvqyuBoJm6Fgf3-4VuQIwJo2BUnXmDIAOZ9-c8
Message-ID: <CANiq72=A22Xn+Ocd9-GU_CVU88LD6i1hTHAeQPqLEf-j17131g@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Nikola Djukic <ndjukic@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 8:29=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I think let us see how it goes and how much is the volume? If it is
> light then I/we could send you a pull request from personal kernel.org
> repository, if not then we can set up a branch at that time. What do
> you think?

If it is very light, then we could just do Acked-bys, but setting up a
branch is easy:

  https://github.com/Rust-for-Linux/linux/tree/ffi-next

Please feel free to use it (if so, please let me know your GitHub
handle -- I already have Alexandre's); otherwise, we can delete it.

Having all branches in the same place is good for others to have a
single place to look into, and has the advantage of being able to add
it there as a `T:` field already.

Thanks!

Cheers,
Miguel
