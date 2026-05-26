Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1C3FA5C6
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799492; cv=none; b=d43ZMry/DZwAVswlSfwy3vnFYtDK0lMTYVIgb1JP9L18WH07D1Nkq+4bI722Ly9JV3Ofg0oc73q4j+VN5lIAxLIzdZMkLaR1Yvp3zcBbFMUkyUfWEWkmWdR6qt6P+IT8fWvgF26dZArDbkLhkkmDrTyLJmGzBr1VZWr0Yndht+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799492; c=relaxed/simple;
	bh=TlpPEl12C8ark5vV9HkTvI61esDylq5ifyDzhUN43Zw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qTJyW1sO+ISW5uatuteXlI4M2dFlt/Znit9YF02GlmVYXtpKAy8RUZSAev4lxwJThFerZHJckB6cE2OJ6TwNZ92j21l3+U6G7ey9tdBpP/TwjugT+JANmu2E0ClLPEfQLBEC+B1VQk4+0Q4lR5hTgvGVR4mJgPmEiedFkuWL2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLjQelmb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLjQelmb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-49043386b3fso37908205e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779799489; x=1780404289; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2avDXDeEPoX2rtwl1vqycBylQf1bPyI+qtnNdQFhOOs=;
        b=oLjQelmb/jJUOxlixrZ4ups7jdUN0pmziLekju48HlA2zMEQLUasY3LPNubsDlHYbP
         5WmL+gKhQ9CS+mNk+HAkv+g0f/k/dQrsr3OVQS0h4e+BpUfO0XZugVBWddwkv8HEAbk+
         YW2Wn1G00nmeBRGHoLUVJuMlI0gjA+G56GFoXyKENMDNqbUXbjmCzfxN4ToQmQLtPkj+
         Hoi1B2CqHzPx4McYziAPlo6Zga0tJ+14MwgUU/u5joG4d0IeTAS8xwMdAYnu0/n296QT
         vaDCKJPB9bHbXXce+tBVmAME1LszL+I9fc5BXGyZQLBF9Or4GbsMpSfLmSlEIt9sHI8d
         Bi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799489; x=1780404289;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2avDXDeEPoX2rtwl1vqycBylQf1bPyI+qtnNdQFhOOs=;
        b=bVyYlyFgNvuKAb0bOeLgDqYysiQKZFzeArLlNXzMDqzjA73FcgCI1P1afkpcFrjeGd
         vHhNDcnx09gGm9SgX1TYr0AQg9WZRf5puOIX31wAwNazRBBZIzKhxGdstK60SXT6Bokk
         PmnKBGVLtR6ss23PutTSr85vem9uyD+DNmY/wcu7mzurckgblZsh0mJtp0HLuBwqMphD
         NTEGfkJsncA3FfAfwfOsQ2k0umCDMtwb2cROcqBN6ThJ2grPig2VaEVihaY01kOutIuC
         oE7ZKOpLWbkNaNL7BDY180FvXiz8cpLaEemPRsCVxLlhozk8jC4vxL2njfg1n3cWBIpI
         Nb9A==
X-Forwarded-Encrypted: i=1; AFNElJ8f+Za1MKJdEGMoeopOz4ocqe5dJSgoCcmx1pR0qF+hVx+pU+zbSl9H6VFeVuCV1yuNaZWjM5+z/7aE1mTvrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf8tnrJy5O9Jt6AczewI46CqsueF0kgc5g/GMwvGSER7v9xk8j
	IVOnzaUqBrPtOkbRXaNQzaqSds7O6nDRy3Hp5kktre4Ff1WI0ifnYUEd//Q6gVq+ZvAIuuGwBxt
	w8FsOPMJG+cGQzbokkQ==
X-Received: from wmaz14.prod.google.com ([2002:a05:600c:6d8e:b0:48f:e397:ec90])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c4a1:b0:490:3fd9:e78b with SMTP id 5b1f17b1804b1-490426cef8bmr316375515e9.17.1779799488679;
 Tue, 26 May 2026 05:44:48 -0700 (PDT)
Date: Tue, 26 May 2026 12:44:47 +0000
In-Reply-To: <20260522-binder-strict-provenance-v1-6-3d6e9406e864@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org> <20260522-binder-strict-provenance-v1-6-3d6e9406e864@kernel.org>
Message-ID: <ahWVv1WeoPZydnWA@google.com>
Subject: Re: [PATCH 6/6] rust: binder: enable `clippy::cast_lossless`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 22, 2026 at 07:12:51PM +0200, Tamir Duberstein wrote:
> Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:
> 
> > Rust's `as` keyword will perform many kinds of conversions, including
> > silently lossy conversions. Conversion functions such as `i32::from`
> > will only perform lossless conversions. Using the conversion functions
> > prevents conversions from becoming silently lossy if the input types
> > ever change, and makes it clear for people reading the code that the
> > conversion is lossless.
> 
> While this does not eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize. It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the
> changes and enable the lint in the Binder Rust driver -- no functional
> change intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless [1]
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
