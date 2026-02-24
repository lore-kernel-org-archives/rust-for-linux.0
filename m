Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD3F27510B
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954245; cv=pass; b=SYe+pDSM3aoEAd54wOt6RrgkgXCS2NFBtYV1pVmzWQF8gQB60MGKD7HXyudWJUMma4NXjcVXw+rTr8yNFmh+YZLD7KirdQmk7cylOD4DO1gXy5PMK9cXjidoRfAyKHdmC7uo85kdYkhNzpSCvyboXfNBPSjeXPeTlIOzzOOitn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954245; c=relaxed/simple;
	bh=hc85fxZzUnttApa9NdPqidKuo7OpFu7Ke4r3j7ibou0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upcHtlEBycvjlBkB+XJFWPwpyez+ALNTFY+LVyKSJ410riAkNjCfbNKREQDzlYAfeLJab+QUie7bO26IRS5kA3JgM3fEGOsP44QE40Kowow7B+C7/Vp8+qjpNjzwwt+JrW4LkJxE6vlC9aFV6NaPddxeqq8qKJF1JhoYzZk2Jxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYrtXvml; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYrtXvml"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1273882d901so322034c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 09:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771954242; cv=none;
        d=google.com; s=arc-20240605;
        b=cEcJCP/NWr4i2y8p0Q6Il9o6njQW/7iciKWbzx1Ry1F5E1CgQ/vaSAKn167HKwvBFh
         +xdnZ2PmKnNvdTr2f+8pi66OcZwwNvJY2qjH8E5mUOzH+ZIuEbYrKAMSZvfscnr4zzX8
         Ima0kpEWBDyjCc/8P2EM/3+E3d7Bac1VYBih15/qcWo8Oelh5DxLlheUnfE9iFotAxkm
         rO+ftCYEsp251ScK0oqHv+mzV6YnZTMPJwemEOOo9F/SHKqqPaUg7wy/FLyC4SkJAxw4
         fZj07IH5GPJFnMVIVoRTJX+f4aLMwtS4ZE+8yV00ru0h/Lhq+wOih2tdQx08GoZYMITt
         mojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/a2JzYiJi8j5HoSY10XGkri0uRla1KOV5s6Jt2sDeKc=;
        fh=+vIjwgur3UPzmZ9+hGN14uA+FJXt3qKeDDGlxsVbYk4=;
        b=k22DtyNT6/9tuShOaeiTjSdZsY22ViVeZHpUyHhFIQ7ZxFMrKoaUGqdvXw+187KzTy
         scnNyQdPE5wXDnG5RUVby09pu4z0akbWERSingKxG51vpXD45lPypfmc/a7N+7bvnkt1
         j/SwMrUF4boBsYEEOc9quQj4q0Yb3KFBaw9Xh6H5Y24uGzgL6k+UlEDshmBntpsAeqHf
         bFwwsQ5CyC7ZEPEWLESx/aw4AUlcEnjdTpsgcsO5u+vdi+lEgbNTS6CLeR+N745UhGad
         sEk6p4wp62gD2RHbeHUd2Gq+4RY/YinBajlWsbpDevTOQ45QDieOekkArEIAukjJ8jQt
         +ZJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771954242; x=1772559042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/a2JzYiJi8j5HoSY10XGkri0uRla1KOV5s6Jt2sDeKc=;
        b=dYrtXvmllkmoLysm/oDiUs7iayO+Xg+2zkfDp0xYblix6Yi6qit6GIct+8j0V0Azck
         TmCtTbz9aSJUShm3gl/8nL2nuORAjuBDg96zJDzgR3BST0QBSdSYTEYiBfgH/v6cSHK+
         ejId2JaTetiP0WxUFIpedEvlFsurvl4NfF8rMWl9yPpjpe6nNXfXfl/2zOkXB8xKbFNM
         xnMGfPT16JEbJ/VrRYKxKJjU612uhXRHRUQlh6JUYvR7aEm0jDbKTRv8e5yGnNVsNVjP
         MBfmsD9caQAomWSnHlOrhvqcAV2JVNaCx0Tb5GUYk6lv3BbkcoqQPFxoIzxXENdl0B8I
         YQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771954242; x=1772559042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/a2JzYiJi8j5HoSY10XGkri0uRla1KOV5s6Jt2sDeKc=;
        b=DHxVS0QlUqh5s23ne0yQbeBBzOKIgRHgpnqNBQKUOhicfHX7IylULdRTaQJiog8DoX
         L91q+B52YCjUXk6UauaPCfYXY1lFkedIIShdLDur4faMZ/ore0mQSqJId8GdyMbcuMm/
         1x1WPsG/TU4md6nhXH+2pxjO2dWVo2FK6K+hA+rcU29PHZvgelzU3IwmKGlxR+YUEMWF
         2oL2vn48pvX3CIJBmS/jDtF4weLEtGcZWAXTgMDvubcheu795ObqKJDBqOqbQuqezI5V
         +gzW/0mGCyYNKVJ/i5moSLVaJW7DfQwMdMKxvrQm7dI4AqgWcqHBK74Lvwo57jQ8fGTs
         n5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVs8hZtW6KJ5hdAvoPkVZncRFirBNrk+hb+pWLIYaZ+1SKH0OIBJiJdttwdW/7LQ9aLpseadUBlrHW+zW13w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dU1GL+jOLdQ4tDEa8nN14uIIySTGpty41+HEG1RAJa+9VWck
	CO3dpH8F9Sd9C9qq/YTyS4lOINJdYD4OwW+gM+JLOpzZ4bKuLXK1j1p3fEpssVc9VpYrarOaPJa
	28haYcujsN6OMqJJXHss1lrxKUizOhv8=
X-Gm-Gg: ATEYQzz8V+m2L2uqhF16vOnDdBtXjCWCAmJxoekoOq8r2fUqXc0JBWvWlmRbx3CbS2X
	/ZdR24xIKMnJ5YJo3a2tuUjI9mbFPSLBXOqPtN/oH/tLyAMbr4pCvfRgYELshjVMQwR6Z+yEY1z
	iIeSVx0MBaJPqelFIe8oIt4mOqMiYo4Q/n7BHs/qBNYEbFzVaexFJhh1TiwmCAL9y7I5Np5Fls9
	Abwzlqq46NFucRYaBAGA4y/f34tICChCBFRA/Avj6Wle081FYyI77C3mxmF+5MLPnVzIVdGZDbq
	xeUEjUI02yEa6HWHRacB+2S5Ltb/q7DW9rXQaHmzQQY3Bs1BnbR9jMgzrusMWX+iF9z0CdlSWAI
	whg7EzrL3R9nSeV35Zqjm6qz/x+Js
X-Received: by 2002:a05:7301:3e09:b0:2ba:7d2c:1468 with SMTP id
 5a478bee46e88-2bd7bdb1e3cmr2638165eec.8.1771954242093; Tue, 24 Feb 2026
 09:30:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325184309.97170-1-ojeda@kernel.org>
In-Reply-To: <20250325184309.97170-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 18:30:29 +0100
X-Gm-Features: AaiRm51wD0fuBi0zdmWx-qM10gH2hHg8jiZcmf3ERejosyAQoJRqHDpNFa-s4Vs
Message-ID: <CANiq72=MT5V_rNDBTW4UY3g6vuZ1TQA1pk3kLERg1auDHYsGsA@mail.gmail.com>
Subject: Re: [PATCH] rust: workaround `bindgen` issue with forward references
 to `enum` types
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 7:43=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `bindgen` currently generates the wrong type for an `enum` when there
> is a forward reference to it. For instance:
>
>     enum E;
>     enum E { A };
>
> generates:
>
>     pub const E_A: E =3D 0;
>     pub type E =3D i32;
>
> instead of the expected:
>
>     pub const E_A: E =3D 0;
>     pub type E =3D ffi::c_uint;
>
> The issue was reported to upstream `bindgen` [1].

This should be fixed now in:

  https://github.com/rust-lang/rust-bindgen/pull/3346

So we will likely have it in bindgen 0.73.0. Thus, after a couple
years or so, we should be able to remove the workaround.

Cheers,
Miguel
