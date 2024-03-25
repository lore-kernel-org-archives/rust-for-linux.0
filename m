Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C325C60D
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389251; cv=none; b=LiSXh2uwwcTJXvS/w2dazC7GBFXXLAO3fF7HCg3U+OM9cFvfY8T0zqGSmAZqFqDvImmADoeLDMkM7RANl+CtdqyqGPZyiUXNIElstsScv9ZtxSO/0h1327BSPhmFUix0lt2k7csYUzqdOtR3BkpY8o+6HzRVJpBaXZPnIi64FRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389251; c=relaxed/simple;
	bh=fgZvoquGCtz/OgHzyRt0onRyyNEQG3EL61cVwPnMwCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eti3WBb/wWIFkxlg8A75wLATPolIYUZjkv5d8d70XBwAQ32jPHJ1jA18Cs4lIJ+gm3TVsMrSvTUe7fqZaUSY154AF01exOHNWPX+fcQ7N01YNWyuah50G7UdavYoAzDPzbqgg7k/CRk/1uiPmaIgPR6pz7z/kivyx6Pz6HBIf08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBFIopQT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBFIopQT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6aaa2f02cso2838662b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389249; x=1711994049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgZvoquGCtz/OgHzyRt0onRyyNEQG3EL61cVwPnMwCA=;
        b=NBFIopQTDPDwTibX25RY4Q7P47A2Ek91Uu23bcZ+VWg/KZg6LsDGAkYtS20zoJcldJ
         r5Op4HKOei2sJrjIvqB6UAS9JtygjiO4/9eVb606OaLh+gZCCigmT0dAPyjkcNcDUUQo
         9s9LMX46T0CbhCJ/s9z5TDfmtC3uI0XPhzJ4KMveQTMWB/i60W6G8GaifnequlpwY3Zn
         FQMAqY1fUn7dQBmk4BFrAljpQpvx/ull+wy2D4ZC70389Ffo3qaXcANYtNWyIMt0qXNf
         NC8Na4QfyO0Bvog715grhun2MvdrU8bNMxrsbfDNNiXGFpTPaa8j6f6GKwy8YPzS3yJQ
         6pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389249; x=1711994049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgZvoquGCtz/OgHzyRt0onRyyNEQG3EL61cVwPnMwCA=;
        b=KQtwBdh7loNXNmycr4JX3fFHVSJQULrAOecbJWsWYdd5Gz24Aql23zhaUG3+O9SHdS
         6mcJNILhdjUPFfdiiXRwfihbDNzmn8bxaNHYd/WB2AdYZ96DnQUy66xYBq866Xc8QbjZ
         0cTIrBIqORXeL5+Z5zTK3bV5Zy4GhpevyfNgW1KFYqf4tgE71TTqdGQLSlEfb386eNXN
         rwmHSILrmVU2W/Fe+MhTbDSzKb84B7g5Xdvj+iJaphLLSR4dY3m8+Lhk9Qdnvay71Kd+
         2ze3Ar+soLidIfJolkjfJO/Og0c4H1z5XEQ86P/Z8/yyoY+dTOj7mQyglS+l9hARNmwG
         /5Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWlTPJ7pnndX4wh0uYnXtXjh+5DMq9ybgSpajD25rv7v5tWg1zyVYsRaWDA2Km7+QlrEzwW3xr95q5G2KqXAyy9EYcDkZYAZc7pEO2gYVM=
X-Gm-Message-State: AOJu0YyRm78y1fWW8/v7UN1Rl1Zvfrlgo46byj3fR8JMnKjqK8XJaHvR
	Z/T1a1Hw4jyQnQDFvoEGwgLB1pSJ1pl1LJITg1yWfPt2l6Op3EeojHS6qJX4ubJGaoUuKABnGA1
	9LSHODnMQmN/DYzk6DvRYbtjTWm4=
X-Google-Smtp-Source: AGHT+IEBa8Iw+h8+uYQFUw2DBWSiEN9ifFRViJy9vSPNge7vP4Cd7VKRGZLXr1M/VzGCzfxOLT+ydIS9yjZyWhrDDhI=
X-Received: by 2002:a05:6a20:b96:b0:1a3:6a7c:fca5 with SMTP id
 i22-20020a056a200b9600b001a36a7cfca5mr5898591pzh.52.1711389249199; Mon, 25
 Mar 2024 10:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-2-dakr@redhat.com>
In-Reply-To: <20240325174924.95899-2-dakr@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Mar 2024 18:53:40 +0100
Message-ID: <CANiq72n+ufjp3HfDQKqFdbzv1_WErH+oYLF=g9gW6DYG0XAy8g@mail.gmail.com>
Subject: Re: [PATCH 1/8] arch: x86: tools: increase symbol name size
To: Danilo Krummrich <dakr@redhat.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:49=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> Increase the symbol name size as the Rust compiler seems to generate
> symbol names exceeding the previous buffer size of 256.
>
> arch/x86/tools/insn_decoder_test: error: malformed line 2486512:
> 77620
> make[2]: *** [arch/x86/tools/Makefile:26: posttest] Error 3
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

For reference, this is
https://lore.kernel.org/rust-for-linux/320c4dba-9919-404b-8a26-a8af16be1845=
@app.fastmail.com/

(I repeat the comment in the resend here too so that it is clearer)

Cheers,
Miguel
