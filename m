Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF21D8E10
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 15:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439986; cv=pass; b=ETTLvmpzAjYqop6HC2Kd7OP6B+oUkD3wlL9Nt0/gJnbDms+3NusqsI4qHb1V8Vp5GqTZdSEhZlyWJPFQWUzDuRR6wp+zCE1DofVi0UJyb1YUeztZFZdvfZZpRRrgldG/nsrKS4v9GonPpzwYxW49v83ej8fOMz+ZMen0Vb73WgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439986; c=relaxed/simple;
	bh=Z41mf+ChQ/9Ufyepg/JpP8j8QIs8IVmpuK2fawXti0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBSthLdW2RxIS6D0+m9FSME6KbIPqdDM/aht38U/VGhS9g5nodYmwT88zyHxXNMzOCuom6IVxaB/xHSOxuMhQcTeYHfZU2Jf+cpnma8KtJWJhPane87uZ1Z3likp4sw8d2rJP8M3zj6Kgkzg3g/1SDt6vGUjp/4hQJgxeutr9as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uMibE5iG; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uMibE5iG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327555464cso3119862f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 07:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769439983; cv=none;
        d=google.com; s=arc-20240605;
        b=i/31v00nCwAa2zrB2jwMBB/xetcRMww1RoZ5WpcT+dVWs+AmPTtCTNxW5ibs9kXYft
         mi/IK/iTj+fimdKQNy5dhtLDZNsOz8p126IEJtobEFKDhvN2KUR60jfX1btIacAv/gh9
         ASobQxmzZN8GryagjlPfz7V0X2ufpq7yrEklICwtCEz83U30Fb0TUmIaEc1KMcwWUPDq
         OPdZmHcMo6XyMIgEsEtQrno7cxCBMEe5QKeeXwatW4TnRn2Ca1xY93vfOvpxo1hgrNNB
         uYg778aHboe87rZZk8B9PslUwX4vWI8PwKPi2O+T9Bq54aOtLhdgX90S5Nc5IaZFYfWx
         Y44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z41mf+ChQ/9Ufyepg/JpP8j8QIs8IVmpuK2fawXti0w=;
        fh=0s2+lur0ijR9McQdWha/n+S5d/tu/Kq0Cqsc+W2jn8A=;
        b=fAFwlmAXOjs2Hvg1At081jSb0l23oSEO/iBXwy4V4BeNXytciptO5wogTqrygY9BAS
         i7050LRQ5HVc48j4oED8NFSpDZ4a0TtDL1KuS8d+ecxceRGQYXaub6PzecsYsW4gm3Fd
         AOp++LsYPHBKff01RY1KohS+JFOMLpUQWf06PWIGrxB5jFW9+iPTJrGPgpisFBU+OcYi
         1wgqK537xjA0IxyeJE6wmMjZG08UgkbJHuC+unw0WdN8/fuXP+9kjszEMVxj7lxoP5xE
         x8/2w0X/SX1q66A1RZxZsG1nWmc3n0/FVTLXZ8z+b4d1v+bPmUcxivVGvQLdS598kz+w
         jgXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769439983; x=1770044783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z41mf+ChQ/9Ufyepg/JpP8j8QIs8IVmpuK2fawXti0w=;
        b=uMibE5iGBWfiIQt/rkwY+h5ITijzvSNHVrWFSil5qzdPQlGV+drdYc4v2Z8ZuPQRgh
         Cdm6AeGnxqb4fX5iNPcGSaRJ52u6gOwdhmJpKCNZNmGX8BOlkUmS9eeXONehbeh9BhFU
         euOlUrn0V49fQB8k2kYbB10ELqFIfqzphLsrlCLkphjiD1ZIenUGTlmGMCQq95rpt3Oy
         GyIurIuAI7UkqUFmpZU0ZMRijNwubQ0h/2rgJulx0/ijZcCCXk9wZTSgYDLWtXBrLY4d
         boOE6saNjKZC3YzBzhhXkSEiNWdEhgROKyuXOdGtxMxhuyVoEAWG9nEatwAQQYhGtrnh
         GQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439983; x=1770044783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z41mf+ChQ/9Ufyepg/JpP8j8QIs8IVmpuK2fawXti0w=;
        b=hgiqbjWYe0QBSZv/ifBe2vIewVEKJySA3LGUinMcwm24DrBaJDgTae+x1Mef5vdws/
         QTEhTTzNFb8eF+O4Y26strffuY+3j1Zswr5TUnmBN3iEgsGMEAxKj6zMmUaQVcaO8++O
         VN2F9v63OuqasYATSIG5sAXeAbu21ACqby0tibaNOMTic2hyshbAkbQ+zE3KE73OYKf0
         cnIgmgDoEYQwEjEa1U+BRKCUQLMEHJBAyVzB9mB4d0cdHvK1O8XZ6PBo+SPiCRB0YXuM
         oT2g/kp2es+7+32sX1mZu1Ap+z9UgeZ6NyqPtYhGKRsqiIMlq/P0fwVugW5FurQkS3ux
         +jtw==
X-Forwarded-Encrypted: i=1; AJvYcCWBQPHHlcS/6Ll3ed6DYsT+NYN0vtqT/66fTxJCjBhScQ0fErk6aGdTTcJHyBpRV/UegI3127a4LZS72MoQow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmjdEVrWo9Rt7OfgnOKdTnXDaBApHoqIDKzWqz4irE1BpreHMf
	Cy960ghpLse+hupTxfoEE3mYKRmPX31MZ6iJzdhtq5TehPMrkwZylCiqeCkJpaap17NMZqhD88R
	I7d7SSiDeZd0WCNIwFpvMICMRFAhkmHy8B2Ml9ARk
X-Gm-Gg: AZuq6aJ3zhxvJ3FRxBT/gg3jVKu2frem3rbtUlJ4JbtqgS+UmI+zpqfsr+/E7CVLvKb
	HKNtAytzyZ8Hi5KpSSw4axcC8YN3FRqaRyux1lUgiE2LwwK5zzY1bbgPhRH6MbzMGRIMMlEy0Co
	H4IO7y1PlzGC5PWnAkzvD+R7GtQYvHAG0wOqPYFO8Zopdh/jYYTbzKHPz031MSZM1SPnbiysJl1
	0JXKnLpUqSdT7t2PgAW4/OJVDXhijROGH5NzNTh2y7f3ahjc11MBjjVAmL9tjHjU7mMo3LEoTfw
	qYdznrDMXIN6X3ITZJPz1mKgDruQ4wrV5gtd0+kE1FFDybUWNZhHxe3ZuQ==
X-Received: by 2002:a5d:5f44:0:b0:435:a48a:1239 with SMTP id
 ffacd0b85a97d-435ca14577cmr8053819f8f.14.1769439982862; Mon, 26 Jan 2026
 07:06:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120181152.3640314-1-gary@kernel.org> <20260120181152.3640314-4-gary@kernel.org>
 <aXcxMShqvHzYMllD@google.com> <DFYKD4MRY9BK.7O6YH0H3RHOO@kernel.org>
In-Reply-To: <DFYKD4MRY9BK.7O6YH0H3RHOO@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 26 Jan 2026 16:06:11 +0100
X-Gm-Features: AZwV_QhdWfajSqPqBDtNF163E0Xp0jfpmiLPUwX0qTH6ZyZyU_r6RbWqp7VnRm4
Message-ID: <CAH5fLgiOMJ_6bUfhRiHorg9HkNeDknSO0bjK61wry1ZaNO0A4Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpu: tyr: remove redundant `.as_ref()` for `dev_*` print
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 2:43=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Jan 26, 2026 at 10:17 AM CET, Alice Ryhl wrote:
> > On Tue, Jan 20, 2026 at 06:11:09PM +0000, Gary Guo wrote:
> >> From: Gary Guo <gary@garyguo.net>
> >>
> >> This is now handled by the macro itself.
> >>
> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >
> > Acked-by: Alice Ryhl <aliceryhl@google.com>
>
> Given your ACK, do you want me to take this one through driver-core for t=
his
> cycle? For the nova-core one I will wait for -rc1 to be out and take it t=
hrough
> the drm-rust tree to avoid conflicts, Tyr should be less prone to conflic=
ts
> though.

I don't mind either way, but if there are no conflicts, it would be
nice to take it off our plate now.

Alice
