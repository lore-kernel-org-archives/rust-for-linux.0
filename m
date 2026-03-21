Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B93261B98
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105422; cv=pass; b=RzaYpGYG86RsSmR0dw8uJdrVxalrc8pJ3Gd1M07TNJPFSSrhGkWcEJwNwHZhA0GGMqnMAHku5hqil/HIwtjDZIkiVfIgeYwaQUQYcXbTbdWKF3HnV6JdbLVoZxl0RJqzgWvo2HQMclXWE1QR8yuPbmgUAK0q1Tt/Z5SLUbfPP5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105422; c=relaxed/simple;
	bh=ucO0y1q7MG/iWCmErUhGurBrhiHi/90k+hcQ7EeukC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9Ofnaqm8tm/cYZj8PTpz0gNJ/gvBeHhNf3TW+796e1/wq6T3j/eKs6AcRaAsM82dYaJLvPtUXE8ZiI5mV287+1QTcb96AjiE4Xt3W8sHMaVvKSDc9TqkLG509II8GJ9MKf8CxAm+BGPulbOWj7tLoAOPnL/DT3JNBaPdxX08dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDL9dgrY; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDL9dgrY"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12736a0147cso244996c88.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 08:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774105421; cv=none;
        d=google.com; s=arc-20240605;
        b=PnY5VWcHSxpBqNcZUT2g383BJqKacfrZ8apPWk14TGnDsheue2NekHI3Ind7UnXZzv
         euOVq25gQn9+83XXpVUqJgqpbouHKDI47PX8UGWZfSJNVsReQRWNDcaxgV3Pl+38bYLx
         L5O3dlm9xy0DYC2zskbFf/8dEkEP9gupe75C/FBxZpPggnoGkjig0d9mGIh9IobYIwGE
         xf46rh8LOfSL0jePw2ff6KljsRGcDgmAZPTtJCGpP4Niqx0TBTEwZP6C5h5LrBF4LW2R
         aA04kaUO/H9EgAjBH5y/whOi6UYVcUDDSekXLszfx2HmU8Uug0Nhm9cha0l8T1b9Hd0U
         WBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucO0y1q7MG/iWCmErUhGurBrhiHi/90k+hcQ7EeukC0=;
        fh=moDLXSOOtMiXBWecI/AALxHRzNAxSioWH5ofkJSPrUE=;
        b=Ls+b4kyTPFba1r68lZEPFQRChcLKSG4dbHAsnhbEEmS4ZDyh947iBJqI9vHUxMxyg4
         Ndfq08N27bwXaMukLohWupXzXCD1Vk9ec36oyA19uGQMFEY0TNLzySGGCWo+CSCCK0i7
         XODa2vu9BvjffycPgoCAAlYQ7OqhspsREiH0ixvrYXr4HU51Y3sdj2P75rWmuKBpzGKd
         KYXEoqfAQ4XRrTVYGLBH1ZC3c7+vs2ApbW2Uli0L3ilrp17SkBKPxygmSIE8w1U82ITD
         8q1TXHrQSV7k7kvDQr9D6GNe7JpuYmMFaiyxl1eG7ySjBatoG5b4iw0yXyIJAVDMoORj
         U3gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774105421; x=1774710221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucO0y1q7MG/iWCmErUhGurBrhiHi/90k+hcQ7EeukC0=;
        b=kDL9dgrYHwKEyaRrd+d5+lqUntzRbNwcvGj7HDmbAxjXZBs1N5z2HMa3EdYfMZXCA/
         F/5yW86ZIjjXeD589p25QEJXAU4rOdKvQsYsHF+ug+cHhztBVf/UspiSoGzGWmuRdndm
         RedtOW9GQ0zqcvuTitJBDGikqUpA0faWvCZSn18c5coiW/o0atsjFFFoVdPrE0z6Ik1W
         tpFTehc/FjSZw0CgLv8EFBgy3zIwceJiwt/UYXFUAAJvuNmZFcXXTG9y1YfALNy3eJjt
         fogHmBc6hedyvGVBU6eYhJfI9Utw7CGj1Xsyed42yzN8woCLxLiVGWebyeJtPqzV7Et3
         Xmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774105421; x=1774710221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucO0y1q7MG/iWCmErUhGurBrhiHi/90k+hcQ7EeukC0=;
        b=hW3YN/qrYrmMJGhJxOnED4eV58yO7UxIk3ALItOybMu6NEGDG0e8hSCtFiOBSKOuAt
         PzhyifFXiCCC0pe9zfeEcl15QMXSJ2VGUBDdaI+6pCy2lY/hmC8+2LeKn/FDEW4SETi0
         8GfvGns58om2Mf2WCpZfmrfAjxJ1B5SaRsxu0i0lZXlQGUqDByE3uaJCINnlM2PzKjHv
         ef0gANlb7A5z08dd1AEariDn2I+N25GgnKT5gvRbHh7BnkqtJUab3TpXZbXLRoVvf8fQ
         kOTkMeCINixHA7G0ArEBNijtxe15f3WPEKvCa+Dt5RFoJU5RVwpC7TenIgvMeM8tEgsu
         iumA==
X-Forwarded-Encrypted: i=1; AJvYcCU6jvK/txLpuetlM7x49rRJ0J4AcReQPvBiG9Iyl9naBcchIxBjBAoSQ37ksPt0BVuB7xrQ6hgAA+Ub6FSVCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxog6lcYID5x31MI4LASboRJT9DhHrXbXvB+4QQRWIhltpzsQpT
	DPm3UnB5i6jQJ679LiTKb8F5E2n6GmrcOwIsBfO0OBIz0ZcdKsTorrCz2cS3Mu3FUdZ+7Fi1kVj
	YWfOzjcCBEhmJNrUtcyTP8w0dBB+mb8Q=
X-Gm-Gg: ATEYQzyUgENvv0fYVBJFzIMd2KBp2oRCweq7l7GMaLZ9VRKcUCD27DkgEpSkBDHPTiI
	0MTJ1sGpRp7BBF5Ui6hsZgjlnJXX49gqBWvYPNcac0g/cT5v9kemfYsWbFdSPUOtD2soSBfeKcS
	tKVDoaOyfJtlw4esKu21w45+ZUluPo/FsLt4hYUXnkE/EV41K5/ARPclXwiiqkpNp0hj2bmkTik
	JzgttmTwqYX8FnQ21IQ3XNpGbszGbqHCIfHMNUFMw7UdFUxswXBXkPW8JuUutXT8CSXRZUZUPqb
	ghjHZzIprZYil45L7m8+TBlKLvnKp/PWi+xZZx1C0WCXimwWeVZ6crda93G0xDHKknrDwy3Tolp
	rKRNnXWSuj9LguvsCEJaUncA=
X-Received: by 2002:a05:7022:792:b0:127:3480:7ca5 with SMTP id
 a92af1059eb24-12a726513cfmr1588676c88.2.1774105420874; Sat, 21 Mar 2026
 08:03:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com> <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org>
In-Reply-To: <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Mar 2026 16:03:28 +0100
X-Gm-Features: AaiRm52lxzUk0_iCcIFX3-uHQqZ_28CgqK_qR7We3jIMceDCHvhnu1d2ud_6c3s
Message-ID: <CANiq72mqpGk9DAjkt+Ohhw9K2xQChKtUQXPM8iucfokbYT_uTg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 12:43=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Alice has resent this over the past three cycles, but it hasn't been pick=
ed up
> yet. Please let me know if there are any concerns -- otherwise, I plan to=
 take
> it through the drm-rust tree in a few days.

+1, it will keep accumulating changes otherwise. Alice asked me about
this one too; I can pick it up if needed too.

Cheers,
Miguel
