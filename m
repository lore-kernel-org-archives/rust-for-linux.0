Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AD92D7397
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 20:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767560020; cv=none; b=ss6/H06bdrEJ0CM3/0Pm5FycntOybEBMC7DJK1ec5MbHWzM5gCkSKFN29c1sBuIyHiTXBoViUmWwQqU4I9JhJyfSgcFZdmWwe+l3FiSO3iOY9ptP+IEpHnNg5QQqV6S15mZhFORj4G8OF8nrA21to0mSQlYTXGXGacObUSF1rww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767560020; c=relaxed/simple;
	bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHB1ufjH4CB+sAd5TwM9QhKpSwuKcajNCywVjRRFitNGXVcE00MfNFDF+Gk0pOFhu7HjBFEjmuqGiuD2E6bxXBtGnDZfKe5Oqeqok/l0o6fctgWD/HPEyXoT20euLY8tOsch6zioOtSqWWNj/cEfil58fNXWTKFtl+vz+KPi2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn5YfUlS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn5YfUlS"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc0d28903c9so321066a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 12:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767560018; x=1768164818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
        b=Gn5YfUlSE/MZYy058WhEIaVWq7NaQKUZD8l3Aux6Pl0aC6r9507k50CKLswafbHRpN
         tKzmyO0F9R6LHvkZMPSXPupYBsOmydl0bDSAzZqktg3da3wVzExGlc+TVtilZwPKHgpM
         V1dQvqFgOpaYwXFkbQ5yTX3RvKxOMwblQghyYFqT+krfjRa5GGYc05WrHvkssxgpoC0q
         u/0kTjfXGXdcOg5LiS5GlXrLldJa3sS9of6oy19Bkw1CkROhS+PKzzVtLzJx0qOTpc9Z
         GU+WDfyyN+Tkr7Ui+5LmyVH0DkMSii0bN8LFAt6ZsnYSlTZG/Dc4D+uP/0Ec2fmahWfV
         Lm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767560018; x=1768164818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
        b=FM6Qr7CLMC/nipquyM66hQdtl3AdrAuqPyB0n37VpE8SC3UjU/qeXfzJn3F5qIzte1
         uoKkgPi7uEtNjvuKIB59FglwjevgCtTJ6dBorN7+7DdexYGmsV2j4EKjoQbhfOzDM0/0
         pVgNZeR/5nGhcpfU9kMUS4kRUG9tFKvAg8+HaCIByMr/hYf+83vH5jol2KMXqWn7oZkU
         Cp9oEaEZUM4Hytsi8H4yXOpsA1s0GsrZg/mLAEN1R3T5irSLYRL9rRWFfHDd+BgcI6Zq
         7/T9BYJ47vMxywbhRpy0hgL4WnOG+p4adZl0ue300HCfj7HgNGM+fCglmGGZaznXZxX7
         z0jQ==
X-Gm-Message-State: AOJu0Yw03iLh2Pj4c3tvKYmc5qV9gelEC6aA71F2UI7zgYpUBkHjLVJS
	oiFHtQ5spQaPWPp5xo9MXdm3ONp6WaELtpT6keInDhsTboOV1FRUTmP7RjAr+Id8icgiDrN/YSt
	wsyKxGvN6ILm+lBMpmDQdr6TUbSjaxz8=
X-Gm-Gg: AY/fxX4mxsw9Cdc3jW56DP4QTZojPhgKcceB5YVsjlrh1ik5WA+NMO0KpT34cVg9x2l
	3KJraegMJbAVZMSjVO0fWyAbNiU7U+uAtDWlipXb0V94EwAyDj68hOxamqdqrVlZrNp5PgTFB5k
	Bj17GZdZpK62H/A12BKClCdwa3+Kte2EMhul12wV/SiwTgNlqwngGS9AFQd7/B0zWCDNhCz1qnS
	3xTy5ozseeMElk05u2wfleEY82uXR8TWADxkqH8TirWmyAuyqCAhgzJl0Uu9ovgtto1GLWKFWjf
	X6YjYBBYmTUQg1sCT5fdUfRR8HD9OuHlOy/N7BLwNI8eFoz3pRkKbd3MpjReB88aUUz8CHhWn44
	gf6qTXUXY9vQH
X-Google-Smtp-Source: AGHT+IEY5WU8qdT2x4W9RhyaoUAIxe/Revt/XcUhrg0fBmvqp9LK2uRUv+DpO1/rHFugYJh7v9P+cWIgLbf4IU/ffNQ=
X-Received: by 2002:a05:7300:e9ce:20b0:2ae:5b31:5dc with SMTP id
 5a478bee46e88-2b05ec6b143mr17044785eec.7.1767560018452; Sun, 04 Jan 2026
 12:53:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217150010.665153-1-siddhesh@gotplt.org> <20251217224050.1186896-1-siddhesh@gotplt.org>
In-Reply-To: <20251217224050.1186896-1-siddhesh@gotplt.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 21:53:25 +0100
X-Gm-Features: AQt7F2qb1EDeyLmlG9hUTUI1fBPD9sLv7nfHHvfBJvOJxdTKvQkzrqD3Rmnu53k
Message-ID: <CANiq72n0BtCxAsXOaNnSMWC-aW2bNTPzN=4VGb+ic8YA6jhsAw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Add -fdiagnostics-show-context to bindgen_skip_c_flags
To: Siddhesh Poyarekar <siddhesh@gotplt.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, stable@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 11:41=E2=80=AFPM Siddhesh Poyarekar <siddhesh@gotpl=
t.org> wrote:
>
> but clang does not have this option, so avoid passing it to bindgen.

This looks indeed correct, although it is not yet in a released GCC
(testing quickly in Compiler Explorer, GCC 15.2 doesn't have it, but
GCC trunk has).

I will apply it -- Cc'ing ClangBuiltLinux and Kbuild so that they are aware=
.

Thanks!

Cheers,
Miguel
