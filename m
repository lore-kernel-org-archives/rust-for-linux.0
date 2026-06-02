Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CE2F7F0B
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422766; cv=pass; b=ssxWomMwVGnjV7ADpNRMGO+ffIjfs+5/jyMh7BiPqjumBuzECDGl2hCPKDq7AmTxAaUi5fmNPhvIY3Kgxr5j+gJbr/JH667o6gWE9Wp5032Uik9my6JHdIsS4YncS3mo5tHws8OYzbUjv2IV5XchTJKyM+zwe+NgS5sRrHQSx+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422766; c=relaxed/simple;
	bh=CSjbsG1fL/PgbsG1N0Mtjl/zPUSdMXGU2WzSOKo2J7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNs+MSXkVEesddysB6H7UVM3d+kk8GrZfRcCVO5IG2OcIROgb66WN5x4rlrNz/nygDmJCkiXtKyxlJr/AOzu2vR43IqW62ylr8VvuH6n52RCygjZPtJx6QNSKn0U5L/NLYcq247cAcrG+qI7/G+uI3sQe8SrCJPxKGtXslULTgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7Ls5Fbo; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7Ls5Fbo"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304d4e57d33so420324eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 10:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780422765; cv=none;
        d=google.com; s=arc-20240605;
        b=Mcv2G/PUpVzxn9O3mQ/4aqR3ccfZGsiVcDu2F5kKhtZSftDChhjjO8h4sAMNzJMqiz
         g9KpTpsciFI1FixX97jGH+xk5vmPA7yK9XcHslDAEt4XEoV0hFeu3Cg+miogtRMRfHCz
         AWKh7cK7AnrwFZlHdmozrrixpqPtBxTydmPjQMTXAtcKQnYfIv+hIiydPfhkwLtUaMlg
         rk6hndBSu0IIgLgjBSkhUIuT1IsYxzAXQVlDSErCOIRaR4T9PghLOVGEBWjtukcL0JD1
         41cmojROhnsG5JalrrjNnLEKKbH7Gz01ylTTuB+FGyPM+27Xf4RdSmvBrr0c/QGFRTH1
         hUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SlN2MYt/Xq58i+3PbQ5jhol0T2l5a8oP24lTOtS8Zn8=;
        fh=qzy8sqEvChz72TjeL1NBze85rGbq9dXUvnX3OQDI0Nw=;
        b=dMuyGT/CG1SwBXr9YYlEQg7Wyj+uupScZc3PlhPhqNKItKITN+7sYoDKbkhvdgl/fI
         CembkXEjT7Wz8jSv7WoPUptIDvEGsz9wtpJynHKz8euyKm+rBVALerSbqM4j+u2NcuBM
         45dSvVpGBpVqdbcTFNSVH9NTos3VQF7snDBs7Q+swTSjvT+dJeal8T6KYCruFWdwTIo+
         hM8OMrKixXF1rGqNiFRY3AiEOr2PdV8mv7mFUZo61htomCSTNqVvjgYQNTaZ7VOvpBmp
         4Tdlnrdy6RCmLcpLrY1ajLM1ZnREU2XZfzwN4iNn6zYVBUVTvxAgiu7FRSBnqc+6fEth
         heFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422765; x=1781027565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlN2MYt/Xq58i+3PbQ5jhol0T2l5a8oP24lTOtS8Zn8=;
        b=D7Ls5Fbo1sjkCE8xCNBaobRcIAtQFkmJWJEhRt/h0zMKuSl33fnr7J7GloFATmEZOA
         kauJsEvIK4mz2G+XEbtFbQJSfLwX2gcdJvBFprqDjtJkPmXY8b9lmUP1mvxoCS3lioOz
         PWlqZnfpC8NapLe1OyOYdcYvMvcc431uTswK4sXsIUyacvlUpiYJoLtpZNuFHA1JGJYK
         vvJRt+06cKHWg3CalVkE/VfBrTIyocqbwxM6jqMLCrxwBJbrt6h0BJXD7uLON7PsyhLM
         zKv07JdHQJX66qYvk4MwK5oCfIhaVK+9rMiHsoEpCWizY6UzrZfsmY3hj3B/+OHZD2S1
         /+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422765; x=1781027565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SlN2MYt/Xq58i+3PbQ5jhol0T2l5a8oP24lTOtS8Zn8=;
        b=Z4CACKsD2a8eMNHTDyrfIvdQZukZgdsSt4/LA1oE0CltTiWrBOTFInHKaNwV83L8hD
         qyaixt6iZjtcGjiKJ0trmBAesGyYKAPXqb/yxGSjkyUyplYeBgeuasu5+N8E1csh8JZO
         D885RbzEksHmJN/Vm1K3SjbSin6l9nt0cylSWP44w9ZkaLaUfH0MGUvE+hU6gK2CGjY6
         XTEkoAJo5FKoiZj+yMxxtE574keoVAvhIZm/kPFZ3Sm6Way8mvQPk3xtn19Iday2+GKn
         OJVyi6CJO7+eLivEYs0Ih3uX23kxApI2AUjz8rjqlx+jA4js+i2p3jxhAnH1NBDYnHEQ
         a5wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YbPXquG/lSQOajrfEpIe8ARVG4XwrCZ5iIeSSZztZwP75QId0ZXL4vDnRpOZhAzz+rBaCZI91TDrw7YXXyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrcxqvh9kUAMYXLDXlZARey3f4vrZanLY/HIsITCusKphzUkr8
	hW5e3ivowtvE1xi7DVFlBrEPKiFfC3rn17PT/LoSlSDsL57DxMF7tazCUKSbkPnJCZD8rcC8FJT
	lNB1+OzqO2jiVpFVC0uGJh9qFzODU+5M=
X-Gm-Gg: Acq92OGqDX85VezSns/lXSYALPHiXFpgPu8hElc95LLDq6RcMUWpSAPGQ1zd+gZMKgz
	+5awFTJEBiZxUQZxCxCTqWlXUJ7oKb4BGTByUrYYOEvn75osGKqe/wA9NFtSVGbq5hE4xFXVLme
	iCPaNF6ZlJYlmesCoOpWlO58D+M8d9BaCsum57gwLHtLiFIjtRfMlVUqeB7QntbLvinGDGCQ16J
	qmA8+/64HigRXLmO8+ziAe+/8eG3B8kA6dfRWr8lGdJ6DuLsQTqutlMV7HZwpmLca49KhGBoAtM
	hKZd4p1vGl/v71GWTfPq1GDyF+8pimORSuwrS/In1xzPd+EtgLmPRXlObyAdOe++6iXFVWKl3QK
	HRJF/I9drzZyC1j+kn8N3g2x35DFOlnS151TvSJy9iVdv
X-Received: by 2002:a05:693c:2d83:b0:304:9b4b:3b9 with SMTP id
 5a478bee46e88-3073604172cmr1269109eec.6.1780422764866; Tue, 02 Jun 2026
 10:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-2-ojeda@kernel.org>
 <CAJ-ks9m-Gt3qiBRMq7HiMDjRVHmyL7wrsm+3JHOoPFC2Lz2BDQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9m-Gt3qiBRMq7HiMDjRVHmyL7wrsm+3JHOoPFC2Lz2BDQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 19:52:29 +0200
X-Gm-Features: AVHnY4IAHuSd4UweE0a1If4wlViuevvCPjqmPviNlQB9eP7vMw3AbUe9EB3DRbY
Message-ID: <CANiq72=+f_139RtP37FSHkZ+9wuATgf-9KzvSUfwqO949iqT5w@mail.gmail.com>
Subject: Re: [PATCH 01/18] scripts: generate_rust_analyzer: support passing
 env vars
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 7:47=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> This can be
>
> crate_env =3D {
>   "RUST_MODFILE": "This is only for rust-analyzer",
>   **crates_envs.get(display_name, {}),
> }

Sounds good.

> Acked-by: Tamir Duberstein <tamird@kernel.org>
>
> Did you want to take this through rust or did you want me to pick it?

It is cleaner to carry it with the series (I will likely create a
merge commit for the patch series anyway, since it is a major one in
volume at least).

Unless you need it through `rust-analyzer-next` for some reason, of
course (but still it should land in the same cycle; otherwise, it
would be broken for folks later on).

Thanks for the quick reply!

Cheers,
Miguel
