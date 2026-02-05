Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F8361DD7
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279593; cv=none; b=tyl0QBxbt7HwXQsBDDvWKZI6qNOk34OPH6aq7GyMhxYmCz0pCnP1JFoGXWQuuXt6CxajSRpQ2E/n/ZYcb/1NGYeVFqQeP1lIYYnNHGg+Tzv7fFMcBYYDVq0YZ0WZGaZQMN9LoRb5IWZT85TVfBhFWAISNuqrz0Masd9xJelZRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279593; c=relaxed/simple;
	bh=7Fst46cNuu1kQuRIBG7xiNUzZSPl1AXx0qqmTSYWW2o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MI2CUTkIVirEpqAf47u6yjfZ3Exb85lPeMI0g8NF/bUVZGJqdUFmo52NGXdxJ6p5/SHm+bCe6BDhH3fXy0PKV5mWjUoKDNw69iHIxNdIHyTW5aPbNpA9vdzOZZ57bVsJyT+7VRGtkWFhrS01JVXWFmLKzTA5vG29DXDCv0kCKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KEOXoMce; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KEOXoMce"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b88622fbe54so76705066b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 00:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770279591; x=1770884391; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxPcK36bK2rMabpnzCRfWnJSG7ZqPhcKrQTFDoZ0aKU=;
        b=KEOXoMceww6Lw8AB8CYloC1zX+IHmnVmWvw1lLlGpG6ONxYkyQGED1RhT5yg5F9IBs
         Pa0Gkn5cUrLHA7onC+d8QTer1JfK/HFEBwy8/nX7PqcRzuHE8AYtl0WTcESSJA8DDx0u
         Ue859r93bLqjDuwSmQ/DnAGvrEE6fof2h8QuxreL2fn37FBvMznZ+7Ne8OLrTjLOaPk2
         A1xXOVKI2LjOfTgL+yjGKcUPf3h4lIRlED5Fpwf18tp8sQSIK/ESb5wP0cGEo4mtmo9J
         QedFfbOcKHdJnYq8YV470OOu6tRIDzYjNPeSGtsw1CSxYeHNPB308zj1Z+JKjVrSeNP3
         ax6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770279591; x=1770884391;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxPcK36bK2rMabpnzCRfWnJSG7ZqPhcKrQTFDoZ0aKU=;
        b=iigPWB8Ip6k0ZFpWh/DQMM+83x7etDxmeayFRtVI/mcwTUcxzOc1zldU6SY08mnl3q
         N0n9jehYbag1CEblpOPk+QdryYLdfWuwMRSxw7Eph5n/C6Xc7tqOF89QCb0T2Vl64aqr
         S9ZNEuRkstLCFYAwT1Jx3pZGVYYu/8HxGPZIcYQW9d9k6yu5wXFJ0Ybqf9nfiFCqXZrP
         T3fUPFs8suT9sgaq7Zl2vEPhbwo8xUvUZp0IcATdnSDUcbUeVPGkHh9OySDfbUEHaTXl
         ApJ/TazotAlaox1RcDlgX9a23J5gtvW1xbEkmG1PnI1LXMuCAc5CmEIbUPeWwk+RetET
         bfyA==
X-Forwarded-Encrypted: i=1; AJvYcCUQo3rh/0V//a4X4JyDhTGM++JfnM1Q74oUXHCf+G3txB4vjTB5ibPjLh6LFj7H4VZnv8BH0G1m5Q+yhNl8/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsQNu5MT/sSMzhCG8bz9rYxGlHRcZU6kl8t9t867SJ7dkdwyq
	tczB+pQE6okoF0m9AmlMNCJ06oRDYOYL4iaxrDxH0YGbhRjD9BWaEzvixqf6L5BG12yKUK5TDdj
	re/k2cDFu0P+jvPgp5w==
X-Received: from ejgi1.prod.google.com ([2002:a17:906:3c41:b0:b8d:7187:d449])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:ef07:b0:b88:227e:3876 with SMTP id a640c23a62f3a-b8e9f0ef860mr409916266b.24.1770279590685;
 Thu, 05 Feb 2026 00:19:50 -0800 (PST)
Date: Thu, 5 Feb 2026 08:19:49 +0000
In-Reply-To: <20260205042132.40772-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205042132.40772-1-muchamadcoirulanwar@gmail.com>
Message-ID: <aYRSpYCIaRmsNvip@google.com>
Subject: Re: [PATCH] rust: print: add safety comments for %pA formatting
From: Alice Ryhl <aliceryhl@google.com>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org, 
	gregkh@linuxfoundation.org, fujita.tomonori@gmail.com, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 05, 2026 at 11:21:32AM +0700, Muchamad Coirul Anwar wrote:
> The safety comments in `rust_fmt_argument` and `call_printk` were
> previously marked as TODO.
> 
> This patch adds the missing safety documentation explaining why
> dereferencing the pointers and calling the C `_printk` function
> is safe in these contexts. It clarifies the contract between
> `lib/vsprintf.c` and the Rust implementation regarding the `%pA`
> format specifier.
> 
> Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
> ---
>  rust/kernel/print.rs | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 6fd84389a858..3e6ff8f42d95 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -29,7 +29,11 @@
>      use fmt::Write;
>      // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
>      let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
> -    // SAFETY: TODO.
> +    // SAFETY: The C implementation of `vsprintf` (in `lib/vsprintf.c`) specifically
> +    // calls this function ONLY when processing the `%pA` format specifier.
> +    // On the Rust side (`call_printk`), we guarantee that `%pA` is always paired
> +    // with a valid pointer to `fmt::Arguments`.
> +    // Therefore, dereferencing `ptr` here is safe.

There are multiple places that %pA is passed. For example, there is also
seq_file.rs and probably more.

Perhaps remove the reference to call_printk here?

// SAFETY: The C implementation of `vsprintf` (in `lib/vsprintf.c`) specifically
// calls this function ONLY when processing the `%pA` format specifier.
// On the Rust side, we always pair `%pA` with a valid pointer to
// `fmt::Arguments`.

>      let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
>      w.pos().cast()
>  }
> @@ -109,7 +113,9 @@ pub unsafe fn call_printk(
>  ) {
>      // `_printk` does not seem to fail in any path.
>      #[cfg(CONFIG_PRINTK)]
> -    // SAFETY: TODO.
> +    // SAFETY: The format string is constructed to use `%pA`, which corresponds to the
> +    // pointer to `fmt::Arguments` passed as the third argument.
> +    // Since `args` is a valid reference, casting it to a pointer is safe.
>      unsafe {
>          bindings::_printk(
>              format_string.as_ptr(),
> -- 
> 2.50.0
> 
