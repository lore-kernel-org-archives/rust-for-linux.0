Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35E23EA80
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440066; cv=pass; b=Sb0fzvUH3eGIC7gCc15jjhMQkfngjr7iOmfsBDHiHXOhqoifAw6f2y1hOA5HnXb4IOGazpJnfF6i8nRuR4RsuP9rV0elXoriEyNcqRCT4aU4W/32FTMO671clhx7tRDweEqe0+eaTid7CMwiEDMBOFi8T1ZJ52/HRMHJjo311ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440066; c=relaxed/simple;
	bh=lr2FLKFsKIM5F/MNIJ4lz4VnmHaX2p0/zhRPZhHRNeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bx/RC+aRL6xixfaJRKhVYox5wpy44uz+CvFqK1TANVjiajyyskNe/FSTmwSa4t0RFg5qTuBGWE88d7AFpd8/+jmwPjXQdneooKn4LvgEVUH08kYx4qSkVNI2GlcVhPvgVxTGj7Mbu10nZ3r/DDTZH1fVdet1+59k2gSTaXF1E3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aerH81Pw; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aerH81Pw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-435903c4040so2812210f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 07:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769440064; cv=none;
        d=google.com; s=arc-20240605;
        b=dJLeyUtNVY2tng3yADmfqfqkBGq3scv15kD6yGibTeMIJSaoq2gArAWuVN6hOcHXhB
         1OeVH+NNDdIAc3uQIZYczoLixyoa3S/3hygydihOW1eUWHMuEufbj6Qf7js/G0M+/e/b
         8ecFK5BHuPJAViEw+7pqr4cwU+mqORoYBWGh9zLmsWt2t2gwfAWbCXTyN5fdHSxitHcA
         aXeMGbIANIZ+uo7FhbFQcft2STJYIyAo+NFCD6pyjEJAGrjg2ajRJnvWY5Dc9/D9bdcI
         zX9N++vQBXpFnTRaz+YRj5ta3qqWBt7REhoT4/nHNcCNe1GsWvRoz0cThRBhozELnLW7
         a8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lr2FLKFsKIM5F/MNIJ4lz4VnmHaX2p0/zhRPZhHRNeY=;
        fh=7WShCeHvDAJSQoek7FB7RpIVU6T4Bz2ebZ04KIOB2FU=;
        b=TyPwi8UFf6U59D+DPHNitkJaPQUBUQK6nnLSKrAe4Tm7DdSupvXySd340L83xKCMgf
         zey1ZIdTOYRXaqICI1Vcc9ul08/hiDizm+eWqIs7ihLKWKRd9/B6c+a7TuphuE7jRYZC
         mc1hSw/TFP6FaHfQCm1PkThopB8UhrPlSvMIpazLY09d12pl1KfDJiZfrhTFS/OQk7GC
         jlpnYvwuB/lVP8DwbTPfX5vkrfRjupXMbJ6Dqb00bbIsutMGU93Ug9wKOdc/HZsvEYaK
         tUz+QZqGIcWTUx7BNsxFbJVpELYuAVV2YZaAvYDeKETpCidH0PpXgBU19bE2eGH2c9Im
         eDAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769440064; x=1770044864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr2FLKFsKIM5F/MNIJ4lz4VnmHaX2p0/zhRPZhHRNeY=;
        b=aerH81PwfmkomI3YHrGThl6yFTu7Mb5ubmKOn1jCRLvn09tGyj6qC67Cv4gnt5gei3
         ukJcfHfskUstlKAJcJCYScpybWitIyvC6weFTC52cd4fyhR4FtVzS0I8HHeuk4VmnhJq
         9mGec5eur4/+EI92J/Y+vkgjjmszEvjQcLkAjHQVX4hmvP6mMY6J5HYDZLEtbVyOijeW
         bxqIxfy9kLwHYez4wF3l+Rn+IKs5nCsmRyjQH8hIXJxTAUhincTZ3X15BYhLQH6TxSgh
         fTLf11PABvUwBojXqKv8AY3/NMQvmr0y92pjS/GUXyacuodIjqvFkUOjv2+lx2q1kgZs
         K+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769440064; x=1770044864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lr2FLKFsKIM5F/MNIJ4lz4VnmHaX2p0/zhRPZhHRNeY=;
        b=SDld5COoaeU1TJoYHqMFoRJg6bKvRDif6Hg8WclP+saPwWi9f68OTRplZqbFzBiDT7
         dZrUJAFoAN4lRVNGmd1VDYhLvNVk4dmErvMT0VSYTOKujOsilCpsgktLlZQcN7pknQ6X
         GkLmR+Mc4ZR/Ittw+GP0sOnFdRD0Bj3W//LpNLhji40L6rYsD2Qj0SfcbC96d4tkvgn5
         do68dGzxDsoI2M3wQLxvssHv6fcuEP4bL4Y5QkEUGNJXqM0g5apDjQT1/FxCrZiqDCk/
         9JGxAWgq1SfzikUuFKE0zjDP2so2ppqZ7BkcJ5M0F2d82bSYHvpDCDCv5iRt4VcMkXkq
         Yukg==
X-Forwarded-Encrypted: i=1; AJvYcCWSwhvoN19mXJ8tZg0muAeGB2sDLVmSO2uZKiVN+Esc/zxE3JF/spiKTYFje3xNvAy7d1vnkul8hqIbCzdKTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFqWqv+XrAHjljjfvufsBq2JJfsxT2Xg/VsFcrCeWHQhAlw0vu
	cj4dNbrYWpGefR2q9Rdzg+ruKe3hROJeYAzhqn5hiZ0YRfq6/r3iO2e/xIzmX1RggpLdVW6TJax
	9g305Fil3HyvGrDcO5v+n+lepgB4cp5f169yWdfny
X-Gm-Gg: AZuq6aKM5vjUqGtgPqEq+X/4ay+R0anKHqrEyr61dJUdvR8hkrcPfRGTwksepK3NOgc
	Md3uGNl/tmCEzRFCX0AktIgKbCSb8I+Xr/KtslDTHXjw9ocqFbtPdKUnE4iYK5tfUstdhy3hWl5
	ZsKmqhAfisuYnu5h4nHoCEO/75rzkO2f1+xNZfsZYvq5DyphufEwVwsTnUzGF4E0xOAKI/qVvSd
	WmDoEs6vSahpiMMfIqzmPPwlFBk2tKXmRt/RcHYynTJxwBI0sSAb7WRpnV5xc0HwRHYkyvTmuZs
	uLo+nI2G7yY6W+olXRc4IrLz2Dsz4YJOz/rGJfSaeCJDSBPpM/KaRVEtmQ==
X-Received: by 2002:a05:6000:2c11:b0:431:a38:c301 with SMTP id
 ffacd0b85a97d-435ca1adea6mr7281836f8f.48.1769440063540; Mon, 26 Jan 2026
 07:07:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com> <20260126160036.2b2c66a7@fedora>
In-Reply-To: <20260126160036.2b2c66a7@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 26 Jan 2026 16:07:30 +0100
X-Gm-Features: AZwV_QjLENulvLS1sAXoE81OvlNZto8fyQIabUO6YtyEaaalxqoH-joeeBXDm7U
Message-ID: <CAH5fLggFzHSB-iassPmwkP74h6qN6V6hYaCfjT0_JEvGoDecBQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Lyude Paul <lyude@redhat.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:00=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 21 Jan 2026 11:31:19 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > +/// A [`GpuVmBo`] object in the GEM list.
> > +///
> > +/// # Invariants
> > +///
> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and=
 is present in the gem list.
> > +pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
>
> I find the name a bit confusing: BO residency is often used to refer to
> memory backing the buffer object, and in this case, you can end up with
> a GpuVmBoResident being returned for a BO that has been evicted (one
> that's no longer resident).

Good point. I meant it as "present in list" but I guess there are
other things a gpuvm may be present in.

Any naming suggestions?

Alice
