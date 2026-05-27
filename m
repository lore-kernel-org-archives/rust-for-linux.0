Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3AA32F765
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895654; cv=pass; b=s+qDS0AWEiLJFM/UOP9yjj6C1Y8FHs1/mL8bOwjM+xFn/Zp9P0969eHnupDr3SLCgVgfVVxd+zkjetkk22L/YKeWq38wUy5IlVHiwy2OmUT5VAV8KGjKosaT91LA+Xna7ZowYv14/6Ht6ZbSMhl0ibykqtbK+OESeDzeOvHxsd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895654; c=relaxed/simple;
	bh=9TvJ9uuLIEORK+dGCmLuVAVGVIJIAY8t1AoduDJOjFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ot29bYiwl4vJY3Q3PTohk78uT086w9+04yVo520yfpS4wArxJQaIELHSJlBj+en35nwMxxDF7nhJ4ndVuRFGdKPwAk3F6syDY+UQIE9B8/uBzr9vEAX3lJMZVcvFK/XuPW4lE4QovbvWTADHaftwlIPQZ7+ToyM6xyl0mDi+Oc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejJsU2A5; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejJsU2A5"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f13ae64db1so852152eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 08:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779895652; cv=none;
        d=google.com; s=arc-20240605;
        b=Sa3muBJNU8iUqrGtYDaG120W9EwrYqSPs4RlT8Em8pQ2jbL7lthpsbr3KFkYGKqb4b
         Wf9XnewDPNabGeeXoTUsC82OQRLzzn3xWJVQDHQmy7PWaq2BXz1lXc04HpsWcDzhc30b
         iSAwfCwFQe3W/EvJg/QBI/ctKzNx0bghqm8sFe1PDu+5KXxm6ge8MJoordtbysHnEHIT
         PD2HYZLqUtfUY9rIBF5kxcwWZBclB9L6S14DOJowklCRnmFFGlHCq/QMyxCllb/D8tFT
         0f8y4LklSib4v75EXe66lSJ4Usu0MuHRl/Ite8eZN47i4XCamr4nQArc1Zw4BdhLFjYZ
         tezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H4P3b21yApXuHT68EyOUNlmIwsJgC7TFNvxT82mSZVg=;
        fh=o5xlpYi0dhvpVx/2q1HJFdBe7TikFvZqsK9m29bKBZ8=;
        b=Wwp/+gDKRZX/JXdj1qVogyxMjheC/jWV7O/B57Zr53XUnsvMLKbQGrb8mYo7wJV7jA
         rvOJwB4DywLtdV5DBDgBVm5FSLlbLRYdhhc/ZSdHn/KAUwzpijD1tRVr3DcaisQJktBq
         X7yuLBCmDeEhK/xPYB6G+jYtL/Z+Frm+BaiLhYCuBzEkZqv8adeqb2bh3mty280jGX/m
         z5BQJqZ9wfscB3DaHiZPVhSosQmyh9vRrw+YsgcVnqKXBixJCXxzvbO8SCwEmJUV/2j3
         QAiRzGvlDXsqHV2FPEYm405ui7v1ap9H/swK8VJ2dZENziRD1NsjQn8RlkrNVRkBmm4b
         6J3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779895652; x=1780500452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4P3b21yApXuHT68EyOUNlmIwsJgC7TFNvxT82mSZVg=;
        b=ejJsU2A5ruXthGorTDCaeiKmFgUCJKoAvESagGRl3UyEw62i7vzDKgLoxbAiBG1ukk
         bOll30cqmpK2d4dVfbuXCCJLC4nO6xg+SKPjNWy7MnqcnI6EirC0eGqDC7Pxa94JN1Hn
         lIqFjsou2jlMC+335iB97atWPTOiQoDKPtuafbkeIfqfza6CrayuxFkEOwVYgxlLqQ4O
         WsjL97tQy6w+wqIowzNamnDf7v96h0wpLkRe8xnLpEkVbeDiC4NTeBa72XLJ0YsuXkIr
         xYb/XfTzWDTGnexJ2U0bQ/wNAvDh2PxQ65Ac75WMeRRaIBdsqSOJcv433oMOSG3G31Xi
         qdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779895652; x=1780500452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4P3b21yApXuHT68EyOUNlmIwsJgC7TFNvxT82mSZVg=;
        b=rXd/yni8TqvfN/PtJoxl/t08Ir50VWJKlB5zYt8v+k3Ow4+om18sCTFO2g1/DxNoUA
         oZiEZ7RDkQ6dFPvA5eB9AHlDLeA/z4PAJphmM1GVKyg3+FkMSeRs5+JrckjZh86UeLYz
         MpqnmH1Z1ENhIsh+zQa3IOXqPDCYcAZ0p68W3Rk8kO3wHOsYGsehr/8sS4BUp+TprjI1
         02A/Nr0QcUhRnkXhhGBBCxiBln3LlCCoxjm0OHlnUyiGNBCvCaUIMOC5RZgUhQ3H8i1M
         aTsnBis6ZG7OaQTzIQVM3atae6JNSyBsIdHgd3cpWEVArh2X760EcIinl/KyOxl7BvDX
         nCig==
X-Forwarded-Encrypted: i=1; AFNElJ/D4IvwdTv9r4jw77u/C7KwL1Uxw3PEPs1wvn1dW2vEtiKApS6xOqH3q/4m+yfS9l+hwX1AgzdSBexrHRF9Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzusUW7GlXldimuRQo1bQ1ewl6+tDXYRNOsvPmiAfGTDr/8oI4V
	RmPoyAFgvHFCgRHe99vLXjm1ey8JJXV1YQ8ZGl6jELT7zZtpXqU8+2tS9zmqDqpsji0zoxKmysO
	SLMlEYBTQdhVAZTWBJTyQmMQ+xjHm2DU=
X-Gm-Gg: Acq92OGLFODZagkBrFvgFWYFq3MLAvAi5dGUNWN88ZfWnQqZWVYm4PXNhHt+2iuvDi9
	spYoKtAHFjgprm3rzplsq7//Ut+TBMavtIohQDCcqCLKD7rz4MnJutLlpJ61gEf4+KoXEjNOLMr
	GADNs36alVtJxyChPOCIGhJLjEUyOZVV442dF5UXEFbwfeemoLji4lrdT7rk39VcYmkxOdxsfSJ
	tW/jIzVIdTmXMxJGNQ+YOX3mto3L2SvtSzWtNYWnrLc9TE0OX9ptZRo/GQVTCM8Evi+CJsTxjy/
	5Uv2dDkVwJOQrNsQIp5YyxhzNVzM8WipR3yuGqrYFGPIUoO01oIPmGrNZlCSDjfQ7OC0PgBO3n+
	ZJ+jRj7cfVCQgnxUtQ9jg98I1AQ8i4S7zTA==
X-Received: by 2002:a05:7301:168e:b0:2f3:c1a6:361f with SMTP id
 5a478bee46e88-30448f3c004mr5114522eec.2.1779895651952; Wed, 27 May 2026
 08:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
 <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
 <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk> <CANiq72kj0i+qUSAc-ZAQU=KtMS89miZL3=ni+b6Vrkeravo9rg@mail.gmail.com>
 <1980a603-db39-4b82-8c0d-dab3e92dd8e0@sirena.org.uk>
In-Reply-To: <1980a603-db39-4b82-8c0d-dab3e92dd8e0@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 17:27:18 +0200
X-Gm-Features: AVHnY4KvjRGu7XZK-VQkuuEd59BricgsT6JoK2UOPa9P6pyz3w9H19-0yy56G9M
Message-ID: <CANiq72mbeCMzS2gReTMzb=KF4fSezp_FZWQ60HodiuwAeOkjKQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 5:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> No, I just started building it with LLVM=3D1 though.  We'll see if
> anything fun happens with the different set of diagnostics, it's
> currently clean so we're OK right now.

Sounds good, thanks!

(`LLVM=3D1` is what we (or at least I) test the most by far, but it is
true that Linux distributions out there use the GCC (and thus, for
now, mixed GCC+LLVM) builds...)

Cheers,
Miguel
