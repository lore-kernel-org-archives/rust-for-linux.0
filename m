Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE13FAE09
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 16:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341957; cv=pass; b=AZvkJJ8b8pum9Pz9zm9zwf/5HJThvjvjEPF8tHbbBUgrsjAfszQe0Gb7up7GVFQHEjQMF1Nl6OemPmfz52VjKHieNj0Ca+7x53Y9kDB0qPhTGFoKb9v+Up+1+bBKaXhz1rLHoBoHNAzYsUZ5iWoDqeE0jwH6B8oQbpj5+veputQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341957; c=relaxed/simple;
	bh=/OOWdJntfE5bSPgQas5XocqfmzGwqA/LTtLzB3LqaWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1OzEQV/74XDHtjdmVtoKNf0cLNQcLDr0t2ZIBYg9vRLgVgxIQuO0Dm3RejHFR7h+BdC05izMTSPDodzsnMz3Ife/zWTDM8beIeJP6k6fmco4C+FznbzkbpmHhfX4ToWICYUiGrUdXeftkZsQqQJqDD5eOBmdI4lV4vQ7ACWxTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLidCGf0; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLidCGf0"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bb5afa736so159753eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 09:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792341953; cv=none;
        d=google.com; s=arc-20260327;
        b=Sa2fS9KRfA7aNh9VI62mqU1m2cQCVWXpo8u8jlmqga2c354TWWduR4ntkLkrra1ZYP
         B5zkYrlQzjxi4yTAPeyJuSf8TvVaZwiY4iubj6T6d73Y6ItlhXyY5B0q9i4dn8GFMN6w
         EZYZdsS+y9/GbiBCfn9CO/IUj0tJDc8GNGj3NC5cb7BJ71ppgF6iL6pQ87Lg1qxgmdwL
         bROIjMNpLbMQ0IVZiOcej16r/v1CcqGSPexvDn/iTsZPgBawzyZYGGiWUSRx2Wp4ADLP
         pEMZXS0SjDpZNYd/R22a+Pi3oLjPGLk2fXfIJgIPNirWtXBzX3S9CP1qa/MR7dTFvnoL
         JRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K2nyBACqj6iF5BhULoV19NEeW9GfDUgukWkDmcax0/M=;
        fh=OB8HwmKoQ1kWmm9gwr8G7+O46Plbajw5k0evHQ57nnM=;
        b=EhsXmTVjnFX5gp0SRbeYL+VdT0CqDgY3uWqbtCyRMLNF1iApvl2LmVS0jK9p36KeYH
         MwYV9qtaKAMHE3XnqNlDBv4zTHJgLupve1tSXUHW9gmObS0KSxkT1r/qVMbGurUEdxk8
         u+Q+zeireWkvOmuUSvI+zU0hLFmaCQCdg/mWwrh2qJ5wutkomi83PhVDn3Ob8Lu7ltCA
         QyGmDdSK/Y29KlprS4Mls9nQd+OknM03/WbC6OkfUjS6VUyeL/kp7lkxWsfTEAotmwY2
         iYhTaizkFXYbVE4YLskPkIZux/kYD23Z9tnvfC15SipbJkWBfyBLORhk3ANP9bKmR8zN
         X1ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341953; x=1792946753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K2nyBACqj6iF5BhULoV19NEeW9GfDUgukWkDmcax0/M=;
        b=hLidCGf0anbFySUixak3EAm9Ll76fUY6G6jugYLIAJv++Dnl5tPLEqck6gJP17LDao
         k2xb0TiKTO9qibgsxHdlPUxSHylDxVA53Ibq4WkE1ClK597fJt0JzzA3zNGQY+1jxPy0
         kmE147wnm+Goab0GCrBA0iBe6VIiyiF4TPExYW1YMOW2aDT5ABtFClQKjyx+w7I1iluz
         f0y9z4pB+V0+UEkzNTj2JNEdAFwVvARK5W2wAVsck9v0MzLjkaDUvY3cs79PG/GrO40r
         8bH2YeJXwKLA/8bTOfc+0WbM1ZTKP0ANxo3Lt9IKrVz8zmVhrLUlg0CPBAO850ni/OuT
         vDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341953; x=1792946753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2nyBACqj6iF5BhULoV19NEeW9GfDUgukWkDmcax0/M=;
        b=uXCBIcSFSyDC874qAXx1oJhOqnzM/wgBOBv5xcFUbUssMSFT+VR+6LNr28vb14YhGK
         C5R4UPbOLwTA9FGvmMgOVu6uuQQolNwCHfGJ9/EySDjiMPYbp4O5VYxs1IrR+3ISeAOh
         kLYZfuuHXi4dQf9hXcJ/lRQeycyq1XJeZeHJs02b5MUyPkD3Wewvi16q8kG/nGyXGFTz
         buvjJqR4u+EsoAbVf2TbsjagqID2r7XkW2F+WTBogwFbWbspeiVZ+SUVGlolOWM6oP0I
         SVmHl4Oy4SeZLP2+/DVktuM2u7dHQiiu2V+4hEYzaDRnnPkfj3UMb+N8Xqq9mNVUhsqt
         nvSg==
X-Forwarded-Encrypted: i=1; AKwUvByFvCfPsZ/a8riG0GqmVlkfidEjG6jnFSbV7x/bYnNCyl8DUydNKb5ORvvCsyCSAnOe/rNAMMOvRHrYxHIw0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6WMNYs61pbWLJhamcCuoCvBEmIKVmCGBcIVxoTeI7g9lahcvn
	NzIyDMGs/Ee4q2me0tKHmBJIList0LIkfJyDjUz1oe3CFUUF2mqhqTzkno2Crix3BYFfHJZKtHb
	VDxQfe2kBrb6om/flQCM55kkQZGnEPe8=
X-Gm-Gg: AYBFou2czt0IErZAPT/p+XluZ7UqaLw+hWdkzMKLuo0KxlI5zmluBuvJGujGmW8WOUw
	tM/ekkPxsb439kmf1oUYL5e6guV8xSAI+JNOSrpS5KosPlwSAhUfpZv0Xxb35Uqj+Z0VJtNAUrz
	gKmgVMyivssmzdgItFRr9RrFyk2bkCo2GOVolq2UbvCkBWv9UEJk0R/D1Pn5qwb8xrncCAUvG6Y
	pO2lw18yazUtinEcZaHjPcpEf1nkH2pGh71sK3J+hlN9ElUm18e/+aCECWdOr+vcwwvodop63uP
	9ZjdA9X2nf6ZH7xxWAOpKjKV7/ipNskkSve0QHGzdgVNBlae0u4d9ZvU1sSN0s1dWkYnLSSw+yz
	nd1gNduCA8qL4tghMkB4EEI9Av3AtVK1QVI1VcWKSkOuhLt38IRjChPeJkJ+5P2EItFXQEHC1Qn
	PyVwIj8890wQzCzAM04Vg/fsWQEqzTcNYQbkn34m8LimzdH1kV9Q4=
X-Received: by 2002:a05:7301:1c99:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-361a02b6dfamr10734323eec.1.1792341948734; Sun, 18 Oct 2026
 09:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018163719.81691-1-ojeda@kernel.org>
In-Reply-To: <20261018163719.81691-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Oct 2026 18:45:36 +0200
X-Gm-Features: AclHuK-IVlxiwyPmjYT3Tt3VR7rUJ4jd9dZdNoJBNKLdaTx_K8cRCnx26TODSAQ
Message-ID: <CANiq72mMpqFFkS9DQJonCZ=-0ck43SNKPXUPMpAtQrQiezjYOA@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: fix `undocumented_unsafe_blocks` in `PolicyCpu::from_cpu()`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:37=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> +        let ptr =3D NonNull::new(
> +            // SAFETY: It is safe to call `cpufreq_cpu_get` for any vali=
d CPU.
> +            unsafe { bindings::cpufreq_cpu_get(u32::from(cpu)) },
> +        )
> +        .ok_or(ENODEV)?;

The other option is to split the statements in two, which probably
looks better, but this shows how to do it without changing the shape
of the code.

Cheers,
Miguel
