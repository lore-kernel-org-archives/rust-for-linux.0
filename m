Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F1202960
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741092772; cv=none; b=sPZuO9jRDuMtJx0zOByAcMzHCxrZ3d4hP13AB70h8pMa3LYothscrw4+rV54QBT9sTe7OOPCqVTSXbmY1YwlAr1CbpDjpT3AIUrtec0wfBbKatdQkZqWpvtBfoOSt3QioRX7x1bW7rbaoeMWZHFGdxcoRc84zD53dbS8VlUXYQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741092772; c=relaxed/simple;
	bh=ALWRKSn7pxndeFLCSOuIBaCpYtG4Dadln+BoUEbDQyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oikx3Y3aGJnbK1BcWbzpd7TxgapXpjz5QpKyOS2leeJ+pqBVCW45rP/s0Ifv268YFQCYyQ6Fo0GcBMqrtQ95HHn01kJTA9raNqMRKS6YXruVhHNM2LF1Sao/AJusG0iSgW6pzFFtrs3E/0e6zL1Qf68YFaTrLVkY8EAovzy6VtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LcYabeHE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LcYabeHE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bcc85ba13so4838925e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 04:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741092769; x=1741697569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6F1Vqzh2iiYxExSW2EazjOovfAMhC+8b5qQWzgilmg=;
        b=LcYabeHEcnd/6ga87Sx/3hSMdsWII/z++rnpanwRgXk3zcc69QWe75zd+tHdk/7p3i
         sPV6xlS9ODiwLLgjA+gUoQLjzct0b4TKx0RVqZaJzbjmrphhVCn9FZuC8YtQTLdhUqdD
         JBx3Nxik7yFtuPFmJgufg2Y05tct8KhIg/J2DzE2Q1IUUgU3ZjLMJ9JSIhS5dtcQekwJ
         2wKiKhrz25FG8i9M4cSmZTgDeukCcFP/xQjj/DDvd3oAEgb7St5qK0CTDqcwgrgHnfA4
         9AcoSw5DMBO7GARIAI1AValgR/qCpBXrUWihTFcGr8t/0B6sycgWrR3cbdvxrOCoRqMH
         xpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741092769; x=1741697569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6F1Vqzh2iiYxExSW2EazjOovfAMhC+8b5qQWzgilmg=;
        b=uDVsa0DcKgNOkAFDtT/YcTpB60bFntCfDSr0oAEVC9VqIzWJ6uM4ajtHj6/DEGEIkf
         Xr1+OwltLSCbsYDLlm582NTxKYJanegzwbxyaICD35Euh6ECk7Ay+228vcp2RgAJOKDv
         uWeEqeKA+xVefZVXemItJz36ZCmyr5RGqMxGpOHJHK0RpDEtTSIOxv2MpPyL+VA1X6Cr
         cKOpkpNiKqodYowTJ3pIr9GLlxjGJ2Uix2pDninM8QiOjRW0yAnbpPhNG5rL2RQ5E2q1
         N1kJayFjmRs4p5W8SLdAMb4fiJv5ep4SyMKP+ilq06Upagqlo4x4rDDjaY+ida6TvA8U
         +XpA==
X-Forwarded-Encrypted: i=1; AJvYcCVhH3x0Ko6fjB5GF0AeQLn/edO4w4US5aEI1Awy4jVFlN0uYtkahnNkDGzxrvQmRs5MmQNyny40pwDUe+il6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOvpUUJE1MRE51UMCONE37rnTNWLGmnE07Fsi9dKIYvEAhm7sE
	7ZXMx/B+tYeiv+q8FBOMcnBn/NpoisRL1B0NTTK3I62CyFzJ70nMcANYP6ECkxjeMYoiz5qd/xn
	VrIhj/PJW36o4Z9K7W0aI5/XFQ8yyzft3Jlyg
X-Gm-Gg: ASbGnctB93dGG+8SaRTL3LFkANzeV6TyW+9prpGbaSarcKTMXdxPnIekSzjhS5cNAg4
	9pr74bti+Mld1cXbbCEmyD5h9BSsWPL3cOPwx4/BvdTGutaC0PVwJ7YLbvKfgqTbr/vUGxA1gyu
	/U8A1cSNYWN7y0TYR7QIO3tyckEh7v24XyN5oJ6hp0dbg4cUAJaS7UokA=
X-Google-Smtp-Source: AGHT+IFz0XZWemVYrwSqVdPFNHTago/cSo3IMoNalbeFzohYR2RyW1OejnNhIa8IQnj2+uMzuaWcUi6z4VKcxHbpjOI=
X-Received: by 2002:a05:600c:a594:b0:43b:cd15:2ec6 with SMTP id
 5b1f17b1804b1-43bcd15341cmr15395105e9.14.1741092769040; Tue, 04 Mar 2025
 04:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250223174205.48404-1-trintaeoitogc@gmail.com> <20250223174205.48404-2-trintaeoitogc@gmail.com>
In-Reply-To: <20250223174205.48404-2-trintaeoitogc@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Mar 2025 13:52:37 +0100
X-Gm-Features: AQ5f1JoeBO3HU2bge1uvQlyWGWT1s_dV6Cf8tHwBQjm5wZuGAhS_S5rJjhk3_sE
Message-ID: <CAH5fLgjDt0aDw6RwCVixsJZGJRi2-_ygOs+CPHGE-pvJVVHhcA@mail.gmail.com>
Subject: Re: [PATCH V6 1/2] rust: module: change author to an array
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, apw@canonical.com, 
	arnd@arndb.de, aswinunni01@gmail.com, axboe@kernel.dk, benno.lossin@proton.me, 
	bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, dwaipayanray1@gmail.com, ethan.twardy@gmail.com, 
	fujita.tomonori@gmail.com, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joe@perches.com, lukas.bulwahn@gmail.com, ojeda@kernel.org, 
	pbonzini@redhat.com, tmgross@umich.edu, walmeida@microsoft.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 6:42=E2=80=AFPM Guilherme Giacomo Simoes
<trintaeoitogc@gmail.com> wrote:
>
> In the module! macro, the author field is currently of type String.
> Since modules can have multiple authors, this limitation prevents
> specifying more than one.
> Change the author field to Option<Vec<String>> to allow creating modules
> with multiple authors. Additionally, rename the field from author to
> authors to make it explicit that it can refer to multiple authors.  In
> modules that use the author field, update its value to an array of
> strings, and also rename it from author to authors.
>
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/244
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
